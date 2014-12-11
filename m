From: Thierry Bultel <tbultel@free.fr>
Date: Thu, 11 Dec 2014 17:11:50 +0100
Subject: [Buildroot] systemd: syslog.socket fails
Message-ID: <5489C246.9020805@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am using rsyslog + systemd, and rsyslog does not start, because it 
fails to start the syslog.socket

This can be shown in this single case:

root at buildroot:~>systemctl start syslog.socket
Job for syslog.socket failed. See 'systemctl status syslog.socket' and 
'journalctl -xn' for details.

root at buildroot:~>journalctl -xn
-- Logs begin at Thu 2014-12-11 15:52:42 UTC, end at Thu 2014-12-11 
16:14:45 UTC. --
Dec 11 16:03:52 buildroot-stack104 systemd[1]: Socket service 
syslog.service not loaded, refusing.
Dec 11 16:03:52 buildroot-stack104 systemd[1]: Failed to listen on 
Syslog Socket.
-- Subject: Unit syslog.socket has failed
-- Defined-By: systemd
-- Support: http://lists.freedesktop.org/mailman/listinfo/systemd-devel
-- 
-- Unit syslog.socket has failed.

As a workaround (inspired from systemd-journald.socket),
adding :

Service=syslog.service

... at the end of /lib/systemd/system/syslog.socket makes it work 
(though I have no idea why, at the present time)

http://cgit.freedesktop.org/systemd/systemd/tree/units/syslog.socket 
does not have such a hack ...

Any ideas ?
Thierry
