From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 22 Apr 2019 22:08:24 +0200
Subject: [Buildroot] [PATCH 0/5] Fix fallouts from LINUX_BUILD_CMDS
 simplification
Message-ID: <20190422200830.2831-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

In commit ffbe46a5295ce4e0442728f2ad3e19afa7eaa8ed, a patch of mine
changed LINUX_BUILD_CMDS to do "make all $(LINUX_TARGET_NAME)" instead
of "make $(LINUX_TARGET_NAME)" and "make modules".

This has caused a number of build issues in our defconfigs:

 - A number of kernel configurations apparently don't build well when
   the "all" target is built concurrently with $(LINUX_TARGET_NAME),
   with weird file not found errors.

   We fix this by doing "make all" and "make $(LINUX_TARGET_NAME)"
   separately (first patch)

 - Due to calling "make all", a little bit more might get built, and
   sometimes this "little bit more" needs mkimage, so we add
   host-uboot-tools to the defconfig. This is enough as linux/linux.mk
   automatically adds host-uboot-tools to its dependency if it's
   enabled. I hesitated with adding an explicit
   BR2_LINUX_KERNEL_NEEDS_HOST_UBOOT_TOOLS option, let me know if this
   sounds better or if the proposed solution in this patch series is
   good enough.

Thanks,

Thomas

Thomas Petazzoni (5):
  linux: split calling "all" and "$(LINUX_TARGET_NAME)" targets
  configs/beaglebone: kernel build needs mkimage
  configs/qemu_nios2_10m50: kernel build needs mkimage
  configs/qemu_ppc_mpc8544ds: kernel build needs mkimage
  configs/qemu_ppc_virtex_ml507: kernel build needs mkimage

 configs/beaglebone_defconfig            | 2 ++
 configs/qemu_nios2_10m50_defconfig      | 3 +++
 configs/qemu_ppc_mpc8544ds_defconfig    | 3 +++
 configs/qemu_ppc_virtex_ml507_defconfig | 3 +++
 linux/linux.mk                          | 3 ++-
 5 files changed, 13 insertions(+), 1 deletion(-)

-- 
2.20.1
