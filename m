From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 29 Feb 2020 22:17:55 +0100
Subject: [Buildroot] [PATCH] package/openrc: remove keymaps units if kbd
 package is not selected
In-Reply-To: <20200229182621.14431-1-unixmania@gmail.com>
References: <20200229182621.14431-1-unixmania@gmail.com>
Message-ID: <20200229211755.GV8743@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos, All,

On 2020-02-29 15:26 -0300, unixmania at gmail.com spake thusly:
> From: Carlos Santos <unixmania@gmail.com>
> 
> keymaps and save-keymaps require kbd_mode and dumpkeys, respectively, so
> remove them if the kbd package is not selected (e.g. devices with serial
> console, only).
> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>

Applied to master with a small fix:

  - expand to three commands to match the existing hook

As Adam noted, I also prefer the comment to be outside the conditional
block, but that is not a set-in-stone rule. Given that the existing hook
had the comment in the conditional block, I kept the new one there too.

Thanks!

Regards,
Yann E. MORIN.

> ---
>  package/openrc/openrc.mk | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/package/openrc/openrc.mk b/package/openrc/openrc.mk
> index 289bde4d03..dd56d72a1a 100644
> --- a/package/openrc/openrc.mk
> +++ b/package/openrc/openrc.mk
> @@ -39,6 +39,16 @@ define OPENRC_INSTALL_TARGET_CMDS
>  		$(TARGET_DIR)/etc/init.d/sysv-rcs
>  endef
>  
> +ifeq ($(BR2_PACKAGE_KBD),)
> +# keymaps and save-keymaps require kbd_mode and dumpkeys, respectively, so
> +# remove them if the kbd package is not selected (e.g. devices with serial
> +# console, only).
> +define OPENRC_NO_KBD
> +	$(RM) $(TARGET_DIR)/etc/{conf.d,init.d,runlevels/boot}/{keymaps,save-keymaps}
> +endef
> +OPENRC_POST_INSTALL_TARGET_HOOKS += OPENRC_NO_KBD
> +endif
> +
>  ifeq ($(BR2_PACKAGE_NETIFRC),y)
>  # netifrc replaces network, staticroute and loopback services which are
>  # installed by openrc
> -- 
> 2.18.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
