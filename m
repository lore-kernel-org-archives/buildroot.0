From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  4 Mar 2018 22:31:14 +0100
Subject: [Buildroot] [PATCH 00/23] Fix numerous defconfig build failures
Message-ID: <20180304213137.24681-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This commit fixes a significant number of defconfig build failures:

 - Some defconfigs have a Linux kernel that needs openssl on the
   host. This requires adding a mechanism to add host-openssl as a
   dependency of the linux package. This is done by introducing
   BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL in patch 1.

   Then, numerous defconfigs are fixed to use
   BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL: patches 6 to 13.

   The qemu_x86_defconfig and qemu_x86_64_defconfig are however
   changed in a different way: by removing wireless support, which is
   the reason why host-openssl becomes necessary in recent kernel
   versions. Since Qemu doesn't emulate a wireless interface, it
   didn't make much sense to have this additional dependency. See
   patch 4 and 5.

   For all other defconfigs, we erred on the safe side, and kept the
   configuration as-is, and simply added
   BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL.

 - Some defconfigs have a Linux kernel that needs libelf on the
   host. Like host-openssl, we added a new option
   BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF. See patch 2.

   In practice, only qemu_x86_64_defconfig needed libelf and the host,
   and instead of bringing this dependency, we have disabled the ORC
   Unwinder from the kernel defconfig. See patch 4.

   Therefore, there are no in-tree defconfig that uses
   BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF.

 - In order to make the host openssl and host libelf usable by the
   Linux kernel build system, we had to ensure that HOST_CFLAGS and
   HOST_LDFLAGS were properly taken into account. This is done in
   patch 3.

 - Some defconfigs have a U-Boot that needs dtc on the host. For
   these, the fix is simple: add BR2_TARGET_UBOOT_NEEDS_DTC=y in the
   defconfig. Patches 14 to 22.

 - Finally, one defconfig, ts4900_defconfig, had a separate issue: it
   wasn't explicitly specifying a kernel version, causing a mismatch
   with the selected kernel headers version.

Best regards,

Thomas

Thomas Petazzoni (23):
  linux: add BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL
  linux: add BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF
  linux: fix passing of host CFLAGS and LDFLAGS
  configs/qemu_x86_64_defconfig: remove kernel options that need
    openssl/libelf
  configs/qemu_x86_defconfig: remove kernel options that need openssl
  configs/orangepi_zero: needs host-openssl for the Linux kernel build
  configs/orangepi_pc_plus: needs host-openssl for the Linux kernel
    build
  configs/snps_archs38_axs103: needs host-openssl for the Linux kernel
    build
  configs/snps_archs38_vdk: needs host-openssl for the Linux kernel
    build
  configs/mx53loco: needs host-openssl for the Linux kernel build
  configs/imx6-sabresd: needs host-openssl for the Linux kernel build
  configs/snps_arc700_axs101: needs host-openssl for the Linux kernel
    build
  configs/solidrun_macchiatobin_mainline: needs host-openssl for the
    Linux kernel build
  configs/freescale_imx6qsabreauto: U-Boot needs host-dtc
  configs/solidrun_macchiatobin_marvell: U-Boot needs host-dtc
  configs/freescale_imx6sololiteevk: U-Boot needs host-dtc
  configs/freescale_imx6dlsabresd: U-Boot needs host-dtc
  configs/freescale_imx6dlsabreauto: U-Boot needs host-dtc
  configs/freescale_imx7dsabresd: U-Boot needs host-dtc
  configs/imx6ulevk: U-Boot needs host-dtc
  configs/freescale_imx6qsabresd: U-Boot needs host-dtc
  configs/freescale_imx6sxsabresd: U-Boot needs host-dtc
  configs/ts4900: explicitly specify Linux kernel version

 board/qemu/x86/linux-4.15.config                 |  2 ++
 board/qemu/x86_64/linux-4.15.config              |  3 +++
 configs/freescale_imx6dlsabreauto_defconfig      |  1 +
 configs/freescale_imx6dlsabresd_defconfig        |  1 +
 configs/freescale_imx6qsabreauto_defconfig       |  1 +
 configs/freescale_imx6qsabresd_defconfig         |  1 +
 configs/freescale_imx6sololiteevk_defconfig      |  1 +
 configs/freescale_imx6sxsabresd_defconfig        |  1 +
 configs/freescale_imx7dsabresd_defconfig         |  1 +
 configs/imx6-sabresd_defconfig                   |  1 +
 configs/imx6ulevk_defconfig                      |  1 +
 configs/mx53loco_defconfig                       |  1 +
 configs/orangepi_pc_plus_defconfig               |  1 +
 configs/orangepi_zero_defconfig                  |  1 +
 configs/snps_arc700_axs101_defconfig             |  1 +
 configs/snps_archs38_axs103_defconfig            |  1 +
 configs/snps_archs38_vdk_defconfig               |  1 +
 configs/solidrun_macchiatobin_mainline_defconfig |  1 +
 configs/solidrun_macchiatobin_marvell_defconfig  |  1 +
 configs/ts4900_defconfig                         |  2 ++
 linux/Config.in                                  | 26 ++++++++++++++++++++++++
 linux/linux.mk                                   | 11 ++++++++--
 22 files changed, 59 insertions(+), 2 deletions(-)

-- 
2.14.3
