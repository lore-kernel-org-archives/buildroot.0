From: Arnaud Aujon <arnaud.aujon@gmail.com>
Date: Thu, 24 Oct 2013 10:55:17 +0200
Subject: [Buildroot]  [PATCH] Rename netkitbase and netkittelnet
Message-ID: <1382604917-7742-1-git-send-email-arnaud.aujon@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rename netkitbase and netkittelnet according to naming policy.
Updates package/Config.in and busybox.mk accordingly.

Signed-off-by: Arnaud Aujon <arnaud.aujon@gmail.com>
---
 package/Config.in                                    |  4 ++--
 package/busybox/busybox.mk                           | 12 ++++++------
 package/{netkitbase => netkit-base}/Config.in        |  6 +++---
 .../netkit-base-gcc4.patch}                          |  0
 .../netkit-base-remove-bcopy.patch}                  |  0
 .../netkitbase.mk => netkit-base/netkit-base.mk}     | 20 ++++++++++----------
 package/{netkittelnet => netkit-telnet}/Config.in    |  8 ++++----
 .../netkit-telnet-bcopy.patch}                       |  0
 .../netkit-telnet.mk}                                | 18 +++++++++---------
 .../netkit-telnet.patch}                             |  0
 10 files changed, 34 insertions(+), 34 deletions(-)
 rename package/{netkitbase => netkit-base}/Config.in (70%)
 rename package/{netkitbase/netkitbase-gcc4.patch => netkit-base/netkit-base-gcc4.patch} (100%)
 rename package/{netkitbase/netkitbase-remove-bcopy.patch => netkit-base/netkit-base-remove-bcopy.patch} (100%)
 rename package/{netkitbase/netkitbase.mk => netkit-base/netkit-base.mk} (60%)
 rename package/{netkittelnet => netkit-telnet}/Config.in (61%)
 rename package/{netkittelnet/netkittelnet-bcopy.patch => netkit-telnet/netkit-telnet-bcopy.patch} (100%)
 rename package/{netkittelnet/netkittelnet.mk => netkit-telnet/netkit-telnet.mk} (69%)
 rename package/{netkittelnet/netkittelnet.patch => netkit-telnet/netkit-telnet.patch} (100%)

diff --git a/package/Config.in b/package/Config.in
index 0e6f86c..db2a436 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -831,8 +831,8 @@ source "package/ndisc6/Config.in"
 source "package/netatalk/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/netcat/Config.in"
-source "package/netkitbase/Config.in"
-source "package/netkittelnet/Config.in"
+source "package/netkit-base/Config.in"
+source "package/netkit-telnet/Config.in"
 endif
 source "package/netplug/Config.in"
 source "package/netsnmp/Config.in"
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index ad8bdaf..3ad7b8d 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -121,15 +121,15 @@ endef
 endif
 
 # Disable usage of inetd if netkit-base package is selected
-ifeq ($(BR2_PACKAGE_NETKITBASE),y)
-define BUSYBOX_NETKITBASE
+ifeq ($(BR2_PACKAGE_NETKIT_BASE),y)
+define BUSYBOX_NETKIT_BASE
 	$(call KCONFIG_DISABLE_OPT,CONFIG_INETD,$(BUSYBOX_BUILD_CONFIG))
 endef
 endif
 
 # Disable usage of telnetd if netkit-telnetd package is selected
-ifeq ($(BR2_PACKAGE_NETKITTELNET),y)
-define BUSYBOX_NETKITTELNET
+ifeq ($(BR2_PACKAGE_NETKIT_TELNET),y)
+define BUSYBOX_NETKIT_TELNET
 	$(call KCONFIG_DISABLE_OPT,CONFIG_TELNETD,$(BUSYBOX_BUILD_CONFIG))
 endef
 endif
@@ -182,8 +182,8 @@ define BUSYBOX_CONFIGURE_CMDS
 	$(BUSYBOX_SET_IPV6)
 	$(BUSYBOX_PREFER_STATIC)
 	$(BUSYBOX_SET_MDEV)
-	$(BUSYBOX_NETKITBASE)
-	$(BUSYBOX_NETKITTELNET)
+	$(BUSYBOX_NETKIT_BASE)
+	$(BUSYBOX_NETKIT_TELNET)
 	$(BUSYBOX_INTERNAL_SHADOW_PASSWORDS)
 	$(BUSYBOX_SET_INIT)
 	$(BUSYBOX_SET_WATCHDOG)
diff --git a/package/netkitbase/Config.in b/package/netkit-base/Config.in
similarity index 70%
rename from package/netkitbase/Config.in
rename to package/netkit-base/Config.in
index 793fdaa..a66b758 100644
--- a/package/netkitbase/Config.in
+++ b/package/netkit-base/Config.in
@@ -1,5 +1,5 @@
-config BR2_PACKAGE_NETKITBASE
-	bool "netkitbase"
+config BR2_PACKAGE_NETKIT_BASE
+	bool "netkit-base"
 	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_DEPRECATED
@@ -8,5 +8,5 @@ config BR2_PACKAGE_NETKITBASE
 
 	  ftp://ftp.uk.linux.org/pub/linux/Networking/netkit/
 
-comment "netkitbase needs a toolchain w/ RPC"
+comment "netkit-base needs a toolchain w/ RPC"
         depends on !BR2_TOOLCHAIN_HAS_NATIVE_RPC
diff --git a/package/netkitbase/netkitbase-gcc4.patch b/package/netkit-base/netkit-base-gcc4.patch
similarity index 100%
rename from package/netkitbase/netkitbase-gcc4.patch
rename to package/netkit-base/netkit-base-gcc4.patch
diff --git a/package/netkitbase/netkitbase-remove-bcopy.patch b/package/netkit-base/netkit-base-remove-bcopy.patch
similarity index 100%
rename from package/netkitbase/netkitbase-remove-bcopy.patch
rename to package/netkit-base/netkit-base-remove-bcopy.patch
diff --git a/package/netkitbase/netkitbase.mk b/package/netkit-base/netkit-base.mk
similarity index 60%
rename from package/netkitbase/netkitbase.mk
rename to package/netkit-base/netkit-base.mk
index b17ee99..f680e89 100644
--- a/package/netkitbase/netkitbase.mk
+++ b/package/netkit-base/netkit-base.mk
@@ -1,30 +1,30 @@
 ################################################################################
 #
-# netkitbase
+# netkit-base
 #
 ################################################################################
 
-NETKITBASE_VERSION = 0.17
-NETKITBASE_SOURCE  = netkit-base-$(NETKITBASE_VERSION).tar.gz
-NETKITBASE_SITE    = ftp://ftp.uk.linux.org/pub/linux/Networking/netkit/
-NETKITBASE_LICENSE = BSD-4c
+NETKIT_BASE_VERSION = 0.17
+NETKIT_BASE_SOURCE  = netkit-base-$(NETKIT_BASE_VERSION).tar.gz
+NETKIT_BASE_SITE    = ftp://ftp.linux.org.uk/pub/linux/Networking/netkit/
+NETKIT_BASE_LICENSE = BSD-4c
 
-define NETKITBASE_CONFIGURE_CMDS
+define NETKIT_BASE_CONFIGURE_CMDS
 	# use ANSI syntax
-	$(SED) "s/main()/main(void)/;" $(NETKITBASE_DIR)/configure
+	$(SED) "s/main()/main(void)/;" $(NETKIT_BASE_DIR)/configure
 	# don't try to run cross compiled binaries while configuring things
-	$(SED) "s~./__conftest~#./__conftest~;" $(NETKITBASE_DIR)/configure
+	$(SED) "s~./__conftest~#./__conftest~;" $(NETKIT_BASE_DIR)/configure
 	(cd $(@D); \
 		$(TARGET_CONFIGURE_OPTS) \
 		./configure \
 		--installroot=$(TARGET_DIR))
 endef
 
-define NETKITBASE_BUILD_CMDS
+define NETKIT_BASE_BUILD_CMDS
 	$(MAKE) -C $(@D)
 endef
 
-define NETKITBASE_INSTALL_TARGET_CMDS
+define NETKIT_BASE_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/inetd/inetd $(TARGET_DIR)/usr/sbin/inetd
 	if [ ! -f $(TARGET_DIR)/etc/inetd.conf ]; then \
 		$(INSTALL) -D -m 0644 $(@D)/etc.sample/inetd.conf $(TARGET_DIR)/etc/inetd.conf; \
diff --git a/package/netkittelnet/Config.in b/package/netkit-telnet/Config.in
similarity index 61%
rename from package/netkittelnet/Config.in
rename to package/netkit-telnet/Config.in
index b0229b3..09cff82 100644
--- a/package/netkittelnet/Config.in
+++ b/package/netkit-telnet/Config.in
@@ -1,12 +1,12 @@
-config BR2_PACKAGE_NETKITTELNET
-	bool "netkittelnet"
+config BR2_PACKAGE_NETKIT_TELNET
+	bool "netkit-telnet"
 	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	depends on BR2_DEPRECATED
-	select BR2_PACKAGE_NETKITBASE
+	select BR2_PACKAGE_NETKIT_BASE
 	help
 	  Standard Linux telnet client and server.
 
 	  ftp://ftp.uk.linux.org/pub/linux/Networking/netkit/
 
-comment "netkittelnet needs a toolchain w/ RPC"
+comment "netkit-telnet needs a toolchain w/ RPC"
 	depends on !BR2_TOOLCHAIN_HAS_NATIVE_RPC
diff --git a/package/netkittelnet/netkittelnet-bcopy.patch b/package/netkit-telnet/netkit-telnet-bcopy.patch
similarity index 100%
rename from package/netkittelnet/netkittelnet-bcopy.patch
rename to package/netkit-telnet/netkit-telnet-bcopy.patch
diff --git a/package/netkittelnet/netkittelnet.mk b/package/netkit-telnet/netkit-telnet.mk
similarity index 69%
rename from package/netkittelnet/netkittelnet.mk
rename to package/netkit-telnet/netkit-telnet.mk
index ca3b930..595e48b 100644
--- a/package/netkittelnet/netkittelnet.mk
+++ b/package/netkit-telnet/netkit-telnet.mk
@@ -1,16 +1,16 @@
 ################################################################################
 #
-# netkittelnet
+# netkit-telnet
 #
 ################################################################################
 
-NETKITTELNET_VERSION = 0.17
-NETKITTELNET_SOURCE  = netkit-telnet-$(NETKITTELNET_VERSION).tar.gz
-NETKITTELNET_SITE    = ftp://ftp.uk.linux.org/pub/linux/Networking/netkit/
-NETKITTELNET_LICENSE = BSD-4c
-NETKITTELNET_DEPENDENCIES = netkitbase
+NETKIT_TELNET_VERSION = 0.17
+NETKIT_TELNET_SOURCE  = netkit-telnet-$(NETKIT_TELNET_VERSION).tar.gz
+NETKIT_TELNET_SITE    = ftp://ftp.linux.org.uk/pub/linux/Networking/netkit/
+NETKIT_TELNET_LICENSE = BSD-4c
+NETKIT_TELNET_DEPENDENCIES = netkit-base
 
-define NETKITTELNET_CONFIGURE_CMDS
+define NETKIT_TELNET_CONFIGURE_CMDS
 	# use ANSI syntax
 	$(SED) "s/main()/main(void)/;" $(@D)/configure
 	# Disable termcap support
@@ -23,11 +23,11 @@ define NETKITTELNET_CONFIGURE_CMDS
 		--installroot=$(TARGET_DIR))
 endef
 
-define NETKITTELNET_BUILD_CMDS
+define NETKIT_TELNET_BUILD_CMDS
 	$(MAKE) SUB=telnetd -C $(@D)
 endef
 
-define NETKITTELNET_INSTALL_TARGET_CMDS
+define NETKIT_TELNET_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/telnetd/telnetd $(TARGET_DIR)/usr/sbin/telnetd
 	# Enable telnet in inetd
 	$(SED) "s~^#telnet.*~telnet\tstream\ttcp\tnowait\troot\t/usr/sbin/telnetd\t/usr/sbin/telnetd~;" $(TARGET_DIR)/etc/inetd.conf
diff --git a/package/netkittelnet/netkittelnet.patch b/package/netkit-telnet/netkit-telnet.patch
similarity index 100%
rename from package/netkittelnet/netkittelnet.patch
rename to package/netkit-telnet/netkit-telnet.patch
-- 
1.8.3.1
