From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 26 Jan 2014 21:23:25 +0100
Subject: [Buildroot] [PATCH 2/2] linux: only depend on host-lzop if
	needed
In-Reply-To: <1d22a1ff0f39a4b4e8fe4186cf9696a44a01e20f.1390744549.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sun, 26 Jan 2014 14:56:27 +0100")
References: <cover.1390744549.git.yann.morin.1998@free.fr>
 <1d22a1ff0f39a4b4e8fe4186cf9696a44a01e20f.1390744549.git.yann.morin.1998@free.fr>
Message-ID: <87sisa1ohu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > There is no reason to always depend on host-lzop, even when the kernel
 > compression is not LZO.

 > Since LZO is not the default compression option in the kernel (and there
 > is not sign that will change in the foreseeable future), it will always
 > appear in a condif file, whether it is a complete config file or it is
 > only a defconfig.

 > So, only depend on host-lzop if the LZO compression is enabled in the
 > kernel config file (either the defconfig or the custom config file).

Nice, thanks - Just a few comments..


 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > ---
 >  linux/linux.mk | 6 +++++-
 >  1 file changed, 5 insertions(+), 1 deletion(-)

 > diff --git a/linux/linux.mk b/linux/linux.mk
 > index ab25fe9..f34bea1 100644
 > --- a/linux/linux.mk
 > +++ b/linux/linux.mk
 > @@ -38,7 +38,7 @@ endif
 >  LINUX_PATCHES = $(call qstrip,$(BR2_LINUX_KERNEL_PATCH))
 
 >  LINUX_INSTALL_IMAGES = YES
 > -LINUX_DEPENDENCIES  += host-kmod host-lzop
 > +LINUX_DEPENDENCIES  += host-kmod
 
 >  ifeq ($(BR2_LINUX_KERNEL_UBOOT_IMAGE),y)
 >  	LINUX_DEPENDENCIES += host-uboot-tools
 > @@ -163,6 +163,10 @@ else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG),y)
 >  KERNEL_SOURCE_CONFIG = $(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE)
 >  endif
 
 > +ifeq ($(call KCONFIG_GET_OPT,CONFIG_KERNEL_LZO,$(call qstrip,$(KERNEL_SOURCE_CONFIG))),y)
 > +LINUX_DEPENDENCIES += host-lzop
 > +endif

Another user of lzop seems to be the initramfs support, so we whould
probably also check for RD_LZO (but that's auto enabled/prompt-less if
!expert, so might not be in the .config, so perhaps we should just check
for INITRAMFS_SOURCE):

config RD_LZO
        bool "Support initial ramdisks compressed using LZO" if EXPERT
        default !EXPERT
        depends on BLK_DEV_INITRD
        select DECOMPRESS_LZO
        help
          Support loading of a LZO encoded initial ramdisk or cpio buffer
          If unsure, say N.

Furthermore, this will probably give a pretty odd error message if
people mistype the config file name. Not directly related to this
change, but it would probably be a good thing if we would check and
error out early if any of the needed config files aren't present
(busybox/uclibc/uboot/kernel/..)  with something like

ifeq ($(wildcard $(BR2_PACKAGE_FOO_CONFIG)),)
$(error Configuration file '$(BR2_PACKAGE_FOO_CONFIG)' not found. Check your BR2_PACKAGE_FOO_CONFIG settings)

-- 
Bye, Peter Korsgaard
