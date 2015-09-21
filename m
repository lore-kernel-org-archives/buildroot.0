From: Lee, Tommy <Tommy_Lee@alliedtelesis.com>
Date: Mon, 21 Sep 2015 15:28:15 -0700
Subject: [Buildroot] Building system for the Marvell's ARMADA A385 borad
 to resolve the VLAN trunk issue
In-Reply-To: <5600612C.5060300@mind.be>
References: <944894A3EB1D044A9003B2F944389BB20474C34B0F@svr-wa-exch1.atg.lc>
 <5600612C.5060300@mind.be>
Message-ID: <944894A3EB1D044A9003B2F944389BB20474C34B3C@svr-wa-exch1.atg.lc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,



Please view my in-line relies.



Tommy



-----Original Message-----
From: Arnout Vandecappelle [mailto:arnout at mind.be]
Sent: Monday, September 21, 2015 12:58 PM
To: Lee, Tommy; buildroot at busybox.net
Cc: Thomas Petazzoni
Subject: Re: [Buildroot] Building system for the Marvell's ARMADA A385 borad to resolve the VLAN trunk issue



On 21-09-15 20:20, Lee, Tommy wrote:

> Hi Buildroot Busybox,

>

>

>

> My host is Ubuntu-14.04 LTS. My Buildroot release is 2015.05. I made

> the former meet the latter's requirements. My target is Marvell ARMADA

> A385 (ARM-Cortex-A9) DB-88F6820-GP.

>

>

>

> While resolving my BuidrootLinux-4.0.4 VLAN trunk reachability issue,

> I discovered that Buildroot-2015.05 supports Marvell's MV78x000 based

> ARMADA XP Family, not the DB-88F6820-GPboard I am currently using.



I think you're confusing buildroot with Linux. Buildroot doesn't have a defconfig for Armada XP as far as I know.



I noticed that Buildroot has its own .config file which is created by the "make menuconfig" command. I have created this .config file and am using it for my work.



So you'll have to configure buildroot yourself. Start with selecting

BR2_cortex_a9 for the architecture, configure the toolchain as you like. Then for the kernel, select an in-tree defconfig and fill in "mvebu_v7" for the defconfig name. Also select an in-tree device tree and fill in armada-388-gp ".



My Buildroot .config file has following six lines relevant to this subject:



BR2_ENDIAN="LITTLE"

BR2_cortex_a9=y

BR2_LINUX_KERNEL_USE_DEFCONFIG=y

BR2_LINUX_KERNEL_DEFCONFIG="mvebu_v7"

BR2_LINUX_KERNEL_USE_INTREE_DTS=y

BR2_LINUX_KERNEL_INTREE_DTS_NAME="armada-385-db-ap"



My built kernel zImage has a root file system integrated. My U-Boot "bootz 0x02000000 - 0x01000000' command successfully booted my board. However, to enable VLAN for my work, the network interface connected to a local segment, used as the VLAN trunk, cannot ping out to a peer system on the segment.



I booted up my board using Marvell's kernel zImage and DTB. There exists no such VLAN trunk reachability problem at all.



Marvells totally gave me three DTB files, I tried my zImage and all them, one at time. Unfortunately the VLAN trunk problem still exists. With the belief that the problem is in the configuration of my kernel, Last week I used the "make linux-menuconfig" command and created my kernel .config file using the following two lines replacing the above DECONFIG lines.



BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y

BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/armada385/.config"



Because of the discovery I mentioned in my preceding email, I quit the "make linux-menuconfig" process and reported the issue this morning.



Taking your suggestion, I will rebuild my kernel zImage and DTB with "BR2_LINUX_KERNEL_INTREE_DTS_NAME="armada-388-db-ap" setting, to see whether the VLAN trunk reachability problem can be resolved.



Thomas Petazzoni actually worked on this board I think. Thomas, why didn't you submit a defconfig? :-P





Regards,

Arnout



>

>

>

> With the current board, I have three approaches to resolve the trunk

> problem on it, from top to bottom:

>

>

>

> 1.      Pick "Marvell MV78xx0", from the Buildroot-2015.05 "make

> linux-menuconfig" ARM system type list, for ARMADA A385 to create our .config file.

>

> 2.      Upgrade Buildroot-2015.05 to 2015.08 to see whether the ARMADA A38x

> family is included in the ARM system type list.

>

> 3.      Get back to buildroot-2012.11-2015_T1.0 which Marvell built their system

> successfully. Follow Marvell's procedures to build my system.

>

>

>

> I hope you would comment on the above approaches.

>

>

>

> Tommy

>

>

> ----------------------------------------------------------------------

> ---------- This e-mail message is for the sole use of the intended

> recipient(s) and may contain confidential and privileged information.

> Any unauthorized review, use, disclosure or distribution is

> prohibited. If you are not the intended recipient, please contact the

> sender by reply e-mail and destroy all copies of the original message.

> If you are the intended recipient, please be advised that the content

> of this message is subject to access, review and disclosure by the

> sender's e-mail System Administrator.

>

>

> _______________________________________________

> buildroot mailing list

> buildroot at busybox.net<mailto:buildroot@busybox.net>

> http://lists.busybox.net/mailman/listinfo/buildroot

>





--

Arnout Vandecappelle                          arnout at mind be

Senior Embedded Software Architect            +32-16-286500

Essensium/Mind                                http://www.mind.be

G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven

LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle

GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

________________________________
This e-mail message is for the sole use of the intended recipient(s) and may contain confidential and privileged information. Any unauthorized review, use, disclosure or distribution is prohibited. If you are not the intended recipient, please contact the sender by reply e-mail and destroy all copies of the original message. If you are the intended recipient, please be advised that the content of this message is subject to access, review and disclosure by the sender's e-mail System Administrator.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150921/52464201/attachment.html>
