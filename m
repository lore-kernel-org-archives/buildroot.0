From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Jul 2013 00:27:30 +0200
Subject: [Buildroot] [PATCHv2 07/25] linux: remove EABI conditional
In-Reply-To: <1373754468-7527-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1373754468-7527-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1373754468-7527-8-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

We're only EABI now, so we want to always build an EABI kernel
when we're building for ARM.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index dfc948c..2ab437d 100644
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
