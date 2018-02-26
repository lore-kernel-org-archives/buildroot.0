From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Feb 2018 20:55:52 +0100
Subject: [Buildroot] [git commit] php: fix build on C libraries that don't
 provide AI_IDN
Message-ID: <20180226195727.347C6882C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a7f379203e9db862c0bc63156b0df08460acfe93
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The PHP sockets module now provides access to AI_IDN functionality (by
simply declaring a bunch of constants available from PHP code). AI_IDN
(internationalized domain names) is not supported in uClibc or musl,
which breaks the build.

This commit adds a patch to PHP which makes the use of AI_IDN
conditional, in a way that is identical to what is already done for
AI_ALL. The patch has been submitted upstream.

Fixes:

  http://autobuild.buildroot.net/results/ef040cc45bb2789ead82a8c445db3376e36b5ac7/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...08-ext-sockets-make-AI_IDN-usage-optional.patch | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/package/php/0008-ext-sockets-make-AI_IDN-usage-optional.patch b/package/php/0008-ext-sockets-make-AI_IDN-usage-optional.patch
new file mode 100644
index 0000000000..7ab086865e
--- /dev/null
+++ b/package/php/0008-ext-sockets-make-AI_IDN-usage-optional.patch
@@ -0,0 +1,55 @@
+From 923cab3a5ee112d3de44b5571e73402f1fa3d619 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Mon, 26 Feb 2018 19:06:40 +0100
+Subject: [PATCH] ext/sockets: make AI_IDN usage optional
+
+AI_IDN is not supported by all C libraries (uClibc, musl), so make it
+optional, like AI_ALL.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Upstream-status: https://github.com/php/php-src/pull/3160
+---
+ ext/sockets/config.m4 | 13 +++++++++++++
+ ext/sockets/sockets.c |  2 +-
+ 2 files changed, 14 insertions(+), 1 deletion(-)
+
+diff --git a/ext/sockets/config.m4 b/ext/sockets/config.m4
+index fe7d22a10a..2bf6a2bd11 100644
+--- a/ext/sockets/config.m4
++++ b/ext/sockets/config.m4
+@@ -69,6 +69,19 @@ if test "$PHP_SOCKETS" != "no"; then
+     AC_DEFINE(HAVE_AI_ALL,1,[Whether you have AI_ALL])
+   fi
+ 
++  dnl Check for AI_IDN flag
++  AC_CACHE_CHECK([if getaddrinfo supports AI_IDN],[ac_cv_gai_ai_idn],
++  [
++    AC_TRY_COMPILE([
++#include <netdb.h>
++  ], [int flag = AI_IDN;],
++     ac_cv_gai_ai_idn=yes, ac_cv_gai_ai_idn=no)
++  ])
++
++  if test "$ac_cv_gai_ai_idn" = yes; then
++    AC_DEFINE(HAVE_AI_IDN,1,[Whether you have AI_IDN])
++  fi
++
+   PHP_NEW_EXTENSION([sockets], [sockets.c multicast.c conversions.c sockaddr_conv.c sendrecvmsg.c], [$ext_shared],, -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1)
+   PHP_INSTALL_HEADERS([ext/sockets/], [php_sockets.h])
+ fi
+diff --git a/ext/sockets/sockets.c b/ext/sockets/sockets.c
+index 6db56c2816..ee9651ce09 100644
+--- a/ext/sockets/sockets.c
++++ b/ext/sockets/sockets.c
+@@ -796,7 +796,7 @@ static PHP_MINIT_FUNCTION(sockets)
+ 	REGISTER_LONG_CONSTANT("AI_ALL",			AI_ALL,				CONST_CS | CONST_PERSISTENT);
+ #endif
+ 	REGISTER_LONG_CONSTANT("AI_ADDRCONFIG",		AI_ADDRCONFIG,		CONST_CS | CONST_PERSISTENT);
+-#ifdef __USE_GNU
++#if defined(HAVE_AI_IDN) && defined(__USE_GNU)
+ 	REGISTER_LONG_CONSTANT("AI_IDN",			AI_IDN,				CONST_CS | CONST_PERSISTENT);
+ 	REGISTER_LONG_CONSTANT("AI_CANONIDN",		AI_CANONIDN,		CONST_CS | CONST_PERSISTENT);
+ 	REGISTER_LONG_CONSTANT("AI_IDN_ALLOW_UNASSIGNED",		AI_IDN_ALLOW_UNASSIGNED, CONST_CS | CONST_PERSISTENT);
+-- 
+2.14.3
+
