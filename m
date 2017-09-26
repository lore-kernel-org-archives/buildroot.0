From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Tue, 26 Sep 2017 12:00:37 +0200
Subject: [Buildroot] [PATCH 1/1] nginx (S50nginx): Fix stop, reload,
 restart. Add force-reload.
In-Reply-To: <20170925132029.17356-1-thomas.claveirole@green-communications.fr>
References: <20170925132029.17356-1-thomas.claveirole@green-communications.fr>
Message-ID: <CAJtjsKaAp3kekLZiPCOUF9gp3nARRWdRLBwUhFvQGGvny1hxuw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, Sep 25, 2017 at 3:20 PM, Thomas Claveirole
<thomas.claveirole@green-communications.fr> wrote:
> Fix package/nginx/S50nginx:
>
> * On stop, use start-stop-daemon -R 1 to wait for the nginx processes
>   to actually stop.  This fixes a race condition with restart, where
>   nginx fails to restart because start is called too early
>   w.r.t. stop.  (This only works with Debian's start-stop-daemon,
>   however BusyBox's start-stop-daemon does not fail when given -R; it
>   just ignores the argument silently).
>
> * Implement reload with an actual reload instead of a restart.
>
> * Add force-reload.
>
> Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
> ---
>  package/nginx/S50nginx | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
>
> diff --git a/package/nginx/S50nginx b/package/nginx/S50nginx
> index b2f8b80855..a854c651d1 100755
> --- a/package/nginx/S50nginx
> +++ b/package/nginx/S50nginx
> @@ -3,23 +3,31 @@
>  # Start/stop nginx
>  #
>
> +NGINX=/usr/sbin/nginx
>  PIDFILE=/var/run/nginx.pid
>
>  case "$1" in
>    start)
>         echo "Starting nginx..."
>         mkdir -p /var/log/nginx /var/tmp/nginx
> -       start-stop-daemon -S -x /usr/sbin/nginx -p $PIDFILE
> +       start-stop-daemon -S -x "$NGINX" -p "$PIDFILE"
>         ;;
>    stop)
> -       printf "Stopping nginx..."
> -       start-stop-daemon -K -o -p $PIDFILE
> +       echo "Stopping nginx..."
> +       # Use -R 1 to wait for nginx to actually stop.  Useful so
> +       # restart has no race condition.  Note that BusyBox knows
> +       # about -R but ignores it silently.
> +       start-stop-daemon -K -x "$NGINX" -p "$PIDFILE" -R 1 -o
>         ;;
> -  restart|reload)
> +  reload|force-reload)
> +       echo "Reloading nginx configuration..."
> +       "$NGINX" -s reload
> +       ;;
> +  restart)
>         "$0" stop
>         "$0" start
>         ;;
>    *)
> -       echo "Usage: $0 {start|stop|restart}"
> +       echo "Usage: $0 {start|stop|restart|reload|force-reload}"
>         exit 1
>  esac
> --
> 2.14.1

I've added the maintainer of nginx (Samuel Martin) in CC, as reported
by get-developers.
Otherwise, this patch looks good to me.
Best,
-- 
Johan
