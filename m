From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Jun 2016 22:03:00 +0200
Subject: [Buildroot] [PATCH] RFC: adding customizable linux logo
In-Reply-To: <1454454342-27717-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1454454342-27717-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20160601220300.5f38a5a2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Angelo,

It's been a while since you sent this patch. I don't know if this
feature is important enough to be integrated, but I'll do some review
anyway.

On Wed,  3 Feb 2016 00:05:42 +0100, Angelo Compagnucci wrote:

> diff --git a/linux/Config.ext.in b/linux/Config.ext.in
> index 755c23b..b752c9c 100644
> --- a/linux/Config.ext.in
> +++ b/linux/Config.ext.in
> @@ -1,5 +1,13 @@
>  menu "Linux Kernel Extensions"
>  
> +# Custom logo
> +config BR2_LINUX_KERNEL_EXT_CUSTOMLOGO
> +	select BR2_PACKAGE_CUSTOMLOGO

I think this customlogo package is not needed.

> +	bool "Custom logo"
> +	help
> +	  change linux boot logo with your own graphics. 
> +	  Can be used as an early bootsplash.

This help text needs to be improved a bit.

> +
>  # Xenomai
>  config BR2_LINUX_KERNEL_EXT_XENOMAI
>  	bool "Adeos/Xenomai Real-time patch"
> diff --git a/linux/linux-ext-customlogo.mk b/linux/linux-ext-customlogo.mk
> new file mode 100644
> index 0000000..68c613a
> --- /dev/null
> +++ b/linux/linux-ext-customlogo.mk
> @@ -0,0 +1,11 @@
> +################################################################################
> +#
> +# Custom logo
> +#
> +################################################################################
> +
> +LINUX_EXTENSIONS += customlogo
> +
> +define CUSTOMLOGO_PREPARE_KERNEL

You can do the conversion from the original image format to .ppm here
directly, and therefore avoid the need for the customlogo package.

> +	cp $(CUSTOMLOGO_DIR)/logo_linux_clut224.ppm $(LINUX_DIR)/drivers/video/logo/logo_linux_clut224.ppm
> +endef
> diff --git a/package/Config.in b/package/Config.in
> index 7ced9d4..1552f32 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -214,6 +214,7 @@ comment "Sounds"
>  
>  comment "Themes"
>  	source "package/gtk2-engines/Config.in"
> +	source "package/customlogo/Config.in"
>  
>  endmenu
>  
> diff --git a/package/customlogo/Config.in b/package/customlogo/Config.in
> new file mode 100644
> index 0000000..f8502da
> --- /dev/null
> +++ b/package/customlogo/Config.in
> @@ -0,0 +1,16 @@
> +config BR2_PACKAGE_CUSTOMLOGO
> +	bool "Custom logo"
> +	help
> +	  Change linux boot logo with your own graphics. 
> +	  Can be used as an early bootsplash.
> +
> +	  *REQUIRES* a pre installed imagemagick on the host system.

I don't think this is acceptable. You probably should add a
host-imagemagick package, and make the linux package depend on it when
a custom logo is selected.

In addition, when a custom logo is selected, you probably want to tweak
the Linux kernel configuration to make sure it has the relevant options.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
