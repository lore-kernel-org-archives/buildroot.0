From: Floris Bos <bos@je-eigen-domein.nl>
Date: Wed,  4 Feb 2015 19:33:28 +0100
Subject: [Buildroot] [PATCH] cryptsetup: remove hard dependency on libgcrypt
Message-ID: <1423074809-602-1-git-send-email-bos@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Add support for the alternative OpenSSL and Linux kernel crypto backends.
The latter does require that additional kernel modules (like algif_hash)
are present and loaded before invoking cryptsetup, so is used as last choice.

- Removes CRYPTSETUP_AUTORECONF as it is redundant, and reconf does
create a dependency on libgcrypt for the m4 macros used.

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
---
 package/cryptsetup/Config.in     |  1 -
 package/cryptsetup/cryptsetup.mk | 17 +++++++++++++----
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/package/cryptsetup/Config.in b/package/cryptsetup/Config.in
index 353420f..7f672f9 100644
--- a/package/cryptsetup/Config.in
+++ b/package/cryptsetup/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_CRYPTSETUP
 	bool "cryptsetup"
-	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_LVM2
 	select BR2_PACKAGE_E2FSPROGS
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index f43bbca..0ececa9 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -8,16 +8,25 @@ CRYPTSETUP_VERSION_MAJOR = 1.6
 CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).6
 CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
 CRYPTSETUP_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/cryptsetup/v$(CRYPTSETUP_VERSION_MAJOR)
-CRYPTSETUP_CONF_ENV += LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
-CRYPTSETUP_DEPENDENCIES = lvm2 popt e2fsprogs libgcrypt host-pkgconf \
+CRYPTSETUP_DEPENDENCIES = lvm2 popt e2fsprogs host-pkgconf \
 	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
 CRYPTSETUP_LICENSE = GPLv2+ (programs), LGPLv2.1+ (library)
 CRYPTSETUP_LICENSE_FILES = COPYING COPYING.LGPL
 
-CRYPTSETUP_AUTORECONF = YES
-
 ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
 CRYPTSETUP_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -lintl"
 endif
 
+# cryptsetup uses libgcrypt by default, but can be configured to use OpenSSL
+# or kernel crypto modules instead
+ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
+CRYPTSETUP_DEPENDENCIES += libgcrypt
+CRYPTSETUP_CONF_ENV += LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
+else ifeq ($(BR2_PACKAGE_OPENSSL),y)
+CRYPTSETUP_DEPENDENCIES += openssl
+CRYPTSETUP_CONF_OPTS += --with-crypto_backend=openssl
+else
+CRYPTSETUP_CONF_OPTS += --with-crypto_backend=kernel
+endif
+
 $(eval $(autotools-package))
-- 
1.9.1
