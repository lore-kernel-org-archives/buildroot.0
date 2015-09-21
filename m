From: Lee, Tommy <Tommy_Lee@alliedtelesis.com>
Date: Mon, 21 Sep 2015 16:47:14 -0700
Subject: [Buildroot] Building system for the Marvell's ARMADA A385 borad
 to resolve the VLAN trunk issue
In-Reply-To: <56008990.3010706@mind.be>
References: <944894A3EB1D044A9003B2F944389BB20474C34B0F@svr-wa-exch1.atg.lc>
 <5600612C.5060300@mind.be>
 <944894A3EB1D044A9003B2F944389BB20474C34B3C@svr-wa-exch1.atg.lc>
 <56008990.3010706@mind.be>
Message-ID: <944894A3EB1D044A9003B2F944389BB20474C34B48@svr-wa-exch1.atg.lc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,



Please view my in-line replies.



Tommy



-----Original Message-----
From: Arnout Vandecappelle [mailto:arnout at mind.be]
Sent: Monday, September 21, 2015 3:50 PM
To: Lee, Tommy; buildroot at busybox.net
Cc: Thomas Petazzoni
Subject: Re: [Buildroot] Building system for the Marvell's ARMADA A385 borad to resolve the VLAN trunk issue



.....



So what does that mean? VLAN doesn't work? Or networking doesn't work at all?



VLAN cannot be enabled. The error messages are:



# vconfig add eth0 1

vconfig: ioctl error for add: Package not installed



I see it not the basic issue. My board has eth2 and eth0. The former is DHCP enabled on my corporate network, while the latter has a static IP address in the /etc/network/interfaces file:



Auto eth0

address 192.168.1.5

netmask 255.255.0.0



Once I enabled it by the "ifup eth0" command, the error messages came up as:



# ifup eth0

[  679.334836] mvneta f1030000.ethernet eth0: could not find the PHY

[  679.340948] mvneta f1030000.ethernet eth0: cannot probe MDIO bus

ip: SIOCSIFFLAGS: No such device

ip: RTNETLINK answers: Network is unreachable



Though the IP address can be assigned to it. This address cannot be reached by a peer system on the 192.168.0.0 segment.



# ifconfig -a

eth0      Link encap:Ethernet  HWaddr 00:50:43:48:16:4D

          inet addr:192.168.1.5  Bcast:0.0.0.0  Mask:255.255.255.0

          BROADCAST MULTICAST  MTU:1500  Metric:1

          RX packets:0 errors:0 dropped:0 overruns:0 frame:0

          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0

          collisions:0 txqueuelen:532



.....



Does mvebu_v7 have VLAN enabled?



It originally has no VLAN enabled. Last week I added following three lines:



CONFIG_CFG8021Q=y

CONFIG_MACVLAN=y

CONFIG_IPVLAN=y



The vconfig messages are still same.



.....



What discovery?



The discovery is depicted as below:



ARM system type (Marvell PXA168/910/MMP2)  --->

       ( ) Marvell Dove

       ( ) Marvell MV78xx0

-----

Marvell PXA168/910/MMP2 Implmentations  --->

    [*] Marvell DB-78x00-BP Development Board (NEW)

    [ ] Marvell RD-78x00-mASA Reference Design (NEW)



There is no implementation for the A385 board but the MV78xx0-based ARMADA XP boards.



.....



Well, that's what you tried before, no?



This is my first time of using the "BR2_LINUX_KERNEL_INTREE_DTS_NAME="armada-388-db-ap" setting.



Regards,

Arnout



________________________________
This e-mail message is for the sole use of the intended recipient(s) and may contain confidential and privileged information. Any unauthorized review, use, disclosure or distribution is prohibited. If you are not the intended recipient, please contact the sender by reply e-mail and destroy all copies of the original message. If you are the intended recipient, please be advised that the content of this message is subject to access, review and disclosure by the sender's e-mail System Administrator.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150921/68e8238c/attachment.html>
