From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun,  5 Oct 2014 23:57:39 +0200
Subject: [Buildroot] [PATCH] libressl: new package
Message-ID: <1412546259-11960-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/Config.in                                  |  1 +
 package/libressl/Config.in                         | 11 ++++++
 ...essl-0001-Fix-unavailable-file-for-uClibc.patch | 40 ++++++++++++++++++++++
 package/libressl/libressl.mk                       | 12 +++++++
 4 files changed, 64 insertions(+)
 create mode 100644 package/libressl/Config.in
 create mode 100644 package/libressl/libressl-0001-Fix-unavailable-file-for-uClibc.patch
 create mode 100644 package/libressl/libressl.mk

diff --git a/package/Config.in b/package/Config.in
index f488728..6bcb3f5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -584,6 +584,7 @@ menu "Crypto"
 	source "package/libsecret/Config.in"
 	source "package/libsha1/Config.in"
 	source "package/libssh2/Config.in"
+	source "package/libressl/Config.in"
 	source "package/nettle/Config.in"
 	source "package/openssl/Config.in"
 	source "package/polarssl/Config.in"
diff --git a/package/libressl/Config.in b/package/libressl/Config.in
new file mode 100644
index 0000000..f7d847d
--- /dev/null
+++ b/package/libressl/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LIBRESSL
+	bool "libressl"
+	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  LibreSSL is a FREE version of the SSL/TLS protocol forked from OpenSSL
+
+	  http://www.libressl.org/
+
+comment "libressl needs a toolchain w/ largefile, threads"
+	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libressl/libressl-0001-Fix-unavailable-file-for-uClibc.patch b/package/libressl/libressl-0001-Fix-unavailable-file-for-uClibc.patch
new file mode 100644
index 0000000..12dffe7
--- /dev/null
+++ b/package/libressl/libressl-0001-Fix-unavailable-file-for-uClibc.patch
@@ -0,0 +1,40 @@
+From aec56aae7650399ae8103c1cff8050c5ea606425 Mon Sep 17 00:00:00 2001
+From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
+Date: Tue, 19 Aug 2014 21:58:15 +0200
+Subject: [PATCH] Fix unavailable file for uClibc
+
+This file is not available for uClibc has it does not implement getauxval().
+As specified in this discution:
+https://github.com/libressl-portable/portable/pull/1
+
+This will never be fixed in libressl, patch have been sent for other
+libc which should work.
+
+Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
+---
+ crypto/compat/issetugid_linux.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/crypto/compat/issetugid_linux.c b/crypto/compat/issetugid_linux.c
+index 669edce..19b2b57 100644
+--- a/crypto/compat/issetugid_linux.c
++++ b/crypto/compat/issetugid_linux.c
+@@ -4,7 +4,6 @@
+  */
+
+ #include <errno.h>
+-#include <gnu/libc-version.h>
+ #include <string.h>
+ #include <sys/types.h>
+ #include <unistd.h>
+@@ -14,6 +13,7 @@
+  * launched setuid/setgid or with additional capabilities.
+  */
+ #ifdef HAVE_GETAUXVAL
++#include <gnu/libc-version.h>
+ #include <sys/auxv.h>
+ #endif
+
+--
+2.0.1
+
diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.mk
new file mode 100644
index 0000000..023d3a6
--- /dev/null
+++ b/package/libressl/libressl.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# libressl
+#
+################################################################################
+
+LIBRESSL_VERSION = 2.0.5
+LIBRESSL_SITE = http://ftp.openbsd.org/pub/OpenBSD/LibreSSL
+LIBRESSL_LICENSE = Apache-1.0, BSD-4c, ISC License, Public Domain
+LIBRESSL_LIBTOOL_PATCH = NO
+
+$(eval $(autotools-package))
-- 
2.1.1
