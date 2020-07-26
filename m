From: D. Olsson <hi@senzilla.io>
Date: Sun, 26 Jul 2020 10:05:51 +0000
Subject: [Buildroot] [PATCH v2 0/6] Introduce EDK2 firmware builds
Message-ID: <20200726100541.7710-1-hi@senzilla.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Here is a more simplified and somewhat cleaner revision of the series
introducing the ability to build EDK2 UEFI firmware in Buildroot.

This series is introducing the EDK2 bootloader package which can build
firmware for five different platforms, targeting both x86-64 and AArch64.

 * QEMU x86-64 pc machine
 * QEMU aarch64 virt machine, booting directly from flash
 * QEMU aarch64 virt machine, booting via kernel protocol
 * QEMU aarch64 sbsa-ref machine
 * ARM FVP vexpress machine

The EDK2 build system is very particular and includes different
dependencies and a lot of custom scripting, which has lead to these design
decisions when building these Buildroot packages:

 * EDK2 needs to rely on Git submodules because its dependencies are not
   easy to build separately
 * Each platform is a specific configuration option (instead of a string)
   because they require slightly different packages etc.

To keep it simple, this series no longer introduce the concept of "SBBR"
Although, the firmware build with ATF + EDK2 + ACPI is mostly compliant
with SBBR.

Dick Olsson (6):
  package/edk2-platforms: new package
  boot/edk2: new package
  configs/aarch64_efi_defconfig: build the EDK2 firmware from source
  configs/pc_x86_64_defconfig: build the EDK2 firmware from source
  boot/arm-trusted-firmware: add EDK2 as BL33 option
  configs/qemu_aarch64_sbsa_defconfig: new config for QEMU sbsa-ref

 board/aarch64-efi/readme.txt                  |   8 +-
 board/pc/readme.txt                           |   9 +-
 board/qemu/aarch64-sbsa/genimage.cfg          |  25 ++++
 board/qemu/aarch64-sbsa/linux.fragment        |   1 +
 board/qemu/aarch64-sbsa/post-image.sh         |  18 +++
 board/qemu/aarch64-sbsa/readme.txt            |  34 +++++
 boot/Config.in                                |   1 +
 boot/arm-trusted-firmware/Config.in           |  15 ++-
 .../arm-trusted-firmware.mk                   |   8 ++
 boot/edk2/Config.in                           |  68 ++++++++++
 boot/edk2/edk2.hash                           |   3 +
 boot/edk2/edk2.mk                             | 117 ++++++++++++++++++
 configs/aarch64_efi_defconfig                 |   2 +
 configs/pc_x86_64_efi_defconfig               |   2 +
 configs/qemu_aarch64_sbsa_defconfig           |  40 ++++++
 package/Config.in.host                        |   1 +
 package/edk2-platforms/Config.in.host         |   8 ++
 package/edk2-platforms/edk2-platforms.hash    |   2 +
 package/edk2-platforms/edk2-platforms.mk      |  12 ++
 19 files changed, 363 insertions(+), 11 deletions(-)
 create mode 100644 board/qemu/aarch64-sbsa/genimage.cfg
 create mode 100644 board/qemu/aarch64-sbsa/linux.fragment
 create mode 100755 board/qemu/aarch64-sbsa/post-image.sh
 create mode 100644 board/qemu/aarch64-sbsa/readme.txt
 create mode 100644 boot/edk2/Config.in
 create mode 100644 boot/edk2/edk2.hash
 create mode 100644 boot/edk2/edk2.mk
 create mode 100644 configs/qemu_aarch64_sbsa_defconfig
 create mode 100644 package/edk2-platforms/Config.in.host
 create mode 100644 package/edk2-platforms/edk2-platforms.hash
 create mode 100644 package/edk2-platforms/edk2-platforms.mk

-- 
2.20.1
