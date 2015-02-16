From: Steve Kenton <skenton@ou.edu>
Date: Sun, 15 Feb 2015 21:06:33 -0600
Subject: [Buildroot] [PATCH v4] Allow a single DHCP configuration via
 the system configuration submenu
In-Reply-To: <87sie6x1ss.fsf@dell.be.48ers.dk>
References: <98184085.31058823.1422895105455.JavaMail.root@openwide.fr>	<54DF7567.7090308@ou.edu>
 <87y4nzx7bh.fsf@dell.be.48ers.dk>	<54E11806.2060109@ou.edu>
 <87sie6x1ss.fsf@dell.be.48ers.dk>
Message-ID: <54E15EB9.4090703@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/15/2015 04:11 PM, Peter Korsgaard wrote:
>>>>>> "Steve" == Steve Kenton <skenton@ou.edu> writes:
> 
> Hi,
> 
>>> So those boards have network interfaces not using eth%d names? That
>  >> sounds pretty uncommon to me. Another approach would simply be add an
>  >> init script to rename those to eth0 with nameif.
> 
>> Yes, two I have to test right now are an Asrock and an ECS mini-ITX
>  > and on both
>  > the kernel built with buildroot 2015.02-rc1 calls the network
>  > interface "sit0"
> 
> Really? sit%d is normally for point-to-point tunnels, not for real hw
> devices:
> 
> http://www.deepspace6.net/docs/iproute2tunnel-en.html
> 
I was not aware of that, but it certainly set off alarm bells in my mind.
I'm just now getting to the networking and I thought my problem was the names
being wrong. I guess I wrote a clever script to solve a problem that does not exist :-)

I don't know where "sit0" comes from but I see I'm missing a driver for my ethernet - oops!
I didn't look closely enough and just assumed they were the same two devices.

Sorry for the noise.

Steve


Here is what buildroot-2015.02-rc2 shows me with lspci -k and ifconfig -a:

03:00.0 Class 0200: 10ec:8168

lo        Link encap:Local Loopback
          inet addr:127.0.0.1  Mask:255.0.0.0
          inet6 addr: ::1/128 Scope:Host
          UP LOOPBACK RUNNING  MTU:65536  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

sit0      Link encap:IPv6-in-IPv4
          NOARP  MTU:1480  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

And here is what Ubuntu 14.04 on the same hardware show me:

03:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller (rev 06)
	Subsystem: ASRock Incorporation Motherboard (one of many)
	Kernel driver in use: r8169

eth1      Link encap:Ethernet  HWaddr bc:5f:f4:cb:1e:f6
          inet addr:192.168.1.2  Bcast:192.168.1.255  Mask:255.255.255.0
          inet6 addr: fe80::be5f:f4ff:fecb:1ef6/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:1288 errors:0 dropped:0 overruns:0 frame:0
          TX packets:783 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:1472508 (1.4 MB)  TX bytes:67242 (67.2 KB)

lo        Link encap:Local Loopback
          inet addr:127.0.0.1  Mask:255.0.0.0
          inet6 addr: ::1/128 Scope:Host
          UP LOOPBACK RUNNING  MTU:65536  Metric:1
          RX packets:286 errors:0 dropped:0 overruns:0 frame:0
          TX packets:286 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:23049 (23.0 KB)  TX bytes:23049 (23.0 KB)
