From: Christopher McCrory <chrismcc@gmail.com>
Date: Fri, 2 Mar 2018 10:18:58 -0800
Subject: [Buildroot] [PATCH 1/2] memcached: bump to version 1.5.6
Message-ID: <CALURroS6FmnCY4ZaySdik3uRsLUPKEXYcbJ09trJPWvcEqrsCw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Mar 2, 2018 at 10:07 AM, Christopher McCrory <chrismcc@gmail.com>
wrote:

> From ReleaseNotes156
>
> This is a bugfix release, but it primarily disables the UDP protocol by
> default.
>
> In the last few days reports of UDP amplification attacks utilizing
> inesure memcached instances have surfaced. Attackers are able to set
> large values into memcached, then send requests via spoofed UDP packets.
> Memcached will then send a very large number of very large UDP packets
> back in response.
>
>

This has been all over the nanog and outages lists the past several days.
google ing memcached DDoS will provide a plethora of information.  I don't
use memcached so all I verified is that it compiled and ran

in a lxc container
before:

Welcome to Buildroot
buildroot login: root
# bash
[root at buildroot ~]$ /usr/bin/memcached -u nobody -d
[root at buildroot ~]$ netstat -ln
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address           Foreign Address
State
tcp        0      0 0.0.0.0:11211           0.0.0.0:*
LISTEN
tcp        0      0 :::11211                :::*
LISTEN
udp        0      0 0.0.0.0:11211           0.0.0.0:*

udp        0      0 :::11211
:::*
Active UNIX domain sockets (only servers)
Proto RefCnt Flags       Type       State         I-Node Path


after
Welcome to Buildroot
buildroot login: root
# bash
[root at buildroot ~]$ /usr/bin/memcached -u nobody -d
[root at buildroot ~]$ netstat -ln
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address           Foreign Address
State
tcp        0      0 0.0.0.0:11211           0.0.0.0:*
LISTEN
tcp        0      0 :::11211                :::*
LISTEN
Active UNIX domain sockets (only servers)
Proto RefCnt Flags       Type       State         I-Node Path


-- 
Christopher McCrory
To the optimist, the glass is half full.
To the pessimist, the glass is half empty.
To the engineer, the glass is twice as big as it needs to be.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180302/06ae209d/attachment.html>
