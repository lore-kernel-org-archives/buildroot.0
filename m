From: Carlos Santos <unixmania@gmail.com>
Date: Wed, 6 Nov 2019 07:48:43 -0300
Subject: [Buildroot] [PATCH 1/1] package/ntp: base sysv script on
 current template
In-Reply-To: <1572956651-8140-1-git-send-email-simon.rowe@citrix.com>
References: <1572956651-8140-1-git-send-email-simon.rowe@citrix.com>
Message-ID: <CAJ4jsacvSRbDTncHiyytpaZbQFQPJpqegwcewO6dcLrMpQZcyg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Nov 5, 2019 at 9:24 AM Simon Rowe <simon.rowe@citrix.com> wrote:
>
> Signed-off-by: Simon Rowe <simon.rowe@citrix.com>
> ---
>  package/ntp/S49ntp | 80 ++++++++++++++++++++++++++++++++++--------------------
>  1 file changed, 51 insertions(+), 29 deletions(-)
>
> diff --git a/package/ntp/S49ntp b/package/ntp/S49ntp
> index 35e5874..66c5f70 100644
> --- a/package/ntp/S49ntp
> +++ b/package/ntp/S49ntp
> @@ -1,34 +1,56 @@
> -#! /bin/sh
> +#!/bin/sh
> +#
> +# Starts Network Time Protocol daemon
> +#
>
> -NAME=ntpd
> +DAEMON="ntpd"
> +PIDFILE="/var/run/$DAEMON.pid"
>
> -# Read config file if it is present.
> -if [ -r /etc/default/$NAME ]
> -then
> -  . /etc/default/$NAME
> -fi
> +NTPD_ARGS="-g"
> +
> +# shellcheck source=/dev/null
> +[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
> +
> +start() {
> +       printf 'Starting %s: ' "$DAEMON"
> +       # shellcheck disable=SC2086 # we need the word splitting
> +       start-stop-daemon -S -q -p "$PIDFILE" -x "/usr/sbin/$DAEMON" \
> +               -- $NTPD_ARGS -p "$PIDFILE"
> +       status=$?
> +       if [ "$status" -eq 0 ]; then
> +               echo "OK"
> +       else
> +               echo "FAIL"
> +       fi
> +       return "$status"
> +}
> +
> +stop() {
> +       printf 'Stopping %s: ' "$DAEMON"
> +       start-stop-daemon -K -q -p "$PIDFILE"
> +       status=$?
> +       if [ "$status" -eq 0 ]; then
> +               rm -f "$PIDFILE"
> +               echo "OK"
> +       else
> +               echo "FAIL"
> +       fi
> +       return "$status"
> +}
> +
> +restart() {
> +       stop
> +       sleep 1
> +       start
> +}
>
>  case "$1" in
> -  start)
> -    printf "Starting $NAME: "
> -    start-stop-daemon -S -q -x /usr/sbin/ntpd -- -g
> -    [ $? = 0 ] && echo "OK" || echo "FAIL"
> -    ;;
> -  stop)
> -    printf "Stopping $NAME: "
> -    start-stop-daemon -K -q -n $NAME
> -    [ $? = 0 ] && echo "OK" || echo "FAIL"
> -    ;;
> -  restart|reload)
> -    echo "Restarting $NAME: "
> -    $0 stop
> -    sleep 1
> -    $0 start
> -    ;;
> -  *)
> -    echo "Usage: $0 {start|stop|restart|reload}" >&2
> -    exit 1
> -    ;;
> +       start|stop|restart)
> +               "$1";;
> +       reload)
> +               # Restart, since there is no true "reload" feature.
> +               restart;;
> +       *)
> +               echo "Usage: $0 {start|stop|restart|reload}"
> +               exit 1
>  esac
> -
> -exit 0
> --
> 1.8.3.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Tested-by: Carlos Santos <unixmania@gmail.com>
