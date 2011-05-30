From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 May 2011 23:56:58 +0200
Subject: [Buildroot] [PATCH 3/8] busybox: tune config according to
	BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
In-Reply-To: <cover.1306792524.git.thomas.petazzoni@free-electrons.com>
References: <cover.1306792524.git.thomas.petazzoni@free-electrons.com>
Message-ID: <6557d24967cffca74ecd52ee7f36a81038c9133e.1306792524.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/busybox/busybox.mk |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 711d11b..ca963c1 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -125,6 +125,14 @@ define BUSYBOX_COPY_CONFIG
 	cp -f $(BUSYBOX_CONFIG_FILE) $(BUSYBOX_BUILD_CONFIG)
 endef
 
+# Disable shadow passwords support if unsupported by the C library
+ifeq ($(BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS),)
+define BUSYBOX_INTERNAL_SHADOW_PASSWORDS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_USE_BB_PWD_GRP,$(BUSYBOX_BUILD_CONFIG))
+	$(call KCONFIG_ENABLE_OPT,CONFIG_USE_BB_SHADOW,$(BUSYBOX_BUILD_CONFIG))
+endef
+endif
+
 # We do this here to avoid busting a modified .config in configure
 BUSYBOX_POST_EXTRACT_HOOKS += BUSYBOX_COPY_CONFIG
 
@@ -138,6 +146,7 @@ define BUSYBOX_CONFIGURE_CMDS
 	$(BUSYBOX_SET_MDEV)
 	$(BUSYBOX_NETKITBASE)
 	$(BUSYBOX_NETKITTELNET)
+	$(BUSYBOX_INTERNAL_SHADOW_PASSWORDS)
 	@yes "" | $(MAKE) ARCH=$(KERNEL_ARCH) CROSS_COMPILE="$(TARGET_CROSS)" \
 		-C $(@D) oldconfig
 endef
-- 
1.7.1
