From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 9 Jul 2018 23:23:09 +0200
Subject: [Buildroot] [PATCH 1/8] busybox: update S01logging
In-Reply-To: <2803e614-56fd-6fed-ed05-7be00730711c@green-communications.fr>
References: <20180709033134.22175-1-casantos@datacom.com.br>
 <20180709033134.22175-2-casantos@datacom.com.br>
 <2803e614-56fd-6fed-ed05-7be00730711c@green-communications.fr>
Message-ID: <fc45fbb7-68a4-61dd-6c08-035544fb3132@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 09-07-18 10:33, Nicolas Cavallari wrote:
> On 09/07/2018 05:31, Carlos Santos wrote:
>> The script still has a bug: if klogd fails to load it reports FAIL but
>> leaves syslogd running. This is partially attenuated because a "stop"
>> would kill syslogd, fail on klogd and report "FAIL", but still do its
>> job. We could fix this by means of more detailed logic or splitting the
>> script but lets leave as is, since it is not a regression compared to
>> the previous situation.
> 
> Considering the criticality of logging, maybe the old behavior should be kept:
> the script should attempt to start both daemon regardless of if any of them fails.

 Well, klogd is anyway pretty useless without running syslogd. However...

> This does not need to be complicated:
> 
> local err=0
> start-stop-daemon --overlong-options || err=$?
> start-stop-another-daemon --more-overlong-options || err=$?
> if [ "$err" != 0 ]; then
>     echo OK
> else
>     echo FAIL
>     return $err
> fi

 This code is IMO a lot more readable than the code proposed by Carlos, so I
like it.

 Actually, I wouldn't mind a separate message for syslogd and klogd. But that's
another story again...

> 
>> +restart() {
>> +	printf '%s %s: ' "${1:-Restarting}" "$DAEMON"
>> +	{
>> +		# shellcheck disable=SC2086 # we need the word splitting
>> +		start-stop-daemon -K -q -p /var/run/syslogd.pid && \
>> +		start-stop-daemon -K -q -p /var/run/klogd.pid && \
>> +		sleep 1 && \
>> +		start-stop-daemon -b -S -q -m -p /var/run/syslogd.pid -x /sbin/syslogd -- -n $SYSLOGD_ARGS && \
>> +		start-stop-daemon -b -S -q -m -p /var/run/klogd.pid -x /sbin/klogd -- -n $KLOGD_ARGS && \
>> +		echo "OK"
>> +	} || {
>> +		echo "FAIL"
>> +		exit 1
>> +	}
>> +}
>> +
>> +# BusyBox' syslogd and klogd ignore SIGHUP, SIGUSRx, so simply restart.
>> +reload() {
>> +	restart "Reloading"
> 
> I think we shouldn't hide the fact that we are restarting the daemon instead of
> reloading it.

 For me, the old way of

restart|reload)
	stop
	sleep 1
	start
	;;

was perfectly fine. It avoids code duplication, and it does exactly what we need
to do. Well, to make it work, the exit 1 in case of failure would have to be
replaced with return 1.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
