From: Carlos Santos <casantos@datacom.com.br>
Date: Tue, 18 Dec 2018 15:41:33 -0200 (BRST)
Subject: [Buildroot] [PATCH 1/2] package/procps-ng: add init script for
 sysctl
In-Reply-To: <fdd746a8-1c19-bb0b-8380-5c3c586c5de1@mind.be>
References: <20181218050235.27187-1-casantos@datacom.com.br>
 <20181218050235.27187-2-casantos@datacom.com.br>
 <fdd746a8-1c19-bb0b-8380-5c3c586c5de1@mind.be>
Message-ID: <1158429719.40138864.1545154893013.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Arnout Vandecappelle" <arnout@mind.be>
> To: "Carlos Santos" <casantos@datacom.com.br>, "buildroot" <buildroot@buildroot.org>
> Cc: "ratbert90" <aduskett@gmail.com>, "DATACOM" <rodrigo.rebello@datacom.com.br>
> Sent: Ter?a-feira, 18 de dezembro de 2018 14:16:23
> Subject: Re: [Buildroot] [PATCH 1/2] package/procps-ng: add init script for sysctl

> Hi Carlos,
> 
> Since you're the init script master :-) let's do some bikeshedding!
> 
> On 18/12/2018 06:02, Carlos Santos wrote:
>> Add a simple init script that invokes sysctl early in the initialization
>> process to configure kernel parameters. This is already performed by
>> systemd (systemd-sysctl) but there is no sysvinit/busybox counterpart.
>> 
>> Files are read from directories in the following list in the given order
>> from top to bottom:
>> 
>>     /run/sysctl.d/*.conf
>>     /etc/sysctl.d/*.conf
>>     /usr/local/lib/sysctl.d/*.conf
>>     /usr/lib/sysctl.d/*.conf
>>     /lib/sysctl.d/*.conf
>>     /etc/sysctl.conf
>> 
>> Signed-off-by: Carlos Santos <casantos@datacom.com.br>
>> ---
>>  package/procps-ng/S01sysctl    | 41 ++++++++++++++++++++++++++++++++++
>>  package/procps-ng/procps-ng.mk |  5 +++++
>>  2 files changed, 46 insertions(+)
>>  create mode 100644 package/procps-ng/S01sysctl
>> 
>> diff --git a/package/procps-ng/S01sysctl b/package/procps-ng/S01sysctl
>> new file mode 100644
>> index 0000000000..e93bdb9e17
>> --- /dev/null
>> +++ b/package/procps-ng/S01sysctl
> 
> Is 01 the most appropriate place? I would tend to think that we want to log any
> errors from sysctl, so it should be 02 or 03.

Unfortunately sysctl does not use syslog. We could redirect its
std{out|err} to logger but no other init script does this and I
chose to keep it simple in this first version. I can make it a
bit more fancy, however.

>> @@ -0,0 +1,41 @@
>> +#!/bin/sh
>> +
>> +PROGRAM="sysctl"
> 
> In other init scripts you used DAEMON. Of course, in this case, it's not a
> daemon, but maybe for consistency it's better to keep the same?

I chose PROGRAM exactly because it is not a daemon. DAEMONs must be
started with start-stop-daemon and must have PID files.

>> +
>> +SYSCTL_ARGS=""
>> +
>> +# shellcheck source=/dev/null
>> +[ -r "/etc/default/$PROGRAM" ] && . "/etc/default/$PROGRAM"
>> +
>> +start() {
>> +	printf 'Starting %s: ' "$PROGRAM"
>> +	# shellcheck disable=SC2086 # we need the word splitting
>> +	/sbin/sysctl --quiet --system $SYSCTL_ARGS
> 
> I'm not so sure about the --quiet here. Even more, I would redirect the output
> into logger.

See above.

>> +	status=$?
>> +	if [ "$status" -eq 0 ]; then
>> +		echo "OK"
>> +	else
>> +		echo "FAIL"
>> +	fi
>> +	return "$status"
>> +}
>> +
>> +stop() {
>> +	printf 'Stopping %s: OK\n' "$PROGRAM"
> 
> Since nothing is actually done, I think it's better to not print anything.

A silent "stop" may lead the user to believe that something went
wrong. That's debatable, of course. I'm still torn between the two
options but for the moment I'd prefer to keep the message. It also
helps us to implement some automated test in the future.

>> +}
>> +
>> +restart() {
>> +	stop
>> +	sleep 1
> 
> And here I'd also skip the stop and more importantly the sleep.

Yeah, the sleep is useless.

>> +	start
>> +}
>> +
>> +case "$1" in
>> +        start|stop)
> 
> You put spaces here.
> 
>> +		"$1";;
>> +	restart|reload)
>> +		restart;;
> 
> So here, I'd directly go for 'start' instead of restart. So maybe
> 
> case "$1" in
>	start|restart|reload)
>		start;;
>	stop)
>		:;;
> 
> I'm not sure, what do you think? Is it better to keep the pattern for the case
> statement always the same (except for the restart|reload part)?
> 
> If the pattern should stay the same, in the other scripts you actually put:
> 
>        start|stop|restart)
>                "$1";;
>        reload)
>                # Restart, since there is no true "reload" feature.
>                restart;;

In this particular case I'd choose the first option.

> 
> 
> Regards,
> Arnout
> 
>> +        *)
>> +                echo "Usage: $0 {start|stop|restart|reload}"
>> +                exit 1
>> +esac
>> diff --git a/package/procps-ng/procps-ng.mk b/package/procps-ng/procps-ng.mk
>> index 03b74784d2..e40aeb5a2a 100644
>> --- a/package/procps-ng/procps-ng.mk
>> +++ b/package/procps-ng/procps-ng.mk
>> @@ -44,4 +44,9 @@ ifeq ($(BR2_STATIC_LIBS),y)
>>  PROCPS_NG_CONF_OPTS += --disable-numa
>>  endif
>>  
>> +define PROCPS_NG_INSTALL_INIT_SYSV
>> +	$(INSTALL) -D -m 755 package/procps-ng/S01sysctl \
>> +		$(TARGET_DIR)/etc/init.d/S01sysctl
>> +endef
>> +
>>  $(eval $(autotools-package))

-- 
Carlos Santos (Casantos) - DATACOM, P&D
