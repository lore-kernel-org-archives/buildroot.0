From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Dec 2015 14:07:15 +0100
Subject: [Buildroot] [git commit] package/libefl: move to package directory
Message-ID: <20151220134303.DBFFB81E71@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e6209bbb60686cb51c83282e97e8309027ec8133
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As discussed on the list move the last remaining package
in package/efl subdirectory to package/ directory.

- move the efl dependency to libefl.
- Set LIBEFL_VERSION with the version number directly.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |  2 +-
 package/efl/Config.in                              | 29 ----------------------
 package/efl/efl.mk                                 |  4 ---
 ...ecore_fb_private.h-define-EAPI-before-use.patch |  0
 .../libefl/0002-ecore_x-Remove-XPrint-usage.patch  |  0
 package/{efl => }/libefl/Config.in                 | 16 ++++++++++++
 package/{efl => }/libefl/libefl.hash               |  0
 package/{efl => }/libefl/libefl.mk                 |  2 +-
 8 files changed, 18 insertions(+), 35 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 55cd874..53e8988 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -253,6 +253,7 @@ endif
 	source "package/fbv/Config.in"
 	source "package/freerdp/Config.in"
 	source "package/imagemagick/Config.in"
+	source "package/libefl/Config.in"
 	source "package/linux-fusion/Config.in"
 	source "package/lite/Config.in"
 	source "package/mesa3d/Config.in"
@@ -269,7 +270,6 @@ endif
 	source "package/sdl2/Config.in"
 
 comment "Other GUIs"
-	source "package/efl/Config.in"
 	source "package/qt/Config.in"
 	source "package/qt5/Config.in"
 if BR2_PACKAGE_QT || BR2_PACKAGE_QT5
diff --git a/package/efl/Config.in b/package/efl/Config.in
deleted file mode 100644
index 7ef1b5b..0000000
--- a/package/efl/Config.in
+++ /dev/null
@@ -1,29 +0,0 @@
-menuconfig BR2_PACKAGE_EFL
-	bool "Enlightenment Foundation Libraries"
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_PACKAGE_HAS_UDEV # libudev
-	depends on BR2_PACKAGE_LUA # lua 5.1 or better
-	depends on BR2_TOOLCHAIN_HAS_THREADS # untested without threads
-	depends on BR2_USE_MMU
-	depends on BR2_USE_WCHAR # use wchar_t
-	depends on !BR2_STATIC_LIBS # dlfcn.h
-	select BR2_PACKAGE_LIBEFL
-	help
-	  Enlightenment Foundation Libraries
-
-	  http://enlightenment.org
-
-if BR2_PACKAGE_EFL
-
-source "package/efl/libefl/Config.in"
-
-endif # BR2_PACKAGE_EFL
-
-comment "EFL needs udev /dev management and a toolchain w/ C++, dynamic library, threads, wchar"
-	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_INSTALL_LIBSTDCPP \
-		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
-	depends on BR2_USE_MMU
-
-comment "EFL needs lua"
-	depends on !BR2_PACKAGE_LUA
-	depends on BR2_USE_MMU
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
deleted file mode 100644
index 151ac28..0000000
--- a/package/efl/efl.mk
+++ /dev/null
@@ -1,4 +0,0 @@
-
-EFL_VERSION = 1.15.2
-
-include $(sort $(wildcard package/efl/*/*.mk))
diff --git a/package/efl/libefl/0001-ecore_fb_private.h-define-EAPI-before-use.patch b/package/libefl/0001-ecore_fb_private.h-define-EAPI-before-use.patch
similarity index 100%
rename from package/efl/libefl/0001-ecore_fb_private.h-define-EAPI-before-use.patch
rename to package/libefl/0001-ecore_fb_private.h-define-EAPI-before-use.patch
diff --git a/package/efl/libefl/0002-ecore_x-Remove-XPrint-usage.patch b/package/libefl/0002-ecore_x-Remove-XPrint-usage.patch
similarity index 100%
rename from package/efl/libefl/0002-ecore_x-Remove-XPrint-usage.patch
rename to package/libefl/0002-ecore_x-Remove-XPrint-usage.patch
diff --git a/package/efl/libefl/Config.in b/package/libefl/Config.in
similarity index 89%
rename from package/efl/libefl/Config.in
rename to package/libefl/Config.in
index b2c8773..08c29fc 100644
--- a/package/efl/libefl/Config.in
+++ b/package/libefl/Config.in
@@ -1,5 +1,12 @@
 config BR2_PACKAGE_LIBEFL
 	bool "libefl"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_HAS_UDEV # libudev
+	depends on BR2_PACKAGE_LUA # lua 5.1 or better
+	depends on BR2_TOOLCHAIN_HAS_THREADS # untested without threads
+	depends on BR2_USE_MMU
+	depends on BR2_USE_WCHAR # use wchar_t
+	depends on !BR2_STATIC_LIBS # dlfcn.h
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_JPEG # Emile needs libjpeg
@@ -172,3 +179,12 @@ config BR2_PACKAGE_LIBEFL_WEBP
 	  This enables the loader code that loads images using WebP.
 
 endif # BR2_PACKAGE_LIBEFL
+
+comment "LIBEFL needs udev /dev management and a toolchain w/ C++, dynamic library, threads, wchar"
+	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_INSTALL_LIBSTDCPP \
+		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
+	depends on BR2_USE_MMU
+
+comment "LIBEFL needs lua"
+	depends on !BR2_PACKAGE_LUA
+	depends on BR2_USE_MMU
diff --git a/package/efl/libefl/libefl.hash b/package/libefl/libefl.hash
similarity index 100%
rename from package/efl/libefl/libefl.hash
rename to package/libefl/libefl.hash
diff --git a/package/efl/libefl/libefl.mk b/package/libefl/libefl.mk
similarity index 99%
rename from package/efl/libefl/libefl.mk
rename to package/libefl/libefl.mk
index b989d54..f08a4fb 100644
--- a/package/efl/libefl/libefl.mk
+++ b/package/libefl/libefl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEFL_VERSION = $(EFL_VERSION)
+LIBEFL_VERSION = 1.15.2
 LIBEFL_SOURCE = efl-$(LIBEFL_VERSION).tar.xz
 LIBEFL_SITE = http://download.enlightenment.org/rel/libs/efl
 LIBEFL_LICENSE = BSD-2c, LGPLv2.1+, GPLv2+
