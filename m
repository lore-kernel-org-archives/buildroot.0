From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Aug 2018 22:34:44 +0200
Subject: [Buildroot] [PATCH 1/1] linux: build default dtbs if no
 specific source files given
In-Reply-To: <1533313674-722-1-git-send-email-bos@je-eigen-domein.nl>
References: <1533313674-722-1-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <20180816223444.41200c10@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Floris,

Thanks for this contribution. It definitely makes sense to support this.

On Fri,  3 Aug 2018 18:27:54 +0200, Floris Bos wrote:
> Currently if one wants to build dtbs, one has to specify which
> dts source files to build exactly.
> This is inconvenient, and some platforms use non-standard file
> names that are currently not supported by buildroot.
> (e.g. the overlay files in downstream Raspberry Pi kernel)

Could you give some more specific example of those non-standard names ?
Are we talking about .dtbo files ?

> diff --git a/linux/Config.in b/linux/Config.in
> index d30489e..40d337d 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -377,6 +377,10 @@ config BR2_LINUX_KERNEL_INTREE_DTS_NAME
>  	  the trailing .dts. You can provide a list of
>  	  dts files to build, separated by spaces.
>  
> +	  If both this option and out-of-tree path is left empty
> +	  the default set of dtbs for the kernel configuration
> +	  is build.

I think this should rather be in the help text of the
BR2_LINUX_KERNEL_DTS_SUPPORT. Basically, if you enable
BR2_LINUX_KERNEL_DTS_SUPPORT, but leave
BR2_LINUX_KERNEL_INTREE_DTS_NAME and BR2_LINUX_KERNEL_CUSTOM_DTS_PATH
empty, you'll have all Device Tree for the selected configuration built
and installed.

As a separate patch, we should also change:

  bool "Build a Device Tree Blob (DTB)"

to

  bool "Build Device Tree Blobs (DTBs)"

>  ifeq ($(BR2_LINUX_KERNEL_DTS_SUPPORT),y)
>  ifeq ($(BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT),)
> +ifeq ($(strip $(LINUX_DTS_NAME)),)
> +define LINUX_BUILD_DTB
> +	$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) dtbs

Perhaps we can do:

	$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) \
		$(if $(LINUX_DTS_NAME),$(LINUX_DTBS),dtbs)

to handle both situations at once.

> +define LINUX_INSTALL_DTB
> +	$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) \
> +		INSTALL_DTBS_PATH=$(1) dtbs_install

I see one problem with see: no all architecture that support building
dtbs have the dtbs_install target.

Can we install all *.dtb* for example ? Or should we say we don't care
if this new feature only works for a subset of the CPU architectures
that use DT ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
