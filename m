From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Nov 2013 21:55:54 +0100
Subject: [Buildroot] [git commit] cryptsetup: Add libintl for UCLIBC
	toolchain
Message-ID: <20131104211055.371949BC99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cd00a9d9eb72d921e43e231622bcc2accc34e1d8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes autobuild error
http://autobuild.buildroot.net/results/cc1a65b9554bc2ece1b3ea8b51cd805b9bda7e86/

Adding libintl to the libraries list for cryptsetup when using a
uclibc toolchain and locale support is enabled.

Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cryptsetup/Config.in     |    1 +
 package/cryptsetup/cryptsetup.mk |    7 ++++++-
 2 files changed, 7 insertions(+), 1 deletions(-)

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
