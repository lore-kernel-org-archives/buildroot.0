From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 11:11:53 +0200
Subject: [Buildroot] [git commit] package/subversion: bump version to 1.12.2
Message-ID: <20191026092037.4CD62882D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f1e48e343a04a7bff4abd5c9c27555cddb71f7e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added dependencies to lz4 and utf8proc.

Replaced the 0002-disable-macos-specific-features.patch by a simpler
patch/workaround that still works after the version bump.

Updated license hash after various upstream commits:
https://github.com/apache/subversion/commits/trunk/LICENSE

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0002-disable-macos-specific-features.patch     | 23 ----------------------
 .../subversion/0002-workaround-ac-run-ifelse.patch | 23 ++++++++++++++++++++++
 package/subversion/Config.in                       |  2 ++
 package/subversion/subversion.hash                 |  6 +++---
 package/subversion/subversion.mk                   |  6 +++++-
 5 files changed, 33 insertions(+), 27 deletions(-)

diff --git a/package/subversion/0002-disable-macos-specific-features.patch b/package/subversion/0002-disable-macos-specific-features.patch
deleted file mode 100644
index b960ca2937..0000000000
--- a/package/subversion/0002-disable-macos-specific-features.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Disable Mac OS specific features
-
-We only support Linux so we don't need them. Also, they cause a build
-failure when cross compiling:
-
-checking for Mach-O dynamic module iteration functions
-error: cannot run test program while cross compiling
-
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-
-diff -Nrup a/configure.ac b/configure.ac
---- a/configure.ac	2015-09-28 10:33:39.175048493 +0100
-+++ b/configure.ac	2015-09-28 10:47:53.921428143 +0100
-@@ -467,9 +467,6 @@ fi
- 
- dnl Mac OS specific features -------------------
- 
--SVN_LIB_MACHO_ITERATE
--SVN_LIB_MACOS_PLIST
--SVN_LIB_MACOS_KEYCHAIN
- 
- dnl APR_HAS_DSO -------------------
- 
diff --git a/package/subversion/0002-workaround-ac-run-ifelse.patch b/package/subversion/0002-workaround-ac-run-ifelse.patch
new file mode 100644
index 0000000000..4f229dc49b
--- /dev/null
+++ b/package/subversion/0002-workaround-ac-run-ifelse.patch
@@ -0,0 +1,23 @@
+build/ac-macros/macosx.m4: workaround AC_RUN_IFELSE
+
+The SVN_LIB_MACHO_ITERATE macro contains an AC_RUN_IFELSE test that
+doesn't work when cross-compiling. However, this macro is related to
+testing Mac OS X APIs, so in the context of Buildroot, we don't care,
+and the test program is not even going to build. So we simply
+workaround this by turning the test into an AC_COMPILE_IFELSE.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+
+Index: b/build/ac-macros/macosx.m4
+===================================================================
+--- a/build/ac-macros/macosx.m4
++++ b/build/ac-macros/macosx.m4
+@@ -24,7 +24,7 @@
+ AC_DEFUN(SVN_LIB_MACHO_ITERATE,
+ [
+   AC_MSG_CHECKING([for Mach-O dynamic module iteration functions])
+-  AC_RUN_IFELSE([AC_LANG_PROGRAM([[
++  AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
+     #include <mach-o/dyld.h>
+     #include <mach-o/loader.h>
+   ]],[[
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
