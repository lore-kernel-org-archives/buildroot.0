From: Ulf Samuelsson <ulf@atmel.com>
Date: Mon, 30 Jul 2007 17:51:49 +0200
Subject: [Buildroot] Redundant kernel patches in the snapshot
	from20070718
References: <1185459798.1044.43.camel@localhost.localdomain>
	<1185468722.5580.107.camel@elrond.sweden.atmel.com>
	<20070727113002.GF22789@aon.at>
Message-ID: <026b01c7d2c2$cbcd3460$dcc4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> On Thu, Jul 26, 2007 at 06:52:02PM +0200, Ulf Samuelsson wrote:
>>tor 2007-07-26 klockan 16:23 +0200 skrev Hans-Christian Egtvedt:
>>> Hello,
>>> 
>>> I am a bit confused to where I should put the kernel patch, there seems
>>> to be two places expecting the same file.
>>> 
>>> toolchain/kernel-headers/kernel-headers-new.makefile expects them to be
>>> in toolchain/kernel-headers.
>>> 
>>> target/linux/Makefile.in expects them to be in
>>> $(BR2_BOARD_PATH)/kernel-patches.
>>
>>
>>When you build the kernel-headers today you extract the kernel source
>>to build_<ARCH> and you store the kernel headers in
>>toolchain_build_<ARCH>/linux
>>
>>You have a single set of patches in toolchain header directory,
>>This causes the following problems:
>>* Confusion due to using same targets in two makefile fragments.
> 
> What two targets are you referring to? Please give an example (excluding
> find target/ -iname "linux*mk").
> 

Try building Linux 2.6.21.3 with 2.6.21.5 headers.
Then the linux source is decompressed to "build_<arch>/linux-2.6.21.3"
while the headers are generated from    "build_<arch>/linux-2.6.21.5"

"package/linux/Makefile.in" does *not* apply the linux-headers patches
so "build_<arch>/linux-2.6.21.3" does not have the kernel-header patches applied.

If you use the same kernel version as the kernel headers (2.6.21.5), then 
the kernel headers will decompress the source into
"build_<arch>/linux-2.6.21.5" and when "package/linux/Makefile.in"
is activated, it will work on the the "build_<arch>/linux-2.6.21.5" 
directory and thus will have the kernel patches applied.

The bug is that "package/linux/Makefile.in" does not apply the kernel
patches when the kernel headers and the linux is not the same.

Once it does so, then you should be able to build the linux in any directory.
Building in "project_build_<arch>" is thus but a symptom.

>>* Cannot apply architecture specific patches, since
>>  you may have conflicts between several patch-set's.
>>* Cluttered directory
> 
> hm? Please explain.
> 

The AVR32 chips and the AT91 ARM chips uses the same peripherals,
and therefore can use the same drivers.
The linux support is developed by two teams.

If the SPI support in Linux is updated, then the same patch will be present
both in the patchset for the AT91 and the patchset for the AVR32.
If the same patch is applied twice to the kernel, it will fail the second time
even if the patch is OK to apply once.


>>* Multiple instances of the same patch with different names.
>>* Limited number of kernel versions supported.
>>
>>[CONFLICTS]
>>Both the kernel headers and the target/linux/Makefile.in
>>work with $(BUILD_DIR) and it only works when the kernel
>>and headers are the same. The shared targets cause all
>>kinds of problems. We need to separate the two makes.
>>
>>I think that the kernel-new-headers should actually
>>be moved to the target/linux/Makefile.in to avoid
>>the current confusion.
> 
> I think that kernel-headers-old should be wiped.

I have no problem with that.

>>
>>Generating the kernel headers is part of the toolchain build
>>and it makes much more sense to me to generate the headers
>>in the $(TOOLCHAIN_BUILD_DIR) like it is done for the 2.4 kernels
> 
> kernel headers are installed to toolchain_build_$arch/linux/ for a
> matter of fact (for src==headers).
> Is this FUD or does TOOLCHAIN_BUILD_DIR point to somewhere else? If the
> latter, (which would be very cunfusing) then why doesn't
> TOOLCHAIN_BUILD_DIR point to the toolchain_build dir? 

OK, wrong working.
Today the source is unpacked in "build_<arch>".
It makes more sense to be to unpack in "toolchain_build_<arch>"
since the kernel headers is really part of the toolchain.

linux then needs to be unpacked in "project_build_dir"

> 
>>I have tested building the kernel-headers in this directory
>>while building the kernel in the $(PROJECT_BUILD_DIR)
>>and this seems to work without any problems for x86 and ARM,
>>regardless if the kernel version and kernel headers are the same
>>or not.
>>
>>[PATCH NAMING]
>>If you want to support a specific $(LINUX_VERSION),
>>the "linux-$(LINUX_VERSION)*.patch" files are applied.
>>
>>When you check the kernel-header patches, it shows that there are
>>several patches with identical contents but different names.
>>
>>This means that you cannot select kernel version at random.
> 
> This conclusion is wrong.
> This really means that the patch works for several versions of the
> kernel, which is a good thing.
> 
>>You HAVE to select a supported version 
>>(2.6.x where x is {8, 9, 11, 12, 20.4, 21.5, 22.1}).
> 
> This is not correct either.
> a) you can only select versions which are in the Config system, yes.
> b) if you choose to use another kernel then this kernel is *not* patched
> with random patches (this is a feature. Patching can fail).
>>
>>Everytime you want to add a new kernel version, like 2.6.22.2
>>you will have to add 770 kB to the buildroot tree, so it
>>is not viable long term.
> 
> I wholeheartedly agree that it supporting several kernel-versions is not
> viable. It doesn't make sense to keep multiple old $PATCH versions but
> only the latest.
> 
> Also, it doesn't make sense to me to support more than let's say 2 or 3
> versions per MINOR (e.g. 2.6.20.x, 2.6.22.x which is current at the time
> of this writing.)

I think we should support building any version of the kernel,
and then we should allow the user to select which set of kernel headers
should be applied, and if the user selects to use anything outside the
things we have tested, then they are on their own.

I would like buildroot to be more than a toy.
This means that we should not have built in mechanisms to obsolete stuff.
I have customers which wants to keep products in the field for 10-20 years
and still maintain them.

This means that backwards compatability is very important.
One way to handle that is to download the neccessary patches for
old versions from a server instead of keeping them in the main buildroot tree.


>>[PATCH SELECTION]
>>We need to be able to build any kernel, not just the kernel
>>currently supported by the kernel headers.
>>It is probably desirable to be able to use the kernel headers
>>for the same version as we are using, but also it should be
>>possible to have kernel headers for one version of linux
>>and use a different kernel for your target.
> 
> Nowadays there is no need for such a kludge anymore.
> 

Yes there is.
If someone for some specific reason wants to use a certain version
of Linux, and the kernel patches does not apply cleanly to that
kernel, then you might be able to live with having kernel patches for
a slightly off version of linux instead.

You can also conceive that a user has several projects
where the main differences is the version of the linux kernel,
while the toolchain and the rootfs share the build.

>>It probably does not make sense to 
>>
>>If we select a kernel, we may still want to keep the toolchain
>>even if we bump the version of the kernel to the next minor number.
> 
> You may, sure. There's that external-toolchain thing for *** like this.

With the BSP patch it is much less need to do so.

>>
>>I think that it should be possible in the menu system to select 
>>which kernel to use (2.6.X.Y), and, for the kernel headers,
>>we should have a finite number of patches which can be applied
>>to generate the kernel headers. 
>>These can be selectable using a "choice".
>>A default would be selected based on the kernel version but,
>>if the user so chooses, he can apply whatever patch he wants.
>>
>>This would allow you to use a 2.6.21.6 kernel while applying
>>the kernel patches for 2.6.21.5.
> 
> This is very brittle.
> Of course we can provide "generic" patches of the form
> linux-2.6.2-this-that.patch
> and try to apply them to linux-2.6.2[^\.]*
> But this will fail if spots change under the patch. This is not 100%
> robust imo.

Not sure what you mean by "spots" but I

>>
>>Eventually the available patches will not apply cleanly,
>>and then it is time to generate new patches,
>>but it is likely that most of the patches will apply.
> 
> It may be likely across PATCH revisions but is not bullet proof.

No, a guy locked to chains inside a dungeon, will not fall off a cliff.
A guy without the chain runs the risk.

If patching a kernel with the restricted set of kernel patches fails,
then the user always have the option to patch the kernel without those patches.
There are people which has been able to build linux outside buildroot.

>>
>>It it therefore better to have a list of broken out patches that can be
>>applied, than full patchsets for each kernel version.
> 
> You're aware that at least "my" patches _are_ broken out (as opposed to
> the ATMEL stuff.
> 
>>Result is more flexibility and no need to have duplicated patches
>>in the patch directory.
>>
>>[ARCHITECTURE/BOARD SPECIFIC PATCHES]
>>On top of the kernel header patches, we should be able to 
>>add the board specific patches.
> 
> heh. There we agree for once ;)
> 
>>
>>We know that you normally cannot apply the std AT91 patches and the
>>AVR32 patches at the same time, so you cannot just copy these to the
> 
> yea, which usually means that there is something really, really broken
> with patches like these, but that may be just my notion of how a
> configurable software-package should work.
> 

No, the main reason why it fails, is that both patchsets contain identical patches
so the patches are applied twice.

>>kernel-headers directory. I assume that there are similar
>>problems with patches for different ARM processors etc.
>>
>>The current method. using $(BR2_BOARD_PATH)/kernel-patches on
>>top of the kernel-headers would work for me.
>>
>>[PRO'S/CON'S]
>>The main drawback of this proposal, is that if your kernel
>>and headers are of the same version, you get a duplicated source tree.
> 
> This is not true. We're installing the headers into
> toolchain_build_$arch/linux while the kernel itself is built in
> build_$arch. The latter exists per $arch, yes.

If the kernel headers and the linux are of two different versions,
then there will be two "linux-2.6.x.y" in "build_<arch>".
If both are of the same version, then there will be one 
"linux-2.6.x.y" in "build_<arch>".

If linux is built in "project_build_<arch>" and 
the kernel headers are unpacked in "toolchain_build_<arch>",
then there will be two "linux-2.6.x.y" source trees even if 
the kernel headers and the kernel have the same version.
This is a drawback but the overall gain if you build several 
root file systems is monumentous.
 

> 
> As said, we can easily unpack the kernel into one toolchain_build/ and
> make O=/headers headers_install
> and
> make O=build_arch/linux-$VERSION/ all
> 
> if you prefer. This change is trivial.

What happens if you want to apply AT91 (ARM) patches AND XScale (ARM)
patches to the Linux tree and the patches conflict with each other?
I think you *have* to have one source tree per kernel.
There will be cases where this is overusing computer hard disk,
but it makes the system much simpler.

> 
>>If they are of different versions, then there is no duplication
>>and then it actually works. It does not do so today.
> 
> I don't do external-toolchains either. ;P
> If you want that then fix it (i already said that) but make sure NOT to
> break the common setup of using headers==src (which you broke with that
> project stuff, no matter who checked it in).
> 

My plan is to have a gradual migration and have the old way
of building linux and the BSP way with building linux in parallel
until it is deemed to be ready for "production".
I more and  more belive in merging the kernel header stuff with the main build of linux.

>>If this proposal is implemented, then each user can select kernel
>>version at random, and can actually very easy compile multiple kernels
>>in the tree, by just generating a new project.
>>You do not have to recompile all the applications to introduce
>>a new kernel.
>>
>>
>>> 
>>> AFAICT this is redundant, what is the need to put the same patches in a
>>> board specific folder? Should the target/linux/Makefile.in first do the
>>> patches in toolchain/kernel-headers and then
>>> $(BR2_BOARD_PATH)/kernel-patches if it exists?
>


Best Regards
Ulf Samuelsson
