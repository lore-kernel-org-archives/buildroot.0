From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 8 Jul 2013 19:47:39 +0200
Subject: [Buildroot] [PATCH 2/2] beagle-capes: new package
In-Reply-To: <1373239866-18076-2-git-send-email-spenser@gillilanding.com>
References: <1373239866-18076-1-git-send-email-spenser@gillilanding.com>
 <1373239866-18076-2-git-send-email-spenser@gillilanding.com>
Message-ID: <20130708174739.GD3206@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Spenser, All,

On 2013-07-07 18:31 -0500, Spenser Gilliland spake thusly:
> installs cape dtbos from the kernel firmware into the target system.

I know it was me suggesting this new package, but in the end, wouldn't
this be better handled with a post-build script?

A post-build script would also have all lattitude to decide what exact
.dtbo files to copy over, not just everything.

Not saying we should drop this package, but there really are a few
options here, and I don't really know what's better.

> Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
> ---
>  package/Config.in                    |  1 +
>  package/beagle-capes/Config.in       | 12 ++++++++++++
>  package/beagle-capes/beagle-capes.mk | 15 +++++++++++++++
>  3 files changed, 28 insertions(+)
>  create mode 100644 package/beagle-capes/Config.in
>  create mode 100644 package/beagle-capes/beagle-capes.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 4df48ba..3b06f98 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -226,6 +226,7 @@ source "package/rpi-firmware/Config.in"
>  source "package/sunxi-boards/Config.in"
>  source "package/ux500-firmware/Config.in"
>  source "package/zd1211-firmware/Config.in"
> +source "package/beagle-capes/Config.in"

Alphabetical order, please.

>  endmenu
>  source "package/freescale-imx/Config.in"
>  source "package/acpid/Config.in"
> diff --git a/package/beagle-capes/Config.in b/package/beagle-capes/Config.in
> new file mode 100644
> index 0000000..568e84f
> --- /dev/null
> +++ b/package/beagle-capes/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_BEAGLE_CAPES
> +	bool "beagle-capes"
> +	depends on BR2_LINUX_KERNEL && BR2_arm
> +	select BR2_LINUX_KERNEL_INSTALL_FIRMWARE
> +	help
> +	  Installs beaglebone capes firmware from the kernel source.

The comment is mis-leading: the firmware files are not copied from the
kernel source tree, but from staging. I would not state where they are
copied from, so I'd say something along those lines:

    Install BeagleBone capes firmwares.

    These firmwares are bundled in the TI fork on the Linux kernel for
    the BegaleBone, so you'll need to configure Buildroot to use such a
    kernel.

> +	  This package requires that a kernel with beaglebone capes firmware is
> +	  selected.
> +
> +comment "requires the linux kernel"

comment "beagle-capes requires a Linux kernel"

> +	depends on !(BR2_LINUX_KERNEL)
> diff --git a/package/beagle-capes/beagle-capes.mk b/package/beagle-capes/beagle-capes.mk
> new file mode 100644
> index 0000000..5b6f121
> --- /dev/null
> +++ b/package/beagle-capes/beagle-capes.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# beagle-capes 
> +#
> +################################################################################
> +
> +BEAGLE_CAPES_SOURCE =
> +
> +BEAGLE_CAPES_DEPENDENCIES = linux
> +
> +define BEAGLE_CAPES_INSTALL_TARGET_CMDS
> +	$(INSTALL) -m 644 $(STAGING_DIR)/lib/firmware/*.dtbo $(TARGET_DIR)/lib/firmware/
> +endef
> +
> +$(eval $(generic-package))

Otherwise, LGTM.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
