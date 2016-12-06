From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 7 Dec 2016 00:51:30 +0100
Subject: [Buildroot] [PATCH] linux: Adding customizable linux logo
In-Reply-To: <1481051295-1190-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1481051295-1190-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <ce43ed01-ac0d-32e6-64af-c2d35a6f719b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06-12-16 20:08, Angelo Compagnucci wrote:
> This patch adds a custom linux logo to the generated kernel image.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> ---
>  linux/Config.ext.in           | 26 ++++++++++++++++++++++++++
>  linux/linux-ext-customlogo.mk | 19 +++++++++++++++++++
>  2 files changed, 45 insertions(+)
>  create mode 100644 linux/linux-ext-customlogo.mk
> 
> diff --git a/linux/Config.ext.in b/linux/Config.ext.in
> index 011dffb..da63109 100644
> --- a/linux/Config.ext.in
> +++ b/linux/Config.ext.in
> @@ -1,5 +1,31 @@
>  menu "Linux Kernel Extensions"
>  
> +# Custom logo
> +config BR2_LINUX_KERNEL_EXT_CUSTOMLOGO
> +	bool "Custom logo"
> +	select BR2_PACKAGE_CUSTOMLOGO
> +	help
> +	  Change linux boot logo with your own graphics. 
> +	  Can be used as an early bootsplash.
> +	  The file should be in kernel ppm format if the
> +	  option BR2_PACKAGE_CUSTOMLOGO_CONVERT is not
> +	  selected.

 You should wrap at 72 colums (where tab counts as 8, so 62 effective characters).

> +
> +config BR2_PACKAGE_CUSTOMLOGO_PATH
> +	string "Image file path"
> +	depends on BR2_LINUX_KERNEL_EXT_CUSTOMLOGO
> +	help
> +	  This image will be used as custom logo.
> +
> +config BR2_PACKAGE_CUSTOMLOGO_CONVERT

 The feedback in your RFC patch was to remove the convert option.


 Regards,
 Arnout

> +	bool "Convert custom logo to kernel format"
> +	depends on BR2_LINUX_KERNEL_EXT_CUSTOMLOGO
> +	help
> +	  If checked, the convert command will be run on the source
> +	  image file to obtain a kernel compatible ppm image file.
> +	  *REQUIRES* a pre installed imagemagick on the host system
> +	  to convert the image.
> +
>  #-------------------------------------------------------------------------------
>  # Xenomai
>  config BR2_LINUX_KERNEL_EXT_XENOMAI
> diff --git a/linux/linux-ext-customlogo.mk b/linux/linux-ext-customlogo.mk
> new file mode 100644
> index 0000000..99e3ab1
> --- /dev/null
> +++ b/linux/linux-ext-customlogo.mk
> @@ -0,0 +1,19 @@
> +################################################################################
> +#
> +# Custom logo
> +#
> +################################################################################
> +
> +LINUX_EXTENSIONS += customlogo
> +
> +ifeq ($(BR2_PACKAGE_CUSTOMLOGO_CONVERT),)
> +define CUSTOMLOGO_PREPARE_KERNEL
> +	cp $(BR2_PACKAGE_CUSTOMLOGO_PATH) $(LINUX_DIR)/drivers/video/logo/logo_linux_clut224.ppm
> +endef
> +else
> +define CUSTOMLOGO_PREPARE_KERNEL
> +	convert $(BR2_PACKAGE_CUSTOMLOGO_PATH) \
> +			-dither None -colors 224 -compress none \
> +			$(LINUX_DIR)/drivers/video/logo/logo_linux_clut224.ppm
> +endef
> +endif
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
