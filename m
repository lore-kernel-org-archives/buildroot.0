From: Ulf Samuelsson <ulf@atmel.com>
Date: Tue, 31 Jul 2007 01:53:16 +0200
Subject: [Buildroot] Redundant kernel patches in the
	snapshot	from20070718
In-Reply-To: <20070730192728.GA27993@aon.at>
References: <1185459798.1044.43.camel@localhost.localdomain>
	<1185468722.5580.107.camel@elrond.sweden.atmel.com>
	<20070727113002.GF22789@aon.at>
	<026b01c7d2c2$cbcd3460$dcc4af0a@atmel.com>
	<20070730192728.GA27993@aon.at>
Message-ID: <1185839596.30603.30.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

m?n 2007-07-30 klockan 21:27 +0200 skrev Bernhard Fischer:
> On Mon, Jul 30, 2007 at 05:51:49PM +0200, Ulf Samuelsson wrote:
> >> On Thu, Jul 26, 2007 at 06:52:02PM +0200, Ulf Samuelsson wrote:
> >>>tor 2007-07-26 klockan 16:23 +0200 skrev Hans-Christian Egtvedt:
> >>>> Hello,
> >>>> 
> >>>> I am a bit confused to where I should put the kernel patch, there seems
> >>>> to be two places expecting the same file.
> >>>> 
> >>>> toolchain/kernel-headers/kernel-headers-new.makefile expects them to be
> >>>> in toolchain/kernel-headers.
> >>>> 
> >>>> target/linux/Makefile.in expects them to be in
> >>>> $(BR2_BOARD_PATH)/kernel-patches.
> >>>
> >>>
> >>>When you build the kernel-headers today you extract the kernel source
> >>>to build_<ARCH> and you store the kernel headers in
> >>>toolchain_build_<ARCH>/linux
> >>>
> >>>You have a single set of patches in toolchain header directory,
> >>>This causes the following problems:
> >>>* Confusion due to using same targets in two makefile fragments.
> >> 
> >> What two targets are you referring to? Please give an example (excluding
> >> find target/ -iname "linux*mk").
> >> 
> >
> >Try building Linux 2.6.21.3 with 2.6.21.5 headers.
> 
> "Doctor it hurts when i.."
> 
> I don't buy this sort of argument ;)

You asked for an example ...

> 
> >The bug is that "package/linux/Makefile.in" does not apply the kernel
> >patches when the kernel headers and the linux is not the same.
> 
> What is a legitimate scenario where you would do this?
> 
> In legacy updates, you'd backport fixes to a known and blessed version
> of the kernel.

You are making the wrong interpretations of my text (see below)

> 
> For a new release you should (or at least i would strive to) support
> something recent, so there still the sane hdr==src holds true.
> 
> >>>* Cannot apply architecture specific patches, since
> >>>  you may have conflicts between several patch-set's.
> >>>* Cluttered directory
> >> 
> >> hm? Please explain.
> >> 
> >
> >The AVR32 chips and the AT91 ARM chips uses the same peripherals,
> >and therefore can use the same drivers.
> 
> fair enough.
> 
> So there is _one_ patch which is submitted upstream that is
> linux-1.2.3.4-add-thisSpecificDevice.patch
> 
> >The linux support is developed by two teams.
> 
> This in in no way relevant :)

Yes it is:
Assume company X licenses a peripheral from company Z.
Assume company Y licenses the same peripheral from company Z.
A bug is found in the driver, and both company X and Y create 
a patch to workaround that patch.
Both patches are valid but affect the same part of the linux source
code.
It will not be possible to apply both.

I provide you examples.
You should not assume that the single example i give is 
the only possible example.

When I give you 2.6.21.3 + 2.6.21.5, you assume that I mean
an earlier version of the kernel.
You should assume that I mean a *different* version of the kernel.
There are plenty of good reasons why you would want to try
a different version of the kernel without having to rebuild buildroot.
I am sure that you can figure that out for yourself.


> >
> >If the SPI support in Linux is updated, then the same patch will be present
> >both in the patchset for the AT91 and the patchset for the AVR32.
> 
> This is flawed. You're adding one device.
> 
> I my POV a board consists of components.
> 
> E.g. (just for fun) a graphic board let's say some board from S3 as an
> example consists of:
> 
> Board(S3, ViRGE)
> #if Data
> Begin
> 	Vendor("S3")
> 	Model("ViRGE")
> 	Driver(chipset,	S3/ViRGE, virge_chipset)
> 	Driver(ramdac,	S3/ViRGE, virge_ramdac)
> 	Driver(clock,	S3/ViRGE, virge_clock)
> End
> #endif
> 
> i.e. a chipset, a ramdac and a clock.
> 
> Now if you do a board which uses a "custom" clock (or ramdac for that
> matter), you just add a TI_0815_clock or TI_0815_ramdac2.
> 
> You certainly do _not_ duplicate all other components of the
> board(-driver).

We are talking system-on-a-chip here. Not external peripherals.
As I said, you have two different groups (albeit in the same company)
which provides full patchsets for their own chips.

Earlier linux kernels did not contain the common atmel spi driver.
drivers/spi/atmel_spi.c
drivers/spi/atmel_spi.h

When this was released, it became part of 

> 
> >If the same patch is applied twice to the kernel, it will fail the second time
> >even if the patch is OK to apply once.
> 
> Yea, this exactly the reason is why it is flawed ;)
> You don't even need peer-review, patch(1) will make this obvious.
> 

It is flawed to try to patch a single kernel source tree with 
both patches, and that is why one linux source tree per group of patches
is neccessary if you want to build support for several chips of the same
architecture within a single buildroot source tree.

Thus "build_<arch>" is the wrong place to put the linux kernel.
It should reside in "project_build_<arch>".


> []
> >linux then needs to be unpacked in "project_build_dir"
> 
> If you go down that route then yes. This is not the case today, is it?
> 
> >>>[PATCH NAMING]
> []
> >>>Everytime you want to add a new kernel version, like 2.6.22.2
> >>>you will have to add 770 kB to the buildroot tree, so it
> >>>is not viable long term.
> >> 
> >> I wholeheartedly agree that it supporting several kernel-versions is not
> >> viable. It doesn't make sense to keep multiple old $PATCH versions but
> >> only the latest.
> >> 
> >> Also, it doesn't make sense to me to support more than let's say 2 or 3
> >> versions per MINOR (e.g. 2.6.20.x, 2.6.22.x which is current at the time
> >> of this writing.)
> >
> >I think we should support building any version of the kernel,
> >and then we should allow the user to select which set of kernel headers
> >should be applied, and if the user selects to use anything outside the
> >things we have tested, then they are on their own.
> 
> indeed. Using hdr==src is fine. Certain versions of the kernel may even
> have additional patches to add certain features. That's the way i
> handled it up until now myself.

So how do you then build two different kernel versions in one buildroot
tree? - You can't!

> 
> >I would like buildroot to be more than a toy.
> >This means that we should not have built in mechanisms to obsolete stuff.
> >I have customers which wants to keep products in the field for 10-20 years
> >and still maintain them.
> 
> It is very unlikely that anybody will then use linux-6.7.38.2 headers
> and a kernel-2.4.9. Those people will backport fixes to the blessed
> version the used before (or something vaguely similar) instead.

No but I can see people using linux-2.6.23-rc1 with linux-2.6.22.1
headers.


> I'd call using headers from linux-in-20-years but a kernel from 2004 a
> toy application.
> >

You defined this as how the customer would use it, I didn't.
The normal customer would today want to use linux-2.6.22.1 headers
and in 20 years he would STILL like to use linux-2.6.22.1 headers
but he will not be able to do that, because you only would like to
maintain support for a few kernel headers version.
Maybe during that time, he has decided to use linux-2.6.22.2 
due to some bug fixes, but there is no support for linux-2.6.22.2
with the current buildroot.


> >This means that backwards compatability is very important.
> >One way to handle that is to download the neccessary patches for
> >old versions from a server instead of keeping them in the main buildroot tree.
> >
> >
> >>>[PATCH SELECTION]
> >>>We need to be able to build any kernel, not just the kernel
> >>>currently supported by the kernel headers.
> >>>It is probably desirable to be able to use the kernel headers
> >>>for the same version as we are using, but also it should be
> >>>possible to have kernel headers for one version of linux
> >>>and use a different kernel for your target.
> >> 
> >> Nowadays there is no need for such a kludge anymore.
> >> 
> >
> >Yes there is.
> >If someone for some specific reason wants to use a certain version
> >of Linux, and the kernel patches does not apply cleanly to that
> >kernel, then you might be able to live with having kernel patches for
> >a slightly off version of linux instead.
> 
> sure. If you want to use an arbitrary kernel (or package for that
> matter), you can easily cross-compile it. It's not that we are removing
> old toolchains or the like.

Not within the current buildroot.
Outside buildroot, you can of course do anything you want.
> 
> >>>I think that it should be possible in the menu system to select 
> >>>which kernel to use (2.6.X.Y), and, for the kernel headers,
> >>>we should have a finite number of patches which can be applied
> >>>to generate the kernel headers. 
> >>>These can be selectable using a "choice".
> >>>A default would be selected based on the kernel version but,
> >>>if the user so chooses, he can apply whatever patch he wants.
> >>>
> >>>This would allow you to use a 2.6.21.6 kernel while applying
> >>>the kernel patches for 2.6.21.5.
> >> 
> >> This is very brittle.
> >> Of course we can provide "generic" patches of the form
> >> linux-2.6.2-this-that.patch
> >> and try to apply them to linux-2.6.2[^\.]*
> >> But this will fail if spots change under the patch. This is not 100%
> >> robust imo.
> >
> >Not sure what you mean by "spots" but I
> 
> source code where a patch was ment to be applied to.
> 
> >>>Eventually the available patches will not apply cleanly,
> >>>and then it is time to generate new patches,
> >>>but it is likely that most of the patches will apply.
> >> 
> >> It may be likely across PATCH revisions but is not bullet proof.
> >
> >No, a guy locked to chains inside a dungeon, will not fall off a cliff.
> >A guy without the chain runs the risk.
> 
> Thus we have distinct versions of sources a given premade patch is ment
> to be applied against.
> If you feel like not using a version for which a premade patch exists
> you certainly can do this. If you do this then no pre-made patch will be
> applied, which is fine, imo. Depending on the package it may even
> compile and work.
> 
> >>>[PRO'S/CON'S]
> >>>The main drawback of this proposal, is that if your kernel
> >>>and headers are of the same version, you get a duplicated source tree.
> >> 
> >> This is not true. We're installing the headers into
> >> toolchain_build_$arch/linux while the kernel itself is built in
> >> build_$arch. The latter exists per $arch, yes.
> >
> >If the kernel headers and the linux are of two different versions,
> >then there will be two "linux-2.6.x.y" in "build_<arch>".
> >If both are of the same version, then there will be one 
> >"linux-2.6.x.y" in "build_<arch>".
> >
> >If linux is built in "project_build_<arch>" and 
> >the kernel headers are unpacked in "toolchain_build_<arch>",
> >then there will be two "linux-2.6.x.y" source trees even if 
> >the kernel headers and the kernel have the same version.
> >This is a drawback but the overall gain if you build several 
> >root file systems is monumentous.
> > 
> >
> >> 
> >> As said, we can easily unpack the kernel into one toolchain_build/ and
> >> make O=/headers headers_install
> >> and
> >> make O=build_arch/linux-$VERSION/ all
> >> 
> >> if you prefer. This change is trivial.
> >
> >What happens if you want to apply AT91 (ARM) patches AND XScale (ARM)
> >patches to the Linux tree and the patches conflict with each other?
> 
> Then those patches are broken. You're supposed to do small,
> self-contained patches which are revieweable.

You can add a one line patch for an AT91 which is in conflict
with a one line patch for an XScale.
They are not broken just because they are in conflict.
The breaking occurs when you apply two patches which never
were meant to be applied on top of each other.


> >I think you *have* to have one source tree per kernel.
> 
> Fortunately not. That's why we have *one* kernel tree that supports a
> variety of arches and devices along a common infrastructure ;)
> 
> >There will be cases where this is overusing computer hard disk,
> >but it makes the system much simpler.
> 
> 
> >>>If they are of different versions, then there is no duplication
> >>>and then it actually works. It does not do so today.
> >> 
> >> I don't do external-toolchains either. ;P
> >> If you want that then fix it (i already said that) but make sure NOT to
> >> break the common setup of using headers==src (which you broke with that
> >> project stuff, no matter who checked it in).
> >> 
> >
> >My plan is to have a gradual migration and have the old way
> >of building linux and the BSP way with building linux in parallel
> >until it is deemed to be ready for "production".
> 
> I'd prefer to see a working incarnation that changes this at once so it
> can be reviewed.
> 

As I said, we should have two ways of building the linux.
The current way, and the proposed way, so that anyone
can continue without problems using the old way
and the new way can be checked out by the community.

> >I more and  more belive in merging the kernel header stuff with the main build of linux.
> 
> This is trivial and should basically boil down to
> (echo "### kernel header stuff" ; cat toolchain/kernel-headers/kernel-headers-new.makefile)>> \
> target/linux/Makefile.in
> svn rm toolchain/kernel-headers

Best Regards
Ulf Samuelsson
