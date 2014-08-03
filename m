From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 3 Aug 2014 11:47:02 +0200
Subject: [Buildroot] [PATCH] nginx: new package
In-Reply-To: <20140803105543.0b33b435@free-electrons.com>
References: <1406938853-17967-1-git-send-email-s.martin49@gmail.com>
 <20140803105543.0b33b435@free-electrons.com>
Message-ID: <CAHXCMM+Gu8+3V5uDbRJWRQOiY8k96yK0VDKB2OgvuG6HUP2bXA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all,

On Sun, Aug 3, 2014 at 10:55 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Samuel Martin,
>
> On Sat,  2 Aug 2014 02:20:53 +0200, Samuel Martin wrote:
>> nginx module selection is, by default, the same as the one sets by
>> the upstream configure script.
>>
>> Patches improving the cross-compilation support have already been sent
>> upstream for integration [1-5].
>>
>> Fixes bug: #3427 [6]
>
> Nice! Some comments below.
>
>> diff --git a/package/nginx/Config.in b/package/nginx/Config.in
>> new file mode 100644
>> index 0000000..d7c3414
>> --- /dev/null
>> +++ b/package/nginx/Config.in
>> @@ -0,0 +1,319 @@
>> +comment "nginx needs a toolchain w/ largefile"
>> +     depends on !BR2_LARGEFILE
>> +
>> +menuconfig BR2_PACKAGE_NGINX
>> +     bool "nginx"
>> +     depends on BR2_LARGEFILE
>> +     help
>> +       nginx is an HTTP and reverse proxy server, as well as a mail proxy
>> +       server.
>> +
>> +       http://nginx.org/
>> +
>> +if BR2_PACKAGE_NGINX
>> +
>> +config BR2_PACKAGE_NGINX_FILE_AIO
>> +     bool "file AIO support"
>> +
>> +config BR2_PACKAGE_NGINX_HTTP
>> +     bool "http server"
>> +     default y
>
> I'm a bit confused here with the hierachy of options. Nginx can be a
> web server, but then it has some other modules useful in situations
> where nginx is not used as a web server?

nginx can also be a mail server.

>
>> +config BR2_PACKAGE_NGINX_http_cache
>
> I think we want upper case options everywhere.

well, I use './configure --help | sed ...' to generate most of this
options, that why I keep the lower case ;-)
I'll change it.

>
>> diff --git a/package/nginx/S50nginx b/package/nginx/S50nginx
>> new file mode 100644
>> index 0000000..12f0c95
>> --- /dev/null
>> +++ b/package/nginx/S50nginx
>> @@ -0,0 +1,26 @@
>> +#!/bin/sh
>> +#
>> +# Start/stop nginx
>> +#
>> +
>> +PIDFILE=/var/run/nginx.pid
>> +
>> +case "$1" in
>> +  start)
>> +     echo "Starting nginx..."
>> +     start-stop-daemon -S -x nginx
>> +     ;;
>> +  stop)
>> +     echo -n "Stopping nginx..."
>> +     start-stop-daemon -K -o -p $PIDFILE
>
> The pidfile gets created by nginx itself? You don't use option -p when
> starting the daemon, so I'm wondering.

I'll fix it.

>
>> +     ;;
>> +  restart|reload)
>> +     "$0" stop
>> +     "$0" start
>> +     ;;
>> +  *)
>> +     echo "Usage: $0 {start|stop|restart}"
>> +     exit 1
>> +esac
>> +
>> +exit $?
>> diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
>> new file mode 100644
>> index 0000000..2800592
>> --- /dev/null
>> +++ b/package/nginx/nginx.mk
>> @@ -0,0 +1,228 @@
>> +################################################################################
>> +#
>> +# nginx
>> +#
>> +################################################################################
>> +
>> +NGINX_VERSION = 1.7.3
>> +NGINX_SITE = http://nginx.org/download
>> +NGINX_LICENSE = BSD-2c
>> +NGINX_LICENSE_FILES = LICENSE
>> +
>> +NGINX_CONF_OPT = \
>> +     --crossbuild=Linux::$(BR2_ARCH) \
>> +     --with-cc="$(TARGET_CC)" \
>> +     --with-cpp="$(TARGET_CC)" \
>> +     --with-cc-opt="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" \
>> +     --with-ld-opt="$(TARGET_LDFLAGS) -L$(STAGING_DIR)/usr/lib"
>
> Weird that these -I and -L are necessary: the compiler automatically
> looks into these directories when looking for libraries and headers.

I got some trouble without... I'll regive a try before reposting this patch

>
>> +NGINX_CONF_OPT += \
>> +     --prefix=/etc/nginx \
>
> As prefix? This looks weird. But maybe it's because it doesn't use the
> autotools, so the prefix doesn't have the same meaning;

Oops! good catche, copy-paste mistake!

And, no, unfortunately nginx is not autotools-package complaint at all :'(

Actually, its entire build-system is homemade/handwritten with a
number of ... uncommon things:
- if a feature is on by default, only the --without-... option exists
(and reciprocally, if it's off by default, only --with-... option
exists), however there are some exceptions that confirm these rules!;
- passing an undefined option to the configure script makes the
configuration failed :(;
- the build-system is done to be cross-platform, but not really
cross-compilation friendly, so the number of patches to carry;
- ...

>
>> +     --conf-path=/etc/nginx/nginx.conf \
>> +     --sbin-path=/usr/bin/nginx \
>> +     --pid-path=/var/run/nginx.pid \
>
> Ah, here comes the path of the PID file!
>
>> +     --lock-path=/var/lock/nginx.lock \
>> +     --user=www-data \
>> +     --group=www-data \
>> +     --error-log-path=stderr \
>> +     --http-log-path=/var/log/nginx/access.log \
>> +     --http-client-body-temp-path=/var/lib/nginx/client-body \
>> +     --http-proxy-temp-path=/var/lib/nginx/proxy \
>> +     --http-fastcgi-temp-path=/var/lib/nginx/fastcgi \
>> +     --http-scgi-temp-path=/var/lib/nginx/scgi \
>> +     --http-uwsgi-temp-path=/var/lib/nginx/uwsgi
>> +
>> +NGINX_CONF_OPT += \
>> +     $(if $(BR2_PACKAGE_NGINX_FILE_AIO),--with-file-aio) \
>> +     $(if $(BR2_INET_IPV6),--with-ipv6)
>> +
>> +ifeq ($(BR2_PACKAGE_PCRE),y)
>> +NGINX_DEPENDENCIES += pcre
>> +NGINX_CONF_OPT += --with-pcre
>> +else
>> +NGINX_CONF_OPT += --without-pcre
>> +endif
>> +
>> +# modules disabled or not activated because of missing dependencies:
>> +# - google_perftools  (googleperftools)
>> +# - http_geoip_module (geoip)
>> +# - http_perl_module  (host-perl)
>> +# - pcre-jit          (want to rebuild pcre)
>> +
>> +# misc. modules
>> +NGINX_CONF_OPT += \
>> +     $(if $(BR2_PACKAGE_NGINX_rtsig_module),--with-rtsig_module) \
>> +     $(if $(BR2_PACKAGE_NGINX_select_module),--with-select_module,--without-select_module) \
>> +     $(if $(BR2_PACKAGE_NGINX_poll_module),--with-poll_module,--without-poll_module)
>> +
>> +ifneq ($(BR2_PACKAGE_NGINX_add_modules),)
>> +NGINX_CONF_OPT += \
>> +     $(addprefix --add-module=,$(call qstrip,$(BR2_PACKAGE_NGINX_add_modules)))
>> +endif
>> +
>> +# http server modules
>> +ifeq ($(BR2_PACKAGE_NGINX_HTTP),y)
>> +ifeq ($BR2_PACKAGE_NGINX_http_cache),y)
>> +NGINX_DEPENDENCIES += openssl
>
> No --with-http-cache ?

nope, see my explaination above ;)

>
>> +else
>> +NGINX_CONF_OPT += --without-http-cache
>> +endif
>> +
>> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
>> +NGINX_DEPENDENCIES += openssl
>> +NGINX_CONF_OPT += --with-http_ssl_module
>> +endif
>
> So this module is enabled depending on whether OpenSSL is present and
> does not have a Config.in option, but some other modules do have a
> Config.in option that selects OpenSSL. This looks a bit inconsistent,
> no?

Could be... I just want to be KISS in that case... but I can add an
option in the Config.in.

>
>> +
>> +ifeq ($(BR2_PACKAGE_NGINX_http_xslt_module),y)
>> +NGINX_DEPENDENCIES += libxml2 libxslt
>> +NGINX_CONF_OPT += --with-http_xslt_module
>> +NGINX_CONF_ENV += \
>> +     ngx_feature_path_libxslt=$(STAGING_DIR)/usr/include/libxml2
>
> else
> --without-foo ?
>
>> +endif
>> +
>> +ifeq ($(BR2_PACKAGE_NGINX_http_image_filter_module),y)
>> +NGINX_DEPENDENCIES += gd jpeg libpng
>> +NGINX_CONF_OPT += --with-http_image_filter_module
>> +endif
>
> Ditto.
>
>> +
>> +ifeq ($(BR2_PACKAGE_NGINX_http_gunzip_module),y)
>> +NGINX_DEPENDENCIES += zlib
>> +NGINX_CONF_OPT += --with-http_gunzip_module
>> +endif
>
> Ditto.
>
>> +ifeq ($(BR2_PACKAGE_NGINX_http_gzip_static_module),y)
>> +NGINX_DEPENDENCIES += zlib
>> +NGINX_CONF_OPT += --with-http_gzip_static_module
>> +endif
>
> Ditto.
>
>> +
>> +ifeq ($(BR2_PACKAGE_NGINX_http_secure_link_module),y)
>> +NGINX_DEPENDENCIES += openssl
>> +NGINX_CONF_OPT += --with-http_secure_link_module
>> +endif
>
> Same.
>
>> +
>> +ifeq ($(BR2_PACKAGE_NGINX_http_gzip_module),y)
>> +NGINX_DEPENDENCIES += zlib
>
> --with-foo
>
>> +else
>> +NGINX_CONF_OPT += --without-http_gzip_module
>> +endif
>> +
>> +ifeq ($(BR2_PACKAGE_NGINX_http_rewrite_module),y)
>> +NGINX_DEPENDENCIES += pcre
>
> --with-foo
>
>> +else
>> +NGINX_CONF_OPT += --without-http_rewrite_module
>> +endif
>
> How does this interact with the --with-pcre/--without-pcre above?

AFAICS, there is no interaction between the http_rewrite_module and
the with-pcre option.
The --with-pcre option add a definition NGX_PCRE, which is used in
many files, even some modules (so they can optionally use pcre), but
never in the http_rewrite_module (which unconditionally depends on
pcre).

>
>> +
>> +NGINX_CONF_OPT += \
>> +     $(if $(BR2_PACKAGE_NGINX_http_spdy_module),--with-http_spdy_module) \
>> +     $(if $(BR2_PACKAGE_NGINX_http_realip_module),--with-http_realip_module) \
>> +     $(if $(BR2_PACKAGE_NGINX_http_addition_module),--with-http_addition_module) \
>> +     $(if $(BR2_PACKAGE_NGINX_http_sub_module),--with-http_sub_module) \
>> +     $(if $(BR2_PACKAGE_NGINX_http_dav_module),--with-http_dav_module) \
>> +     $(if $(BR2_PACKAGE_NGINX_http_flv_module),--with-http_flv_module) \
>> +     $(if $(BR2_PACKAGE_NGINX_http_mp4_module),--with-http_mp4_module) \
>> +     $(if $(BR2_PACKAGE_NGINX_http_auth_request_module),--with-http_auth_request_module) \
>> +     $(if $(BR2_PACKAGE_NGINX_http_random_index_module),--with-http_random_index_module) \
>> +     $(if $(BR2_PACKAGE_NGINX_http_degradation_module),--with-http_degradation_module) \
>> +     $(if $(BR2_PACKAGE_NGINX_http_stub_status_module),--with-http_stub_status_module) \
>> +     $(if $(BR2_PACKAGE_NGINX_http_charset_module),,--without-http_charset_module) \
>> +     $(if $(BR2_PACKAGE_NGINX_http_ssi_module),,--without-http_ssi_module) \
>> +     $(if $(BR2_PACKAGE_NGINX_http_userid_module),,--without-http_userid_module) \
>> +     $(if $(BR2_PACKAGE_NGINX_http_access_module),,--without-http_access_module) \
>> +     $(if $(BR2_PACKAGE_NGINX_http_auth_basic_module),,--without-http_auth_basic_module) \
>> +     $(if $(BR2_PACKAGE_NGINX_http_autoindex_module),,--without-http_autoindex_module) \
>> +     $(if $(BR2_PACKAGE_NGINX_http_geo_module),,--without-http_geo_module) \
>> +     $(if $(BR2_PACKAGE_NGINX_http_map_module),,--without-http_map_module) \
>> +     $(if $(BR2_PACKAGE_NGINX_http_split_clients_module),,--without-http_split_clients_module) \
>> +     $(if $(BR2_PACKAGE_NGINX_http_referer_module),,--without-http_referer_module) \
>> +     $(if $(BR2_PACKAGE_NGINX_http_proxy_module),,--without-http_proxy_module) \
>> +     $(if $(BR2_PACKAGE_NGINX_http_fastcgi_module),,--without-http_fastcgi_module) \
>> +     $(if $(BR2_PACKAGE_NGINX_http_uwsgi_module),,--without-http_uwsgi_module) \
>> +     $(if $(BR2_PACKAGE_NGINX_http_scgi_module),,--without-http_scgi_module) \
>> +     $(if $(BR2_PACKAGE_NGINX_http_memcached_module),,--without-http_memcached_module) \
>> +     $(if $(BR2_PACKAGE_NGINX_http_limit_conn_module),,--without-http_limit_conn_module) \
>> +     $(if $(BR2_PACKAGE_NGINX_http_limit_req_module),,--without-http_limit_req_module) \
>> +     $(if $(BR2_PACKAGE_NGINX_http_empty_gif_module),,--without-http_empty_gif_module) \
>> +     $(if $(BR2_PACKAGE_NGINX_http_browser_module),,--without-http_browser_module) \
>> +     $(if $(BR2_PACKAGE_NGINX_http_upstream_hash_module),,--without-http_upstream_hash_module) \
>> +     $(if $(BR2_PACKAGE_NGINX_http_upstream_ip_hash_module),,--without-http_upstream_ip_hash_module) \
>> +     $(if $(BR2_PACKAGE_NGINX_http_upstream_least_conn_module),,--without-http_upstream_least_conn_module) \
>> +     $(if $(BR2_PACKAGE_NGINX_http_upstream_keepalive_module),,--without-http_upstream_keepalive_module)
>
> Why half of them use --with and the other half --without? I guess
> because some are default enabled and some others are default disabled.
> But I think we should rather make this explicit, in case the default of
> enabled/disabled changes when bumping the upstream version.

Well, unfortunately, this is an upstream bizarrerie! :-|

>
>> +else # !BR2_PACKAGE_NGINX_HTTP
>> +NGINX_CONF_OPT += --without-http
>> +endif # BR2_PACKAGE_NGINX_HTTP
>> +
>> +# mail modules
>> +ifeq ($BR2_PACKAGE_NGINX_MAIL),y)
>> +
>> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
>> +NGINX_DEPENDENCIES += openssl
>> +NGINX_CONF_OPT += --with-mail_ssl_module
>> +endif
>> +
>> +NGINX_CONF_OPT += \
>> +     $(if $(BR2_PACKAGE_NGINX_mail_pop3_module),,--without-mail_pop3_module) \
>> +     $(if $(BR2_PACKAGE_NGINX_mail_imap_module),,--without-mail_imap_module) \
>> +     $(if $(BR2_PACKAGE_NGINX_mail_smtp_module),,--without-mail_smtp_module)
>> +
>> +endif # BR2_PACKAGE_NGINX_MAIL
>> +define NGINX_DISABLE_WERROR
>> +     $(SED) 's/-Werror//g' -i $(@D)/auto/cc/*
>> +endef
>> +
>> +NGINX_PRE_CONFIGURE_HOOKS += NGINX_DISABLE_WERROR
>> +
>> +define NGINX_CONFIGURE_CMDS
>> +     cd $(@D) ; $(NGINX_CONF_ENV) ./configure $(NGINX_CONF_OPT)
>> +endef
>> +
>> +define NGINX_BUILD_CMDS
>> +     $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
>> +endef
>> +
>> +define NGINX_INSTALL_TARGET_CMDS
>> +     $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
>> +     -$(RM) $(TARGET_DIR)/usr/bin/nginx.old
>> +     $(INSTALL) -D -m 0664 package/nginx/nginx.logrotate \
>> +             $(TARGET_DIR)/etc/logrotate.d/nginx
>> +endef
>> +
>> +define NGINX_INSTALL_INIT_SYSTEMD
>> +     $(INSTALL) -D -m 0644 package/nginx/nginx.service \
>> +             $(TARGET_DIR)/usr/lib/systemd/system/nginx.service
>> +endef
>> +
>> +define NGINX_INSTALL_INIT_SYSV
>> +     $(INSTALL) -D -m 0755 package/nginx/S50nginx \
>> +             $(TARGET_DIR)/etc/init.d/S50nginx
>> +endef
>> +
>> +$(eval $(generic-package))
>
> Other than that, looks good. Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

Thanks for the review.

-- 
Samuel
