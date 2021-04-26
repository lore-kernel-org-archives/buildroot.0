From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 26 Apr 2021 22:05:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/sconeserver: disable image
In-Reply-To: <20210321114712.1072879-1-fontaine.fabrice@gmail.com>
References: <20210321114712.1072879-1-fontaine.fabrice@gmail.com>
Message-ID: <5c432d3e-e72a-0835-a090-7991a03eb357@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21/03/2021 12:47, Fabrice Fontaine wrote:
> Build of http::sconesite::image module was silently broken until commit
> d3b818c3cf0990117a8b59fcfc6c212f310ae6ec
> 
> However, sconeserver fails to build with ImageMagick because:
> - it checks for ImageMagick++.pc instead of ImageMagick.pc
> - it uses the transform function which has been removed from the public
>   API since version 7.0.1-0 and
>   https://github.com/ImageMagick/ImageMagick/commit/06f590165f0505d42005264893fe14a9e8a79986
> 
> As sconeserver does not seem to be maintained anymore, drop
> BR2_PACKAGE_SCONESERVER_HTTP_SCONESITE_IMAGE and don't had a
> Config.in.legacy entry because the option was silently broken since a
> long time

 I did add a legacy entry after all. It costs us exactly nothing, and if someone
actually had that selected, they know what's going on. I'm a bit sensitive about
legacy handling :-)

 Regards,
 Arnout

> 
> Fixes:
>  - http://autobuild.buildroot.org/results/895ab582d1140f7677fc1c6934fa2e0c47c49f20
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/sconeserver/Config.in      |  8 --------
>  package/sconeserver/sconeserver.mk | 15 +++++++--------
>  2 files changed, 7 insertions(+), 16 deletions(-)
> 
> diff --git a/package/sconeserver/Config.in b/package/sconeserver/Config.in
> index 429ac81fe1..d46ba85fbc 100644
> --- a/package/sconeserver/Config.in
> +++ b/package/sconeserver/Config.in
> @@ -26,14 +26,6 @@ config BR2_PACKAGE_SCONESERVER_HTTP_SCONESITE
>  	help
>  	  http::sconesite module for Sconeserver
>  
> -config BR2_PACKAGE_SCONESERVER_HTTP_SCONESITE_IMAGE
> -	bool "http::sconesite::image"
> -	depends on BR2_PACKAGE_SCONESERVER_HTTP_SCONESITE
> -	depends on BR2_USE_MMU # imagemagick
> -	select BR2_PACKAGE_IMAGEMAGICK
> -	help
> -	  http::sconesite::image module for Sconeserver
> -
>  config BR2_PACKAGE_SCONESERVER_MYSQL
>  	bool "mysql"
>  	depends on BR2_USE_MMU # mysql
> diff --git a/package/sconeserver/sconeserver.mk b/package/sconeserver/sconeserver.mk
> index 62cc128d77..17407c29f5 100644
> --- a/package/sconeserver/sconeserver.mk
> +++ b/package/sconeserver/sconeserver.mk
> @@ -14,10 +14,16 @@ SCONESERVER_DEPENDENCIES = \
>  	host-pkgconf \
>  	$(if $(BR2_PACKAGE_PCRE),pcre) \
>  	zlib
> +# disable image as it fails to build with ImageMagick
>  # disable markdown module because its git submodule cmark
>  # https://github.com/sconemad/sconeserver/tree/master/markdown
>  # has no cross-compile support provided by the sconeserver build system
> -SCONESERVER_CONF_OPTS += --with-ip --with-local --with-ip6 --without-markdown
> +SCONESERVER_CONF_OPTS += \
> +	--with-ip \
> +	--with-local \
> +	--with-ip6 \
> +	--without-image \
> +	--without-markdown
>  
>  # Sconeserver configure script fails to find the libxml2 headers.
>  ifeq ($(BR2_PACKAGE_LIBXML2),y)
> @@ -45,13 +51,6 @@ else
>  SCONESERVER_CONF_OPTS += --without-sconesite
>  endif
>  
> -ifeq ($(BR2_PACKAGE_SCONESERVER_HTTP_SCONESITE_IMAGE),y)
> -SCONESERVER_DEPENDENCIES += imagemagick
> -SCONESERVER_CONF_OPTS += --with-image
> -else
> -SCONESERVER_CONF_OPTS += --without-image
> -endif
> -
>  ifeq ($(BR2_PACKAGE_SCONESERVER_MYSQL),y)
>  SCONESERVER_DEPENDENCIES += mysql
>  SCONESERVER_CONF_OPTS += \
> 
