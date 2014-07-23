From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 23 Jul 2014 23:58:29 +0200
Subject: [Buildroot] [PATCH 1/7 v3] package/busybox: Add facility for
 DHCP hooks
In-Reply-To: <1402982507.184367.599670173206.1.gpush@pablo>
References: <1402982507.183937.570365596242.0.gpush@pablo>
 <1402982507.184367.599670173206.1.gpush@pablo>
Message-ID: <20140723215829.GC17249@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jeremy, All,

On 2014-06-17 13:21 +0800, Jeremy Kerr spake thusly:
> The (u)dhcpc hook installed by the busybox package configures the
> network and exits. If we want to do anything further with a DHCP lease,
> we'd have to replace the script entirely.
> 
> This change introduces a .d directory for hooks (based on the script
> filename), which are executed after the interface configuration. This
> allows packages to drop a script file in the .d directory to perform
> actions on DHCP events.
> 
> We'll use this in a later change to notify petitboot of DHCP boot
> information.
> 
> Signed-off-by: Jeremy Kerr <jk@ozlabs.org>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/busybox/busybox.mk    |    2 ++
>  package/busybox/udhcpc.script |    6 ++++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> index c368b80..bddeb63 100644
> --- a/package/busybox/busybox.mk
> +++ b/package/busybox/busybox.mk
> @@ -222,6 +222,8 @@ define BUSYBOX_INSTALL_TARGET_CMDS
>  	if [ ! -f $(TARGET_DIR)/usr/share/udhcpc/default.script ]; then \
>  		$(INSTALL) -m 0755 -D package/busybox/udhcpc.script \
>  			$(TARGET_DIR)/usr/share/udhcpc/default.script; \
> +		$(INSTALL) -m 755 -d \
> +			$(TARGET_DIR)/usr/share/udhcpc/default.script.d; \
>  	fi
>  	$(BUSYBOX_INSTALL_MDEV_SCRIPT)
>  	$(BUSYBOX_INSTALL_MDEV_CONF)
> diff --git a/package/busybox/udhcpc.script b/package/busybox/udhcpc.script
> index e23d1f1..50c52e6 100755
> --- a/package/busybox/udhcpc.script
> +++ b/package/busybox/udhcpc.script
> @@ -64,4 +64,10 @@ case "$1" in
>  		;;
>  esac
>  
> +HOOK_DIR="$0.d"
> +for hook in "${HOOK_DIR}/"*; do
> +    [ -f "${hook}" -a -x "${hook}" ] || continue
> +    "${hook}" "${@}"
> +done
> +
>  exit 0
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
