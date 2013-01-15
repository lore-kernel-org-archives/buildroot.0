From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jan 2013 08:55:01 +0100
Subject: [Buildroot] New kernel source mode [Proposal]
In-Reply-To: <EE5E77B503DE9A478B63A89AAD2585EDB66A2F@vpane.excalyptech.com>
References: <EE5E77B503DE9A478B63A89AAD2585EDB66A2F@vpane.excalyptech.com>
Message-ID: <20130115085501.52a772cc@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Przemyslaw Wrzos,

On Tue, 15 Jan 2013 12:12:54 +1100, Przemyslaw Wrzos wrote:

> I'd like to get some feedback on a feature I'd like to contribute to the
> buildroot project. I'm not quite sure what the process is so I thought
> I'd start on the mailing list.
> 
> PROPOSAL:  Allow a directory (containing the source tree) to be used as
> the source for the kernel build. The source isn't copied to the output
> directory but instead the kernel's outputmakfile wrapper facility is
> used.
> 
> RATIONALE:  In my project, changes to the kernel are frequent enough
> that it is ideal to be able to update the kernel source tree and then
> build directly from it.
> 
> IMPLEMENTATION:  In addition to providing a new source for the linux
> build process itself, some package makefiles will need to be updated as
> they currently don't differentiate between the kernel source tree and
> build tree.
> 
> I have this working already though I still need to update some of the
> packages as mentioned above. I wanted to ask if there would be any
> interest in rolling this into the buildroot project upstream.

Thanks a lot for your detailed proposal! This is indeed a request that
has shown up a number of times, and that we need to address.

However, I've always believed that solving this by specifically
modifying the kernel .mk file in Buildroot (linux/linux.mk) was not the
right solution. Instead, we want a solution that potentially works for
all packages in Buildroot.

In, fact the <pkg>_OVERRIDE_SRCDIR mechanism was the first step in this
direction. For now, this mechanism is a little bit annoying because it
does rsync the entire source tree, which for the kernel tree is long
and useless. So, I've started experimenting this direction:

 (1) Build all packages in Buildroot out-of-tree. The packages
     for which the source code is downloaded, extracted and patched by
     Buildroot (so things you are not actively developing on) are built
     out-of-tree. The source directory is shared between the host and
     target builds of a same package. That's the first step.

     So, for each package, the source code is extracted in
     output/sources/<pkg>-<version>/, and the build takes places in
     output/build/<pkg>-<version>/ for target packages, and
     output/build/host-<pkg>-<version>/ for host packages.

     Of course since some packages do not support out-of-tree, we have
     for those packages to copy the source tree to the build directory.
     But usually, only very small projects don't support out-of-tree
     build, and also using out-of-tree build in Buildroot may encourage
     us to push upstream patches to make out-of-tree build work.

 (2) Logically, packages whose source directory is overriden using
    <pkg>_OVERRIDE_SRCDIR will work easily. The only difference with
    normal packages would be that the source directory is no longer
    output/sources/<pkg>-<version>/, but the value passed in
    <pkg>_OVERRIDE_SRCDIR.

I already have a beginning of prototype for step (1), with:

 * Busybox being built out-of-tree
 * All autotools packages being built out-of-tree
 * All generic packages that do not explicitly say they can built
   out-of-tree see their source code copied from the source directory
   to the build directory.

But there were still more cases to cover, so this work is not finished
for now.

I now I've been pushing back kernel-specific solutions for a while, and
maybe this is discouraging contributors and developers. I do believe
that a kernel-specific solution is not the right way of solving this
problem, and I'm working on a solution, but the generic solution is
more complex to develop than the kernel specific one. That said, if
other Buildroot developers feel that the need for this feature at the
kernel level is important enough, we can merge a kernel-specific
solution and later replace it with a more generic solution, but I fear
that this might break the API as both solutions would not work the same
way.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
