From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 5 Nov 2018 07:57:03 -0600
Subject: [Buildroot] [PATCH v4 1/4] busybox: rewrite logging init script
In-Reply-To: <20181103182427.11738-2-casantos@datacom.com.br>
References: <20181103182427.11738-1-casantos@datacom.com.br>
 <20181103182427.11738-2-casantos@datacom.com.br>
Message-ID: <CANQCQpbwfJLYkXZhp6jK4TGFT87PTZe7haPof-WQsjpFckxe=Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos,

On Sat, Nov 3, 2018 at 1:24 PM Carlos Santos <casantos@datacom.com.br> wrote:
>
> - Split S01logging into S01syslogd and S02klogd. Install them only if no
>   other syslog package is selected and the corresponding daemons are
>   selected in the Busybox configuration.
> - Support /etc/default/$DAEMON configuration files.
> - Detect and report start/stop errors (previous version ignored them and
>   always reported OK).
> - Use a separate function for restart.
> - Implement reload as restart.
>
> Signed-off-by: Carlos Santos <casantos@datacom.com.br>
> ---
> Changes v1->v2
> - Implement suggestions made by Nicolas Cavallari and Arnout Vandecappelle
> Changes v2->v3
> - None, just series update
> Changes v3-v4
> - Follow the decisions taken at the Buildroot meeting.
> - Leave the daemon args themselves on a separate line, as suggested by Arnout
>   Vandecappelle.
> - Drop Matt Weber's Reviewed-by, since there were too many changes since then.
> - Use a less fancy commit message :-)
> ---
>  package/busybox/S01logging | 40 ---------------------------
>  package/busybox/S01syslogd | 56 ++++++++++++++++++++++++++++++++++++++
>  package/busybox/S02klogd   | 56 ++++++++++++++++++++++++++++++++++++++
>  package/busybox/busybox.mk | 19 +++++++------
>  4 files changed, 123 insertions(+), 48 deletions(-)
>  delete mode 100644 package/busybox/S01logging
>  create mode 100644 package/busybox/S01syslogd
>  create mode 100644 package/busybox/S02klogd
>
> diff --git a/package/busybox/S01logging b/package/busybox/S01logging
> deleted file mode 100644
> index fcb3e7d236..0000000000
> --- a/package/busybox/S01logging
> +++ /dev/null

I can see this naming change will cause a number of people to end up
debugging their targets as a custom S01logging will be copied over and
then the installs of the new files with different names below.  Is
there any thoughts on making this a visible or obvious change so users
don't get caught up?


> @@ -1,40 +0,0 @@
> -#!/bin/sh
> -#
> -# Start logging
> -#
> -
> -SYSLOGD_ARGS=-n
> -KLOGD_ARGS=-n
> -[ -r /etc/default/logging ] && . /etc/default/logging
> -
> -start() {
> -       printf "Starting logging: "
> -       start-stop-daemon -b -S -q -m -p /var/run/syslogd.pid --exec /sbin/syslogd -- $SYSLOGD_ARGS
> -       start-stop-daemon -b -S -q -m -p /var/run/klogd.pid --exec /sbin/klogd -- $KLOGD_ARGS
> -       echo "OK"
> -}
> -
> -stop() {
> -       printf "Stopping logging: "
> -       start-stop-daemon -K -q -p /var/run/syslogd.pid
> -       start-stop-daemon -K -q -p /var/run/klogd.pid
> -       echo "OK"
> -}
> -
> -case "$1" in
> -  start)
> -       start
> -       ;;
> -  stop)
> -       stop
> -       ;;
> -  restart|reload)
> -       stop
> -       start
> -       ;;
> -  *)
> -       echo "Usage: $0 {start|stop|restart|reload}"
> -       exit 1
> -esac
> -
> -exit $?
> diff --git a/package/busybox/S01syslogd b/package/busybox/S01syslogd
> new file mode 100644
> index 0000000000..66bc4e609b
> --- /dev/null
> +++ b/package/busybox/S01syslogd
> @@ -0,0 +1,56 @@
> +#!/bin/sh
> +
> +DAEMON="syslogd"
> +PIDFILE="/var/run/$DAEMON.pid"
> +
> +SYSLOGD_ARGS=""
> +
> +# shellcheck source=/dev/null
> +[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
> +
> +# BusyBox' syslogd and klogd do not create pidfiles, so use "-m" to instruct
> +# start-stop-daemon to create them. This also means that we must pass "-n" to
> +# sylogd and klogd in the command line.

sylogd -> syslogd

Since this script only handles syslogd now, assuming maybe the text
should only reference that daemon? (nit)

> +start() {
> +       printf 'Starting %s: ' "$DAEMON"
> +       # shellcheck disable=SC2086 # we need the word splitting
> +       start-stop-daemon -b -m -S -q -p "$PIDFILE" -x "/sbin/$DAEMON" \
> +               -- -n $SYSLOGD_ARGS
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
> +
> +case "$1" in
> +        start|stop|restart)
> +               "$1";;
> +       reload)
> +               # Restart, since there is no true "reload" feature.
> +               restart;;
> +        *)
> +                echo "Usage: $0 {start|stop|restart|reload}"
> +                exit 1
> +esac
> diff --git a/package/busybox/S02klogd b/package/busybox/S02klogd
> new file mode 100644
> index 0000000000..1d2684148a
> --- /dev/null
> +++ b/package/busybox/S02klogd
> @@ -0,0 +1,56 @@
> +#!/bin/sh
> +
> +DAEMON="klogd"
> +PIDFILE="/var/run/$DAEMON.pid"
> +
> +KLOGD_ARGS=""
> +
> +# shellcheck source=/dev/null
> +[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
> +
> +# BusyBox' syslogd and klogd do not create pidfiles, so use "-m" to instruct
> +# start-stop-daemon to create them. This also means that we must pass "-n" to
> +# sylogd and klogd in the command line.

Same spelling and nit mentioned above.

> +start() {
> +       printf 'Starting %s: ' "$DAEMON"
> +       # shellcheck disable=SC2086 # we need the word splitting
> +       start-stop-daemon -b -m -S -q -p "$PIDFILE" -x "/sbin/$DAEMON" \
> +               -- -n $KLOGD_ARGS
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

What's the impact of someone restarting syslogd without stoping klogd first?

> +       stop
> +       sleep 1
> +       start
> +}
> +
> +case "$1" in
> +        start|stop|restart)
> +               "$1";;
> +       reload)
> +               # Restart, since there is no true "reload" feature.
> +               restart;;
> +        *)
> +                echo "Usage: $0 {start|stop|restart|reload}"
> +                exit 1
> +esac
> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> index 757086592f..028ca1905c 100644
> --- a/package/busybox/busybox.mk
> +++ b/package/busybox/busybox.mk
> @@ -55,10 +55,7 @@ BUSYBOX_DEPENDENCIES = \
>         $(if $(BR2_PACKAGE_PCIUTILS),pciutils) \
>         $(if $(BR2_PACKAGE_PROCPS_NG),procps-ng) \
>         $(if $(BR2_PACKAGE_PSMISC),psmisc) \
> -       $(if $(BR2_PACKAGE_RSYSLOGD),rsyslog) \
>         $(if $(BR2_PACKAGE_START_STOP_DAEMON),start-stop-daemon) \
> -       $(if $(BR2_PACKAGE_SYSKLOGD),sysklogd) \
> -       $(if $(BR2_PACKAGE_SYSLOG_NG),syslog-ng) \
>         $(if $(BR2_PACKAGE_SYSTEMD),systemd) \
>         $(if $(BR2_PACKAGE_SYSVINIT),sysvinit) \
>         $(if $(BR2_PACKAGE_TAR),tar) \
> @@ -245,15 +242,21 @@ define BUSYBOX_INSTALL_INDIVIDUAL_BINARIES
>  endef
>  endif
>
> -# Only install our own if no other package already did.
> +# Only install our logging scripts if no other package does it.
> +ifeq ($(BR2_PACKAGE_SYSKLOGD)$(BR2_PACKAGE_RSYSLOG)$(BR2_PACKAGE_SYSLOG_NG),)
>  define BUSYBOX_INSTALL_LOGGING_SCRIPT
> -       if grep -q CONFIG_SYSLOGD=y $(@D)/.config && \
> -               [ ! -e $(TARGET_DIR)/etc/init.d/S01logging ]; \
> +       if grep -q CONFIG_SYSLOGD=y $(@D)/.config; \
>         then \
> -               $(INSTALL) -m 0755 -D package/busybox/S01logging \
> -                       $(TARGET_DIR)/etc/init.d/S01logging; \
> +               $(INSTALL) -m 0755 -D package/busybox/S01syslogd \
> +                       $(TARGET_DIR)/etc/init.d/S01syslogd; \
> +       fi; \
> +       if grep -q CONFIG_KLOGD=y $(@D)/.config; \
> +       then \
> +               $(INSTALL) -m 0755 -D package/busybox/S02klogd \
> +                       $(TARGET_DIR)/etc/init.d/S02klogd; \
>         fi
>  endef
> +endif
>
>  ifeq ($(BR2_INIT_BUSYBOX),y)
>  define BUSYBOX_INSTALL_INITTAB
> --
> 2.17.1
>

Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
