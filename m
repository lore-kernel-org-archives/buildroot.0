From: =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>
Date: Sun, 12 May 2019 21:55:44 +0200
Subject: [Buildroot] [PATCH v2 07/13] package/openrc-netifrc: net package
 (v0.6.1)
In-Reply-To: <20190512195550.24457-1-michal.lyszczek@bofc.pl>
References: <20190512195550.24457-1-michal.lyszczek@bofc.pl>
Message-ID: <20190512195550.24457-7-michal.lyszczek@bofc.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

netifrc package is a collection of scripts for openrc that
configure network interfaces. It can take advantage of many
external binaries like dhcp, wpa_supplicant or ifplugd.

Signed-off-by: Micha? ?yszczek <michal.lyszczek@bofc.pl>

---
Changes v1 -> v2
    Suggested by Thomas Petazzoni:
    - Add hash for LICENSE
    - Merge OPENRC_NETIFRC_MAKE_OPTS into single assignment
    - Move DESTDIR after OPENRC_NETIFRC_MAKE_OPTS in install target cmds
    - Change short commit message
    - Add project related links to Config.in
    - Replace += with = in first assignments in makefile

    Own initiative:
    - Remove OPENRC_NETIFRC_REMOVE_UNNEEDED since it only removes
      /usr/share/doc/netifrc and /usr/share/doc is removed anyway
      in target-finalize target in package/Makefile
    - Fix grammar in commit message.
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/openrc-netifrc/Config.in           |  9 ++++
 package/openrc-netifrc/openrc-netifrc.hash |  3 ++
 package/openrc-netifrc/openrc-netifrc.mk   | 53 ++++++++++++++++++++++
 5 files changed, 67 insertions(+)
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
index 0000000000..3786ba8562
--- /dev/null
+++ b/package/openrc-netifrc/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_OPENRC_NETIFRC
+	bool "Install network interface startup scripts"
+	depends on BR2_PACKAGE_OPENRC
+	help
+	  This package provides a system of modules to manage and configure network
+	  interfaces via individual per-interface scripts in /etc/init.d.
+
+	  wiki: https://wiki.gentoo.org/wiki/Netifrc
+	  source: https://gitweb.gentoo.org/proj/netifrc.git
diff --git a/package/openrc-netifrc/openrc-netifrc.hash b/package/openrc-netifrc/openrc-netifrc.hash
new file mode 100644
index 0000000000..d811acc4a2
--- /dev/null
+++ b/package/openrc-netifrc/openrc-netifrc.hash
@@ -0,0 +1,3 @@
+# Calculated manually
+sha256	004907e0c3db2d106d6a51d604d79f971f1013fa7642054ad7efe5076e52f7b3	netifrc-0.6.1.tar.gz
+sha256	da376c9e2244f2a7220767ea4dd88cf423ff5b548e7c2f96b0f3b9dac727748a	LICENSE
diff --git a/package/openrc-netifrc/openrc-netifrc.mk b/package/openrc-netifrc/openrc-netifrc.mk
new file mode 100644
index 0000000000..55421af72f
--- /dev/null
+++ b/package/openrc-netifrc/openrc-netifrc.mk
@@ -0,0 +1,53 @@
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
+OPENRC_NETIFRC_DEPENDENCIES = openrc
+
+# set LIBNAME so netifrc puts files in proper directories and sets proper
+# paths in installed files. Since in buildroot /lib64 and /lib32 always
+# points to /lib, it's safe to hardcode it to "lib"
+OPENRC_NETIFRC_MAKE_OPTS = \
+	LIBNAME=lib \
+	LIBEXECDIR=/usr/libexec/netifrc
+
+define OPENRC_NETIFRC_BUILD_CMDS
+	$(MAKE) $(OPENRC_NETIFRC_MAKE_OPTS) -C $(@D)
+endef
+
+define OPENRC_NETIFRC_INSTALL_TARGET_CMDS
+	$(MAKE) $(OPENRC_NETIFRC_MAKE_OPTS) DESTDIR=$(TARGET_DIR) -C $(@D) install
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
