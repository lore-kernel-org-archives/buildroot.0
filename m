From: Ulf Samuelsson <ulf@atmel.com>
Date: Wed, 19 Sep 2007 07:03:41 +0200
Subject: [Buildroot] openswan 2.4.9 "natt" patch breaks linux build
Message-ID: <1190178221.4516.59.camel@aeglos.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Get the following error when I build for x86.


net/ipv4/udp.c:1100:43: error: macro "UDP_INC_STATS_BH" requires 2
arguments, but only 1 given
net/ipv4/udp.c: In function ?udp_queue_rcv_skb?:
net/ipv4/udp.c:1100: error: ?UDP_INC_STATS_BH? undeclared (first use in
this function)
net/ipv4/udp.c:1100: error: (Each undeclared identifier is reported only
once
net/ipv4/udp.c:1100: error: for each function it appears in.)
net/ipv4/udp.c:1102:40: error: macro "UDP_INC_STATS_BH" requires 2
arguments, but only 1 given
make[3]: *** [net/ipv4/udp.o] Fel 1
make[2]: *** [net/ipv4] Fel 2
make[1]: *** [net] Fel 2



diff on different "natt" patches show:

2.4.7/openswan-2.4.7.kernel-2.6-natt.patch:-
UDP_INC_STATS_BH(UDP_MIB_INDATAGRAMS, up->pcflag);
2.4.7/openswan-2.4.7.kernel-2.6-natt.patch:+
UDP_INC_STATS_BH(UDP_MIB_INDATAGRAMS, up->pcflag);
2.4.7/openswan-2.4.7.kernel-2.6-natt.patch:+
UDP_INC_STATS_BH(UDP_MIB_INERRORS, up->pcflag);
2.4.8/openswan-2.4.8.kernel-2.6-natt.patch:-
UDP_INC_STATS_BH(UDP_MIB_INDATAGRAMS, up->pcflag);
2.4.8/openswan-2.4.8.kernel-2.6-natt.patch:+
UDP_INC_STATS_BH(UDP_MIB_INDATAGRAMS, up->pcflag);
2.4.8/openswan-2.4.8.kernel-2.6-natt.patch:+
UDP_INC_STATS_BH(UDP_MIB_INERRORS, up->pcflag);
2.4.9/openswan-2.4.9.kernel-2.6-natt.patch:-
UDP_INC_STATS_BH(UDP_MIB_INDATAGRAMS, up->pcflag);
2.4.9/openswan-2.4.9.kernel-2.6-natt.patch:+
UDP_INC_STATS_BH(UDP_MIB_INDATAGRAMS);
2.4.9/openswan-2.4.9.kernel-2.6-natt.patch:+
UDP_INC_STATS_BH(UDP_MIB_INERRORS);

Clearly up->pcflag should not be removed.
I will fix this when I update openswan


-- 
Best Regards,
Ulf Samuelsson          mail:   ulf at atmel.com
Atmel Nordic AB
Box 2033, 174 52 Sundbyberg
Kavalleriv?gen 24, 174 58 Sundbyberg
Sweden
Tel:    +46 8 441 54 22 GSM:    +46 706 224457
