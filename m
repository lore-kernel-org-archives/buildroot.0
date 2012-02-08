From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Date: Wed, 8 Feb 2012 10:10:43 +0100
Subject: [Buildroot] [PATCH] New package: gpio9260
In-Reply-To: <1328559215-12206-1-git-send-email-jwoltz@gmail.com>
References: <1328559215-12206-1-git-send-email-jwoltz@gmail.com>
Message-ID: <20120208091043.GB19413@game.jcrosoft.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15:13 Mon 06 Feb     , J.C. Woltz wrote:
> From: "J.C. Woltz" <jwoltz@gmail.com>
> 
> gpio9260 is an utility used to read and set gpio states on
> the at91sam9260 and at91sam9g20 CPUs
why dont u use the kernel instead via sysfs

If this need kernel modification I don't think it will go mainline

Best Regards,
J.
> 
> Signed-off-by: J.C. Woltz <jwoltz@gmail.com>
> ---
>  package/Config.in            |    1 +
>  package/gpio9260/Config.in   |    5 +++++
>  package/gpio9260/gpio9260.mk |   23 +++++++++++++++++++++++
>  3 files changed, 29 insertions(+), 0 deletions(-)
>  create mode 100644 package/gpio9260/Config.in
>  create mode 100644 package/gpio9260/gpio9260.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 66ee266..c083bfc 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -177,6 +177,7 @@ source "package/gadgetfs-test/Config.in"
>  source "package/gdisk/Config.in"
>  source "package/genext2fs/Config.in"
>  source "package/genromfs/Config.in"
> +source "package/gpio9260/Config.in"
>  source "package/gpsd/Config.in"
>  source "package/gvfs/Config.in"
>  if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> diff --git a/package/gpio9260/Config.in b/package/gpio9260/Config.in
> new file mode 100644
> index 0000000..088b11e
> --- /dev/null
> +++ b/package/gpio9260/Config.in
> @@ -0,0 +1,5 @@
> +config BR2_PACKAGE_GPIO9260
> +	bool "gpio9260"
> +	help
> +		gpio9260 is a program to interact with at91sam9260
> +		and at91sam9g20 GPIOs. 
> diff --git a/package/gpio9260/gpio9260.mk b/package/gpio9260/gpio9260.mk
> new file mode 100644
> index 0000000..b9adb41
> --- /dev/null
> +++ b/package/gpio9260/gpio9260.mk
> @@ -0,0 +1,23 @@
> +#############################################################
> +#
> +# gpio9260
> +#
> +#############################################################
> +GPIO9260_VERSION = 1.0
> +GPIO9260_SOURCE = gpio9260-$(GPIO9260_VERSION).tar.gz
> +GPIO9260_SITE = https://www.jcwoltz.com/e10
> +GPIO9260_INSTALL_STAGING = YES
> +
> +define GPIO9260_BUILD_CMDS
> +	$(MAKE) CC=$(TARGET_CC) LD=$(TARGET_LD) -C $(@D) all
> +endef
> +
> +define GPIO9260_INSTALL_STAGING_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/gpio9260 $(STAGING_DIR)/usr/bin
> +endef
> +
> +define GPIO9260_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/gpio9260 $(TARGET_DIR)/usr/bin
> +endef
> +
> +$(eval $(call GENTARGETS,package,gpio9260))
> -- 
> 1.7.5.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
