From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 May 2018 22:58:40 +0200
Subject: [Buildroot] [git commit branch/next] busybox: remove shadow
 passwords config tweaks
Message-ID: <20180513205826.6C16087F70@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9e11eaa82f4d8dd832811212d52ae11dcf85c97f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

These configuration tweaks were added for compatibility with Blackfin
toolchains that bundled a uClibc version without shadow passwords
support. Blackfin is gone, so this is no longer needed.

Cc: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/busybox/busybox.mk | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 7033c4304a..75fe7e137b 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -148,14 +148,6 @@ define BUSYBOX_PREFER_STATIC
 endef
 endif
 
-# Disable shadow passwords support if unsupported by the C library
-ifeq ($(BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS),)
-define BUSYBOX_INTERNAL_SHADOW_PASSWORDS
-	$(call KCONFIG_ENABLE_OPT,CONFIG_USE_BB_PWD_GRP,$(BUSYBOX_BUILD_CONFIG))
-	$(call KCONFIG_ENABLE_OPT,CONFIG_USE_BB_SHADOW,$(BUSYBOX_BUILD_CONFIG))
-endef
-endif
-
 define BUSYBOX_INSTALL_UDHCPC_SCRIPT
 	if grep -q CONFIG_UDHCPC=y $(@D)/.config; then \
 		$(INSTALL) -m 0755 -D package/busybox/udhcpc.script \
@@ -273,7 +265,6 @@ define BUSYBOX_KCONFIG_FIXUP_CMDS
 	$(BUSYBOX_SET_MDEV)
 	$(BUSYBOX_SET_CRYPT_SHA)
 	$(BUSYBOX_LINUX_PAM)
-	$(BUSYBOX_INTERNAL_SHADOW_PASSWORDS)
 	$(BUSYBOX_SET_INIT)
 	$(BUSYBOX_SET_WATCHDOG)
 	$(BUSYBOX_SET_SELINUX)
