From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 30 Oct 2019 00:29:29 +0100
Subject: [Buildroot] [PATCH 1/1] package/collectd: add lua optional
 dependency
In-Reply-To: <20191028152935.13901-1-fontaine.fabrice@gmail.com>
References: <20191028152935.13901-1-fontaine.fabrice@gmail.com>
Message-ID: <f2fab5ec-c32e-90db-b96d-1f863415a112@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28/10/2019 16:29, Fabrice Fontaine wrote:
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/collectd/collectd.mk | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
> index 50425e89ac..820547b511 100644
> --- a/package/collectd/collectd.mk
> +++ b/package/collectd/collectd.mk
> @@ -18,7 +18,7 @@ COLLECTD_AUTORECONF = YES
>  # These require unmet dependencies, are fringe, pointless or deprecated

 So the lua plugin is not fringe, pointless or deprecated?

 I'll take your word for it :-)

 Applied to master, thanks.

 Regards,
 Arnout

>  COLLECTD_PLUGINS_DISABLE = \
>  	apple_sensors aquaero ascent barometer dbi dpdkstat email \
> -	gmond hddtemp intel_rdt ipmi java lpar lua \
> +	gmond hddtemp intel_rdt ipmi java lpar \
>  	madwifi mbmon mic multimeter netapp notify_desktop numa \
>  	nut oracle perl pf pinba powerdns python routeros \
>  	rrdcached sigrok tape target_v5upgrade teamspeak2 ted \
> @@ -213,6 +213,13 @@ else
>  COLLECTD_CONF_OPTS += --with-libgcrypt=no
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LUA),y)
> +COLLECTD_DEPENDENCIES += lua
> +COLLECTD_CONF_OPTS += --enable-lua
> +else
> +COLLECTD_CONF_OPTS += --disable-lua
> +endif
> +
>  define COLLECTD_INSTALL_TARGET_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
>  	rm -f $(TARGET_DIR)/usr/bin/collectd-nagios
> 
