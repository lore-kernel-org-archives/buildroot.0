From: =?ISO-8859-1?Q?Markus_K=F6nigshaus?= <m.koenigshaus@wut.de>
Date: Thu, 15 Mar 2012 17:34:22 +0100
Subject: [Buildroot] vsftpd
In-Reply-To: <CALo-6+jD9RYLokKJGdOV1p1mk=ZFUd+uOY5qnCVuK3jTb9mSOQ@mail.gmail.com>
References: <CALo-6+jE0XhxMv2xO-EtOLjnrwR8DC9DPH5U0zeV6qst_F-WaQ@mail.gmail.com>
 <4F6212F7.3060400@wut.de>
 <CALo-6+jD9RYLokKJGdOV1p1mk=ZFUd+uOY5qnCVuK3jTb9mSOQ@mail.gmail.com>
Message-ID: <4F621A0E.6060405@wut.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Look at the example config file, I think, you need to tell vsftpd witch
users are allowed to login (without comments):

local_enable=YES
local_umask=022
userlist_deny=NO
userlist_enable=YES
userlist_file=/etc/vsftpd.user_list

and

secure_chroot_dir=/var/empty (or something equal, must exists, must be
empty)

In /etc/vsftpd.user_list put the system - users, you want to allow for
login, the users must exists. Use the user's password for login.

As an alternate you can enable anonymous logins with
"anonymous_enable=YES" and setting "ftp_username" to a system - user you
want to use for anonymous logins.

Markus


Am 15.03.2012 17:14, schrieb Charles Krinke:
> Dear Markus:
>
> This helps, thank you. Adding "listen=YES" to the /etc/vsftpd.conf
> file gets from 'connection refused' to:
>
> ckrinke at hwa:~$ ftp 10.1.15.129
> Connected to 10.1.15.129.
> 500 OOPS: vsftpd: cannot locate user specified in 'ftp_username':ftp
> ftp> quit
> ckrinke at hwa:~$ ftp rude at 10.1.15.129
> ftp: rude at 10.1.15.129: Name or service not knownftp>
> ftp>
> ftp>
>
> Would you mind getting this "Noob for the Day" to the next step? That
> is, I would expect users that exist on the PPC target to be valid ftp
> users. I did "RTFM" man vsftpd.conf but missed the importance of
> listen. I also dont see ftp_username in the man page, so my
> understanding if a bit better, but still incomplete.
>
> Charles
>
> 2012/3/15 Markus K?nigshaus <m.koenigshaus@wut.de>:
>> You forget to set listen to YES, I thing - look at man vsftpd.conf:
>>
>> [ ... ]
>>
>>   listen If  enabled,  vsftpd will run in standalone mode. This means
>> that vsftpd must not be run from an inetd of some kind. Instead, the
>> vsftpd executable is run once directly. vsftpd itself will then take care of
>>              listening for and handling incoming connections.
>>
>>              Default: NO
>> [ ... ]
>>
>> Markus
>>
>> Am 15.03.2012 16:38, schrieb Charles Krinke:
>>> its my day to be a "noob" again as I am having trouble getting vsftpd
>>> accepting connections on an MPC8321 project. I am near the end of my
>>> project after a year and started with buildroot 2011.03 last spring
>>> and today is the day to enable vsftpd and ntp-wait.
>>>
>>> I enable the vsftpd package, it builds, and I get a /usr/sbin/vsftpd
>>> and /etc/init.d/S70vsftpd on the MPC8321 target. When the target
>>> boots, it does say "Starting vsftpd: OK" on the console.
>>>
>>> The package does not create an /etc/vsftpd.conf, so I created one that
>>> looks like this:
>>>
>>> # cat /etc/vsftpd.conf
>>> anonymous_enable=YES
>>> anon_root=/home/econolite
>>> local_enable=YES
>>> #
>>>
>>> Now for the bad news. Connections are refused from an external host,
>>> making me think vsftpd is not really running. A "ps" does not show
>>> vftpd in its list. A "netstat" does not show ftp. Invoking vsftpd from
>>> a bash prompt says:
>>>
>>> # vsftpd
>>> 500 OOPS: vsftpd: not configured for standalone, must be started from inetd
>>> #
>>>
>>> So, can someone help me navigate through the "Valley of Confusion"
>>> towards the "Ridge of Enlightment" so I can get to the next problem
>>> which is "why the frick cannot I get microperl to compile".
>>>
>>> Charles "Noob For The Day" Krinke
>>>
>>>
>> -- Unsere Aussagen koennen Irrtuemer und Missverstaendnisse enthalten.
>> Bitte pruefen Sie die Aussagen fuer Ihren Fall, bevor Sie Entscheidungen
>> auf Grundlage dieser Aussagen treffen.
>> Wiesemann & Theis GmbH, Porschestr. 12, D-42279 Wuppertal
>> Geschaeftsfuehrer: Dipl.-Ing. Ruediger Theis
>> Registergericht: Amtsgericht Wuppertal, HRB 6377
>> Tel. +49-202/2680-0, Fax +49-202/2680-265, http://www.wut.de
>
>
-- Unsere Aussagen koennen Irrtuemer und Missverstaendnisse enthalten.
Bitte pruefen Sie die Aussagen fuer Ihren Fall, bevor Sie Entscheidungen 
auf Grundlage dieser Aussagen treffen.
Wiesemann & Theis GmbH, Porschestr. 12, D-42279 Wuppertal
Geschaeftsfuehrer: Dipl.-Ing. Ruediger Theis
Registergericht: Amtsgericht Wuppertal, HRB 6377 
Tel. +49-202/2680-0, Fax +49-202/2680-265, http://www.wut.de
