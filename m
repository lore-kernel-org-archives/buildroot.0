From: Carlos Santos <casantos@datacom.com.br>
Date: Sat,  3 Nov 2018 13:42:43 -0300
Subject: [Buildroot] [PATCH 3/4] linux: enble AUDIT if the audit package is
 selected
In-Reply-To: <20181103164244.10607-1-casantos@datacom.com.br>
References: <20181103164244.10607-1-casantos@datacom.com.br>
Message-ID: <20181103164244.10607-4-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We already turn on kernel features for several packages, so let's do it
for audit too, since the daemon is useless and fails to load otherwise.

Notice that we also turn NET on, since AUDIT depends on NET, like we do
for the wireguard package.

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
---
 linux/linux.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index e9c75153b2..476ff16329 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -320,6 +320,9 @@ define LINUX_KCONFIG_FIXUP_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS_MOUNT,$(@D)/.config))
 	$(if $(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_INOTIFY_USER,$(@D)/.config))
+	$(if $(BR2_PACKAGE_AUDIT),
+		$(call KCONFIG_ENABLE_OPT,CONFIG_NET,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_AUDIT,$(@D)/.config))
 	$(if $(BR2_PACKAGE_KTAP),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_DEBUG_FS,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_ENABLE_DEFAULT_TRACERS,$(@D)/.config)
-- 
2.17.1
