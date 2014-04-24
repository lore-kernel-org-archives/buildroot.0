From: julien.boibessot at free.fr <julien.boibessot@free.fr>
Date: Thu, 24 Apr 2014 17:06:29 +0200
Subject: [Buildroot] [PATCH v2] agg: new package
Message-ID: <1398351989-24238-1-git-send-email-julien.boibessot@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Julien Boibessot <julien.boibessot@armadeus.com>


Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
---
 This library will be needed by gnash (soon coming Flash player).

 Changes since v1:
 * Took Arnout/Thomas/Yann remarks into account:
   - add comments for AGG_AUTORECONF usage and sdl-prefix redefinition,
   - fixes license (comments welcome),
   - add a patch to fixes autoreconf problems previously hacked directly in agg.mk
   - changed commit Subject

 package/Config.in                         |    1 +
 package/agg/Config.in                     |   13 +++++++++
 package/agg/agg-make-autoreconfable.patch |   25 ++++++++++++++++++
 package/agg/agg.mk                        |   39 +++++++++++++++++++++++++++++
 4 files changed, 78 insertions(+), 0 deletions(-)
 create mode 100644 package/agg/Config.in
 create mode 100644 package/agg/agg-make-autoreconfable.patch
 create mode 100644 package/agg/agg.mk

diff --git a/package/Config.in b/package/Config.in
index 688ed4d..3b34a67 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -556,6 +556,7 @@ source "package/lockdev/Config.in"
 endmenu
 
 menu "Graphics"
+source "package/agg/Config.in"
 source "package/atk/Config.in"
 source "package/cairo/Config.in"
 source "package/fltk/Config.in"
diff --git a/package/agg/Config.in b/package/agg/Config.in
new file mode 100644
index 0000000..a842098
--- /dev/null
+++ b/package/agg/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_AGG
+	bool "agg"
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_SDL
+	help
+	  The Anti-Grain Geometry project. A High Quality 2D Graphics Rendering
+	  Engine for C++.
+	  We select the SDL backend by default.
+
+	  http://www.antigrain.com/index.html
+
+comment "agg needs a toolchain with C++ support"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/agg/agg-make-autoreconfable.patch b/package/agg/agg-make-autoreconfable.patch
new file mode 100644
index 0000000..9c069a3
--- /dev/null
+++ b/package/agg/agg-make-autoreconfable.patch
@@ -0,0 +1,25 @@
+Make the package autoreconfigurable without having to create NEWS, AUTHORS and
+README files. Also fixes reconfiguring with recent automake by removing
+AM_C_PROTOTYPES.
+
+Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
+
+--- agg-2.5.org/configure.in	2014-04-24 15:53:57.832886577 +0200
++++ agg-2.5/configure.in	2014-04-24 16:06:56.788749209 +0200
+@@ -1,14 +1,13 @@
+-AC_INIT(src/agg_arc.cpp) # give me a source file, any source file...
++AC_INIT([agg], 2.5.0)
+ AC_CANONICAL_TARGET
+ AC_CONFIG_HEADERS(include/config.h)
+-AM_INIT_AUTOMAKE(agg, 2.5.0)
++AM_INIT_AUTOMAKE([foreign])
+ 
+ 
+ dnl Checks for programs.
+ AC_PROG_CC
+ AC_PROG_CXX
+ AC_ISC_POSIX
+-AM_C_PROTOTYPES
+ if test "x$U" != "x"; then
+   AC_MSG_ERROR(Compiler not ANSI compliant)
+ fi
diff --git a/package/agg/agg.mk b/package/agg/agg.mk
new file mode 100644
index 0000000..4802d3e
--- /dev/null
+++ b/package/agg/agg.mk
@@ -0,0 +1,39 @@
+###############################################################################
+#
+# agg
+#
+###############################################################################
+
+AGG_VERSION = 2.5
+AGG_SITE = http://www.antigrain.com/
+AGG_LICENSE = GPLv2+
+AGG_LICENSE_FILES = copying
+# Examples (if one day enabled) use gpc library which has a different license:
+#AGG_LICENSE += with exceptions: gpc sources are free for non-commercial use
+#AGG_LICENSE_FILES += gpc/copying.txt
+AGG_INSTALL_STAGING = YES
+# No ./configure in the sources, we need to generate it:
+AGG_AUTORECONF = YES
+
+AGG_DEPENDENCIES = host-pkgconf sdl
+
+# Forces sdl-prefix, otherwise configure will set it to Host SDL devt files
+# directory, if installed:
+AGG_CONF_OPT = \
+        --with-sdl-prefix=$(STAGING_DIR)/usr \
+        --disable-sdltest
+
+ifeq ($(BR2_PACKAGE_SDL_X11),)
+AGG_CONF_OPT += \
+	--with-x=NO \
+	--disable-examples # examples require X11
+endif
+
+ifeq ($(BR2_PACKAGE_FREETYPE),y)
+AGG_DEPENDENCIES += freetype
+AGG_CONF_OPT += --enable-freetype
+else
+AGG_CONF_OPT += --disable-freetype
+endif
+
+$(eval $(autotools-package))
-- 
1.7.5.4
