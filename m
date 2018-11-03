From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Nov 2018 22:22:05 +0100
Subject: [Buildroot] [git commit] linux: enable CONFIG_AUDIT if the audit
 package is selected
Message-ID: <20181103212453.4D5D781390@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2c828ed72fa51607714cbd7a53304d11db7145c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We already turn on kernel features for several packages, so let's do it
for audit too, since the daemon is useless and fails to load otherwise.

Notice that we also turn NET on, since AUDIT depends on NET, like we do
for the wireguard package.

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
