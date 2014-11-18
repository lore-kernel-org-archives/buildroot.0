From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 Nov 2014 23:50:16 +0100
Subject: [Buildroot] [PATCH 1/1] package/shairport-sync: fix init script
In-Reply-To: <1415833586-6181-1-git-send-email-jkrause@posteo.de>
References: <1415833586-6181-1-git-send-email-jkrause@posteo.de>
Message-ID: <20141118225016.GV4333@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?rg, All,

On 2014-11-13 00:06 +0100, J?rg Krause spake thusly:
> shairport-sync uses libdaemon for running as daemon and creating the pidfile
> which conflicts with start-stop-daemons `-b -m` options. For that reason 
> shairport-sync does not start using /etc/init.d/S99shairport-sync start.
> 
> The issue is fixed by removing the background and pidfile task from
> start-stop-daemon and add a daemon option `-d` to shairport-sync.
> 
> Signed-off-by: J?rg Krause <jkrause@posteo.de>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/shairport-sync/S99shairport-sync | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/shairport-sync/S99shairport-sync b/package/shairport-sync/S99shairport-sync
> index 31359fc..54d20ff 100644
> --- a/package/shairport-sync/S99shairport-sync
> +++ b/package/shairport-sync/S99shairport-sync
> @@ -1,12 +1,12 @@
>  #! /bin/sh
>  
>  # Additional options that are passed to Shairport Sync
> -OPTIONS=""
> +OPTIONS="-d"
>  
>  case "$1" in
>      start)
>  	echo -n "Starting shairport-sync: "
> -	start-stop-daemon -S -q -m -b -p /var/run/shairport-sync.pid --exec /usr/bin/shairport-sync -- $OPTIONS
> +	start-stop-daemon -S -q -p /var/run/shairport-sync.pid --exec /usr/bin/shairport-sync -- $OPTIONS
>  	[ $? = 0 ] && echo "OK" || echo "FAIL"
>  	;;
>      stop)
> -- 
> 2.1.3
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
