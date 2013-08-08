From: Martin Hicks <mort@bork.org>
Date: Thu,  8 Aug 2013 13:38:07 -0400
Subject: [Buildroot] [PATCH] Add cryptsetup package
Message-ID: <1375983487-5516-1-git-send-email-mort@bork.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Used for managing/creating/unlocking dm-crypt and LUKS encrypted
block devices.

Signed-off-by: Martin Hicks <mort@bork.org>
---
 package/Config.in                |    1 +
 package/cryptsetup/Config.in     |   11 +++++++++++
 package/cryptsetup/cryptsetup.mk |   11 +++++++++++
 3 files changed, 23 insertions(+), 0 deletions(-)
 create mode 100644 package/cryptsetup/Config.in
 create mode 100644 package/cryptsetup/cryptsetup.mk

diff --git a/package/Config.in b/package/Config.in
index 7069d77..94d10d9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -233,6 +233,7 @@ source "package/freescale-imx/Config.in"
 source "package/a10disp/Config.in"
 source "package/acpid/Config.in"
 source "package/cdrkit/Config.in"
+source "package/cryptsetup/Config.in"
 source "package/dbus/Config.in"
 source "package/dbus-glib/Config.in"
 source "package/dbus-python/Config.in"
diff --git a/package/cryptsetup/Config.in b/package/cryptsetup/Config.in
new file mode 100644
index 0000000..9cd9ba4
--- /dev/null
+++ b/package/cryptsetup/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_CRYPTSETUP
+	bool "cryptsetup"
+	select BR2_PACKAGE_LIBGCRYPT
+	select BR2_PACKAGE_POPT
+	select BR2_PACKAGE_LVM2
+	select BR2_PACKAGE_E2FSPROGS
+	help
+	  This tool helps manipulate dm-crypt and luks partitions for on-disk
+	  encryption.
+
+	  http://www.saout.de/misc/dm-crypt/
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
new file mode 100644
index 0000000..9e839dd
--- /dev/null
+++ b/package/cryptsetup/cryptsetup.mk
@@ -0,0 +1,11 @@
+#
+# cryptsetup
+#
+CRYPTSETUP_VERSION = 1.6.1
+CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.bz2
+CRYPTSETUP_SITE = http://cryptsetup.googlecode.com/files
+CRYPTSETUP_CONF_ENV += LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
+CRYPTSETUP_DEPENDENCIES = lvm2 popt e2fsprogs libgcrypt pkg-config
+
+
+$(eval $(autotools-package))
-- 
1.7.2.5
