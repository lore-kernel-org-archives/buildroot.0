From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 29 Oct 2015 21:22:31 +0100
Subject: [Buildroot] [PATCH v3 1/2] Revert "package/initscripts:
 S40network: wait for network interfaces to appear"
In-Reply-To: <1446109218-11057-2-git-send-email-jezz@sysmic.org>
References: <1446109218-11057-1-git-send-email-jezz@sysmic.org>
 <1446109218-11057-2-git-send-email-jezz@sysmic.org>
Message-ID: <20151029202231.GB3600@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?me, All,

On 2015-10-29 10:00 +0100, J?r?me Pouiller spake thusly:
> This reverts commit 49964858f45d2243c513e6d362e992ad89ec7a45. It is
> going to be replaced with an ifup hook in next patch.
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

It's not very often I ACK a patch removing my own code! Hehe! :-)

Regards,
Yann E. MORIN.

> ---
>  package/initscripts/init.d/S40network | 29 -----------------------------
>  1 file changed, 29 deletions(-)
> 
> diff --git a/package/initscripts/init.d/S40network b/package/initscripts/init.d/S40network
> index a8d7c5d..7b11d8b 100755
> --- a/package/initscripts/init.d/S40network
> +++ b/package/initscripts/init.d/S40network
> @@ -6,37 +6,8 @@
>  # Debian ifupdown needs the /run/network lock directory
>  mkdir -p /run/network
>  
> -# In case we have a slow-to-appear interface (e.g. eth-over-USB),
> -# and we need to configure it, wait until it appears, but not too
> -# long either. WAIT_DELAY is in seconds.
> -WAIT_DELAY=15
> -
> -wait_for_interfaces() {
> -	IFACES=$(awk '/^auto/ { print $2 }' /etc/network/interfaces)
> -	[ -n "$IFACES" ] || return
> -
> -	printf "Waiting for network interfaces to appear"
> -
> -	for i in $(seq $WAIT_DELAY); do
> -	    for IFACE in $IFACES; do
> -		if [ ! -e "/sys/class/net/$IFACE" ]; then
> -		    printf "."
> -		    sleep 1
> -		    continue 2
> -		fi
> -	    done
> -
> -	    printf " ok\n"; return
> -	done
> -
> -	printf " timeout\n"
> -	exit 1
> -}
> -
>  case "$1" in
>    start)
> -	wait_for_interfaces
> -
>   	echo "Starting network..."
>  	/sbin/ifup -a
>  	;;
> -- 
> 2.1.4
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
