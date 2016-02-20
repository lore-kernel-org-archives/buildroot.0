From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Feb 2016 23:09:35 +0100
Subject: [Buildroot] [PATCH/next 30/31] package/vsxu: new package
In-Reply-To: <1456006176-21308-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456006176-21308-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456006176-21308-31-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in                                  |  1 +
 package/vsxu/0001-Detect-backtrace-support.patch   | 65 ++++++++++++++++++++++
 ...o-not-use-host-paths-when-cross-compiling.patch | 55 ++++++++++++++++++
 package/vsxu/Config.in                             | 22 ++++++++
 package/vsxu/vsxu.hash                             |  3 +
 package/vsxu/vsxu.mk                               | 43 ++++++++++++++
 6 files changed, 189 insertions(+)
 create mode 100644 package/vsxu/0001-Detect-backtrace-support.patch
 create mode 100644 package/vsxu/0002-Do-not-use-host-paths-when-cross-compiling.patch
 create mode 100644 package/vsxu/Config.in
 create mode 100644 package/vsxu/vsxu.hash
 create mode 100644 package/vsxu/vsxu.mk

diff --git a/package/Config.in b/package/Config.in
index 422978f..488b59e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -241,6 +241,7 @@ comment "Graphic applications"
 	source "package/mesa3d-demos/Config.in"
 	source "package/qt5cinex/Config.in"
 	source "package/rrdtool/Config.in"
+	source "package/vsxu/Config.in"
 
 comment "Graphic libraries"
 	source "package/cegui06/Config.in"
diff --git a/package/vsxu/0001-Detect-backtrace-support.patch b/package/vsxu/0001-Detect-backtrace-support.patch
new file mode 100644
index 0000000..a3dd692
--- /dev/null
+++ b/package/vsxu/0001-Detect-backtrace-support.patch
@@ -0,0 +1,65 @@
+From a3606dcf62b78a987369e557930efef8a9499148 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sat, 19 Dec 2015 18:31:48 +0100
+Subject: [PATCH 1/2] Detect backtrace support
+
+uClibc has no support for execinfo.h/backtrace
+
+Patch sent upstream: https://github.com/vovoid/vsxu/pull/171
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ CMakeLists.txt                       | 4 ++++
+ engine/include/debug/vsx_backtrace.h | 6 ++++--
+ 2 files changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index c2377b8..9613610 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -152,6 +152,10 @@ INCLUDE(CPack)
+ ################################################################################
+ 
+ 
++include(CheckIncludeFiles)
++
++check_include_files(execinfo.h HAVE_EXECINFO)
++
+ add_definitions( -std=c++0x )
+ 
+ if (VSXU_STATIC EQUAL 1)
+diff --git a/engine/include/debug/vsx_backtrace.h b/engine/include/debug/vsx_backtrace.h
+index 0fbcf86..a83fdc4 100644
+--- a/engine/include/debug/vsx_backtrace.h
++++ b/engine/include/debug/vsx_backtrace.h
+@@ -7,7 +7,9 @@
+ 
+ #include <stdio.h>
+ #include <errno.h>
++#ifdef HAVE_EXECINFO
+ #include <execinfo.h>
++#endif
+ #include <unistd.h>
+ #include <string.h>
+ #include <malloc.h>
+@@ -18,7 +20,7 @@ namespace vsx_backtrace
+ 
+ inline void full_write(int fd, const char *buf, size_t len)
+ {
+-#if !(PLATFORM_FAMILY == PLATFORM_FAMILY_WINDOWS)
++#if !(PLATFORM_FAMILY == PLATFORM_FAMILY_WINDOWS) && defined(HAVE_EXECINFO)
+   while (len > 0) {
+   ssize_t ret = write(fd, buf, len);
+ 
+@@ -34,7 +36,7 @@ inline void full_write(int fd, const char *buf, size_t len)
+ 
+ inline void print_backtrace(void)
+ {
+-#if !(PLATFORM_FAMILY == PLATFORM_FAMILY_WINDOWS)
++#if !(PLATFORM_FAMILY == PLATFORM_FAMILY_WINDOWS) && defined(HAVE_EXECINFO)
+   static const char start[] = "BACKTRACE ------------\n";
+   static const char end[] = "----------------------\n";
+ 
+-- 
+2.6.4
+
diff --git a/package/vsxu/0002-Do-not-use-host-paths-when-cross-compiling.patch b/package/vsxu/0002-Do-not-use-host-paths-when-cross-compiling.patch
new file mode 100644
index 0000000..f3fb885
--- /dev/null
+++ b/package/vsxu/0002-Do-not-use-host-paths-when-cross-compiling.patch
@@ -0,0 +1,55 @@
+From 927e98180736612bccebfa04e9b681dc92541b5e Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sat, 19 Dec 2015 18:32:38 +0100
+Subject: [PATCH 2/2] Do not use host paths when cross-compiling.
+
+Patch sent upstream: https://github.com/vovoid/vsxu/pull/171
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ plugins/src/render.text/CMakeLists.txt | 4 +++-
+ plugins/src/texture/CMakeLists.txt     | 6 +++++-
+ 2 files changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/plugins/src/render.text/CMakeLists.txt b/plugins/src/render.text/CMakeLists.txt
+index 38f3994..3f322eb 100644
+--- a/plugins/src/render.text/CMakeLists.txt
++++ b/plugins/src/render.text/CMakeLists.txt
+@@ -8,6 +8,8 @@ project (${module_id})
+ 
+ message("configuring vsxu module            " ${module_id})
+ 
++find_package(Freetype REQUIRED)
++
+ # set defines for MOD_CM, MOD_DM, MOD_NM
+ CREATE_STATIC_GLUE(${module_id})
+ 
+@@ -21,7 +23,7 @@ if(WIN32)
+ endif(WIN32)
+ 
+ if(UNIX)
+-  include_directories(/usr/include/freetype2)
++  include_directories(${FREETYPE_INCLUDE_DIRS})
+ endif(UNIX)
+ 
+ # include common
+diff --git a/plugins/src/texture/CMakeLists.txt b/plugins/src/texture/CMakeLists.txt
+index e65ae9b..1c667e6 100644
+--- a/plugins/src/texture/CMakeLists.txt
++++ b/plugins/src/texture/CMakeLists.txt
+@@ -8,7 +8,11 @@ project (${module_id})
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
+-- 
+2.6.4
+
diff --git a/package/vsxu/Config.in b/package/vsxu/Config.in
new file mode 100644
index 0000000..e8db892
--- /dev/null
+++ b/package/vsxu/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_VSXU
+	bool "vsxu"
+	depends on BR2_i386 || BR2_x86_64
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
+	depends on BR2_i386 || BR2_x86_64
+	depends on !BR2_PACKAGE_XORG7 || !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/vsxu/vsxu.hash b/package/vsxu/vsxu.hash
new file mode 100644
index 0000000..f8d5e76
--- /dev/null
+++ b/package/vsxu/vsxu.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  69ecfc85d7d2c1eebf87fbfe5a74240289cdb5571cc99a9730ace7e3d88ace09  vsxu-4a34b08ec9e51605ca55d1a833f23e9601b2aa88.tar.gz
+sha256  c2b3b999b090bc5bcf7047a74d3e83e81e9aabcc3e2181a9dddebb01b99bd381  cal3d-0f640189eec913973c64db3bc1c1685554cb7202.tar.gz
diff --git a/package/vsxu/vsxu.mk b/package/vsxu/vsxu.mk
new file mode 100644
index 0000000..8b7e483
--- /dev/null
+++ b/package/vsxu/vsxu.mk
@@ -0,0 +1,43 @@
+################################################################################
+#
+# vsxu
+#
+################################################################################
+
+# instead of using master branch we use branch glfw3
+VSXU_VERSION = 4a34b08ec9e51605ca55d1a833f23e9601b2aa88
+VSXU_SITE = $(call github,vovoid,vsxu,$(VSXU_VERSION))
+VSXU_CAL3D_VERSION = 0f640189eec913973c64db3bc1c1685554cb7202
+VSXU_CAL3D_SOURCE = cal3d-$(VSXU_CAL3D_VERSION).tar.gz
+VSXU_EXTRA_DOWNLOADS = $(call github,vovoid,cal3d,$(VSXU_CAL3D_VERSION))/$(VSXU_CAL3D_SOURCE)
+VSXU_LICENSE = GPLv3+, LGPLv2.1+
+VSXU_LICENSE_FILES = COPYING COPYING.LESSER
+VSXU_INSTALL_STAGING = YES
+VSXU_DEPENDENCIES = freetype jpeg libgl libglew libglfw libglu \
+	libpng zlib
+
+# cal3d is a git submodule
+define VSXU_EXTRACT_CAL3D
+	mkdir -p $(@D)/plugins/src/mesh.importers/cal3d
+	$(call suitable-extractor,$(VSXU_CAL3D_SOURCE)) $(DL_DIR)/$(VSXU_CAL3D_SOURCE) | \
+	 $(TAR) --strip-components=1 -C $(@D)/plugins/src/mesh.importers/cal3d $(TAR_OPTIONS) -
+endef
+VSXU_POST_EXTRACT_HOOKS += VSXU_EXTRACT_CAL3D
+
+ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
+VSXU_DEPENDENCIES += alsa-lib
+endif
+
+ifeq ($(BR2_PACKAGE_JACK2),y)
+VSXU_DEPENDENCIES += jack2
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV),y)
+VSXU_DEPENDENCIES += opencv
+endif
+
+ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
+VSXU_DEPENDENCIES += pulseaudio
+endif
+
+$(eval $(cmake-package))
-- 
2.7.0
