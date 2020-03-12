From: aduskett at gmail.com <aduskett@gmail.com>
Date: Thu, 12 Mar 2020 11:09:08 -0700
Subject: [Buildroot] [PATCH 1/1] linux/linux.mk: add automatic selinux
 config selection
Message-ID: <20200312180909.2948885-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Enabling SELinux support in the kernel requires several options, many of which
are in different areas. These options are as follows:

  - CONFIG_AUDIT
  - CONFIG_DEFAULT_SECURITY_SELINUX
  - CONFIG_INET
  - CONFIG_NET
  - CONFIG_SECURITY
  - CONFIG_SECURITY_NETWORK
  - CONFIG_SECURITY_SELINUX

As such, if a user selects the libselinux package, it is much easier to select
these packages for them, much like we already do with other packages
such as systemd or iptables.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 linux/linux.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 4b60f33ff3..f8c34c3dca 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -406,6 +406,14 @@ define LINUX_KCONFIG_FIXUP_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_FB,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_LOGO,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_LOGO_LINUX_CLUT224,$(@D)/.config))
+	$(if $(BR2_PACKAGE_LIBSELINUX),
+		$(call KCONFIG_ENABLE_OPT,CONFIG_AUDIT,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_DEFAULT_SECURITY_SELINUX,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_INET,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_NET,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY_NETWORK,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY_SELINUX,$(@D)/.config))
 endef
 
 ifeq ($(BR2_LINUX_KERNEL_DTS_SUPPORT),y)
-- 
2.24.1
