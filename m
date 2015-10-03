From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 3 Oct 2015 14:51:03 +0100
Subject: [Buildroot] [PATCH] package/skeleton: add a startup script to
 wait for slow network interfaces
In-Reply-To: <1443879105-3036-1-git-send-email-yann.morin.1998@free.fr>
References: <1443879105-3036-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <560FDD47.6090707@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03-10-15 14:31, Yann E. MORIN wrote:
> On some machines, the network interface is slow to appear. For example,
> on the Raspberry Pi, the network interface eth0 is an ethernet-over-USB,
> and our standard boot process is too fast, so our network startup script
> is called before the USB bus is compeltely enumerated, thus it can't
> configure eth0.
> 
> If Buildroot is configured to do a DHCP on an interface, install a
> startup script, just before S40network, that waits for that interface.
> 
> Since Buildroot can only be configured to run DHCP on a single interface,
> we do not need a script that waits for more than one interface.
> 
> Closes #8116.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/skeleton/S39wait-for-network-if | 43 +++++++++++++++++++++++++++++++++

 Argh, you're adding an init script to skeleton! That's evil(TM)! :-)

 Seriously, this should be part of package/initscripts/init.d/S40network instead.

>  package/skeleton/skeleton.mk            |  2 ++
>  2 files changed, 45 insertions(+)
>  create mode 100644 package/skeleton/S39wait-for-network-if
> 
> diff --git a/package/skeleton/S39wait-for-network-if b/package/skeleton/S39wait-for-network-if
> new file mode 100644
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

 I believe the ; are redundant when you use -e (at least that's what we do in
other cases).

> +                 -e '/^auto (.+)$/!d;' \
> +                 -e 's//\1/;' \

 This one got me looking at the sed man page and I'm still surprised that it
works. Basically, this s command is reusing the same address as given on the
previous line, but without the ! modifier, right?


 Regards,
 Arnout

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
> diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
> index 48e7085..733b86f 100644
> --- a/package/skeleton/skeleton.mk
> +++ b/package/skeleton/skeleton.mk
> @@ -76,6 +76,8 @@ define SET_NETWORK_DHCP
>  		echo "auto $(NETWORK_DHCP_IFACE)";                   \
>  		echo "iface $(NETWORK_DHCP_IFACE) inet dhcp";        \
>  	) >> $(TARGET_DIR)/etc/network/interfaces
> +	$(INSTALL) -D -m 0755 package/skeleton/S39wait-for-network-if \
> +		$(TARGET_DIR)/etc/init.d/S39wait-for-network-if
>  endef
>  endif
>  
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
