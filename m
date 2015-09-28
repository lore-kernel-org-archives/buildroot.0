From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Sep 2015 22:15:45 +0200
Subject: [Buildroot] [git commit] subversion: bump to version 1.9.2
Message-ID: <20150928203720.4733781774@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4965192f60a9d484a91787079122a7f9322a4f82
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Bump to version 1.9.2.
- Update the hash file.
- Use a tar.bz2 tarball to save space and bandwidth.
- Fix a typo in the berkeley-db configure option.
- Remove non-existent configure options: neon, gssapi and ssl.
- Remove neon dependency: is not needed to build subversion.
- Tweak the 0001-dont-mangle-cflags.patch for the 1.9.2 version and to
  patch configure.ac instead of configure.
- Add a new 0002-disable-macos-specific-features.patch to remove a
  configure check for Mach-O (and two more) which breaks the build when
  cross-compiling.
- Enable autoreconf since we are patching the configure.ac.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/subversion/0001-dont-mangle-cflags.patch   |   34 +++++++++-----------
 .../0002-disable-macos-specific-features.patch     |   23 +++++++++++++
 package/subversion/Config.in                       |    2 -
 package/subversion/subversion.hash                 |    4 +-
 package/subversion/subversion.mk                   |   13 +++----
 5 files changed, 46 insertions(+), 30 deletions(-)

diff --git a/package/subversion/0001-dont-mangle-cflags.patch b/package/subversion/0001-dont-mangle-cflags.patch
index 33370c5..adb8b8e 100644
--- a/package/subversion/0001-dont-mangle-cflags.patch
+++ b/package/subversion/0001-dont-mangle-cflags.patch
@@ -1,28 +1,24 @@
-[PATCH] configure: don't mangle CFLAGS
+[PATCH] configure.ac: don't mangle CFLAGS
 
 Ensure that the sed expression to strip debugging options from CFLAGS
 doesn't mangle flags like -mfloat-gprs=double, breaking the build.
 
-Patch configure instead of configure.ac as subversion currently doesn't
-cleanly autoreconf.
+[Vincent: adapt to 1.9.2 and patch configure.ac instead of configure]
 
 Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- configure |    4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 
-Index: subversion-1.7.18/configure
-===================================================================
---- subversion-1.7.18.orig/configure
-+++ subversion-1.7.18/configure
-@@ -19798,8 +19798,8 @@
-       CFLAGS="$CFLAGS -DSVN_DEBUG -DAP_DEBUG"
+diff -Nrup a/configure.ac b/configure.ac
+--- a/configure.ac	2015-07-27 00:03:10.000000000 +0100
++++ b/configure.ac	2015-09-28 10:33:39.175048493 +0100
+@@ -1110,8 +1110,8 @@ if test "$enable_debugging" = "yes" ; th
    CXXFLAGS="$CXXFLAGS -DSVN_DEBUG -DAP_DEBUG"
  elif test "$enable_debugging" = "no" ; then
--    CFLAGS="`echo $CFLAGS' ' | $SED -e 's/-g[0-9] //g' | $SED -e 's/-g//g'`"
--    CXXFLAGS="`echo $CXXFLAGS' ' | $SED -e 's/-g[0-9] //g' | $SED -e 's/-g//g'`"
-+    CFLAGS="`echo $CFLAGS' ' | $SED -e 's/-g[0-9]* //g'`"
-+    CXXFLAGS="`echo $CXXFLAGS' ' | $SED -e 's/-g[0-9]* //g'`"
-         CFLAGS="$CFLAGS -DNDEBUG"
-     CXXFLAGS="$CXXFLAGS -DNDEBUG"
- # elif test "$enable_debugging" = "maybe" ; then
+   AC_MSG_NOTICE([Disabling debugging])
+-  CFLAGS=["`echo $CFLAGS' ' | $SED -e 's/-g[0-9] //g' -e 's/-g //g'`"]
+-  CXXFLAGS=["`echo $CXXFLAGS' ' | $SED -e 's/-g[0-9] //g' -e 's/-g //g'`"]
++  CFLAGS=["`echo $CFLAGS' ' | $SED -e 's/-g[0-9]* //g'`"]
++  CXXFLAGS=["`echo $CXXFLAGS' ' | $SED -e 's/-g[0-9]* //g'`"]
+   dnl Compile with NDEBUG to get rid of assertions
+   CFLAGS="$CFLAGS -DNDEBUG"
+   CXXFLAGS="$CXXFLAGS -DNDEBUG"
diff --git a/package/subversion/0002-disable-macos-specific-features.patch b/package/subversion/0002-disable-macos-specific-features.patch
new file mode 100644
index 0000000..b960ca2
--- /dev/null
+++ b/package/subversion/0002-disable-macos-specific-features.patch
@@ -0,0 +1,23 @@
+Disable Mac OS specific features
+
+We only support Linux so we don't need them. Also, they cause a build
+failure when cross compiling:
+
+checking for Mach-O dynamic module iteration functions
+error: cannot run test program while cross compiling
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+
+diff -Nrup a/configure.ac b/configure.ac
+--- a/configure.ac	2015-09-28 10:33:39.175048493 +0100
++++ b/configure.ac	2015-09-28 10:47:53.921428143 +0100
+@@ -467,9 +467,6 @@ fi
+ 
+ dnl Mac OS specific features -------------------
+ 
+-SVN_LIB_MACHO_ITERATE
+-SVN_LIB_MACOS_PLIST
+-SVN_LIB_MACOS_KEYCHAIN
+ 
+ dnl APR_HAS_DSO -------------------
+ 
diff --git a/package/subversion/Config.in b/package/subversion/Config.in
index 776dad5..61c9d3b 100644
--- a/package/subversion/Config.in
+++ b/package/subversion/Config.in
@@ -6,8 +6,6 @@ config BR2_PACKAGE_SUBVERSION
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU # apr
 	select BR2_PACKAGE_EXPAT
-	select BR2_PACKAGE_NEON
-	select BR2_PACKAGE_NEON_XML
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_SQLITE
 	help
diff --git a/package/subversion/subversion.hash b/package/subversion/subversion.hash
index b6a0e88..7806374 100644
--- a/package/subversion/subversion.hash
+++ b/package/subversion/subversion.hash
@@ -1,2 +1,2 @@
-# From https://mail-archives.apache.org/mod_mbox/subversion-dev/201412.mbox/%3C548F4EEB.7030601 at apache.org%3E
-sha1	bb3cd135bbd856e7f0f2d59313f075b9bbec9848	subversion-1.7.19.tar.gz
+# From http://subversion.apache.org/download.cgi#recommended-release
+sha1 fb9db3b7ddf48ae37aa8785872301b59bfcc7017 subversion-1.9.2.tar.bz2
diff --git a/package/subversion/subversion.mk b/package/subversion/subversion.mk
index 3c6c3f0..2f6a249 100644
--- a/package/subversion/subversion.mk
+++ b/package/subversion/subversion.mk
@@ -4,24 +4,23 @@
 #
 ################################################################################
 
-SUBVERSION_VERSION = 1.7.19
-SUBVERSION_SITE = http://archive.apache.org/dist/subversion
+SUBVERSION_VERSION = 1.9.2
+SUBVERSION_SOURCE = subversion-$(SUBVERSION_VERSION).tar.bz2
+SUBVERSION_SITE = http://mirror.catn.com/pub/apache/subversion
 SUBVERSION_LICENSE = Apache-2.0
 SUBVERSION_LICENSE_FILES = LICENSE
-SUBVERSION_DEPENDENCIES = host-pkgconf apr apr-util expat neon zlib sqlite
+SUBVERSION_DEPENDENCIES = host-pkgconf apr apr-util expat zlib sqlite
+SUBVERSION_AUTORECONF = YES
 SUBVERSION_CONF_OPTS = \
 	--with-expat=$(STAGING_DIR)/usr/include:$(STAGING_DIR)/usr/lib: \
 	--with-apr=$(STAGING_DIR)/usr \
 	--with-apr-util=$(STAGING_DIR)/usr \
 	--with-zlib=$(STAGING_DIR)/usr \
-	--with-neon=$(STAGING_DIR)/usr \
-	--without-gssapi \
 	--without-serf \
 	--without-apxs \
-	--without-berkeyley-db \
+	--without-berkeley-db \
 	--without-sasl \
 	--without-gnome-keyring \
-	--without-ssl \
 	--without-libmagic
 
 $(eval $(autotools-package))
