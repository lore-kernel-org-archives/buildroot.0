From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 17 Nov 2019 14:47:58 +0100
Subject: [Buildroot] [PATCH 1/1] package/linuxconsoletools: bump version
 to 1.7.0
In-Reply-To: <20191117133838.GC13372@coltrane>
References: <20191117133838.GC13372@coltrane>
Message-ID: <04824fef-f032-4e2c-81cf-7305de87a8af@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17/11/2019 14:38, Koen Martens wrote:
> This version changed the (optional) dependency from sdl and
> sdl-config to sdl2 and pkg-config. Therefore, the patch that
> provided the correct path to sdl-config has been dropped and
> the dependency has been changed to BR2_PACKAGE_SDL2.

 Excellent explanation.

> 
> Somehow, SDL2 fails to build without shared library support,
> but this is not explicitly depended on by SDL2, therefore
> a dependency to BR2_SHARED_LIBS was added to the force-
> feedback utility configuration option.
> 
> Signed-off-by: Koen Martens <gmc@sonologic.nl>
> ---
[snip]
> diff --git a/package/linuxconsoletools/Config.in b/package/linuxconsoletools/Config.in
> index 76150278ae..8245dda500 100644
> --- a/package/linuxconsoletools/Config.in
> +++ b/package/linuxconsoletools/Config.in
> @@ -28,7 +28,8 @@ config BR2_PACKAGE_LINUXCONSOLETOOLS_JOYSTICK
>  
>  config BR2_PACKAGE_LINUXCONSOLETOOLS_FORCEFEEDBACK
>  	bool "force-feedback utilities"
> -	select BR2_PACKAGE_SDL
> +	depends on BR2_SHARED_LIBS

 As mentioned in my other mail, this should be !STATIC and a comment should be
added.

 With that fixed, you can add my:
 Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> +	select BR2_PACKAGE_SDL2
>  	help
>  	  Build force-feedback driver utilities (fftest,
>  	  ffmvforce, ffset, ffcfstress).
> diff --git a/package/linuxconsoletools/linuxconsoletools.hash b/package/linuxconsoletools/linuxconsoletools.hash
> index d1bb5a39ef..caacf70e45 100644
> --- a/package/linuxconsoletools/linuxconsoletools.hash
> +++ b/package/linuxconsoletools/linuxconsoletools.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256	e9d6b05a6c57c7eb3ec7f9f017f46b20e4b55d5a02f930eff1823a13921c5934	linuxconsoletools-1.6.1.tar.bz2
> +sha256	95d112f06393806116341d593bda002c8bc44119c1538407623268fed90d8c34	linuxconsoletools-1.7.0.tar.bz2
>  sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYING
> diff --git a/package/linuxconsoletools/linuxconsoletools.mk b/package/linuxconsoletools/linuxconsoletools.mk
> index b22e136d33..ac8c7805ce 100644
> --- a/package/linuxconsoletools/linuxconsoletools.mk
> +++ b/package/linuxconsoletools/linuxconsoletools.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LINUXCONSOLETOOLS_VERSION = 1.6.1
> +LINUXCONSOLETOOLS_VERSION = 1.7.0
>  LINUXCONSOLETOOLS_SOURCE = linuxconsoletools-$(LINUXCONSOLETOOLS_VERSION).tar.bz2
>  LINUXCONSOLETOOLS_SITE = https://downloads.sourceforge.net/project/linuxconsole
>  LINUXCONSOLETOOLS_LICENSE = GPL-2.0+
> @@ -21,8 +21,8 @@ endif
>  ifeq ($(BR2_PACKAGE_LINUXCONSOLETOOLS_FORCEFEEDBACK),y)
>  LINUXCONSOLETOOLS_MAKE_OPTS += \
>  	ENABLE_FORCEFEEDBACK=1 \
> -	SDL_CONFIG=$(STAGING_DIR)/usr/bin/sdl-config
> -LINUXCONSOLETOOLS_DEPENDENCIES += sdl
> +	CFLAGS="--std=gnu99"
> +LINUXCONSOLETOOLS_DEPENDENCIES += sdl2 host-pkgconf>  endif
>  
>  define LINUXCONSOLETOOLS_BUILD_CMDS
> 
