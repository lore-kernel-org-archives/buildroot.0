From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Feb 2020 23:50:30 +0100
Subject: [Buildroot] [git commit] package/qt5: drop 5.6 support
Message-ID: <20200309140907.0ADA9821F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f2744e48adc3da7f8dd4efaeeae4480dbc6d7b10
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As discussed during the FOSDEM2019 develop days, Qt 5.6 is very old (5.6.3
was released in September 2017, and 5.6.x became EOL in March 2019), so drop
it before the new Buildroot LTS release:

https://elinux.org/Buildroot:DeveloperDaysFOSDEM2019#Qt5_versions_to_support:_keep_5.6_or_a_newer_LTS.3F

And add legacy handling for it.

There are a number of places where code checks for
BR2_PACKAGE_QT5_VERSION_LATEST, so leave that as a blind option for now to
not break the build.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy      |  7 +++++++
 package/qt5/Config.in | 38 ++++++++++++--------------------------
 package/qt5/qt5.mk    |  6 ------
 3 files changed, 19 insertions(+), 32 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 87966facb4..6a33ce9e1c 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2020.02"
 
+config BR2_PACKAGE_QT5_VERSION_5_6
+	bool "qt 5.6 support removed"
+	select BR2_LEGACY
+	help
+	  Support for Qt 5.6 is EOL and has been removed. The current
+	  version (5.12 or later) has been selected instead.
+
 config BR2_PACKAGE_CURL
 	bool "BR2_PACKAGE_CURL was renamed"
 	select BR2_PACKAGE_LIBCURL_CURL
diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index def79fa680..7051bf517a 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -11,14 +11,22 @@ config BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	# ARM needs BLX, so v5t+
 	depends on !BR2_ARM_CPU_ARMV4
 
-comment "Qt5 needs a toolchain w/ wchar, NPTL, C++, dynamic library"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
+comment "Qt5 needs a toolchain w/ gcc >= 4.8, wchar, NPTL, C++, dynamic library"
+	depends on !BR2_ARM_CPU_ARMV4
+	depends on !BR2_arc && !BR2_nios2 && !BR2_xtensa
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
 menuconfig BR2_PACKAGE_QT5
 	bool "Qt5"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	depends on !BR2_ARM_CPU_ARMV4 # needs ARMv5+
+	# no built-in double-conversion support
+	depends on !BR2_arc && !BR2_nios2 && !BR2_xtensa
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_QT5BASE
 	help
@@ -29,31 +37,9 @@ menuconfig BR2_PACKAGE_QT5
 
 if BR2_PACKAGE_QT5
 
-choice
-	prompt "Qt5 version"
-
 config BR2_PACKAGE_QT5_VERSION_LATEST
-	bool "Latest (5.12)"
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
-	depends on !BR2_ARM_CPU_ARMV4 # needs ARMv5+
-	# no built-in double-conversion support
-	depends on !BR2_arc && !BR2_nios2 && !BR2_xtensa
-	help
-	  This option builds Qt 5.12, which is licensed under
-	  (L)GPL-3.0+.
-
-comment "Latest Qt version needs a toolchain w/ gcc >= 4.8"
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
-	depends on !BR2_ARM_CPU_ARMV4
-	depends on !BR2_arc && !BR2_nios2 && !BR2_xtensa
-
-config BR2_PACKAGE_QT5_VERSION_5_6
-	bool "LTS (5.6)"
-	help
-	  This option builds Qt 5.6, which is licensed under
-	  (L)GPL-2.0+.
-
-endchoice
+	bool
+	default y
 
 source "package/qt5/qt53d/Config.in"
 source "package/qt5/qt5base/Config.in"
diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index d94d9cc99f..7805b575f5 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -4,15 +4,9 @@
 #
 ################################################################################
 
-ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5_VERSION_MAJOR = 5.12
 QT5_VERSION = $(QT5_VERSION_MAJOR).7
 QT5_SOURCE_TARBALL_PREFIX = everywhere-src
-else
-QT5_VERSION_MAJOR = 5.6
-QT5_VERSION = $(QT5_VERSION_MAJOR).3
-QT5_SOURCE_TARBALL_PREFIX = opensource-src
-endif
 QT5_SITE = https://download.qt.io/archive/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/submodules
 
 include $(sort $(wildcard package/qt5/*/*.mk))
