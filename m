From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 10 Sep 2014 12:21:31 -0300
Subject: [Buildroot] [PATCH] libcurl: security bump to version 7.38.0
Message-ID: <1410362491-29991-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
CVE-2014-3613 cookie leak with IP address as domain
CVE-2014-3620 cookie leak for TLDs

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...nk-curl-to-NSS-libraries-when-NSS-support.patch | 41 ----------------------
 package/libcurl/libcurl.mk                         |  2 +-
 2 files changed, 1 insertion(+), 42 deletions(-)
 delete mode 100644 package/libcurl/libcurl-0001-build-link-curl-to-NSS-libraries-when-NSS-support.patch

diff --git a/package/libcurl/libcurl-0001-build-link-curl-to-NSS-libraries-when-NSS-support.patch b/package/libcurl/libcurl-0001-build-link-curl-to-NSS-libraries-when-NSS-support.patch
deleted file mode 100644
index a3d579b..0000000
--- a/package/libcurl/libcurl-0001-build-link-curl-to-NSS-libraries-when-NSS-support.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From c6e7cbb94e669b85d3eb8e015ec51d0072112133 Mon Sep 17 00:00:00 2001
-From: Alessandro Ghedini <alessandro@ghedini.me>
-Date: Thu, 17 Jul 2014 14:37:28 +0200
-Subject: [PATCH] build: link curl to NSS libraries when NSS support is enabled
-
-This fixes a build failure on Debian caused by commit
-24c3cdce88f39731506c287cb276e8bf4a1ce393.
-
-Bug: http://curl.haxx.se/mail/lib-2014-07/0209.html
----
-diff --git a/configure.ac b/configure.ac
-index c3cccfb..b78f56d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -2078,6 +2078,10 @@ if test "$curl_ssl_msg" = "$init_ssl_msg"; then
-       if test "x$USE_NSS" = "xyes"; then
-         AC_MSG_NOTICE([detected NSS version $version])
- 
-+        dnl needed when linking the curl tool without USE_EXPLICIT_LIB_DEPS
-+        NSS_LIBS=$addlib
-+        AC_SUBST([NSS_LIBS])
-+
-         dnl when shared libs were found in a path that the run-time
-         dnl linker doesn't search through, we need to add it to
-         dnl LD_LIBRARY_PATH to prevent further configure tests to fail
-diff --git a/src/Makefile.am b/src/Makefile.am
-index d8c0c7d..f96618e 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -62,7 +62,7 @@ LIBS = $(BLANK_AT_MAKETIME)
- if USE_EXPLICIT_LIB_DEPS
- curl_LDADD = $(top_builddir)/lib/libcurl.la @LIBMETALINK_LIBS@ @LIBCURL_LIBS@
- else
--curl_LDADD = $(top_builddir)/lib/libcurl.la @LIBMETALINK_LIBS@ @ZLIB_LIBS@ @CURL_NETWORK_AND_TIME_LIBS@
-+curl_LDADD = $(top_builddir)/lib/libcurl.la @LIBMETALINK_LIBS@ @NSS_LIBS@ @ZLIB_LIBS@ @CURL_NETWORK_AND_TIME_LIBS@
- endif
- 
- curl_LDFLAGS = @LIBMETALINK_LDFLAGS@
--- 
-1.8.5.5
-
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index e4ab910..610efc1 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.37.1
+LIBCURL_VERSION = 7.38.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.bz2
 LIBCURL_SITE = http://curl.haxx.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
-- 
1.8.5.5
