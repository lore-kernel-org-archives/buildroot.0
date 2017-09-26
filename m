From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 27 Sep 2017 00:26:20 +0200
Subject: [Buildroot] [PATCH] radvd: improve startup script
In-Reply-To: <1506333475-4759-1-git-send-email-casantos@datacom.ind.br>
References: <1506333475-4759-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <7d0f3151-bce7-8512-bae1-2c0d44717faf@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 25-09-17 11:57, Carlos Santos wrote:
> The previous script caused a failure if /etc/radvd.conf did not exist.

 That's a good thing, no? If you select radvd but forget to install a
configuration file, you'll want to have some kind of warning rather than
silently not starting it.

> 
> This is a simple copy/paste/edit of package/dnsmasq/S80dnsmasq.

 Perhaps not the best example...

> 
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> ---
>  package/radvd/S50radvd | 36 ++++++++++++++++++++++--------------
>  1 file changed, 22 insertions(+), 14 deletions(-)
> 
> diff --git a/package/radvd/S50radvd b/package/radvd/S50radvd
> index 9f1407c..dcc2af6 100755
> --- a/package/radvd/S50radvd
> +++ b/package/radvd/S50radvd
> @@ -1,18 +1,26 @@
>  #!/bin/sh
>  
> -RADVD=/usr/sbin/radvd
> +[ -x /usr/sbin/radvd ] || exit 0

 This we certainly don't want. If the executable is missing, we want to shout
loudly, not silently skip it.

> +[ -f /etc/radvd.conf ] || exit 0
>  
> -echo "1" > /proc/sys/net/ipv6/conf/all/forwarding

 Why remove this? It should of course move to the start stanza.

> +case "$1" in
> +	start)
> +		printf "Starting radvd: "
> +		start-stop-daemon -S -x /usr/sbin/radvd
> +		[ $? = 0 ] && echo "OK" || echo "FAI> +		;;
> +	stop)
> +		printf "Stopping radvd: "
> +		start-stop-daemon -K -q -x /usr/sbin/radvd
> +		[ $? = 0 ] && echo "OK" || echo "FAIL"
> +		;;
> +	restart|reload)
> +		$0 stop
> +		$0 start
> +		;;
> +	*)
> +		echo "Usage: $0 {start|stop|restart}"
> +		exit 1
> +esac

 This part looks good.

 Regards,
 Arnout

>  
> -printf "Starting radvd: "
> -if [ ! -x "${RADVD}" ]; then
> -	echo "missing"
> -	exit 1
> -fi
> -
> -if ${RADVD} ; then
> -	echo "done"
> -else
> -	echo "failed"
> -	exit 1
> -fi
> +exit 0
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
