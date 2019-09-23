From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Sep 2019 22:53:54 +0200
Subject: [Buildroot] [git commit] package/netifrc: new package
Message-ID: <20190923210219.1C4238F1E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=39950aae0025fc494dac0540a4072c03ace6aeb0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

netifrc entirely replaces openrc's basic network management. As such, it
conflicts with the network services installed by openrc, so we remove
them from openrc when netifrc is enabled.

Currently, we only catter tfor the loopback interface, but we prepare
for also handling the DHCP interface, to come in a latter patch.

Signed-off-by: Micha?? ??yszczek <michal.lyszczek@bofc.pl>
[yann.morin.1998 at free.fr:
  - remove openrc files within the openrc package itself
  - as it's a generic-package, no need to use post-install hooks
  - use description from the homepage in the help text
  - check-package fixes
  - rename package
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
[Thomas:
 - pass UDEVDIR to install udev rules at the correct location]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/netifrc/Config.in    | 12 ++++++++++++
 package/netifrc/netifrc.hash |  3 +++
 package/netifrc/netifrc.mk   | 46 ++++++++++++++++++++++++++++++++++++++++++++
 package/openrc/openrc.mk     | 11 +++++++++++
 6 files changed, 74 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9e68a153a5..9b771f4957 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1665,6 +1665,7 @@ F:	board/altera/socrates_cyclone5/
 F:	board/pine64/rock64
 F:	configs/rock64_defconfig
 F:	configs/socrates_cyclone5_defconfig
+F:	package/netifrc/
 F:	package/openrc/
 F:	package/skeleton-init-openrc/
 
diff --git a/package/Config.in b/package/Config.in
index c336dfeda3..10b441c6e1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2227,6 +2227,7 @@ menu "System tools"
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
index 0000000000..5dc262230b
--- /dev/null
+++ b/package/netifrc/netifrc.mk
@@ -0,0 +1,46 @@
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
+	UDEVDIR=/lib/udev \
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
+	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/lib/udev/rules.d
+	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/lib/udev
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
