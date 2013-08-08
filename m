From: Martin Hicks <mort@bork.org>
Date: Thu, 8 Aug 2013 13:50:27 -0400
Subject: [Buildroot] [PATCH] Add cryptsetup package
In-Reply-To: <1375983487-5516-1-git-send-email-mort@bork.org>
References: <1375983487-5516-1-git-send-email-mort@bork.org>
Message-ID: <20130808175027.GA19089@darwin.bork.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Here's the updated patch.  Includes cryptsetup 1.6.2 and an updated
link to the Cryptsetup website.

-- 
Martin Hicks P.Eng.    |      mort at bork.org
Bork Consulting Inc.   |  +1 (613) 266-2296


From: Martin Hicks <mort@bork.org>
Date: Thu, 8 Aug 2013 13:12:56 -0400
Subject: [PATCH] Add cryptsetup package

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
index 0000000..c8788bb
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
+	  https://code.google.com/p/cryptsetup/
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
new file mode 100644
index 0000000..72ea389
--- /dev/null
+++ b/package/cryptsetup/cryptsetup.mk
@@ -0,0 +1,11 @@
+#
+# cryptsetup
+#
+CRYPTSETUP_VERSION = 1.6.2
+CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.bz2
+CRYPTSETUP_SITE = http://cryptsetup.googlecode.com/files
+CRYPTSETUP_CONF_ENV += LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
+CRYPTSETUP_DEPENDENCIES = lvm2 popt e2fsprogs libgcrypt pkg-config
+
+
+$(eval $(autotools-package))
-- 
1.7.2.5
