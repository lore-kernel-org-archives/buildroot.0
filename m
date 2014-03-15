From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Mar 2014 23:53:02 +0100
Subject: [Buildroot] [git commit] rsyslog: bump to version 7.6.0
Message-ID: <20140315225330.D1D449BF9F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9b4696a49f35d64dfae5bcdc11a5a6fb2d0a76cf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bumping version of rsyslog and adding new dependencies of liblogging
and libestr.  The first patch has be submitted to the upstream mailing
list and the second patch is a backport from the development branch of
the upstream.

[Peter: needs libuuid / host-pkgconf, fix comment]
Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rsyslog/Config.in                          |   12 +++++
 ...yslog-0001-libgcrypt-config-path-override.patch |   44 +++++++++++++++++
 ...yslog-0002-backport-json-include-path-fix.patch |   52 ++++++++++++++++++++
 package/rsyslog/rsyslog.mk                         |   28 +++++++++--
 4 files changed, 132 insertions(+), 4 deletions(-)

diff --git a/package/rsyslog/Config.in b/package/rsyslog/Config.in
index 2503f71..8a84fea 100644
--- a/package/rsyslog/Config.in
+++ b/package/rsyslog/Config.in
@@ -1,6 +1,18 @@
 config BR2_PACKAGE_RSYSLOG
 	bool "rsyslog"
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_LIBESTR
+	select BR2_PACKAGE_LIBLOGGING
+	select BR2_PACKAGE_JSON_C
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_LARGEFILE # util-linux
+	depends on BR2_USE_WCHAR # util-linux
 	help
 	  Rsyslog is a powerful and flexible syslog implementation
 
 	  http://www.rsyslog.com
+
+comment "rsyslog needs a toolchain w/ largefile, wchar, threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE || !BR2_USE_WCHAR
diff --git a/package/rsyslog/rsyslog-0001-libgcrypt-config-path-override.patch b/package/rsyslog/rsyslog-0001-libgcrypt-config-path-override.patch
new file mode 100644
index 0000000..6af0db7
--- /dev/null
+++ b/package/rsyslog/rsyslog-0001-libgcrypt-config-path-override.patch
@@ -0,0 +1,44 @@
+From 2d498883b19c386abacffca969eb404c9407a8cc Mon Sep 17 00:00:00 2001
+From: Clayton Shotwell <clshotwe@rockwellcollins.com>
+Date: Mon, 10 Mar 2014 14:40:35 -0500
+Subject: [PATCH] configure: Allow overriding of libgcrypt-config
+
+Allow the overriding of the libgcrypt-config path if it is not at
+a standard location.
+
+Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
+---
+ configure.ac |   12 ++++--------
+ 1 file changed, 4 insertions(+), 8 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 9643b84..7eb7712 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -820,19 +820,15 @@ AC_ARG_ENABLE(libgcrypt,
+         [enable_libgcrypt=yes]
+ )
+ if test "x$enable_libgcrypt" = "xyes"; then
+-        AC_CHECK_PROG(
+-      	    [HAVE_LIBGCRYPT_CONFIG],
+-            [libgcrypt-config],
+-            [yes],,,
+-            )
+-        if test "x${HAVE_LIBGCRYPT_CONFIG}" != "xyes"; then
++	AC_PATH_PROG(LIBGCRYPT_CONFIG,libgcrypt-config)
++        if test "x${LIBGCRYPT_CONFIG}" == "x"; then
+            AC_MSG_FAILURE([libgcrypt-config not found in PATH])
+         fi
+         AC_CHECK_LIB(
+ 		[gcrypt],
+         	[gcry_cipher_open],
+-        	[LIBGCRYPT_CFLAGS="`libgcrypt-config --cflags`"
+-        	LIBGCRYPT_LIBS="`libgcrypt-config --libs`"
++        	[LIBGCRYPT_CFLAGS="`${LIBGCRYPT_CONFIG} --cflags`"
++        	LIBGCRYPT_LIBS="`${LIBGCRYPT_CONFIG} --libs`"
+         	],
+         	[AC_MSG_FAILURE([libgcrypt is missing])],
+         	[`libgcrypt-config --libs --cflags`]
+-- 
+1.7.9.5
+
diff --git a/package/rsyslog/rsyslog-0002-backport-json-include-path-fix.patch b/package/rsyslog/rsyslog-0002-backport-json-include-path-fix.patch
new file mode 100644
index 0000000..9d3bc5d
--- /dev/null
+++ b/package/rsyslog/rsyslog-0002-backport-json-include-path-fix.patch
@@ -0,0 +1,52 @@
+commit 99620810e5245f319986d58a49ff13067814ef5a
+Author: Michael Biebl <biebl@debian.org>
+Date:   Thu Feb 13 23:01:47 2014 +0100
+
+    Fix json includes
+    
+    Rely on the include paths set by json-c.pc instead of hardcoding
+    the include to be <json/json.h> since this breaks with newer versions of
+    json-c where the files are installed in /usr/include/json-c.
+    
+    While at it, remove a duplicate include.
+
+diff --git a/plugins/mmcount/mmcount.c b/plugins/mmcount/mmcount.c
+index 56a4de5..8a40e38 100644
+--- a/plugins/mmcount/mmcount.c
++++ b/plugins/mmcount/mmcount.c
+@@ -30,7 +30,7 @@
+ #include <errno.h>
+ #include <unistd.h>
+ #include <stdint.h>
+-#include <json/json.h>
++#include <json.h>
+ #include "conf.h"
+ #include "syslogd-types.h"
+ #include "srUtils.h"
+diff --git a/plugins/mmsequence/mmsequence.c b/plugins/mmsequence/mmsequence.c
+index 20a8537..47e9d5f 100644
+--- a/plugins/mmsequence/mmsequence.c
++++ b/plugins/mmsequence/mmsequence.c
+@@ -35,7 +35,7 @@
+ #include <stdint.h>
+ #include <time.h>
+ #include <limits.h>
+-#include <json/json.h>
++#include <json.h>
+ #include <pthread.h>
+ #include "conf.h"
+ #include "syslogd-types.h"
+diff --git a/runtime/lookup.c b/runtime/lookup.c
+index bc3b1a9..f2af17b 100644
+--- a/runtime/lookup.c
++++ b/runtime/lookup.c
+@@ -26,8 +26,7 @@
+ #include <sys/types.h>
+ #include <sys/stat.h>
+ #include <fcntl.h>
+-#include <json/json.h>
+-#include <json/json.h>
++#include <json.h>
+ #include <assert.h>
+ 
+ #include "rsyslog.h"
diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index daae010..c124c02 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -4,21 +4,41 @@
 #
 ################################################################################
 
-RSYSLOG_VERSION = 5.8.0
+RSYSLOG_VERSION = 7.6.0
 RSYSLOG_SITE = http://rsyslog.com/files/download/rsyslog/
-RSYSLOG_DEPENDENCIES = zlib
+RSYSLOG_LICENSE = GPLv3 LGPLv3 Apache-2.0
+RSYSLOG_LICENSE_FILES = COPYING COPYING.LESSER COPYING.ASL20
+RSYSLOG_DEPENDENCIES = zlib libestr liblogging json-c util-linux host-pkgconf
+RSYSLOG_AUTORECONF = YES
+
+RSYSLOG_CONF_OPT = --disable-testbench \
+		   --enable-cached-man-pages
 
 # Build after Busybox
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 	RSYSLOG_DEPENDENCIES += busybox
 endif
 
-define RSYSLOG_INSTALL_CONF_SCRIPT
+ifeq ($(BR2_PACKAGE_LIBEE),y)
+	RSYSLOG_DEPENDENCIES += libee
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
+	RSYSLOG_CONF_ENV += LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
+	RSYSLOG_CONF_OPT += --enable-libgcrypt=yes
+else
+	RSYSLOG_CONF_OPT += --enable-libgcrypt=no
+endif
+
+define RSYSLOG_INSTALL_INIT_SYSV
 	[ -f $(TARGET_DIR)/etc/init.d/S01rsyslog ] || \
 		$(INSTALL) -m 0755 -D package/rsyslog/S01rsyslog \
 			$(TARGET_DIR)/etc/init.d/S01rsyslog
+endef
+
+define RSYSLOG_INSTALL_CONF_SCRIPT
 	[ -f $(TARGET_DIR)/etc/rsyslog.conf ] || \
-		$(INSTALL) -m 0644 -D $(@D)/rsyslog.conf \
+		$(INSTALL) -m 0644 -D $(@D)/platform/redhat/rsyslog.conf \
 			$(TARGET_DIR)/etc/rsyslog.conf
 	mkdir -p $(TARGET_DIR)/etc/rsyslog.d
 endef
