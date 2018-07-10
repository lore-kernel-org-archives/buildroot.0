From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 10 Jul 2018 09:58:17 +0200
Subject: [Buildroot] [PATCH 3/8] rsyslog: update S01logging
In-Reply-To: <1421354433.2544023.1531179062394.JavaMail.zimbra@datacom.com.br>
References: <20180709033134.22175-1-casantos@datacom.com.br>
 <20180709033134.22175-4-casantos@datacom.com.br>
 <bc1a7b00-5a50-8084-77ad-4429c856be3c@green-communications.fr>
 <1421354433.2544023.1531179062394.JavaMail.zimbra@datacom.com.br>
Message-ID: <3004c808-3130-7f18-cb91-55dba6dc47e8@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10-07-18 01:31, Carlos Santos wrote:
>> From: "Nicolas Cavallari" <Nicolas.Cavallari@green-communications.fr>
>> To: "DATACOM" <casantos@datacom.com.br>, "buildroot" <buildroot@buildroot.org>
>> Cc: "ratbert90" <aduskett@gmail.com>
>> Sent: Monday, July 9, 2018 5:03:37 AM
>> Subject: Re: [Buildroot] [PATCH 3/8] rsyslog: update S01logging
> 
>> Hello,
>>
>> On 09/07/2018 05:31, Carlos Santos wrote:
>>> --- a/package/rsyslog/S01logging
>>> +++ b/package/rsyslog/S01logging
>>> @@ -1,36 +1,64 @@
>>>  #!/bin/sh
>>>  
>>> +RSYSLOGD_ARGS=""
>>> +ENABLED="yes"
>>> +
>>> +# shellcheck source=/dev/null
>>> +[ -r /etc/default/logging ] && . /etc/default/logging
>>> +
>>> +DAEMON="rsyslogd"
>>> +
>>> +test "$ENABLED" = "yes" || {
>>
>> I find it strange to use test here and use [ ] everywhere else.
>> And why not use if here ?
> 
> The "[ command ] &&" sequence is less readable, IMO. I'm doing the same in all
> scripts. 

 If it is about readability: the most readable for is

if [ -z "$ENABLED" ]; then
  ...
fi

which is also the form we almost always use in our .mk files. We have about 40
occurences of 'if []', about 10 of 'if test', and exactly two of 'test ... &&'
and also two of '[ ... ] && ...' (but on the latter two, my counts could be wrong).


>>> +	printf '%s is disabled\n' "$DAEMON"
>>> +	exit 0
>>> +}
>>> +
>>>  start() {
>>> -  printf "Starting rsyslog daemon: "
>>> -  start-stop-daemon -S -q -p /var/run/rsyslogd.pid --exec /usr/sbin/rsyslogd
>>> -  [ $? = 0 ] && echo "OK" || echo "FAIL"
>>> +	printf 'Starting %s: ' "$DAEMON"
>>> +	{
>>> +		# shellcheck disable=SC2086 # we need the word splitting
>>> +		start-stop-daemon -b -S -q -p /var/run/rsyslogd.pid -x /usr/sbin/rsyslogd --
>>> -n $RSYSLOGD_ARGS && \
>>
>> Why do you disable backgrounding in rsyslog and ask start-stop-daemon to do it
>> instead ?
> 
> It prevents hanging the boot sequence by putting a seemingly innocent "-n"
> in RSYSLOGD_ARGS (in /etc/default/logging). It's impossible to interrupted
> the script with Ctrl-C because stdin is redirected to /dev/null and, since
> logging is the first service to start, there is no way to access the system
> remotely via SSH or telnet to kill rsyslogd.

 I don't agree with this reasoning. First of all, setting RSYSLOGD_ARGS is
already pretty advanced stuff, you can assume that people don't just randomly
put arguments in there. Second, you can easily put a "Do NOT use -n" sentence in
the documentation of RSYSLOGD_ARGS. Third, in the buildroot context, we can
assume that people will test the build before deploying to something that
doesn't allow easy recovery in case the system doesn't boot. There would maybe
be a case to be made if we had previously supported a defaults file where
RSYSLOGD_ARGS="-n" would do something sensible, but that is not the case.

 Actually, the latter could have been a reason to do this: _if_ we would
previously have a FOO_ARGS variable where it was reasonable to put a
do-not-daemonize argument in that variable, then we should think twice before
changing that behaviour. But AFAICS, the only FOO_ARGS we had was in busybox
syslogd, and that one will have to keep the -n option.

> 
>> This may prevent rsyslogd to report errors and exit 1 before it daemonize
>> itself.
> 
> It's a trade-off. I chose safety.
> 
>>> +		echo "OK"
>>> +	} || {
>>> +		echo "FAIL"
>>> +		exit 1
>>> +	}
>>>  }
>>
>>
>>>  restart() {
>>> -  stop
>>> -  sleep 1
>>> -  start
>>> +	printf '%s %s: ' "${1:-Restarting}" "$DAEMON"
>>> +	{
>>> +		# shellcheck disable=SC2086 # we need the word splitting
>>> +		start-stop-daemon -K -q -p /var/run/rsyslogd.pid && \
>>> +		sleep 1 && \
>>> +		start-stop-daemon -b -S -q -p /var/run/rsyslogd.pid -x /usr/sbin/rsyslogd --
>>> -n $RSYSLOGD_ARGS && \
>>
>> This duplicates code, and the error reporting is less precise than before.  It
>> will just say "FAIL" if the daemon is not running or fails to start.
>>
>>> +		echo "OK"
>>> +	} || {
>>> +		echo "FAIL"
>>> +		exit 1
>>> +	}
>>> +}
>>> +
>>> +# rsyslogd ignores SIGHUP, SIGUSRx, so simply restart.
>>
>> Are you sure about that ? the man page says otherwise.
> 
> I will update the comment to clarify that rsyslogd does not restart on
> SIGHUP, just closes all open files. 

 The important thing is: does rsyslogd reload its config file on SIGHUP? That is
the intended behaviour of 'reload': after changing daemon's config file, make
sure that the daemon uses the new config file. So for daemons that do monitoring
of their config files (e.g. using inotify), 'reload' should in fact not do anything.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
