From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Jul 2014 21:51:53 +0200
Subject: [Buildroot] [git commit] libcurl: fix nss related build failure
Message-ID: <20140721195331.4DE8B9D2A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c8da1bce781dddcdc3c56668f22e34929baee0d8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch is a reduced set from upstream (removed RELEASE-NOTES chunk or it
doesn't apply, cosmetic only). Fixes:
http://autobuild.buildroot.net/results/d0b/d0bf614006e7c7de749dcea7abd584f0aa142418/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...nk-curl-to-NSS-libraries-when-NSS-support.patch |   41 ++++++++++++++++++++
 package/libcurl/libcurl.mk                         |    2 +
 2 files changed, 43 insertions(+), 0 deletions(-)

diff --git a/package/libcurl/libcurl-0001-build-link-curl-to-NSS-libraries-when-NSS-support.patch b/package/libcurl/libcurl-0001-build-link-curl-to-NSS-libraries-when-NSS-support.patch
new file mode 100644
index 0000000..a3d579b
--- /dev/null
+++ b/package/libcurl/libcurl-0001-build-link-curl-to-NSS-libraries-when-NSS-support.patch
@@ -0,0 +1,41 @@
+From c6e7cbb94e669b85d3eb8e015ec51d0072112133 Mon Sep 17 00:00:00 2001
+From: Alessandro Ghedini <alessandro@ghedini.me>
+Date: Thu, 17 Jul 2014 14:37:28 +0200
+Subject: [PATCH] build: link curl to NSS libraries when NSS support is enabled
+
+This fixes a build failure on Debian caused by commit
+24c3cdce88f39731506c287cb276e8bf4a1ce393.
+
+Bug: http://curl.haxx.se/mail/lib-2014-07/0209.html
+---
+diff --git a/configure.ac b/configure.ac
+index c3cccfb..b78f56d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -2078,6 +2078,10 @@ if test "$curl_ssl_msg" = "$init_ssl_msg"; then
+       if test "x$USE_NSS" = "xyes"; then
+         AC_MSG_NOTICE([detected NSS version $version])
+ 
++        dnl needed when linking the curl tool without USE_EXPLICIT_LIB_DEPS
++        NSS_LIBS=$addlib
++        AC_SUBST([NSS_LIBS])
++
+         dnl when shared libs were found in a path that the run-time
+         dnl linker doesn't search through, we need to add it to
+         dnl LD_LIBRARY_PATH to prevent further configure tests to fail
+diff --git a/src/Makefile.am b/src/Makefile.am
+index d8c0c7d..f96618e 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -62,7 +62,7 @@ LIBS = $(BLANK_AT_MAKETIME)
+ if USE_EXPLICIT_LIB_DEPS
+ curl_LDADD = $(top_builddir)/lib/libcurl.la @LIBMETALINK_LIBS@ @LIBCURL_LIBS@
+ else
+-curl_LDADD = $(top_builddir)/lib/libcurl.la @LIBMETALINK_LIBS@ @ZLIB_LIBS@ @CURL_NETWORK_AND_TIME_LIBS@
++curl_LDADD = $(top_builddir)/lib/libcurl.la @LIBMETALINK_LIBS@ @NSS_LIBS@ @ZLIB_LIBS@ @CURL_NETWORK_AND_TIME_LIBS@
+ endif
+ 
+ curl_LDFLAGS = @LIBMETALINK_LDFLAGS@
+-- 
+1.8.5.5
+
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index dd693cd..e4ab910 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -14,6 +14,8 @@ LIBCURL_DEPENDENCIES = host-pkgconf \
 LIBCURL_LICENSE = ICS
 LIBCURL_LICENSE_FILES = COPYING
 LIBCURL_INSTALL_STAGING = YES
+# For libcurl-0001-build-link-curl-to-NSS-libraries-when-NSS-support.patch
+LIBCURL_AUTORECONF = YES
 
 # We disable NTLM support because it uses fork(), which doesn't work
 # on non-MMU platforms. Moreover, this authentication method is
