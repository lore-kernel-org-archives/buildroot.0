From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 14 Jun 2014 18:50:05 +0200
Subject: [Buildroot] [PATCH] systemd: add network unit file
In-Reply-To: <1402673735-14109-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1402673735-14109-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20140614165005.GC3503@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Eric, All,

On 2014-06-13 17:35 +0200, Eric Le Bihan spake thusly:
> From: Ivan Sergeev <vsergeev@kumunetworks.com>
> 
> Add and enable a systemd unit file to bring up or down network with ifup /
> ifdown, analogous to the skeleton/etc/init.d/S40network init script.
[--SNIP--]
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 6de7887..f3874db 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -145,12 +145,24 @@ define SYSTEMD_SANITIZE_PATH_IN_UNITS
>  		-exec $(SED) 's,$(HOST_DIR),,g' {} \;
>  endef
>  
> +define SYSTEMD_INSTALL_NETWORK_HOOK
> +	$(INSTALL) -D -m 644 package/systemd/network.service \
> +		$(TARGET_DIR)/etc/systemd/system/network.service
> +	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> +	ln -fs ../network.service \
> +		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/network.service
> +endef
> +
>  SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
>  	SYSTEMD_INSTALL_INIT_HOOK \
>  	SYSTEMD_INSTALL_TTY_HOOK \
>  	SYSTEMD_INSTALL_MACHINEID_HOOK \
>  	SYSTEMD_SANITIZE_PATH_IN_UNITS
>  
> +ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),)
> +SYSTEMD_POST_INSTALL_TARGET_HOOKS += SYSTEMD_INSTALL_NETWORK_HOOK
> +endif
> +

I thought we said the hook definitions should be part of the conditional
block?

    http://buildroot.net/downloads/manual/manual.html#writing-rules-mk

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
