From: Marcin Bis <marcin@bis.org.pl>
Date: Fri, 31 May 2013 22:12:55 +0200
Subject: [Buildroot] [PATCH v2] ecryptfs-utils: new package
In-Reply-To: <20130531202622.6576897d@skate>
References: <20130531202622.6576897d@skate>
Message-ID: <1370031175-31230-1-git-send-email-marcin@bis.org.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following patch adds support for ecryptfs-utils.
http://ecryptfs.org/

Signed-off-by: Marcin Bis <marcin@bis.org.pl>
---
 package/Config.in                        |    1 +
 package/ecryptfs-utils/Config.in         |   22 ++++++++++++++++++++++
 package/ecryptfs-utils/ecryptfs-utils.mk |   28 ++++++++++++++++++++++++++++
 3 files changed, 51 insertions(+), 0 deletions(-)
 create mode 100644 package/ecryptfs-utils/Config.in
 create mode 100644 package/ecryptfs-utils/ecryptfs-utils.mk

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
index 0000000..8f89e75
--- /dev/null
+++ b/package/ecryptfs-utils/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_ECRYPTFS_UTILS
+	bool "ecryptfs-utils"
+	select BR2_PACKAGE_KEYUTILS
+	select BR2_PACKAGE_LIBNSS
+	depends on BR2_USE_MMU # keyutils
+	depends on !BR2_avr32 && !BR2_microblaze # keyutils
+	depends on BR2_LARGEFILE # libnss
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libnss -> libnspr
+	help
+	  eCryptfs is a POSIX-compliant enterprise cryptographic
+	  filesystem for Linux. It is stacked on top of any other
+	  Linux filesystem, it stores cryptographic metadata in the header
+	  of each file written.
+	  
+	  The eCryptfs kernel module is available in all Linux kernels
+	  since version 2.6.19. This package provides userspace utilities
+	  needed to mount eCryptfs.
+	  
+	  Files are encrypted using a passpthase. Consider building openssl
+	  for another method.
+	  
+	  http://ecryptfs.org
diff --git a/package/ecryptfs-utils/ecryptfs-utils.mk b/package/ecryptfs-utils/ecryptfs-utils.mk
new file mode 100644
index 0000000..32b509f
--- /dev/null
+++ b/package/ecryptfs-utils/ecryptfs-utils.mk
@@ -0,0 +1,28 @@
+#############################################################
+#
+# ecryptfs-utils
+#
+##############################################################
+
+ECRYPTFS_UTILS_VERSION         = 103
+ECRYPTFS_UTILS_SOURCE          = ecryptfs-utils_$(ECRYPTFS_UTILS_VERSION).orig.tar.gz
+ECRYPTFS_UTILS_SITE            = https://launchpad.net/ecryptfs/trunk/$(ECRYPTFS_UTILS_VERSION)/+download
+ECRYPTFS_UTILS_LICENSE         = GPLv2+
+ECRYPTFS_UTILS_LICENSE_FILES   = COPYING
+
+ECRYPTFS_UTILS_DEPENDENCIES    = keyutils libnss
+ECRYPTFS_UTILS_CONF_OPT        = --disable-pywrap --disable-pam
+
+#Needed for build system to find pk11func.h and libnss3.so
+ECRYPTFS_UTILS_CONF_ENV = \
+  NSS_CFLAGS="-I$(STAGING_DIR)/usr/include/nss -I$(STAGING_DIR)/usr/include/nspr" \
+  NSS_LIBS="-lnss3"
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+	ECRYPTFS_UTILS_CONF_OPT += --enable-openssl
+	ECRYPTFS_UTILS_DEPENDENCIES += openssl
+else
+	ECRYPTFS_UTILS_CONF_OPT += --disable-openssl
+endif
+
+$(eval $(autotools-package))
-- 
1.7.2.5
