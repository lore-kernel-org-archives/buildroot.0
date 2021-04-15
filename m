From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 15 Apr 2021 21:17:03 +0200
Subject: [Buildroot] [PATCH v1 1/3] package/postgis: disable protobuf
 support
In-Reply-To: <20210414201042.3685-1-ps.report@gmx.net>
References: <20210414201042.3685-1-ps.report@gmx.net>
Message-ID: <cf7d3e11-c1ee-4ff1-2a15-52b4216ebd97@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14/04/2021 22:10, Peter Seiderer wrote:
> - needs protobuf-c (not protobuf)
> - protobuf-c configure tests are not cross-compile capable, even with

 It's a pity to disable it rather than fix it, but I guess it should be fixed by
someone who cares.

 Series applied to master, thanks.

 Regards,
 Arnout

> 
>   ifeq ($(BR2_PACKAGE_PROTOBUF_C),y)
>   POSTGIS_DEPENDENCIES += protobuf-c
>   POSTGIS_CONF_OPTS += --with-protobuf
>   POSTGIS_CONF_ENV += \
>   	ac_cv_lib_protobuf_c_protobuf_c_message_init=yes \
>   	ac_cv_lib_protobuf_c_protobuf_c_version=yes
>   else
>   POSTGIS_CONF_OPTS += --without-protobuf
>   endif
> 
>   configure aborts with:
> 
>   checking for PROTOBUFC... yes
>   checking protobuf-c/protobuf-c.h usability... yes
>   checking protobuf-c/protobuf-c.h presence... yes
>   checking for protobuf-c/protobuf-c.h... yes
>   checking for protobuf_c_message_init in -lprotobuf-c... (cached) yes
>   checking for protobuf_c_version in -lprotobuf-c... (cached) yes
>   checking protobuf-c version... configure: error: in `.../build/postgis-3.1.1':
>   configure: error: cannot run test program while cross compiling
> 
> Fixes:
> 
>   - http://autobuild.buildroot.net/results/8b95086b5e0876d0a4e41330446e767e4abd3729
> 
>   checking for PROTOBUFC... no
>   libprotobuf-c not found in pkg-config
>   checking protobuf-c/protobuf-c.h usability... no
>   checking protobuf-c/protobuf-c.h presence... no
>   checking for protobuf-c/protobuf-c.h... no
>   configure: error: unable to find protobuf-c/protobuf-c.h using CPPFLAGS. You can disable MVT and Geobuf support using --without-protobuf
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/postgis/postgis.mk | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/package/postgis/postgis.mk b/package/postgis/postgis.mk
> index 1661f48ff2..92a9968993 100644
> --- a/package/postgis/postgis.mk
> +++ b/package/postgis/postgis.mk
> @@ -18,7 +18,8 @@ POSTGIS_DEPENDENCIES = postgresql libgeos proj libxml2
>  POSTGIS_CONF_OPTS += \
>  	--with-pgconfig=$(STAGING_DIR)/usr/bin/pg_config \
>  	--with-geosconfig=$(STAGING_DIR)/usr/bin/geos-config \
> -	--with-xml2config=$(STAGING_DIR)/usr/bin/xml2-config
> +	--with-xml2config=$(STAGING_DIR)/usr/bin/xml2-config \
> +	--without-protobuf
>  
>  ifeq ($(BR2_PACKAGE_LIBGDAL),y)
>  POSTGIS_DEPENDENCIES += libgdal
> @@ -27,11 +28,4 @@ else
>  POSTGIS_CONF_OPTS += --without-raster
>  endif
>  
> -ifeq ($(BR2_PACKAGE_PROTOBUF),y)
> -POSTGIS_DEPENDENCIES += protobuf
> -POSTGIS_CONF_OPTS += --with-protobuf
> -else
> -POSTGIS_CONF_OPTS += --without-protobuf
> -endif
> -
>  $(eval $(autotools-package))
> 
