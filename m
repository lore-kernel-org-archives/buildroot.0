From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 31 Aug 2013 21:34:01 -0000
Subject: [Buildroot] [git commit] cryptsetup: new package package
Message-ID: <20130831213337.19F7B9B5D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=21028166a5a9d09063eec916e4ad60c964cff27d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas P: add license informations, fix header, adjust dependencies
in Config.in file on toolchain options.]

Signed-off-by: Martin Hicks <mort@bork.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                |    1 +
 package/cryptsetup/Config.in     |   17 +++++++++++++++++
 package/cryptsetup/cryptsetup.mk |   15 +++++++++++++++
 3 files changed, 33 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 7199a36..f27ba2b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -235,6 +235,7 @@ source "package/freescale-imx/Config.in"
 source "package/a10disp/Config.in"
 source "package/acpid/Config.in"
 source "package/cdrkit/Config.in"
+source "package/cryptsetup/Config.in"
 source "package/dbus/Config.in"
 source "package/dbus-glib/Config.in"
 source "package/dbus-python/Config.in"
diff --git a/package/cryptsetup/Config.in b/package/cryptsetup/Config.in
new file mode 100644
index 0000000..a8dffc6
--- /dev/null
+++ b/package/cryptsetup/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_CRYPTSETUP
+	bool "cryptsetup"
+	select BR2_PACKAGE_LIBGCRYPT
+	select BR2_PACKAGE_POPT
+	select BR2_PACKAGE_LVM2
+	select BR2_PACKAGE_E2FSPROGS
+	depends on BR2_LARGEFILE # lvm2, util-linux
+	depends on BR2_USE_MMU # lvm2
+	depends on BR2_USE_WCHAR # util-linux
+	help
+	  This tool helps manipulate dm-crypt and luks partitions for
+	  on-disk encryption.
+
+	  https://code.google.com/p/cryptsetup/
+
+comment "cryptsetup needs largefile and wchar support in toolchain"
+	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
new file mode 100644
index 0000000..48d37f6
--- /dev/null
+++ b/package/cryptsetup/cryptsetup.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# cryptsetup
+#
+################################################################################
+
+CRYPTSETUP_VERSION = 1.6.2
+CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.bz2
+CRYPTSETUP_SITE = http://cryptsetup.googlecode.com/files
+CRYPTSETUP_CONF_ENV += LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
+CRYPTSETUP_DEPENDENCIES = lvm2 popt e2fsprogs libgcrypt host-pkgconf
+CRYPTSETUP_LICENSE = GPLv2+ (programs), LGPLv2.1+ (library)
+CRYPTSETUP_LICENSE_FILES = COPYING COPYING.LGPL
+
+$(eval $(autotools-package))
