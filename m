From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  7 Nov 2015 17:50:53 +0100
Subject: [Buildroot] [PATCH v2 3/3] package/vsxu: new package
In-Reply-To: <1446915053-13783-1-git-send-email-bernd.kuhls@t-online.de>
References: <1446915053-13783-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1446915053-13783-4-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package needs cal3d source code which is included upstream as a git
submodule, something not supported by the git download helper.
To include cal3d I used a method described by Arnout:
http://lists.busybox.net/pipermail/buildroot/2013-March/069971.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: added patch to make BR2_COMPILER_PARANOID_UNSAFE_PATH=y happy

 package/Config.in                         |  1 +
 package/vsxu/0001-disable-backtrace.patch | 35 ++++++++++++++++++++++++++
 package/vsxu/0002-fix-includes.patch      | 41 +++++++++++++++++++++++++++++++
 package/vsxu/Config.in                    | 20 +++++++++++++++
 package/vsxu/vsxu.mk                      | 31 +++++++++++++++++++++++
 5 files changed, 128 insertions(+)
 create mode 100644 package/vsxu/0001-disable-backtrace.patch
 create mode 100644 package/vsxu/0002-fix-includes.patch
 create mode 100644 package/vsxu/Config.in
 create mode 100644 package/vsxu/vsxu.mk

diff --git a/package/Config.in b/package/Config.in
index eb601e8..6080e15 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -225,6 +225,7 @@ comment "Graphic applications"
 	source "package/mesa3d-demos/Config.in"
 	source "package/qt5cinex/Config.in"
 	source "package/rrdtool/Config.in"
+	source "package/vsxu/Config.in"
 
 comment "Graphic libraries"
 	source "package/cal3d/Config.in"
diff --git a/package/vsxu/0001-disable-backtrace.patch b/package/vsxu/0001-disable-backtrace.patch
new file mode 100644
index 0000000..1c5e2a4
--- /dev/null
+++ b/package/vsxu/0001-disable-backtrace.patch
@@ -0,0 +1,35 @@
+uClibc has no support for execinfo.h/backtrace
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+--- a/engine/include/debug/vsx_backtrace.h	2015-05-23 13:21:46.000000000 +0200
++++ b/engine/include/debug/vsx_backtrace.h	2015-11-05 20:46:48.000000000 +0100
+@@ -7,7 +7,7 @@
+ 
+ #include <stdio.h>
+ #include <errno.h>
+-#include <execinfo.h>
++//#include <execinfo.h>
+ #include <unistd.h>
+ #include <string.h>
+ #include <malloc.h>
+@@ -18,7 +18,8 @@
+ 
+ inline void full_write(int fd, const char *buf, size_t len)
+ {
+-#if !(PLATFORM_FAMILY == PLATFORM_FAMILY_WINDOWS)
++#if 0
++//#if !(PLATFORM_FAMILY == PLATFORM_FAMILY_WINDOWS)
+   while (len > 0) {
+   ssize_t ret = write(fd, buf, len);
+ 
+@@ -34,7 +35,8 @@
+ 
+ inline void print_backtrace(void)
+ {
+-#if !(PLATFORM_FAMILY == PLATFORM_FAMILY_WINDOWS)
++#if 0
++//#if !(PLATFORM_FAMILY == PLATFORM_FAMILY_WINDOWS)
+   static const char start[] = "BACKTRACE ------------\n";
+   static const char end[] = "----------------------\n";
+ 
diff --git a/package/vsxu/0002-fix-includes.patch b/package/vsxu/0002-fix-includes.patch
new file mode 100644
index 0000000..5d94496
--- /dev/null
+++ b/package/vsxu/0002-fix-includes.patch
@@ -0,0 +1,41 @@
+Do not use host paths when cross-compiling.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr vsxu-4a34b08ec9e51605ca55d1a833f23e9601b2aa88.org/plugins/src/render.text/CMakeLists.txt vsxu-4a34b08ec9e51605ca55d1a833f23e9601b2aa88/plugins/src/render.text/CMakeLists.txt
+--- vsxu-4a34b08ec9e51605ca55d1a833f23e9601b2aa88.org/plugins/src/render.text/CMakeLists.txt	2015-05-23 13:21:46.000000000 +0200
++++ vsxu-4a34b08ec9e51605ca55d1a833f23e9601b2aa88/plugins/src/render.text/CMakeLists.txt	2015-11-07 17:42:53.277922806 +0100
+@@ -8,6 +8,8 @@
+ 
+ message("configuring vsxu module            " ${module_id})
+ 
++find_package(Freetype REQUIRED)
++
+ # set defines for MOD_CM, MOD_DM, MOD_NM
+ CREATE_STATIC_GLUE(${module_id})
+ 
+@@ -21,7 +23,7 @@
+ endif(WIN32)
+ 
+ if(UNIX)
+-  include_directories(/usr/include/freetype2)
++  include_directories(${FREETYPE_INCLUDE_DIRS})
+ endif(UNIX)
+ 
+ # include common
+diff -uNr vsxu-4a34b08ec9e51605ca55d1a833f23e9601b2aa88.org/plugins/src/texture/CMakeLists.txt vsxu-4a34b08ec9e51605ca55d1a833f23e9601b2aa88/plugins/src/texture/CMakeLists.txt
+--- vsxu-4a34b08ec9e51605ca55d1a833f23e9601b2aa88.org/plugins/src/texture/CMakeLists.txt	2015-05-23 13:21:46.000000000 +0200
++++ vsxu-4a34b08ec9e51605ca55d1a833f23e9601b2aa88/plugins/src/texture/CMakeLists.txt	2015-11-07 17:41:33.000000000 +0100
+@@ -8,7 +8,11 @@
+ 
+ message("configuring vsxu module            " ${module_id})
+ 
+-include_directories(/usr/include/OpenEXR)
++find_package(OpenEXR)
++
++if(OpenEXR_FOUND)
++  include_directories(${OPENEXR_INCLUDE_DIRS})
++endif(OpenEXR_FOUND)
+ 
+ # set defines for MOD_CM, MOD_DM, MOD_NM
+ CREATE_STATIC_GLUE(${module_id})
diff --git a/package/vsxu/Config.in b/package/vsxu/Config.in
new file mode 100644
index 0000000..8639c0c
--- /dev/null
+++ b/package/vsxu/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_VSXU
+	bool "vsxu"
+	depends on BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_HAS_LIBGL
+	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LIBGLEW
+	select BR2_PACKAGE_LIBGLFW
+	select BR2_PACKAGE_LIBGLU
+	select BR2_PACKAGE_LIBPNG
+	select BR2_PACKAGE_ZLIB
+	help
+	  VSXu (VSX Ultra) is an OpenGL-based (hardware-accelerated),
+	  modular programming environment with its main purpose to
+	  visualize music and create real time graphic effects.
+
+	  http://www.vsxu.com
+
+comment "vsxu depends on X.org and needs an OpenGL backend"
+	depends on !BR2_PACKAGE_XORG7 || !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/vsxu/vsxu.mk b/package/vsxu/vsxu.mk
new file mode 100644
index 0000000..7dcbf74
--- /dev/null
+++ b/package/vsxu/vsxu.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# vsxu
+#
+################################################################################
+
+# instead of using master branch we use branch glfw3
+VSXU_VERSION = 4a34b08ec9e51605ca55d1a833f23e9601b2aa88
+VSXU_SITE = $(call github,vovoid,vsxu,$(VSXU_VERSION))
+VSXU_LICENSE = GPLv3
+VSXU_LICENSE_FILES = COPYING
+VSXU_INSTALL_STAGING = YES
+VSXU_DEPENDENCIES = cal3d freetype jpeg libgl libglew libglfw libglu \
+	libpng zlib
+
+# cal3d is a git submodule
+define VSXU_LINK_CAL3D
+	rm -rf $(@D)/plugins/src/mesh.importers/cal3d/
+	ln -sf $(CAL3D_DIR) $(@D)/plugins/src/mesh.importers/cal3d
+endef
+VSXU_POST_EXTRACT_HOOKS += VSXU_LINK_CAL3D
+
+ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
+VSXU_DEPENDENCIES += alsa-lib
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV),y)
+VSXU_DEPENDENCIES += opencv
+endif
+
+$(eval $(cmake-package))
-- 
2.6.2
