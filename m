From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Mar 2015 22:15:57 +0100
Subject: [Buildroot] [git commit] cryptsetup: remove hard dependency on
	libgcrypt
Message-ID: <20150308211607.76C7180795@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7f57e79a7e61f5e7760e89bca9f466be139c693d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Add support for the alternative OpenSSL and Linux kernel crypto backends.
The latter does require that additional kernel modules (like algif_hash)
are present and loaded before invoking cryptsetup, so is used as last choice.

- Removes CRYPTSETUP_AUTORECONF as it is redundant, and reconf does
create a dependency on libgcrypt for the m4 macros used.

[Thomas: add an explicit --with-crypto_backend=gcrypt with the
libgcrypt backend is requested.]

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cryptsetup/Config.in     |    1 -
 package/cryptsetup/cryptsetup.mk |   18 ++++++++++++++----
 2 files changed, 14 insertions(+), 5 deletions(-)

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
index f43bbca..88ddc37 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -8,16 +8,26 @@ CRYPTSETUP_VERSION_MAJOR = 1.6
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
+CRYPTSETUP_CONF_OPTS += --with-crypto_backend=gcrypt
+else ifeq ($(BR2_PACKAGE_OPENSSL),y)
+CRYPTSETUP_DEPENDENCIES += openssl
+CRYPTSETUP_CONF_OPTS += --with-crypto_backend=openssl
+else
+CRYPTSETUP_CONF_OPTS += --with-crypto_backend=kernel
+endif
+
 $(eval $(autotools-package))
