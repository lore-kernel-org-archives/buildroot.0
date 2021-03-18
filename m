From: Dick Olsson <hi@senzilla.io>
Date: Thu, 18 Mar 2021 15:42:24 +0000
Subject: [Buildroot] [PATCH v4 00/10] Introduce EDK2 firmware package
Message-ID: <nbEwztTDjkNzk05Pubco5HD621kj6YGLocA0g2rvk@cp3-web-029.plabs.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

It's taken me a while to find time to follow-up with this fourth revision
of this EDK2 firmware patchset. But I think I've finally got this
patchset to a good place.

I believe I have now addressed most of the review items from Thomas, Yann
and everyone else. Perhaps most notably, we now make better use of $@D
and $STAGING_DIR for different intermediate outputs throughout the
packages. Various inline comments have also been cleaned up and clarified.


Cheers

D. Olsson
PGP: 8204A8CD



Dick Olsson (10):
  package/edk2-platforms: new package
  boot/edk2: new package
  boot/arm-trusted-firmware: Integrate with EDK2 as BL33 payload
  configs/aarch64_efi_defconfig: build the EDK2 firmware from source
  configs/pc_x86_64_defconfig: build the EDK2 firmware from source
  configs/qemu_aarch64_sbsa_defconfig: new config for QEMU sbsa-ref
  configs/qemu_aarch64_virt_efi_defconfig: new config for QEMU Virt EFI
  configs/socionext_developerbox_defconfig: new config for Developerbox
  configs/solidrun_macchiatobin_efi_defconfig: EFI config for
    MacchiatoBin
  DEVELOPERS: add Dick Olsson to all files related to EDK2

 DEVELOPERS                                    |  17 ++
 board/aarch64-efi/post-image.sh               |   6 +-
 board/aarch64-efi/readme.txt                  |   9 +-
 board/pc/readme.txt                           |   9 +-
 board/qemu/aarch64-sbsa/assemble-flash-images |  18 +++
 board/qemu/aarch64-sbsa/genimage.cfg          |  27 ++++
 board/qemu/aarch64-sbsa/readme.txt            |  26 +++
 board/qemu/aarch64-sbsa/startup.nsh           |   1 +
 .../aarch64-virt-efi/assemble-flash-images    |  19 +++
 board/qemu/aarch64-virt-efi/genimage.cfg      |  27 ++++
 board/qemu/aarch64-virt-efi/readme.txt        |  27 ++++
 board/qemu/aarch64-virt-efi/startup.nsh       |   1 +
 .../developerbox/assemble-flash-images        |  14 ++
 board/socionext/developerbox/genimage.cfg     |  24 +++
 board/socionext/developerbox/readme.txt       |  16 ++
 board/socionext/developerbox/startup.nsh      |   1 +
 .../macchiatobin-efi/assemble-flash-images    |  14 ++
 board/solidrun/macchiatobin-efi/genimage.cfg  |  24 +++
 .../solidrun/macchiatobin-efi/linux.fragment  |   3 +
 board/solidrun/macchiatobin-efi/readme.txt    |  90 +++++++++++
 board/solidrun/macchiatobin-efi/startup.nsh   |   1 +
 boot/Config.in                                |   1 +
 boot/arm-trusted-firmware/Config.in           |  15 +-
 .../arm-trusted-firmware.mk                   |   9 ++
 boot/edk2/Config.in                           | 110 +++++++++++++
 boot/edk2/edk2.hash                           |   3 +
 boot/edk2/edk2.mk                             | 150 ++++++++++++++++++
 configs/aarch64_efi_defconfig                 |   2 +
 configs/pc_x86_64_efi_defconfig               |   2 +
 configs/qemu_aarch64_sbsa_defconfig           |  43 +++++
 configs/qemu_aarch64_virt_efi_defconfig       |  45 ++++++
 configs/socionext_developerbox_defconfig      |  21 +++
 configs/solidrun_macchiatobin_efi_defconfig   |  25 +++
 package/Config.in                             |   1 +
 package/edk2-platforms/Config.in              |   8 +
 package/edk2-platforms/edk2-platforms.hash    |   3 +
 package/edk2-platforms/edk2-platforms.mk      |  21 +++
 37 files changed, 821 insertions(+), 12 deletions(-)
 create mode 100755 board/qemu/aarch64-sbsa/assemble-flash-images
 create mode 100644 board/qemu/aarch64-sbsa/genimage.cfg
 create mode 100644 board/qemu/aarch64-sbsa/readme.txt
 create mode 100644 board/qemu/aarch64-sbsa/startup.nsh
 create mode 100755 board/qemu/aarch64-virt-efi/assemble-flash-images
 create mode 100644 board/qemu/aarch64-virt-efi/genimage.cfg
 create mode 100644 board/qemu/aarch64-virt-efi/readme.txt
 create mode 100644 board/qemu/aarch64-virt-efi/startup.nsh
 create mode 100755 board/socionext/developerbox/assemble-flash-images
 create mode 100644 board/socionext/developerbox/genimage.cfg
 create mode 100644 board/socionext/developerbox/readme.txt
 create mode 100644 board/socionext/developerbox/startup.nsh
 create mode 100755 board/solidrun/macchiatobin-efi/assemble-flash-images
 create mode 100644 board/solidrun/macchiatobin-efi/genimage.cfg
 create mode 100644 board/solidrun/macchiatobin-efi/linux.fragment
 create mode 100644 board/solidrun/macchiatobin-efi/readme.txt
 create mode 100644 board/solidrun/macchiatobin-efi/startup.nsh
 create mode 100644 boot/edk2/Config.in
 create mode 100644 boot/edk2/edk2.hash
 create mode 100644 boot/edk2/edk2.mk
 create mode 100644 configs/qemu_aarch64_sbsa_defconfig
 create mode 100644 configs/qemu_aarch64_virt_efi_defconfig
 create mode 100644 configs/socionext_developerbox_defconfig
 create mode 100644 configs/solidrun_macchiatobin_efi_defconfig
 create mode 100644 package/edk2-platforms/Config.in
 create mode 100644 package/edk2-platforms/edk2-platforms.hash
 create mode 100644 package/edk2-platforms/edk2-platforms.mk

-- 
2.24.3 (Apple Git-128)
