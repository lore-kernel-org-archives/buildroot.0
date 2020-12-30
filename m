From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 30 Dec 2020 14:41:48 +0100
Subject: [Buildroot] [PATCH v3 00/11] Introduce EDK2 firmware package
In-Reply-To: <20201218202646.1060123-1-hi@senzilla.io>
References: <20201218202646.1060123-1-hi@senzilla.io>
Message-ID: <20201230134148.GS1680670@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dick, All,

On 2020-12-18 20:27 +0000, Dick Olsson via buildroot spake thusly:
> Here is the third revision of the series introducing two hardware
> targets and not just virtual platforms. This latest revision also
> includes updates to bootarm-trusted-firmware as well as
> boot/mv-ddr-marvell both required to build properly with the latest
> stable release of EDK2.

Thanks for this new iteration! :-)

It looks really good now, and the review I did was mostly focused on
details and aesthetics.

I almost applied the whole series, but there was too many unknowns for
me to guess at in patch 5, and I was not confident enough to tweak them.

Still, I did apply pathces 1 and 2; that's not much off your chest, but
that's still that...

Thanks!

Regards,
Yann E. MORIN.

> This series is introducing the EDK2 bootloader package which can build
> firmware for five different platforms, on both x86-64 and AArch64.
> 
>  * QEMU x86-64 pc machine
>  * QEMU aarch64 virt machine, booting directly from flash
>  * QEMU aarch64 virt machine, booting via kernel protocol
>  * QEMU aarch64 sbsa-ref machine
>  * ARM FVP vexpress machine
>  * Socionext Developerbox
>  * SolidRun MacchiatoBin
> 
> The EDK2 build system is very particular and includes different
> dependencies and a lot of custom scripting, which has lead to these
> design decisions when building these Buildroot packages:
> 
>  * EDK2 needs to rely on Git submodules because its dependencies are not
>    easy to build separately
>  * Each platform is a specific configuration option (instead of a
>    string) because they require slightly different packages etc.
> 
> Dick Olsson (11):
>   boot/arm-trusted-firmware: Bump to version 2.4
>   boot/mv-ddr-marvell: Bump to HEAD as of 20201207
>   package/edk2-platforms: new package
>   boot/edk2: new package
>   configs/aarch64_efi_defconfig: build the EDK2 firmware from source
>   configs/pc_x86_64_defconfig: build the EDK2 firmware from source
>   boot/arm-trusted-firmware: add EDK2 as BL33 option
>   configs/qemu_aarch64_sbsa_defconfig: new config for QEMU sbsa-ref
>   configs/qemu_aarch64_virt_efi_defconfig: new config for QEMU Virt EFI
>   configs/socionext_developerbox_defconfig: new config for Developerbox
>   configs/solidrun_macchiatobin_efi_defconfig: EFI config for
>     MacchiatoBin
> 
>  board/aarch64-efi/post-image.sh               |  12 +-
>  board/aarch64-efi/readme.txt                  |   9 +-
>  board/pc/readme.txt                           |   9 +-
>  board/qemu/aarch64-sbsa/genimage.cfg          |  24 +++
>  board/qemu/aarch64-sbsa/linux.fragment        |   1 +
>  board/qemu/aarch64-sbsa/post-image.sh         |  20 +++
>  board/qemu/aarch64-sbsa/readme.txt            |  34 ++++
>  board/qemu/aarch64-virt-efi/genimage.cfg      |  24 +++
>  board/qemu/aarch64-virt-efi/linux.fragment    |   1 +
>  board/qemu/aarch64-virt-efi/post-image.sh     |  15 ++
>  board/qemu/aarch64-virt-efi/readme.txt        |  27 +++
>  board/socionext/developerbox/genimage.cfg     |  24 +++
>  board/socionext/developerbox/post-image.sh    |   9 +
>  board/socionext/developerbox/readme.txt       |  14 ++
>  board/solidrun/macchiatobin-efi/genimage.cfg  |  24 +++
>  .../solidrun/macchiatobin-efi/linux.fragment  |   4 +
>  board/solidrun/macchiatobin-efi/post-image.sh |   9 +
>  board/solidrun/macchiatobin-efi/readme.txt    |  14 ++
>  boot/Config.in                                |   1 +
>  boot/arm-trusted-firmware/Config.in           |  19 +-
>  .../arm-trusted-firmware.hash                 |   2 +-
>  .../arm-trusted-firmware.mk                   |   8 +
>  ...GenFds-Compatibility-with-Python-3.9.patch |  35 ++++
>  boot/edk2/Config.in                           |  88 ++++++++++
>  boot/edk2/edk2.hash                           |   3 +
>  boot/edk2/edk2.mk                             | 164 ++++++++++++++++++
>  ...raining_leveling.c-uninitialized-var.patch |  31 ----
>  boot/mv-ddr-marvell/mv-ddr-marvell.hash       |   2 +-
>  boot/mv-ddr-marvell/mv-ddr-marvell.mk         |   4 +-
>  configs/aarch64_efi_defconfig                 |   2 +
>  configs/pc_x86_64_efi_defconfig               |   2 +
>  configs/qemu_aarch64_sbsa_defconfig           |  44 +++++
>  configs/qemu_aarch64_virt_efi_defconfig       |  46 +++++
>  configs/socionext_developerbox_defconfig      |  21 +++
>  configs/solidrun_macchiatobin_efi_defconfig   |  24 +++
>  package/Config.in.host                        |   1 +
>  package/edk2-platforms/Config.in.host         |   8 +
>  package/edk2-platforms/edk2-platforms.hash    |   3 +
>  package/edk2-platforms/edk2-platforms.mk      |  18 ++
>  39 files changed, 751 insertions(+), 49 deletions(-)
>  create mode 100644 board/qemu/aarch64-sbsa/genimage.cfg
>  create mode 100644 board/qemu/aarch64-sbsa/linux.fragment
>  create mode 100755 board/qemu/aarch64-sbsa/post-image.sh
>  create mode 100644 board/qemu/aarch64-sbsa/readme.txt
>  create mode 100644 board/qemu/aarch64-virt-efi/genimage.cfg
>  create mode 100644 board/qemu/aarch64-virt-efi/linux.fragment
>  create mode 100755 board/qemu/aarch64-virt-efi/post-image.sh
>  create mode 100644 board/qemu/aarch64-virt-efi/readme.txt
>  create mode 100644 board/socionext/developerbox/genimage.cfg
>  create mode 100755 board/socionext/developerbox/post-image.sh
>  create mode 100644 board/socionext/developerbox/readme.txt
>  create mode 100644 board/solidrun/macchiatobin-efi/genimage.cfg
>  create mode 100644 board/solidrun/macchiatobin-efi/linux.fragment
>  create mode 100755 board/solidrun/macchiatobin-efi/post-image.sh
>  create mode 100644 board/solidrun/macchiatobin-efi/readme.txt
>  create mode 100644 boot/edk2/0001-GenFds-Compatibility-with-Python-3.9.patch
>  create mode 100644 boot/edk2/Config.in
>  create mode 100644 boot/edk2/edk2.hash
>  create mode 100644 boot/edk2/edk2.mk
>  delete mode 100644 boot/mv-ddr-marvell/0001-mv_ddr-mv_ddr4_training_leveling.c-uninitialized-var.patch
>  create mode 100644 configs/qemu_aarch64_sbsa_defconfig
>  create mode 100644 configs/qemu_aarch64_virt_efi_defconfig
>  create mode 100644 configs/socionext_developerbox_defconfig
>  create mode 100644 configs/solidrun_macchiatobin_efi_defconfig
>  create mode 100644 package/edk2-platforms/Config.in.host
>  create mode 100644 package/edk2-platforms/edk2-platforms.hash
>  create mode 100644 package/edk2-platforms/edk2-platforms.mk
> 
> -- 
> 2.25.1
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
