From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 14 Nov 2014 23:47:40 +0100
Subject: [Buildroot] [PATCH 1/1] package/dnsmasq: cleanup run-time files
 in init script
In-Reply-To: <1416000618-32273-1-git-send-email-jkrause@posteo.de>
References: <1416000618-32273-1-git-send-email-jkrause@posteo.de>
Message-ID: <5466868C.9040108@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14/11/14 22:30, J?rg Krause wrote:
> dnsmasq does not clean its run-times its run-time files after stopping with
> /etc/init.d/S80dnsmasq stop. Do this manually.
> 
> Signed-off-by: J?rg Krause <jkrause@posteo.de>
> ---
>  package/dnsmasq/S80dnsmasq | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/dnsmasq/S80dnsmasq b/package/dnsmasq/S80dnsmasq
> index 587751e..b29fff4 100755
> --- a/package/dnsmasq/S80dnsmasq
> +++ b/package/dnsmasq/S80dnsmasq
> @@ -13,6 +13,9 @@ case "$1" in
>  		echo -n "Stopping dnsmasq: "
>  		start-stop-daemon -K -q -x /usr/sbin/dnsmasq
>  		[ $? = 0 ] && echo "OK" || echo "FAIL"
> +		# dnsmasq does not clean its run-time files
> +		rm -f /var/run/dnsmasq.pid
> +		rm -f /var/run/dnsmasq.leases

 The leases file is read again by dnsmasq when it starts, so it can give the
same addresses. So it shouldn't be removed. In fact, in my setup I even put the
leases file in persistent storage.


 Regards,
 Arnout

>  		;;
>  	restart|reload)
>  		$0 stop
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
