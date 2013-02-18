From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Mon, 18 Feb 2013 08:54:04 +0100 (CET)
Subject: [Buildroot] [PATCH 4/6] package/genimage: new host-only package
In-Reply-To: <3c5e2dd6bea82927326b663196ca15c16f120022.1361142190.git.yann.morin.1998@free.fr>
Message-ID: <fb512f72-301c-41de-8b2c-968784696955@zimbra2.corp.accelance.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

do you plan to integrate this more tightly into buildroot ?

i.e : for boards that need a particular partition layout have them provide a decription file for genimage and have genimage called directly from the fakeroot jail when such a file is configured ?

that would be awesome for boards like the raspberry pi...

    Cordialement

    J?r?my Rosen

fight key loggers : write some perl using vim

----- Mail original -----
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/Config.in.host          |    1 +
>  package/genimage/Config.in.host |   12 ++++++++++++
>  package/genimage/genimage.mk    |   12 ++++++++++++
>  3 files changed, 25 insertions(+), 0 deletions(-)
>  create mode 100644 package/genimage/Config.in.host
>  create mode 100644 package/genimage/genimage.mk
> 
> diff --git a/package/Config.in.host b/package/Config.in.host
> index 43f292c..c456d5d 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -3,6 +3,7 @@ menu "Host utilities"
>  source "package/dfu-util/Config.in.host"
>  source "package/dosfstools/Config.in.host"
>  source "package/e2fsprogs/Config.in.host"
> +source "package/genimage/Config.in.host"
>  source "package/lpc3250loader/Config.in.host"
>  source "package/omap-u-boot-utils/Config.in.host"
>  source "package/openocd/Config.in.host"
> diff --git a/package/genimage/Config.in.host
> b/package/genimage/Config.in.host
> new file mode 100644
> index 0000000..cfa267c
> --- /dev/null
> +++ b/package/genimage/Config.in.host
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_HOST_GENIMAGE
> +	bool "host genimage"
> +	help
> +	  genimage is a tool to generate multiple filesystem and flash
> images
> +	  from a given root filesystem tree. genimage is intended to be run
> +	  in a fakeroot environment.
> +
> +	  Configuration is done is a config file parsed by libconfuse.
> Options
> +	  like the path to tools can be given in environment variables, the
> config
> +	  file or commandline switches.
> +
> +	  http://www.pengutronix.de/software/genimage/
> diff --git a/package/genimage/genimage.mk
> b/package/genimage/genimage.mk
> new file mode 100644
> index 0000000..8fe9bf7
> --- /dev/null
> +++ b/package/genimage/genimage.mk
> @@ -0,0 +1,12 @@
> +#############################################################
> +#
> +# genimage
> +#
> +##############################################################
> +
> +GENIMAGE_VERSION        = 4
> +GENIMAGE_SOURCE         = genimage-$(GENIMAGE_VERSION).tar.xz
> +GENIMAGE_SITE           =
> http://www.pengutronix.de/software/genimage/download/
> +GENIMAGE_DEPENDENCIES   = libconfuse
> +
> +$(eval $(host-autotools-package))
> --
> 1.7.2.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
