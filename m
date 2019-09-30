From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Sep 2019 23:39:03 +0200
Subject: [Buildroot] [PATCH v3,
 1/1] package/suricata: security bump to version 4.1.5
In-Reply-To: <20190929083857.21144-1-fontaine.fabrice@gmail.com>
References: <20190929083857.21144-1-fontaine.fabrice@gmail.com>
Message-ID: <20190930233903.34cf1e8e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Sun, 29 Sep 2019 10:38:57 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop second patch (already in version)
> - Add libmaxminddb dependency and use --disable-libgeoip to prefer
>   maxminddb over geoip, see:

That's not what your code does: your code prefers geoip over maxmindb.

>  ifeq ($(BR2_PACKAGE_GEOIP),y)
>  SURICATA_DEPENDENCIES += geoip
> -SURICATA_CONF_OPTS += --enable-geoip
> +SURICATA_CONF_OPTS += \
> +	--enable-geoip \
> +	--enable-libgeoip

Indeed, if both geoip and libmaxminddb are enabled, it will be this
first part of the condition that will be used.

> +else ifeq ($(BR2_PACKAGE_LIBMAXMINDDB),y)
> +SURICATA_DEPENDENCIES += libmaxminddb
> +SURICATA_CONF_OPTS += \
> +	--disable-libgeoip \
> +	--enable-geoip
>  else

I am still confused by the semantic of those geoip/libgeoip options.
Could you add a comment above this sequence of ifeq/else ifeq/endif, to
clarify what is going on ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
