From: =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>
Date: Thu,  9 May 2019 00:09:31 +0200
Subject: [Buildroot] [PATCH 07/13] new package: openrc-netifrc-0.6.1
In-Reply-To: <20190508220937.23200-1-michal.lyszczek@bofc.pl>
References: <20190508220937.23200-1-michal.lyszczek@bofc.pl>
Message-ID: <20190508220937.23200-7-michal.lyszczek@bofc.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

netifrc package is a collection of scripts for openrc that
configures network interfaces. It can take advantage of many
external binaries like dhcp, wpa_supplicant or ifplugd.

Signed-off-by: Micha? ?yszczek <michal.lyszczek@bofc.pl>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/openrc-netifrc/Config.in           |  6 +++
 package/openrc-netifrc/openrc-netifrc.hash |  2 +
 package/openrc-netifrc/openrc-netifrc.mk   | 59 ++++++++++++++++++++++
 5 files changed, 69 insertions(+)
 create mode 100644 package/openrc-netifrc/Config.in
 create mode 100644 package/openrc-netifrc/openrc-netifrc.hash
 create mode 100644 package/openrc-netifrc/openrc-netifrc.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 92aa5381f8..4cf9feff21 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1616,6 +1616,7 @@ F:	board/pine64/rock64
 F:	configs/rock64_defconfig
 F:	configs/socrates_cyclone5_defconfig
 F:	package/openrc/
+F:	package/openrc-netifrc/
 F:	package/skeleton-init-openrc/
 
 N:	Michel Stempin <michel.stempin@wanadoo.fr>
diff --git a/package/Config.in b/package/Config.in
index 584c7e4e5a..c724b33ce8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2196,6 +2196,7 @@ menu "System tools"
 	source "package/numactl/Config.in"
 	source "package/nut/Config.in"
 	source "package/openrc/Config.in"
+	source "package/openrc-netifrc/Config.in"
 	source "package/openvmtools/Config.in"
 	source "package/pamtester/Config.in"
 	source "package/polkit/Config.in"
diff --git a/package/openrc-netifrc/Config.in b/package/openrc-netifrc/Config.in
new file mode 100644
index 0000000000..5b8749c226
--- /dev/null
+++ b/package/openrc-netifrc/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_OPENRC_NETIFRC
+	bool "Install network interface startup scripts"
+	depends on BR2_PACKAGE_OPENRC
+	help
+	  This package provides a system of modules to manage and configure network
+	  interfaces via individual per-interface scripts in /etc/init.d.
diff --git a/package/openrc-netifrc/openrc-netifrc.hash b/package/openrc-netifrc/openrc-netifrc.hash
new file mode 100644
index 0000000000..177bb5b99f
--- /dev/null
+++ b/package/openrc-netifrc/openrc-netifrc.hash
@@ -0,0 +1,2 @@
+# Calculated manually
+sha256	004907e0c3db2d106d6a51d604d79f971f1013fa7642054ad7efe5076e52f7b3	netifrc-0.6.1.tar.gz
diff --git a/package/openrc-netifrc/openrc-netifrc.mk b/package/openrc-netifrc/openrc-netifrc.mk
new file mode 100644
index 0000000000..6f2985cada
--- /dev/null
+++ b/package/openrc-netifrc/openrc-netifrc.mk
@@ -0,0 +1,59 @@
+################################################################################
+#
+# openrc-netifrc
+#
+################################################################################
+
+OPENRC_NETIFRC_VERSION = 0.6.1
+OPENRC_NETIFRC_SOURCE = netifrc-$(OPENRC_NETIFRC_VERSION).tar.gz
+OPENRC_NETIFRC_SITE = $(call github,gentoo,netifrc,$(OPENRC_NETIFRC_VERSION))
+OPENRC_NETIFRC_LICENSE = BSD-2-Clause
+OPENRC_NETIFRC_LICENSE_FILES = LICENSE
+
+OPENRC_NETIFRC_DEPENDENCIES += openrc
+
+# set LIBNAME so netifrc puts files in proper directories and sets proper
+# paths in installed files. Since in buildroot /lib64 and /lib32 always
+# points to /lib, it's safe to hardcode it to "lib"
+OPENRC_NETIFRC_MAKE_OPTS += LIBNAME=lib
+OPENRC_NETIFRC_MAKE_OPTS += LIBEXECDIR=/usr/libexec/netifrc
+
+define OPENRC_NETIFRC_BUILD_CMDS
+	$(MAKE) $(OPENRC_NETIFRC_MAKE_OPTS) -C $(@D)
+endef
+
+define OPENRC_NETIFRC_INSTALL_TARGET_CMDS
+	DESTDIR=$(TARGET_DIR) $(MAKE) $(OPENRC_NETIFRC_MAKE_OPTS) -C $(@D) install
+endef
+
+define OPENRC_NETIFRC_REMOVE_UNNEEDED
+	$(RM) $(TARGET_DIR)/usr/share/doc/netifrc/net.example
+	rmdir $(TARGET_DIR)/usr/share/doc/netifrc
+	rmdir --ignore-fail-on-non-empty  $(TARGET_DIR)/usr/share/doc
+	rmdir --ignore-fail-on-non-empty  $(TARGET_DIR)/usr/share
+endef
+
+ifeq ($(BR2_PACKAGE_HAS_UDEV),)
+define OPENRC_NETIFRC_REMOVE_UDEV
+	$(RM) $(TARGET_DIR)/lib/udev/net.sh
+	$(RM) $(TARGET_DIR)/lib/udev/rules.d/90-network.rules
+	rmdir --ignore-fail-on-non-empty  $(TARGET_DIR)/lib/udev/rules.d
+	rmdir --ignore-fail-on-non-empty  $(TARGET_DIR)/lib/udev
+endef
+OPENRC_NETIFRC_TARGET_FINALIZE_HOOKS += OPENRC_NETIFRC_REMOVE_UDEV
+endif # BR2_PACKAGE_HAS_UDEV
+
+ifeq ($(BR2_PACKAGE_OPENRC_NETIFRC),y)
+# netifrc replaces network, staticroute and loopback services which are
+# installed by openrc
+define OPENRC_NETIFRC_INSTALL
+	$(RM) $(TARGET_DIR)/etc/runlevels/boot/{network,staticroute,loopback}
+	$(RM) $(TARGET_DIR)/etc/init.d/{network,staticroute,loopback}
+	$(RM) $(TARGET_DIR)/etc/conf.d/{network,staticroute,loopback}
+	ln -sf /etc/init.d/net.lo $(TARGET_DIR)/etc/runlevels/default/net.lo
+	echo "config_lo=\"127.0.0.1/8\"" > $(TARGET_DIR)/etc/conf.d/net
+endef
+OPENRC_NETIFRC_TARGET_FINALIZE_HOOKS += OPENRC_NETIFRC_INSTALL
+endif # BR2_PACKAGE_OPENRC_NETIFRC
+
+$(eval $(generic-package))
-- 
2.18.1
