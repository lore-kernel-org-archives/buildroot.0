From: Pascal de Bruijn <p.debruijn@unilogic.nl>
Date: Wed,  4 Dec 2019 09:05:47 +0100
Subject: [Buildroot] [PATCH] package/cryptsetup: use external libargon2
Message-ID: <20191204080547.20912-1-p.debruijn@unilogic.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

don't use cryptsetup's intree libargon2

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
---
 package/cryptsetup/Config.in     | 1 +
 package/cryptsetup/cryptsetup.mk | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/cryptsetup/Config.in b/package/cryptsetup/Config.in
index 14b897a..3f94847 100644
--- a/package/cryptsetup/Config.in
+++ b/package/cryptsetup/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_CRYPTSETUP
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	select BR2_PACKAGE_JSON_C
+	select BR2_PACKAGE_LIBARGON2
 	help
 	  This tool helps manipulate dm-crypt and luks partitions for
 	  on-disk encryption.
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 7788bfb..b6d4df6 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -8,13 +8,13 @@ CRYPTSETUP_VERSION_MAJOR = 2.0
 CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).6
 CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
 CRYPTSETUP_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/cryptsetup/v$(CRYPTSETUP_VERSION_MAJOR)
-CRYPTSETUP_DEPENDENCIES = lvm2 popt util-linux host-pkgconf json-c \
+CRYPTSETUP_DEPENDENCIES = lvm2 popt util-linux host-pkgconf json-c libargon2 \
 	$(TARGET_NLS_DEPENDENCIES)
 CRYPTSETUP_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (library)
 CRYPTSETUP_LICENSE_FILES = COPYING COPYING.LGPL
 CRYPTSETUP_INSTALL_STAGING = YES
 CRYPTSETUP_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)"
-CRYPTSETUP_CONF_OPTS += --enable-blkid
+CRYPTSETUP_CONF_OPTS += --enable-blkid --enable-libargon2
 
 # cryptsetup uses libgcrypt by default, but can be configured to use OpenSSL
 # or kernel crypto modules instead
-- 
2.7.4
