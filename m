From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Oct 2015 10:06:30 +0200
Subject: [Buildroot] [PATCH 2/2] qt5multimedia: drop broken gstreamer 0.10
	support
In-Reply-To: <1445414790-16583-1-git-send-email-peter@korsgaard.com>
References: <1445414790-16583-1-git-send-email-peter@korsgaard.com>
Message-ID: <1445414790-16583-2-git-send-email-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The gstreamer 0.10 support code seems to have bitrotten as the build fails
with undefined references to various functions:

.obj/qgstreameraudiodecodersession.o: In function `QGstreamerAudioDecoderSession::read()':
qgstreameraudiodecodersession.cpp:(.text+0x13a0): undefined reference to `QGstUtils::audioFormatForBuffer(_GstBuffer*)'
collect2: error: ld returned 1 exit status
Makefile:111: recipe for target '../../../../plugins/mediaservice/libgstaudiodecoder.so' failed
make[6]: *** [../../../../plugins/mediaservice/libgstaudiodecoder.so] Error 1
Makefile:45: recipe for target 'sub-audiodecoder-make_first' failed
make[5]: *** [sub-audiodecoder-make_first] Error 2
make[5]: *** Waiting for unfinished jobs....
.obj/qgstreamercapturesession.o: In function `QGstreamerCaptureSession::probeBuffer(_GstBuffer*) [clone .part.30]':
qgstreamercapturesession.cpp:(.text+0x3fc8): undefined reference to `QGstUtils::bufferToImage(_GstBuffer*)'
collect2: error: ld returned 1 exit status
Makefile:153: recipe for target '../../../../plugins/mediaservice/libgstmediacapture.so' failed
make[6]: *** [../../../../plugins/mediaservice/libgstmediacapture.so] Error 1
Makefile:95: recipe for target 'sub-mediacapture-make_first' failed
make[5]: *** [sub-mediacapture-make_first] Error 2
.obj/qgstreamerplayersession.o: In function `QGstreamerPlayerSession::QGstreamerPlayerSession(QObject*)':
qgstreamerplayersession.cpp:(.text+0xecc): undefined reference to `gst_video_connector_get_type'
.obj/qgstreamerplayersession.o: In function `QGstreamerPlayerSession::processBusMessage(QGstreamerMessage const&)':
qgstreamerplayersession.cpp:(.text+0x5b4c): undefined reference to `QGstUtils::gstTagListToMap(_GstStructure const*)'
collect2: error: ld returned 1 exit status
Makefile:129: recipe for target '../../../../plugins/mediaservice/libgstmediaplayer.so' failed
make[6]: *** [../../../../plugins/mediaservice/libgstmediaplayer.so] Error 1
Makefile:70: recipe for target 'sub-mediaplayer-make_first' failed
make[5]: *** [sub-mediaplayer-make_first] Error 2

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5multimedia/qt5multimedia.mk | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
index 50fdd57..df1395c 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.mk
+++ b/package/qt5/qt5multimedia/qt5multimedia.mk
@@ -18,9 +18,6 @@ QT5MULTIMEDIA_LICENSE = Commercial license
 QT5MULTIMEDIA_REDISTRIBUTE = NO
 endif
 
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE),y)
-QT5MULTIMEDIA_DEPENDENCIES += gst-plugins-base
-endif
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE),y)
 QT5MULTIMEDIA_DEPENDENCIES += gst1-plugins-base
 endif
@@ -43,7 +40,7 @@ define QT5MULTIMEDIA_INSTALL_STAGING_CMDS
 endef
 
 ifeq ($(BR2_STATIC_LIBS),)
-ifneq ($(BR2_PACKAGE_GST_PLUGINS_BASE)$(BR2_PACKAGE_GST1_PLUGINS_BASE),)
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE),y)
 define QT5MULTIMEDIA_INSTALL_TARGET_QGSTTOOLS_LIB
 	cp -dpf $(STAGING_DIR)/usr/lib/libqgsttools*.so.* $(TARGET_DIR)/usr/lib
 endef
-- 
2.1.4
