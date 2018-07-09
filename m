From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 9 Jul 2018 23:52:50 +0200
Subject: [Buildroot] [PATCH 3/8] rsyslog: update S01logging
In-Reply-To: <20180709033134.22175-4-casantos@datacom.com.br>
References: <20180709033134.22175-1-casantos@datacom.com.br>
 <20180709033134.22175-4-casantos@datacom.com.br>
Message-ID: <8c9cdbc4-0601-f6b4-c5f8-9f3433ca1adf@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 09-07-18 05:31, Carlos Santos wrote:
> Reformat and fix rsyslog startup script for better quality and code
> style:
> 
> - Indent with tabs, not spaces.
> - Use logic operators && and || to detect/handle errors, which provides
>   better readability than nested if/then/else blocks.
> - Use brackets for blocking, also improving readability.
> - Rewrite restart to report the result of the whole operation instead of
>   invoking stop, start and report OK twice.
> - Add a "reload" option, implemented as restart, but with a nickname to
>   report the result of the expected operation.
> - Support a configuration file at /etc/default (an example file will be
>   added in forthcomming patch).
> - Support a configuration variable that completely disables the service
>   and issues a warning message on any invocation.
> 
> Signed-off-by: Carlos Santos <casantos@datacom.com.br>
> ---
>  package/rsyslog/S01logging | 74 ++++++++++++++++++++++++++------------
>  1 file changed, 51 insertions(+), 23 deletions(-)
> 
> diff --git a/package/rsyslog/S01logging b/package/rsyslog/S01logging
> index 8e4a59c2d5..94b5a1bd96 100644
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

 I think we should use /etc/default/rsyslog here. The options there are not at
all compatible with the syslogd/klogd options, so there is no point making it
the same file. That way, you can also use $DAEMON here.

 Actually, the script itself should really be called S01rsyslog. Only that is
not possible, because then busybox would install its own S01logging and we start
two syslog daemons.  But that's a special case, in general we'd like the init
script to be called S??$DAEMON.

> +
> +DAEMON="rsyslogd"
> +
> +test "$ENABLED" = "yes" || {
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

 To make it more generic, use /var/run/${DAEMON}.pid and /usr/sbin/${DAEMON}.
Although for the latter I'm not entirely convinced it's a good idea. Similarly,
we could call the variable DAEMON_ARGS, but again I'm not convinced it's a good
idea.

 Oh, and +1 to Nicolas' comments.

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
