From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 Oct 2019 21:02:48 +0200
Subject: [Buildroot] [PATCH v3,
 1/1] package/suricata: security bump to version 4.1.5
In-Reply-To: <20191002165604.27857-1-fontaine.fabrice@gmail.com>
References: <20191002165604.27857-1-fontaine.fabrice@gmail.com>
Message-ID: <20191002210248.25213cb3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  2 Oct 2019 18:56:04 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop second patch (already in version)
> - Add libmaxminddb dependency and use --disable-libgeoip to prefer
>   maxminddb over geoip, see:

I still don't see where you prefer maxminddb over geoip.

>  ifeq ($(BR2_PACKAGE_GEOIP),y)
>  SURICATA_DEPENDENCIES += geoip
> -SURICATA_CONF_OPTS += --enable-geoip
> +SURICATA_CONF_OPTS += \
> +	--enable-geoip \
> +	--enable-libgeoip
> +# --disable-libgeoip disables libgeoip when --enable-geoip is requested.
> +# This allows libmaxminddb to be picked up instead of libgeoip when both are
> +# installed on the system.
> +else ifeq ($(BR2_PACKAGE_LIBMAXMINDDB),y)
> +SURICATA_DEPENDENCIES += libmaxminddb
> +SURICATA_CONF_OPTS += \
> +	--disable-libgeoip \
> +	--enable-geoip

If you have both BR2_PACKAGE_GEOIP=y and BR2_PACKAGE_LIBMAXMINDDB=y,
then the first part of this condition will be used, and geoip will be
used, not libmaxminddb.

Am I missing something ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
