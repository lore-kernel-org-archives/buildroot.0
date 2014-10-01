From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 1 Oct 2014 13:59:35 +0200
Subject: [Buildroot] [git commit] rsyslog: bump version
Message-ID: <20141001120417.942EA9D7EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3251b7793f607b162ada8d86aab283e4aa0445e1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To the latest release in the 7.x series. Also remove the two patches now
upstream and add tarball hash.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...yslog-0001-libgcrypt-config-path-override.patch |   48 ------------------
 ...yslog-0002-backport-json-include-path-fix.patch |   52 --------------------
 package/rsyslog/rsyslog.hash                       |    2 +
 package/rsyslog/rsyslog.mk                         |    3 +-
 4 files changed, 3 insertions(+), 102 deletions(-)

diff --git a/package/rsyslog/rsyslog-0001-libgcrypt-config-path-override.patch b/package/rsyslog/rsyslog-0001-libgcrypt-config-path-override.patch
deleted file mode 100644
index c0d8bfa..0000000
--- a/package/rsyslog/rsyslog-0001-libgcrypt-config-path-override.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 86d19e4e63c3fa5b9690991f3e29ffab93990acd Mon Sep 17 00:00:00 2001
-From: Clayton Shotwell <clshotwe@rockwellcollins.com>
-Date: Wed, 19 Mar 2014 08:28:55 -0500
-Subject: [PATCH] configure: Allow overriding of libgcrypt-config
-
-Allow the overriding of the libgcrypt-config path if it is not at
-a standard location.
-
-Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
----
- configure.ac |   14 +++++---------
- 1 file changed, 5 insertions(+), 9 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 314c16e..bf017d2 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -797,22 +797,18 @@ AC_ARG_ENABLE(libgcrypt,
-         [enable_libgcrypt=yes]
- )
- if test "x$enable_libgcrypt" = "xyes"; then
--        AC_CHECK_PROG(
--      	    [HAVE_LIBGCRYPT_CONFIG],
--            [libgcrypt-config],
--            [yes],,,
--            )
--        if test "x${HAVE_LIBGCRYPT_CONFIG}" != "xyes"; then
-+	AC_PATH_PROG([LIBGCRYPT_CONFIG],[libgcrypt-config],[no])
-+        if test "x${LIBGCRYPT_CONFIG}" = "xno"; then
-            AC_MSG_FAILURE([libgcrypt-config not found in PATH])
-         fi
-         AC_CHECK_LIB(
- 		[gcrypt],
-         	[gcry_cipher_open],
--        	[LIBGCRYPT_CFLAGS="`libgcrypt-config --cflags`"
--        	LIBGCRYPT_LIBS="`libgcrypt-config --libs`"
-+        	[LIBGCRYPT_CFLAGS="`${LIBGCRYPT_CONFIG} --cflags`"
-+        	LIBGCRYPT_LIBS="`${LIBGCRYPT_CONFIG} --libs`"
-         	],
-         	[AC_MSG_FAILURE([libgcrypt is missing])],
--        	[`libgcrypt-config --libs --cflags`]
-+        	[`${LIBGCRYPT_CONFIG} --libs --cflags`]
-         	)
- 	AC_DEFINE([ENABLE_LIBGCRYPT], [1], [Indicator that LIBGCRYPT is present])
- fi
--- 
-1.7.9.5
-
diff --git a/package/rsyslog/rsyslog-0002-backport-json-include-path-fix.patch b/package/rsyslog/rsyslog-0002-backport-json-include-path-fix.patch
deleted file mode 100644
index 9d3bc5d..0000000
--- a/package/rsyslog/rsyslog-0002-backport-json-include-path-fix.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-commit 99620810e5245f319986d58a49ff13067814ef5a
-Author: Michael Biebl <biebl@debian.org>
-Date:   Thu Feb 13 23:01:47 2014 +0100
-
-    Fix json includes
-    
-    Rely on the include paths set by json-c.pc instead of hardcoding
-    the include to be <json/json.h> since this breaks with newer versions of
-    json-c where the files are installed in /usr/include/json-c.
-    
-    While at it, remove a duplicate include.
-
-diff --git a/plugins/mmcount/mmcount.c b/plugins/mmcount/mmcount.c
-index 56a4de5..8a40e38 100644
---- a/plugins/mmcount/mmcount.c
-+++ b/plugins/mmcount/mmcount.c
-@@ -30,7 +30,7 @@
- #include <errno.h>
- #include <unistd.h>
- #include <stdint.h>
--#include <json/json.h>
-+#include <json.h>
- #include "conf.h"
- #include "syslogd-types.h"
- #include "srUtils.h"
-diff --git a/plugins/mmsequence/mmsequence.c b/plugins/mmsequence/mmsequence.c
-index 20a8537..47e9d5f 100644
---- a/plugins/mmsequence/mmsequence.c
-+++ b/plugins/mmsequence/mmsequence.c
-@@ -35,7 +35,7 @@
- #include <stdint.h>
- #include <time.h>
- #include <limits.h>
--#include <json/json.h>
-+#include <json.h>
- #include <pthread.h>
- #include "conf.h"
- #include "syslogd-types.h"
-diff --git a/runtime/lookup.c b/runtime/lookup.c
-index bc3b1a9..f2af17b 100644
---- a/runtime/lookup.c
-+++ b/runtime/lookup.c
-@@ -26,8 +26,7 @@
- #include <sys/types.h>
- #include <sys/stat.h>
- #include <fcntl.h>
--#include <json/json.h>
--#include <json/json.h>
-+#include <json.h>
- #include <assert.h>
- 
- #include "rsyslog.h"
diff --git a/package/rsyslog/rsyslog.hash b/package/rsyslog/rsyslog.hash
new file mode 100644
index 0000000..b47932a
--- /dev/null
+++ b/package/rsyslog/rsyslog.hash
@@ -0,0 +1,2 @@
+# From http://www.rsyslog.com/downloads/download-other/
+sha256	45bca1c1ffca6b8260363617897c09baeaf350e8b92c51361d2770375cdf4b34	rsyslog-7.6.5.tar.gz
diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index 67b80ad..ae152d0 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -4,12 +4,11 @@
 #
 ################################################################################
 
-RSYSLOG_VERSION = 7.6.0
+RSYSLOG_VERSION = 7.6.5
 RSYSLOG_SITE = http://rsyslog.com/files/download/rsyslog
 RSYSLOG_LICENSE = GPLv3 LGPLv3 Apache-2.0
 RSYSLOG_LICENSE_FILES = COPYING COPYING.LESSER COPYING.ASL20
 RSYSLOG_DEPENDENCIES = zlib libestr liblogging json-c util-linux host-pkgconf
-RSYSLOG_AUTORECONF = YES
 
 RSYSLOG_CONF_OPT = --disable-testbench \
 		   --enable-cached-man-pages
