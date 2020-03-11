From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 11 Mar 2020 22:12:17 +0100
Subject: [Buildroot] [git commit] package/ifupdown-scripts: add openrc
 support
Message-ID: <20200311205956.B32E890983@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=57f3685bc19d94e50b2e63463bc4a71ec2e0503f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The "network" script allows configuring an interface by means of two
/etc/ifup.<if_name> and /etc/ifdown.<if_name> files with the commands
required to bring it up and down, respectively. So we can support the
BR2_SYSTEM_DHCP config if netifrc is not selected.

- Replace the dependency on !BR2_PACKAGE_OPENRC in Config.in by a
  dependency on !BR2_PACKAGE_NETIFRC.

- Add an IFUPDOWN_SCRIPTS_DHCP_OPENRC macro to create the ifup.<if_name>
  and ifdown.<if_name> files.

- Add an IFUPDOWN_SCRIPTS_INSTALL_INIT_OPENRC hook that includes the
  IFUPDOWN_SCRIPTS_{PREAMBLE,DHCP,DHCP_OPENRC} macros. LOCALHOST is not
  required, since "lo" is configured by the "loopback" script.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
[yann.morin.1998 at free.fr:
  - adapt after the preamble was spit to itw own patch
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/ifupdown-scripts/Config.in           |  2 +-
 package/ifupdown-scripts/ifupdown-scripts.mk | 12 ++++++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/package/ifupdown-scripts/Config.in b/package/ifupdown-scripts/Config.in
index 4b984bc30c..166094c511 100644
--- a/package/ifupdown-scripts/Config.in
+++ b/package/ifupdown-scripts/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_IFUPDOWN_SCRIPTS
 	bool "ifupdown scripts"
 	default y if BR2_ROOTFS_SKELETON_DEFAULT
-	depends on !BR2_PACKAGE_SYSTEMD_NETWORKD && !BR2_PACKAGE_OPENRC
+	depends on !BR2_PACKAGE_SYSTEMD_NETWORKD && !BR2_PACKAGE_NETIFRC
 	help
 	  Set of scripts used by ifupdown (either the standalone one,
 	  or the busybox one) to bring network up, or tear it down.
diff --git a/package/ifupdown-scripts/ifupdown-scripts.mk b/package/ifupdown-scripts/ifupdown-scripts.mk
index 8a2337e46b..5ef032142c 100644
--- a/package/ifupdown-scripts/ifupdown-scripts.mk
+++ b/package/ifupdown-scripts/ifupdown-scripts.mk
@@ -30,6 +30,12 @@ define IFUPDOWN_SCRIPTS_DHCP
 		echo "  hostname \$$(hostname)"; \
 	) >> $(TARGET_DIR)/etc/network/interfaces
 endef
+define IFUPDOWN_SCRIPTS_DHCP_OPENRC
+	echo "ifup $(IFUPDOWN_SCRIPTS_DHCP_IFACE)" \
+		> $(TARGET_DIR)/etc/ifup.$(IFUPDOWN_SCRIPTS_DHCP_IFACE)
+	echo "ifdown $(IFUPDOWN_SCRIPTS_DHCP_IFACE)" \
+		> $(TARGET_DIR)/etc/ifdown.$(IFUPDOWN_SCRIPTS_DHCP_IFACE)
+endef
 endif
 
 define IFUPDOWN_SCRIPTS_INSTALL_TARGET_CMDS
@@ -38,6 +44,12 @@ define IFUPDOWN_SCRIPTS_INSTALL_TARGET_CMDS
 	$(call SYSTEM_RSYNC,$(IFUPDOWN_SCRIPTS_PKGDIR)/network,$(TARGET_DIR)/etc/network)
 endef
 
+define IFUPDOWN_SCRIPTS_INSTALL_INIT_OPENRC
+	$(IFUPDOWN_SCRIPTS_PREAMBLE)
+	$(IFUPDOWN_SCRIPTS_DHCP)
+	$(IFUPDOWN_SCRIPTS_DHCP_OPENRC)
+endef
+
 define IFUPDOWN_SCRIPTS_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 $(IFUPDOWN_SCRIPTS_PKGDIR)/S40network \
 		$(TARGET_DIR)/etc/init.d/S40network
