From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 31 Aug 2013 21:34:01 -0000
Subject: [Buildroot] [git commit] busybox: set/unset CONFIG_NOMMU
Message-ID: <20130831213336.AFEB29B591@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=149e4f89604880c355eb8af968b78647ab47fac9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Set busybox .config CONFIG_NOMMU appropiately and streamline this new
setting with the previous BUSYBOX_DISABLE_MMU_APPLETS in a single
BUSYBOX_SET_MMU definition (since it's not just applets now).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/busybox/busybox.mk |   23 ++++++++++++++---------
 1 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index acc9008..ad8bdaf 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -75,6 +75,19 @@ define BUSYBOX_SET_MDEV
 endef
 endif
 
+ifeq ($(BR2_USE_MMU),y)
+define BUSYBOX_SET_MMU
+	$(call KCONFIG_DISABLE_OPT,CONFIG_NOMMU,$(BUSYBOX_BUILD_CONFIG))
+endef
+else
+define BUSYBOX_SET_MMU
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NOMMU,$(BUSYBOX_BUILD_CONFIG))
+	$(call KCONFIG_DISABLE_OPT,CONFIG_SWAPONOFF,$(BUSYBOX_BUILD_CONFIG))
+	$(call KCONFIG_DISABLE_OPT,CONFIG_ASH,$(BUSYBOX_BUILD_CONFIG))
+	$(call KCONFIG_ENABLE_OPT,CONFIG_HUSH,$(BUSYBOX_BUILD_CONFIG))
+endef
+endif
+
 ifeq ($(BR2_LARGEFILE),y)
 define BUSYBOX_SET_LARGEFILE
 	$(call KCONFIG_ENABLE_OPT,CONFIG_LFS,$(BUSYBOX_BUILD_CONFIG))
@@ -133,14 +146,6 @@ define BUSYBOX_INTERNAL_SHADOW_PASSWORDS
 endef
 endif
 
-ifeq ($(BR2_USE_MMU),)
-define BUSYBOX_DISABLE_MMU_APPLETS
-	$(call KCONFIG_DISABLE_OPT,CONFIG_SWAPONOFF,$(BUSYBOX_BUILD_CONFIG))
-	$(call KCONFIG_DISABLE_OPT,CONFIG_ASH,$(BUSYBOX_BUILD_CONFIG))
-	$(call KCONFIG_ENABLE_OPT,CONFIG_HUSH,$(BUSYBOX_BUILD_CONFIG))
-endef
-endif
-
 ifeq ($(BR2_INIT_BUSYBOX),y)
 define BUSYBOX_SET_INIT
 	$(call KCONFIG_ENABLE_OPT,CONFIG_INIT,$(BUSYBOX_BUILD_CONFIG))
@@ -172,6 +177,7 @@ endif
 BUSYBOX_POST_EXTRACT_HOOKS += BUSYBOX_COPY_CONFIG
 
 define BUSYBOX_CONFIGURE_CMDS
+	$(BUSYBOX_SET_MMU)
 	$(BUSYBOX_SET_LARGEFILE)
 	$(BUSYBOX_SET_IPV6)
 	$(BUSYBOX_PREFER_STATIC)
@@ -179,7 +185,6 @@ define BUSYBOX_CONFIGURE_CMDS
 	$(BUSYBOX_NETKITBASE)
 	$(BUSYBOX_NETKITTELNET)
 	$(BUSYBOX_INTERNAL_SHADOW_PASSWORDS)
-	$(BUSYBOX_DISABLE_MMU_APPLETS)
 	$(BUSYBOX_SET_INIT)
 	$(BUSYBOX_SET_WATCHDOG)
 	@yes "" | $(MAKE) ARCH=$(KERNEL_ARCH) CROSS_COMPILE="$(TARGET_CROSS)" \
