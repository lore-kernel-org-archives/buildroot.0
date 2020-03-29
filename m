From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Mar 2020 16:01:38 +0200
Subject: [Buildroot] [PATCH 2/9 v5] linux: enable AppArmor-related options
 if needed
In-Reply-To: <cover.1585490494.git.yann.morin.1998@free.fr>
References: <cover.1585490494.git.yann.morin.1998@free.fr>
Message-ID: <063eeb6b5efd47075ee0c923cc379909de508f9e.1585490494.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Angelo Compagnucci <angelo@amarulasolutions.com>

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
---
 linux/linux.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index b2ceeecafb..9403612d27 100644
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
-- 
2.20.1
