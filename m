From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 9 Mar 2016 00:16:12 +0100
Subject: [Buildroot] [PATCH] package/busybox: support automatic module
 loading with mdev
In-Reply-To: <1457478205-18515-1-git-send-email-peter@korsgaard.com>
References: <1457478205-18515-1-git-send-email-peter@korsgaard.com>
Message-ID: <20160308231612.GF14289@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2016-03-09 00:03 +0100, Peter Korsgaard spake thusly:
> A recently discussed on the mailing list:
> http://lists.busybox.net/pipermail/buildroot/2016-February/154189.html
> 
> Our mdev configuration currently doesn't handle module loading. Fix that by:
> 
> - Telling mdev to run modprobe on hotplug events providing MODALIAS
> 
> - Adjust the init script to handle coldplug modalias events (E.G. modules
>   for which the devices were already present before mdev was added as the
>   hotplug handler). mdev -s should arguable handle this, but it doesn't.
> 
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/busybox/S10mdev   | 2 ++
>  package/busybox/mdev.conf | 3 +++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/package/busybox/S10mdev b/package/busybox/S10mdev
> index d386d42..4cb31de 100644
> --- a/package/busybox/S10mdev
> +++ b/package/busybox/S10mdev
> @@ -8,6 +8,8 @@ case "$1" in
>  	echo "Starting mdev..."
>  	echo /sbin/mdev >/proc/sys/kernel/hotplug
>  	/sbin/mdev -s
> +	# coldplug modules
> +	find /sys/ -name modalias | xargs sort -u | xargs modprobe -abq
>  	;;
>    stop)
>  	;;
> diff --git a/package/busybox/mdev.conf b/package/busybox/mdev.conf
> index 247c0ed..4fafe63 100644
> --- a/package/busybox/mdev.conf
> +++ b/package/busybox/mdev.conf
> @@ -33,3 +33,6 @@ event[0-9]+	root:root 640 =input/
>  mice		root:root 640 =input/
>  mouse[0-9]	root:root 640 =input/
>  ts[0-9]		root:root 600 =input/
> +
> +# load modules
> +$MODALIAS=.*	root:root 660 @modprobe "$MODALIAS"
> -- 
> 2.7.0
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
