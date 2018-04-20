From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 20 Apr 2018 10:56:19 +0200
Subject: [Buildroot] [git commit] package/tk: new package
Message-ID: <20180420085712.EE34C888FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=23e34950db8c4deb288211f66d9b78042286760f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use the same version as tcl package.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS           |  1 +
 package/Config.in    |  1 +
 package/tk/Config.in | 18 ++++++++++++++++++
 package/tk/tk.hash   |  3 +++
 package/tk/tk.mk     | 31 +++++++++++++++++++++++++++++++
 5 files changed, 54 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3bb5f32f1a..63361b6fb6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1617,6 +1617,7 @@ F:	package/stress-ng/
 F:	package/supertux/
 F:	package/supertuxkart/
 F:	package/terminology/
+F:	package/tk/
 F:	package/upower/
 F:	package/xenomai/
 
diff --git a/package/Config.in b/package/Config.in
index ddbbcff9d8..ecd9b8f082 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -302,6 +302,7 @@ comment "Graphic libraries"
 	source "package/sdl2_mixer/Config.in"
 	source "package/sdl2_net/Config.in"
 	source "package/sdl2_ttf/Config.in"
+	source "package/tk/Config.in"
 
 comment "Other GUIs"
 	source "package/qt/Config.in"
diff --git a/package/tk/Config.in b/package/tk/Config.in
new file mode 100644
index 0000000000..507b0bf979
--- /dev/null
+++ b/package/tk/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_TK
+	bool "tk"
+	depends on BR2_USE_MMU # tcl
+	depends on BR2_TOOLCHAIN_HAS_THREADS # tcl
+	depends on !BR2_STATIC_LIBS # tcl
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_TCL
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXFT
+	help
+	  A windowing toolkit for use with tcl
+
+	  http://www.tcl.tk
+
+comment "tk needs a toolchain w/ threads, dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_XORG7
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/tk/tk.hash b/package/tk/tk.hash
new file mode 100644
index 0000000000..5fc0b6fc66
--- /dev/null
+++ b/package/tk/tk.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 d62c371a71b4744ed830e3c21d27968c31dba74dd2c45f36b9b071e6d88eb19d  tk8.6.6-src.tar.gz
+sha256 2cde822b93ca16ae535c954b7dfe658b4ad10df2a193628d1b358f1765e8b198  license.terms
diff --git a/package/tk/tk.mk b/package/tk/tk.mk
new file mode 100644
index 0000000000..102d368518
--- /dev/null
+++ b/package/tk/tk.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# tk
+#
+################################################################################
+
+TK_VERSION_MAJOR = 8.6
+TK_VERSION = $(TK_VERSION_MAJOR).6
+TK_SOURCE = tk$(TK_VERSION)-src.tar.gz
+TK_SITE = http://downloads.sourceforge.net/project/tcl/Tcl/$(TK_VERSION)
+TK_LICENSE = TCL
+TK_LICENSE_FILES = license.terms
+TK_SUBDIR = unix
+TK_INSTALL_STAGING = YES
+
+TK_DEPENDENCIES = tcl xlib_libX11 xlib_libXft
+
+# hopefully our strtod is not buggy
+TK_CONF_ENV = tcl_cv_strtod_buggy=no
+
+TK_CONF_OPTS = --disable-rpath \
+	--with-tcl=$(BUILD_DIR)/tcl-$(TCL_VERSION)/unix \
+	--x-includes=$(STAGING_DIR)/usr/include \
+	--x-libraries=$(STAGING_DIR)/usr/lib
+
+define TK_WISH_SYMLINK
+	ln -sf /usr/bin/wish$(TK_VERSION_MAJOR) $(TARGET_DIR)/usr/bin/wish
+endef
+TK_POST_INSTALL_TARGET_HOOKS += TK_WISH_SYMLINK
+
+$(eval $(autotools-package))
