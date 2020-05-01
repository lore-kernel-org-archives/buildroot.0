From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 1 May 2020 15:50:28 +0200
Subject: [Buildroot] [git commit] package/systemd: bear the kernel options
 munging
Message-ID: <20200501133531.08A7C90D04@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=94cb81451172881ccf433d9635d215465bfcb8fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Adam Duskett <aduskett@gmail.com>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/linux.mk             | 7 -------
 package/systemd/systemd.mk | 9 +++++++++
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 1bf7932a55..c122ab70e0 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -357,13 +357,6 @@ define LINUX_KCONFIG_FIXUP_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_NET))
 	$(if $(BR2_PACKAGE_LINUX_TOOLS_PERF),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_PERF_EVENTS))
-	$(if $(BR2_PACKAGE_SYSTEMD),
-		$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUPS)
-		$(call KCONFIG_ENABLE_OPT,CONFIG_INOTIFY_USER)
-		$(call KCONFIG_ENABLE_OPT,CONFIG_FHANDLE)
-		$(call KCONFIG_ENABLE_OPT,CONFIG_AUTOFS4_FS)
-		$(call KCONFIG_ENABLE_OPT,CONFIG_TMPFS_POSIX_ACL)
-		$(call KCONFIG_ENABLE_OPT,CONFIG_TMPFS_XATTR))
 	$(if $(BR2_PACKAGE_SMACK),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY_SMACK)
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index b45a70b7ad..9f5429fd19 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -551,6 +551,15 @@ SYSTEMD_TARGET_FINALIZE_HOOKS += SYSTEMD_PRESET_ALL
 SYSTEMD_CONF_ENV = $(HOST_UTF8_LOCALE_ENV)
 SYSTEMD_NINJA_ENV = $(HOST_UTF8_LOCALE_ENV)
 
+define SYSTEMD_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUPS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_INOTIFY_USER)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_FHANDLE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_AUTOFS4_FS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_TMPFS_POSIX_ACL)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_TMPFS_XATTR)
+endef
+
 # We need a very minimal host variant, so we disable as much as possible.
 HOST_SYSTEMD_CONF_OPTS = \
 	-Dsplit-bin=true \
