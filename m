From: Przemyslaw Wrzos <przemyslaw.wrzos@calyptech.com>
Date: Thu, 17 Jan 2013 17:59:44 +1100
Subject: [Buildroot] New kernel source mode [Proposal]
References: <EE5E77B503DE9A478B63A89AAD2585EDB66A2F@vpane.excalyptech.com>
 <20130115085501.52a772cc@skate>
Message-ID: <EE5E77B503DE9A478B63A89AAD2585EDB66A34@vpane.excalyptech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> -----Original Message-----
> From: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com]
> Sent: Tuesday, 15 January 2013 18:55
> 
> Dear Przemyslaw Wrzos,
> 
> Thanks a lot for your detailed proposal! This is indeed a request that
has
> shown up a number of times, and that we need to address.
> 
> However, I've always believed that solving this by specifically
modifying the
> kernel .mk file in Buildroot (linux/linux.mk) was not the right
solution.
> Instead, we want a solution that potentially works for all packages in
> Buildroot.
> 
> In, fact the <pkg>_OVERRIDE_SRCDIR mechanism was the first step in
this
> direction. For now, this mechanism is a little bit annoying because it
does
> rsync the entire source tree, which for the kernel tree is long and
useless.
> So, I've started experimenting this direction:
> 
>  (1) Build all packages in Buildroot out-of-tree. The packages
>      for which the source code is downloaded, extracted and patched by
>      Buildroot (so things you are not actively developing on) are
built
>      out-of-tree. The source directory is shared between the host and
>      target builds of a same package. That's the first step.
> 
>      So, for each package, the source code is extracted in
>      output/sources/<pkg>-<version>/, and the build takes places in
>      output/build/<pkg>-<version>/ for target packages, and
>      output/build/host-<pkg>-<version>/ for host packages.
> 
>      Of course since some packages do not support out-of-tree, we have
>      for those packages to copy the source tree to the build
directory.
>      But usually, only very small projects don't support out-of-tree
>      build, and also using out-of-tree build in Buildroot may
encourage
>      us to push upstream patches to make out-of-tree build work.
> 
>  (2) Logically, packages whose source directory is overriden using
>     <pkg>_OVERRIDE_SRCDIR will work easily. The only difference with
>     normal packages would be that the source directory is no longer
>     output/sources/<pkg>-<version>/, but the value passed in
>     <pkg>_OVERRIDE_SRCDIR.
> 
> I already have a beginning of prototype for step (1), with:
> 
>  * Busybox being built out-of-tree
>  * All autotools packages being built out-of-tree
>  * All generic packages that do not explicitly say they can built
>    out-of-tree see their source code copied from the source directory
>    to the build directory.
> 
> But there were still more cases to cover, so this work is not finished
for now.
> 
> I now I've been pushing back kernel-specific solutions for a while,
and
> maybe this is discouraging contributors and developers. I do believe
that a
> kernel-specific solution is not the right way of solving this problem,
and I'm
> working on a solution, but the generic solution is more complex to
develop
> than the kernel specific one. That said, if other Buildroot developers
feel
> that the need for this feature at the kernel level is important
enough, we
> can merge a kernel-specific solution and later replace it with a more
generic
> solution, but I fear that this might break the API as both solutions
would not
> work the same way.
> 
> Best regards,
> 
> Thomas

That's an interesting idea. I personally would suggest we shouldn't
force this behaviour on packages but instead provide an infrastructure
that allows them to use it if they so choose.

If you think that is reasonable then I have put together a patch that
will achieve something along those lines. Obviously some of the naming
might need to be fixed up and other issues resolved but it's a good
place to get the conversation started. I have included two patches, one
with the proposed generic out-of-tree building mechanism. The other
shows how linux/linux.mk would need to be altered to support this
scheme.

Some general things worth mentioning about the patch:
    - In addition to <PKG>_DIR I have also added the <PKG>_SRC variable
to point to the location of the source directory in the build output.
    - Two new variables are added to provide information to the generic
build infrastructure:
        - <PKG>_OUTOFTREE_BUILD can be set to YES or NO to indicate an
out of tree build
        - <PKG>_OUTOFTREE_SETUP_CMDS setting this automatically turns on
<PKG>_OUTOFTREE_BUILD, it includes the commands needed to prep the build
directory from the source directory
    - The <PKG>_OVERRIDE_SRCDIR works together with the out of tree
build, meaning we can specify an external directory and everything still
works as expected
    - By default if the out of tree build is not enabled then the build
continues to work as before which I think is ideal because then packages
can be ported gradually to the new scheme, or not ported at all since it
might not make any sense for some
    - I have also added a new variable <PKG>_REINSTALL_TARGETS so that
package maintainers can specify targets used to reinstall package
results into the target tree, this is mostly separate to the rest of
this patch and perhaps should be considered separately

The linux specific part of the patch is missing fixes for other packages
that might be unaware it now has a separate source and build directory,
I could fix that if you decide this approach is the way to go.

Anyway, I'd appreciate your feedback on whether you think this approach
is viable and if it fits with what you had in mind.

Cheers,
Przemyslaw Wrzos
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 001-Generic-out-of-tree-build.patch
Type: application/octet-stream
Size: 9454 bytes
Desc: 001-Generic-out-of-tree-build.patch
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130117/4f1eabe0/attachment.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 002-Linux-out-of-tree-build.patch
Type: application/octet-stream
Size: 4056 bytes
Desc: 002-Linux-out-of-tree-build.patch
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130117/4f1eabe0/attachment-0001.obj>
