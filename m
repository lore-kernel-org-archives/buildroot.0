From: David du Colombier <0intro@gmail.com>
Date: Wed,  1 Oct 2014 11:14:00 +0200
Subject: [Buildroot] [PATCH 4/5] x264: new package
Message-ID: <1412154841-708-1-git-send-email-0intro@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package is based on an earlier package
proposed by Ayaka in December 2013.

Signed-off-by: David du Colombier <0intro@gmail.com>
---
 package/Config.in      |  1 +
 package/x264/Config.in |  9 +++++++++
 package/x264/x264.mk   | 42 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 52 insertions(+)
 create mode 100644 package/x264/Config.in
 create mode 100644 package/x264/x264.mk

diff --git a/package/Config.in b/package/Config.in
index 2ad72bc..33616e1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -33,6 +33,7 @@ menu "Audio and video applications"
 	source "package/vlc/Config.in"
 	source "package/vorbis-tools/Config.in"
 	source "package/wavpack/Config.in"
+	source "package/x264/Config.in"
 	source "package/xbmc/Config.in"
 	source "package/yavta/Config.in"
 endmenu
diff --git a/package/x264/Config.in b/package/x264/Config.in
new file mode 100644
index 0000000..6ad2495
--- /dev/null
+++ b/package/x264/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_X264
+	bool "x264"
+	help
+	  x264 is a free software library and application for
+	  encoding video streams into the H.264/MPEG-4 AVC
+	  compression format, and is released under the terms
+	  of the GNU GPL.
+
+	  https://www.videolan.org/developers/x264.html
diff --git a/package/x264/x264.mk b/package/x264/x264.mk
new file mode 100644
index 0000000..dff2313
--- /dev/null
+++ b/package/x264/x264.mk
@@ -0,0 +1,42 @@
+###############################################################
+#
+# x264
+#
+###############################################################
+
+X264_VERSION = 20140930-2245-stable
+X264_SOURCE = x264-snapshot-$(X264_VERSION).tar.bz2
+X264_SITE= ftp://ftp.videolan.org/pub/videolan/x264/snapshots
+X264_LICENSE = GPL
+X264_LICENSE_FILES = COPYING
+X264_INSTALL_STAGING = YES
+X264_INSTALL_TARGET = YES
+X264_DEPENDENCIES = host-pkgconf
+
+define X264_CONFIGURE_CMDS
+	(cd $(@D);./configure \
+		--prefix=/usr \
+		--host="$(GNU_TARGET_NAME)" \
+		--cross-prefix="$(TARGET_CROSS)" \
+		--enable-static \
+		--enable-strip \
+		--enable-pic \
+		--enable-shared \
+		--disable-ffms \
+		--disable-cli \
+	)
+endef
+
+define X264_BUILD_CMDS
+	$(MAKE) CC="$(TARGET_CC)" -C $(@D)
+endef
+
+define X264_INSTALL_STAGING_CMDS
+	$(MAKE) DESTDIR="$(STAGING_DIR)" -C $(@D) install
+endef
+
+define X264_INSTALL_TARGET_CMDS
+	$(MAKE) DESTDIR="$(TARGET_DIR)" -C $(@D) install
+endef
+
+$(eval $(generic-package))
-- 
1.9.3
