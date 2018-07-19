From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Jul 2018 23:29:58 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] libcurl: security bump to
 version 7.61.0
Message-ID: <20180719213052.671E289060@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b00859da648b8608ba4f9e90a42a8818d31c29bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Fixes CVE-2018-0500: curl might overflow a heap based memory buffer when
sending data over SMTP and using a reduced read buffer.

Drop upstream patch.

Add reference to tarball signature key.

Drop CRYPTO_lock seed. Removed from configure script since 7.45.

Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit bf79731153d2739580954161547225acb60f65e8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ink-with-ssh2-built-with-a-static-mbedtls.patch | 40 ----------------------
 package/libcurl/libcurl.hash                       |  5 +--
 package/libcurl/libcurl.mk                         |  5 +--
 3 files changed, 4 insertions(+), 46 deletions(-)

diff --git a/package/libcurl/0001-Fix-link-with-ssh2-built-with-a-static-mbedtls.patch b/package/libcurl/0001-Fix-link-with-ssh2-built-with-a-static-mbedtls.patch
deleted file mode 100644
index 9107fa7c8c..0000000000
--- a/package/libcurl/0001-Fix-link-with-ssh2-built-with-a-static-mbedtls.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From b5fbc486e805805efb8400373ccec2a3dee1c81b Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 21 May 2018 12:07:00 +0200
-Subject: [PATCH 1/1] Fix link with ssh2 built with a static mbedtls
-
-The ssh2 pkg-config file could contain the following lines when build
-with a static version of mbedtls:
-   Libs: -L${libdir} -lssh2 /xxx/libmbedcrypto.a
-   Libs.private: /xxx/libmbedcrypto.a
-
-This static mbedtls library must be used to correctly detect ssh2
-support and this library must be copied in libcurl.pc otherwise
-compilation of any application (such as upmpdcli) with libcurl will fail
-when trying to found mbedtls functions included in libssh2.
-So, replace pkg-config --libs-only-l by pkg-config --libs.
-
-Fixes:
- - http://autobuild.buildroot.net/results/43e24b22a77f616d6198c10435dcc23cc3b9088a
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 5569a26b4..9e2606885 100755
---- a/configure.ac
-+++ b/configure.ac
-@@ -2766,7 +2766,7 @@ if test X"$OPT_LIBSSH2" != Xno; then
-     CURL_CHECK_PKGCONFIG(libssh2)
- 
-     if test "$PKGCONFIG" != "no" ; then
--      LIB_SSH2=`$PKGCONFIG --libs-only-l libssh2`
-+      LIB_SSH2=`$PKGCONFIG --libs libssh2`
-       LD_SSH2=`$PKGCONFIG --libs-only-L libssh2`
-       CPP_SSH2=`$PKGCONFIG --cflags-only-I libssh2`
-       version=`$PKGCONFIG --modversion libssh2`
--- 
-2.14.1
-
diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index cb1e6e72f2..9a57153d2b 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,4 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://curl.haxx.se/download/curl-7.60.0.tar.xz.asc
-sha256 8736ff8ded89ddf7e926eec7b16f82597d029fc1469f3a551f1fafaac164e6a0  curl-7.60.0.tar.xz
+# https://curl.haxx.se/download/curl-7.61.0.tar.xz.asc
+# with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
+sha256 ef6e55192d04713673b4409ccbcb4cb6cd723137d6e10ca45b0c593a454e1720  curl-7.61.0.tar.xz
 sha256 5f3849ec38ddb927e79f514bf948890c41b8d1407286a49609b8fb1585931095  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index c77ce79e58..f07a53757c 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.60.0
+LIBCURL_VERSION = 7.61.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.haxx.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
@@ -14,8 +14,6 @@ LIBCURL_DEPENDENCIES = host-pkgconf \
 LIBCURL_LICENSE = curl
 LIBCURL_LICENSE_FILES = COPYING
 LIBCURL_INSTALL_STAGING = YES
-# We're patching configure.ac
-LIBCURL_AUTORECONF = YES
 
 # We disable NTLM support because it uses fork(), which doesn't work
 # on non-MMU platforms. Moreover, this authentication method is
@@ -40,7 +38,6 @@ LIBCURL_CONFIG_SCRIPTS = curl-config
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBCURL_DEPENDENCIES += openssl
-LIBCURL_CONF_ENV += ac_cv_lib_crypto_CRYPTO_lock=yes
 # configure adds the cross openssl dir to LD_LIBRARY_PATH which screws up
 # native stuff during the rest of configure when target == host.
 # Fix it by setting LD_LIBRARY_PATH to something sensible so those libs
