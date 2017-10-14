From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Oct 2017 14:27:15 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] libcurl: fix build
	without threads
Message-ID: <20171014150059.7D96981002@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b2609e56d6a4095d1b49e15c09191ac7a3232738
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

When c-ares is not enabled libcurl enables the threaded DNS resolver by
default. Make sure the threaded resolvers is disabled when the toolchain
does not support threads.

Add upstream patch that fixes the configure option for disabling the
threaded resolver.

Fixes:
http://autobuild.buildroot.net/results/39f/39fa63fb2ecb75e4b2521d1ee3dfa357c4e5c594/
http://autobuild.buildroot.net/results/dfd/dfd296086d0d6bed73b92fe2fa4ba5434dddf796/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 10e998e7ccc827c53f3637abb70a06f1521e239e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...confopts.m4-fix-disable-threaded-resolver.patch | 40 ++++++++++++++++++++++
 package/libcurl/libcurl.mk                         |  8 +++++
 2 files changed, 48 insertions(+)

diff --git a/package/libcurl/0001-curl-confopts.m4-fix-disable-threaded-resolver.patch b/package/libcurl/0001-curl-confopts.m4-fix-disable-threaded-resolver.patch
new file mode 100644
index 0000000..c7a563e
--- /dev/null
+++ b/package/libcurl/0001-curl-confopts.m4-fix-disable-threaded-resolver.patch
@@ -0,0 +1,40 @@
+From 3cb4bb6b5fb8a936cb69e2e9ea6a4e692122abb9 Mon Sep 17 00:00:00 2001
+From: Jakub Zakrzewski <slither.jz@gmail.com>
+Date: Tue, 15 Aug 2017 13:21:33 -0400
+Subject: [PATCH] curl-confopts.m4: fix --disable-threaded-resolver
+
+Closes https://github.com/curl/curl/issues/1784
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: commit 3cb4bb6b5fb
+
+ m4/curl-confopts.m4 | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/m4/curl-confopts.m4 b/m4/curl-confopts.m4
+index d77a884d58bd..6dcd0f1a6794 100644
+--- a/m4/curl-confopts.m4
++++ b/m4/curl-confopts.m4
+@@ -37,14 +37,14 @@ AC_HELP_STRING([--enable-threaded-resolver],[Enable threaded resolver])
+ AC_HELP_STRING([--disable-threaded-resolver],[Disable threaded resolver]),
+   OPT_THRES=$enableval)
+   case "$OPT_THRES" in
+-    *)
+-      dnl configure option not specified
+-      want_thres="yes"
+-      ;;
+     no)
+       dnl --disable-threaded-resolver option used
+       want_thres="no"
+       ;;
++    *)
++      dnl configure option not specified
++      want_thres="yes"
++      ;;
+   esac
+   AC_MSG_RESULT([$want_thres])
+ ])
+-- 
+2.14.1
+
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 64110cc..d7f860e 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -14,6 +14,8 @@ LIBCURL_DEPENDENCIES = host-pkgconf \
 LIBCURL_LICENSE = curl
 LIBCURL_LICENSE_FILES = COPYING
 LIBCURL_INSTALL_STAGING = YES
+# Patching m4/curl-confopts.m4
+LIBCURL_AUTORECONF = YES
 
 # We disable NTLM support because it uses fork(), which doesn't work
 # on non-MMU platforms. Moreover, this authentication method is
@@ -22,6 +24,12 @@ LIBCURL_INSTALL_STAGING = YES
 LIBCURL_CONF_OPTS = --disable-manual --disable-ntlm-wb \
 	--enable-hidden-symbols --with-random=/dev/urandom --disable-curldebug
 
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+LIBCURL_CONF_OPTS += --enable-threaded-resolver
+else
+LIBCURL_CONF_OPTS += --disable-threaded-resolver
+endif
+
 ifeq ($(BR2_PACKAGE_LIBCURL_VERBOSE),y)
 LIBCURL_CONF_OPTS += --enable-verbose
 else
