From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 12 Jun 2011 21:59:59 +0200
Subject: [Buildroot] [git commit] busybox: adjust configuration for non-MMU
	targets
Message-ID: <20110612210710.B7CD78733B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=85e54a6b772ac7423286f6fa6a1a59e761edba54
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The swaponoff applet doesn't build (and doesn't make sense) on non-MMU
platforms.

The ash shell cannot build on non-MMU platforms (because it uses
fork()), so select the hush shell instead.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/busybox.mk |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index ca963c1..b77880c 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -133,6 +133,14 @@ define BUSYBOX_INTERNAL_SHADOW_PASSWORDS
 endef
 endif
 
+ifeq ($(BR2_USE_MMU),)
+define BUSYBOX_DISABLE_MMU_APPLETS
+	$(call KCONFIG_DISABLE_OPT,CONFIG_SWAPONOFF,$(BUSYBOX_BUILD_CONFIG))
+	$(call KCONFIG_DISABLE_OPT,CONFIG_ASH,$(BUSYBOX_BUILD_CONFIG))
+	$(call KCONFIG_ENABLE_OPT,CONFIG_HUSH,$(BUSYBOX_BUILD_CONFIG))
+endef
+endif
+
 # We do this here to avoid busting a modified .config in configure
 BUSYBOX_POST_EXTRACT_HOOKS += BUSYBOX_COPY_CONFIG
 
@@ -147,6 +155,7 @@ define BUSYBOX_CONFIGURE_CMDS
 	$(BUSYBOX_NETKITBASE)
 	$(BUSYBOX_NETKITTELNET)
 	$(BUSYBOX_INTERNAL_SHADOW_PASSWORDS)
+	$(BUSYBOX_DISABLE_MMU_APPLETS)
 	@yes "" | $(MAKE) ARCH=$(KERNEL_ARCH) CROSS_COMPILE="$(TARGET_CROSS)" \
 		-C $(@D) oldconfig
 endef
-- 
1.7.3.4
