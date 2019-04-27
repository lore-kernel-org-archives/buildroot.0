From: Dominik Menke <dom@digineo.de>
Date: Sat, 27 Apr 2019 23:02:44 +0200
Subject: [Buildroot] Possible conflict with systemd and e2fsprogs?
In-Reply-To: <20190427180814.GB27252@scaer>
References: <4dcaadcb-0ef8-887e-6681-1f326194315c@digineo.de>
 <20190427180814.GB27252@scaer>
Message-ID: <86bc386c-705f-ad70-eb03-85d094b7d540@digineo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 4/27/19 8:08 PM, Yann E. MORIN wrote:
> On 2019-04-25 20:15 +0200, Dominik Menke spake thusly:
>> I've run into trouble with the following configuration on Buildroot
>> 2019.02.1-100-g88eff22a9e (current 2019.02.x branch):
>>
>>      (
>>        echo BR2_INIT_SYSTEMD=y
>>        echo BR2_PACKAGE_E2FSPROGS=y
>>      ) | cat configs/raspberrypi3_defconfig - > configs/myrpi_defconfig
>>      make myrpi_defconfig
> 
> How can that even work, when systemd depends on glibc?
> 
> And indeed, here, systemd is not selected when I do the above
> commands...

I may have forgotten to include BR2_TOOLCHAIN_BUILDROOT_GLIBC=y, yes. I 
must have assumed selecting BR2_INIT_SYSTEMD would also change the libc 
selection automatically, so I didn't verify that this is actually the 
case (because, as you say, systemd depends on it).

Please find my complete defconfig here:

BR2_arm=y
BR2_cortex_a53=y
BR2_ARM_FPU_NEON_VFPV4=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
BR2_BINUTILS_VERSION_2_31_X=y
BR2_GCC_VERSION_8_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_INIT_SYSTEMD=y
BR2_TARGET_LOCALTIME="Europe/Berlin"
BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3/post-build.sh"
BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3/post-image.sh"
BR2_ROOTFS_POST_SCRIPT_ARGS="--gpu_mem_1024=256"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call 
github,raspberrypi,linux,83b36f98e1a48d143f0b466fcf9f8c4e382c9a1c)/linux-83b36f98e1a48d143f0b466fcf9f8c4e382c9a1c.tar.gz"
BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
BR2_LINUX_KERNEL_DTS_SUPPORT=y
BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2710-rpi-3-b bcm2710-rpi-3-b-plus 
bcm2710-rpi-cm3"
BR2_PACKAGE_E2FSPROGS=y
BR2_PACKAGE_OPENSSH=y
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_4=y
BR2_TARGET_ROOTFS_EXT2_SIZE="150M"
# BR2_TARGET_ROOTFS_TAR is not set
BR2_PACKAGE_HOST_DOSFSTOOLS=y
BR2_PACKAGE_HOST_GENIMAGE=y
BR2_PACKAGE_HOST_MTOOLS=y


Kind Regards,
Dominik
