From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 10 Jul 2018 00:05:30 +0200
Subject: [Buildroot] [PATCH 7/8] rsyslog: update S01logging
In-Reply-To: <20180709033134.22175-8-casantos@datacom.com.br>
References: <20180709033134.22175-1-casantos@datacom.com.br>
 <20180709033134.22175-8-casantos@datacom.com.br>
Message-ID: <4b21a057-0fa7-6ff5-50c5-a0a23b9bf544@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Note: subject is wrong s/rsyslog/syslog-ng/

On 09-07-18 05:31, Carlos Santos wrote:
> Reformat and fix syslog-ng startup script for better quality and code
> style:
> 
> - Indent with tabs, not spaces.
> - Use logic operators && and || to detect/handle errors, which provides
>   better readability than nested if/then/else blocks.
> - Use brackets for blocking, also improving readability.
> - Rewrite restart to report the result of the whole operation instead of
>   invoking stop, start and report OK twice.
> - Do not kill syslog-ng in "reload". Send a SIGHUP signal, instructing
>   it to perform a re-initialization.
> - Support a configuration file at /etc/default (an example file will be
>   added in forthcomming patch).
> - Support a configuration variable that completely disables the service
>   and issues a warning message on any invocation.
> 
> Signed-off-by: Carlos Santos <casantos@datacom.com.br>
> ---
>  package/syslog-ng/S01logging | 83 +++++++++++++++++++++++++-----------
>  1 file changed, 58 insertions(+), 25 deletions(-)
> 
> diff --git a/package/syslog-ng/S01logging b/package/syslog-ng/S01logging
> index d7c899a1e3..ba2eb226c1 100644
> --- a/package/syslog-ng/S01logging
> +++ b/package/syslog-ng/S01logging
> @@ -1,38 +1,71 @@
>  #!/bin/sh
>  
> +SYSLOG_NG_ARGS=""
> +ENABLED="yes"
> +
> +# shellcheck source=/dev/null
> +[ -r /etc/default/logging ] && . /etc/default/logging
> +
> +DAEMON="syslog-ng"
> +
> +test "$ENABLED" = "yes" || {
> +	printf '%s is disabled\n' "$DAEMON"
> +	exit 0
> +}
> +
>  start() {
> -	printf "Starting syslog-ng daemon: "
> -	start-stop-daemon -S -q -p /var/run/syslog-ng.pid \
> -		-x /usr/sbin/syslog-ng -- --pidfile /var/run/syslog-ng.pid
> -	[ $? = 0 ] && echo "OK" || echo "FAIL"
> +	printf 'Starting %s: ' "$DAEMON"
> +	{
> +		# shellcheck disable=SC2086 # we need the word splitting
> +		start-stop-daemon -b -S -q -p /var/run/syslog-ng.pid -x /usr/sbin/syslog-ng -- -F $SYSLOG_NG_ARGS && \

 Again, better let the daemon take care of backgrounding itself.

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
