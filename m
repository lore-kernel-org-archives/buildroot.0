From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Fri, 14 Apr 2017 19:16:31 -0400
Subject: [Buildroot] [PATCH 2/2] configs: add raspberrypi3 64bits
 defconfig
In-Reply-To: <7f20d3e0-f73b-de31-8d64-f36679d833d1@mind.be>
References: <20170414214551.17986-1-gael.portay@savoirfairelinux.com>
 <20170414214551.17986-3-gael.portay@savoirfairelinux.com>
 <7f20d3e0-f73b-de31-8d64-f36679d833d1@mind.be>
Message-ID: <20170414231631.baiyeibq4rdvi65s@gportay>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Sat, Apr 15, 2017 at 12:22:12AM +0200, Arnout Vandecappelle wrote:
> 
> 
> On 14-04-17 23:45, Ga?l PORTAY wrote:
> [snip]
> > diff --git a/board/raspberrypi/post-image.sh b/board/raspberrypi/post-image.sh
> > index b2bb07067..e4127c9ea 100755
> > --- a/board/raspberrypi/post-image.sh
> > +++ b/board/raspberrypi/post-image.sh
> > @@ -16,6 +16,29 @@ dtoverlay=pi3-miniuart-bt
> >  __EOF__
> >  	fi
> >  	;;
> > +	--aarch64)
> > +	# Run a 64bits kernel (armv8)
> > +	sed -e '/^kernel=/s,=.*,=Image,' -i "${BINARIES_DIR}/rpi-firmware/config.txt"
> > +	if ! grep -qE '^arm_control=0x200' "${BINARIES_DIR}/rpi-firmware/config.txt"; then
> > +		cat << __EOF__ >> "${BINARIES_DIR}/rpi-firmware/config.txt"
> > +
> > +# enable 64bits support
> > +arm_control=0x200
> > +__EOF__
> > +	fi
> > +
> > +	# Enable uart console
> > +	if ! grep -qE '^enable_uart=1' "${BINARIES_DIR}/rpi-firmware/config.txt"; then
> > +		cat << __EOF__ >> "${BINARIES_DIR}/rpi-firmware/config.txt"
> > +
> > +# enable rpi3 ttyS0 serial console
> > +enable_uart=1
> > +__EOF__
> > +	fi
> > +
> > +	# Use 64bits conffile
> > +	GENIMAGE_CFG="${BOARD_DIR}/genimage-${BOARD_NAME}-64.cfg"
> 
>  Isn't it better to just make a new raspberrypi3-64 symlink?
> 

I am sorry, could you detail a bit more... I did not get it :/

> > +	;;
> >  esac
> >  
> >  rm -rf "${GENIMAGE_TMP}"
> > diff --git a/configs/raspberrypi3_64_defconfig b/configs/raspberrypi3_64_defconfig
> > new file mode 100644
> > index 000000000..ddc6842f9
> > --- /dev/null
> > +++ b/configs/raspberrypi3_64_defconfig
> > @@ -0,0 +1,37 @@
> > +BR2_aarch64=y
> 
>  I think an explicit BR2_cortex_a53=y should be added. It's the default because
> it's the first one in the list, but I don't think it's good to rely on that.
> 

Indeed, it was present in my first draft. I did savedefconfig and cleaned it
up, and make it disappeared :(

>  BTW, does anyone know why the 32-bit version has cortex_a7?
> 

I think I was the magic a copy/paste. I have a patch to update the 32bit version
to cortex_a53, but it breaks compilation of qt5base.

I am still working on it. I located the bug but I don't know yet how to fix it
(properly).

To sum-up, setting BR2_cortex_a53 builds an armv8 toolchain that outputs 32bits
binaries.

Here are the ARM defines.

	#define __arm__ 1
	#define __ARM_32BIT_STATE 1
	#define __ARM_ARCH 8
	#define __ARM_ARCH_8A__ 1
	#define __ARM_ARCH_EXT_IDIV__ 1
	#define __ARM_ARCH_ISA_ARM 1
	#define __ARM_ARCH_ISA_THUMB 2
	#define __ARM_ARCH_PROFILE 65
	#define __ARM_EABI__ 1
	#define __ARMEL__ 1
	#define __ARM_FEATURE_CLZ 1
	#define __ARM_FEATURE_CRC32 1
	#define __ARM_FEATURE_DSP 1
	#define __ARM_FEATURE_IDIV 1
	#define __ARM_FEATURE_LDREX 15
	#define __ARM_FEATURE_QBIT 1
	#define __ARM_FEATURE_SAT 1
	#define __ARM_FEATURE_SIMD32 1
	#define __ARM_FEATURE_UNALIGNED 1
	#define __ARM_PCS 1
	#define __ARM_SIZEOF_MINIMAL_ENUM 4
	#define __ARM_SIZEOF_WCHAR_T 4

The flag __ARM_FEATURE_CRC32 is now defined and qtbase uses the AArch32/AArch64
CRC instructions to build an hardware accelerated implementation of its crc32
function [1].

	tools/qhash.cpp:148:54: error: attribute(target("+crc")) is unknown
	 static uint crc32(const Char *ptr, size_t len, uint h)

+crc is an ARMv8 only attribute [2]. __ARM_FEATURE_CRC32 is set for both AArch32
and AArch64 [3].

	6.5.8 CRC32 Extension
	__ARM_FEATURE_CRC32 is defined to 1 if the CRC32 instructions are
	supported and the intrinsics defined in 9.7 are available. These
	instructions include CRC32B, CRC32H etc. This is only available when
	__ARM_ARCH >= 8

	9.7 CRC32 intrinsics
	CRC32 intrinsics provide direct access to CRC32 instructions
	CRC32{C}{B, H, W, X} in both ARMv8 AArch32 and AArch64 execution states.
	These intrinsics are available when __ARM_FEATURE_CRC32 is defined.

The quick fix I found is to check for both define __aarch64__ and
__ARM_FEATURE_CRC32 instead of checking the single define __ARM_FEATURE_CRC32.

	#if defined(__aarch64__) && defined(__ARM_FEATURE_CRC32)

If anyone knows on which flag I can rely on... I can open a dedicated thread
about this bug.

> > +
> > +BR2_GCC_VERSION_6_X=y
> > +BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
> > +BR2_TOOLCHAIN_BUILDROOT_CXX=y
> > +
> > +BR2_SYSTEM_DHCP="eth0"
> > +
> > +# Linux headers same as kernel, a 4.9 series
> > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
> > +
> > +BR2_LINUX_KERNEL=y
> > +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> > +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
> > +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="935c7ce84c982a26f567a03a58a1537424569938"
> > +BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi3"
> > +
> > +# Build the DTB from the kernel sources
> > +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> > +BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2710-rpi-3-b broadcom/bcm2837-rpi-3-b"
> > +
> > +BR2_PACKAGE_RPI_FIRMWARE=y
> > +# BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS is not set
> > +
> > +# Required tools to create the SD image
> > +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> > +BR2_PACKAGE_HOST_GENIMAGE=y
> > +BR2_PACKAGE_HOST_MTOOLS=y
> > +
> > +# Filesystem / image
> > +BR2_TARGET_ROOTFS_EXT2=y
> > +BR2_TARGET_ROOTFS_EXT2_4=y
> > +BR2_TARGET_ROOTFS_EXT2_BLOCKS=126976
> 
>  I'd prefer a little bit more slack, I used 120000 in the defconfigs I just
> updated. And if that is not enough (or very tight), just jump directly to 250000.
> 

Okay.

>  Regards,
>  Arnout
> 
> > +# BR2_TARGET_ROOTFS_TAR is not set
> > +BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3/post-build.sh"
> > +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3/post-image.sh"
> > +BR2_ROOTFS_POST_SCRIPT_ARGS="--aarch64"
> > 
> 
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

Regards,
Ga?l

[1] https://github.com/qt/qtbase/blob/5.8/src/corelib/tools/qhash.cpp#L140
[2] https://gcc.gnu.org/onlinedocs/gcc/AArch64-Options.html#g_t-march-and--mcpu-Feature-Modifiers
[3] http://infocenter.arm.com/help/topic/com.arm.doc.ihi0053c/IHI0053C_acle_2_0.pdf
