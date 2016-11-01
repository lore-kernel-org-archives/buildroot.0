From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Nov 2016 16:09:57 +0100
Subject: [Buildroot] [PATCH 3/4] linux: add ev3dev extension
In-Reply-To: <1477870346-4941-4-git-send-email-david@lechnology.com>
References: <1477870346-4941-1-git-send-email-david@lechnology.com>
 <1477870346-4941-4-git-send-email-david@lechnology.com>
Message-ID: <20161101160957.3db26646@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 30 Oct 2016 18:32:25 -0500, David Lechner wrote:
> This adds an ev3dev extension that provides linux kernel drivers for LEGO
> MINDSTORMS EV3 from the ev3dev project.
> 
> Signed-off-by: David Lechner <david@lechnology.com>

This all looks mostly good, I only have a few minor comments.

The first one is about the naming: ev3dev is really the name of the
overall project/organization, so I think the package should rather be
named ev3dev-lego-linux or ev3dev-lego-linux-drivers or
ev3dev-linux-drivers or something like this. Of course, this applies to
both the package itself and the corresponding Linux extension.


> diff --git a/linux/linux-ext-ev3dev.mk b/linux/linux-ext-ev3dev.mk
> new file mode 100644
> index 0000000..23e4c8d
> --- /dev/null
> +++ b/linux/linux-ext-ev3dev.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +# Linux ev3dev extensions
> +#
> +# Patch the linux kernel with ev3dev extension
> +################################################################################
> +
> +LINUX_EXTENSIONS += ev3dev
> +
> +define EV3DEV_PREPARE_KERNEL
> +	dest=drivers/lego ; \
> +	mkdir -p $(LINUX_DIR)/$${dest}; \
> +	cp -dpfr $(EV3DEV_DIR)/* $(LINUX_DIR)/$${dest}/

I'm not sure using a variable for $${dest} is really useful since there
are only two instances, but if you really want to do so, please use a
make variable. Maybe:

EV3DEV_LINUX_DRIVER_DIR = $(LINUX_DIR)/drivers/lego/

define EV3DEV_PREPARE_KERNEL
	mkdir -p $(EV3DEV_LINUX_DRIVER_DIR)
	cp -dpfr $(EV3DEV_DIR)/* $(EV3DEV_LINUX_DRIVER_DIR)
endef

or something along those lines.


> +config BR2_PACKAGE_EV3DEV
> +	bool
> +	depends on BR2_LINUX_KERNEL
> +	help
> +	  Linux drivers for LEGO MINDSTORMS EV3
> +
> +	  This is only the download helper for the kernel patch.

kernel extension

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
