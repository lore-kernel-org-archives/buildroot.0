From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Aug 2020 22:40:10 +0200
Subject: [Buildroot] [git commit] package/openal: bump to version 1.20.1
Message-ID: <20200813203419.C96E58612B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=43aa2fcc54970c9c5ff3c78561541c4f39295577
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This will fix the build with gcc 10 due to the library codebase being
switched to C++11.

It should be noted that bumping the C++ requirement from C++11 to C++14
is not needed for this bump as this change is not yet in this version:
https://github.com/kcat/openal-soft/commit/f6a0b004e0424e1f12a226b3b3c7193063eb02e3

Also update indentation in hash file (two spaces)

Fixes:
 - http://autobuild.buildroot.org/results/4546ce4f176164462b0e73c387bc45c9771f98f7

Signed-off-by: Andr?? Hentschel <nerv@dawncrow.de>
Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in | 6 ++++--
 package/openal/Config.in                      | 6 ++++--
 package/openal/openal.hash                    | 4 ++--
 package/openal/openal.mk                      | 2 +-
 package/supertuxkart/Config.in                | 4 +++-
 5 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 08de5d2188..6190cb5028 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -489,14 +489,16 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_NEON
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENAL
 	bool "openal"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_PAKCAGE_OPENAL_ARCH_SUPPORTS
 	select BR2_PACKAGE_OPENAL
 
-comment "openal plugin needs a toolchain w/ NPTL, C++"
+comment "openal plugin needs a toolchain w/ NPTL, C++, gcc >= 4.7"
 	depends on BR2_PAKCAGE_OPENAL_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
-		|| !BR2_INSTALL_LIBSTDCPP
+		|| !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENH264
 	bool "openh264"
diff --git a/package/openal/Config.in b/package/openal/Config.in
index a564156555..7025c131e8 100644
--- a/package/openal/Config.in
+++ b/package/openal/Config.in
@@ -16,6 +16,7 @@ config BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
 config BR2_PACKAGE_OPENAL
 	bool "openal"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
 	help
@@ -26,7 +27,8 @@ config BR2_PACKAGE_OPENAL
 
 	  http://kcat.strangesoft.net/openal.html
 
-comment "openal needs a toolchain w/ NPTL, C++"
+comment "openal needs a toolchain w/ NPTL, C++, gcc >= 4.7"
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
-		|| !BR2_INSTALL_LIBSTDCPP
+		|| !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
diff --git a/package/openal/openal.hash b/package/openal/openal.hash
index a133808cae..1592dd56b5 100644
--- a/package/openal/openal.hash
+++ b/package/openal/openal.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 9f3536ab2bb7781dbafabc6a61e0b34b17edd16bd6c2eaf2ae71bc63078f98c7  openal-1.19.1.tar.gz
-sha256 d808ce217e5b611854da622b57ec29fe545584c48bc5352fae72a4b6e5074a15  COPYING
+sha256  c32d10473457a8b545aab50070fe84be2b5b041e1f2099012777ee6be0057c13  openal-1.20.1.tar.gz
+sha256  d808ce217e5b611854da622b57ec29fe545584c48bc5352fae72a4b6e5074a15  COPYING
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
diff --git a/package/supertuxkart/Config.in b/package/supertuxkart/Config.in
index e00d98d2a4..b8ac3ae261 100644
--- a/package/supertuxkart/Config.in
+++ b/package/supertuxkart/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_SUPERTUXKART
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_INSTALL_LIBSTDCPP # openal
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # openal
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # openal
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS # openal
 	depends on BR2_PACKAGE_HAS_LIBGL
@@ -32,7 +33,7 @@ config BR2_PACKAGE_SUPERTUXKART
 
 	  http://supertuxkart.sourceforge.net/Main_Page
 
-comment "supertuxkart needs an OpenGL backend, a uClibc or glibc toolchain w/ NPTL, C++"
+comment "supertuxkart needs an OpenGL backend, a uClibc or glibc toolchain w/ NPTL, C++, gcc >= 4.7"
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_USE_MMU
@@ -40,5 +41,6 @@ comment "supertuxkart needs an OpenGL backend, a uClibc or glibc toolchain w/ NP
 	depends on BR2_PACKAGE_XORG7
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
 		|| !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 \
 		|| !BR2_PACKAGE_HAS_LIBGL \
 		|| BR2_TOOLCHAIN_USES_MUSL
