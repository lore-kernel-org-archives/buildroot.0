From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  4 Aug 2019 14:14:18 +0200
Subject: [Buildroot] [PATCH 4/5 v3] package/netifrc: new package
In-Reply-To: <cover.1564920849.git.yann.morin.1998@free.fr>
References: <cover.1564920849.git.yann.morin.1998@free.fr>
Message-ID: <cc81a0e258bc330147ac3d1664dcc823649491eb.1564920849.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Micha? ?yszczek <michal.lyszczek@bofc.pl>

netifrc entirely replaces openrc's basic network management. As such, it
conflicts with the network services installed by openrc, so we remove
them from openrc when netifrc is enabled.

Currently, we only catter tfor the loopback interface, but we prepare
for also handling the DHCP interface, to come in a latter patch.

Signed-off-by: Micha? ?yszczek <michal.lyszczek@bofc.pl>
[yann.morin.1998 at free.fr:
  - remove openrc files within the openrc package itself
  - as it's a generic-package, no need to use post-install hooks
  - use description from the homepage in the help text
  - check-package fixes
  - rename package
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/netifrc/Config.in    | 12 ++++++++++
 package/netifrc/netifrc.hash |  3 +++
 package/netifrc/netifrc.mk   | 45 ++++++++++++++++++++++++++++++++++++
 package/openrc/openrc.mk     | 11 +++++++++
 6 files changed, 73 insertions(+)
 create mode 100644 package/netifrc/Config.in
 create mode 100644 package/netifrc/netifrc.hash
 create mode 100644 package/netifrc/netifrc.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d43a9f2c74..9483a5056a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1646,6 +1646,7 @@ F:	board/altera/socrates_cyclone5/
 F:	board/pine64/rock64
 F:	configs/rock64_defconfig
 F:	configs/socrates_cyclone5_defconfig
+F:	package/netifrc/
 F:	package/openrc/
 F:	package/skeleton-init-openrc/
 
diff --git a/package/Config.in b/package/Config.in
index cb0f89ad99..7d271117e3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2220,6 +2220,7 @@ menu "System tools"
 	source "package/mender-grubenv/Config.in"
 	source "package/monit/Config.in"
 	source "package/ncdu/Config.in"
+	source "package/netifrc/Config.in"
 	source "package/numactl/Config.in"
 	source "package/nut/Config.in"
 	source "package/openrc/Config.in"
diff --git a/package/netifrc/Config.in b/package/netifrc/Config.in
new file mode 100644
index 0000000000..9347033d67
--- /dev/null
+++ b/package/netifrc/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_NETIFRC
+	bool "netifrc"
+	depends on BR2_PACKAGE_OPENRC
+	help
+	  netifrc is a collection of modules created to configure and
+	  manage network interfaces via individual, per-interface
+	  scripts.
+
+	  https://wiki.gentoo.org/wiki/Netifrc
+
+comment "netifrc needs openrc as init system"
+	depends on !BR2_PACKAGE_OPENRC
diff --git a/package/netifrc/netifrc.hash b/package/netifrc/netifrc.hash
new file mode 100644
index 0000000000..d811acc4a2
--- /dev/null
+++ b/package/netifrc/netifrc.hash
@@ -0,0 +1,3 @@
+# Calculated manually
+sha256	004907e0c3db2d106d6a51d604d79f971f1013fa7642054ad7efe5076e52f7b3	netifrc-0.6.1.tar.gz
+sha256	da376c9e2244f2a7220767ea4dd88cf423ff5b548e7c2f96b0f3b9dac727748a	LICENSE
diff --git a/package/netifrc/netifrc.mk b/package/netifrc/netifrc.mk
new file mode 100644
index 0000000000..4b9a0a8d39
--- /dev/null
+++ b/package/netifrc/netifrc.mk
@@ -0,0 +1,45 @@
+################################################################################
+#
+# netifrc
+#
+################################################################################
+
+NETIFRC_VERSION = 0.6.1
+NETIFRC_SITE = $(call github,gentoo,netifrc,$(NETIFRC_VERSION))
+NETIFRC_LICENSE = BSD-2-Clause
+NETIFRC_LICENSE_FILES = LICENSE
+
+NETIFRC_DEPENDENCIES = openrc
+
+# set LIBNAME so netifrc puts files in proper directories and sets proper
+# paths in installed files. Since in buildroot /lib64 and /lib32 always
+# points to /lib, it's safe to hardcode it to "lib"
+NETIFRC_MAKE_OPTS = \
+	LIBNAME=lib \
+	LIBEXECDIR=/usr/libexec/netifrc
+
+define NETIFRC_BUILD_CMDS
+	$(MAKE) $(NETIFRC_MAKE_OPTS) -C $(@D)
+endef
+
+ifeq ($(BR2_PACKAGE_HAS_UDEV),)
+define NETIFRC_REMOVE_UDEV
+	$(RM) $(TARGET_DIR)/lib/udev/net.sh
+	$(RM) $(TARGET_DIR)/lib/udev/rules.d/90-network.rules
+	rmdir --ignore-fail-on-non-empty  $(TARGET_DIR)/lib/udev/rules.d
+	rmdir --ignore-fail-on-non-empty  $(TARGET_DIR)/lib/udev
+endef
+endif # BR2_PACKAGE_HAS_UDEV
+
+define NETIFRC_NET_CFG
+	config_lo="127.0.0.1/8"
+endef
+
+define NETIFRC_INSTALL_TARGET_CMDS
+	$(MAKE) $(NETIFRC_MAKE_OPTS) DESTDIR=$(TARGET_DIR) -C $(@D) install
+	$(NETIFRC_REMOVE_UDEV)
+	$(call PRINTF,$(NETIFRC_NET_CFG)) > $(TARGET_DIR)/etc/conf.d/net
+	ln -sf /etc/init.d/net.lo $(TARGET_DIR)/etc/runlevels/default/net.lo
+endef
+
+$(eval $(generic-package))
diff --git a/package/openrc/openrc.mk b/package/openrc/openrc.mk
index 5978b6de5d..387962d4d5 100644
--- a/package/openrc/openrc.mk
+++ b/package/openrc/openrc.mk
@@ -37,6 +37,17 @@ define OPENRC_INSTALL_TARGET_CMDS
 	$(MAKE) $(OPENRC_MAKE_OPTS) DESTDIR=$(TARGET_DIR) -C $(@D) install
 endef
 
+ifeq ($(BR2_PACKAGE_NETIFRC),y)
+# netifrc replaces network, staticroute and loopback services which are
+# installed by openrc
+define OPENRC_NO_NET
+	$(RM) $(TARGET_DIR)/etc/runlevels/boot/{network,staticroute,loopback}
+	$(RM) $(TARGET_DIR)/etc/init.d/{network,staticroute,loopback}
+	$(RM) $(TARGET_DIR)/etc/conf.d/{network,staticroute,loopback}
+endef
+OPENRC_POST_TARGET_INSTALL_HOOKS += OPENRC_NO_NET
+endif
+
 define OPENRC_REMOVE_UNNEEDED
 	$(RM) -r $(TARGET_DIR)/usr/share/openrc
 endef
-- 
2.20.1
