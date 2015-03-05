From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 05 Mar 2015 23:08:18 +0100
Subject: [Buildroot] log storage strategy
In-Reply-To: <CAK9TtU1zZpPYOf_B695CkRRzHbVc46diwihTpKs9O4QrJmczJg@mail.gmail.com>
References: <CAK9TtU1zZpPYOf_B695CkRRzHbVc46diwihTpKs9O4QrJmczJg@mail.gmail.com>
Message-ID: <54F8D3D2.1030102@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/03/15 10:30, Sylvain LG wrote:
> Hello,
> 
> many services like to write log files.
> 
> I suppose that it could be a problem on an embedded device, since space is
> limited and NAND has write limitation in time.
> 
> What is the correct strategy to deal with log?

 There is no single strategy that will work for everybody.

 Often the logs are put in a tmpfs so they are never committed to NAND. But then
of course you loose them when the system reboots.

 If you do write to flash, with a decent wear-levelling filesystem the write
limit is not necessarily a problem, especially if you enable some write
buffering (which defaults to 5-30 secs anyway, cfr. sysctl
vm.dirty_writeback_centisecs and vm.dirty_expire_centisecs) and rate limiting
(rsyslogd and journald have controls for that).

 And finally, you'll have to clean up old logs. You can use logrotate, or the
built-in rotation in rsyslogd and journald.


 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
