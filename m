From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 17 Oct 2011 10:41:05 +0200
Subject: [Buildroot] [PATCH v6 1/3] New package: ImLib2
In-Reply-To: <1318840867-20976-1-git-send-email-yegorslists@googlemail.com>
References: <1318840867-20976-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1318840867-20976-2-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Frederic Bassaler <frederic.bassaler@gmail.com>
Signed-off-by: Matias Garcia <mgarcia@rossvideo.com>
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in        |    1 +
 package/imlib2/Config.in |   37 +++++++++++++++++++++++++++++++
 package/imlib2/imlib2.mk |   54 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 92 insertions(+), 0 deletions(-)
 create mode 100644 package/imlib2/Config.in
 create mode 100644 package/imlib2/imlib2.mk

diff --git a/package/Config.in b/package/Config.in
index 7dc8887..7a7b4bf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -282,6 +282,7 @@ source "package/fontconfig/Config.in"
 source "package/freetype/Config.in"
 source "package/gtk2-engines/Config.in"
 source "package/gtk2-themes/Config.in"
+source "package/imlib2/Config.in"
 source "package/jpeg/Config.in"
 source "package/libart/Config.in"
 source "package/libdrm/Config.in"
diff --git a/package/imlib2/Config.in b/package/imlib2/Config.in
new file mode 100644
index 0000000..3d37010
--- /dev/null
+++ b/package/imlib2/Config.in
@@ -0,0 +1,37 @@
+config BR2_PACKAGE_IMLIB2
+	bool "imlib2"
+	select BR2_PACKAGE_FREETYPE
+	help
+	  Imlib 2 is the successor to Imlib. This library provides
+	  routines to load, save and render images in various formats.
+
+	  http://freshmeat.net/projects/imlib2/
+
+if BR2_PACKAGE_IMLIB2
+
+config BR2_PACKAGE_IMLIB2_JPEG
+	select BR2_PACKAGE_JPEG
+	bool "JPEG support"
+
+config BR2_PACKAGE_IMLIB2_PNG
+	select BR2_PACKAGE_LIBPNG
+	bool "PNG support"
+
+config BR2_PACKAGE_IMLIB2_GIF
+	select BR2_PACKAGE_LIBUNGIF
+	bool "GIF support"
+
+config BR2_PACKAGE_IMLIB2_TIFF
+	select BR2_PACKAGE_TIFF
+	bool "TIFF support"
+
+config BR2_PACKAGE_IMLIB2_ID3
+	select BR2_PACKAGE_LIBID3TAG
+	bool "ID3 support"
+
+config BR2_PACKAGE_IMLIB2_X
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XLIB_LIBX11
+	bool "X support"
+endif
diff --git a/package/imlib2/imlib2.mk b/package/imlib2/imlib2.mk
new file mode 100644
index 0000000..6f13c6b
--- /dev/null
+++ b/package/imlib2/imlib2.mk
@@ -0,0 +1,54 @@
+#############################################################
+#
+## IMLIB2
+#
+##############################################################
+IMLIB2_VERSION = 1.4.5
+IMLIB2_SOURCE = imlib2-$(IMLIB2_VERSION).tar.bz2
+IMLIB2_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/project/enlightenment/imlib2-src/$(IMLIB2_VERSION)/
+IMLIB2_INSTALL_STAGING = YES
+IMLIB2_DEPENDENCIES = host-pkg-config freetype
+IMLIB2_CONF_OPT = --with-freetype-config=$(STAGING_DIR)/usr/bin/freetype-config
+
+ifeq ($(BR2_PACKAGE_IMLIB2_X),y)
+	IMLIB2_CONF_OPT += --with-x
+	IMLIB2_DEPENDENCIES += xlib_libX11 xlib_libXext
+endif
+
+ifeq ($(BR2_PACKAGE_IMLIB2_JPEG),y)
+	IMLIB2_CONF_OPT += --with-jpeg
+	IMLIB2_DEPENDENCIES += jpeg
+else
+	IMLIB2_CONF_OPT += --without-jpeg
+endif
+
+ifeq ($(BR2_PACKAGE_IMLIB2_PNG),y)
+	IMLIB2_CONF_OPT += --with-png
+	IMLIB2_DEPENDENCIES += libpng
+else
+	IMLIB2_CONF_OPT += --without-png
+endif
+
+ifeq ($(BR2_PACKAGE_IMLIB2_GIF),y)
+	IMLIB2_CONF_OPT += --with-gif
+	IMLIB2_DEPENDENCIES += libungif
+else
+	IMLIB2_CONF_OPT += --without-gif
+endif
+
+ifeq ($(BR2_PACKAGE_IMLIB2_TIFF),y)
+	IMLIB2_CONF_OPT += --with-tiff
+	IMLIB2_DEPENDENCIES += tiff
+else
+	IMLIB2_CONF_OPT += --without-tiff
+endif
+
+ifeq ($(BR2_PACKAGE_IMLIB2_ID3),y)
+	IMLIB2_CONF_OPT += --with-id3
+	IMLIB2_DEPENDENCIES += libid3tag
+else
+	IMLIB2_CONF_OPT += --without-id3
+endif
+
+$(eval $(call AUTOTARGETS))
+
-- 
1.7.1.1
