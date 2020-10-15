From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Oct 2020 23:15:05 +0200
Subject: [Buildroot] [git commit] package/gst-omx: bump version to 1.18.0
 and convert to meson
Message-ID: <20201015212340.5A9348160D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7e6f4e56cd18c28b55bb73ece14078cc4ac3e376
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- change home page url to https

- drop bellagio support (as the project is no longer maintained
  no update since 2011, see [1])

[1] http://omxil.sourceforge.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gstreamer1/gst-omx/Config.in    |  2 +-
 package/gstreamer1/gst-omx/gst-omx.hash |  6 +++---
 package/gstreamer1/gst-omx/gst-omx.mk   | 27 ++++++++++-----------------
 3 files changed, 14 insertions(+), 21 deletions(-)

diff --git a/package/gstreamer1/gst-omx/Config.in b/package/gstreamer1/gst-omx/Config.in
index d2e477648b..efe3d211d6 100644
--- a/package/gstreamer1/gst-omx/Config.in
+++ b/package/gstreamer1/gst-omx/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_GST_OMX
 	help
 	  GStreamer plug-in to use OpenMAX API.
 
-	  http://cgit.freedesktop.org/gstreamer/gst-omx
+	  https://cgit.freedesktop.org/gstreamer/gst-omx
 
 comment "gst-omx requires a OpenMAX implementation"
 	depends on !BR2_PACKAGE_HAS_LIBOPENMAX
diff --git a/package/gstreamer1/gst-omx/gst-omx.hash b/package/gstreamer1/gst-omx/gst-omx.hash
index 85487f3491..9cd1b49a33 100644
--- a/package/gstreamer1/gst-omx/gst-omx.hash
+++ b/package/gstreamer1/gst-omx/gst-omx.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.16.2.tar.xz.sha256sum
-sha256 11ed411a2eba75610d72331eeb14ff05e2df28f4fd05cb69225a88bec6d27439 gst-omx-1.16.2.tar.xz
-sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551 COPYING
+# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.18.0.tar.xz.sha256sum
+sha256  302c65e04578991364f7605e04cfb54dfd75268d51080d35f221ee1a8b341fad  gst-omx-1.18.0.tar.xz
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gstreamer1/gst-omx/gst-omx.mk b/package/gstreamer1/gst-omx/gst-omx.mk
index 5ed9e3ce2c..cdd0e86b04 100644
--- a/package/gstreamer1/gst-omx/gst-omx.mk
+++ b/package/gstreamer1/gst-omx/gst-omx.mk
@@ -4,33 +4,26 @@
 #
 ################################################################################
 
-GST_OMX_VERSION = 1.16.2
+GST_OMX_VERSION = 1.18.0
 GST_OMX_SOURCE = gst-omx-$(GST_OMX_VERSION).tar.xz
 GST_OMX_SITE = https://gstreamer.freedesktop.org/src/gst-omx
 
 GST_OMX_LICENSE = LGPL-2.1
 GST_OMX_LICENSE_FILES = COPYING
 
+GST_OMX_CONF_OPTS = \
+	-Dexamples=disabled \
+	-Dtests=disabled \
+	-Dtools=disabled \
+	-Ddoc=disabled
+
 ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
 GST_OMX_VARIANT = rpi
-GST_OMX_CONF_ENV = \
-	CFLAGS="$(TARGET_CFLAGS) \
-		-I$(STAGING_DIR)/usr/include/IL \
-		-I$(STAGING_DIR)/usr/include/interface/vcos/pthreads \
-		-I$(STAGING_DIR)/usr/include/interface/vmcs_host/linux"
-else ifeq ($(BR2_PACKAGE_BELLAGIO),y)
-GST_OMX_VARIANT = bellagio
-GST_OMX_CONF_ENV = \
-	CFLAGS="$(TARGET_CFLAGS) \
-		-DOMX_VERSION_MAJOR=1 \
-		-DOMX_VERSION_MINOR=1 \
-		-DOMX_VERSION_REVISION=2 \
-		-DOMX_VERSION_STEP=0"
-else
+GST_OMX_CONF_OPTS += -Dheader_path=$(STAGING_DIR)/usr/include/IL
 GST_OMX_VARIANT = generic
 endif
 
-GST_OMX_CONF_OPTS += --with-omx-target=$(GST_OMX_VARIANT)
+GST_OMX_CONF_OPTS += -Dtarget=$(GST_OMX_VARIANT)
 
 GST_OMX_DEPENDENCIES = gstreamer1 gst1-plugins-base libopenmax
 
@@ -42,4 +35,4 @@ endef
 
 GST_OMX_POST_PATCH_HOOKS += GST_OMX_FIXUP_CONFIG_PATHS
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
