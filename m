From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 24 Sep 2015 11:20:00 +0100
Subject: [Buildroot] [PATCH] subversion: bump to version 1.9.2
Message-ID: <1443090000-41954-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Bump to version 1.9.2.
- Update the hash file.
- Fix a typo in the berkeley-db configure option.
- Remove non-existent configure options: neon, gssapi and ssl.
- Remove neon dependency: is not needed to build subversion.
- Tweak the 0001-dont-mangle-cflags.patch for the 1.9.2 version.
- Add a new 0002-dont-check-mach-o.patch to remove a configure check for
  Mach-O which breaks the build when cross-compiling.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/subversion/0001-dont-mangle-cflags.patch |   29 +++++----
 package/subversion/0002-dont-check-mach-o.patch  |   71 ++++++++++++++++++++++
 package/subversion/Config.in                     |    2 -
 package/subversion/subversion.hash               |    4 +-
 package/subversion/subversion.mk                 |   10 +--
 5 files changed, 92 insertions(+), 24 deletions(-)
 create mode 100644 package/subversion/0002-dont-check-mach-o.patch

diff --git a/package/subversion/0001-dont-mangle-cflags.patch b/package/subversion/0001-dont-mangle-cflags.patch
index 33370c5..2285758 100644
--- a/package/subversion/0001-dont-mangle-cflags.patch
+++ b/package/subversion/0001-dont-mangle-cflags.patch
@@ -6,23 +6,24 @@ doesn't mangle flags like -mfloat-gprs=double, breaking the build.
 Patch configure instead of configure.ac as subversion currently doesn't
 cleanly autoreconf.
 
+[Vincent: tweaked patch for version 1.9.2]
+
 Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- configure |    4 ++--
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
-Index: subversion-1.7.18/configure
+Index: subversion-1.9.2/configure
 ===================================================================
---- subversion-1.7.18.orig/configure
-+++ subversion-1.7.18/configure
-@@ -19798,8 +19798,8 @@
-       CFLAGS="$CFLAGS -DSVN_DEBUG -DAP_DEBUG"
-   CXXFLAGS="$CXXFLAGS -DSVN_DEBUG -DAP_DEBUG"
+--- subversion-1.9.2.orig/configure
++++ subversion-1.9.2/configure
+@@ -21854,8 +21854,8 @@ ac_compiler_gnu=$ac_cv_c_compiler_gnu
  elif test "$enable_debugging" = "no" ; then
--    CFLAGS="`echo $CFLAGS' ' | $SED -e 's/-g[0-9] //g' | $SED -e 's/-g//g'`"
--    CXXFLAGS="`echo $CXXFLAGS' ' | $SED -e 's/-g[0-9] //g' | $SED -e 's/-g//g'`"
-+    CFLAGS="`echo $CFLAGS' ' | $SED -e 's/-g[0-9]* //g'`"
-+    CXXFLAGS="`echo $CXXFLAGS' ' | $SED -e 's/-g[0-9]* //g'`"
-         CFLAGS="$CFLAGS -DNDEBUG"
-     CXXFLAGS="$CXXFLAGS -DNDEBUG"
+   { $as_echo "$as_me:${as_lineno-$LINENO}: Disabling debugging" >&5
+ $as_echo "$as_me: Disabling debugging" >&6;}
+-  CFLAGS="`echo $CFLAGS' ' | $SED -e 's/-g[0-9] //g' -e 's/-g //g'`"
+-  CXXFLAGS="`echo $CXXFLAGS' ' | $SED -e 's/-g[0-9] //g' -e 's/-g //g'`"
++  CFLAGS="`echo $CFLAGS' ' | $SED -e 's/-g[0-9]* //g'`"
++  CXXFLAGS="`echo $CXXFLAGS' ' | $SED -e 's/-g[0-9]* //g'`"
+     CFLAGS="$CFLAGS -DNDEBUG"
+   CXXFLAGS="$CXXFLAGS -DNDEBUG"
  # elif test "$enable_debugging" = "maybe" ; then
diff --git a/package/subversion/0002-dont-check-mach-o.patch b/package/subversion/0002-dont-check-mach-o.patch
new file mode 100644
index 0000000..ac28d1b
--- /dev/null
+++ b/package/subversion/0002-dont-check-mach-o.patch
@@ -0,0 +1,71 @@
+Don't check for Apple's Mach-O during configure phase
+
+Mach-O is a short for Mach Object file format, which is used by most
+systems based on the Mach Kernel, like NeXTSTEP, OS X, or iOS. [1]
+
+Given that Buildroot only supports Linux kernels, and also given that
+this check breaks the build when cross-compiling...
+
+checking for Mach-O dynamic module iteration functions
+error: cannot run test program while cross compiling
+
+..., it's safe to remove this check from the configure script.
+
+[1] : https://en.wikipedia.org/wiki/Mach-OM
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+
+diff -Nrup a/configure b/configure
+--- a/configure	2015-09-18 14:18:38.000000000 +0100
++++ b/configure	2015-09-24 10:53:36.072364019 +0100
+@@ -19254,50 +19254,6 @@ fi
+ 
+ 
+ 
+-  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for Mach-O dynamic module iteration functions" >&5
+-$as_echo_n "checking for Mach-O dynamic module iteration functions... " >&6; }
+-  if test "$cross_compiling" = yes; then :
+-  { { $as_echo "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
+-$as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
+-as_fn_error $? "cannot run test program while cross compiling
+-See \`config.log' for more details" "$LINENO" 5; }
+-else
+-  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+-/* end confdefs.h.  */
+-
+-    #include <mach-o/dyld.h>
+-    #include <mach-o/loader.h>
+-
+-int
+-main ()
+-{
+-
+-    const struct mach_header *header = _dyld_get_image_header(0);
+-    const char *name = _dyld_get_image_name(0);
+-    if (name && header) return 0;
+-    return 1;
+-
+-  ;
+-  return 0;
+-}
+-_ACEOF
+-if ac_fn_c_try_run "$LINENO"; then :
+-
+-
+-$as_echo "#define SVN_HAVE_MACHO_ITERATE 1" >>confdefs.h
+-
+-    { $as_echo "$as_me:${as_lineno-$LINENO}: result: yes" >&5
+-$as_echo "yes" >&6; }
+-
+-else
+-
+-    { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
+-$as_echo "no" >&6; }
+-
+-fi
+-rm -f core *.core core.conftest.* gmon.out bb.out conftest$ac_exeext \
+-  conftest.$ac_objext conftest.beam conftest.$ac_ext
+-fi
+ 
+ 
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
index b6a0e88..c5a991a 100644
--- a/package/subversion/subversion.hash
+++ b/package/subversion/subversion.hash
@@ -1,2 +1,2 @@
-# From https://mail-archives.apache.org/mod_mbox/subversion-dev/201412.mbox/%3C548F4EEB.7030601 at apache.org%3E
-sha1	bb3cd135bbd856e7f0f2d59313f075b9bbec9848	subversion-1.7.19.tar.gz
+# From http://mail-archives.apache.org/mod_mbox/subversion-dev/201509.mbox/%3CCAP_GPNgyXK9ZGWZ4M2t1dWBSiKEuGbuiRVGw2AF3-MpUZ%3DTRQA%40mail.gmail.com%3E
+sha1 fb9db3b7ddf48ae37aa8785872301b59bfcc7017 subversion-1.9.2.tar.bz2
diff --git a/package/subversion/subversion.mk b/package/subversion/subversion.mk
index 3c6c3f0..551c26d 100644
--- a/package/subversion/subversion.mk
+++ b/package/subversion/subversion.mk
@@ -4,24 +4,22 @@
 #
 ################################################################################
 
-SUBVERSION_VERSION = 1.7.19
+SUBVERSION_VERSION = 1.9.2
+SUBVERSION_SOURCE = subversion-$(SUBVERSION_VERSION).tar.bz2
 SUBVERSION_SITE = http://archive.apache.org/dist/subversion
 SUBVERSION_LICENSE = Apache-2.0
 SUBVERSION_LICENSE_FILES = LICENSE
-SUBVERSION_DEPENDENCIES = host-pkgconf apr apr-util expat neon zlib sqlite
+SUBVERSION_DEPENDENCIES = host-pkgconf apr apr-util expat zlib sqlite
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
-- 
1.7.1
