From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 May 2018 22:58:38 +0200
Subject: [Buildroot] [git commit branch/next] busybox: remove musl specific
 tweaks
Message-ID: <20180513205826.61EFA83455@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e0a8b910f66531421dde1f20ba9aac604dc24e86
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Busybox build fine under current musl using its provided shadow
passwords and utmp/wtmp support.

Cc: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/busybox/busybox.mk | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 60a55a2c78..7033c4304a 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -156,21 +156,6 @@ define BUSYBOX_INTERNAL_SHADOW_PASSWORDS
 endef
 endif
 
-# We also need to use internal shadow password functions when using
-# the musl C library, since some of them are not yet implemented by
-# musl.
-#
-# Do not use utmp/wmtp support. wmtp support is not available in musl,
-# and utmp support is not sufficient for Busybox.
-ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
-define BUSYBOX_MUSL_TWEAKS
-	$(call KCONFIG_ENABLE_OPT,CONFIG_USE_BB_PWD_GRP,$(BUSYBOX_BUILD_CONFIG))
-	$(call KCONFIG_ENABLE_OPT,CONFIG_USE_BB_SHADOW,$(BUSYBOX_BUILD_CONFIG))
-	$(call KCONFIG_DISABLE_OPT,CONFIG_FEATURE_UTMP,$(BUSYBOX_BUILD_CONFIG))
-	$(call KCONFIG_DISABLE_OPT,CONFIG_FEATURE_WTMP,$(BUSYBOX_BUILD_CONFIG))
-endef
-endif
-
 define BUSYBOX_INSTALL_UDHCPC_SCRIPT
 	if grep -q CONFIG_UDHCPC=y $(@D)/.config; then \
 		$(INSTALL) -m 0755 -D package/busybox/udhcpc.script \
@@ -293,7 +278,6 @@ define BUSYBOX_KCONFIG_FIXUP_CMDS
 	$(BUSYBOX_SET_WATCHDOG)
 	$(BUSYBOX_SET_SELINUX)
 	$(BUSYBOX_SET_INDIVIDUAL_BINARIES)
-	$(BUSYBOX_MUSL_TWEAKS)
 endef
 
 define BUSYBOX_CONFIGURE_CMDS
