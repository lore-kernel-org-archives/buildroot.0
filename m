From: Przemyslaw Wrzos <przemyslaw.wrzos@calyptech.com>
Date: Mon, 21 Jan 2013 15:24:32 +1100
Subject: [Buildroot] [RFC v1] Prototype implementation of per-package
	out oftree build
References: <1358725943-31485-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <EE5E77B503DE9A478B63A89AAD2585EDB66A3B@vpane.excalyptech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> -----Original Message-----
> From: buildroot-bounces at busybox.net [mailto:buildroot-
> bounces at busybox.net] On Behalf Of Thomas Petazzoni
> Sent: Monday, 21 January 2013 10:52
> To: buildroot at uclibc.org
> Subject: [Buildroot] [RFC v1] Prototype implementation of per-
> package out oftree build
> 
> Hello,
> 
> (Sorry for the previous posting that only had the first two patches. I
> was in the train in the middle of the mountains, and the 3G
> connection was interrupted for a too long time.)
> 
> There has recently been some interest in improving the support for
> overriden packages by doing out of tree build of all packages. Since I
> had the beginning of a prototype working, I cleaned it up, made
> numerous fixes to make it work apparently properly, and share it with
> the community.
> 
> The following patches should be considered as a prototype, I haven't
> tested all packages (of course), and there are quite certainly some
> corner case issues that haven't been solved. However, I think it's a
> good time to get more testing in order to find, and solve those
issues.
> 
> It should also not be considered yet that we want this feature in
> Buildroot. It is again only a prototype, which aims at solving the
> remaining problems, and see if we think it is a good idea to have this
> in Buildroot or not.
> 
> For those who want to test, the 'out-of-tree' branch is available at:
> 
>   git://git.free-electrons.com/users/thomas-petazzoni/buildroot.git
> 
> Here is a quick summary of what this patch set does:
> 
>  * The tarballs are now extracted in $(O)/src/<pkg>-<version>
> 
>  * Each tarball is extracted and patched only once, even if there is
>    both a target build and a host build. Once a package has been
>    extracted and patched, its source code is changed to not have write
>    permissions, in order to catch misbehaving packages in terms of out
>    of tree build.
> 
>  * The builds continue to be done in $(O)/build/<pkg>-<version> for
>    target packages and $(O)/build/host-<pkg>-<version> for host
>    packages.
> 
>  * A <pkg>_SUPPORTS_OUT_OF_TREE variable defines whether the
> package
>    supports out of tree build or not. By default, it's set to NO, in
>    which case the package source code is rsynced from its source
>    directory to the build directory at the beginning of the configure
>    step. It is set to YES by both the autotools and cmake package
>    infrastructures (which have been modified to do out of tree build),
>    and by some packages that use the generic infrastructure but
>    nonetheless support out of tree build.
> 
>  * The override source directory mechanism is updated to take
>    advantage of this out of tree support. Now, if you override a
>    package that supports out of tree build, the source code is no
>    longer rsynced to the build directory. This makes the override
>    source directory mechanism a lot more usable for big packages such
>    as the Linux kernel.
> 
> Amongst the known remaining issues to solve are:
> 
>  * The semantic of the 'make <pkg>-dirclean' command. Should it
> remove
>    the build directory and the source directory? Only the build
>    directory? If it removes both (which the proposed prototype
>    currently does), it is strange because you remove one build variant
>    (host or target) and the source directory, but the other build
>    variant (target or host) remains.
> 
>  * I am not sure on how we want to handle <pkg>-reconfigure and
>    <pkg>-rebuild. I guess we want to tell the user to do his changes
>    in the package source directory, output/src/<pkg>-<version>. But
>    all files in this source directory are marked read-only, so it's
>    not very practical.
> 
>    In addition to this, for packages that don't support out of tree
>    build, we do a rsync at the beginning of the configure step. So if
>    the user does "make <pkg>-reconfigure", then the source code gets
>    rsynced again from the source directory to the build directory, but
>    not if the user does "make <pkg>-rebuild".
> 
> Comments, ideas, suggestions are welcome.
> 
> Best regards,
> 
> Thomas


Hi Thomas,

This looks fairly similar to what I was proposing so I'm personally all
for it. Here are a few of my thoughts about it:

* There's one more feature which I think would complete the Linux
out-of-tree build support for me, and that is the ability to specify the
<PKG>_OVERRIDE_SRCDIR value via the configuration. I've attached a patch
for how this might look.
* I like the idea making the source tree read-only to keep the build
honest but I think this removes one of the major benefits of having a
source tree in the first place, that is being able to modify and play
around with it. This leads to the <pkg>-rebuild not making sense as you
point out. I think it might be best to simply not enforce this
restriction (even if it means some packages could abuse that).
* Do we need a source directory when a package doesn't support
out-of-tree building? The downside is additional disk space though that
might not be that serious of a concern and it might just come down to a
choice of aesthetics I suppose.
* As far as <pkg>-dirclean goes, I would say remove both build and
source directories. If we only remove the build directory it will in
effect not be all that different to <pkg>-clean. The only other real
option would be to have a separate source directory for each target
variant.

Cheers,
Przemyslaw Wrzos
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 001-linux-external-source-dir.patch
Type: application/octet-stream
Size: 2748 bytes
Desc: 001-linux-external-source-dir.patch
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130121/9c9d6a30/attachment.obj>
