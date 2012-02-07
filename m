From: Jigar SOLANKI <jigar.solanki@labri.fr>
Date: Tue, 07 Feb 2012 14:28:11 +0100
Subject: [Buildroot] Buildroot networking problems
In-Reply-To: <87ipjjvgtg.fsf@macbook.be.48ers.dk>
References: <4F302D71.9020308@labri.fr> <87ipjjvgtg.fsf@macbook.be.48ers.dk>
Message-ID: <4F3126EB.8000409@labri.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 06/02/2012 21:37, Peter Korsgaard a ?crit :
>>>>>> "Jigar" == Jigar SOLANKI <jigar.solanki@labri.fr> writes:
> 
>  Jigar> Hi all,
>  Jigar> I've built a Buildroot Linux on a Leon3 CPU, everything works fine
>  Jigar> except the network configuration.
> 
>  Jigar> I have the eth0 interface configured correctly with a default gw,
>  Jigar> netmask etc...but when I ping the interface adress itself, it doesnt
>  Jigar> respond at all.
> 
>  Jigar> I've also tried to ping 127.0.0.1, same result, lo is not responding.
>  Jigar> (I have read some posts on resolv.conf but in my case, it is not a dns
>  Jigar> related issue, I ping numerical adresses..)
> 
> Please provide some more info. Please paste output of ipconfig -a. What
> kind of errors do you get?
> 

I do not have any errors. The ping just simply do not respond. The
packets are lost.

There are two interfaces eth0 and lo.

eth0 : 10.10.10.0/24  IP:10.10.10.1 Gw : 10.10.10.254

So, when I ping 10.10.10.254 from 10.10.10.1, I dont have any response :
the packets are lost, tcpdump on the gw (10.10.10.254) shows incoming
ICMP packets, though !

When I ping 10.10.10.1 from 10.10.10.254, same result, no response, but
incomming ICMP requests are correctly seen !

And last test, when I ping 127.0.0.1, exactly same result : no response
at all, the packets are lost.

I have checked iptables (everything is allowed) and I have checked
/proc/net/icmp_ignore_all is set to 0, icmp_ignore_broadcast is set to 1.

So I tried TCP : telnet 10.10.10.254 22 (  I have a ssh daemon running
on the gateway), no response from the gateway (I still see incomming TCP
SYN on the gateway though.)

Here's the requested output(ifconfig -a ; route -n; some pings):


# ifconfig -a
eth0      Link encap:Ethernet  HWaddr 00:00:7C:CC:01:45
          inet addr:10.10.10.1  Bcast:10.10.10.255  Mask:255.255.255.0
          inet6 addr: fe80::200:7cff:fecc:145/64 Scope:Link
          UP BROADCAST RUNNING  MTU:1500  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:5 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:0 (0.0 B)  TX bytes:398 (398.0 B)

lo        Link encap:Local Loopback
          inet addr:127.0.0.1  Mask:255.0.0.0
          inet6 addr: ::1/128 Scope:Host
          UP LOOPBACK RUNNING  MTU:16436  Metric:1
          RX packets:3 errors:0 dropped:0 overruns:0 frame:0
          TX packets:3 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:252 (252.0 B)  TX bytes:252 (252.0 B)

sit0      Link encap:IPv6-in-IPv4
          NOARP  MTU:1480  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

# route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use
Iface
10.10.10.0      0.0.0.0         255.255.255.0   U     0      0        0 eth0
0.0.0.0         10.10.10.254    0.0.0.0         UG    0      0        0 eth0

# route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use
Iface
10.10.10.0      0.0.0.0         255.255.255.0   U     0      0        0 eth0
0.0.0.0         10.10.10.254    0.0.0.0         UG    0      0        0 eth0

# ping -c 5 127.0.0.1
PING 127.0.0.1 (127.0.0.1): 56 data bytes

--- 127.0.0.1 ping statistics ---
5 packets transmitted, 0 packets received, 100% packet loss
# ping -c 5 10.10.10.1
PING 10.10.10.1 (10.10.10.1): 56 data bytes

--- 10.10.10.1 ping statistics ---
5 packets transmitted, 0 packets received, 100% packet loss
# ping -c 5 10.10.10.254
PING 10.10.10.254 (10.10.10.254): 56 data bytes

--- 10.10.10.254 ping statistics ---
5 packets transmitted, 0 packets received, 100% packet loss



-- 
Jigar SOLANKI

LaBRI - UMR 5800
Universit? Bordeaux 1
351 Cours de la Lib?ration
F-33405 Talence Cedex
Phone : (+33) 5 4000 24 87
Fax   : (+33) 5 4000 66 69
Web   : http://www.labri.fr/perso/solanki

* Please do not print this e-mail unless it's really necessary *
---


-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 554 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120207/e600d92a/attachment.asc>
