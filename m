From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 14 Jun 2021 22:08:08 +0200
Subject: [Buildroot] [PATCH] package/cegui: bump to current master
In-Reply-To: <20210612085740.300581-1-b.bilas@grinn-global.com>
References: <20210612085740.300581-1-b.bilas@grinn-global.com>
Message-ID: <20210614200808.GF2610983@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bartosz, All,

On 2021-06-12 10:57 +0200, Bartosz Bilas spake thusly:
> v0-8-7 is pretty old (2016) and raises a lot of build failures
> so switch to the current master version while at it disable
> support for irrlicht and fribidi that are broken on master.
> Moreover disable samples and application templates that
> are not required.
> 
> Fixes:
> - http://autobuild.buildroot.net/results/5b9/5b9ff0e8f16a2fd732ae25d5383656f7ae205748/
> - http://autobuild.buildroot.net/results/333/33397224f8a8067d8ecbd6661b84ca155a0525c0/
> 
> and more...
> 
> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
> ---
[--SNIP--]
> diff --git a/package/cegui/cegui.mk b/package/cegui/cegui.mk
> index 23a5859bc8..51ec743eeb 100644
> --- a/package/cegui/cegui.mk
> +++ b/package/cegui/cegui.mk
> @@ -4,15 +4,19 @@
>  #
>  ################################################################################
>  
> -CEGUI_VERSION = 0-8-7
> -CEGUI_SITE = $(call github,cegui,cegui,v$(CEGUI_VERSION))
> +CEGUI_VERSION = 00b4e1fe174da53b7ed726ab5970ba51bd5b5ee0
> +CEGUI_SITE = $(call github,cegui,cegui,$(CEGUI_VERSION))
>  CEGUI_LICENSE = MIT
>  CEGUI_LICENSE_FILES = COPYING
>  CEGUI_INSTALL_STAGING = YES
>  CEGUI_CONF_OPTS = \
> -	-DCEGUI_BUILD_XMLPARSER_XERCES=OFF \
>  	-DCEGUI_HAS_MINIZIP_RESOURCE_PROVIDER=OFF \
> -	-DCEGUI_BUILD_RENDERER_OGRE=OFF
> +	-DCEGUI_BUILD_RENDERER_IRRLICHT=OFF \
> +	-DCEGUI_BUILD_RENDERER_OGRE=OFF \
> +	-DCEGUI_BUILD_XMLPARSER_XERCES=OFF \
> +	-DCEGUI_USE_FRIBIDI=OFF	\

    $ make check-package
    package/cegui/cegui.mk:17: use only one space before backslash

(hard to see, but that's a TAB)

Applied to master with the above fixed, thanks.

Regards,
Yann E. MORIN.

> +	-DCEGUI_SAMPLES_ENABLED=OFF \
> +	-DCEGUI_BUILD_APPLICATION_TEMPLATES=OFF
>  CEGUI_DEPENDENCIES = glm \
>  	$(if $(BR2_PACKAGE_LIBGLFW),libglfw) \
>  	$(if $(BR2_PACKAGE_HAS_LIBGL),libgl) \
> @@ -44,13 +48,6 @@ else
>  CEGUI_CONF_OPTS += -DCEGUI_BUILD_XMLPARSER_EXPAT=OFF
>  endif
>  
> -ifeq ($(BR2_PACKAGE_IRRLICHT),y)
> -CEGUI_DEPENDENCIES += irrlicht
> -CEGUI_CONF_OPTS += -DCEGUI_BUILD_RENDERER_IRRLICHT=ON
> -else
> -CEGUI_CONF_OPTS += -DCEGUI_BUILD_RENDERER_IRRLICHT=OFF
> -endif
> -
>  ifeq ($(BR2_PACKAGE_SDL2)$(BR2_PACKAGE_SDL2_IMAGE),yy)
>  CEGUI_DEPENDENCIES += sdl2 sdl2_image
>  CEGUI_CONF_OPTS += -DCEGUI_BUILD_IMAGECODEC_SDL2=ON
> @@ -72,13 +69,6 @@ else
>  CEGUI_CONF_OPTS += -DCEGUI_HAS_FREETYPE=OFF
>  endif
>  
> -ifeq ($(BR2_PACKAGE_LIBFRIBIDI),y)
> -CEGUI_DEPENDENCIES += libfribidi
> -CEGUI_CONF_OPTS += -DCEGUI_USE_FRIBIDI=ON
> -else
> -CEGUI_CONF_OPTS += -DCEGUI_USE_FRIBIDI=OFF
> -endif
> -
>  ifeq ($(BR2_PACKAGE_LIBXML2),y)
>  CEGUI_DEPENDENCIES += libxml2
>  CEGUI_CONF_OPTS += -DCEGUI_BUILD_XMLPARSER_LIBXML2=ON
> -- 
> 2.32.0
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
