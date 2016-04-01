From: Oscar Gomez Fuente <oscargomezf@gmail.com>
Date: Fri, 1 Apr 2016 12:34:02 +0200
Subject: [Buildroot] [ntpd] Problems updating the time with ntpd package
Message-ID: <CALtfCQZsZOaJ0eBemKcED3-7gGOKPow-mw5RGQkoLYe-xGoMqw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm trying to use ntpd package from buildroot-2016.02  [selected Target
Packages ---> Networking applications  --->  ntp ---> ntpd] to update the
time in my buildroot platform with a raspberry pi B rev2.1 because I don't
have an RTC HW and I feel like having the time updated. The problem is
sometimes the time is updated correctly but sometimes doesn't work properly.

When it works fine I've got this log from /var/log/messages:

Welcome to Buildroot 2016.02
tedpi login: root
Password:
# date
Fri Apr  1 10:16:03 UTC 2016
# tail -n 20 /var/log/messages
Jan  1 00:00:07 tedpi user.info kernel: [    7.969955] NET: Registered
protocol family 10
Jan  1 00:00:07 tedpi daemon.info ntpd[132]: proto: precision = 3.000 usec
(-18)
Jan  1 00:00:07 tedpi daemon.info ntpd[132]: Listen and drop on 0
v6wildcard [::]:123
Jan  1 00:00:07 tedpi daemon.info ntpd[132]: Listen and drop on 1
v4wildcard 0.0.0.0:123
Jan  1 00:00:07 tedpi daemon.info ntpd[132]: Listen normally on 2 lo
127.0.0.1:123
Jan  1 00:00:07 tedpi daemon.info ntpd[132]: Listen normally on 3 eth0
192.168.10.106:123
Jan  1 00:00:07 tedpi daemon.info ntpd[132]: Listen normally on 4 lo
[::1]:123
Jan  1 00:00:07 tedpi daemon.err ntpd[132]: bind(21) AF_INET6
fe80::ba27:ebff:fe59:eb61%2#123 flags 0x11 failed: Cannot assign requested
address
Jan  1 00:00:07 tedpi daemon.err ntpd[132]: unable to create socket on eth0
(5) for fe80::ba27:ebff:fe59:eb61%2#123
Jan  1 00:00:07 tedpi daemon.info ntpd[132]: failed to init interface for
address fe80::ba27:ebff:fe59:eb61%2
Jan  1 00:00:07 tedpi daemon.info ntpd[132]: Listening on routing socket on
fd #21 for interface updates
Jan  1 00:00:07 tedpi daemon.info init: starting pid 138, tty
'/dev/ttyAMA0': '/sbin/getty -L  ttyAMA0 0 vt100 '
Jan  1 00:00:07 tedpi authpriv.info dropbear[137]: Running in background
Jan  1 00:00:08 tedpi daemon.err ntpd[132]: bind(24) AF_INET6
fe80::ba27:ebff:fe59:eb61%2#123 flags 0x11 failed: Cannot assign requested
address
Jan  1 00:00:08 tedpi daemon.err ntpd[132]: unable to create socket on eth0
(6) for fe80::ba27:ebff:fe59:eb61%2#123
Jan  1 00:00:08 tedpi daemon.info ntpd[132]: failed to init interface for
address fe80::ba27:ebff:fe59:eb61%2
Jan  1 00:00:10 tedpi auth.info login[138]: root login on 'ttyAMA0'
Jan  1 00:00:10 tedpi daemon.info ntpd[132]: Listen normally on 7 eth0
[fe80::ba27:ebff:fe59:eb61%2]:123
Jan  1 00:00:10 tedpi daemon.debug ntpd[132]: new interface(s) found:
waking up resolver
Apr  1 10:15:59 tedpi daemon.info ntpd[132]: receive: Unexpected origin
timestamp 0x83aa7e8a.c53e9a30 from 84.88.69.32 xmt 0xdaa8c8e0.18a69bbb

And when It doesn't work I've got this log from /var/log/messages:

Welcome to Buildroot 2016.02
tedpi login: root
Password:
# date
Thu Jan  1 00:00:19 UTC 1970
# tail -n 20 /var/log/messages
Jan  1 00:00:07 tedpi daemon.info ntpd[127]: Command line: /usr/sbin/ntpd -g
Jan  1 00:00:07 tedpi user.info kernel: [    7.922955] NET: Registered
protocol family 10
Jan  1 00:00:07 tedpi daemon.info ntpd[132]: proto: precision = 3.000 usec
(-18)
Jan  1 00:00:07 tedpi daemon.info ntpd[132]: Listen and drop on 0
v6wildcard [::]:123
Jan  1 00:00:07 tedpi daemon.info ntpd[132]: Listen and drop on 1
v4wildcard 0.0.0.0:123
Jan  1 00:00:07 tedpi daemon.info ntpd[132]: Listen normally on 2 lo
127.0.0.1:123
Jan  1 00:00:07 tedpi daemon.info ntpd[132]: Listen normally on 3 eth0
192.168.10.106:123
Jan  1 00:00:07 tedpi daemon.info ntpd[132]: Listen normally on 4 lo
[::1]:123
Jan  1 00:00:07 tedpi daemon.err ntpd[132]: bind(21) AF_INET6
fe80::ba27:ebff:fe59:eb61%2#123 flags 0x11 failed: Cannot assign requested
address
Jan  1 00:00:07 tedpi daemon.err ntpd[132]: unable to create socket on eth0
(5) for fe80::ba27:ebff:fe59:eb61%2#123
Jan  1 00:00:07 tedpi daemon.info ntpd[132]: failed to init interface for
address fe80::ba27:ebff:fe59:eb61%2
Jan  1 00:00:07 tedpi daemon.info ntpd[132]: Listening on routing socket on
fd #21 for interface updates
Jan  1 00:00:07 tedpi daemon.info init: starting pid 138, tty
'/dev/ttyAMA0': '/sbin/getty -L  ttyAMA0 0 vt100 '
Jan  1 00:00:07 tedpi authpriv.info dropbear[137]: Running in background
Jan  1 00:00:08 tedpi daemon.err ntpd[132]: bind(24) AF_INET6
fe80::ba27:ebff:fe59:eb61%2#123 flags 0x11 failed: Cannot assign requested
address
Jan  1 00:00:08 tedpi daemon.err ntpd[132]: unable to create socket on eth0
(6) for fe80::ba27:ebff:fe59:eb61%2#123
Jan  1 00:00:08 tedpi daemon.info ntpd[132]: failed to init interface for
address fe80::ba27:ebff:fe59:eb61%2
Jan  1 00:00:10 tedpi daemon.info ntpd[132]: Listen normally on 7 eth0
[fe80::ba27:ebff:fe59:eb61%2]:123
Jan  1 00:00:10 tedpi daemon.debug ntpd[132]: new interface(s) found:
waking up resolver
Jan  1 00:00:10 tedpi auth.info login[138]: root login on 'ttyAMA0'

Any suggestion?

Oscar Gomez Fuente
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160401/f84fc1b5/attachment.html>
