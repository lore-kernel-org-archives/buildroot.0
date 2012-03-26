From: Marek Belisko <marek.belisko@open-nandra.com>
Date: Mon, 26 Mar 2012 22:12:36 +0200
Subject: [Buildroot] [PATCH v2 3/3] Add ofono package.
In-Reply-To: <1332792756-3381-1-git-send-email-marek.belisko@open-nandra.com>
References: <1332792756-3381-1-git-send-email-marek.belisko@open-nandra.com>
Message-ID: <1332792756-3381-4-git-send-email-marek.belisko@open-nandra.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
---
 package/Config.in       |    1 +
 package/ofono/Config.in |   20 ++++++++++++++++++++
 package/ofono/ofono.mk  |   25 +++++++++++++++++++++++++
 3 files changed, 46 insertions(+), 0 deletions(-)
 create mode 100644 package/ofono/Config.in
 create mode 100644 package/ofono/ofono.mk

diff --git a/package/Config.in b/package/Config.in
index cd41eb9..4dfbce4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -201,6 +201,7 @@ source "package/memtester/Config.in"
 source "package/minicom/Config.in"
 source "package/mtd/Config.in"
 source "package/ntfs-3g/Config.in"
+source "package/ofono/Config.in"
 source "package/open2300/Config.in"
 source "package/openocd/Config.in"
 source "package/parted/Config.in"
diff --git a/package/ofono/Config.in b/package/ofono/Config.in
new file mode 100644
index 0000000..b10e42d
--- /dev/null
+++ b/package/ofono/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_OFONO
+	bool "ofono"
+	select BR2_PACKAGE_LIBCAP_NG
+	select BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_MOBILE_BROADBAND_PROVIDER_INFO
+	help
+	  oFono.org is a place to bring developers together around designing an
+	  infrastructure for building mobile telephony (GSM/UMTS) applications.
+
+if BR2_PACKAGE_OFONO
+
+config BR2_PACKAGE_OFONO_BLUETOOTH
+        bool "ofono with bluetooth support"
+	select BR2_PACKAGE_BLUEZ_UTILS
+        help
+	  Enable bluetooh support.
+endif
+
+
diff --git a/package/ofono/ofono.mk b/package/ofono/ofono.mk
new file mode 100644
index 0000000..e408a61
--- /dev/null
+++ b/package/ofono/ofono.mk
@@ -0,0 +1,25 @@
+#############################################################
+#
+# ofono
+#
+#############################################################
+OFONO_VERSION = 1.5
+OFONO_SITE = git://git.kernel.org/pub/scm/network/ofono/ofono.git
+
+OFONO_DEPENDENCIES = host-pkg-config libglib2 dbus libcap-ng mobile-broadband-provider-info
+
+OFONO_CONF_OPT = --disable-test --disable-bluetooth
+
+OFONO_AUTORECONF = YES
+
+ifneq ($(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV),y)
+	OFONO_CONF_OPT += --disable-udev
+endif
+
+ifeq ($(BR2_PACKAGE_OFONO_BLUETOOTH),y)
+	OFONO_CONF_OPT += --enable-bluetooth
+	OFONO_DEPENDENCIES += bluez_utils
+endif
+
+$(eval $(call AUTOTARGETS))
+
-- 
1.7.5.4
