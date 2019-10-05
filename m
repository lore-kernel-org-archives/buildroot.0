From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 5 Oct 2019 17:27:54 +0200
Subject: [Buildroot] [PATCH v5,
 1/1] package/suricata: security bump to version 4.1.5
In-Reply-To: <20191002212427.14014-1-fontaine.fabrice@gmail.com>
References: <20191002212427.14014-1-fontaine.fabrice@gmail.com>
Message-ID: <437d5785-3531-8c89-8b05-f9a5e1840d86@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02/10/2019 23:24, Fabrice Fontaine wrote:
> - Drop second patch (already in version)
> - Add libmaxminddb dependency and use --disable-libgeoip to prefer
>   maxminddb over geoip, see:
>   https://github.com/OISF/suricata/commit/d29072647fa479eb748357a5a75f1ac4206a2cff
>   https://github.com/OISF/suricata/commit/c55226b7126079d78e4bf5c6fc290242001954a6
> - Disable sphinx-build (to avoid a build failure)
> - This release fixes a number of issues found in the 4.1 branch. Some of
>   the issues are security issues, so upgrading is highly recommended.
>   See https://suricata-ids.org/2019/09/24/suricata-4-1-5-released
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v4 -> v5 (after review of Thomas Petazzoni):
>  - Change ifeq order so that libmaxminddb is really preferred over geoip

 I hope it's finally OK now because I committed it to master, thanks :-)

[snip]
 +# --disable-libgeoip disables libgeoip when --enable-geoip is requested.
> +# This allows libmaxminddb to be picked up instead of libgeoip when both are
> +# installed on the system.
> +ifeq ($(BR2_PACKAGE_LIBMAXMINDDB),y)
> +SURICATA_DEPENDENCIES += libmaxminddb
> +SURICATA_CONF_OPTS += \
> +	--disable-libgeoip \
> +	--enable-geoip

 I've swapped those two so they're in the same order as the equivalents below. I
think that that's more important than alphabetical ordering. Anyway, it makes
more sense to ignore the disable/enable bit when sorting.

 Regards,
 Arnout

> +else ifeq ($(BR2_PACKAGE_GEOIP),y)
>  SURICATA_DEPENDENCIES += geoip
> -SURICATA_CONF_OPTS += --enable-geoip
> +SURICATA_CONF_OPTS += \
> +	--enable-geoip \
> +	--enable-libgeoip
>  else
>  SURICATA_CONF_OPTS += --disable-geoip
>  endif
> 
