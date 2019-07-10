From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 10 Jul 2019 21:55:10 +0200
Subject: [Buildroot] [PATCH v2 1/6] package/gstreamer1/gstreamer1:
 convert package type to meson
In-Reply-To: <20190710153634.25235-2-aduskett@gmail.com>
References: <20190710153634.25235-1-aduskett@gmail.com>
 <20190710153634.25235-2-aduskett@gmail.com>
Message-ID: <20190710215510.7c7de09d@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adam,

On Wed, 10 Jul 2019 11:36:29 -0400, aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
>
> Gstreamer 1.16.0 is the last version to support autotools, and will be removed
> in the next version.

Still some text more for an cover-letter...

Otherwise looks good...

Regards,
Peter

>
> Other changes:
>   - The meson build provides no 'disable-valgrind' option but checks
>     for the availability of valgrind/valgrind.h, so add an optional
>     valgrind dependency instead.
>
>   - Add the following new meson-specific options:
>   - -Dgtk_doc=disabled
>   - -Dglib-asserts=disabled
>   - -Dglib-checks=disabled
>   - -Dgobject-cast-checks=disabled
>
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
> Changes v1 -> v2:
>   - Change valgrind check from an ifeq to the short form like libunwind. (Peter)
>   - Update commit message to be more clear about valgrind. (Peter)
>   - Fix s/DDgtk_doc/Dgtk_doc/ in the commit message. (Peter)
>   - Add -Dgobject-cast-checks=disabled to the commit message. (Peter)
>
>  package/gstreamer1/gstreamer1/gstreamer1.mk | 31 +++++++++++----------
>  1 file changed, 17 insertions(+), 14 deletions(-)
>
> diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
> index 3378232c10..cea933be84 100644
> --- a/package/gstreamer1/gstreamer1/gstreamer1.mk
> +++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
> @@ -12,24 +12,27 @@ GSTREAMER1_LICENSE_FILES = COPYING
>  GSTREAMER1_LICENSE = LGPL-2.0+, LGPL-2.1+
>
>  GSTREAMER1_CONF_OPTS = \
> -	--disable-examples \
> -	--disable-tests \
> -	--disable-failing-tests \
> -	--disable-valgrind \
> -	--disable-benchmarks \
> -	--disable-introspection \
> -	$(if $(BR2_PACKAGE_GSTREAMER1_CHECK),,--disable-check) \
> -	$(if $(BR2_PACKAGE_GSTREAMER1_TRACE),,--disable-trace) \
> -	$(if $(BR2_PACKAGE_GSTREAMER1_PARSE),,--disable-parse) \
> -	$(if $(BR2_PACKAGE_GSTREAMER1_GST_DEBUG),,--disable-gst-debug) \
> -	$(if $(BR2_PACKAGE_GSTREAMER1_PLUGIN_REGISTRY),,--disable-registry) \
> -	$(if $(BR2_PACKAGE_GSTREAMER1_INSTALL_TOOLS),,--disable-tools)
> +	-Dexamples=disabled \
> +	-Dtests=disabled \
> +	-Dbenchmarks=disabled \
> +	-Dgtk_doc=disabled \
> +	-Dintrospection=disabled \
> +	-Dglib-asserts=disabled \
> +	-Dglib-checks=disabled \
> +	-Dgobject-cast-checks=disabled \
> +	-Dcheck=$(if $(BR2_PACKAGE_GSTREAMER1_CHECK),enabled,disabled) \
> +	-Dtracer_hooks=$(if $(BR2_PACKAGE_GSTREAMER1_TRACE),true,false) \
> +	-Doption-parsing=$(if $(BR2_PACKAGE_GSTREAMER1_PARSE),true,false) \
> +	-Dgst_debug=$(if $(BR2_PACKAGE_GSTREAMER1_GST_DEBUG),true,false) \
> +	-Dregistry=$(if $(BR2_PACKAGE_GSTREAMER1_PLUGIN_REGISTRY),true,false) \
> +	-Dtools=$(if $(BR2_PACKAGE_GSTREAMER1_INSTALL_TOOLS),enabled,disabled)
>
>  GSTREAMER1_DEPENDENCIES = \
>  	host-bison \
>  	host-flex \
>  	host-pkgconf \
>  	libglib2 \
> -	$(if $(BR2_PACKAGE_LIBUNWIND),libunwind)
> +	$(if $(BR2_PACKAGE_LIBUNWIND),libunwind) \
> +	$(if $(BR2_PACKAGE_VALGRIND),valgrind)
>
> -$(eval $(autotools-package))
> +$(eval $(meson-package))
