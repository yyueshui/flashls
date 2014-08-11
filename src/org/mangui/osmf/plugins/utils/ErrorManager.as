package org.mangui.osmf.plugins.utils {
    import org.mangui.hls.HLSError;
    import org.mangui.hls.HLSEvent;
    import org.osmf.events.MediaErrorCodes;

    public class ErrorManager {

        public static function getMediaErrorCode(event : HLSEvent) : int {
            var errorCode : int = MediaErrorCodes.NETSTREAM_PLAY_FAILED;
            if (event && event.error) {
                switch (event.error.code) {
                    case HLSError.FRAGMENT_LOADING_ERROR:
                    case HLSError.FRAGMENT_LOADING_CROSSDOMAIN_ERROR:
                    case HLSError.KEY_LOADING_ERROR:
                    case HLSError.KEY_LOADING_CROSSDOMAIN_ERROR:
                    case HLSError.MANIFEST_LOADING_CROSSDOMAIN_ERROR:
                    case HLSError.MANIFEST_LOADING_IO_ERROR:
                        errorCode = MediaErrorCodes.IO_ERROR;
                        break;
                    case org.mangui.hls.HLSError.FRAGMENT_PARSING_ERROR:
                    case org.mangui.hls.HLSError.KEY_PARSING_ERROR:
                    case org.mangui.hls.HLSError.MANIFEST_PARSING_ERROR:
                        errorCode = MediaErrorCodes.NETSTREAM_FILE_STRUCTURE_INVALID;
                        break;
                    case org.mangui.hls.HLSError.TAG_APPENDING_ERROR:
                        errorCode = MediaErrorCodes.ARGUMENT_ERROR;
                        break;
                }
            }
            return errorCode;
        };

        public static function getMediaErrorMessage(event : HLSEvent) : String {
            return (event && event.error) ? event.error.msg : "Unknown error";
        };
    };
}