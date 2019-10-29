From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Tue, 29 Oct 2019 09:08:44 +0100
Subject: [Buildroot] [PATCH v3 2/4] configs/qemu_arm_vexpress_tz:
 Armv7-A emulation with TrustZone services
In-Reply-To: <306f7cc3-cdb9-0441-5a0a-7d21651ece72@mind.be>
References: <20190322095818.19914-1-etienne.carriere@linaro.org>
 <20190322095818.19914-2-etienne.carriere@linaro.org>
 <306f7cc3-cdb9-0441-5a0a-7d21651ece72@mind.be>
Message-ID: <CAN5uoS-d3eO1D-Gd3QbWrbaT6HXNoOz3hi4kaK2Px+R2chM5Jw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 27 Oct 2019 at 15:55, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>  Hi Etienne,
>
> On 22/03/2019 10:58, Etienne Carriere wrote:
> > This change introduces a Qemu board for an Armv7-A target executing
> > with OP-TEE secure world services. The target Linux based normal world
> > embeds the standard minimal filesystem with OP-TEE non-secure components
> > embedded files from OP-TEE test, examples and benchmark packages.
> >
> > qemu_arm_vexpress_tz_defconfig differs from qemu_arm_vexpress_defconfig.
> > Supporting both secure and non-secure worlds on the Arm target mandates
> > a secure world, here OP-TEE OS, and a bootloader to boot both worlds,
> > here TF-A (boot/arm-trusted-firmware). Here non-secure Linux kernel is
> > booted through U-boot
> >
> >   TF-A bootloader (BL1/BL2) => OP-TEE (BL32) => U-boot (BL33).
> >   | Executes as secure         | Secure         | Execs as Non-secure
> >   | Loads BL32/BL33 in RAM     | Jumps to BL33  | Always booted after
> >   | Jumps to BL32 once done    | as Non-secure  | secure world inits
> >
> > Vexpress and vexpress-tz defconfigs also differs in that Qemu emulates
> > a Cortex-A9 in the former and a Cortex-A15 in the later. Cortex-A15
> > is the Armv7-A CPU used in upstream TF-A and OP-TEE OS packages hence
> > selected here.
> >
> > Defconfig adds a fragment to the Linux kernel native configuration to
> > enable OP-TEE driver support.
> >
> > Defconfig adds a fragment to the U-Boot native configuration set boot
> > command, enable semihosting and remove U-Boot persistent environment
> > storage support.
> >
> > The defconfig also enables build of the Qemu emulator in case the
> > system installed Qemu does not yet support CPU TrustZone secure state.
> >
> > Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
>
>  Applied to master, thanks, but with some changes...
>
> [snip]
> > +Board qemu_arm_vexpress_tz builds a Qemu Armv7-A target system with
> > +OP-TEE running in the TrustZone secure world and a Linux based
> > +OS running in the non-secure world. The board configuration enable
> > +builds of the Qemu host Arm target emulator.
> > +
> > +  make qemu_arm_vexpress_tz_defconfig
> > +  make
> > +
> > +BIOS used in the Qemu host is the Arm Trusted Firmware-A (TF-A). TF-A
> > +uses Qemu semihosting file access to access boot image files. The
> > +Qemu platform is quite specific for that in TF-A and one needs to
> > +run the emulation from the image directory for TF-A to boot the
> > +secure and non-secure worlds.
>
>  This semihosting approach is not so nice, because it only works on qemu. It
> would be nicer to have a single image that contains everything (except bl1 I
> guess) and use that as virtual flash, so it matches what would happen on a real
> board. But this is not a bad start, and it might make debugging the optee part
> easier.
>
> > +
> > +  cd output/images && ../host/bin/qemu-system-arm \
> > +     -machine virt -machine secure=on -cpu cortex-a15 \
> > +     -smp 1 -s -m 1024 -d unimp \
> > +     -serial stdio \
> > +     -netdev user,id=vmnic -device virtio-net-device,netdev=vmnic \
> > +     -semihosting-config enable,target=native \
> > +     -bios bl1.bin
>
>  I'm a bit worried that the script in the toolchains-builder will not be able to
> parse this. But because of the cd, it will anyway not work, so OK. It anyway
> looks a lot nicer like this than how it's done in the other readmes.

Thanks,

>
> [snip]
> > @@ -0,0 +1,47 @@
> > +# Architecture
> > +BR2_arm=y
> > +BR2_cortex_a15=y
> > +BR2_ARM_ENABLE_NEON=y
> > +BR2_ARM_ENABLE_VFP=y
> > +BR2_ARM_FPU_VFPV3D16=y
> > +# System
>
>  Please add an empty line before the different sections.
>
> > +BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
> > +# Filesystems (support several boot config)
> > +BR2_TARGET_ROOTFS_CPIO=y
> > +BR2_TARGET_ROOTFS_CPIO_GZIP=y
> > +BR2_TARGET_ROOTFS_EXT2=y
>
>  There's no reason at all to add ext2 and tar, so I removed both of them. If you
> want to support several boot configs, it should be mentioned in the readme file
> how to do that.
>
> > +# Generic
> > +BR2_ROOTFS_POST_BUILD_SCRIPT="board/qemu/arm-vexpress-tz/post-build.sh"
> > +# Linux 4.19 series
> > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
> > +BR2_LINUX_KERNEL=y
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.16"
> > +BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
> > +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/arm-vexpress-tz/linux.fragment"
> > +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> > +BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca15_a7"
> > +# TF-A for booting OP-TEE secure and uboot/linux non secure
> > +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> > +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
> > +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/ARM-software/arm-trusted-firmware.git"
> > +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.0"
>
>  There is a version selection available now, so I used that instead of the git
> download.
>
>  BTW, our current ATF version is still v1.4, maybe it should be bumped?
>
> > +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="qemu"
> > +BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
> > +BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
> > +BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="BL32_RAM_LOCATION=tdram"
> > +# OP-TEE components
> > +BR2_TARGET_OPTEE_OS=y
> > +BR2_TARGET_OPTEE_OS_PLATFORM="vexpress-qemu_virt"
> > +BR2_PACKAGE_OPTEE_CLIENT=y
> > +BR2_PACKAGE_OPTEE_TEST=y
> > +BR2_PACKAGE_OPTEE_EXAMPLES=y
> > +BR2_PACKAGE_OPTEE_BENCHMARK=y
> > +# U-boot for booting the dear Linux kernel
>
>  :-)
>
> > +BR2_TARGET_UBOOT=y
>
>  You have to specify the U-Boot version. I'm not sure what you tested with, but
> I used 2019.01 and it worked.

Would be nice to use BR2_TARGET_UBOOT_LATEST_VERSION.
BR2_TARGET_UBOOT_LATEST_VERSION=y

As for the linux kernel, i wonder if the generic config would be better?


>
> > +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> > +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="qemu_arm"
> > +BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/qemu/arm-vexpress-tz/u-boot.config"
> > +# Build Qemu emulator for the Arm target
>
>  I changed this in what we use everywhere else: host-qemu for gitlab testing

Thanks.

Regards,
Etienne

>
>  Regards,
>  Arnout
>
> > +BR2_PACKAGE_HOST_QEMU=y
> > +BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
> >
