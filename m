From: Marcin Bis <marcin@bis.org.pl>
Date: Fri, 31 May 2013 17:49:15 +0200
Subject: [Buildroot] [PATCH] ecryptfs-utils: new package
Message-ID: <CAOPBCFV6vC4KRgvLdWFpsB43HisCd-pb5ji0hzqY07qEHo2Evw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

The following patch adds support for ecryptfs-utils.
http://ecryptfs.org/

Signed-off-by: Marcin Bis <marcin@bis.org.pl>
---
 package/Config.in                        |    1 +
 package/ecryptfs-utils/Config.in         |   18 ++++++++++++++++++
 package/ecryptfs-utils/ecryptfs-utils.mk |   25 +++++++++++++++++++++++++
 3 files changed, 44 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index d980871..54711c8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -194,6 +194,7 @@ source "package/cramfs/Config.in"
 source "package/curlftpfs/Config.in"
 source "package/dosfstools/Config.in"
 source "package/e2fsprogs/Config.in"
+source "package/ecryptfs-utils/Config.in"
 source "package/exfat/Config.in"
 source "package/exfat-utils/Config.in"
 source "package/f2fs-tools/Config.in"
diff --git a/package/ecryptfs-utils/Config.in b/package/ecryptfs-utils/Config.in
new file mode 100644
index 0000000..b1b2ec0
--- /dev/null
+++ b/package/ecryptfs-utils/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_ECRYPTFS_UTILS
+    bool "ecryptfs-utils"
+    select BR2_PACKAGE_KEYUTILS
+    select BR2_PACKAGE_LIBNSS
+    help
+      eCryptfs is a POSIX-compliant enterprise cryptographic
+      filesystem for Linux. It is stacked on top of any other
+      Linux filesystem, it stores cryptographic metadata in the header
+      of each file written.
+
+      The eCryptfs kernel module is available in all Linux kernels
+      since version 2.6.19. This package provides userspace utilities
+      needed to mount eCryptfs.
+
+      Files are encrypted using a passphrase. Consider building openssl
+      for another method.
+
+      http://ecryptfs.org
diff --git a/package/ecryptfs-utils/ecryptfs-utils.mk
b/package/ecryptfs-utils/ecryptfs-utils.mk
new file mode 100644
index 0000000..8c656ba
--- /dev/null
+++ b/package/ecryptfs-utils/ecryptfs-utils.mk
@@ -0,0 +1,25 @@
+#############################################################
+#
+# ecryptfs-utils
+#
+##############################################################
+
+ECRYPTFS_UTILS_VERSION         = 103
+ECRYPTFS_UTILS_SOURCE          =
ecryptfs-utils_$(ECRYPTFS_UTILS_VERSION).orig.tar.gz
+ECRYPTFS_UTILS_SITE            =
https://launchpad.net/ecryptfs/trunk/$(ECRYPTFS_UTILS_VERSION)/+download
+ECRYPTFS_UTILS_LICENSE         = GPLv2+
+ECRYPTFS_UTILS_LICENSE_FILES   = COPYING
+
+ECRYPTFS_UTILS_DEPENDENCIES    = keyutils libnss
+ECRYPTFS_UTILS_CONF_OPT        += --disable-pywrap --disable-pam --disable-nls
+
+#Needed for build system to find pk11func.h and libnss3.so
+ECRYPTFS_UTILS_CONF_ENV +=
NSS_CFLAGS="-I$(STAGING_DIR)/usr/include/nss
-I$(STAGING_DIR)/usr/include/nspr" \
+    NSS_LIBS="-lnss3"
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+    #openssl will be found by configure
+    ECRYPTFS_UTILS_DEPENDENCIES += openssl
+endif
+
+$(eval $(autotools-package))
