From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Nov 2014 18:33:04 +0100
Subject: [Buildroot] [PATCHv3 53/74] busybox: install init script and
 config file unconditionally
In-Reply-To: <1417357142-14307-54-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-54-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141130173304.GI4124@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-11-30 15:18 +0100, Thomas Petazzoni spake thusly:
> As discussed, users should use a rootfs overlay or a post-build script
> instead of a custom skeleton to override files installed by Buildroot,
> so there is no point in having conditions when installing init scripts
> or configuration files.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/busybox/busybox.mk | 30 ++++++++++++------------------
>  1 file changed, 12 insertions(+), 18 deletions(-)
> 
> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> index eb2f3f1..ae60ac1 100644
> --- a/package/busybox/busybox.mk
> +++ b/package/busybox/busybox.mk
[--SNIP--]
> @@ -176,11 +173,10 @@ define BUSYBOX_SET_WATCHDOG
>  	$(call KCONFIG_ENABLE_OPT,CONFIG_WATCHDOG,$(BUSYBOX_BUILD_CONFIG))
>  endef
>  define BUSYBOX_INSTALL_WATCHDOG_SCRIPT
> -	[ -f $(TARGET_DIR)/etc/init.d/S15watchdog ] || \
> -		$(INSTALL) -D -m 0755 package/busybox/S15watchdog \
> -			$(TARGET_DIR)/etc/init.d/S15watchdog && \
> -		$(SED) s/PERIOD/$(call qstrip,$(BR2_PACKAGE_BUSYBOX_WATCHDOG_PERIOD))/ \
> -			$(TARGET_DIR)/etc/init.d/S15watchdog
> +	$(INSTALL) -D -m 0755 package/busybox/S15watchdog \
> +		$(TARGET_DIR)/etc/init.d/S15watchdog && \
                                             ^^^^
Maybe it would be worth removing the '&& \' now?

Otherwise, looks good. With the above fixed:
    Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> +	$(SED) s/PERIOD/$(call qstrip,$(BR2_PACKAGE_BUSYBOX_WATCHDOG_PERIOD))/ \
> +		$(TARGET_DIR)/etc/init.d/S15watchdog
>  endef
>  endif
>  
> @@ -214,10 +210,8 @@ endef
>  
>  define BUSYBOX_INSTALL_TARGET_CMDS
>  	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(@D) install
> -	if [ ! -f $(TARGET_DIR)/usr/share/udhcpc/default.script ]; then \
> -		$(INSTALL) -m 0755 -D package/busybox/udhcpc.script \
> -			$(TARGET_DIR)/usr/share/udhcpc/default.script; \
> -	fi
> +	$(INSTALL) -m 0755 -D package/busybox/udhcpc.script \
> +		$(TARGET_DIR)/usr/share/udhcpc/default.script
>  	$(BUSYBOX_INSTALL_MDEV_CONF)
>  endef
>  
> -- 
> 2.1.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
