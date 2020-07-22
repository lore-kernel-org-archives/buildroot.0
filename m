From: Stephen Beckwith <embeddedsteve@gmail.com>
Date: Wed, 22 Jul 2020 18:05:39 -0400
Subject: [Buildroot] Re-building a Linux Net-bootable image after all other
 components are built
Message-ID: <CAN34fowMoYAPF1iJKBPQFfVBfcNR_Sv52Cvtzus5WA2UOScDSA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Please pardon the verbosity of this - I am a believer that the more you
know (i.e. context) the better.  I am grateful for your expertise and
assistance.
Regards,
Stephen Beckwith

*In original setup:*

BR 2015.08.1  With GCC 4.4.7 (BR Build)

Kernel = linux-3.14.17-pilot4  {with patches}

U-Boot = u-boot-2013.07-pilot4  {with patches}

 - in this setup, everything works fine.  We complete our build steps, then
we go back and do a ?rebuild? of the Linux kernel as shown below.  The
output uImage (renamed to uImage_netboot) will be approximately the same
size as the output image we create for flashing:  ~ 26MB.

 - This will be a linux kernel (~ 2.8MB) + an INITRAMFS attached - to make
the total size.


*New Setup:*

BR 2020.02.1  With GCC 9.2.0 (and updated glibc as well)

Kernel and U-boot are the same, with some additional patches to allow for
successful compile.

 - here, the final output is ~ the same as the previous build.

 - However, when we go to remake the Netboot image, we only get the Kernel
output size of ~ 2.8MB, without the attached ROOT FILE SYSTEM.


Investigation seems to show that the updated Buildroot internals are doing
somethings differently vs. how we had implemented this in the current setup.
The linux .config (in the output/build/linux-custom directory) seems to be
getting overwritten by Buildroot AFTER we have manually modified it (shown
below).  When I searched the .config file in the linux build directory, the
parameters set below are NOT present, which leads me to believe that
Buildroot is overwriting this during the reconfigure step (which it didn?t
use to in the current setup).


I?m looking for suggestions on how to do this post-processing build with
the new Buildroot setup to generate this image.  We have the rootfs.cpio
file to be attached to the kernel, just need to figure out how to do this
?correctly?.


*BR Configuration:*

BR2_ROOTFS_POST_IMAGE_SCRIPT="$(BR2_EXTERNAL_SP_DEV_PATH)/scripts/post_image_build.sh"


The post_image_build.sh script calls: buildrootfs_binary_files script

This script will Generate the ext4 RFS images required (verified they are
correct)

The post_image_build.sh then creates the package we flash on our devices,
packing up the kernel and RFS with a ?header? for our update process.

The very last step done in the entire process is to call:
build_netbooting_image.sh


This build_netbooting_image.sh script will:

Save off the uImage in the build directory, saves the original config file
as well

It then ?tweaks? the output/build/linux-custom directory?s .config file

CONFIG_INITRAMFS_SOURCE=${BR_BINARIES_DIR}/rootfs.cpio

CONFIG_INITRAMFS_ROOT_UID = 0

CONFIG_INITRAMFS_ROOT_GID =0

CONFIG_INITRAMFS_COMPRESSION_NONE = y

cd into the output directory and from here does a ?make linux-reconfigure?

Does clean up and re-copy of images: so we get a ?uImage_netboot? of ~ 26MB


This is the exact same process that we do with current buildroot setup -
the only real difference is the Buildroot infrastructure and the compiler.


*Current Build:*

  LD      vmlinux

  SORTEX  vmlinux

  SYSMAP  System.map

  OBJCOPY arch/arm/boot/Image

  Kernel: arch/arm/boot/Image is ready

  GZIP    arch/arm/boot/compressed/piggy.gzip

  AS      arch/arm/boot/compressed/piggy.gzip.o

arm-buildroot-linux-gnueabi-gcc: warning:
/u/sbeckwit/p4/spNext/mendo_dev/src/include: linker input file unused
because linking not done

  LD      arch/arm/boot/compressed/vmlinux

  OBJCOPY arch/arm/boot/zImage

  Kernel: arch/arm/boot/zImage is ready

  UIMAGE  arch/arm/boot/uImage

Image Name:   Linux-3.14.17-ami

Created:      Thu Jun 11 15:17:52 2020

Image Type:   ARM Linux Kernel Image (uncompressed)

*Data Size:    26622048 Bytes = 25998.09 kB = 25.39 MB*

Load Address: 81008000

Entry Point:  81008000

  Image arch/arm/boot/uImage is ready

  CHK     include/config/kernel.release

  CHK     include/generated/uapi/linux/version.h

  CHK     include/generated/utsrelease.h

make[6]: `include/generated/mach-types.h' is up to date.

  CALL    scripts/checksyscalls.sh

arm-buildroot-linux-gnueabi-gcc: warning:
/u/sbeckwit/p4/spNext/mendo_dev/src/include: linker input file unused
because linking not done

  Building modules, stage 2.

  MODPOST 8 modules


*New Build:*

  CHK     include/config/kernel.release

  CHK     include/generated/uapi/linux/version.h

  CHK     include/generated/utsrelease.h

make[6]: 'include/generated/mach-types.h' is up to date.

  CALL    scripts/checksyscalls.sh

arm-buildroot-linux-gnueabi-gcc.br_real: warning:
/home/sbeckwit/sp_dev/bowie_dev/src/include: linker input file unused
because linking not done

  CHK     include/generated/compile.h

  CHK     kernel/config_data.h

  Kernel: arch/arm/boot/Image is ready

  Kernel: arch/arm/boot/zImage is ready

  UIMAGE  arch/arm/boot/uImage

Image Name:   Linux-3.14.17-ami

Created:      Thu Jun 11 15:04:23 2020

Image Type:   ARM Linux Kernel Image (uncompressed)

*Data Size:    2824656 Bytes = 2758.45 KiB = 2.69 MiB*

Load Address: 81008000

Entry Point:  81008000

  Image arch/arm/boot/uImage is ready

 - More detailed listings can be provided.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200722/ec68d563/attachment.html>
