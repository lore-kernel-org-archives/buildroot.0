From: Marek Belisko <marek.belisko@open-nandra.com>
Date: Sun,  1 Apr 2012 15:58:49 +0200
Subject: [Buildroot] [PATCH v3 3/3] Add ofono package.
In-Reply-To: <1333288729-22138-1-git-send-email-marek.belisko@open-nandra.com>
References: <1333288729-22138-1-git-send-email-marek.belisko@open-nandra.com>
Message-ID: <1333288729-22138-4-git-send-email-marek.belisko@open-nandra.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
---
 package/Config.in       |    1 +
 package/ofono/Config.in |   23 +++++++++++++++++++++++
 package/ofono/ofono.mk  |   30 ++++++++++++++++++++++++++++++
 3 files changed, 54 insertions(+), 0 deletions(-)
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
index 0000000..437e860
--- /dev/null
+++ b/package/ofono/Config.in
@@ -0,0 +1,23 @@
+config BR2_PACKAGE_OFONO
+	bool "ofono"
+	depends on BR2_USE_WCHAR # gettext/libglib2
+	select BR2_PACKAGE_LIBCAP_NG
+	select BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_MOBILE_BROADBAND_PROVIDER_INFO
+	help
+	  oFono is a free, open source project for mobile telephony
+	  (GSM/UMTS) applications. It uses high-level D-Bus API for
+	  use by telephony applications. It uses 3GPP standard.
+
+if BR2_PACKAGE_OFONO
+
+config BR2_PACKAGE_OFONO_BLUETOOTH
+	bool "ofono with bluetooth support"
+	select BR2_PACKAGE_BLUEZ_UTILS
+	help
+	  Enable bluetooth support.
+endif
+
+comment "ofono requires a toolchain with WCHAR and C++ support"
+	depends on !BR2_USE_WCHAR
diff --git a/package/ofono/ofono.mk b/package/ofono/ofono.mk
new file mode 100644
index 0000000..7e35866
--- /dev/null
+++ b/package/ofono/ofono.mk
@@ -0,0 +1,30 @@
+#############################################################
+#
+# ofono
+#
+#############################################################
+OFONO_VERSION = 1.5
+OFONO_SITE = $(BR2_KERNEL_MIRROR)/linux/network/ofono
+
+OFONO_DEPENDENCIES = host-pkg-config libglib2 dbus libcap-ng mobile-broadband-provider-info
+
+OFONO_CONF_OPT = --disable-test
+
+OFONO_AUTORECONF = YES
+
+ifeq ($(BR2_PACKAGE_UDEV),y)
+	OFONO_CONF_OPT += --enable-udev
+	OFONO_DEPENDENCIES += udev
+else
+	OFONO_CONF_OPT += --disable-udev
+endif
+
+ifeq ($(BR2_PACKAGE_OFONO_BLUETOOTH),y)
+	OFONO_CONF_OPT += --enable-bluetooth
+	OFONO_DEPENDENCIES += bluez_utils
+else
+	OFONO_CONF_OPT += --disable-bluetooth
+endif
+
+$(eval $(call AUTOTARGETS))
+
-- 
1.7.5.4
