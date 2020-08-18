From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 18 Aug 2020 23:54:12 +0200
Subject: [Buildroot] [PATCH 1/1] package/openal: needs gcc >= 4.9
Message-ID: <20200818215412.522185-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

openal uses std::max_align_t since version 1.20.0 and
https://github.com/kcat/openal-soft/commit/585b0cf3bed7d1c5720633eb7e5358a9fca865f6

As a result, it is affected by
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=56019
and the build with gcc <= 4.8 will fail on:

/home/buildroot/autobuild/instance-2/output-1/build/openal-1.20.1/common/almalloc.cpp: In function 'void* al_malloc(size_t, size_t)':
/home/buildroot/autobuild/instance-2/output-1/build/openal-1.20.1/common/almalloc.cpp:20:45: error: 'max_align_t' is not a member of 'std'
     alignment = std::max(alignment, alignof(std::max_align_t));
                                             ^

Fixes:
 - http://autobuild.buildroot.org/results/589c7853ce334c7502f7cd4cdbcaaf3c6840f43b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in | 6 +++---
 package/lugaru/Config.in                      | 6 +++---
 package/openal/Config.in                      | 6 +++---
 package/solarus/Config.in                     | 6 +++---
 package/supertuxkart/Config.in                | 6 +++---
 5 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index c6e4a547f1..5a066cb179 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -491,16 +491,16 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_NEON
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENAL
 	bool "openal"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_PAKCAGE_OPENAL_ARCH_SUPPORTS
 	select BR2_PACKAGE_OPENAL
 
-comment "openal plugin needs a toolchain w/ NPTL, C++, gcc >= 4.7"
+comment "openal plugin needs a toolchain w/ NPTL, C++, gcc >= 4.9"
 	depends on BR2_PAKCAGE_OPENAL_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
 		|| !BR2_INSTALL_LIBSTDCPP \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENH264
 	bool "openh264"
diff --git a/package/lugaru/Config.in b/package/lugaru/Config.in
index 521c89aeb0..4454ebcd06 100644
--- a/package/lugaru/Config.in
+++ b/package/lugaru/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_LUGARU
 	depends on BR2_PACKAGE_HAS_LIBGL # libglu
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_XORG7 # SDL2 OpenGL (GLX)
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # openal
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # openal
 	depends on BR2_USE_MMU # SDL2 OpenGL (GLX)
 	depends on !BR2_STATIC_LIBS # SDL2
@@ -29,10 +29,10 @@ config BR2_PACKAGE_LUGARU
 
 	  https://osslugaru.gitlab.io/
 
-comment "lugaru needs X11 and a toolchain w/ C++, OpenGL backend, gcc >= 4.7, NPTL, dynamic library"
+comment "lugaru needs X11 and a toolchain w/ C++, OpenGL backend, gcc >= 4.9, NPTL, dynamic library"
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_HAS_LIBGL || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		BR2_STATIC_LIBS
diff --git a/package/openal/Config.in b/package/openal/Config.in
index 7025c131e8..6b0e9973db 100644
--- a/package/openal/Config.in
+++ b/package/openal/Config.in
@@ -16,7 +16,7 @@ config BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
 config BR2_PACKAGE_OPENAL
 	bool "openal"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11 PR56019
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
 	help
@@ -27,8 +27,8 @@ config BR2_PACKAGE_OPENAL
 
 	  http://kcat.strangesoft.net/openal.html
 
-comment "openal needs a toolchain w/ NPTL, C++, gcc >= 4.7"
+comment "openal needs a toolchain w/ NPTL, C++, gcc >= 4.9"
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
 		|| !BR2_INSTALL_LIBSTDCPP \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/solarus/Config.in b/package/solarus/Config.in
index cdff62687f..b0f4121f6d 100644
--- a/package/solarus/Config.in
+++ b/package/solarus/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_SOLARUS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # openal
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # openal
 	depends on !BR2_STATIC_LIBS # SDL2
 	depends on BR2_PACKAGE_HAS_LIBGL
@@ -25,9 +25,9 @@ config BR2_PACKAGE_SOLARUS
 	  http://www.solarus-games.org
 	  https://github.com/solarus-games/solarus
 
-comment "solarus needs OpenGL and a toolchain w/ C++, gcc >= 4.8, NPTL, dynamic library, and luajit or lua 5.1"
+comment "solarus needs OpenGL and a toolchain w/ C++, gcc >= 4.9, NPTL, dynamic library, and luajit or lua 5.1"
 	depends on !BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 \
 		|| !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS \
 		|| !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/supertuxkart/Config.in b/package/supertuxkart/Config.in
index b8ac3ae261..99f2310d82 100644
--- a/package/supertuxkart/Config.in
+++ b/package/supertuxkart/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_SUPERTUXKART
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_INSTALL_LIBSTDCPP # openal
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # openal
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # openal
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # openal
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS # openal
 	depends on BR2_PACKAGE_HAS_LIBGL
@@ -33,7 +33,7 @@ config BR2_PACKAGE_SUPERTUXKART
 
 	  http://supertuxkart.sourceforge.net/Main_Page
 
-comment "supertuxkart needs an OpenGL backend, a uClibc or glibc toolchain w/ NPTL, C++, gcc >= 4.7"
+comment "supertuxkart needs an OpenGL backend, a uClibc or glibc toolchain w/ NPTL, C++, gcc >= 4.9"
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_USE_MMU
@@ -41,6 +41,6 @@ comment "supertuxkart needs an OpenGL backend, a uClibc or glibc toolchain w/ NP
 	depends on BR2_PACKAGE_XORG7
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
 		|| !BR2_INSTALL_LIBSTDCPP \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 \
 		|| !BR2_PACKAGE_HAS_LIBGL \
 		|| BR2_TOOLCHAIN_USES_MUSL
-- 
2.27.0
