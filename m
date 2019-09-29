From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 29 Sep 2019 20:34:12 +0200
Subject: [Buildroot] [PATCH 1/1] package/subversion: bump version to 1.12.2
Message-ID: <20190929183412.11686-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added dependencies to lz4 and utf8proc, the latter needs
http://patchwork.ozlabs.org/patch/1169012/

Added patch to fix build error because macos-specific variables were
not addressed by AC_SUBST.

Updated license hash after various upstream commits:
https://github.com/apache/subversion/commits/trunk/LICENSE

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0003-cross-compilation-macos.patch        | 103 ++++++++++++++++++
 package/subversion/Config.in                  |   2 +
 package/subversion/subversion.hash            |   6 +-
 package/subversion/subversion.mk              |   6 +-
 4 files changed, 113 insertions(+), 4 deletions(-)
 create mode 100644 package/subversion/0003-cross-compilation-macos.patch

diff --git a/package/subversion/0003-cross-compilation-macos.patch b/package/subversion/0003-cross-compilation-macos.patch
new file mode 100644
index 0000000000..f8fa21931d
--- /dev/null
+++ b/package/subversion/0003-cross-compilation-macos.patch
@@ -0,0 +1,103 @@
+Disable Mac-specific stuff to prevent build error
+
+Downloaded from
+https://github.com/openwrt/packages/blob/master/net/subversion/patches/301-cross-compilation-macos.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+--- a/build/ac-macros/macosx.m4
++++ b/build/ac-macros/macosx.m4
+@@ -19,80 +19,3 @@ dnl ====================================
+ dnl
+ dnl  Mac OS X specific checks
+ 
+-dnl SVN_LIB_MACHO_ITERATE
+-dnl Check for _dyld_image_name and _dyld_image_header availability
+-AC_DEFUN(SVN_LIB_MACHO_ITERATE,
+-[
+-  AC_MSG_CHECKING([for Mach-O dynamic module iteration functions])
+-  AC_RUN_IFELSE([AC_LANG_PROGRAM([[
+-    #include <mach-o/dyld.h>
+-    #include <mach-o/loader.h>
+-  ]],[[
+-    const struct mach_header *header = _dyld_get_image_header(0);
+-    const char *name = _dyld_get_image_name(0);
+-    if (name && header) return 0;
+-    return 1;
+-  ]])],[
+-    AC_DEFINE([SVN_HAVE_MACHO_ITERATE], [1],
+-              [Is Mach-O low-level _dyld API available?])
+-    AC_MSG_RESULT([yes])
+-  ],[
+-    AC_MSG_RESULT([no])
+-  ])
+-])
+-
+-dnl SVN_LIB_MACOS_PLIST
+-dnl Assign variables for Mac OS property list support
+-AC_DEFUN(SVN_LIB_MACOS_PLIST,
+-[
+-  AC_MSG_CHECKING([for Mac OS property list utilities])
+-
+-  AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
+-    #include <AvailabilityMacros.h>
+-    #if !defined(MAC_OS_X_VERSION_MAX_ALLOWED) \
+-     || !defined(MAC_OS_X_VERSION_10_0) \
+-     || (MAC_OS_X_VERSION_MAX_ALLOWED <= MAC_OS_X_VERSION_10_0)
+-    #error ProperyList API unavailable.
+-    #endif
+-  ]],[[]])],[
+-    SVN_MACOS_PLIST_LIBS="-framework CoreFoundation"
+-    AC_SUBST(SVN_MACOS_PLIST_LIBS)
+-    AC_DEFINE([SVN_HAVE_MACOS_PLIST], [1],
+-              [Is Mac OS property list API available?])
+-    AC_MSG_RESULT([yes])
+-  ],[
+-    AC_MSG_RESULT([no])
+-  ])
+-])
+-
+-dnl SVN_LIB_MACOS_KEYCHAIN
+-dnl Check configure options and assign variables related to Keychain support
+-
+-AC_DEFUN(SVN_LIB_MACOS_KEYCHAIN,
+-[
+-  AC_ARG_ENABLE(keychain,
+-    AS_HELP_STRING([--disable-keychain],
+-    [Disable use of Mac OS KeyChain for auth credentials]),
+-    [enable_keychain=$enableval],[enable_keychain=yes])
+-
+-  AC_MSG_CHECKING([for Mac OS KeyChain Services])
+-
+-  if test "$enable_keychain" = "yes"; then
+-    AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
+-      #include <AvailabilityMacros.h>
+-      #if !defined(MAC_OS_X_VERSION_MAX_ALLOWED) \
+-       || !defined(MAC_OS_X_VERSION_10_2) \
+-       || (MAC_OS_X_VERSION_MAX_ALLOWED <= MAC_OS_X_VERSION_10_2)
+-      #error KeyChain API unavailable.
+-      #endif
+-    ]],[[]])],[
+-      SVN_MACOS_KEYCHAIN_LIBS="-framework Security -framework CoreServices"
+-      AC_SUBST(SVN_MACOS_KEYCHAIN_LIBS)
+-      AC_DEFINE([SVN_HAVE_KEYCHAIN_SERVICES], [1], [Is Mac OS KeyChain support enabled?])
+-      AC_MSG_RESULT([yes])
+-    ],[
+-      enable_keychain=no
+-      AC_MSG_RESULT([no])
+-    ])
+-  fi
+-])
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -56,8 +56,8 @@ SVN_XML_LIBS = @SVN_XML_LIBS@
+ SVN_ZLIB_LIBS = @SVN_ZLIB_LIBS@
+ SVN_LZ4_LIBS = @SVN_LZ4_LIBS@
+ SVN_UTF8PROC_LIBS = @SVN_UTF8PROC_LIBS@
+-SVN_MACOS_PLIST_LIBS = @SVN_MACOS_PLIST_LIBS@
+-SVN_MACOS_KEYCHAIN_LIBS = @SVN_MACOS_KEYCHAIN_LIBS@
++SVN_MACOS_PLIST_LIBS =
++SVN_MACOS_KEYCHAIN_LIBS =
+ 
+ LIBS = @LIBS@
+ 
diff --git a/package/subversion/Config.in b/package/subversion/Config.in
index ecac51814e..43e7dcca33 100644
--- a/package/subversion/Config.in
+++ b/package/subversion/Config.in
@@ -6,6 +6,8 @@ config BR2_PACKAGE_SUBVERSION
 	select BR2_PACKAGE_APR
 	select BR2_PACKAGE_APR_UTIL
 	select BR2_PACKAGE_EXPAT
+	select BR2_PACKAGE_LZ4
+	select BR2_PACKAGE_UTF8PROC
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_SQLITE
 	help
diff --git a/package/subversion/subversion.hash b/package/subversion/subversion.hash
index 7f94631f89..581834f98d 100644
--- a/package/subversion/subversion.hash
+++ b/package/subversion/subversion.hash
@@ -1,5 +1,5 @@
-# From https://www.apache.org/dist/subversion/subversion-1.9.10.tar.bz2.sha512
-sha512 08a5c6c0233cc1dbd992180d2077eb1c67725682c457d3f67ebb6d22db0f6b64002a699ab828d435b708340ce6fb07bb1f03d11daefb887053c427ed75ad2de7 subversion-1.9.12.tar.bz2
+# From https://www.apache.org/dist/subversion/subversion-1.12.2.tar.bz2.sha512
+sha512 b1f859b460afa54598778d8633f648acb4fa46138f7d6f0c1451e3c6a1de71df859233cd9ac7f19f0f20d7237ed3988f0a38da7552ffa58391e19d957bc7c136 subversion-1.12.2.tar.bz2
 
 # Locally calculated
-sha256 3202942c1aba495fd17390618dedc1d3542815c5bc11958da7fd98c985abc11a LICENSE
+sha256 484aff0cfbb81155a10f903ed756e27e9fc65578c245a295bae295c4bb51eaad LICENSE
diff --git a/package/subversion/subversion.mk b/package/subversion/subversion.mk
index 1013f1fc55..2044a6420f 100644
--- a/package/subversion/subversion.mk
+++ b/package/subversion/subversion.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUBVERSION_VERSION = 1.9.12
+SUBVERSION_VERSION = 1.12.2
 SUBVERSION_SOURCE = subversion-$(SUBVERSION_VERSION).tar.bz2
 SUBVERSION_SITE = http://mirror.catn.com/pub/apache/subversion
 SUBVERSION_LICENSE = Apache-2.0
@@ -14,6 +14,8 @@ SUBVERSION_DEPENDENCIES = \
 	apr \
 	apr-util \
 	expat \
+	lz4 \
+	utf8proc \
 	zlib \
 	sqlite \
 	$(TARGET_NLS_DEPENDENCIES)
@@ -22,6 +24,8 @@ SUBVERSION_CONF_OPTS = \
 	--with-expat=$(STAGING_DIR)/usr/include:$(STAGING_DIR)/usr/lib: \
 	--with-apr=$(STAGING_DIR)/usr \
 	--with-apr-util=$(STAGING_DIR)/usr \
+	--with-lz4=$(STAGING_DIR)/usr \
+	--with-utf8proc=$(STAGING_DIR)/usr \
 	--with-zlib=$(STAGING_DIR)/usr \
 	--without-serf \
 	--without-apxs \
-- 
2.20.1
