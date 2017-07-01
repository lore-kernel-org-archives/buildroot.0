From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  2 Jul 2017 00:02:01 +0200
Subject: [Buildroot] [PATCHv2] package/ifupdown-scripts: new package
Message-ID: <20170701220201.5922-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The ifupdown scripts can be used independently of the init system, be it
sysv, busybox or systemd; they could even be used when there is no init
system (i.e. the user is providing his own).

Currently, those ifupdown scripts are bundled in the skeleton.

But we soon will have a skeleton specific to systemd, so we would be
missing those scripts (when systemd-networks is not enabled).

So, move those scripts to their own package.

This new package is selected by the various network "managers" that need
it. This means that, no longer being part of the skeleton, they are now
available even when a custom skeleton is used, like our initscripts are.

Previously, the systemd service was provided by systemd, while the syv
startup script was provided by initscripts. Both are moved to this new
ifupdown-scripts package for consistency with the other scripts. We
still intall the systemd service file because ifupdown-scripts cannot be
enabled when systemd-networkd is enabled.

As for busybox, we consider that using the default configuration
requires this package, while a non-default one will not necessarily need
it, and thus we leave it up to the user to enable the package or not.

Instead of being a target-finalize hook, the scripts are installed as
any other package are, with a package install-target command.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

---
Changes v1 -> v2:
  - add a real prompt  (Thomas, Arnout)
  - drop ifupdown-scripts dummy-prompt hack  (Thomas)
  - simplify selecting ifupdown-scripts from systemd  (Thomas)
  - reword the commit log to remove reference to init systems  (Arnout)
  - select it from the package Busybox, rather than the init system
    Busybox  (Arnout)
---
 package/Config.in                                  |  1 +
 package/busybox/Config.in                          |  7 ++-
 package/ifupdown-scripts/Config.in                 |  5 ++
 .../init.d => ifupdown-scripts}/S40network         |  0
 package/ifupdown-scripts/ifupdown-scripts.mk       | 57 ++++++++++++++++++++++
 .../{systemd => ifupdown-scripts}/network.service  |  0
 .../ifupdown-scripts}/network/if-down.d/.empty     |  0
 .../network/if-post-down.d/.empty                  |  0
 .../network/if-pre-up.d/wait_iface                 |  0
 .../ifupdown-scripts}/network/if-up.d/.empty       |  0
 package/{skeleton => ifupdown-scripts}/nfs_check   |  0
 package/ifupdown/Config.in                         |  1 +
 package/skeleton/skeleton.mk                       | 33 -------------
 package/systemd/Config.in                          |  2 +
 package/systemd/systemd.mk                         |  8 ---
 15 files changed, 72 insertions(+), 42 deletions(-)
 create mode 100644 package/ifupdown-scripts/Config.in
 rename package/{initscripts/init.d => ifupdown-scripts}/S40network (100%)
 create mode 100644 package/ifupdown-scripts/ifupdown-scripts.mk
 rename package/{systemd => ifupdown-scripts}/network.service (100%)
 rename {system/skeleton/etc => package/ifupdown-scripts}/network/if-down.d/.empty (100%)
 rename {system/skeleton/etc => package/ifupdown-scripts}/network/if-post-down.d/.empty (100%)
 rename {system/skeleton/etc => package/ifupdown-scripts}/network/if-pre-up.d/wait_iface (100%)
 rename {system/skeleton/etc => package/ifupdown-scripts}/network/if-up.d/.empty (100%)
 rename package/{skeleton => ifupdown-scripts}/nfs_check (100%)

diff --git a/package/Config.in b/package/Config.in
index fdfcd02df7..33e1464ed2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1599,6 +1599,7 @@ menu "Networking applications"
 	source "package/ifplugd/Config.in"
 	source "package/iftop/Config.in"
 	source "package/ifupdown/Config.in"
+	source "package/ifupdown-scripts/Config.in"
 	source "package/igd2-for-linux/Config.in"
 	source "package/igh-ethercat/Config.in"
 	source "package/igmpproxy/Config.in"
diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index 116a72e945..e75b537d9d 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_BUSYBOX
 	bool "BusyBox"
 	default y
+	select BR2_PACKAGE_IFUPDOWN_SCRIPTS if BR2_PACKAGE_BUSYBOX_CONFIG = BR2_PACKAGE_BUSYBOX_DEFAULT_CONFIG
 	help
 	  The Swiss Army Knife of embedded Linux. It slices, it dices,
 	  it makes Julian Fries.
@@ -11,9 +12,13 @@ config BR2_PACKAGE_BUSYBOX
 
 if BR2_PACKAGE_BUSYBOX
 
+config BR2_PACKAGE_BUSYBOX_DEFAULT_CONFIG
+	string
+	default "package/busybox/busybox.config"
+
 config BR2_PACKAGE_BUSYBOX_CONFIG
 	string "BusyBox configuration file to use?"
-	default "package/busybox/busybox.config"
+	default BR2_PACKAGE_BUSYBOX_DEFAULT_CONFIG
 	help
 	  Some people may wish to use their own modified BusyBox
 	  configuration file, and will specify their config file
diff --git a/package/ifupdown-scripts/Config.in b/package/ifupdown-scripts/Config.in
new file mode 100644
index 0000000000..664ab760fc
--- /dev/null
+++ b/package/ifupdown-scripts/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_IFUPDOWN_SCRIPTS
+	bool "ifupdown script"
+	help
+	  Set of scripts used by ifupdown (either the standalone one, or the
+	  busybox one) to bring network up, or tear it down.
diff --git a/package/initscripts/init.d/S40network b/package/ifupdown-scripts/S40network
similarity index 100%
rename from package/initscripts/init.d/S40network
rename to package/ifupdown-scripts/S40network
diff --git a/package/ifupdown-scripts/ifupdown-scripts.mk b/package/ifupdown-scripts/ifupdown-scripts.mk
new file mode 100644
index 0000000000..fc58e0bc0a
--- /dev/null
+++ b/package/ifupdown-scripts/ifupdown-scripts.mk
@@ -0,0 +1,57 @@
+################################################################################
+#
+# ifupdown-scripts
+#
+################################################################################
+
+IFUPDOWN_SCRIPTS_SOURCE =
+
+define IFUPDOWN_SCRIPTS_LOCALHOST
+	( \
+		echo "# interface file auto-generated by buildroot"; \
+		echo ; \
+		echo "auto lo"; \
+		echo "iface lo inet loopback"; \
+	) > $(TARGET_DIR)/etc/network/interfaces
+endef
+
+IFUPDOWN_SCRIPTS_DHCP_IFACE = $(call qstrip,$(BR2_SYSTEM_DHCP))
+
+ifneq ($(IFUPDOWN_SCRIPTS_DHCP_IFACE),)
+define IFUPDOWN_SCRIPTS_DHCP
+	( \
+		echo ; \
+		echo "auto $(IFUPDOWN_SCRIPTS_DHCP_IFACE)"; \
+		echo "iface $(IFUPDOWN_SCRIPTS_DHCP_IFACE) inet dhcp"; \
+		echo "  pre-up /etc/network/nfs_check"; \
+		echo "  wait-delay 15"; \
+	) >> $(TARGET_DIR)/etc/network/interfaces
+	$(INSTALL) -m 0755 -D $(IFUPDOWN_SCRIPTS_PKGDIR)/nfs_check \
+		$(TARGET_DIR)/etc/network/nfs_check
+endef
+endif
+
+define IFUPDOWN_SCRIPTS_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/etc/network
+	cp -a $(IFUPDOWN_SCRIPTS_PKGDIR)/network/* $(TARGET_DIR)/etc/network
+	$(IFUPDOWN_SCRIPTS_LOCALHOST)
+	$(IFUPDOWN_SCRIPTS_DHCP)
+endef
+
+define IFUPDOWN_SCRIPTS_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 $(IFUPDOWN_SCRIPTS_PKGDIR)/S40network \
+		$(TARGET_DIR)/etc/init.d/S40network
+endef
+
+# ifupdown-scripts can not be selected when systemd-networkd is
+# enabled, so if we are enabled with systemd, we must install our
+# own service file.
+define IFUPDOWN_SCRIPTS_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 $(IFUPDOWN_SCRIPTS_PKGDIR)/network.service \
+		$(TARGET_DIR)/etc/systemd/system/network.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -fs ../network.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/network.service
+endef
+
+$(eval $(generic-package))
diff --git a/package/systemd/network.service b/package/ifupdown-scripts/network.service
similarity index 100%
rename from package/systemd/network.service
rename to package/ifupdown-scripts/network.service
diff --git a/system/skeleton/etc/network/if-down.d/.empty b/package/ifupdown-scripts/network/if-down.d/.empty
similarity index 100%
rename from system/skeleton/etc/network/if-down.d/.empty
rename to package/ifupdown-scripts/network/if-down.d/.empty
diff --git a/system/skeleton/etc/network/if-post-down.d/.empty b/package/ifupdown-scripts/network/if-post-down.d/.empty
similarity index 100%
rename from system/skeleton/etc/network/if-post-down.d/.empty
rename to package/ifupdown-scripts/network/if-post-down.d/.empty
diff --git a/system/skeleton/etc/network/if-pre-up.d/wait_iface b/package/ifupdown-scripts/network/if-pre-up.d/wait_iface
similarity index 100%
rename from system/skeleton/etc/network/if-pre-up.d/wait_iface
rename to package/ifupdown-scripts/network/if-pre-up.d/wait_iface
diff --git a/system/skeleton/etc/network/if-up.d/.empty b/package/ifupdown-scripts/network/if-up.d/.empty
similarity index 100%
rename from system/skeleton/etc/network/if-up.d/.empty
rename to package/ifupdown-scripts/network/if-up.d/.empty
diff --git a/package/skeleton/nfs_check b/package/ifupdown-scripts/nfs_check
similarity index 100%
rename from package/skeleton/nfs_check
rename to package/ifupdown-scripts/nfs_check
diff --git a/package/ifupdown/Config.in b/package/ifupdown/Config.in
index 97d02b4c37..f080fe2022 100644
--- a/package/ifupdown/Config.in
+++ b/package/ifupdown/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_IFUPDOWN
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 # iproute2
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	select BR2_PACKAGE_IFUPDOWN_SCRIPTS
 	# runtime for ip binary
 	select BR2_PACKAGE_IPROUTE2 if !BR2_PACKAGE_BUSYBOX
 	# runtime for run-parts
diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
index 1321eb62cd..a310a314a5 100644
--- a/package/skeleton/skeleton.mk
+++ b/package/skeleton/skeleton.mk
@@ -145,39 +145,6 @@ endef
 TARGET_FINALIZE_HOOKS += SKELETON_SET_ISSUE
 endif
 
-define SKELETON_SET_NETWORK_LOCALHOST
-	( \
-		echo "# interface file auto-generated by buildroot"; \
-		echo ; \
-		echo "auto lo"; \
-		echo "iface lo inet loopback"; \
-	) > $(TARGET_DIR)/etc/network/interfaces
-endef
-
-SKELETON_NETWORK_DHCP_IFACE = $(call qstrip,$(BR2_SYSTEM_DHCP))
-
-ifneq ($(SKELETON_NETWORK_DHCP_IFACE),)
-define SKELETON_SET_NETWORK_DHCP
-	( \
-		echo ; \
-		echo "auto $(SKELETON_NETWORK_DHCP_IFACE)"; \
-		echo "iface $(SKELETON_NETWORK_DHCP_IFACE) inet dhcp"; \
-		echo "	pre-up /etc/network/nfs_check"; \
-		echo "	wait-delay 15"; \
-	) >> $(TARGET_DIR)/etc/network/interfaces
-	$(INSTALL) -m 0755 -D $(SKELETON_PKGDIR)/nfs_check \
-		$(TARGET_DIR)/etc/network/nfs_check
-endef
-endif
-
-define SKELETON_SET_NETWORK
-	mkdir -p $(TARGET_DIR)/etc/network/
-	$(SKELETON_SET_NETWORK_LOCALHOST)
-	$(SKELETON_SET_NETWORK_DHCP)
-endef
-
-TARGET_FINALIZE_HOOKS += SKELETON_SET_NETWORK
-
 ifeq ($(BR2_TARGET_ENABLE_ROOT_LOGIN),y)
 ifeq ($(SKELETON_TARGET_GENERIC_ROOT_PASSWD),)
 SKELETON_ROOT_PASSWORD =
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 478cc104a9..42fb23b176 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -26,6 +26,7 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	select BR2_PACKAGE_KMOD
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # kmod-tools
 	select BR2_PACKAGE_KMOD_TOOLS
+	select BR2_PACKAGE_IFUPDOWN_SCRIPTS if !BR2_PACKAGE_SYSTEMD_NETWORKD
 	help
 	  systemd is a system and service manager for Linux, compatible with
 	  SysV and LSB init scripts. systemd provides aggressive parallelization
@@ -197,6 +198,7 @@ config BR2_PACKAGE_SYSTEMD_MYHOSTNAME
 
 	  http://www.freedesktop.org/software/systemd/man/nss-myhostname.html
 
+# If not enabled, then ifupdown-scripts is used; see main option, above.
 config BR2_PACKAGE_SYSTEMD_NETWORKD
 	bool "enable network manager"
 	default y
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index a853434717..af42a69b7f 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -308,13 +308,6 @@ endef
 endif
 else
 SYSTEMD_CONF_OPTS += --disable-networkd
-define SYSTEMD_INSTALL_SERVICE_NETWORK
-	$(INSTALL) -D -m 644 package/systemd/network.service \
-		$(TARGET_DIR)/etc/systemd/system/network.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -fs ../network.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/network.service
-endef
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_RESOLVED),y)
@@ -406,7 +399,6 @@ endif
 define SYSTEMD_INSTALL_INIT_SYSTEMD
 	$(SYSTEMD_DISABLE_SERVICE_TTY1)
 	$(SYSTEMD_INSTALL_SERVICE_TTY)
-	$(SYSTEMD_INSTALL_SERVICE_NETWORK)
 	$(SYSTEMD_INSTALL_SERVICE_TIMESYNC)
 	$(SYSTEMD_INSTALL_NETWORK_CONFS)
 endef
-- 
2.11.0
