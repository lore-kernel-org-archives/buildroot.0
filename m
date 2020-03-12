From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Mar 2020 12:03:25 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/cog: add option for platform
 DRM.
In-Reply-To: <20200311103044.11422-1-cturner@igalia.com>
References: <20200310112227.16175-1-cturner@igalia.com>
 <20200311103044.11422-1-cturner@igalia.com>
Message-ID: <20200312120325.6e338f57@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Charlie,

Thanks for your patch. A couple of comments/questions below. Most are
trivial stuff, but one question requires some cog knowledge that I
don't have.

On Wed, 11 Mar 2020 10:30:44 +0000
Charlie Turner <cturner@igalia.com> wrote:

> Signed-off-by: Charlie Turner <cturner@igalia.com>
> ---
>  package/cog/Config.in | 6 ++++++
>  package/cog/cog.mk    | 8 +++++++-
>  2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/package/cog/Config.in b/package/cog/Config.in
> index b25991d4ae..b260fa259c 100644
> --- a/package/cog/Config.in
> +++ b/package/cog/Config.in
> @@ -26,4 +26,10 @@ config BR2_PACKAGE_COG_PROGRAMS_HOME_URI
>  	  string is used, there is no default and the URI to open
>  	  must be always specified in the command line.
>  
> +config BR2_PACKAGE_COG_PLATFORM_DRM
> +       bool "DRM backend"
> +       depends on BR2_PACKAGE_LIBDRM

We typically don't use "depends on" for such dependencies, but a
"select". That will require however that you replicate the "depends on"
dependencies of BR2_PACKAGE_LIBDRM here.

Also, your .mk file adds a dependency on libinput, so you need a
"select BR2_PACKAGE_LIBINPUT" here.

> diff --git a/package/cog/cog.mk b/package/cog/cog.mk
> index d0e5b79c38..4697fdf6ed 100644
> --- a/package/cog/cog.mk
> +++ b/package/cog/cog.mk
> @@ -14,7 +14,13 @@ COG_LICENSE_FILES = COPYING
>  COG_CONF_OPTS = \
>  	-DCOG_BUILD_PROGRAMS=ON \
>  	-DCOG_PLATFORM_FDO=ON \
> -	-DCOG_PLATFORM_DRM=OFF \

So, now that a second "platform" is supported, do we want the "fdo"
platform to be always unconditionally enabled ? What is the "fdo"
platform compared to the "drm" platform ?

>  	-DCOG_HOME_URI='$(call qstrip,$(BR2_PACKAGE_COG_PROGRAMS_HOME_URI))'
>  
> +ifeq ($(BR2_PACKAGE_COG_PLATFORM_DRM),y)
> +	COG_CONF_OPTS += -DCOG_PLATFORM_DRM=ON
> +	COG_DEPENDENCIES += libdrm libinput

Those lines should not be indented with one tab.

> +else
> +	COG_CONF_OPTS += -DCOG_PLATFORM_DRM=OFF

Ditto.

> +endif
> +
>  $(eval $(cmake-package))

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
