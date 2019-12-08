From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Dec 2019 21:59:15 +0100
Subject: [Buildroot] [git commit] package/cryptsetup: use external libargon2
Message-ID: <20191208205107.57D0188DB0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fa5c71da72ba14908d1247c6fed48d51df699df1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

don't use cryptsetup's intree libargon2

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cryptsetup/Config.in     | 5 +++--
 package/cryptsetup/cryptsetup.mk | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/cryptsetup/Config.in b/package/cryptsetup/Config.in
index 14b897a8a8..c4281f7e26 100644
--- a/package/cryptsetup/Config.in
+++ b/package/cryptsetup/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_CRYPTSETUP
 	bool "cryptsetup"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # lvm2
-	depends on BR2_USE_MMU # lvm2
-	depends on !BR2_STATIC_LIBS # lvm2
+	depends on BR2_USE_MMU # lvm2, libargon2
+	depends on !BR2_STATIC_LIBS # lvm2, libargon2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
 	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_LVM2
@@ -10,6 +10,7 @@ config BR2_PACKAGE_CRYPTSETUP
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	select BR2_PACKAGE_JSON_C
+	select BR2_PACKAGE_LIBARGON2
 	help
 	  This tool helps manipulate dm-crypt and luks partitions for
 	  on-disk encryption.
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 7788bfb60b..b6d4df6e11 100644
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
