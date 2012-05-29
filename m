From: Julian Lunz <git@jlunz.de>
Date: Tue, 29 May 2012 20:34:45 +0200
Subject: [Buildroot] [PATCH] New package: freerdp
In-Reply-To: <1337809509-29526-1-git-send-email-git@jlunz.de>
References: <1337809509-29526-1-git-send-email-git@jlunz.de>
Message-ID: <20120529203445.313571a9@jl-desk-LL>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Cared to fix, looking good?

On Wed, 23 May 2012 23:45:09 +0200
Julian Lunz <git@jlunz.de> wrote:

> Signed-off-by: Julian Lunz <git@jlunz.de>
> ---
>  package/Config.in          |    1 +
>  package/freerdp/Config.in  |   38
> ++++++++++++++++++++++++++++++++++++++ package/freerdp/freerdp.mk |
> 41 +++++++++++++++++++++++++++++++++++++++++ 3 files changed, 80
> insertions(+), 0 deletions(-) create mode 100644
> package/freerdp/Config.in create mode 100644
> package/freerdp/freerdp.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index fb1b08f..dc683aa 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -144,6 +144,7 @@ comment "X applications"
>  source "package/alsamixergui/Config.in"
>  source "package/docker/Config.in"
>  source "package/feh/Config.in"
> +source "package/freerdp/Config.in"
>  source "package/gqview/Config.in"
>  source "package/gmpc/Config.in"
>  source "package/gob2/Config.in"
> diff --git a/package/freerdp/Config.in b/package/freerdp/Config.in
> new file mode 100644
> index 0000000..b452141
> --- /dev/null
> +++ b/package/freerdp/Config.in
> @@ -0,0 +1,38 @@
> +menuconfig BR2_PACKAGE_FREERDP
> +	bool "freerdp"
> +	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_XLIB_LIBX11
> +	select BR2_PACKAGE_XLIB_LIBXT
> +	select BR2_PACKAGE_ZLIB
> +	depends on BR2_PACKAGE_XORG7
> +	help
> +	  FreeRDPFreeRDP is a free implementation of the 
> +	  Remote Desktop Protocol (RDP), released under the Apache
> license +
> +	  http://www.freerdp.com/
> +	  
> +
> +if BR2_PACKAGE_FREERDP
> +
> +config BR2_PACKAGE_FREERDP_WITHCUPS
> +	bool "CUPS support"
> +	help
> +	  Compile with CUPS support.
> +	  
> +config BR2_PACKAGE_FREERDP_WITHFFMPEG
> +	bool "FFmpeg support"
> +	help
> +	  Compile with FFmpeg support.
> +	  
> +config BR2_PACKAGE_FREERDP_WITHALSA
> +	bool "Alsa support"
> +	help
> +	  Compile with Alsa support.
> +	  
> +config BR2_PACKAGE_FREERDP_WITHXINERAMA
> +	bool "Xinerama support"
> +	help
> +	  Compile with Xinerama support.
> +
> +endif # BR2_PACKAGE_FREERDP
> +
> diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
> new file mode 100644
> index 0000000..b947628
> --- /dev/null
> +++ b/package/freerdp/freerdp.mk
> @@ -0,0 +1,41 @@
> +#############################################################
> +#
> +# FreeRDP
> +#
> +#############################################################
> +
> +FREERDP_VERSION = 1.0.1
> +FREERDP_SOURCE = freerdp-$(FREERDP_VERSION).tar.gz
> +FREERDP_SITE = https://github.com/downloads/FreeRDP/FreeRDP
> +
> +ifeq ($(BR2_PACKAGE_FREERDP_WITHCUPS),y)
> +FREERDP_CONF_OPT += -DWITH_CUPS=ON
> +FREERDP_DEPENDENCIES += cups
> +else
> +FREERDP_CONF_OPT += -DWITH_CUPS=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_FREERDP_WITHFFMPEG),y)
> +FREERDP_CONF_OPT += -DWITH_FFMPEG=ON
> +FREERDP_DEPENDENCIES += ffmpeg
> +else
> +FREERDP_CONF_OPT += -DWITH_FFMPEG=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_FREERDP_WITHALSA),y)
> +FREERDP_CONF_OPT += -DWITH_ALSA=ON
> +FREERDP_DEPENDENCIES += alsa-utils
> +else
> +FREERDP_CONF_OPT += -DWITH_ALSA=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_FREERDP_WITHXINERAMA),y)
> +FREERDP_CONF_OPT += -DWITH_XINERAMA=ON
> +FREERDP_DEPENDENCIES += xlib_libXinerama
> +else
> +FREERDP_CONF_OPT += -DWITH_XINERAMA=OFF
> +endif
> +
> +FREERDP_DEPENDENCIES += openssl xlib_libX11 xlib_libXt zlib
> +
> +$(eval $(call CMAKETARGETS))
