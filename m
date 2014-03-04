From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 04 Mar 2014 07:37:19 +0100
Subject: [Buildroot] [git commit] linux: only depend on host-lzop if
	needed
In-Reply-To: <20140303212321.09FDC9B9F2@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Mon, 3 Mar 2014 22:22:06 +0100")
References: <20140303212321.09FDC9B9F2@busybox.osuosl.org>
Message-ID: <87mwh679ls.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > commit: http://git.buildroot.net/buildroot/commit/?id=ca80782f4571f004c2b8cf2d0e60e83343beff34
 > branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > There is no reason to always depend on host-lzop, even when the kernel
 > compression is not LZO.

 > Since LZO is not the default compression option in the kernel (and there
 > is not sign that will change in the foreseeable future), it will always
 > appear in a config file, whether it is a complete config file or it is
 > only a defconfig.

 > So, only depend on host-lzop if the LZO compression is enabled in the
 > kernel config file (either the defconfig or the custom config file).
 > This includes:
 >   - kernel compression itself
 >   - initrd compression
 >   - initramfs compression

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > ---
 >  linux/linux.mk |   11 +++++++++--
 >  1 files changed, 9 insertions(+), 2 deletions(-)

 > diff --git a/linux/linux.mk b/linux/linux.mk
 > index f948e6c..cf728aa 100644
 > --- a/linux/linux.mk
 > +++ b/linux/linux.mk
 > @@ -41,7 +41,7 @@ endif
 >  LINUX_PATCHES = $(call qstrip,$(BR2_LINUX_KERNEL_PATCH))
 
 >  LINUX_INSTALL_IMAGES = YES
 > -LINUX_DEPENDENCIES  += host-kmod host-lzop
 > +LINUX_DEPENDENCIES  += host-kmod
 
 >  ifeq ($(BR2_LINUX_KERNEL_UBOOT_IMAGE),y)
 >  	LINUX_DEPENDENCIES += host-uboot-tools
 > @@ -163,7 +163,14 @@ LINUX_POST_PATCH_HOOKS += LINUX_APPLY_PATCHES
 >  ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
 >  KERNEL_SOURCE_CONFIG = $(KERNEL_ARCH_PATH)/configs/$(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))_defconfig
 >  else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG),y)
 > -KERNEL_SOURCE_CONFIG = $(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE)
 > +KERNEL_SOURCE_CONFIG = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE))
 > +endif
 > +
 > +ifeq ($(call KCONFIG_GET_OPT,CONFIG_KERNEL_LZO,$(KERNEL_SOURCE_CONFIG)),y)

Doesn't this get executed very early, E.G. before the linux sources are
extracted? Does it work with configurations using a defconfig in the
kernel sources like sheevaplug_defconfig?

-- 
Bye, Peter Korsgaard
