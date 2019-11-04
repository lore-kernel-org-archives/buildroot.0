From: Carlos Santos <unixmania@gmail.com>
Date: Sun, 3 Nov 2019 21:50:04 -0300
Subject: [Buildroot] [PATCH v3 1/1] package/collectd: add init script
 for SysV
In-Reply-To: <20191031202859.1058-1-asafka7@gmail.com>
References: <20191031202859.1058-1-asafka7@gmail.com>
Message-ID: <CAJ4jsadN0_a8YBHUC7yAFkhOyrOfYgA+KZG3x_9+AfSBvNCSpA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Oct 31, 2019 at 5:29 PM Asaf Kahlon <asafka7@gmail.com> wrote:
>
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
> v2->v3: fix Carlos comments.
> ---
>  package/collectd/S90collectd | 51 ++++++++++++++++++++++++++++++++++++
>  package/collectd/collectd.mk |  5 ++++
>  2 files changed, 56 insertions(+)
>  create mode 100644 package/collectd/S90collectd
>
> diff --git a/package/collectd/S90collectd b/package/collectd/S90collectd
> new file mode 100644
> index 0000000000..cf11c7b383
> --- /dev/null
> +++ b/package/collectd/S90collectd
> @@ -0,0 +1,51 @@
> +#!/bin/sh
> +
> +DAEMON="collectd"
> +EXEC="/usr/sbin/$DAEMON"
> +PIDFILE="/var/run/$DAEMON.pid"
> +COLLECTD_ARGS=""
> +
> +# shellcheck source=/dev/null
> +[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
> +
> +start() {
> +       printf 'Starting %s: ' "$DAEMON"
> +       # shellcheck disable=SC2086 # we need the word splitting
> +       start-stop-daemon -S -q -p "$PIDFILE" -x "$EXEC" \
> +               -- $COLLECTD_ARGS
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
> +
> +case "$1" in
> +       start|stop|restart)
> +               "$1";;
> +       reload)
> +               restart;;
> +       *)
> +               echo "Usage: $0 {start|stop|restart|reload}"
> +               exit 1
> +esac
> diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
> index 820547b511..9504b122d5 100644
> --- a/package/collectd/collectd.mk
> +++ b/package/collectd/collectd.mk
> @@ -234,4 +234,9 @@ define COLLECTD_INSTALL_INIT_SYSTEMD
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

Reviewed-by: Carlos Santos <unixmania@gmail.com>
Tested-by: Carlos Santos <unixmania@gmail.com>
