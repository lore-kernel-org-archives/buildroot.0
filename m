From: Clayton Shotwell <clshotwe@rockwellcollins.com>
Date: Fri, 1 Nov 2013 07:48:25 -0700
Subject: [Buildroot] [PATCH v3] cryptsetup: Add libintl for UCLIBC toolchain
Message-ID: <1383317305-10180-1-git-send-email-clshotwe@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes autobuild error
http://autobuild.buildroot.net/results/cc1a65b9554bc2ece1b3ea8b51cd805b9bda7e86/

Adding libintl to the libraries list for cryptsetup when using a
uclibc toolchain and locale support is enabled.

Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
---
Changes v2 -> v3:
  - Adding BR2_NEEDS_GETTEXT_IF_LOCALE checks per the buildroot
    manual (suggested by Gustavo)
Changes v1 -> v2:
  - Adding TARGET_LDFLAGS to make sure they are not dropped
---
 package/cryptsetup/Config.in     |    1 +
 package/cryptsetup/cryptsetup.mk |    7 ++++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/cryptsetup/Config.in b/package/cryptsetup/Config.in
index 71faa48..3b9ba54 100644
--- a/package/cryptsetup/Config.in
+++ b/package/cryptsetup/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_CRYPTSETUP
 	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_LVM2
 	select BR2_PACKAGE_E2FSPROGS
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE 
 	depends on BR2_LARGEFILE # lvm2, util-linux
 	depends on BR2_USE_MMU # lvm2
 	depends on BR2_USE_WCHAR # util-linux
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 48d37f6..a65f841 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -8,8 +8,13 @@ CRYPTSETUP_VERSION = 1.6.2
 CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.bz2
 CRYPTSETUP_SITE = http://cryptsetup.googlecode.com/files
 CRYPTSETUP_CONF_ENV += LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
-CRYPTSETUP_DEPENDENCIES = lvm2 popt e2fsprogs libgcrypt host-pkgconf
+CRYPTSETUP_DEPENDENCIES = lvm2 popt e2fsprogs libgcrypt host-pkgconf \
+	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
 CRYPTSETUP_LICENSE = GPLv2+ (programs), LGPLv2.1+ (library)
 CRYPTSETUP_LICENSE_FILES = COPYING COPYING.LGPL
 
+ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
+CRYPTSETUP_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -lintl"
+endif
+
 $(eval $(autotools-package))
-- 
1.7.9.5
