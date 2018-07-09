From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 9 Jul 2018 23:35:17 +0200
Subject: [Buildroot] [PATCH 1/8] busybox: update S01logging
In-Reply-To: <20180709033134.22175-2-casantos@datacom.com.br>
References: <20180709033134.22175-1-casantos@datacom.com.br>
 <20180709033134.22175-2-casantos@datacom.com.br>
Message-ID: <0c2b05cb-0f97-7be1-4497-014508ba500f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 More bikeshedding :-)

On 09-07-18 05:31, Carlos Santos wrote:

> +
> +# shellcheck source=/dev/null
>  [ -r /etc/default/logging ] && . /etc/default/logging
>  
> +DAEMON="logging"

 You could also use the DAEMON variable on the line above, to make it more
generic. So /etc/default/$DAEMON.

 For this particular one it is not possible, but for many daemons you can just
copy an existing init script and replace DAEMON with a different name.


> +# BusyBox' syslogd and klogd don't create pidfiles, so use "-m" to instruct
> +# start-stop-daemon to create them.

 Actually, the important thing is that with -m you need -b as well, which means
you *have* to pass -n on the syslogd/klogd command line.

>  start() {
> -	printf "Starting logging: "
> -	start-stop-daemon -b -S -q -m -p /var/run/syslogd.pid --exec /sbin/syslogd -- $SYSLOGD_ARGS
> -	start-stop-daemon -b -S -q -m -p /var/run/klogd.pid --exec /sbin/klogd -- $KLOGD_ARGS
> -	echo "OK"
> +	printf 'Starting %s: ' "$DAEMON"
> +	{
> +		# shellcheck disable=SC2086 # we need the word splitting
> +		start-stop-daemon -b -S -q -m -p /var/run/syslogd.pid -x /sbin/syslogd -- -n $SYSLOGD_ARGS && \
> +		start-stop-daemon -b -S -q -m -p /var/run/klogd.pid -x /sbin/klogd -- -n $KLOGD_ARGS && \
> +		echo "OK"
> +	} || {
> +		echo "FAIL"
> +		exit 1

 I think this should be "return 1". Since start is the last thing called from
the script, its return value will be used as the script exit value. For start it
doesn't matter much, but for stop it's an elegant way to make sure that restart
(by calling stop; start) does the start even if stop failed (because the daemon
anyway wasn't running yet).

> +	}
>  }
>  
>  stop() {
> -	printf "Stopping logging: "
> -	start-stop-daemon -K -q -p /var/run/syslogd.pid
> -	start-stop-daemon -K -q -p /var/run/klogd.pid
> -	echo "OK"
> +	printf 'Stopping %s: ' "$DAEMON"
> +	{
> +		start-stop-daemon -K -q -p /var/run/syslogd.pid && \
> +		start-stop-daemon -K -q -p /var/run/klogd.pid && \

 It would make more sense to revert the order. But yes, that's yet another
change compared to current behaviour.

 Regards,
 Arnout

[snip]
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
