From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Sat, 6 Mar 2021 23:22:14 +0100
Subject: [Buildroot] [PATCH] configs/qemu_arm_vexpress_tz: bump versions
 and update
In-Reply-To: <20210306210048.24399-1-vincent.stehle@laposte.net>
References: <20210306210048.24399-1-vincent.stehle@laposte.net>
Message-ID: <CAN5uoS969h-Ea063R0CpRgJVSREUKvzeA_8-PA1yO=54SLEFWw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Salut Vincent,

Ca me fait plaisir!
Thanks for the update on the defconfig, some references are a bit old.


On Sat, 6 Mar 2021 at 22:01, Vincent Stehl? <vincent.stehle@laposte.net> wrote:
>
> - Bump TF-A to version 2.4.
> - Bump u-boot to version 2021.01.
> - Bump kernel to version 5.11.3.
>
> We switch TF-A to a single FIP image. Thanks to this, TF-A does not need to
> use semihosting to load the various BL* anymore (but U-Boot still does).
> Update the readme.txt accordingly.
>
> We switch to a u-boot image for the ramdisk. This removes the need to
> update the fdt chosen node manually in the bootcmd.
>
> While at it, we drop the generation of the kernel dtb, which we do not use.
> In this config, we are indeed using the dtb generated on-the-fly by qemu
> and amended by TF-A.

actually by TF-A and by OP-TEE.

>
> Signed-off-by: Vincent Stehl? <vincent.stehle@laposte.net>
> Cc: Gerome Burlats <gerome.burlats@smile.fr>
> Cc: Romain Naour <romain.naour@gmail.com>
> Cc: Etienne Carriere <etienne.carriere@linaro.org>
> ---
>
>
> Hi,
>
> I would like to propose "modernizing" this qemu arm-vexpress-tz config a bit by
> switching to TF-A FIP image and u-boot image.
>
> The TF-A FIP image is a step towards getting rid of semihosting as TF-A does
> not need it anymore, only U-Boot. I find that aiming at getting rid of
> semihosting makes sense ultimately, as it would make it easier for people to
> e.g. add grub between U-Boot and Linux kernel locally. Let me know if that
> sounds like a reasonable motivation to you.

I fully agree, please proceed.

>
> Switching to a recent U-Boot (after 2019.01) has the drawback of causing the
> following error during boot:
>
>   ERROR: reserving fdt memory region failed (addr=7fe00000 size=200000)
>
> From what I can tell this is due to U-Boot being now overzealous about reserved
> regions, while not being able to handle overlapping regions correctly.
> I think this is harmless, and the boot and op-tee TA are functional.
>
> If you don't mind I would suggest we proceed with this update anyway. If
> anything, that could help people reproduce the issue and fix it in U-Boot
> upstream. Let me know if you prefer that we stay with U-Boot v2019.01 instead.
>
> I verified that secure world debug output with telnet and breaking at the first
> instruction of the kernel still work, as described in the readme.txt.

Great, thanks.


>
> Best regards,
> Vincent.
>
>
>  board/qemu/arm-vexpress-tz/post-build.sh |  9 ++++-----
>  board/qemu/arm-vexpress-tz/readme.txt    | 23 +++++++++++------------
>  board/qemu/arm-vexpress-tz/u-boot.config |  3 ++-
>  configs/qemu_arm_vexpress_tz_defconfig   | 14 +++++++-------
>  4 files changed, 24 insertions(+), 25 deletions(-)
>
> diff --git a/board/qemu/arm-vexpress-tz/post-build.sh b/board/qemu/arm-vexpress-tz/post-build.sh
> index 7ead69a99a..c9c81701dc 100755
> --- a/board/qemu/arm-vexpress-tz/post-build.sh
> +++ b/board/qemu/arm-vexpress-tz/post-build.sh
> @@ -3,8 +3,7 @@
>  set -u
>  set -e
>
> -# Rename boot images for the dear TF-A
> -ln -sf u-boot.bin ${BINARIES_DIR}/bl33.bin
> -ln -sf tee-header_v2.bin ${BINARIES_DIR}/bl32.bin
> -ln -sf tee-pager_v2.bin ${BINARIES_DIR}/bl32_extra1.bin
> -ln -sf tee-pageable_v2.bin ${BINARIES_DIR}/bl32_extra2.bin
> +# Create flash.bin TF-A FIP image from bl1.bin and fip.bin
> +cd "$BINARIES_DIR"
> +dd if=bl1.bin of=flash.bin bs=4096 conv=notrunc
> +dd if=fip.bin of=flash.bin seek=64 bs=4096 conv=notrunc
> diff --git a/board/qemu/arm-vexpress-tz/readme.txt b/board/qemu/arm-vexpress-tz/readme.txt
> index abce750291..d33640d0ca 100644
> --- a/board/qemu/arm-vexpress-tz/readme.txt
> +++ b/board/qemu/arm-vexpress-tz/readme.txt
> @@ -6,19 +6,18 @@ builds of the QEMU host ARM target emulator.
>    make qemu_arm_vexpress_tz_defconfig
>    make
>
> -The BIOS used in the QEMU host is the ARM Trusted Firmware-A (TF-A). TF-A
> -uses QEMU semihosting file access to access boot image files. The
> -QEMU platform is quite specific for that in TF-A and one needs to
> -run the emulation from the image directory for TF-A to boot the
> -secure and non-secure worlds.
> +The BIOS used in the QEMU host is the ARM Trusted Firmware-A (TF-A).
> +In our configuration, U-Boot uses QEMU semihosting file access to load the
> +kernel and rootfs image files.
> +Run the emulation with:
>
> -  cd output/images && ../host/bin/qemu-system-arm \
> +  ./output/host/bin/qemu-system-arm \
>         -machine virt -machine secure=on -cpu cortex-a15 \
>         -smp 1 -s -m 1024 -d unimp \
>         -serial stdio \
>         -netdev user,id=vmnic -device virtio-net-device,netdev=vmnic \
>         -semihosting-config enable,target=native \
> -       -bios bl1.bin # qemu_arm_vexpress_tz_defconfig
> +       -bios output/images/flash.bin # qemu_arm_vexpress_tz_defconfig
>
>  The boot stage traces (if any) followed by the login prompt will appear
>  in the terminal that started QEMU.
> @@ -57,14 +56,14 @@ To get the OP-TEE OS traces, append a second -serial argument after
>  -serial stdio in the QEMU command line. I.e, the following enables 2 serial
>  consoles over telnet connections:
>
> -  cd output/images && ../host/bin/qemu-system-arm \
> +  ./output/host/bin/qemu-system-arm \
>         -machine virt -machine secure=on -cpu cortex-a15 \
>         -smp 1 -s -m 1024 -d unimp \
>         -serial telnet:127.0.0.1:1235,server \
>         -serial telnet:127.0.0.1:1236,server \
>         -netdev user,id=vmnic -device virtio-net-device,netdev=vmnic \
>         -semihosting-config enable,target=native \
> -       -bios bl1.bin
> +       -bios output/images/flash.bin
>
>  QEMU is now waiting for the telnet connection. From another shell, open a
>  telnet connection on the port for the U-boot and Linux consoles:
> @@ -87,13 +86,13 @@ host computer. We use option -S of qemu-system-arm to make QEMU
>  waiting for the GDB continue instruction before booting the images.
>
>  From a first shell:
> -  cd output/images && ../host/bin/qemu-system-arm \
> +  ./output/host/bin/qemu-system-arm \
>         -machine virt -machine secure=on -cpu cortex-a15 \
>         -smp 1 -s -m 1024 -d unimp \
>         -serial stdio \
>         -netdev user,id=vmnic -device virtio-net-device,netdev=vmnic \
>         -semihosting-config enable,target=native \
> -       -bios bl1.bin \
> +       -bios output/images/flash.bin \
>         -S
>
>  From a second shell:
> @@ -109,7 +108,7 @@ From this GDB console, connect to the target, load the OP-TEE core symbols,
>  set a breakpoint to its entry point (__text_start) and start emulation:
>
>    (gdb) target remote 127.0.0.1:1234
> -  (gdb) symbol-file ./output/build/optee-os-<reference>/out/arm/core/tee.elf
> +  (gdb) symbol-file ./output/build/optee-os-<reference>/out/core/tee.elf
>    (gdb) hbreak __text_start
>    Hardware assisted breakpoint 1 at 0xe100000: file core/arch/arm/kernel/generic_entry_a32.S, line 246.
>    (gdb) cont
> diff --git a/board/qemu/arm-vexpress-tz/u-boot.config b/board/qemu/arm-vexpress-tz/u-boot.config
> index fd74bf1fe7..9f54f806ce 100644
> --- a/board/qemu/arm-vexpress-tz/u-boot.config
> +++ b/board/qemu/arm-vexpress-tz/u-boot.config
> @@ -1,7 +1,8 @@
>  CONFIG_SYS_TEXT_BASE=0x60000000
> -CONFIG_BOOTCOMMAND="fdt addr ${fdt_addr} && fdt resize 1000 && smhload zImage ${kernel_addr_r} && smhload rootfs.cpio.gz ${ramdisk_addr_r} ramdisk_addr_end &&  setenv bootargs console=ttyAMA0,115200 earlyprintk=serial,ttyAMA0,115200 && fdt chosen ${ramdisk_addr_r} ${ramdisk_addr_end} && bootz ${kernel_addr_r} - ${fdt_addr}"
> +CONFIG_BOOTCOMMAND="smhload output/images/zImage ${kernel_addr_r} && smhload output/images/rootfs.cpio.uboot ${ramdisk_addr_r} && setenv bootargs console=ttyAMA0,115200 earlyprintk=serial,ttyAMA0,115200 && bootz ${kernel_addr_r} ${ramdisk_addr_r} ${fdt_addr}"

This is the part i don't really like.
Here, "smhload output/images/zImage" enforces in u-boot config that
buildroot output dir is  output/.
I often use make some_board_defconfig O=output/some_board
Maybe you could change to run Qemu at least from <output-dir>, and
have u-boot command "smhload images/<target-file> ..."
The other places where output/ is referenced are  in readme.txt.

No other comment for the change, LGTM aside this path thing.

Best regards,
Etienne

>  CONFIG_SEMIHOSTING=y
>  # Drop flash accesses
>  CONFIG_ENV_IS_IN_FLASH=n
>  CONFIG_MTD=n
>  CONFIG_MTD_NOR_FLASH=n
> +CONFIG_ENV_IS_NOWHERE=y
> diff --git a/configs/qemu_arm_vexpress_tz_defconfig b/configs/qemu_arm_vexpress_tz_defconfig
> index 3e37024deb..602bdaf304 100644
> --- a/configs/qemu_arm_vexpress_tz_defconfig
> +++ b/configs/qemu_arm_vexpress_tz_defconfig
> @@ -13,25 +13,25 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
>  # Filesystem
>  BR2_TARGET_ROOTFS_CPIO=y
>  BR2_TARGET_ROOTFS_CPIO_GZIP=y
> +BR2_TARGET_ROOTFS_CPIO_UIMAGE=y
>  # BR2_TARGET_ROOTFS_TAR is not set
>
> -# Linux headers same as kernel, a 5.10 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
> +# Linux headers same as kernel, a 5.11 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_11=y
>
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.11.3"
>  BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
>  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/arm-vexpress-tz/linux.fragment"
> -BR2_LINUX_KERNEL_DTS_SUPPORT=y
> -BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca15_a7"
>
>  # TF-A for booting OP-TEE secure and uboot/linux non secure
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
> -BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.2"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.4"
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="qemu"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="BL32_RAM_LOCATION=tdram"
> @@ -51,7 +51,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  BR2_TARGET_UBOOT=y
>  BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>  BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.01"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.01"
>  BR2_TARGET_UBOOT_BOARD_DEFCONFIG="qemu_arm"
>  BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/qemu/arm-vexpress-tz/u-boot.config"
>
> --
> 2.30.0
>
