From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Oct 2017 22:59:26 +0200
Subject: [Buildroot] [git commit] wireguard: add new package
Message-ID: <20171002205336.6E0B3810FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5a47141ebb62dc4248bb94f04a35413a8b503064
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: Fix help text, drop suboptions, drop patches, fix dependencies,
 handle optional bash dependency, use kernel-module infrastructure,
 enable needed kernel options]
Signed-off-by: Aur??lien Chabot <aurelien@chabot.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.mk                   |  6 ++++++
 package/Config.in                |  1 +
 package/wireguard/Config.in      | 18 ++++++++++++++++++
 package/wireguard/wireguard.hash |  2 ++
 package/wireguard/wireguard.mk   | 41 ++++++++++++++++++++++++++++++++++++++++
 5 files changed, 68 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index c7bf83a..9c2aa77 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -300,6 +300,12 @@ define LINUX_KCONFIG_FIXUP_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_ADVANCED,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_MARK,$(@D)/.config))
+	$(if $(BR2_PACKAGE_WIREGUARD),
+		$(call KCONFIG_ENABLE_OPT,CONFIG_INET,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_NET,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_NET_FOU,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_MANAGER,$(@D)/.config))
 	$(if $(BR2_LINUX_KERNEL_APPENDED_DTB),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_ARM_APPENDED_DTB,$(@D)/.config))
 	$(if $(BR2_PACKAGE_KERNEL_MODULE_IMX_GPU_VIV),
diff --git a/package/Config.in b/package/Config.in
index 0dfe086..2381878 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1794,6 +1794,7 @@ endif
 	source "package/wavemon/Config.in"
 	source "package/wget/Config.in"
 	source "package/whois/Config.in"
+	source "package/wireguard/Config.in"
 	source "package/wireless-regdb/Config.in"
 	source "package/wireless_tools/Config.in"
 	source "package/wireshark/Config.in"
diff --git a/package/wireguard/Config.in b/package/wireguard/Config.in
new file mode 100644
index 0000000..0321755
--- /dev/null
+++ b/package/wireguard/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_WIREGUARD
+	bool "wireguard"
+	select BR2_PACKAGE_LIBMNL
+	help
+	  WireGuard is an extremely simple yet fast and modern VPN
+	  that utilizes state-of-the-art cryptography. It aims to be
+	  faster, simpler, leaner, and more useful than IPSec, while
+	  avoiding the massive headache. It intends to be considerably
+	  more performant than OpenVPN. WireGuard is designed as a
+	  general purpose VPN for running on embedded interfaces and
+	  super computers alike, fit for many different
+	  circumstances. Initially released for the Linux kernel, it
+	  plans to be cross-platform and widely deployable. It is
+	  currently under heavy development, but already it might be
+	  regarded as the most secure, easiest to use, and simplest
+	  VPN solution in the industry.
+
+	  https://www.wireguard.com
diff --git a/package/wireguard/wireguard.hash b/package/wireguard/wireguard.hash
new file mode 100644
index 0000000..5bd1163
--- /dev/null
+++ b/package/wireguard/wireguard.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 ab96230390625aad6f4816fa23aef6e9f7fee130f083d838919129ff12089bf7 WireGuard-0.0.20170810.tar.xz
diff --git a/package/wireguard/wireguard.mk b/package/wireguard/wireguard.mk
new file mode 100644
index 0000000..1f2190c
--- /dev/null
+++ b/package/wireguard/wireguard.mk
@@ -0,0 +1,41 @@
+################################################################################
+#
+# wireguard
+#
+################################################################################
+
+WIREGUARD_VERSION = 0.0.20170810
+WIREGUARD_SITE = https://git.zx2c4.com/WireGuard/snapshot
+WIREGUARD_SOURCE = WireGuard-$(WIREGUARD_VERSION).tar.xz
+WIREGUARD_LICENSE = GPL-2.0
+WIREGUARD_LICENSE_FILES = COPYING
+WIREGUARD_DEPENDENCIES = host-pkgconf libmnl
+
+ifeq ($(BR2_INIT_SYSTEMD),y)
+WIREGUARD_MAKE_OPTS += WITH_SYSTEMDUNITS=yes
+else
+WIREGUARD_MAKE_OPTS += WITH_SYSTEMDUNITS=no
+endif
+
+ifeq ($(BR2_PACKAGE_BASH),y)
+WIREGUARD_MAKE_OPTS += WITH_BASHCOMPLETION=yes WITH_WGQUICK=yes
+else
+WIREGUARD_MAKE_OPTS += WITH_BASHCOMPLETION=no WITH_WGQUICK=no
+endif
+
+define WIREGUARD_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(WIREGUARD_MAKE_OPTS) \
+		-C $(@D)/src/tools
+endef
+
+define WIREGUARD_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(WIREGUARD_MAKE_OPTS) \
+		-C $(@D)/src/tools install DESTDIR=$(TARGET_DIR)
+endef
+
+ifeq ($(BR2_LINUX_KERNEL),y)
+WIREGUARD_MODULE_SUBDIRS = src
+$(eval $(kernel-module))
+endif
+
+$(eval $(generic-package))
