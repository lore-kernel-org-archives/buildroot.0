From: Dick Olsson <hi@senzilla.io>
Date: Sun, 19 Jul 2020 18:08:13 +0000
Subject: [Buildroot] [PATCH 0/8] Introduce EDK2 firmware builds
Message-ID: <20200719180727.28202-1-hi@senzilla.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series is introducing the EDK2 bootloader package with four different
configurations, initially targeting AArch64.

One of the main reasons one would use EDK2 and UEFI on a AArch64 is for
different standards compliance scenarios. The most prevalent standards in this
space are:

* Server Base System Architecture (SBSA) for hardware platforms
* Server Base Boot Requirement (SBBR) for bootloader firmware

This series introduces a new generic SBSA board called aarch64-sbsa which can
be used by any configuration providing SBBR firmware.

Three of the four configurations in this series implement SBBR firmware:

1. aarch_efi_defconfig: EDK2 as stand-alone flash device for QEMU Virt
2. qemu_aarch64_virt_sbbr_defconfig: EDK2 as ATF BL33 for QEMU Virt
3. qemu_aarch64_sbsa_sbbr_defconfig: EDK2 as ATF BL33 for QEMU SBSA
4. arm_foundationv8_sbbr_defconfig: EDK2 as ATF BL33 for ARM FVP

In the first config, the kernel will boot with ACPI enabled but will still opt
to using device tree information for some hardware details. This is a more
traditional EFI setup but not necessarily SBBR compliant.

The other configs implement SBBR and used the new aarch64-sbsa board.

Dick Olsson (8):
  package/edk2-platforms: new package
  boot/edk2: new package
  boot/arm-trusted-firmware: bump to version 2.2
  boot/arm-trusted-firmware: add EDK2 as BL33 option
  configs/aarch64_efi_defconfig: build the EDK2 firmware from source
  configs/qemu_aarch64_sbsa_sbbr_defconfig: new config for SBBR on QEMU
    SBSA
  configs/qemu_aarch64_virt_sbbr_defconfig: new config for SBBR on Virt
  configs/arm_foundationv8_sbbr_defconfig: new config for SBBR on FVP

 board/aarch64-efi/readme.txt                  |   8 +-
 board/aarch64-sbsa/genimage-sbsa.cfg          |  25 ++++
 board/aarch64-sbsa/linux.config               |   1 +
 board/aarch64-sbsa/post-image.sh              |  30 +++++
 board/aarch64-sbsa/readme.txt                 |  62 ++++++++++
 boot/Config.in                                |   1 +
 boot/arm-trusted-firmware/Config.in           |  19 ++-
 .../arm-trusted-firmware.hash                 |   1 +
 .../arm-trusted-firmware.mk                   |   7 ++
 boot/edk2/Config.in                           |  59 ++++++++++
 boot/edk2/edk2.hash                           |   2 +
 boot/edk2/edk2.mk                             | 111 ++++++++++++++++++
 configs/aarch64_efi_defconfig                 |   3 +
 configs/arm_foundationv8_sbbr_defconfig       |  46 ++++++++
 configs/qemu_aarch64_sbsa_sbbr_defconfig      |  44 +++++++
 configs/qemu_aarch64_virt_sbbr_defconfig      |  46 ++++++++
 package/Config.in.host                        |   1 +
 package/edk2-platforms/Config.in.host         |   8 ++
 package/edk2-platforms/edk2-platforms.hash    |   2 +
 package/edk2-platforms/edk2-platforms.mk      |   6 +
 20 files changed, 474 insertions(+), 8 deletions(-)
 create mode 100644 board/aarch64-sbsa/genimage-sbsa.cfg
 create mode 100644 board/aarch64-sbsa/linux.config
 create mode 100755 board/aarch64-sbsa/post-image.sh
 create mode 100644 board/aarch64-sbsa/readme.txt
 create mode 100644 boot/edk2/Config.in
 create mode 100644 boot/edk2/edk2.hash
 create mode 100644 boot/edk2/edk2.mk
 create mode 100644 configs/arm_foundationv8_sbbr_defconfig
 create mode 100644 configs/qemu_aarch64_sbsa_sbbr_defconfig
 create mode 100644 configs/qemu_aarch64_virt_sbbr_defconfig
 create mode 100644 package/edk2-platforms/Config.in.host
 create mode 100644 package/edk2-platforms/edk2-platforms.hash
 create mode 100644 package/edk2-platforms/edk2-platforms.mk

-- 
2.20.1
