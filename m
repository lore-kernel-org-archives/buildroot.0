From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  2 Feb 2017 08:27:48 +0100
Subject: [Buildroot] [PATCH 30/38] package/kodi-screensaver-rsxs: bump
	version
In-Reply-To: <20170202072756.6624-1-bernd.kuhls@t-online.de>
References: <20170202072756.6624-1-bernd.kuhls@t-online.de>
Message-ID: <20170202072756.6624-30-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ac_cv_type__Bool=yes is needed to fix compilation with gcc >= 5.
Added patch to fix X.org includes.
Added dependency for libpng previously provided by Kodi.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../kodi-screensaver-rsxs/0001-cross-compile.patch |  2 +-
 .../0002-fix-default-include-dir.patch             | 28 ++++++++++++++++++++++
 package/kodi-screensaver-rsxs/Config.in            |  1 +
 .../kodi-screensaver-rsxs.hash                     |  2 +-
 .../kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk |  5 ++--
 5 files changed, 33 insertions(+), 5 deletions(-)
 create mode 100644 package/kodi-screensaver-rsxs/0002-fix-default-include-dir.patch

diff --git a/package/kodi-screensaver-rsxs/0001-cross-compile.patch b/package/kodi-screensaver-rsxs/0001-cross-compile.patch
index 56c2f4e4b..a7b2053d7 100644
--- a/package/kodi-screensaver-rsxs/0001-cross-compile.patch
+++ b/package/kodi-screensaver-rsxs/0001-cross-compile.patch
@@ -27,7 +27,7 @@ diff -uNr screensavers.rsxs-195e0ec3fbbcb2ee2012cd560e42d05167f0f259.org/CMakeLi
  endif()
  externalproject_add(rsxs SOURCE_DIR ${PROJECT_SOURCE_DIR}/${rsxs_dir}
 -                    CONFIGURE_COMMAND ${configure_start}
-+                    CONFIGURE_COMMAND gl_cv_func_gettimeofday_clobber=no
++                    CONFIGURE_COMMAND gl_cv_func_gettimeofday_clobber=no ac_cv_type__Bool=yes
 +                                      ac_cv_func_malloc_0_nonnull=yes
 +                                      ${configure_start}
                                        --prefix=<INSTALL_DIR>
diff --git a/package/kodi-screensaver-rsxs/0002-fix-default-include-dir.patch b/package/kodi-screensaver-rsxs/0002-fix-default-include-dir.patch
new file mode 100644
index 000000000..a7e7c74b0
--- /dev/null
+++ b/package/kodi-screensaver-rsxs/0002-fix-default-include-dir.patch
@@ -0,0 +1,28 @@
+Fix X include path to prevent error during configure
+
+Downloaded from
+https://github.com/LibreELEC/LibreELEC.tv/blob/master/packages/mediacenter/kodi-binary-addons/screensavers.rsxs/patches/screensavers.rsxs-0002-fix-default-include-dir.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -Naur screensavers.rsxs-3241d29.orig/CMakeLists.txt screensavers.rsxs-3241d29/CMakeLists.txt
+--- screensavers.rsxs-3241d29.orig/CMakeLists.txt	2015-10-22 23:59:38.187280475 -0700
++++ screensavers.rsxs-3241d29/CMakeLists.txt	2015-10-23 00:00:27.228113829 -0700
+@@ -17,7 +17,7 @@
+ include_directories(${OpenGL_INCLUDE_DIR}
+                     ${PNG_INCLUDE_DIR}
+                     ${KODI_INCLUDE_DIR}
+-                    ${X_INCLUDE_DIRS}
++                    ${X_INCLUDE_DIR}
+                     ${CMAKE_BINARY_DIR}/rsxs-prefix/src/rsxs-build
+                     ${PROJECT_SOURCE_DIR}/${rsxs_dir}/src
+                     ${PROJECT_SOURCE_DIR}/${rsxs_dir}/lib
+@@ -67,7 +67,7 @@
+                                       --disable-skyrocket
+                                       --disable-solarwinds
+                                       --disable-sound
+-                                      --x-includes=${X_INCLUDE_DIRS}
++                                      --x-includes=${X_INCLUDE_DIR}
+                                       --x-libraries=${X_LIBRARIES}
+                                       ${PNG_PATH}
+                                       ${EXTRA_FLAGS}
diff --git a/package/kodi-screensaver-rsxs/Config.in b/package/kodi-screensaver-rsxs/Config.in
index 11546ad1f..c523ce5a1 100644
--- a/package/kodi-screensaver-rsxs/Config.in
+++ b/package/kodi-screensaver-rsxs/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_KODI_SCREENSAVER_RSXS
 	bool "kodi-screensaver-rsxs"
 	depends on BR2_PACKAGE_HAS_LIBGL # libglu
 	depends on BR2_PACKAGE_XORG7 # xlib_libXmu
+	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_XLIB_LIBXMU
 	help
 	  RSXS screensaver add-ons for Kodi
diff --git a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash
index 568b44b37..66d79a06f 100644
--- a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash
+++ b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 0797ffb720056ea2e04ac8b7ee4fc2dca1e42611ef138b347e928d8d7f3c696f kodi-screensaver-rsxs-195e0ec3fbbcb2ee2012cd560e42d05167f0f259.tar.gz
+sha256 8436c29d2f42bc65ff6f1abc2f1d05a613cc2ebb16d793e02b1f2bee296952a6  kodi-screensaver-rsxs-v1.3.0.tar.gz
diff --git a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
index 7df6c22ce..8ae899b6d 100644
--- a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
+++ b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
@@ -4,11 +4,10 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_RSXS_VERSION = 195e0ec3fbbcb2ee2012cd560e42d05167f0f259
+KODI_SCREENSAVER_RSXS_VERSION = v1.3.0
 KODI_SCREENSAVER_RSXS_SITE = $(call github,notspiff,screensavers.rsxs,$(KODI_SCREENSAVER_RSXS_VERSION))
 KODI_SCREENSAVER_RSXS_LICENSE = GPLv3
 KODI_SCREENSAVER_RSXS_LICENSE_FILES = lib/rsxs-1.0/COPYING
-
-KODI_SCREENSAVER_RSXS_DEPENDENCIES = kodi xlib_libXmu
+KODI_SCREENSAVER_RSXS_DEPENDENCIES = kodi libpng xlib_libXmu
 
 $(eval $(cmake-package))
-- 
2.11.0
