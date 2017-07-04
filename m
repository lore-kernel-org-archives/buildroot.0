From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 01:27:24 +0200
Subject: [Buildroot] [git commit] cryptsetup: use new gettext logic
Message-ID: <20170704233513.C7D177F8A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eaf232dbd01b5946c46f0991befa5339c4b4bad0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit switches to use the new gettext logic, which involves:

 - using TARGET_NLS_DEPENDENCIES instead of hand-encoded dependencies
   on gettext/host-gettext

 - using TARGET_NLS_LIBS to force linking against libintl

 - dropping BR2_PACKAGE_GETTEXT selection

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cryptsetup/Config.in     | 1 -
 package/cryptsetup/cryptsetup.mk | 7 ++-----
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/package/cryptsetup/Config.in b/package/cryptsetup/Config.in
index 3ca23ba..5cd4676 100644
--- a/package/cryptsetup/Config.in
+++ b/package/cryptsetup/Config.in
@@ -8,7 +8,6 @@ config BR2_PACKAGE_CRYPTSETUP
 	select BR2_PACKAGE_LVM2
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  This tool helps manipulate dm-crypt and luks partitions for
 	  on-disk encryption.
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 787331c..5496583 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -9,14 +9,11 @@ CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).5
 CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
 CRYPTSETUP_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/cryptsetup/v$(CRYPTSETUP_VERSION_MAJOR)
 CRYPTSETUP_DEPENDENCIES = lvm2 popt util-linux host-pkgconf \
-	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
+	$(TARGET_NLS_DEPENDENCIES)
 CRYPTSETUP_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (library)
 CRYPTSETUP_LICENSE_FILES = COPYING COPYING.LGPL
 CRYPTSETUP_INSTALL_STAGING = YES
-
-ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
-CRYPTSETUP_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -lintl"
-endif
+CRYPTSETUP_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)"
 
 # cryptsetup uses libgcrypt by default, but can be configured to use OpenSSL
 # or kernel crypto modules instead
