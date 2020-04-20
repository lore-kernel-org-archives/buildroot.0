From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 20 Apr 2020 09:53:05 +0200
Subject: [Buildroot] [git commit] linux: enable AppArmor-related options if
 needed
Message-ID: <20200420075435.873DF8F447@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=67e576fab524c6341d86aa34a8c93306533b6e1a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Using AppArmor requires support in the kernel, so do for AppArmor what
we did for SElinux, and enabled the necessary options.

Note that a single LSM can be the default one, so as of today, SELinux
wins, by virtue of being the last to be enabled.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
[yann.morin.1998 at free.fr:
  - don't force DEFAULT_SECURITY_APPARMOR, it does not exist in all
    kernel versions
  - move closer to SELinux
  - split into its own patch, write a commit log
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Tested-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 linux/linux.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 3d9052a337..68c1121c4b 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -408,6 +408,11 @@ define LINUX_KCONFIG_FIXUP_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_FB,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_LOGO,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_LOGO_LINUX_CLUT224,$(@D)/.config))
+	$(if $(BR2_PACKAGE_LIBAPPARMOR),
+		$(call KCONFIG_ENABLE_OPT,CONFIG_AUDIT,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY_APPARMOR,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_DEFAULT_SECURITY_APPARMOR,$(@D)/.config))
 	$(if $(BR2_PACKAGE_LIBSELINUX),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_AUDIT,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_DEFAULT_SECURITY_SELINUX,$(@D)/.config)
