From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  6 Jul 2013 22:48:46 +0200
Subject: [Buildroot] [PATCH 07/12] linux: remove EABI conditional
In-Reply-To: <cover.1373143368.git.yann.morin.1998@free.fr>
References: <cover.1373143368.git.yann.morin.1998@free.fr>
Message-ID: <63ebabf8467d7e6bbc5317e251d680acfbaa285a.1373143368.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

We're only EABI now, so we want to always build an EABI kernel
when we're building for ARM.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 linux/linux.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index befef16..5ccd205 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -170,9 +170,8 @@ define LINUX_CONFIGURE_CMDS
 	cp $(KERNEL_SOURCE_CONFIG) $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig
 	$(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) buildroot_defconfig
 	rm $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig
-	$(if $(BR2_ARM_EABI),
-		$(call KCONFIG_ENABLE_OPT,CONFIG_AEABI,$(@D)/.config),
-		$(call KCONFIG_DISABLE_OPT,CONFIG_AEABI,$(@D)/.config))
+	$(if $(BR2_arm)$(BR2_armeb),
+		$(call KCONFIG_ENABLE_OPT,CONFIG_AEABI,$(@D)/.config))
 	# As the kernel gets compiled before root filesystems are
 	# built, we create a fake cpio file. It'll be
 	# replaced later by the real cpio archive, and the kernel will be
-- 
1.8.1.2
