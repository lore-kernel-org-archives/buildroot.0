From: Dick Olsson <hi@senzilla.io>
Date: Wed, 12 May 2021 18:36:01 +0000
Subject: [Buildroot] [PATCH v5 00/10] Introduce EDK2 firmware package
Message-ID: <p9VS7hxOeVbmgXCpzw2M5AgR6LaCg2UWWsxGYZA@cp7-web-044.plabs.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

This latest revision addresses feedback from multiple people (see the
revision log on each patch) as well as simplifies the series itself:

 * Do not introduce a new qemu_aarch64_virt_efi_defconfig
 * Instead, modify the existing qemu_aarch64_virt_defconfig [1]
 * Merge the boot/edk2 and boot/arm-trusted-firmware patches
 * Simplify various defconfigs and scripts by relying GRUB2 for booting

I also bumped the edk2 packages to the latest stable version and
introduced a runtime test for the whole boot chain.

[1]: See discussion in
http://patchwork.ozlabs.org/project/buildroot/patch/20200712163422.1162187-3-romain.naour at gmail.com/

Dick Olsson (10):
  package/edk2-platforms: new package
  boot/edk2: new package
  configs/aarch64_efi_defconfig: build the EDK2 firmware from source
  configs/pc_x86_64_efi_defconfig: build the EDK2 firmware from source
  configs/qemu_aarch64_virt_defconfig: build with EDK2 firmware
  configs/qemu_aarch64_sbsa_defconfig: new config for QEMU sbsa-ref
  configs/socionext_developerbox_defconfig: new config for Developerbox
  configs/solidrun_macchiatobin_efi_defconfig: EFI config for
    MacchiatoBin
  support/testing: new boot test for EDK2
  DEVELOPERS: add files related to EDK2 for Dick Olsson

 DEVELOPERS                                    |  16 ++
 board/aarch64-efi/post-image.sh               |   4 +
 board/aarch64-efi/readme.txt                  |   9 +-
 board/pc/readme.txt                           |   9 +-
 board/qemu/aarch64-sbsa/assemble-flash-images |  11 ++
 board/qemu/aarch64-sbsa/genimage.cfg          |  30 ++++
 board/qemu/aarch64-sbsa/grub.cfg              |   6 +
 board/qemu/aarch64-sbsa/linux.config          |  68 ++++++++
 board/qemu/aarch64-sbsa/readme.txt            |  32 ++++
 board/qemu/aarch64-virt/assemble-flash-images |  12 ++
 board/qemu/aarch64-virt/genimage.cfg          |  30 ++++
 board/qemu/aarch64-virt/grub.cfg              |   6 +
 board/qemu/aarch64-virt/readme.txt            |   2 +-
 .../developerbox/assemble-flash-images        |   7 +
 board/socionext/developerbox/genimage.cfg     |  30 ++++
 board/socionext/developerbox/grub.cfg         |   6 +
 board/socionext/developerbox/readme.txt       |  16 ++
 .../macchiatobin-efi/assemble-flash-images    |   7 +
 board/solidrun/macchiatobin-efi/genimage.cfg  |  30 ++++
 board/solidrun/macchiatobin-efi/grub.cfg      |   6 +
 .../solidrun/macchiatobin-efi/linux.fragment  |   3 +
 board/solidrun/macchiatobin-efi/readme.txt    |  90 +++++++++++
 boot/Config.in                                |   1 +
 boot/arm-trusted-firmware/Config.in           |  15 +-
 .../arm-trusted-firmware.mk                   |   9 ++
 boot/edk2/Config.in                           | 110 +++++++++++++
 boot/edk2/edk2.hash                           |   3 +
 boot/edk2/edk2.mk                             | 150 ++++++++++++++++++
 configs/aarch64_efi_defconfig                 |   2 +
 configs/pc_x86_64_efi_defconfig               |   2 +
 configs/qemu_aarch64_sbsa_defconfig           |  49 ++++++
 configs/qemu_aarch64_virt_defconfig           |  25 ++-
 configs/socionext_developerbox_defconfig      |  24 +++
 configs/solidrun_macchiatobin_efi_defconfig   |  28 ++++
 package/Config.in                             |   1 +
 package/edk2-platforms/Config.in              |   8 +
 package/edk2-platforms/edk2-platforms.hash    |   3 +
 package/edk2-platforms/edk2-platforms.mk      |  22 +++
 support/testing/tests/boot/test_edk2.py       |  45 ++++++
 39 files changed, 913 insertions(+), 14 deletions(-)
 create mode 100755 board/qemu/aarch64-sbsa/assemble-flash-images
 create mode 100644 board/qemu/aarch64-sbsa/genimage.cfg
 create mode 100644 board/qemu/aarch64-sbsa/grub.cfg
 create mode 100644 board/qemu/aarch64-sbsa/linux.config
 create mode 100644 board/qemu/aarch64-sbsa/readme.txt
 create mode 100755 board/qemu/aarch64-virt/assemble-flash-images
 create mode 100644 board/qemu/aarch64-virt/genimage.cfg
 create mode 100644 board/qemu/aarch64-virt/grub.cfg
 create mode 100755 board/socionext/developerbox/assemble-flash-images
 create mode 100644 board/socionext/developerbox/genimage.cfg
 create mode 100644 board/socionext/developerbox/grub.cfg
 create mode 100644 board/socionext/developerbox/readme.txt
 create mode 100755 board/solidrun/macchiatobin-efi/assemble-flash-images
 create mode 100644 board/solidrun/macchiatobin-efi/genimage.cfg
 create mode 100644 board/solidrun/macchiatobin-efi/grub.cfg
 create mode 100644 board/solidrun/macchiatobin-efi/linux.fragment
 create mode 100644 board/solidrun/macchiatobin-efi/readme.txt
 create mode 100644 boot/edk2/Config.in
 create mode 100644 boot/edk2/edk2.hash
 create mode 100644 boot/edk2/edk2.mk
 create mode 100644 configs/qemu_aarch64_sbsa_defconfig
 create mode 100644 configs/socionext_developerbox_defconfig
 create mode 100644 configs/solidrun_macchiatobin_efi_defconfig
 create mode 100644 package/edk2-platforms/Config.in
 create mode 100644 package/edk2-platforms/edk2-platforms.hash
 create mode 100644 package/edk2-platforms/edk2-platforms.mk
 create mode 100644 support/testing/tests/boot/test_edk2.py

-- 
2.30.2
