From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 31 Dec 2018 13:57:55 +0100
Subject: [Buildroot] [PATCH 1/1] glib-networking: bump version to 2.56.1
In-Reply-To: <20181226232942.99929-1-aduskett@gmail.com>
References: <20181226232942.99929-1-aduskett@gmail.com>
Message-ID: <20181231135755.5bd0e1fb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 26 Dec 2018 18:29:42 -0500, aduskett at gmail.com wrote:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> Other changes:
>   - glib-networking is now a meson package and has no support for auto-tools.
>   - Update configure options to reflect the above change to meson.
>   - gnutls is now a dependency of glib-networking.
>   - Add License file hash.

I've applied, but there was one thing that was not correct. See below.

> Fixes:
>  - http://autobuild.buildroot.org/results/848282be656809e26a704ff92842e6bde6875a3e

Minor detail: it was no longer fixing any build issue, so I've dropped
this.

> diff --git a/package/glib-networking/Config.in b/package/glib-networking/Config.in
> index ec2962392c..510eb42c13 100644
> --- a/package/glib-networking/Config.in
> +++ b/package/glib-networking/Config.in
> @@ -3,10 +3,11 @@ config BR2_PACKAGE_GLIB_NETWORKING
>  	depends on BR2_USE_WCHAR # glib2
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
>  	depends on BR2_USE_MMU # glib2
> +	depends on !BR2_STATIC_LIBS # gnutls

You forgot to add the select on BR2_PACKAGE_GNUTLS. This means that you
didn't test a minimal build of glib-networking, because if you had done
that, Buildroot would have complained that gnutls gets built without
being selected in the configuration.

I've fixed this issue when applying.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
