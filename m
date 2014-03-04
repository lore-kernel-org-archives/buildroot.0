From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 4 Mar 2014 21:01:14 +0100
Subject: [Buildroot] [RFC,
 PATCH 1/8] package/busybox: Add facility for DHCP hooks
In-Reply-To: <1389862338.917966.273409717366.1.gpush@pablo>
References: <1389862338.917573.283530987294.0.gpush@pablo>
 <1389862338.917966.273409717366.1.gpush@pablo>
Message-ID: <20140304200114.GD11474@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jeremy, All,

On 2014-01-16 16:52 +0800, Jeremy Kerr spake thusly:
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

I'm not against such a change, but there is a gotcha, see below...

[--SNIP--]
> diff --git a/package/busybox/udhcpc.script b/package/busybox/udhcpc.script
> index 43742fbd..8930d4a8 100755
> --- a/package/busybox/udhcpc.script
> +++ b/package/busybox/udhcpc.script
> @@ -63,4 +63,13 @@ case "$1" in
>  		;;
>  esac
>  
> +HOOK_DIR="$0.d"
> +if [ -d "$HOOK_DIR" ]
> +then
> +	for HOOK in $HOOK_DIR/*; do
> +		$HOOK "$@"

If the directory exists, but there is no hook, then HOOK will have the
value '${HOKK_DIR}/*', and this will result in a error.

You have to do something like:

    for hook in "${HOOK_DIR}/"*; do
        [ -f "${hook}" -a -x "${hook}" ] || continue
        "${hook}" "${@}"
    done

And then you do not need to protect with the if-block.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
