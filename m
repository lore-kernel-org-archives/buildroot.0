From: Carlos Santos <unixmania@gmail.com>
Date: Mon, 28 Oct 2019 15:37:56 -0300
Subject: [Buildroot] [PATCH v2 1/1] package/collectd: add init script
 for SysV
In-Reply-To: <20191026071905.23036-1-asafka7@gmail.com>
References: <20191026071905.23036-1-asafka7@gmail.com>
Message-ID: <CAJ4jsaeEguGkW8BbT4oY-1mVQp5R5eQOcNZW=HbegVUpCq6QPA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Oct 26, 2019 at 4:19 AM Asaf Kahlon <asafka7@gmail.com> wrote:
>
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
> v1->v2: use start-stop-daemon
> ---
>  package/collectd/S90collectd | 36 ++++++++++++++++++++++++++++++++++++
>  package/collectd/collectd.mk |  5 +++++
>  2 files changed, 41 insertions(+)
>  create mode 100644 package/collectd/S90collectd
>
> diff --git a/package/collectd/S90collectd b/package/collectd/S90collectd
> new file mode 100644
> index 0000000000..3c5af17674
> --- /dev/null
> +++ b/package/collectd/S90collectd
> @@ -0,0 +1,36 @@
> +#!/bin/sh
> +
> +DAEMON="collectd"
EXEC="/usr/sbin/$DAEMON"
> +PIDFILE="/var/run/$DAEMON.pid"
> +

Leave room to user customizations

COLLECTD_ARGS=""

# shellcheck source=/dev/null
[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"

> +start() {
> +       printf "Starting collectd... "
> +       start-stop-daemon -b -m -S -q -p $PIDFILE -x "/usr/sbin/$DAEMON"

The -b and -m are not necessary here, since collectd daemonizes by
default. The only reason why it "works" is because collectd takes a
few milliseconds to daemonize and override the /var/run/collectd.pid
that was written by start-stop-daemon. Replacing $PIDFILE by
$PIDFILE.x in the line above will show the truth:

# /etc/init.d/S90collectd stop
Stopping collectd... OK
# /etc/init.d/S90collectd start
Starting collectd... OK
# pidof collectd
161
# ls -ltr /var/run/collectd.pid*
-rw-r--r--    1 root     root             4 Oct 28 18:15
/var/run/collectd.pid.x <<-- written by start-stop-daemon
-rw-r--r--    1 root     root             4 Oct 28 18:15
/var/run/collectd.pid <<-- written by collectd
==> /var/run/collectd.pid <==
161 <<-- daemonized correctd

==> /var/run/collectd.pid.x <==
160 <<-- initial collectd process


> +       [ $? = 0 ] && echo "OK" || echo "FAIL"]

This leads the function to result the result of the "echo" command on
failure, which will be zero. Use this construction, instead

start() {
    printf 'Starting %s: ' "$DAEMON"
    # shellcheck disable=SC2086 # we need the word splitting
    start-stop-daemon -S -q -p "$PIDFILE" -x "$EXEC" \
        -- $COLLECTD_ARGS
    status=$?
    if [ "$status" -eq 0 ]; then
        echo "OK"
    else
        echo "FAIL"
    fi
    return "$status"
}

> +}
> +stop() {
> +       printf "Stopping collectd... "
> +       start-stop-daemon -K -q -p $PIDFILE
> +       [ $? = 0 ] && echo "OK" || echo "FAIL"
> +}

Leave a blank line between each function to improve readability

> +restart() {
> +       stop

Put a one-second pause here, giving time for the daemon to stop.

> +       start
> +}
> +
> +case "$1" in
> +  start)
> +       start
> +       ;;
> +  stop)
> +       stop
> +       ;;
> +  restart|reload)
> +       restart
> +       ;;
> +  *)
> +       echo "Usage: $0 {start|stop|restart}"
> +       exit 1
> +esac

case "$1" in
    start|stop|restart)
        "$1";;
    reload)
        restart;;
    *)
        echo "Usage: $0 {start|stop|restart|reload}"
        exit 1
esac

> +exit $?

This is not required. A Shell script exit status is by default the the
same one of the last command.

> diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
> index 5d94dec46d..1bce196e7e 100644
> --- a/package/collectd/collectd.mk
> +++ b/package/collectd/collectd.mk
> @@ -218,4 +218,9 @@ define COLLECTD_INSTALL_INIT_SYSTEMD
>                 $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/collectd.service
>  endef
>
> +define COLLECTD_INSTALL_INIT_SYSV
> +       $(INSTALL) -D -m 0755 package/collectd/S90collectd \
> +               $(TARGET_DIR)/etc/init.d/S90collectd
> +endef
> +
>  $(eval $(autotools-package))
> --
> 2.20.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Refer to package/sysklogd/S01syslogd  and package/acpid/S02acpid for examples.

-- 
Carlos Santos <unixmania@gmail.com>
