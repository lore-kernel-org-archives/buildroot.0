From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 27 Jul 2012 18:06:50 +0200
Subject: [Buildroot] [PATCHv3 0/6] Add some support for device tree
	kernels
In-Reply-To: <1342528042-10038-1-git-send-email-maxime.ripard@free-electrons.com>
References: <1342528042-10038-1-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <CAHkwnC8tgsCmou-Z5Bv2A4+0Na=AagfVaZGoC2wmg6oy-c4PPA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Maxime,
thanks for the work, this feature it's very useful for me,
i tried your patches and i tried to build a kernel for arm, but it
failed to build it,
this is the tail of the output log:

cat /home/fabiopo/porting-pro3/ge863-pro3-linux-3.6/buildroot-dt/output/build/linux-3.5/arch/arm/boot/zImage
/home/fabiopo/porting-pro3/ge863-pro3-linux-3.6/buildroot-dt/output/build/linux-3.5/arch/arm/boot/"usb_a9260".dtb
> /home/fabiopo/porting-pro3/ge863-pro3-linux-3.6/buildroot-dt/output/build/linux-3.5/arch/arm/boot/zImage_dtb
mv /home/fabiopo/porting-pro3/ge863-pro3-linux-3.6/buildroot-dt/output/build/linux-3.5/arch/arm/boot/zImage_dtb
/home/fabiopo/porting-pro3/ge863-pro3-linux-3.6/buildroot-dt/output/build/linux-3.5/arch/arm/boot/zImage
# We need to generate a new u-boot image that takes into
# account the extra-size added by the device tree at the end
# of the image. To do so, we first need to retrieve both load
# address and entry point for the kernel from the already
# generate uboot image before using mkimage -l.
LOAD=` -l /home/fabiopo/porting-pro3/ge863-pro3-linux-3.6/buildroot-dt/output/build/linux-3.5/arch/arm/boot/uImage
| sed -n 's/Load Address: \([0-9]*\)/\1/p'`; ENTRY=` -l
/home/fabiopo/porting-pro3/ge863-pro3-linux-3.6/buildroot-dt/output/build/linux-3.5/arch/arm/boot/uImage
| sed -n 's/Entry Point: \([0-9]*\)/\1/p'`;  -A arm -O linux -T kernel
-C none -a ${LOAD} -e ${ENTRY} -n 'Linux Buildroot' -d
/home/fabiopo/porting-pro3/ge863-pro3-linux-3.6/buildroot-dt/output/build/linux-3.5/arch/arm/boot/zImage
/home/fabiopo/porting-pro3/ge863-pro3-linux-3.6/buildroot-dt/output/build/linux-3.5/arch/arm/boot/uImage
/bin/bash: -l: command not found
/bin/bash: -l: command not found
/bin/bash: -A: command not found
make: *** [/home/fabiopo/porting-pro3/ge863-pro3-linux-3.6/buildroot-dt/output/build/linux-3.5/.stamp_built]
Error 127


I've applied your patches on top of the commit
fd08153b9d677d654add6c580b9ccc5c27d672e2,

My defconfig is:
BR2_arm=y
BR2_arm926t=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.5"
BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
BR2_LINUX_KERNEL_INTREE_DTS_NAME="usb_a9260"
BR2_LINUX_KERNEL_APPENDED_UIMAGE=y


Best regards
-- 
Fabio Porcedda
