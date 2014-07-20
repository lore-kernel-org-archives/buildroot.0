From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Jul 2014 11:26:09 +0200
Subject: [Buildroot] [git commit] libglew: new package
Message-ID: <20140720092629.D34EF99EB5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ef7c5f16714784e6b5e1437f2e5c9d9e62b0e641
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package is needed for OpenGL support in xbmc:
https://github.com/xbmc/xbmc/blob/Gotham/configure.in#L1069

[Thomas: add BSD-3c to the list of licenses.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in          |    1 +
 package/libglew/Config.in  |   19 +++++++++++++++++++
 package/libglew/libglew.mk |   36 ++++++++++++++++++++++++++++++++++++
 3 files changed, 56 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index c1de39c..703fd3d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -618,6 +618,7 @@ menu "Graphics"
 	source "package/libgail/Config.in"
 	source "package/libgeotiff/Config.in"
 	source "package/libglade/Config.in"
+	source "package/libglew/Config.in"
 	source "package/libglu/Config.in"
 	source "package/libgtk2/Config.in"
 	source "package/libpng/Config.in"
diff --git a/package/libglew/Config.in b/package/libglew/Config.in
new file mode 100644
index 0000000..67c49d4
--- /dev/null
+++ b/package/libglew/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_LIBGLEW
+	bool "libglew"
+	depends on BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_HAS_LIBGL
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XLIB_LIBXI
+	select BR2_PACKAGE_XLIB_LIBXMU
+	help
+	  The OpenGL Extension Wrangler Library (GLEW) is a cross-platform C/C++
+	  extension loading library. GLEW provides efficient run-time mechanisms
+	  for determining which OpenGL extensions are supported on the target
+	  platform. OpenGL core and extension functionality is exposed in a
+	  single header file.
+
+	  http://glew.sourceforge.net
+
+comment "libglew depends on X.org and needs an OpenGL backend"
+	depends on !BR2_PACKAGE_XORG7 || !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/libglew/libglew.mk b/package/libglew/libglew.mk
new file mode 100644
index 0000000..938ec67
--- /dev/null
+++ b/package/libglew/libglew.mk
@@ -0,0 +1,36 @@
+################################################################################
+#
+# libglew
+#
+################################################################################
+
+LIBGLEW_VERSION = 1.10.0
+LIBGLEW_SOURCE = glew-$(LIBGLEW_VERSION).tgz
+LIBGLEW_SITE = http://sourceforge.net/projects/glew/files/glew/$(LIBGLEW_VERSION)
+LIBGLEW_LICENSE = BSD-3c, MIT
+LIBGLEW_LICENSE_FILES = LICENSE.txt
+LIBGLEW_INSTALL_STAGING = YES
+LIBGLEW_DEPENDENCIES = libgl xlib_libX11 xlib_libXext xlib_libXi xlib_libXmu
+
+# using $TARGET_CONFIGURE_OPTS breaks compilation
+define LIBGLEW_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		GLEW_DEST="/usr" LIBDIR="/usr/lib" \
+		AR="$(TARGET_AR)" CC="$(TARGET_CC)" \
+		LD="$(TARGET_CC)" STRIP="$(TARGET_STRIP)" \
+		POPT="$(TARGET_CFLAGS)" LDFLAGS.EXTRA="$(TARGET_LDFLAGS)"
+endef
+
+define LIBGLEW_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		GLEW_DEST="$(STAGING_DIR)/usr" LIBDIR="$(STAGING_DIR)/usr/lib" \
+		$(TARGET_CONFIGURE_OPTS) install
+endef
+
+define LIBGLEW_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		GLEW_DEST="$(TARGET_DIR)/usr" LIBDIR="$(TARGET_DIR)/usr/lib" \
+		$(TARGET_CONFIGURE_OPTS) install
+endef
+
+$(eval $(generic-package))
