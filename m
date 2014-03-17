From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 17 Mar 2014 07:47:55 +0100
Subject: [Buildroot] [PATCH] syslinux: install helper programs to the
 host
In-Reply-To: <1394996670-8037-1-git-send-email-fhunleth@troodon-software.com>
References: <1394996670-8037-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <53269A9B.1070009@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/16/14 20:04, Frank Hunleth wrote:
> Even though syslinux is built for the target, it does create helper
> programs intended to be run on the host such as syslinux and extlinux.
> This change installs these helper programs to the host so that they may be
> called by post image creation scripts.

 So what is host-syslinux for then?


 In fact, we currently have two ways for installing the host-tools of
bootloaders:

1. An explicit host-foo package, used by syslinux and u-boot. In the case
of u-boot, it's even a separate package u-boot-tools in package/

2. Implicit when installing to target, used by grub, and grub2 (and by
this patch as well). In the case of grub2, nothing is installed to target
in fact, instead it's installed to HOST_DIR.

 So maybe we should converge on a single mechanism for all
bootloader-host-tools. I'm personally in favour of option 1, but I have
no strong opinion.

 Regards,
 Arnout


> 
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
> ---
>  boot/syslinux/syslinux.mk | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
> index eedc364..7b3f9cf 100644
> --- a/boot/syslinux/syslinux.mk
> +++ b/boot/syslinux/syslinux.mk
> @@ -11,7 +11,6 @@ SYSLINUX_SITE    = $(BR2_KERNEL_MIRROR)/linux/utils/boot/syslinux/4.xx/
>  SYSLINUX_LICENSE = GPLv2+
>  SYSLINUX_LICENSE_FILES = COPYING
>  
> -SYSLINUX_INSTALL_TARGET = NO
>  SYSLINUX_INSTALL_IMAGES = YES
>  
>  SYSLINUX_DEPENDENCIES = host-nasm host-util-linux
> @@ -23,6 +22,12 @@ define SYSLINUX_BUILD_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE) CC="$(HOSTCC) -idirafter $(HOST_DIR)/usr/include $(HOST_LDFLAGS)" AR="$(HOSTAR)" -C $(@D)
>  endef
>  
> +define SYSLINUX_INSTALL_TARGET_CMDS
> +	# While the actual bootloader is compiled for the target, several
> +	# utilities for installing the bootloader are meant for the host.
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) INSTALLROOT=$(HOST_DIR) install
> +endef
> +
>  SYSLINUX_IMAGES-$(BR2_TARGET_SYSLINUX_ISOLINUX) += isolinux.bin
>  SYSLINUX_IMAGES-$(BR2_TARGET_SYSLINUX_PXELINUX) += pxelinux.bin
>  
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
