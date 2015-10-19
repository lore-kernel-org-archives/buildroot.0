From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Mon, 19 Oct 2015 10:47:10 +0200
Subject: [Buildroot] [PATCH] package/skeleton: add a startup script to
	wait for slow network interfaces
In-Reply-To: <1443879105-3036-1-git-send-email-yann.morin.1998@free.fr>
References: <1443879105-3036-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <4678408.ifdbXGka0U@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

On Saturday 03 October 2015 14:31:45 Yann E. MORIN wrote:
> On some machines, the network interface is slow to appear. For
> example, on the Raspberry Pi, the network interface eth0 is an
> ethernet-over-USB, and our standard boot process is too fast, so our
> network startup script is called before the USB bus is compeltely
> enumerated, thus it can't configure eth0.
> 
> If Buildroot is configured to do a DHCP on an interface, install a
> startup script, just before S40network, that waits for that interface.
> 
> Since Buildroot can only be configured to run DHCP on a single
> interface, we do not need a script that waits for more than one
> interface.
> 
> Closes #8116.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/skeleton/S39wait-for-network-if | 43
> +++++++++++++++++++++++++++++++++ package/skeleton/skeleton.mk       
>     |  2 ++
>  2 files changed, 45 insertions(+)
>  create mode 100644 package/skeleton/S39wait-for-network-if
> 
> diff --git a/package/skeleton/S39wait-for-network-if
> b/package/skeleton/S39wait-for-network-if new file mode 100644
> index 0000000..010026e
> --- /dev/null
> +++ b/package/skeleton/S39wait-for-network-if
> @@ -0,0 +1,43 @@
> +#!/bin/sh
> +
> +# In case we have a slow-to-appear interface (e.g. eth-over-USB),
> +# and we need to configure it, wait until it appears. But not too
> +# long either. WAIT_DELAY is in seconds.
> +WAIT_DELAY=15
> +
> +wait_for_IF() {
> +    IF="$(sed -r -e '/^auto lo/d;' \
> +                 -e '/^auto (.+)$/!d;' \
> +                 -e 's//\1/;' \
> +                 /etc/network/interfaces
> +         )"
> +    if [ -z "${IF}" -o -e "/sys/class/net/${IF}" ]; then
> +        return 0
> +    fi
> +    printf "Waiting for interface %s to appear" "${IF}"
> +    wait=${WAIT_DELAY}
> +    while [ ${wait} -gt 0 ]; do
> +        if [ -e "/sys/class/net/${IF}" ]; then
> +            printf " yes\n"
> +            return 0
> +        fi
> +        sleep 1
> +        printf "."
> +        : $((wait--))
> +    done
> +    printf " no.\n"
> +    return 1
> +}
> +
> +case "$1" in
> +  start)
> +	wait_for_IF
> +	;;
> +  stop)
> +	;;
> +  restart)
> +	"$0" start
> +	;;
> +  *)
> +	echo "Usage: $0 {start|stop|restart}"
> +esac
I am a bit late to do the review, but why not add a script in 
/etc/network/if-pre-up.d ? For example (notice $IFACE and $IF_MAXWAIT 
are set by ifupdown):

#! /bin/sh
if [ "${IF_MAXWAIT}" ]; then
    printf "Waiting for interface %s to appear" "${IFACE}"
    while [ ${IF_MAXWAIT} -gt 0 ]; do
        if [ -e "/sys/class/net/${IFACE}" ]; then
            printf " yes\n"
            exit 0
        fi
        sleep 1
        printf "."
        : $((wait--))
    done
    printf " no.\n"
    exit 1
fi

Next, interface would use "maxwait" property in /etc/network/interface:

auto eth0
iface eth0 inet dhcp
    maxwait 15

BR,

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
