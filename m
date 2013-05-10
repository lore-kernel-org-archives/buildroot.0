From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 11 May 2013 00:31:07 +0200
Subject: [Buildroot] [PATCH 1/3] Add package directory freescale-imx
In-Reply-To: <1368174613-3427-2-git-send-email-h.fijnvandraat@inter.nl.net>
References: <1368174613-3427-1-git-send-email-h.fijnvandraat@inter.nl.net>
 <1368174613-3427-2-git-send-email-h.fijnvandraat@inter.nl.net>
Message-ID: <518D752B.4030901@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/05/13 10:30, Henk Fijnvandraat wrote:
> The freescale-imx directory is intended to contain all freescale i.MXyy
> related packages, together with their download site and version info
>
> Signed-off-by: Henk Fijnvandraat <h.fijnvandraat@inter.nl.net>
> ---
>   package/Config.in                  |    1 +
>   package/freescale-imx/Config.in    |   14 ++++++++++++++
>   package/freescale-imx/freescale.mk |   13 +++++++++++++
>   3 files changed, 28 insertions(+)
>   create mode 100644 package/freescale-imx/Config.in
>   create mode 100644 package/freescale-imx/freescale.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index d980871..368be44 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -212,6 +212,7 @@ source "package/xfsprogs/Config.in"
>   endmenu
>
>   menu "Hardware handling"
> +source "package/freescale-imx/Config.in"
>   menu "Misc devices firmwares"
>   source "package/b43-firmware/Config.in"
>   source "package/firmware-imx/Config.in"
> diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
> new file mode 100644
> index 0000000..4f09ec7
> --- /dev/null
> +++ b/package/freescale-imx/Config.in
> @@ -0,0 +1,14 @@
> +comment "freescale-imx is only relevant for the i.MXxx series from Freescale"
> +	depends on BR2_arm

  This comment is not needed, the fact that it's called freescale-imx is 
pretty self-explanatory.

> +
> +menuconfig BR2_PACKAGE_IMX
> +	bool "freescale-imx"

  Also here it can be a more verbose prompt, like:

	bool "Freescale i.MX specific packages"

> +	depends on BR2_arm
> +	help
> +	  This option enables the selection of some packages specific for
> +	  the i.MXxx series of processors from Freescale.
> +	  freescale-imx needs an imx-specific kernel to be built
> +
> +
> +if BR2_PACKAGE_IMX
> +endif
> diff --git a/package/freescale-imx/freescale.mk b/package/freescale-imx/freescale.mk
> new file mode 100644
> index 0000000..945c51c
> --- /dev/null
> +++ b/package/freescale-imx/freescale.mk
> @@ -0,0 +1,13 @@
> +#############################################################
> +#
> +# freescale-imx
> +#
> +#############################################################
> +
> +IMX_VERSION_LEVEL = 1.1.0
> +
> +# No official download site from freescale, just this mirror
> +IMX_MIRROR_SITE   = http://download.ossystems.com.br/bsp/freescale/source

  We normally give let make variables begin with the uppercase'd package 
(or directory) name - though there are exceptions. But in this case, I 
think it's a good idea to call it

FREESCALE_IMX_VERSION = 1.1.0
FREESCALE_IMX_SITE    = ...

  Regards,
  Arnout

> +
> +include package/freescale-imx/*/*.mk
> +
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
