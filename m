From: bruce bushby <bruce.bushby@gmail.com>
Date: Fri, 18 Mar 2011 15:34:36 +0000
Subject: [Buildroot] [Solved] Re:  ntpdate takes a long time
In-Reply-To: <201103180953.21819.minimod@morethan.org>
References: <AANLkTi=PdnH5wLpD+F1pmWwf0jNc_baRBGbr70RAtVXT@mail.gmail.com>
	<201103180953.21819.minimod@morethan.org>
Message-ID: <AANLkTin6eLoEyqOri=01+55AeDzQhw3MNg=0WZyCo28g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

Apologies Michael....I think it got mixed up and pasted the results while
still running over "ppp0"

It appears the issue is caused by "ntp", I reverted my ntp package version
to "4.2.6p1" and now it works fine.

The results below show the same commands from:
Linux Desktop
Embedded running ntp-4.2.6p3 (broken)
Embedded running ntp-4.2.6p1 (working)


I used an IP address to ensure dns was not involved and ran a single ping to
show network response for all three sets of results.





From my linux Desktop:
[root at core ~]#
[root at core ~]# ntpdate -v
18 Mar 15:25:35 ntpdate[3681]: ntpdate 4.2.4p8 at 1.1612-o Wed Dec  9 11:49:12
UTC 2009 (1)
18 Mar 15:25:35 ntpdate[3681]: no servers can be used, exiting
[root at core ~]#
[root at core ~]# ping -c 1 130.88.200.6
PING 130.88.200.6 (130.88.200.6) 56(84) bytes of data.
64 bytes from 130.88.200.6: icmp_seq=1 ttl=52 time=22.0 ms

--- 130.88.200.6 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 22ms
rtt min/avg/max/mdev = 22.019/22.019/22.019/0.000 ms
[root at core ~]#
[root at core ~]# time ntpdate 130.88.200.6
18 Mar 15:25:55 ntpdate[3684]: adjust time server 130.88.200.6 offset
-0.000153 sec

real    0m0.189s
user    0m0.000s
sys     0m0.003s
[root at core ~]#



Embedded using ntp-4.2.6p3:
[root at vx-200 ~]#
[root at vx-200 ~]# ntpdate -v
18 Mar 15:28:08 ntpdate[989]: ntpdate 4.2.6p3 at 1.2290 Fri Mar 18 15:23:46 UTC
2011 (1)
18 Mar 15:28:08 ntpdate[989]: no servers can be used, exiting
[root at vx-200 ~]#
[root at vx-200 ~]#
[root at vx-200 ~]# ping -c 1 130.88.200.6
PING 130.88.200.6 (130.88.200.6): 56 data bytes
64 bytes from 130.88.200.6: seq=0 ttl=52 time=22.826 ms

--- 130.88.200.6 ping statistics ---
1 packets transmitted, 1 packets received, 0% packet loss
round-trip min/avg/max = 22.826/22.826/22.826 ms
[root at vx-200 ~]#
[root at vx-200 ~]# time ntpdate 130.88.200.6
18 Mar 15:28:35 ntpdate[993]: adjust time server 130.88.200.6 offset
-0.000011 sec

real    0m8.195s
user    0m0.000s
sys     0m0.030s
[root at vx-200 ~]#





Embedded using ntp 4.2.6p1:
[root at vx-200 ~]#
[root at vx-200 ~]# ntpdate -v
18 Mar 15:18:41 ntpdate[989]: ntpdate 4.2.6p1 at 1.2158 Fri Mar 18 14:41:09 UTC
2011 (1)
18 Mar 15:18:41 ntpdate[989]: no servers can be used, exiting
[root at vx-200 ~]#
[root at vx-200 ~]#
[root at vx-200 ~]# ping -c 1 130.88.200.6
PING 130.88.200.6 (130.88.200.6): 56 data bytes
64 bytes from 130.88.200.6: seq=0 ttl=52 time=22.893 ms

--- 130.88.200.6 ping statistics ---
1 packets transmitted, 1 packets received, 0% packet loss
round-trip min/avg/max = 22.893/22.893/22.893 ms
[root at vx-200 ~]#
[root at vx-200 ~]# time ntpdate 130.88.200.6
18 Mar 15:19:05 ntpdate[993]: adjust time server 130.88.200.6 offset
-0.004568 sec

real    0m0.285s
user    0m0.000s
sys     0m0.040s
[root at vx-200 ~]#





On Fri, Mar 18, 2011 at 2:53 PM, Michael S. Zick <minimod@morethan.org>wrote:

> On Fri March 18 2011, bruce bushby wrote:
> > Hi
> >
> > I was wondering if any other people have noticed ntpdate takes a long
> time?
> >
> > My embedded board connects to the internet via ethernet through my home
> adsl
> > and can ping the internet at the same speed my linux desktop can.
> >
> > Linux desktop pc running 2.6.32.26-175 (Fedora 12) :
> > [root at core ~]# time ntpdate ntp2c.mcc.ac.uk
> > 18 Mar 13:56:01 ntpdate[1792]: adjust time server 130.88.200.6 offset
> > -0.000064 sec
> >
> > real    0m0.213s
> > user    0m0.001s
> > sys     0m0.001s
> >
> >
> >
> > Embedded OS running 2.6.38-rc5 kernel:
> > [root at vx-200 ~]# time ntpdate ntp.exnet.com
> > 18 Mar 14:01:40 ntpdate[983]: adjust time server 79.135.97.79 offset
> > -0.001003 sec
> >
>
> Different servers?
> That 79.135.97.79 appears to be your dsl gateway address, not
> ntp.exnet.com
>
> Mike
> > real    0m8.227s
> > user    0m0.020s
> > sys     0m0.030s
> >
> >
> > As you can see, there is a massive difference. I used strace to try and
> see
> > what "ntpdate" is doing....this is the part that concerns me. When it
> starts
> > looping through a series of:
> > "ERESTART_RESTARTBLOCK (To be restarted)"
> > .... basically it does this for 8 seconds and then finally updates the
> time.
> > Also, my desktop pc does not go into the same loop, nor does it deal with
> > "ERESTART_RESTARTBLOCK "
> >
> >
> > setpriority(PRIO_PROCESS, 0, -12)       = 0
> > poll([{fd=3, events=POLLIN}], 1, 60000) = ? ERESTART_RESTARTBLOCK (To be
> > restarted)
> > --- SIGALRM (Alarm clock) @ 0 (0) ---
> > sigreturn()                             = ? (mask now [])
> > clock_gettime(CLOCK_REALTIME, {1300457105, 692751159}) = 0
> > sendto(3,
> >
> "\343\0\3\372\0\1\0\0\0\1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
> > 48, 0, {sa_family=AF_INET, sin_port=htons(123),
> > sin_addr=inet_addr("130.88.200.6")}, 16) = 48
> > poll([{fd=3, events=POLLIN}], 1, 60000) = 1 ([{fd=3, revents=POLLIN}])
> > poll([{fd=3, events=POLLIN}], 1, 0)     = 1 ([{fd=3, revents=POLLIN}])
> > clock_gettime(CLOCK_REALTIME, {1300457105, 721746679}) = 0
> > recvfrom(3,
> >
> "$\2\3\354\0\0\0\260\0\0\2\346\301>\26b\321-\343\340z\221\304\377\321-\345\21\261X#\324"...,
> > 76, 0, {sa_family=AF_INET, sin_port=htons(123),
> > sin_addr=inet_addr("130.88.200.6")}, [16]) = 48
> > poll([{fd=3, events=POLLIN}], 1, 0)     = 0 (Timeout)
> > poll([{fd=3, events=POLLIN}], 1, 60000) = ? ERESTART_RESTARTBLOCK (To be
> > restarted)
> > --- SIGALRM (Alarm clock) @ 0 (0) ---
> > sigreturn()                             = ? (mask now [])
> > poll([{fd=3, events=POLLIN}], 1, 60000) = ? ERESTART_RESTARTBLOCK (To be
> > restarted)
> > --- SIGALRM (Alarm clock) @ 0 (0) ---
> > sigreturn()                             = ? (mask now [])
> > poll([{fd=3, events=POLLIN}], 1, 60000) = ? ERESTART_RESTARTBLOCK (To be
> > restarted)
> > --- SIGALRM (Alarm clock) @ 0 (0) ---
> > sigreturn()                             = ? (mask now [])
> > poll([{fd=3, events=POLLIN}], 1, 60000) = ? ERESTART_RESTARTBLOCK (To be
> > restarted)
> > --- SIGALRM (Alarm clock) @ 0 (0) ---
> > sigreturn()                             = ? (mask now [])
> > poll([{fd=3, events=POLLIN}], 1, 60000) = ? ERESTART_RESTARTBLOCK (To be
> > restarted
> >
> >
> >
> > The embedded board is connecting via 100Mbit ethernet and can ping the
> ntp
> > server with a reponse time of 22ms and zero packet loss.
> >
> > I'm guessing this has nothing to do with "buildroot" and is a
> kernel/ntpdate
> > issue but I wanted to add these findings to the list history.
> >
> >
> > Bruce
> >
> >
> >
> >
> >
> >
> >
> > I
> >
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110318/a79e4397/attachment.html>
