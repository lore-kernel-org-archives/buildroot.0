From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 5 Oct 2017 22:40:14 +0200
Subject: [Buildroot] [git commit] libcurl: security bump to version 7.56.0
Message-ID: <20171005203341.BEDF680504@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9d95b93e5d36442979cdff7a9f3ee10b1eb9e0c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop upstreamed patch.

Fixes CVE-2017-1000254 - FTP PWD response parser out of bounds read:

https://curl.haxx.se/docs/adv_20171004.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...confopts.m4-fix-disable-threaded-resolver.patch | 40 ----------------------
 package/libcurl/libcurl.hash                       |  4 +--
 package/libcurl/libcurl.mk                         |  4 +--
 3 files changed, 3 insertions(+), 45 deletions(-)

diff --git a/package/libcurl/0001-curl-confopts.m4-fix-disable-threaded-resolver.patch b/package/libcurl/0001-curl-confopts.m4-fix-disable-threaded-resolver.patch
deleted file mode 100644
index c7a563e..0000000
--- a/package/libcurl/0001-curl-confopts.m4-fix-disable-threaded-resolver.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 3cb4bb6b5fb8a936cb69e2e9ea6a4e692122abb9 Mon Sep 17 00:00:00 2001
-From: Jakub Zakrzewski <slither.jz@gmail.com>
-Date: Tue, 15 Aug 2017 13:21:33 -0400
-Subject: [PATCH] curl-confopts.m4: fix --disable-threaded-resolver
-
-Closes https://github.com/curl/curl/issues/1784
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: commit 3cb4bb6b5fb
-
- m4/curl-confopts.m4 | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/m4/curl-confopts.m4 b/m4/curl-confopts.m4
-index d77a884d58bd..6dcd0f1a6794 100644
---- a/m4/curl-confopts.m4
-+++ b/m4/curl-confopts.m4
-@@ -37,14 +37,14 @@ AC_HELP_STRING([--enable-threaded-resolver],[Enable threaded resolver])
- AC_HELP_STRING([--disable-threaded-resolver],[Disable threaded resolver]),
-   OPT_THRES=$enableval)
-   case "$OPT_THRES" in
--    *)
--      dnl configure option not specified
--      want_thres="yes"
--      ;;
-     no)
-       dnl --disable-threaded-resolver option used
-       want_thres="no"
-       ;;
-+    *)
-+      dnl configure option not specified
-+      want_thres="yes"
-+      ;;
-   esac
-   AC_MSG_RESULT([$want_thres])
- ])
--- 
-2.14.1
-
diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index 571526a..c697063 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://curl.haxx.se/download/curl-7.55.1.tar.xz.asc
-sha256 3eafca6e84ecb4af5f35795dee84e643d5428287e88c041122bb8dac18676bb7  curl-7.55.1.tar.xz
+# https://curl.haxx.se/download/curl-7.56.0.tar.xz.asc
+sha256 32437bcca0e9434384329fdc733547879d25ba70335b3cf9e3d9cbc3e71fd172  curl-7.56.0.tar.xz
 sha256 cbcf511f5702f7baf5424193a792bc9c18fab22bcbec2e6a587598389dc632c2  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index d7f860e..a6b699c 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.55.1
+LIBCURL_VERSION = 7.56.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.haxx.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
@@ -14,8 +14,6 @@ LIBCURL_DEPENDENCIES = host-pkgconf \
 LIBCURL_LICENSE = curl
 LIBCURL_LICENSE_FILES = COPYING
 LIBCURL_INSTALL_STAGING = YES
-# Patching m4/curl-confopts.m4
-LIBCURL_AUTORECONF = YES
 
 # We disable NTLM support because it uses fork(), which doesn't work
 # on non-MMU platforms. Moreover, this authentication method is
