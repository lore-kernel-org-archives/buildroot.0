From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 21 Oct 2018 19:23:28 +0100
Subject: [Buildroot] [PATCH v3 1/8] busybox: update S01logging
In-Reply-To: <20181007114605.18153-2-casantos@datacom.com.br>
References: <20181007114605.18153-1-casantos@datacom.com.br>
 <20181007114605.18153-2-casantos@datacom.com.br>
Message-ID: <c68bf4a2-0731-6857-babd-81f54311d703@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Carlos,

 Thank you again for this series. I still have some feedback, which I discussed
as well with the others here at the Buildroot meeting, and we generally agree on
these aspects.

 Let me start with repeating that we appreciate very much this work.


On 07/10/2018 12:45, Carlos Santos wrote:
> Reformat and fix syslogd/klogd startup script for better quality and
> code style:
> 
> - Detect and report start/stop errors (previous version ignored them and
>   always reported OK).
> - Use a separate function for restart.
> - Implement reload as restart.
> - Support a configuration variable that completely disables the service
>   and issues a warning message on any invocation.
> 
> Signed-off-by: Carlos Santos <casantos@datacom.com.br>
> Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
> ---
> Changes v1->v2
> - Implement suggestions made by Nicolas Cavallari and Arnout Vandecappelle
> ---
>  package/busybox/S01logging | 82 +++++++++++++++++++++++++-------------

 Thomas mentioned that he would prefer every init script to be called the same
as the executable it starts (which is usually the same as the package). There is
general agreement about that aspect.

 Also he mentioned that it is better to split into two separate scripts when two
daemons are started (i.e., klogd). There's agreement on that as well.

 Still, these changes can be done in follow-up patches, so it's OK if you keep
it as S01logging for the time being (if you want to do the split right away,
that's OK as well). However, the names of the default files would be better to
already reflect the daemon name rather than just /etc/default/logging.

 Note also that with the splitting, we can improve the situation for busybox a
little. Now, it is possible that klogd is NOT selected in busybox, but it is
still started. With a separate init script, it would be possible to install it
only when klogd is enabled (like is done now for syslogd).

>  1 file changed, 54 insertions(+), 28 deletions(-)
> 
> diff --git a/package/busybox/S01logging b/package/busybox/S01logging
> index fcb3e7d236..ddd27bba9a 100644
> --- a/package/busybox/S01logging
> +++ b/package/busybox/S01logging
> @@ -1,40 +1,66 @@
>  #!/bin/sh
> -#
> -# Start logging
> -#
>  
> -SYSLOGD_ARGS=-n
> -KLOGD_ARGS=-n
> -[ -r /etc/default/logging ] && . /etc/default/logging
> +DAEMON="logging"
> +SPIDFILE="/var/run/syslogd.pid"
> +KPIDFILE="/var/run/klogd.pid"
>  
> +SYSLOGD_ARGS=""
> +KLOGD_ARGS=""
> +ENABLED="yes"
> +
> +# shellcheck source=/dev/null
> +[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON> +
> +if [ "$ENABLED" != "yes" ]; then
> +	printf '%s is disabled\n' "$DAEMON"

 The ENABLED option is not useful, it is felt. If you don't want the daemon to
be started, just remove the init script or make it non-executable.

> +	exit 0
> +fi
> +
> +# BusyBox' syslogd and klogd do not create pidfiles, so use "-m" to instruct
> +# start-stop-daemon to create them. This also means that we must pass "-n" to
> +# sylogd and klogd in the command line.
>  start() {
> -	printf "Starting logging: "
> -	start-stop-daemon -b -S -q -m -p /var/run/syslogd.pid --exec /sbin/syslogd -- $SYSLOGD_ARGS> -	start-stop-daemon -b -S -q -m -p /var/run/klogd.pid --exec /sbin/klogd --
$KLOGD_ARGS
> -	echo "OK"
> +	printf 'Starting %s: ' "$DAEMON"
> +	status=0
> +	# shellcheck disable=SC2086 # we need the word splitting
> +	start-stop-daemon -b -S -q -m -p "$SPIDFILE" -x /sbin/syslogd -- -n $SYSLOGD_ARGS || status=$?

 Small nit, personal preference of mine: I think it's clearer if the syslogd
args themselves are on a separate line, i.e.

	start-stop-daemon -b -S -q -m -p "$SPIDFILE" -x /sbin/syslogd \
		-- -n $SYSLOGD_ARGS || status=$?

> +	start-stop-daemon -b -S -q -m -p "$KPIDFILE" -x /sbin/klogd -- -n $KLOGD_ARGS || status=$?
> +	if [ "$status" -eq 0 ]; then

 There was some bikeshedding about needing quotes around $status here, but in
the end, it's not important, as long as it's consistent.

> +		echo "OK"
> +	else
> +		echo "FAIL"
> +	fi
> +	return "$status"
>  }
>  

 The rest LGTM. So basically two important comments: 1. remove ENABLED; 2. name
the defaults file like the daemon.	

 Regards,
 Arnout
