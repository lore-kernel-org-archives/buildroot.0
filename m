From: Rodrigo Rebello <rprebello@gmail.com>
Date: Tue, 21 Mar 2017 00:45:53 -0300
Subject: [Buildroot] [PATCH] irssi: add patch to fix static linking
Message-ID: <20170321034553.5357-1-rprebello@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

An upstream change which removed the option to build Irssi without SSL
support (v1.0.0 and later) also eliminated the use of PKG_CHECK_MODULES
to find the OpenSSL library, relying only on a test with AC_CHECK_LIB
for that purpose.

This unfortunately broke static linking since the flag to link with
zlib, used by OpenSSL, is missed completely.

The newly added patch therefore adds PKG_CHECK_MODULES back into the
configure script.

Fixes:

  http://autobuild.buildroot.net/results/e8b51f65525246d1205a26859d418393aaebf48c/
  http://autobuild.buildroot.net/results/35d952b3b36e295723bf8ed1badb4c9439201822/
  http://autobuild.buildroot.net/results/ea8af1458edf3ce0e2b1c444d2ae29ac1e5d2fbf/
  [...]

Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
---
 ...-to-using-pkg-config-to-check-for-OpenSSL.patch | 77 ++++++++++++++++++++++
 package/irssi/irssi.mk                             |  3 +
 2 files changed, 80 insertions(+)
 create mode 100644 package/irssi/0001-Get-back-to-using-pkg-config-to-check-for-OpenSSL.patch

diff --git a/package/irssi/0001-Get-back-to-using-pkg-config-to-check-for-OpenSSL.patch b/package/irssi/0001-Get-back-to-using-pkg-config-to-check-for-OpenSSL.patch
new file mode 100644
index 000000000..0ce44f935
--- /dev/null
+++ b/package/irssi/0001-Get-back-to-using-pkg-config-to-check-for-OpenSSL.patch
@@ -0,0 +1,77 @@
+From ed0c2c1b9504a99a6dcc3c0f5de3b3a1c0232758 Mon Sep 17 00:00:00 2001
+From: Rodrigo Rebello <rprebello@gmail.com>
+Date: Mon, 20 Mar 2017 13:17:42 -0300
+Subject: [PATCH] Get back to using pkg-config to check for OpenSSL
+
+Commit 6300dfec7 removed the option to disable SSL support from the
+configure script since it became a requirement, but it also removed the
+use of pkg-config for finding the OpenSSL library and its dependencies.
+
+This had the unfortunate consequence of breaking the correct detection
+of library flags in many static linking scenarios. In some cases, for
+example, OpenSSL might have been built with zlib, which requires `-lz`
+to be passed to the linker when doing a static link of the irssi
+executable. Thus, pkg-config becomes an invaluable tool in such
+situations, since no guessing work is needed as the OpenSSL .pc file
+provides all the necessary flags.
+
+So, this patch re-inserts the PKG_CHECK_MODULES macro in the configure
+script when looking for OpenSSL. The test using AC_CHECK_LIB remains,
+but only as a last resort in case the one using pkg-config fails.
+
+Also, because the macro AM_PATH_GLIB_2_0 contains an unconditional call
+to PKG_PROG_PKG_CONFIG, the OpenSSL checks are moved so that they come
+after the Glib ones in order to avoid doubly checking for the pkg-config
+binary (PKG_CHECK_MODULES skips that check if it has been performed
+before, but PKG_PROG_PKG_CONFIG does not).
+
+Upstream status: submitted
+https://github.com/irssi/irssi/pull/677
+
+Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
+---
+ configure.ac | 21 +++++++++++++++------
+ 1 file changed, 15 insertions(+), 6 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 02b33497..9f191d3f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -231,11 +231,6 @@ if test "x$want_socks" = "xyes"; then
+ fi
+ 
+ dnl **
+-dnl ** OpenSSL checks
+-dnl **
+-AC_CHECK_LIB([ssl], [SSL_library_init])
+-
+-dnl **
+ dnl ** fe-text checks
+ dnl **
+ 
+@@ -276,7 +271,21 @@ if test -z "$GLIB_LIBS"; then
+   AC_ERROR([GLIB is required to build irssi.])
+ fi
+ 
+-LIBS="$LIBS $GLIB_LIBS -lssl -lcrypto"
++LIBS="$LIBS $GLIB_LIBS"
++
++dnl **
++dnl ** OpenSSL checks
++dnl **
++PKG_CHECK_MODULES([OPENSSL], [openssl], [
++	CFLAGS="$CFLAGS $OPENSSL_CFLAGS"
++	LIBS="$LIBS $OPENSSL_LIBS"
++], [
++	AC_CHECK_LIB([ssl], [SSL_library_init], [
++		LIBS="$LIBS -lssl -lcrypto"
++	], [
++		AC_MSG_ERROR([The OpenSSL library was not found])
++	])
++])
+ 
+ dnl **
+ dnl ** curses checks
+-- 
+2.11.0
+
diff --git a/package/irssi/irssi.mk b/package/irssi/irssi.mk
index 7df7bbc44..dfb1e2878 100644
--- a/package/irssi/irssi.mk
+++ b/package/irssi/irssi.mk
@@ -13,6 +13,9 @@ IRSSI_LICENSE = GPLv2+
 IRSSI_LICENSE_FILES = COPYING
 IRSSI_DEPENDENCIES = host-pkgconf libglib2 ncurses openssl
 
+# We're patching configure.ac, so we need to autoreconf
+IRSSI_AUTORECONF = YES
+
 IRSSI_CONF_OPTS = \
 	--disable-glibtest \
 	--with-ncurses=$(STAGING_DIR)/usr \
-- 
2.11.0
