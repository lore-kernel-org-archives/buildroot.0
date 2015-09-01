From: Lee, Tommy <Tommy_Lee@alliedtelesis.com>
Date: Tue, 1 Sep 2015 11:33:41 -0700
Subject: [Buildroot] Starting network...
In-Reply-To: <20150825195452.2d7be97c@free-electrons.com>
References: <944894A3EB1D044A9003B2F944389BB20474AD978E@svr-wa-exch1.atg.lc>
 <20150825195452.2d7be97c@free-electrons.com>
Message-ID: <944894A3EB1D044A9003B2F944389BB20474C3459F@svr-wa-exch1.atg.lc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

My system's dhcpcd command only enables the unexpected eth2 for networking with no problems. What I am expecting is that Eth0 and eth1 are initially enabled by my system boot process - one for corporate networking; other for local segment engineering work.

Reading your "Device Tree for Dummies" PDF, I rebuilt my zImage and armada-385-db-ap.dtb with the .config DTS settings as:

BR2_LINUX_KERNEL_DTS_SUPPORT=y
# BR2_LINUX_KERNEL_USE_INTREE_DTS is not set
BR2_LINUX_KERNEL_USE_CUSTOM_DTS=y
BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="./output/build/linux-4.0.4/arch/arm/boot/dts/armada-385-db-ap.dts"

The make process ends up with an erratic message saying:

cp: './output/build/linux-4.0.4/arch/arm/boot/dts/armada-385-db-ap.dts' and '/home/tclee/Downloads/aug10mon15/buildroot-2015.05/output/build/linux-4.0.4/arch/arm/boot/dts/armada-385-db-ap.dts' are the same file
make: *** [/home/tclee/Downloads/aug10mon15/buildroot-2015.05/output/build/linux-4.0.4/.stamp_built] Error 1

I am resolving this error now. Your help is definitely welcome.

Tommy



-----Original Message-----
From: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com]
Sent: Tuesday, August 25, 2015 10:55 AM
To: Lee, Tommy
Cc: buildroot at busybox.net
Subject: Re: [Buildroot] Starting network...

Tommy,

On Mon, 24 Aug 2015 16:36:22 -0700, Lee, Tommy wrote:
> Hi Buildroot mailing list,
>
> My host is Ubuntu-14.04 LTS. My Buildroot release is 2015.05. I have made the former meet the latter's requirements. My target is Marvell ARMADA A385 (ARM-Cortex-A9) DB-88F6820-GP. Last week I succeeded in the building of the zImage file of my Linux system which has a rootfilesystem integrated, and a armada-385-db-ap.dtb file, The DB-88F6820-GP on-board U-Boot-1.73 commands are able to the boot up the system. The U-Boot bootargs string is:
>
> "setenv bootargs console=ttyS0,115200 root=/dev/ram0 rw rootdelay=2"
> But, I discovered, this system cannot enable the eth0 device at the boot time. The "Starting network..." messages are:
>
> Starting network...
> [    1.618607] mvneta f1030000.ethernet eth0: could not find the PHY
> [    1.624732] mvneta f1030000.ethernet eth0: cannot probe MDIO busip: SIOCSIFFLAGS: No such device

This is a kernel/hardware issue, that has nothing to do with Buildroot.

However, beware that if you run the mainline (official) Linux kernel on Armada 38x, the first network interface (from a HW point of view) is seen as eth1 in Linux, and the second network interface (from a HW point of view) is seen as eth0 in Linux. This is due to the ordering of the nodes in the Device Tree, which are ordered by register address.

Best regards,

Thomas
--
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering http://free-electrons.com

This e-mail message is for the sole use of the intended recipient(s) and may contain confidential and privileged information. Any unauthorized review, use, disclosure or distribution is prohibited. If you are not the intended recipient, please contact the sender by reply e-mail and destroy all copies of the original message. If you are the intended recipient, please be advised that the content of this message is subject to access, review and disclosure by the sender's e-mail System Administrator.
