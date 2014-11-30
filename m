From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Nov 2014 15:55:06 +0100
Subject: [Buildroot] [PATCHv3 06/74] busybox: use
 <pkg>_INSTALL_INIT_SYSV mechanism
In-Reply-To: <1417357142-14307-7-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-7-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141130145506.GK4124@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-11-30 15:17 +0100, Thomas Petazzoni spake thusly:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/busybox/busybox.mk | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> index f0fa851..eb2f3f1 100644
> --- a/package/busybox/busybox.mk
> +++ b/package/busybox/busybox.mk
> @@ -218,8 +218,11 @@ define BUSYBOX_INSTALL_TARGET_CMDS
>  		$(INSTALL) -m 0755 -D package/busybox/udhcpc.script \
>  			$(TARGET_DIR)/usr/share/udhcpc/default.script; \
>  	fi
> -	$(BUSYBOX_INSTALL_MDEV_SCRIPT)
>  	$(BUSYBOX_INSTALL_MDEV_CONF)
> +endef
> +
> +define BUSYBOX_INSTALL_INIT_SYSV
> +	$(BUSYBOX_INSTALL_MDEV_SCRIPT)

The installation of the script is stil conditional:

    define BUSYBOX_INSTALL_MDEV_SCRIPT
        [ -f $(TARGET_DIR)/etc/init.d/S10mdev ] || \
            $(INSTALL) -D -m 0755 package/busybox/S10mdev \
                $(TARGET_DIR)/etc/init.d/S10mdev
    endef

So maybe this could be fixed at the same time, like you did in the
previous patches?

Also, what would be the reason for installing the mdev configuration
out-side the _INIT_SYSV hook?

It can be a separate macro, sure, for the day we have systemd support
for mdev, but then we can just duplicate the call to that macro in the
_INIT_SYSTEMD hook.

And BTW, the installation of the mdev configuration is also still
conditional.

Regards,
Yann E. MORIN.

>  	$(BUSYBOX_INSTALL_LOGGING_SCRIPT)
>  	$(BUSYBOX_INSTALL_WATCHDOG_SCRIPT)
>  endef
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
