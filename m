From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 10 Dec 2011 22:13:04 +0100
Subject: [Buildroot] [git commit] New package: ImLib2
Message-ID: <20111210222040.A6A2F8F8F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5ddcdb4ceb4eba32d4e32b1e2201df2836bbabf2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: Config.in tweaks, fix build without X]
Signed-off-by: Frederic Bassaler <frederic.bassaler@gmail.com>
Signed-off-by: Matias Garcia <mgarcia@rossvideo.com>
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Tested-By: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in        |    1 +
 package/imlib2/Config.in |   38 +++++++++++++++++++++++++++++++
 package/imlib2/imlib2.mk |   56 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 95 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index e949649..50fbfc0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -279,6 +279,7 @@ source "package/fontconfig/Config.in"
 source "package/freetype/Config.in"
 source "package/gtk2-engines/Config.in"
 source "package/gtk2-themes/Config.in"
+source "package/imlib2/Config.in"
 source "package/jpeg/Config.in"
 source "package/libart/Config.in"
 source "package/libdrm/Config.in"
diff --git a/package/imlib2/Config.in b/package/imlib2/Config.in
new file mode 100644
index 0000000..16a94d6
--- /dev/null
+++ b/package/imlib2/Config.in
@@ -0,0 +1,38 @@
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
+	bool "JPEG support"
+	select BR2_PACKAGE_JPEG
+
+config BR2_PACKAGE_IMLIB2_PNG
+	bool "PNG support"
+	select BR2_PACKAGE_LIBPNG
+
+config BR2_PACKAGE_IMLIB2_GIF
+	bool "GIF support"
+	select BR2_PACKAGE_LIBUNGIF
+
+config BR2_PACKAGE_IMLIB2_TIFF
+	bool "TIFF support"
+	select BR2_PACKAGE_TIFF
+
+config BR2_PACKAGE_IMLIB2_ID3
+	bool "ID3 support"
+	select BR2_PACKAGE_LIBID3TAG
+
+config BR2_PACKAGE_IMLIB2_X
+	bool "X support"
+	default y
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XLIB_LIBX11
+endif
diff --git a/package/imlib2/imlib2.mk b/package/imlib2/imlib2.mk
new file mode 100644
index 0000000..5f10503
--- /dev/null
+++ b/package/imlib2/imlib2.mk
@@ -0,0 +1,56 @@
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
+else
+	IMLIB2_CONF_OPT += --without-x
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
