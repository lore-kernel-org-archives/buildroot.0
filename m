From: Maxim Kochetkov <fido_max@inbox.ru>
Date: Mon, 8 Feb 2021 07:33:04 +0300
Subject: [Buildroot] [PATCH v1] package/postgis: fix configure in case
 of host installed libxml2
In-Reply-To: <20210207105028.24251-1-ps.report@gmx.net>
References: <20210207105028.24251-1-ps.report@gmx.net>
Message-ID: <640d9186-6658-457b-f390-54be158628d6@inbox.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>

07.02.2021 13:50, Peter Seiderer ?????:
> Explicit set cross-compile xml2-config path to fix configure failure
> in case of host installed libxml2 package, otherwise postgis configure
> finds the wrong/host xml2-config first.
> 
> Fixes:
> 
>    checking for xml2-config... /usr/bin/xml2-config
>    checking libxml/tree.h usability... no
>    checking libxml/tree.h presence... no
>    checking for libxml/tree.h... no
>    configure: error: could not find headers include related to libxml2
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Notes:
>    - depends on
>      http://patchwork.ozlabs.org/project/buildroot/patch/20210126133908.680621-1-fido_max at inbox.ru/
> ---
>   package/postgis/postgis.mk | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/package/postgis/postgis.mk b/package/postgis/postgis.mk
> index 85102d323a..b2e51b15eb 100644
> --- a/package/postgis/postgis.mk
> +++ b/package/postgis/postgis.mk
> @@ -14,7 +14,10 @@ POSTGIS_AUTORECONF = YES
>   
>   POSTGIS_DEPENDENCIES = postgresql libgeos proj libxml2
>   
> -POSTGIS_CONF_OPTS += --with-pgconfig=$(STAGING_DIR)/usr/bin/pg_config --with-geosconfig=$(STAGING_DIR)/usr/bin/geos-config
> +POSTGIS_CONF_OPTS += \
> +	--with-pgconfig=$(STAGING_DIR)/usr/bin/pg_config \
> +	--with-geosconfig=$(STAGING_DIR)/usr/bin/geos-config \
> +	--with-xml2config=$(STAGING_DIR)/usr/bin/xml2-config
>   
>   ifeq ($(BR2_PACKAGE_LIBGDAL),y)
>   POSTGIS_DEPENDENCIES += libgdal
> 
