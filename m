From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Jun 2014 22:29:01 +0200
Subject: [Buildroot] dtb or dtsi ?
In-Reply-To: <CAAXf6LXV=jRqpCpx5FU31cNVcVXe_wNK6ut6GvWQzOF1bcrbLA@mail.gmail.com>
References: <CAHvj1qbZWcdUvq7du=Xo2KXpA_WjXvPr8+wg61niR7TeLVToRw@mail.gmail.com>
 <CAAXf6LXV=jRqpCpx5FU31cNVcVXe_wNK6ut6GvWQzOF1bcrbLA@mail.gmail.com>
Message-ID: <20140624222901.1462d902@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bruce, Thomas,

On Tue, 24 Jun 2014 11:36:29 +0200, Thomas De Schampheleire wrote:

> > Apologies if these are junior/lazy questions....but I've been struggling for
> > 5 days now :(
> >
> > What is the difference between "dtb" and "dtsi"?
> >
> 
> dtb = device tree blob
> dts = device tree source
> dtsi = like dts, but I think the 'i' is to indicate that this file is
> supposed to be included in another dts(i) file.

Correct, "dtsi" stands for Device Tree Source Include.

> The dtb is the compiled version of the dts(i).

Of a .dts. In general, .dtsi files are never used directly to build
a .dtb, instead it's a .dts (which potentially includes one or
several .dtsi) that is compiled into a .dtb.

> > I feel I should be using
> > BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun7i-a20.dtsi"
> 
> You should set a 'dts' file here, not dtsi. The dtsi is supposed to be
> included from a toplevel dts file, and there exist make rules to
> convert dts->dtb but not dtsi->dtb.
> Note: the compilation step is done by dtc (device tree compiler).

Generally speaking:

	.dtsi	=> description of the processor/SoC hardware
	.dts	=> description of a board hardware

(there are some exceptions to this rule, but that's the general
principle).

So indeed, using "sun7i-a20.dtsi" as the name for a Device Tree to be
used to boot a system doesn't make sense, because sun7i-a20 is a
processor/SoC, it's not a board. And there's no way to boot a kernel on
just a processor, you have to have a board around it on which the
processor/SoC and a bunch of other useful components such as some RAM,
flash and others are soldered.

> >  ....Do I still need "fex" if i am using "dts"?
> 
> I suppose not. According to wikipedia fex is a proprietary alternative
> to device trees, and so you shouldn't need both. I haven't worked with
> fex nor allwinner before.

Actually, it depends which kernel you're using. If you're using the
non-mainline kernel from the linux-sunxi folks (I think it's based on
3.4 currently), then you have to use fex. If you use a modern mainline
kernel (which has support for a number of features of the Allwinner
SoCs), then you must use a Device Tree.

Bruce, the most essential information is missing from your e-mail: on
which board do you want to run this system? If you tell us the
model/name of your board, we should fairly easily be able to tell you
which Device Tree to use. Here are the Allwinner A20 boards currently
supported in the linux mainline (as of 3.16-rc) :

$ ls -1 arch/arm/boot/dts/sun7i-a20*.dts
arch/arm/boot/dts/sun7i-a20-cubieboard2.dts
arch/arm/boot/dts/sun7i-a20-cubietruck.dts
arch/arm/boot/dts/sun7i-a20-i12-tvbox.dts
arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts

If you want to have a Buildroot configuration for one of these boards,
use:

 * 'sunxi' as the name of the defconfig to use for the kernel
   configuration

 * one of 'sun7i-a20-cubieboard2', 'sun7i-a20-cubietruck',
   'sun7i-a20-i12-tvbox' or 'sun7i-a20-olinuxino-micro' for the Device
   Tree file name.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
