From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Dec 2018 23:50:40 +0100
Subject: [Buildroot] [PATCH v5 1/4] busybox: rewrite logging init script
In-Reply-To: <20181107004912.13349-2-casantos@datacom.com.br>
References: <20181107004912.13349-1-casantos@datacom.com.br>
 <20181107004912.13349-2-casantos@datacom.com.br>
Message-ID: <1c1b203d-476b-0d4b-7df4-0e5995f0f142@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07/11/2018 01:49, Carlos Santos wrote:
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
> Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>

 I've finally applied the series to master since there wer no further remarks.

 For this specific patch, I've added the following to the commit message:

    The dependency of busybox on rsyslog and syslog-ng was only needed
    because those packages also installed S01logging. Since now they no
    longer install the same file, these dependencies are no longer needed.
    The dependency on sysklogd is still needed since that one installs the
    syslogd and klogd executables with the same name as busybox.

    The -n option of syslogd/klogd is obligatory because start-stop-daemon
    starts it in the background. Therefore, move it out of the
    SYSLOGD_ARGS resp. KLOGD_ARGS variable so the user can no longer remove
    it.

 And I've made the modification mentioned below.

 I do have a few more comments on the formatting of the start scripts. However,
these are more of the bikeshedding nature, and the current state is definitely
progress, that's why I've applied.

[snip]
> diff --git a/package/busybox/S01syslogd b/package/busybox/S01syslogd
> new file mode 100644
> index 0000000000..6e642a678a
> --- /dev/null
> +++ b/package/busybox/S01syslogd
> @@ -0,0 +1,55 @@
> +#!/bin/sh
> +
> +DAEMON="syslogd"
> +PIDFILE="/var/run/$DAEMON.pid"
> +
> +SYSLOGD_ARGS=""> +
> +# shellcheck source=/dev/null
> +[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
> +
> +# BusyBox' syslogd does not create a pidfile, so pass "-n" in the command line
> +# and use "-m" to instruct start-stop-daemon to create one.
> +start() {
> +	printf 'Starting %s: ' "$DAEMON"
> +	# shellcheck disable=SC2086 # we need the word splitting
> +	start-stop-daemon -b -m -S -q -p "$PIDFILE" -x "/sbin/$DAEMON" \

 I think we can do better in the ordering of the options: first -S/-K, then the
identification options (-p, -x), then the other options that are common between
start and stop (-q), and finally the start-specific options (-b -m).

 Note that I'm *really* bikeshedding here :-)

> +		-- -n $SYSLOGD_ARGS
> +	status=$?
> +	if [ "$status" -eq 0 ]; then
> +		echo "OK"
> +	else
> +		echo "FAIL"
> +	fi
> +	return "$status"

 I find this handling of $status overly verbose, but unfortunately there is no
better way to do it.

> +}
> +
> +stop() {
> +	printf 'Stopping %s: ' "$DAEMON"
> +	start-stop-daemon -K -q -p "$PIDFILE"

 I think it would be better to add the -x option here as well. Particularly when
doing 'restart', it's possible that the daemon already had stopped (e.g. had
crashed) and that the PID is reused by a different process. -x certainly doesn't
hurt.

> +	status=$?
> +	if [ "$status" -eq 0 ]; then
> +		rm -f "$PIDFILE"
> +		echo "OK"
> +	else
> +		echo "FAIL"
> +	fi
> +	return "$status"
> +}

 Since the start and stop are so similar, I was thinking about factoring them in
a single function (which, BTW, would be boilerplate that would be shared between
all init scripts, so could possibly be moved to a separate file).

start_stop() {
        start-stop-daemon -q -p "$PIDFILE" -x "$EXE" "$@"
        status=$?
        if [ "$status" -eq 0 ]; then
                echo "OK"
        else
                echo "FAIL"
        fi
        return "$status"
}

 However, I'm not so sure if it's worth doing that change.


 So, the only somewhat important remark is that I think the stop() (and reload()
if it uses start-stop-daemon) should use -x as well.

> +
> +restart() {
> +	stop
> +	sleep 1
> +	start
> +}
> +
> +case "$1" in
> +        start|stop|restart)
> +		"$1";;
> +	reload)
> +		# Restart, since there is no true "reload" feature.
> +		restart;;
> +        *)
> +                echo "Usage: $0 {start|stop|restart|reload}"
> +                exit 1
> +esac
[snip]
> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> index 757086592f..028ca1905c 100644
> --- a/package/busybox/busybox.mk
> +++ b/package/busybox/busybox.mk
> @@ -55,10 +55,7 @@ BUSYBOX_DEPENDENCIES = \
>  	$(if $(BR2_PACKAGE_PCIUTILS),pciutils) \
>  	$(if $(BR2_PACKAGE_PROCPS_NG),procps-ng) \
>  	$(if $(BR2_PACKAGE_PSMISC),psmisc) \
> -	$(if $(BR2_PACKAGE_RSYSLOGD),rsyslog) \
>  	$(if $(BR2_PACKAGE_START_STOP_DAEMON),start-stop-daemon) \
> -	$(if $(BR2_PACKAGE_SYSKLOGD),sysklogd) \

 So as mentioned in the commit log, this one I didn't remove because it's still
needed for the overlapping /sbin/syslog and /sbin/klog binaries.

 Regards,
 Arnout

> -	$(if $(BR2_PACKAGE_SYSLOG_NG),syslog-ng) \
>  	$(if $(BR2_PACKAGE_SYSTEMD),systemd) \
>  	$(if $(BR2_PACKAGE_SYSVINIT),sysvinit) \
>  	$(if $(BR2_PACKAGE_TAR),tar) \
[snip]
