From: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
Date: Mon, 9 Jul 2018 10:03:37 +0200
Subject: [Buildroot] [PATCH 3/8] rsyslog: update S01logging
In-Reply-To: <20180709033134.22175-4-casantos@datacom.com.br>
References: <20180709033134.22175-1-casantos@datacom.com.br>
 <20180709033134.22175-4-casantos@datacom.com.br>
Message-ID: <bc1a7b00-5a50-8084-77ad-4429c856be3c@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On 09/07/2018 05:31, Carlos Santos wrote:
> --- a/package/rsyslog/S01logging
> +++ b/package/rsyslog/S01logging
> @@ -1,36 +1,64 @@
>  #!/bin/sh
>  
> +RSYSLOGD_ARGS=""
> +ENABLED="yes"
> +
> +# shellcheck source=/dev/null
> +[ -r /etc/default/logging ] && . /etc/default/logging
> +
> +DAEMON="rsyslogd"
> +
> +test "$ENABLED" = "yes" || {

I find it strange to use test here and use [ ] everywhere else.
And why not use if here ?

> +	printf '%s is disabled\n' "$DAEMON"
> +	exit 0
> +}
> +
>  start() {
> -  printf "Starting rsyslog daemon: "
> -  start-stop-daemon -S -q -p /var/run/rsyslogd.pid --exec /usr/sbin/rsyslogd
> -  [ $? = 0 ] && echo "OK" || echo "FAIL"
> +	printf 'Starting %s: ' "$DAEMON"
> +	{
> +		# shellcheck disable=SC2086 # we need the word splitting
> +		start-stop-daemon -b -S -q -p /var/run/rsyslogd.pid -x /usr/sbin/rsyslogd -- -n $RSYSLOGD_ARGS && \

Why do you disable backgrounding in rsyslog and ask start-stop-daemon to do it
instead ?
This may prevent rsyslogd to report errors and exit 1 before it daemonize itself.

> +		echo "OK"
> +	} || {
> +		echo "FAIL"
> +		exit 1
> +	}
>  }


>  restart() {
> -  stop
> -  sleep 1
> -  start
> +	printf '%s %s: ' "${1:-Restarting}" "$DAEMON"
> +	{
> +		# shellcheck disable=SC2086 # we need the word splitting
> +		start-stop-daemon -K -q -p /var/run/rsyslogd.pid && \
> +		sleep 1 && \
> +		start-stop-daemon -b -S -q -p /var/run/rsyslogd.pid -x /usr/sbin/rsyslogd -- -n $RSYSLOGD_ARGS && \

This duplicates code, and the error reporting is less precise than before.  It
will just say "FAIL" if the daemon is not running or fails to start.

> +		echo "OK"
> +	} || {
> +		echo "FAIL"
> +		exit 1
> +	}
> +}
> +
> +# rsyslogd ignores SIGHUP, SIGUSRx, so simply restart.

Are you sure about that ? the man page says otherwise.
