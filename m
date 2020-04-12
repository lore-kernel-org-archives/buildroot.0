From: =?UTF-8?q?Andr=C3=A9=20Hentschel?= <nerv@dawncrow.de>
Date: Sun, 12 Apr 2020 15:49:00 +0200
Subject: [Buildroot] [PATCH v2] package/openal: bump to version 1.20.1
Message-ID: <20200412134900.14298-1-nerv@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---
 package/alure/Config.in                       | 6 +++---
 package/gstreamer1/gst1-plugins-bad/Config.in | 8 +++++---
 package/lugaru/Config.in                      | 6 +++---
 package/minetest/Config.in                    | 8 ++++----
 package/openal/Config.in                      | 8 +++++---
 package/openal/openal.hash                    | 2 +-
 package/openal/openal.mk                      | 2 +-
 package/solarus/Config.in                     | 6 +++---
 package/supertuxkart/Config.in                | 4 +++-
 9 files changed, 28 insertions(+), 22 deletions(-)

diff --git a/package/alure/Config.in b/package/alure/Config.in
index e0064accba..de6a04ec44 100644
--- a/package/alure/Config.in
+++ b/package/alure/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_ALURE
 	bool "alure"
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # openal
 	depends on BR2_USE_WCHAR # use wchar_t
@@ -50,10 +50,10 @@ config BR2_PACKAGE_ALURE_VORBIS_DECODER
 
 endif
 
-comment "alure needs a toolchain w/ C++, gcc >= 4.9, NPTL, wchar"
+comment "alure needs a target gcc >= 5 w/ C++14, NPTL, wchar"
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_5 \
 		|| !BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_USE_WCHAR
 
 comment "alure needs a toolchain not affected by GCC bug 64735"
diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 08de5d2188..f1ae6b08c4 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -488,15 +488,17 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_NEON
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENAL
 	bool "openal"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_PAKCAGE_OPENAL_ARCH_SUPPORTS
 	select BR2_PACKAGE_OPENAL
 
-comment "openal plugin needs a toolchain w/ NPTL, C++"
+comment "openal plugin needs a target gcc >= 5 w/ C++14, NPTL"
 	depends on BR2_PAKCAGE_OPENAL_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
-		|| !BR2_INSTALL_LIBSTDCPP
+	depends on depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_5 || \
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
+		!BR2_INSTALL_LIBSTDCPP
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENH264
 	bool "openh264"
diff --git a/package/lugaru/Config.in b/package/lugaru/Config.in
index 521c89aeb0..053ac0b390 100644
--- a/package/lugaru/Config.in
+++ b/package/lugaru/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_LUGARU
 	depends on BR2_PACKAGE_HAS_LIBGL # libglu
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_XORG7 # SDL2 OpenGL (GLX)
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # openal
 	depends on BR2_USE_MMU # SDL2 OpenGL (GLX)
 	depends on !BR2_STATIC_LIBS # SDL2
@@ -29,10 +29,10 @@ config BR2_PACKAGE_LUGARU
 
 	  https://osslugaru.gitlab.io/
 
-comment "lugaru needs X11 and a toolchain w/ C++, OpenGL backend, gcc >= 4.7, NPTL, dynamic library"
+comment "lugaru needs X11 and a target gcc >= 5 w/ C++14, OpenGL backend, NPTL, dynamic library"
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_HAS_LIBGL || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		BR2_STATIC_LIBS
diff --git a/package/minetest/Config.in b/package/minetest/Config.in
index 085525534d..f9167bc070 100644
--- a/package/minetest/Config.in
+++ b/package/minetest/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_MINETEST
 	bool "minetest"
 	depends on BR2_INSTALL_LIBSTDCPP # irrlicht
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_XORG7 # irrlicht
 	depends on BR2_PACKAGE_HAS_LIBGL # irrlicht
@@ -52,15 +52,15 @@ comment "sound support needs a toolchain w/ threads NPTL"
 
 endif
 
-comment "minetest needs a toolchain w/ C++, gcc >= 4.9, threads"
+comment "minetest needs a target gcc >= 5 w/ C++14, threads"
 	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_5 \
 		|| !BR2_TOOLCHAIN_HAS_THREADS
 
 comment "minetest needs X11 and an OpenGL provider"
 	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
 	depends on (BR2_INSTALL_LIBSTDCPP \
-		&& BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 \
+		&& BR2_TOOLCHAIN_GCC_AT_LEAST_5 \
 		&& BR2_TOOLCHAIN_HAS_THREADS)
 	depends on !BR2_PACKAGE_HAS_LIBGL || !BR2_PACKAGE_XORG7
diff --git a/package/openal/Config.in b/package/openal/Config.in
index a564156555..d129906d2c 100644
--- a/package/openal/Config.in
+++ b/package/openal/Config.in
@@ -15,6 +15,7 @@ config BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
 
 config BR2_PACKAGE_OPENAL
 	bool "openal"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
@@ -26,7 +27,8 @@ config BR2_PACKAGE_OPENAL
 
 	  http://kcat.strangesoft.net/openal.html
 
-comment "openal needs a toolchain w/ NPTL, C++"
+comment "openal needs a target gcc >= 5 w/ C++14, NPTL"
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
-		|| !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_5 || \
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
+		!BR2_INSTALL_LIBSTDCPP
diff --git a/package/openal/openal.hash b/package/openal/openal.hash
index a133808cae..917be2843c 100644
--- a/package/openal/openal.hash
+++ b/package/openal/openal.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 9f3536ab2bb7781dbafabc6a61e0b34b17edd16bd6c2eaf2ae71bc63078f98c7  openal-1.19.1.tar.gz
+sha256 c32d10473457a8b545aab50070fe84be2b5b041e1f2099012777ee6be0057c13  openal-1.20.1.tar.gz
 sha256 d808ce217e5b611854da622b57ec29fe545584c48bc5352fae72a4b6e5074a15  COPYING
diff --git a/package/openal/openal.mk b/package/openal/openal.mk
index 8e761a8d9b..ed63abfb3f 100644
--- a/package/openal/openal.mk
+++ b/package/openal/openal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENAL_VERSION = 1.19.1
+OPENAL_VERSION = 1.20.1
 OPENAL_SITE = $(call github,kcat,openal-soft,openal-soft-$(OPENAL_VERSION))
 OPENAL_LICENSE = LGPL-2.0+
 OPENAL_LICENSE_FILES = COPYING
diff --git a/package/solarus/Config.in b/package/solarus/Config.in
index 6bed38a6f5..851e54920c 100644
--- a/package/solarus/Config.in
+++ b/package/solarus/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_SOLARUS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # openal
 	depends on !BR2_STATIC_LIBS # SDL2
 	depends on BR2_PACKAGE_HAS_LIBGL
@@ -25,9 +25,9 @@ config BR2_PACKAGE_SOLARUS
 	  http://www.solarus-games.org
 	  https://github.com/solarus-games/solarus
 
-comment "solarus needs OpenGL and a toolchain w/ C++, gcc >= 4.8, NPTL, dynamic library"
+comment "solarus needs OpenGL and a target gcc >= 5 w/ C++14, NPTL, dynamic library"
 	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS || BR2_PACKAGE_LUA_5_1
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_5 \
 		|| !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS \
 		|| !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/supertuxkart/Config.in b/package/supertuxkart/Config.in
index fcb27445da..992ad53c9a 100644
--- a/package/supertuxkart/Config.in
+++ b/package/supertuxkart/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_SUPERTUXKART
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14
 	depends on BR2_INSTALL_LIBSTDCPP # openal
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # openal
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS # openal
@@ -33,13 +34,14 @@ config BR2_PACKAGE_SUPERTUXKART
 
 	  http://supertuxkart.sourceforge.net/Main_Page
 
-comment "supertuxkart needs an OpenGL backend, a uClibc or glibc toolchain w/ NPTL, C++"
+comment "supertuxkart needs an OpenGL backend, a uClibc or glibc target gcc >= 5 w/ C++14, NPTL"
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_XORG7
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_5 \
 		|| !BR2_INSTALL_LIBSTDCPP \
 		|| !BR2_PACKAGE_HAS_LIBGL \
 		|| BR2_TOOLCHAIN_USES_MUSL
-- 
2.17.1
