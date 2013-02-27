From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 27 Feb 2013 22:47:24 +0100
Subject: [Buildroot] segfault in uClibc-0.9.33.2 when using busybox ip
In-Reply-To: <1361983607940-41081.post@n4.nabble.com>
References: <1361983607940-41081.post@n4.nabble.com>
Message-ID: <512E7EEC.7010007@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 27/02/13 17:46, mathematician1975 wrote:
> I have used buildroot to generate my crosstools, root file system, kernel
> (3.6.11) and busybox (1.21.0) for an i386 (Geode) target board. Basically I
> am using buildroot to generate everything. I was recently trying to
> configure my network but when I invoked the following from the command line
>
> # ip addr show dev eth0
>
> I received the following report of a segfault.
>
> 2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast qlen
>      1000 link/ether 00:18:7d:19:a0:d8 brd ff:ff:ff:ff:ff:ff
>      inet 172.18.255.212/24 brd 172.18.255.255 scope global eth0
> [  331.700545] ip[951]: segfault at 0 ip b76e1f26 sp bfbd29b0 error 4 in
> libuClibc-0.9.33.2.so[b76b5000+4d000]
> Segmentation fault
>
> I have searched these archives for similar reports but I cannot find
> anything. I would be very grateful for any advice that anyone who has had a
> similar problem can offer, or how I go about trying to establish if this is
> down to user error on my part or a bug in busybox/uClibc.

  User error is unlikely, unless you did something very strange while 
building. Given that the segfault happens in uClibc, it's most likely a 
uClibc problem. Definitely not a buildroot problem :-)

  Here are some hints how to debug:

- Rebuild with another uClibc version.

- Do an 'objdump -d output/staging/lib/libc.so | less' and look what is 
at address b76e1f26.

- Run it in a chroot or emulated environment. If that works, then it's 
most likely a problem with mismatch of your build options and the Geode 
processor (so user error after all :-).

- Run the 'ip' program in a debugger (gdbserver) to find what goes wrong.

- Check uClibc mailing lists for similar issues.

  Good luck!

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
