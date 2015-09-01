From: Lee, Tommy <Tommy_Lee@alliedtelesis.com>
Date: Tue, 1 Sep 2015 15:03:58 -0700
Subject: [Buildroot] Starting network...
In-Reply-To: <20150901211412.5a71ae8e@free-electrons.com>
References: <944894A3EB1D044A9003B2F944389BB20474AD978E@svr-wa-exch1.atg.lc>
 <20150825195452.2d7be97c@free-electrons.com>
 <944894A3EB1D044A9003B2F944389BB20474C3459F@svr-wa-exch1.atg.lc>
 <20150901211412.5a71ae8e@free-electrons.com>
Message-ID: <944894A3EB1D044A9003B2F944389BB20474C345D2@svr-wa-exch1.atg.lc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,



In the buildroot-2015.05 folder the armada-385-gp.dts file does not exist but the armada-385-db-ap.dts one.



Last week I built armada-385-db-ap.dtb using the following .config DTS and eth0 with no problems:



BR2_SYSTEM_DHCP="eth0"

BR2_LINUX_KERNEL_DTS_SUPPORT=y

BR2_LINUX_KERNEL_USE_INTREE_DTS=y

# BR2_LINUX_KERNEL_USE_CUSTOM_DTS is not set

BR2_LINUX_KERNEL_INTREE_DTS_NAME="armada-385-db-ap"



I just used the settings again and built zImage and armada-385-db-ap. This time the armada-385-db-ap.dtb has the same md5sum value as the one I built last week.



On the board, the boot process shows:



Starting network...

udhcpc (v1.23.2) started

Sending discover...

[    4.732186] mvneta f1070000.ethernet eth2: Link is Up - 100Mbps/Half - flow f

Sending discover...

Sending select for 10.28.1.47...

Lease of 10.28.1.47 obtained, lease time 1209600

deleting routers

adding dns 10.28.5.20

adding dns 10.4.5.7

ssh-keygen: generating new host keys: RSA1 RSA DSA ECDSA ED25519

Starting sshd: OK

Starting network management serv[   11.715258] NET: Registered protocol family 0

ices:.



Welcome to Buildroot

buildroot login:



After login, the ifconfig result is:



# ifconfig

eth2      Link encap:Ethernet  HWaddr 00:50:43:EC:16:4D

          inet addr:10.28.1.47  Bcast:10.28.1.255  Mask:255.255.255.0

          inet6 addr: fe80::250:43ff:feec:164d/64 Scope:Link

          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1

          RX packets:1877 errors:0 dropped:0 overruns:0 frame:0

          TX packets:10 errors:0 dropped:0 overruns:0 carrier:0

          collisions:0 txqueuelen:532

          RX bytes:213843 (208.8 KiB)  TX bytes:1332 (1.3 KiB)

          Interrupt:38



lo        Link encap:Local Loopback

          inet addr:127.0.0.1  Mask:255.0.0.0

          inet6 addr: ::1/128 Scope:Host

          UP LOOPBACK RUNNING  MTU:65536  Metric:1

          RX packets:0 errors:0 dropped:0 overruns:0 frame:0

          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0

          collisions:0 txqueuelen:0

          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)



The interesting point is that eth2 is still picked up by the system for the dhcpcd process, not eth0 which is set in the .config file. Probably you know the reason for this unexpected result.



I am resolving the eth0 issue now. Your help will be definitely appreciated.



Tommy







-----Original Message-----
From: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com]
Sent: Tuesday, September 01, 2015 12:14 PM
To: Lee, Tommy
Cc: buildroot at busybox.net
Subject: Re: [Buildroot] Starting network...



Hello,



On Tue, 1 Sep 2015 11:33:41 -0700, Lee, Tommy wrote:



> My system's dhcpcd command only enables the unexpected eth2 for networking with no problems. What I am expecting is that Eth0 and eth1 are initially enabled by my system boot process - one for corporate networking; other for local segment engineering work.

>

> Reading your "Device Tree for Dummies" PDF, I rebuilt my zImage and armada-385-db-ap.dtb with the .config DTS settings as:

>

> BR2_LINUX_KERNEL_DTS_SUPPORT=y

> # BR2_LINUX_KERNEL_USE_INTREE_DTS is not set

> BR2_LINUX_KERNEL_USE_CUSTOM_DTS=y

> BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="./output/build/linux-4.0.4/arch/arm/boot/dts/armada-385-db-ap.dts"

>

> The make process ends up with an erratic message saying:

>

> cp:

> './output/build/linux-4.0.4/arch/arm/boot/dts/armada-385-db-ap.dts'

> and

> '/home/tclee/Downloads/aug10mon15/buildroot-2015.05/output/build/linux

> -4.0.4/arch/arm/boot/dts/armada-385-db-ap.dts' are the same file

> make: ***

> [/home/tclee/Downloads/aug10mon15/buildroot-2015.05/output/build/linux

> -4.0.4/.stamp_built] Error 1



Yes, it does not make sense to use BR2_LINUX_KERNEL_USE_CUSTOM_DTS for a Device Tree file that is inside the tree. You should be using BR2_LINUX_KERNEL_USE_INTREE_DTS instead.



Basically, Buildroot supports two cases:



* The Device Tree for your platform is part of the Linux kernel

   sources, i.e it is in arch/arm/boot/dts/ in your kernel tree. In

   this case, you should use BR2_LINUX_KERNEL_USE_INTREE_DTS=y, and

   then give only the name of that Device Tree (armada-385-gp). This is

   what you should be using.



* The Device Tree for your platform is *not* part of the Linux kernel

   sources. It is available separately. In this case, you should use

   BR2_LINUX_KERNEL_USE_CUSTOM_DTS=y, and specify the full path to your

   Device Tree file.



Best regards,



Thomas

--

Thomas Petazzoni, CTO, Free Electrons

Embedded Linux, Kernel and Android engineering http://free-electrons.com

________________________________
This e-mail message is for the sole use of the intended recipient(s) and may contain confidential and privileged information. Any unauthorized review, use, disclosure or distribution is prohibited. If you are not the intended recipient, please contact the sender by reply e-mail and destroy all copies of the original message. If you are the intended recipient, please be advised that the content of this message is subject to access, review and disclosure by the sender's e-mail System Administrator.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150901/282071e5/attachment.html>
