From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Jul 2015 14:13:06 +0200
Subject: [Buildroot] [git commit] cryptsetup: remove e2fsprogs dependency
Message-ID: <20150704121313.238A18082A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0d67ffe596dc195ea5389485f5ca5b374a943611
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cryptsetup does not actually depend on e2fsprogs, but on libuuid that is a
dependency of e2fsprogs. Remove the e2fsprogs dependency, and add a direct
dependency on util-linux (libuuid provider).

Cc: Martin Hicks <mort@bork.org>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cryptsetup/Config.in     |    5 +++--
 package/cryptsetup/cryptsetup.mk |    2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/cryptsetup/Config.in b/package/cryptsetup/Config.in
index 13b0184..d7ccd37 100644
--- a/package/cryptsetup/Config.in
+++ b/package/cryptsetup/Config.in
@@ -2,10 +2,11 @@ config BR2_PACKAGE_CRYPTSETUP
 	bool "cryptsetup"
 	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_LVM2
-	select BR2_PACKAGE_E2FSPROGS
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # lvm2
-	depends on BR2_USE_MMU # lvm2, e2fsprogs
+	depends on BR2_USE_MMU # lvm2
 	depends on !BR2_STATIC_LIBS # lvm2
 	depends on BR2_USE_WCHAR # util-linux
 	# Triggers the _gp link issue
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 754bea5..3655d5d 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -8,7 +8,7 @@ CRYPTSETUP_VERSION_MAJOR = 1.6
 CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).7
 CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
 CRYPTSETUP_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/cryptsetup/v$(CRYPTSETUP_VERSION_MAJOR)
-CRYPTSETUP_DEPENDENCIES = lvm2 popt e2fsprogs host-pkgconf \
+CRYPTSETUP_DEPENDENCIES = lvm2 popt util-linux host-pkgconf \
 	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
 CRYPTSETUP_LICENSE = GPLv2+ (programs), LGPLv2.1+ (library)
 CRYPTSETUP_LICENSE_FILES = COPYING COPYING.LGPL
