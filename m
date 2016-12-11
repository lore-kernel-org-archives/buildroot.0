From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Dec 2016 15:39:24 +0100
Subject: [Buildroot] [PATCH] linux: Adding customizable linux logo
In-Reply-To: <1481051295-1190-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1481051295-1190-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20161211153924.0efcdc07@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  6 Dec 2016 20:08:15 +0100, Angelo Compagnucci wrote:
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

Why is this implemented as a Linux extension? There's no reason for
that, it could just be an option of the Linux package itself.

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
> +
> +config BR2_PACKAGE_CUSTOMLOGO_PATH
> +	string "Image file path"
> +	depends on BR2_LINUX_KERNEL_EXT_CUSTOMLOGO
> +	help
> +	  This image will be used as custom logo.
> +
> +config BR2_PACKAGE_CUSTOMLOGO_CONVERT
> +	bool "Convert custom logo to kernel format"
> +	depends on BR2_LINUX_KERNEL_EXT_CUSTOMLOGO

Why do we have this sub-option? Makes more sense to just run "convert"
unconditionally. Of course, as Arnout said, this will require add
host-imagemagick in the dependencies of the linux package.

> +ifeq ($(BR2_PACKAGE_CUSTOMLOGO_CONVERT),)
> +define CUSTOMLOGO_PREPARE_KERNEL
> +	cp $(BR2_PACKAGE_CUSTOMLOGO_PATH) $(LINUX_DIR)/drivers/video/logo/logo_linux_clut224.ppm

But there's a more fundamental problem to this: you're simply
generating logo_linux_clut224.ppm, but what tells you that the kernel
is going to use this specific file?

Depending on whether the screen supports 1-bit, 4-bit or 8-bit pixel
depth, and depending on the kernel configuration in
drivers/video/logo/, it's not necessarily logo_linux_clut224.ppm that
will be used.

I think if we want to do this, we want to:

 - Enable CONFIG_LOGO_LINUX_MONO, CONFIG_LOGO_LINUX_VGA16 and
   CONFIG_LOGO_LINUX_CLUT224

 - Install logo_linux_clut224.ppm, logo_linux_mono.pbm and
   logo_linux_vga16.ppm.

However, this means the user can no longer disable
CONFIG_LOGO_LINUX_VGA16 and/or CONFIG_LOGO_LINUX_MONO if he only uses
CONFIG_LOGO_LINUX_CLUT224.

Overall, I think the benefit is really not worth the complexity.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
