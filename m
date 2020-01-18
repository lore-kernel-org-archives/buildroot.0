From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Jan 2020 23:14:42 +0100
Subject: [Buildroot] [PATCH v8 15/20] package/kodi-screensaver-rsxs:
 bump version
In-Reply-To: <20200118200620.3967240-16-bernd.kuhls@t-online.de>
References: <20200118200620.3967240-1-bernd.kuhls@t-online.de>
 <20200118200620.3967240-16-bernd.kuhls@t-online.de>
Message-ID: <20200118221442.GJ32369@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2020-01-18 21:06 +0100, Bernd Kuhls spake thusly:
> Updated dependencies after upstream commit
> https://github.com/xbmc/screensavers.rsxs/commit/dbb88536964dc0ca4144016eb12f7307b60cb1fa
> Also removed patch 0002 because this package has no direct dependency
> for X libraries anymore.
> 
> Removed patch 0001 which was applied upstream
> https://github.com/xbmc/screensavers.rsxs/commit/b9dda499db62944d9a95f4690d67101eca539ca7
> 
> Added patch to disable building the drempels screensaver which depends
> on imagemagick6.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
[--SNIP--]
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index a86ccd0..b5ca03f 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -40,8 +40,7 @@ include_directories(${KODI_INCLUDE_DIR}/.. # Hack way with "/..", need bigger Ko
> + if(ImageMagick_FOUND AND NOT ${OWN_IMAGE_MAGICK})
> +   message(STATUS "ImageMagick found in the system and is used")

Ideally, upstream should also add a check for the ImageMagick version
that was found.

> + else()
> +-  message(STATUS "ImageMagick not found or forced and add custom created")
> +-  add_subdirectory(lib/ImageMagick)
> ++  message(STATUS "ImageMagick not found")

Why can't we use the bundled minimal ImageMagick?

Note: I am fine with disabling entirely, but I'd prefer this is
explictly stated, like:

    Even though rsxs has a minimal bundled imagemagick, we simply
    disable drempels to avoidusing a bundled library.

[--SNIP--]
> diff --git a/package/kodi-screensaver-rsxs/Config.in b/package/kodi-screensaver-rsxs/Config.in
> index c523ce5a1c..076c7effa0 100644
> --- a/package/kodi-screensaver-rsxs/Config.in
> +++ b/package/kodi-screensaver-rsxs/Config.in
> @@ -1,13 +1,17 @@
>  config BR2_PACKAGE_KODI_SCREENSAVER_RSXS
>  	bool "kodi-screensaver-rsxs"
>  	depends on BR2_PACKAGE_HAS_LIBGL # libglu
> -	depends on BR2_PACKAGE_XORG7 # xlib_libXmu
> +	select BR2_PACKAGE_BZIP2
> +	select BR2_PACKAGE_GLI
> +	select BR2_PACKAGE_GLM
> +	select BR2_PACKAGE_JPEG
>  	select BR2_PACKAGE_LIBPNG
> -	select BR2_PACKAGE_XLIB_LIBXMU
> +	select BR2_PACKAGE_LIBTOOL
> +	select BR2_PACKAGE_TIFF

You're adding a few dependencies, some of whihch are not ovious, like
libtool.

Additionally, you're not propagating the dependency of glm (needs
libstdc++). That's OK because Kodi does need C++, and thus rsxs already
implicitly has that dependency, but I don;t like it much, though...

Your commit logs are more about 'what' is done, which is OK to recap a
big patch, but the really interesting part in a commit log is the 'why'.

Again, if all it takes are a few sentences or bullet points to be added
to the commit log, no need to respin: I can add them locally before
applying.

Regards,
Yann E. MORIN.

>  	help
>  	  RSXS screensaver add-ons for Kodi
>  
> -	  https://github.com/notspiff/screensavers.rsxs
> +	  https://github.com/xbmc/screensavers.rsxs
>  
> -comment "kodi-screensaver-rsxs depends on X.org and needs OpenGL"
> -	depends on !BR2_PACKAGE_XORG7 || !BR2_PACKAGE_HAS_LIBGL
> +comment "kodi-screensaver-rsxs needs an OpenGL backend"
> +	depends on !BR2_PACKAGE_HAS_LIBGL
> diff --git a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash
> index e80c972ebb..b2d9e33a57 100644
> --- a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash
> +++ b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash
> @@ -1,2 +1,2 @@
>  # Locally computed
> -sha256 8436c29d2f42bc65ff6f1abc2f1d05a613cc2ebb16d793e02b1f2bee296952a6  kodi-screensaver-rsxs-1.3.0.tar.gz
> +sha256 22ff3f0ca9679c59ce1a90b98d918dd10a8012b789729b2e44c04d4ce8c86ad8  kodi-screensaver-rsxs-7cb648507440d87948dec10d5bfdab3b722d37fe.tar.gz
> diff --git a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
> index 64ffb4fba6..e208698797 100644
> --- a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
> +++ b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
> @@ -4,10 +4,9 @@
>  #
>  ################################################################################
>  
> -KODI_SCREENSAVER_RSXS_VERSION = 1.3.0
> -KODI_SCREENSAVER_RSXS_SITE = $(call github,notspiff,screensavers.rsxs,v$(KODI_SCREENSAVER_RSXS_VERSION))
> +KODI_SCREENSAVER_RSXS_VERSION = 7cb648507440d87948dec10d5bfdab3b722d37fe
> +KODI_SCREENSAVER_RSXS_SITE = $(call github,xbmc,screensavers.rsxs,$(KODI_SCREENSAVER_RSXS_VERSION))
>  KODI_SCREENSAVER_RSXS_LICENSE = GPL-3.0
> -KODI_SCREENSAVER_RSXS_LICENSE_FILES = lib/rsxs-1.0/COPYING
> -KODI_SCREENSAVER_RSXS_DEPENDENCIES = kodi libpng xlib_libXmu
> +KODI_SCREENSAVER_RSXS_DEPENDENCIES = bzip2 gli glm jpeg kodi libpng libtool tiff
>  
>  $(eval $(cmake-package))
> -- 
> 2.20.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
