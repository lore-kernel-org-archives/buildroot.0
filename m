From: Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart@free-electrons.com>
Date: Tue, 14 Nov 2017 08:41:48 +0100
Subject: [Buildroot] [PATCH/next 4/5] solidrun/macchiatobin: add new
 board
In-Reply-To: <20171113233628.64f1e58d@windsurf.home>
References: <20171112201646.15558-1-geomatsi@gmail.com>
 <20171112201646.15558-5-geomatsi@gmail.com>
 <20171113122702.o63kfb7j4iny6sfl@sapphire.tkos.co.il>
 <20171113200610.ztfqw55iyk52i53a@speedy.hunter>
 <20171113233628.64f1e58d@windsurf.home>
Message-ID: <20171114074148.GC25491@kwain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas, Sergey,

On Mon, Nov 13, 2017 at 11:36:28PM +0100, Thomas Petazzoni wrote:
> On Mon, 13 Nov 2017 23:06:10 +0300, Sergey Matyukevich wrote:
> 
> > Meanwhile this is not the only problem with mainline BSP. It turned out that
> > network interfaces do not work properly neither on v4.13.11 nor in fresh v4.14.
> > Kernel v4.13.11 doesn't enable them in DTS. Kernel v4.14 does enable them,
> > but I couldn't make them work: Tx looks ok, but no Rx. Meanwhile on kernel from
> > devel-4.14/all branch from https://github.com/MISL-EBU-System-SW/mainline-public
> > management 1Gb interface appears to be working fine.
> 
> The fact that network interfaces don't work on mcbin with the stock
> 4.14 is not expected. I've added in Cc: my colleague Antoine T?nart who
> worked on this topic.
> 
> Antoine, do you know which patches are missing in 4.14 ?

The 4.14 network support for the mcbin is partial but you should be able
to use 2 out of the 4 interfaces in the mode U-Boot configured them.
tl;dr; eth0 in 10G (sfp) and eth2 in 1G.

See https://elinux.org/Marvell_EBU:MacchiatoBin for the network
interfaces description.

- eth0 should work on 10G (the sfp cage).
- eth1 is not working because of a bug which is not cleanly fixed yet.
  The devel-4.14/all branch contains a workaround (which is not suitable
  for the upstream kernel), see 0968cd30a0d4 ("DO NOT UPSTREAM: phy: marvell10g:
  Do not reset PHY autoneg for 10G KR mode"). With this patch it should
  work on 10G (sfp) with the 4.14 kernel.
- eth2 should be working just fine on 1G.
- eth3 is not supported yet, in both the upstream kernel and the
  devel-4.14/all branch.

One feature not supported in the upstream 4.14 kernel is the dynamic
reconfiguration of the interfaces, i.e. the ability to switch from/to
10G to/from 1G on eth0 and eth1 given what's connected. To do this you
would need a few device tree patches from devel-4.14/all (which will be
in 4.15):
- 0f0dfbec373e ("arm64: dts: marvell: extend the cp110 syscon register area length")
- c90dab5d2bf4 ("arm64: dts: marvell: add comphy nodes on cp110 master and slave")
- 26c08c06b827 ("arm64: dts: marvell: mcbin: add comphy references to Ethernet ports")

Also, please note the network PHY drivers are not selected to be
built-in in the arm64 upstream defconfig, so you should probably
select both CONFIG_MARVELL_PHY and CONFIG_MARVELL_10G_PHY. This is done
in the devel-4.14/all arm64 defconfig.

Antoine

-- 
Antoine T?nart, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
