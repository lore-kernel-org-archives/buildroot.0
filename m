From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Apr 2016 09:27:36 +0200
Subject: [Buildroot] [PATCH 1/1] nvme: Allow libudev support
In-Reply-To: <1460955386-21322-1-git-send-email-sam@mendozajonas.com>
References: <1460955386-21322-1-git-send-email-sam@mendozajonas.com>
Message-ID: <20160418092736.373a7c07@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for your contribution!

On Mon, 18 Apr 2016 14:56:26 +1000, Samuel Mendoza-Jonas wrote:
> Commands like 'nvme list' require libudev but support for libudev is
> decided at compile time, and in buildroot this is hard disabled.
> Add a config option which allows libudev support to be enabled for the
> nvme package.
> 
> Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
> ---
>  package/nvme/Config.in |  9 +++++++++
>  package/nvme/nvme.mk   | 10 ++++++++++
>  2 files changed, 19 insertions(+)
> 
> diff --git a/package/nvme/Config.in b/package/nvme/Config.in
> index dd8655f..4590fdc 100644
> --- a/package/nvme/Config.in
> +++ b/package/nvme/Config.in
> @@ -5,3 +5,12 @@ config BR2_PACKAGE_NVME
>  	  Express (optimized PCI Express SSD interface) devices.
>  
>  	  https://github.com/linux-nvme/nvme-cli
> +
> +if BR2_PACKAGE_NVME
> +
> +config BR2_PACKAGE_NVME_LIBUDEV
> +	bool "nvme-udev"
> +	help
> +	  libudev support for the NVME utility
> +
> +endif

We don't need a new sub-option, just enable udev support if udev is
available.

> +ifeq ($(BR2_PACKAGE_NVME_LIBUDEV), y)

Remove the space before 'y', and make this:

ifeq ($(BR2_PACKAGE_HAS_UDEV),y)

> +NVME_DEPENDENCIES = udev

Use += here

And then also define:

NVME_MAKE_OPTS += LIBUDEV=0
else
NVME_MAKE_OPTS += LIBUDEV=1

> +endif
>  
>  # LIBUDEV=1 means that libudev is _disabled_
> +ifeq ($(BR2_PACKAGE_NVME_LIBUDEV), y)
> +define NVME_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
> +		LIBUDEV=0 -C $(@D)
> +endef
> +else
>  define NVME_BUILD_CMDS
>  	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
>  		LIBUDEV=1 -C $(@D)
>  endef

Don't duplicate the NVME_BUILD_CMDS variable, simply use
$(NVME_MAKE_OPTS) as defined above.

Could you rework your patch and send an updated version? Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
