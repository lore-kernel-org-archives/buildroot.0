From: Ulf Samuelsson <ulf@atmel.com>
Date: Thu, 26 Jul 2007 18:52:02 +0200
Subject: [Buildroot] Redundant kernel patches in the snapshot
	from	20070718
In-Reply-To: <1185459798.1044.43.camel@localhost.localdomain>
References: <1185459798.1044.43.camel@localhost.localdomain>
Message-ID: <1185468722.5580.107.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tor 2007-07-26 klockan 16:23 +0200 skrev Hans-Christian Egtvedt:
> Hello,
> 
> I am a bit confused to where I should put the kernel patch, there seems
> to be two places expecting the same file.
> 
> toolchain/kernel-headers/kernel-headers-new.makefile expects them to be
> in toolchain/kernel-headers.
> 
> target/linux/Makefile.in expects them to be in
> $(BR2_BOARD_PATH)/kernel-patches.


When you build the kernel-headers today you extract the kernel source
to build_<ARCH> and you store the kernel headers in
toolchain_build_<ARCH>/linux

You have a single set of patches in toolchain header directory,
This causes the following problems:
* Confusion due to using same targets in two makefile fragments.
* Cannot apply architecture specific patches, since
  you may have conflicts between several patch-set's.
* Cluttered directory
* Multiple instances of the same patch with different names.
* Limited number of kernel versions supported.

[CONFLICTS]
Both the kernel headers and the target/linux/Makefile.in
work with $(BUILD_DIR) and it only works when the kernel
and headers are the same. The shared targets cause all
kinds of problems. We need to separate the two makes.

I think that the kernel-new-headers should actually
be moved to the target/linux/Makefile.in to avoid
the current confusion.

Generating the kernel headers is part of the toolchain build
and it makes much more sense to me to generate the headers
in the $(TOOLCHAIN_BUILD_DIR) like it is done for the 2.4 kernels
I have tested building the kernel-headers in this directory
while building the kernel in the $(PROJECT_BUILD_DIR)
and this seems to work without any problems for x86 and ARM,
regardless if the kernel version and kernel headers are the same
or not.

[PATCH NAMING]
If you want to support a specific $(LINUX_VERSION),
the "linux-$(LINUX_VERSION)*.patch" files are applied.

When you check the kernel-header patches, it shows that there are
several patches with identical contents but different names.

This means that you cannot select kernel version at random.
You HAVE to select a supported version 
(2.6.x where x is {8, 9, 11, 12, 20.4, 21.5, 22.1}).

Everytime you want to add a new kernel version, like 2.6.22.2
you will have to add 770 kB to the buildroot tree, so it
is not viable long term.

[PATCH SELECTION]
We need to be able to build any kernel, not just the kernel
currently supported by the kernel headers.
It is probably desirable to be able to use the kernel headers
for the same version as we are using, but also it should be
possible to have kernel headers for one version of linux
and use a different kernel for your target.
It probably does not make sense to 

If we select a kernel, we may still want to keep the toolchain
even if we bump the version of the kernel to the next minor number.

I think that it should be possible in the menu system to select 
which kernel to use (2.6.X.Y), and, for the kernel headers,
we should have a finite number of patches which can be applied
to generate the kernel headers. 
These can be selectable using a "choice".
A default would be selected based on the kernel version but,
if the user so chooses, he can apply whatever patch he wants.

This would allow you to use a 2.6.21.6 kernel while applying
the kernel patches for 2.6.21.5.

Eventually the available patches will not apply cleanly,
and then it is time to generate new patches,
but it is likely that most of the patches will apply.

It it therefore better to have a list of broken out patches that can be
applied, than full patchsets for each kernel version.
Result is more flexibility and no need to have duplicated patches
in the patch directory.

[ARCHITECTURE/BOARD SPECIFIC PATCHES]
On top of the kernel header patches, we should be able to 
add the board specific patches.

We know that you normally cannot apply the std AT91 patches and the
AVR32 patches at the same time, so you cannot just copy these to the
kernel-headers directory. I assume that there are similar
problems with patches for different ARM processors etc.

The current method. using $(BR2_BOARD_PATH)/kernel-patches on
top of the kernel-headers would work for me.

[PRO'S/CON'S]
The main drawback of this proposal, is that if your kernel
and headers are of the same version, you get a duplicated source tree.
If they are of different versions, then there is no duplication
and then it actually works. It does not do so today.

If this proposal is implemented, then each user can select kernel
version at random, and can actually very easy compile multiple kernels
in the tree, by just generating a new project.
You do not have to recompile all the applications to introduce
a new kernel.


> 
> AFAICT this is redundant, what is the need to put the same patches in a
> board specific folder? Should the target/linux/Makefile.in first do the
> patches in toolchain/kernel-headers and then
> $(BR2_BOARD_PATH)/kernel-patches if it exists?
> 
