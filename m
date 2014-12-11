From: Thierry Bultel <tbultel@free.fr>
Date: Thu, 11 Dec 2014 21:52:50 +0100
Subject: [Buildroot] systemd: syslog.socket fails
In-Reply-To: <CAGrucu1SpBB0J-9wVynW1q_PA=VFgSxkMAkv8T_cM-jyAW3SJw@mail.gmail.com>
References: <5489C246.9020805@free.fr>
 <CAGrucu1SpBB0J-9wVynW1q_PA=VFgSxkMAkv8T_cM-jyAW3SJw@mail.gmail.com>
Message-ID: <548A0422.1080400@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 11/12/2014 18:26, Andr? Erdmann a ?crit :
> Hi Thierry,
>
> 2014-12-11 17:11 GMT+01:00 Thierry Bultel <tbultel@free.fr>:
>> Hi,
>>
>> I am using rsyslog + systemd, and rsyslog does not start, because it fails
>> to start the syslog.socket
>>
>> This can be shown in this single case:
>>
>> root at buildroot:~>systemctl start syslog.socket
>> Job for syslog.socket failed. See 'systemctl status syslog.socket' and
>> 'journalctl -xn' for details.
>>
>> root at buildroot:~>journalctl -xn
>> -- Logs begin at Thu 2014-12-11 15:52:42 UTC, end at Thu 2014-12-11 16:14:45
>> UTC. --
>> Dec 11 16:03:52 buildroot-stack104 systemd[1]: Socket service syslog.service
>> not loaded, refusing.
>> Dec 11 16:03:52 buildroot-stack104 systemd[1]: Failed to listen on Syslog
>> Socket.
>> -- Subject: Unit syslog.socket has failed
>> -- Defined-By: systemd
>> -- Support: http://lists.freedesktop.org/mailman/listinfo/systemd-devel
>> --
>> -- Unit syslog.socket has failed.
>>
>> As a workaround (inspired from systemd-journald.socket),
>> adding :
>>
>> Service=syslog.service
>>
>> ... at the end of /lib/systemd/system/syslog.socket makes it work (though I
>> have no idea why, at the present time)
>>
>
> That's because socket units need a service unit with the same base
> name (syslog.service here) and that file doesn't exist on your system.
> It can be overridden with Service=rsyslog.service ("syslog.service":
> typo?), as you've already done. The 'proper' way is to create a
> syslog.service symlink in /etc/systemd/system:
>
> ln -s /lib/systemd/system/rsyslog.service /etc/systemd/system/syslog.service
>
> "systemctl enable rsyslog.service" would also create this symlink (and
> another one in /etc/systemd/system/multi-user.target.wants/ that
> enables the service).
>
> Alternatively, rather than editing syslog.socket directly, create
> /etc/systemd/system/syslog.socket.d/05-provider.conf with the
> following two lines:
>
> [Socket]
> Service=rsyslog.service
>
>
> Either variant should work (don't forget to run "systemctl daemon-reload").
>

Thanks,
that was the trick indeed.

So the problem is that buildroot shoud create that link when installing
rsyslog to target, when systemd is the chose init system.

Also, that seems to me related to the 7.6.7 package itself, that may be 
broken, but
the $(@D)/platform/redhat/rsyslog.conf that is provided leads to a lot
of parsing errors:

rsyslogd: action 'rsyslog_conf' treated as ':omusrmsg:rsyslog_conf' - 
please change syntax, 'rsyslog_conf' will not be supported in the future 
[try http://www.rsyslog.com/e/2184 ]
rsyslogd: user name 'rsyslog_...' too long - ignored
rsyslogd: error during parsing file /etc/rsyslog.conf, on or before line 
7: warnings occured in file '/etc/rsyslog.conf' around line 7 [try 
http://www.rsyslog.com/e/2207 ]
rsyslogd: action '*' treated as ':omusrmsg:*' - please change syntax, 
'*' will not be supported in the future [try http://www.rsyslog.com/e/2184 ]
rsyslogd: error during parsing file /etc/rsyslog.conf, on or before line 
8: warnings occured in file '/etc/rsyslog.conf' around line 8 [try 
http://www.rsyslog.com/e/2207 ]
rsyslogd: action 'or' treated as ':omusrmsg:or' - please change syntax, 
'or' will not be supported in the future [try 
http://www.rsyslog.com/e/2184 ]
rsyslogd: error during parsing file /etc/rsyslog.conf, on or before line 
8: warnings occured in file '/etc/rsyslog.conf' around line 8 [try 
http://www.rsyslog.com/e/2207 ]
rsyslogd: action 'latest' treated as ':omusrmsg:latest' - please change 
syntax, 'latest' will not be supported in the future [try 
http://www.rsyslog.com/e/2184 ]
rsyslogd: error during parsing file /etc/rsyslog.conf, on or before line 
8: warnings occured in file '/etc/rsyslog.conf' around line 8 [try 
http://www.rsyslog.com/e/2207 ]

...

Cheers
Thierry

>> http://cgit.freedesktop.org/systemd/systemd/tree/units/syslog.socket does
>> not have such a hack ...
>>
>> Any ideas ?
>> Thierry
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
