From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 27 Jan 2014 22:51:57 +0100
Subject: [Buildroot] [PATCH 2/2] linux: only depend on host-lzop if
	needed
In-Reply-To: <1d22a1ff0f39a4b4e8fe4186cf9696a44a01e20f.1390744549.git.yann.morin.1998@free.fr>
References: <cover.1390744549.git.yann.morin.1998@free.fr>
 <1d22a1ff0f39a4b4e8fe4186cf9696a44a01e20f.1390744549.git.yann.morin.1998@free.fr>
Message-ID: <52E6D4FD.8030605@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26/01/14 14:56, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> There is no reason to always depend on host-lzop, even when the kernel
> compression is not LZO.
>
> Since LZO is not the default compression option in the kernel (and there
> is not sign that will change in the foreseeable future), it will always
> appear in a condif file, whether it is a complete config file or it is
> only a defconfig.
>
> So, only depend on host-lzop if the LZO compression is enabled in the
> kernel config file (either the defconfig or the custom config file).
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>   linux/linux.mk | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/linux/linux.mk b/linux/linux.mk
> index ab25fe9..f34bea1 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -38,7 +38,7 @@ endif
>   LINUX_PATCHES = $(call qstrip,$(BR2_LINUX_KERNEL_PATCH))
>
>   LINUX_INSTALL_IMAGES = YES
> -LINUX_DEPENDENCIES  += host-kmod host-lzop
> +LINUX_DEPENDENCIES  += host-kmod
>
>   ifeq ($(BR2_LINUX_KERNEL_UBOOT_IMAGE),y)
>   	LINUX_DEPENDENCIES += host-uboot-tools
> @@ -163,6 +163,10 @@ else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG),y)
>   KERNEL_SOURCE_CONFIG = $(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE)
>   endif
>
> +ifeq ($(call KCONFIG_GET_OPT,CONFIG_KERNEL_LZO,$(call qstrip,$(KERNEL_SOURCE_CONFIG))),y)

  I would be nicer if the qstrip would move to the definition of 
KERNEL_SOURCE_CONFIG a few lines higher. It's already there in one 
condition, but not in the other.

  Regards,
  Arnout

> +LINUX_DEPENDENCIES += host-lzop
> +endif
> +
>   define LINUX_CONFIGURE_CMDS
>   	cp $(KERNEL_SOURCE_CONFIG) $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig
>   	$(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) buildroot_defconfig
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
