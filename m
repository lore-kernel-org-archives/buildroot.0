From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Jul 2020 23:16:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/systemd: pre-create directories
 for services
In-Reply-To: <20200717234235.17829-1-nolange79@gmail.com>
References: <20200717234235.17829-1-nolange79@gmail.com>
Message-ID: <20200718211625.GR18825@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Norbert, All,

On 2020-07-18 01:42 +0200, Norbert Lange spake thusly:
> this adds a new hook and a corresponding variable to add
> addirectories and files after installation.
> 
> various services need directories in /var when they are started,
> and create them if necessary. Creating those before, allows
> those services to start even if /var is read-only.
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>  package/systemd/systemd.mk | 24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)
> 
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index c202f5be02..b57365872e 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -317,6 +317,7 @@ endif
>  
>  ifeq ($(BR2_PACKAGE_SYSTEMD_LOGIND),y)
>  SYSTEMD_CONF_OPTS += -Dlogind=true
> +SYSTEMD_POST_INSTALL_ENTRIES += var/lib/systemd/linger/

The naming is not nice. Also, paths should be absolute:

    SYSTEMD_CREATE_DIRS += /var/lib/systemd/linger/

However, I am not fond of mixing the directories creation with two
infras: post-isntall hooks and _PERMISSIONS tables.

So, in fact:

    SYSTEMD_LOGIND_PERMISIONS = /var/lib/systemd/linger d 755 0 0 - - - - -

Ditto for the others conditional directories. And of course, we should
also treat the non-conditional ones similarly.

[--SNIP--]
> @@ -436,6 +440,7 @@ endif
>  ifeq ($(BR2_PACKAGE_SYSTEMD_TIMESYNCD),y)
>  SYSTEMD_CONF_OPTS += -Dtimesyncd=true
>  SYSTEMD_TIMESYNCD_USER = systemd-timesync -1 systemd-timesync -1 * - - - systemd Time Synchronization
> +SYSTEMD_POST_INSTALL_ENTRIES += var/lib/systemd/timesync/

    SYSTEMD_TIMESYNCD_PERMISIONS = /var/lib/systemd/timesync d 755 systemd-timesync systemd-timesync - - - - -

[--SNIP--]
> @@ -485,18 +490,23 @@ ifneq ($(SYSTEMD_FALLBACK_HOSTNAME),)
>  SYSTEMD_CONF_OPTS += -Dfallback-hostname=$(SYSTEMD_FALLBACK_HOSTNAME)
>  endif
>  
> +define SYSTEMD_INSTALL_ENTRY_HOOK
> +	mkdir -p -m700 $(TARGET_DIR)/var/lib/private $(TARGET_DIR)/var/log/private \
> +		$(TARGET_DIR)/var/cache/private
> +	mkdir -p -m1777 $(TARGET_DIR)/var/tmp
> +	$(if $(BR2_PACKAGE_SYSTEMD_MACHINED),mkdir -p -m700 $(TARGET_DIR)/var/lib/machines)
> +	mkdir -p $(addprefix $(TARGET_DIR)/,var/lib $(filter %/,$(SYSTEMD_POST_INSTALL_ENTRIES)))
> +	touch $(addprefix $(TARGET_DIR)/,etc/machine-id $(filter-out %/,$(SYSTEMD_POST_INSTALL_ENTRIES)))
> +endef

This would thus no longer be needed.

>  define SYSTEMD_INSTALL_INIT_HOOK
>  	ln -fs multi-user.target \
>  		$(TARGET_DIR)/usr/lib/systemd/system/default.target
>  endef
>  
> -define SYSTEMD_INSTALL_MACHINEID_HOOK
> -	touch $(TARGET_DIR)/etc/machine-id
> -endef

This could also probably be replaced with a non-conditional entry in the
permissions table, see below...

>  SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
> +	SYSTEMD_INSTALL_ENTRY_HOOK \
>  	SYSTEMD_INSTALL_INIT_HOOK \
> -	SYSTEMD_INSTALL_MACHINEID_HOOK \
>  	SYSTEMD_INSTALL_RESOLVCONF_HOOK
>  
>  define SYSTEMD_INSTALL_IMAGES_CMDS
> @@ -532,6 +542,10 @@ endef
>  
>  SYSTEMD_TARGET_FINALIZE_HOOKS += SYSTEMD_INSTALL_NSSCONFIG_HOOK
>  
> +define SYSTEMD_PERMISSIONS
> +	$(if $(SYSTEMD_TIMESYNCD_USER),/var/lib/systemd/timesync d 755 systemd-timesync systemd-timesync - - - - -)
> +endef

We usually do not use conditional in the permissions tables, but define
conditional variables that we then re-use (see above):

    define SYSTEMD_PERMISSIONS
        /etc/machine-id f 644 0 0 - - - - -
        $(SYSTEMD_LOGIND_PERMISIONS)
        $(SYSTEMD_TIMESYNCD_PERMISIONS)
        ...
    endef

Regards,
Yann E. MORIN.

> +
>  ifneq ($(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)),)
>  # systemd provides multiple units to autospawn getty as neede
>  # * getty at .service to start a getty on normal TTY
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
