From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 21 Jun 2013 16:07:04 +0200
Subject: [Buildroot] [git commit] gst-omx: add gst-omx package
Message-ID: <20130621143541.D1BB99AF72@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a82f18ad8e7e167ecaffe9493a0bd823eabd1782
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gst-omx enables OpenMAX based accelerated video decode.

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/Config.in                       |    1 +
 package/multimedia/gst-omx/Config.in               |   11 ++
 .../multimedia/gst-omx/gst-omx-config-files.patch  |  127 ++++++++++++++++++++
 package/multimedia/gst-omx/gst-omx.mk              |   37 ++++++
 4 files changed, 176 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index c87abea..e0d5f6a 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -11,6 +11,7 @@ source "package/multimedia/gst-ffmpeg/Config.in"
 source "package/multimedia/gst-dsp/Config.in"
 source "package/multimedia/gst-fsl-plugins/Config.in"
 source "package/multimedia/gst-omapfb/Config.in"
+source "package/multimedia/gst-omx/Config.in"
 source "package/multimedia/gst-plugins-base/Config.in"
 source "package/multimedia/gst1-plugins-base/Config.in"
 source "package/multimedia/gst-plugins-good/Config.in"
diff --git a/package/multimedia/gst-omx/Config.in b/package/multimedia/gst-omx/Config.in
new file mode 100644
index 0000000..b6ea116
--- /dev/null
+++ b/package/multimedia/gst-omx/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_GST_OMX
+	bool "gst-omx"
+	depends on BR2_PACKAGE_GSTREAMER1 && BR2_PACKAGE_HAS_OPENMAX
+	select BR2_PACKAGE_GST1_PLUGINS_BASE
+	help
+	  GStreamer plug-in to use OpenMAX API.
+
+	  http://cgit.freedesktop.org/gstreamer/gst-omx
+
+comment "gst-omx requires a OpenMAX implementation"
+	depends on BR2_PACKAGE_GSTREAMER1 && !BR2_PACKAGE_HAS_OPENMAX
diff --git a/package/multimedia/gst-omx/gst-omx-config-files.patch b/package/multimedia/gst-omx/gst-omx-config-files.patch
new file mode 100644
index 0000000..f484521
--- /dev/null
+++ b/package/multimedia/gst-omx/gst-omx-config-files.patch
@@ -0,0 +1,127 @@
+Change config files to match default buildroot install
+
+Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
+---
+Index: gst-omx-1.0.0/config/bellagio/gstomx.conf
+===================================================================
+--- gst-omx-1.0.0.orig/config/bellagio/gstomx.conf	2013-03-12 04:12:09.000000000 -0500
++++ gst-omx-1.0.0/config/bellagio/gstomx.conf	2013-05-21 17:50:14.545692908 -0500
+@@ -1,6 +1,6 @@
+ [omxmpeg4videodec]
+ type-name=GstOMXMPEG4VideoDec
+-core-name=/usr/local/lib/libomxil-bellagio.so.0
++core-name=/usr/lib/libomxil-bellagio.so.0
+ component-name=OMX.st.video_decoder.mpeg4
+ rank=256
+ in-port-index=0
+@@ -9,7 +9,7 @@
+ 
+ [omxh264dec]
+ type-name=GstOMXH264Dec
+-core-name=/usr/local/lib/libomxil-bellagio.so.0
++core-name=/usr/lib/libomxil-bellagio.so.0
+ component-name=OMX.st.video_decoder.avc
+ rank=256
+ in-port-index=0
+@@ -18,7 +18,7 @@
+ 
+ [omxmpeg4videoenc]
+ type-name=GstOMXMPEG4VideoEnc
+-core-name=/usr/local/lib/libomxil-bellagio.so.0
++core-name=/usr/lib/libomxil-bellagio.so.0
+ component-name=OMX.st.video_encoder.mpeg4
+ rank=0
+ in-port-index=0
+@@ -27,7 +27,7 @@
+ 
+ [omxaacenc]
+ type-name=GstOMXAACEnc
+-core-name=/usr/local/lib/libomxil-bellagio.so.0
++core-name=/usr/lib/libomxil-bellagio.so.0
+ component-name=OMX.st.audio_encoder.aac
+ rank=0
+ in-port-index=0
+Index: gst-omx-1.0.0/config/rpi/gstomx.conf
+===================================================================
+--- gst-omx-1.0.0.orig/config/rpi/gstomx.conf	2013-05-21 17:51:39.965693635 -0500
++++ gst-omx-1.0.0/config/rpi/gstomx.conf	2013-05-21 17:52:07.781693871 -0500
+@@ -1,6 +1,6 @@
+ [omxmpeg2videodec]
+ type-name=GstOMXMPEG2VideoDec
+-core-name=/opt/vc/lib/libopenmaxil.so
++core-name=/usr/lib/libopenmaxil.so
+ component-name=OMX.broadcom.video_decode
+ rank=256
+ in-port-index=130
+@@ -9,7 +9,7 @@
+ 
+ [omxmpeg4videodec]
+ type-name=GstOMXMPEG4VideoDec
+-core-name=/opt/vc/lib/libopenmaxil.so
++core-name=/usr/lib/libopenmaxil.so
+ component-name=OMX.broadcom.video_decode
+ rank=256
+ in-port-index=130
+@@ -18,7 +18,7 @@
+ 
+ [omxh263dec]
+ type-name=GstOMXH263Dec
+-core-name=/opt/vc/lib/libopenmaxil.so
++core-name=/usr/lib/libopenmaxil.so
+ component-name=OMX.broadcom.video_decode
+ rank=256
+ in-port-index=130
+@@ -27,7 +27,7 @@
+ 
+ [omxh264dec]
+ type-name=GstOMXH264Dec
+-core-name=/opt/vc/lib/libopenmaxil.so
++core-name=/usr/lib/libopenmaxil.so
+ component-name=OMX.broadcom.video_decode
+ rank=256
+ in-port-index=130
+@@ -36,7 +36,7 @@
+ 
+ [omxtheoradec]
+ type-name=GstOMXTheoraDec
+-core-name=/opt/vc/lib/libopenmaxil.so
++core-name=/usr/lib/libopenmaxil.so
+ component-name=OMX.broadcom.video_decode
+ rank=256
+ in-port-index=130
+@@ -45,7 +45,7 @@
+ 
+ [omxvp8dec]
+ type-name=GstOMXVP8Dec
+-core-name=/opt/vc/lib/libopenmaxil.so
++core-name=/usr/lib/libopenmaxil.so
+ component-name=OMX.broadcom.video_decode
+ rank=256
+ in-port-index=130
+@@ -54,7 +54,7 @@
+ 
+ [omxmjpegdec]
+ type-name=GstOMXMJPEGDec
+-core-name=/opt/vc/lib/libopenmaxil.so
++core-name=/usr/lib/libopenmaxil.so
+ component-name=OMX.broadcom.video_decode
+ rank=256
+ in-port-index=130
+@@ -63,7 +63,7 @@
+ 
+ [omxvc1dec]
+ type-name=GstOMXWMVDec
+-core-name=/opt/vc/lib/libopenmaxil.so
++core-name=/usr/lib/libopenmaxil.so
+ component-name=OMX.broadcom.video_encode
+ rank=256
+ in-port-index=130
+@@ -73,7 +73,7 @@
+ 
+ [omxh264enc]
+ type-name=GstOMXH264Enc
+-core-name=/opt/vc/lib/libopenmaxil.so
++core-name=/usr/lib/libopenmaxil.so
+ component-name=OMX.broadcom.video_encode
+ rank=256
+ in-port-index=200
diff --git a/package/multimedia/gst-omx/gst-omx.mk b/package/multimedia/gst-omx/gst-omx.mk
new file mode 100644
index 0000000..00abecb
--- /dev/null
+++ b/package/multimedia/gst-omx/gst-omx.mk
@@ -0,0 +1,37 @@
+#############################################################
+#
+# gst-omx
+#
+#############################################################
+
+GST_OMX_VERSION = 1.0.0
+GST_OMX_SOURCE = gst-omx-$(GST_OMX_VERSION).tar.xz
+GST_OMX_SITE = http://gstreamer.freedesktop.org/src/gst-omx/
+
+GST_OMX_LICENSE = LGPLv2.1
+GST_OMX_LICENSE_FILE = COPYING
+
+ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
+GST_OMX_CONF_OPT = \
+	--with-omx-target=rpi
+GST_OMX_CONF_ENV = \
+	CFLAGS="$(TARGET_CFLAGS) \
+		-I$(STAGING_DIR)/usr/include/IL \
+		-I$(STAGING_DIR)/usr/include/interface/vcos/pthreads \
+		-I$(STAGING_DIR)/usr/include/interface/vmcs_host/linux"
+endif
+
+ifeq ($(BR2_PACKAGE_BELLAGIO),y)
+GST_OMX_CONF_OPT = \
+	--with-omx-target=bellagio
+GST_OMX_CONF_ENV = \
+	CFLAGS="$(TARGET_CFLAGS) \
+		-DOMX_VERSION_MAJOR=1 \
+		-DOMX_VERSION_MINOR=1 \
+		-DOMX_VERSION_REVISION=2 \
+		-DOMX_VERSION_STEP=0"
+endif
+
+GST_OMX_DEPENDENCIES = gstreamer1 gst1-plugins-base libopenmax
+
+$(eval $(autotools-package))
