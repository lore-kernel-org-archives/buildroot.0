From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 17 Aug 2018 12:14:33 +0300
Subject: [Buildroot] [PATCH] cryptsetup: bump to version 2.0.4
Message-ID: <43f90f6702687a47c9295ea431e3652dfda02e47.1534497273.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libblkid is a new optional dependency. Upstream "strongly discourages"
build without libblkid support. So enable libblkid unconditionally.

Cc: Martin Hicks <mort@bork.org>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
Note: I tested this patch on next after cherry picking commit bef1786475
from master.
---
 package/cryptsetup/Config.in       | 1 +
 package/cryptsetup/cryptsetup.hash | 2 +-
 package/cryptsetup/cryptsetup.mk   | 6 ++++--
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/cryptsetup/Config.in b/package/cryptsetup/Config.in
index e4500b1cf267..831435628ca8 100644
--- a/package/cryptsetup/Config.in
+++ b/package/cryptsetup/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_CRYPTSETUP
 	select BR2_PACKAGE_LVM2
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	select BR2_PACKAGE_JSON_C
 	help
 	  This tool helps manipulate dm-crypt and luks partitions for
diff --git a/package/cryptsetup/cryptsetup.hash b/package/cryptsetup/cryptsetup.hash
index 1573d5308055..38e8ff9a8aa3 100644
--- a/package/cryptsetup/cryptsetup.hash
+++ b/package/cryptsetup/cryptsetup.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/linux/utils/cryptsetup/v2.0/sha256sums.asc
-sha256 4d6cca04c1f5ff4a68d045d190efb2623087eda0274ded92f92a4b6911e501d4  cryptsetup-2.0.3.tar.xz
+sha256 9d3a3c7033293e0c97f0ad0501fd5b4d4913ae497cbf70cca06633ccc54b5734  cryptsetup-2.0.4.tar.xz
 sha256 45670cce8b6a0ddd66c8016cd8ccef6cd71f35717cbacc7f1e895b3855207b33  COPYING
 sha256 8c33cc37871654ec7ed87e6fbb896c8cf33ef5ef05b1611a5aed857596ffafa5  COPYING.LGPL
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index d81aa7b341a5..dd1ef2e9e00c 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 CRYPTSETUP_VERSION_MAJOR = 2.0
-CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).3
+CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).4
 CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
 CRYPTSETUP_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/cryptsetup/v$(CRYPTSETUP_VERSION_MAJOR)
 CRYPTSETUP_DEPENDENCIES = lvm2 popt util-linux host-pkgconf json-c \
@@ -14,6 +14,7 @@ CRYPTSETUP_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (library)
 CRYPTSETUP_LICENSE_FILES = COPYING COPYING.LGPL
 CRYPTSETUP_INSTALL_STAGING = YES
 CRYPTSETUP_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)"
+CRYPTSETUP_CONF_OPTS += --enable-blkid
 
 # cryptsetup uses libgcrypt by default, but can be configured to use OpenSSL
 # or kernel crypto modules instead
@@ -37,7 +38,8 @@ HOST_CRYPTSETUP_DEPENDENCIES = \
 	host-openssl
 
 HOST_CRYPTSETUP_CONF_OPTS = --with-crypto_backend=openssl \
-	--disable-kernel_crypto
+	--disable-kernel_crypto \
+	--enable-blkid
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.18.0
