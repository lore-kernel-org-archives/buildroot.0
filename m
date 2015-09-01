From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Sep 2015 21:14:12 +0200
Subject: [Buildroot] Starting network...
In-Reply-To: <944894A3EB1D044A9003B2F944389BB20474C3459F@svr-wa-exch1.atg.lc>
References: <944894A3EB1D044A9003B2F944389BB20474AD978E@svr-wa-exch1.atg.lc>
 <20150825195452.2d7be97c@free-electrons.com>
 <944894A3EB1D044A9003B2F944389BB20474C3459F@svr-wa-exch1.atg.lc>
Message-ID: <20150901211412.5a71ae8e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
> cp: './output/build/linux-4.0.4/arch/arm/boot/dts/armada-385-db-ap.dts' and '/home/tclee/Downloads/aug10mon15/buildroot-2015.05/output/build/linux-4.0.4/arch/arm/boot/dts/armada-385-db-ap.dts' are the same file
> make: *** [/home/tclee/Downloads/aug10mon15/buildroot-2015.05/output/build/linux-4.0.4/.stamp_built] Error 1

Yes, it does not make sense to use BR2_LINUX_KERNEL_USE_CUSTOM_DTS for
a Device Tree file that is inside the tree. You should be using
BR2_LINUX_KERNEL_USE_INTREE_DTS instead.

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
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
