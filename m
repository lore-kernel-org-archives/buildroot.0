From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Dec 2019 21:55:36 +0100
Subject: [Buildroot] [git commit] linux: Set MMU page size for ARC processors
Message-ID: <20191222204938.813258D7A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d7a771816d938f9d8d04b24fd07d2f3f52e73f99
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ARC processors have configurable size of MMU page. This configuration
happens during ASIC design and couldn't be changed in final silicone
not to mention runtime changes.

Given PAGE_SIZE macro is used a lot throughout the Linux kernel sources
we just hardcode a required value during the kernel configuration.

We used to support different MMU page sizes for ARC in Buildroot for
quite some time now but so far we only tweaked uClibc on the matter.
That left us with the kernel configured with whatever was in used defconfig.

In most of real cases that's OK because typically we're building firmware
for a particular ASIC which is supposed to have a unique kernel defconfig.
But if we're dealing with FPGA-based boards or even simlators like
Synopsys DesignWare nSIM or QEMU it's possible to have dfferent MMU page
size configured in that target mostly for the sake of testing.

And so we're trying to solve 2 problems here:
 1. Make sure both user-space (via libc settings) and the Linux kernel
    are "on the same page", i.e. expect to use the same MMU page size.
 2. Simplify process of testing different page sizes.
    As now we first need to set page size in Buildroot and then in the
    kernel via "make linux-configure" or via Kconfig fragment.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
[yann.morin.1998 at free.fr: simplify the conditions]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 linux/linux.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 762f8868b1..6e9d11dd38 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -319,6 +319,18 @@ define LINUX_KCONFIG_FIXUP_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_AEABI,$(@D)/.config))
 	$(if $(BR2_powerpc)$(BR2_powerpc64)$(BR2_powerpc64le),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_PPC_DISABLE_WERROR,$(@D)/.config))
+	$(if $(BR2_ARC_PAGE_SIZE_4K),
+		$(call KCONFIG_ENABLE_OPT,CONFIG_ARC_PAGE_SIZE_4K,$(@D)/.config)
+		$(call KCONFIG_DISABLE_OPT,CONFIG_ARC_PAGE_SIZE_8K,$(@D)/.config)
+		$(call KCONFIG_DISABLE_OPT,CONFIG_ARC_PAGE_SIZE_16K,$(@D)/.config))
+	$(if $(BR2_ARC_PAGE_SIZE_8K),
+		$(call KCONFIG_DISABLE_OPT,CONFIG_ARC_PAGE_SIZE_4K,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_ARC_PAGE_SIZE_8K,$(@D)/.config)
+		$(call KCONFIG_DISABLE_OPT,CONFIG_ARC_PAGE_SIZE_16K,$(@D)/.config))
+	$(if $(BR2_ARC_PAGE_SIZE_16K),
+		$(call KCONFIG_DISABLE_OPT,CONFIG_ARC_PAGE_SIZE_4K,$(@D)/.config)
+		$(call KCONFIG_DISABLE_OPT,CONFIG_ARC_PAGE_SIZE_8K,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_ARC_PAGE_SIZE_16K,$(@D)/.config))
 	$(if $(BR2_TARGET_ROOTFS_CPIO),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_BLK_DEV_INITRD,$(@D)/.config))
 	# As the kernel gets compiled before root filesystems are
