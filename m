From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 4 Feb 2016 21:50:04 +0100
Subject: [Buildroot] [PATCH 1/1] Add config to nfsd to set number of
 threads
In-Reply-To: <56B30C5E.2020702@gmx.de>
References: <1450381505-3796-1-git-send-email-universeII@gmx.de>
 <20151217200424.GC3653@free.fr> <567317AE.5060006@gmx.de>
 <20151217202555.GE3653@free.fr> <56B30C5E.2020702@gmx.de>
Message-ID: <20160204205004.GB3468@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andreas, All,

On 2016-02-04 09:31 +0100, Andreas Ehmanns spake thusly:
> Dear Yann,
> please find below the rework of the nfsd init script.
> The changes are very small. Please note that a change from
> 
> kill -9 `pidof nfsd` 2>/dev/null
> 
> to killall was not possible since killall did not kill the nfsd threads. It
> simply did not work and I couldn't figure out the root cause.

What about using something like;
    rpc.nfsd 0
    killall -9 nfsd

From 'man rpc.nfsd':
    In particular rpc.nfsd 0 will stop all threads and thus close any
    open connections.

(maybe with a little sleep in-between the two calls to let things settle
down?)

Care to have a look, please?

> Let me know what you think about. If it's o.k. for you, I re-send the patch
> using git.

Well, it's already a nice improvement. ;-)

Please, consider the above suggestion. Adapt the script if required, and
respin with git, please.

Thanks! :-)

Regards,
Yann E. MORIN.

> From 13fa8728220cfe80b7ab3d48837183088f4094d5 Mon Sep 17 00:00:00 2001
> From: Andreas Ehmanns <universeII@gmx.de>
> Date: Thu, 4 Feb 2016 09:23:35 +0100
> Subject: [PATCH 1/1] Reordered kill, echo and pid file remove
> 
> Signed-off-by: Andreas Ehmanns <universeII@gmx.de>
> ---
>  package/nfs-utils/S60nfs | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/package/nfs-utils/S60nfs b/package/nfs-utils/S60nfs
> index 5639b8f..0bd5a44 100755
> --- a/package/nfs-utils/S60nfs
> +++ b/package/nfs-utils/S60nfs
> @@ -38,8 +38,8 @@ start() {
>  
>  	printf "Starting NFS mountd: "
>  	rpc.mountd
> -	echo "done"
>  	touch /var/lock/subsys/nfs
> +	echo "done"
>  }
>  
>  stop() {
> @@ -54,14 +54,15 @@ stop() {
>  
>  	printf "Shutting down NFS services: "
>  	/usr/sbin/exportfs -au
> -	rm -f /var/lock/subsys/nfs
>  	killall -q rpc.statd
> +	rm -f /var/lock/subsys/nfs
>  	echo "done"
>  
>  	printf "Stopping NFS statd: "
>  	killall -q rpc.statd
> -	echo "done"
> +	rm -f /var/run/rpc.statd.pid
>  	rm -f /var/lock/subsys/nfslock
> +	echo "done"
>  }
>  
>  # See how we were called.
> -- 
> 2.1.4
> 


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
