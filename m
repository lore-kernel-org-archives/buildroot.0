From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 15 Jun 2020 13:48:25 +0200
Subject: [Buildroot] [PATCH v2 01/14] package/systemd: configure nss
 plugins in nsswitch.conf
In-Reply-To: <20200615072055.2083-2-nolange79@gmail.com>
References: <20200615072055.2083-1-nolange79@gmail.com>
 <20200615072055.2083-2-nolange79@gmail.com>
Message-ID: <20200615114825.GZ2346@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Norbert, All,

On 2020-06-15 09:20 +0200, Norbert Lange spake thusly:
> This adds configuration of the nsswitch.conf file,
> it does so by pathing the template provided by systemd.
> 
> The template is fully populated, the services that are
> not available are removed.
> 
> If the plugin nss-compat is not available, the entries
> will be replaced with nss-files.

systemd is glibc-only, and libnss_compat.so* is provided by glibc. What
glibc does not provide it?

> nss-systemd is used for the DynamicUser features,
> which is a defacto necessity for systemd.
> It handles transient users/groups without
> touching the /etc/{passwd,group} files on disk.
> 
> nss-myhostname allows resolving the hostname,
> again without touching files in /etc.
> Enabling this feature requires configuring the plugin.
> 
> nss-resolve is part of resolved, and required for
> consistent dns lookups.
> 
> nss-mymachines adds name resolution from
> containers.
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>  package/systemd/systemd.mk | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index e61cec80f0..cf6c0f9576 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -472,7 +472,23 @@ define SYSTEMD_INSTALL_MACHINEID_HOOK
>  	touch $(TARGET_DIR)/etc/machine-id
>  endef
>  
> +define SYSTEMD_NSSCONFIG_HOOK
> +	[ -r "$$(find $(TARGET_DIR)/usr/lib -name libnss_compat.so.*)" ] || \

As said above, this is supposed to always exist in a glibc-based
toolchain, which is all that systemd supports, so I don;t see why we
would want to replace the 'compat' plugin by the 'files' one.

> +		sed 's,\bcompat\b,files,g' -i $(TARGET_DIR)/usr/share/factory/etc/nsswitch.conf

We already have a variable that does 'sed -i' :

    $(SED) 's,\bcompat\b,files,g' $(TARGET_DIR)/usr/share/factory/etc/nsswitch.conf 

> +	[ "$(BR2_PACKAGE_SYSTEMD_RESOLVED)" = "y" ] || \

Usually, we do not test configuration-level conditions in shell, but in
Makefile:

    ifeq ($(BR2_PACKAGE_SYSTEMD_RESOLVED),y)
    define SYSTEMD_NSSWITCH_CONF_RESOLVED
        sed blablabla...
    endef
    SYSTEMD_TARGET_FINALIZE_HOOKS += SYSTEMD_NSSWITCH_CONF_RESOLVED   # See below, point 3...
    endif

> +		sed -e 's,\bresolve[[:space:]][[:space:]]*\[[^]]*\][[:space:]]*,,g' \

"[[:space:]][:space:]]*" is equivalent to "[[:space:]]+".

> +		-e 's,\bresolve\b[[:space:]]*,,g' -i $(TARGET_DIR)/usr/share/factory/etc/nsswitch.conf

As I understand it, you are trying to remove the 'resolve' plugin,
whether it has a follwing "[action]" or not, right? If so, here's my
proposal of a simpler regexp that cactches both cases:

    's,\bresolve[[:space:]]+(\[[^]]+\])?[[:space:]],,g'

> +	[ "$(BR2_PACKAGE_SYSTEMD_MYHOSTNAME)" = "y" ] || \
> +		sed -e 's,\bmyhostname[[:space:]][[:space:]]*\[[^]]*\][[:space:]]*,,g' \
> +		-e 's,\bmyhostname\b[[:space:]]*,,g' -i $(TARGET_DIR)/usr/share/factory/etc/nsswitch.conf

Ditto the condition and the sed regexp.

> +	[ "$(BR2_PACKAGE_SYSTEMD_MACHINED)" = "y" ] || \
> +		sed -e 's,\bmymachines[[:space:]][[:space:]]*\[[^]]*\][[:space:]]*,,g' \
> +		-e 's,\bmymachines\b[[:space:]]*,,g' -i $(TARGET_DIR)/usr/share/factory/etc/nsswitch.conf

Ditto the condition and the sed regexp.

> +	install -m644 $(TARGET_DIR)/usr/share/factory/etc/nsswitch.conf $(TARGET_DIR)/etc/nsswitch.conf

I'm definitely not happy with all those hacks, because:

 1. /etc/nsswitch.conf is already provided by the glibc package, so
    overwriting it will not play nicely with per-package directories,

 2. we already have other packages that may tweak that file, like:
    package/nss-mdns/nss-mdns.mk
    package/nss-myhostname/nss-myhostname.mk

 3. which brings us to the point that this file should be tweaked as a
    target-finalize hook

Regards,
Yann E. MORIN.

> +endef
> +
>  SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
> +	SYSTEMD_NSSCONFIG_HOOK \
>  	SYSTEMD_INSTALL_INIT_HOOK \
>  	SYSTEMD_INSTALL_MACHINEID_HOOK \
>  	SYSTEMD_INSTALL_RESOLVCONF_HOOK
> -- 
> 2.27.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
