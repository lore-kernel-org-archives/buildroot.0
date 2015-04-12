From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Apr 2015 18:02:54 +0200
Subject: [Buildroot] [PATCH 12/14] packages: remove non-IPv6
 dependencies and tweaks
In-Reply-To: <1428754662-27829-12-git-send-email-gustavo@zacarias.com.ar>
References: <1428754662-27829-1-git-send-email-gustavo@zacarias.com.ar>
 <1428754662-27829-12-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150412160254.GA19416@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2015-04-11 09:17 -0300, Gustavo Zacarias spake thusly:
> Now that IPv6 is mandatory remove package dependencies and conditionals
> for it.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

You've missed an instance in package/php/Config.ext .

[--SNIP--]
> diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
> index 735ed65..92c6873 100644
> --- a/package/iputils/iputils.mk
> +++ b/package/iputils/iputils.mk
> @@ -10,6 +10,7 @@ IPUTILS_SOURCE = iputils-$(IPUTILS_VERSION).tar.bz2
>  IPUTILS_LICENSE = GPLv2+ BSD-3c
>  # Only includes a license file for BSD
>  IPUTILS_LICENSE_FILES = ninfod/COPYING
> +IPUTILS_DEPENDENCIES = openssl
>  
>  # Build after busybox so target ends up with this package's full
>  # versions of the applications instead of busybox applets.
> @@ -20,20 +21,8 @@ endif
>  # Disabling CAP_SETPCAP (file capabilities)
>  IPUTILS_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) USE_CAP=no USE_SYSFS=no\
>  	CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE" \
> -	arping clockdiff ping rarpd rdisc tftpd tracepath
> -
> -ifeq ($(BR2_INET_IPV6),y)
> -# To support md5 for ping6
> -IPUTILS_DEPENDENCIES += openssl
> -
> -IPUTILS_MAKE_OPTS += ping6 tracepath6 traceroute6
> -
> -define IPUTILS_IPV6_INSTALL_TARGET_CMDS
> -	$(INSTALL) -D -m 755 $(@D)/ping6       $(TARGET_DIR)/bin/ping6
> -	$(INSTALL) -D -m 755 $(@D)/tracepath6  $(TARGET_DIR)/bin/tracepath6
> -	$(INSTALL) -D -m 755 $(@D)/traceroute6 $(TARGET_DIR)/bin/traceroute6
> -endef
> -endif
> +	arping clockdiff ping rarpd rdisc tftpd tracepath \
> +	ping6 tracepath6 traceroute6
>  
>  define IPUTILS_BUILD_CMDS
>  	$(MAKE) -C $(@D) $(IPUTILS_MAKE_OPTS)
> @@ -47,6 +36,9 @@ define IPUTILS_INSTALL_TARGET_CMDS
>  	$(INSTALL) -D -m 755 $(@D)/rdisc       $(TARGET_DIR)/sbin/rdisc
>  	$(INSTALL) -D -m 755 $(@D)/tftpd       $(TARGET_DIR)/usr/sbin/in.tftpd
>  	$(INSTALL) -D -m 755 $(@D)/tracepath   $(TARGET_DIR)/bin/tracepath
> +	$(INSTALL) -D -m 755 $(@D)/ping6       $(TARGET_DIR)/bin/ping6
> +	$(INSTALL) -D -m 755 $(@D)/tracepath6  $(TARGET_DIR)/bin/tracepath6
> +	$(INSTALL) -D -m 755 $(@D)/traceroute6 $(TARGET_DIR)/bin/traceroute6
>  	$(IPUTILS_IPV6_INSTALL_TARGET_CMDS)

IPUTILS_IPV6_INSTALL_TARGET_CMDS is now always undefined, you can ditch
it too.

[--SNIP--]
> diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
> index 91a740a..8c14c0b 100644
> --- a/package/libnspr/libnspr.mk
> +++ b/package/libnspr/libnspr.mk
> @@ -20,7 +20,7 @@ LIBNSPR_CONF_ENV = \
>  # NSPR mixes up --build and --host
>  LIBNSPR_CONF_OPTS = --host=$(GNU_HOST_NAME)
>  LIBNSPR_CONF_OPTS += --$(if $(BR2_ARCH_IS_64),en,dis)able-64bit
> -LIBNSPR_CONF_OPTS += --$(if $(BR2_INET_IPV6),en,dis)able-ipv6
> +LIBNSPR_CONF_OPTS += --enable-ipv6

libnspr is an autotools package, so this is passed in the standard
autocomf options. You can drop it from here.

[--SNIP--]
> diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
> index f747011..6eff5e3 100644
> --- a/package/netsnmp/netsnmp.mk
> +++ b/package/netsnmp/netsnmp.mk
> @@ -17,7 +17,7 @@ NETSNMP_CONF_OPTS = \
>  	--enable-mini-agent \
>  	--without-rpm \
>  	--with-logfile=none \
> -	--without-kmem-usage $(DISABLE_IPV6) \
> +	--without-kmem-usage \

Ah, I see you removed it here. I still think it would be better to
remove it at the time you ditch DISABLE_IPV6.

[--SNIP--]
> diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
> index 575c381..023b4dd 100644
> --- a/package/proftpd/proftpd.mk
> +++ b/package/proftpd/proftpd.mk
> @@ -48,8 +48,7 @@ PROFTPD_MAKE = $(MAKE1)
>  
>  define PROFTPD_INSTALL_TARGET_CMDS
>  	$(INSTALL) -D -m 0755 $(@D)/proftpd $(TARGET_DIR)/usr/sbin/proftpd
> -	$(INSTALL) -m 0644 -D $(@D)/sample-configurations/basic.conf $(TARGET_DIR)/etc/proftpd.conf; \
> -	$(if $(BR2_INET_IPV6),,$(SED) 's/^UseIPv6/# UseIPv6/' $(TARGET_DIR)/etc/proftpd.conf;)

This is telling me that the nit about lighttpd I talked about in my
review of the previous patch, should be dropped.

[--SNIP--]
> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> index d00ac9d..38353d0 100644
> --- a/package/systemd/Config.in
> +++ b/package/systemd/Config.in
> @@ -11,7 +11,6 @@ config BR2_PACKAGE_SYSTEMD
>  	bool "systemd"
>  	depends on BR2_INIT_SYSTEMD
>  	depends on BR2_USE_WCHAR # util-linux
> -	depends on BR2_INET_IPV6

As I said previously, this should have been folded in your patch 9/14
(system: drop IPv6 depend for systemd).

[--SNIP--]

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
