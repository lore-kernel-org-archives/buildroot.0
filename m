From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 3 Oct 2015 22:19:33 +0100
Subject: [Buildroot] [PATCH 3/7] u-boot: add an option to indicate that
 DTC is needed
In-Reply-To: <1443901457-7914-4-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1443901457-7914-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1443901457-7914-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <56104665.6020309@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03-10-15 20:44, Thomas Petazzoni wrote:
> Some U-Boot configurations require the Device Tree compiler to be
> available, so we need to depend on host-dtc (example configuration:
> zynq_zed).
> 
> However, we don't want to build it unconditionally, since the vast
> majority of U-Boot configurations don't need it (and host-dtc itself
> has a bunch of dependencies).
> 
> So, we simply add a Config.in option that allows users to indicate
> whether their U-Boot needs DTC or not, and depend on host-dtc if this
> option is enabled.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 I don't really like that the option has to be user-configurable, but I see no
other way. So:

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

with one small nit.

> ---
>  boot/uboot/Config.in | 7 +++++++
>  boot/uboot/uboot.mk  | 4 ++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index be51642..8643dab 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -139,6 +139,13 @@ config BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE
>  	  Path to the U-Boot configuration file.
>  endif
>  
> +config BR2_TARGET_UBOOT_NEEDS_DTC
> +	bool "U-Boot needs dtc"
> +	select BR2_PACKAGE_HOST_DTC
> +	help
> +	  Select this option if your U-Boot board configuration
> +	  requires the Device Tree compiler to be available.

 Device Tree Compiler.

> +
>  choice
>  	prompt "U-Boot binary format"
>  	default BR2_TARGET_UBOOT_FORMAT_BIN
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index 8f321ac..af583d1 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -77,6 +77,10 @@ UBOOT_MAKE_OPTS += \
>  	CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)" \
>  	ARCH=$(UBOOT_ARCH)
>  
> +ifeq ($(BR2_TARGET_UBOOT_NEEDS_DTC),y)
> +UBOOT_DEPENDENCIES += host-dtc
> +endif
> +
>  # Helper function to fill the U-Boot config.h file.
>  # Argument 1: option name
>  # Argument 2: option value
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
