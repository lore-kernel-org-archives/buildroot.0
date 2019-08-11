From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Aug 2019 15:03:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/collectd: fix netsnmp
 dependency handling
In-Reply-To: <20190810122904.22400-1-bernd.kuhls@t-online.de>
References: <20190810122904.22400-1-bernd.kuhls@t-online.de>
Message-ID: <20190811150348.55e5fc50@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bernd,

On Sat, 10 Aug 2019 14:29:04 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
> index 8eb7aa2ec0..ff36adaef3 100644
> --- a/package/collectd/collectd.mk
> +++ b/package/collectd/collectd.mk
> @@ -182,8 +182,10 @@ endif
>  ifeq ($(BR2_PACKAGE_MYSQL),y)
>  COLLECTD_CONF_OPTS += --with-libmysql=$(STAGING_DIR)/usr
>  endif
> -ifeq ($(BR2_PACKAGE_NETSNMP),y)
> +ifeq ($(BR2_PACKAGE_COLLECTD_SNMP),y)
>  COLLECTD_CONF_OPTS += --with-libnetsnmp=$(STAGING_DIR)/usr
> +else
> +COLLECTD_CONF_OPTS += --with-libnetsnmp=no
>  endif

We normally use --without-foo instead of --with-foo=no.

But more importantly, there is already a --without-snmp that is passed
when BR2_PACKAGE_COLLECTD_SNMP is disabled:

	$(if $(BR2_PACKAGE_COLLECTD_SNMP),--enable-snmp,--disable-snmp) \

Isn't that sufficient ?

Also, if the --disable-snmp isn't sufficient, then don't we have the
same problem for MySQL, PostgreSQL and a number of other dependencies ?

For example, for MySQL, we have in CONF_OPTS:

	$(if $(BR2_PACKAGE_COLLECTD_MYSQL),--enable-mysql,--disable-mysql) \

Then in DEPENDENCIES:

	$(if $(BR2_PACKAGE_COLLECTD_MYSQL),mysql) \

And later:

ifeq ($(BR2_PACKAGE_MYSQL),y)
COLLECTD_CONF_OPTS += --with-libmysql=$(STAGING_DIR)/usr
endif

So we have the exact same situation as SNMP.

Could you have a look into this ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
