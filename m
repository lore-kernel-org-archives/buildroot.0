From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Dec 2010 20:39:10 +0100
Subject: [Buildroot] Pull request buildroot.git (vapier branch)
In-Reply-To: <201012060250.03103.vapier@gentoo.org>
References: <1291503121-24114-1-git-send-email-vapier@gentoo.org>
	<20101205115745.0e86c054@surf>
	<201012060250.03103.vapier@gentoo.org>
Message-ID: <20101206203910.15e7fd5a@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 6 Dec 2010 02:50:01 -0500
Mike Frysinger <vapier@gentoo.org> wrote:

> i dont know what you mean by "earlier versions".  these all should be
> the exact same version as i already posted in the past.  if people
> had feedback on the patches, i'd of expected them to be given at the
> time of patch posting.

I know those were the same, but it really make things easier if patches
come together with the pull request, to ease the review process, even
if they have been posted previously.

> > >       pax-utils: new package
> > 
> > I know you're going to say that it's more lines, it's stupid and so
> > on,
> 
> you're right

I know :-)

> > Moreover, pax-utils requires LARGEFILE support, so you have to do
> > the usual stuff in the Config.in file:
> 
> why do you say this ?

Because when you build it with a toolchain that doesn't support
LARGEFILE you have undefined references to glob64_t. It can probably be
fixed in pax-utils itself, but when we don't want to fix it, we just
mark the package as depending on LARGEFILE.

> > >       busybox: unify duplicated build steps
> > 
> > I'd very much prefer something like:
> > 
> > BUSYBOX_MAKE_OPTS = ...
> 
> i'll take a look

Thanks!

> > >       busybox: let buildroot handle stripping
> > 
> > I'm obviously ok on the principle, but we'll have to keep updating
> > the patch directory and patch name everytime we bump busybox (which
> > happens quite often). Considering the simple change, wouldn't a
> > $(SED) call directly in busybox.mk be more future-proof ? Or
> > better, get this patch merged into Busybox. Anyway, this can be
> > decided later, so:
> 
> it's already been merged upstream

Great.

> > >       linux: support unpacked source trees
> > 
> > This is a useful feature, but we want to introduce it globally for
> > all packages, not only for the Linux kernel. This needs some
> > thoughts on what it should look like, how it should be presented to
> > users, how it should work.
> > 
> > Could you remove this patch from the patch set, but keep the idea
> > around ?
> 
> maybe i'm pessimistic, but i doubt that general support will be done
> in a reasonable time frame.  thus wouldnt it make sense to merge this
> and once someone does put together common code, switch the Linux one
> over to it ?

You're probably right, it'll take some time for us to do this
generally. My position is that in the past too much specific stuff has
been added in Buildroot, offering sometimes duplicate functionality,
and that we should try to avoid that in the future. I just offered my
position on this, but I'm not the Buildroot maintainer, so Peter's
position might be different.

However, as this is a bit controversial, in order to ease the
integration of your patch set, you may want to remove this patch from
this branch, get all the other patches merged, and then try again with
this particular patch only separatly.

> > >       toolchain: add a USE_MMU build option
> > 
> > It doesn't work, the uClibc define is __ARCH_USE_MMU__ and not
> > __UCLIBC_USE_MMU_. This commit will have to be changed when my
> > toolchain-improvements patch set goes in, but maybe your patch
> > series will go first (I don't care). Whichever happens, either you
> > or me will have to fix something :-)
> 
> copy & paste i guess from the other options

Sure, just minor comment after review/testing.

> > >       portmap: add nommu support
> > 
> > Just curious: why was portmap compiled PIE ?
> 
> redhat takes the general position that network daemons be compiled as
> PIEs. since the portmap maintainer is a redhat employee, he put it
> into the portmap build system instead of keeping it in the redhat
> spec.  glibc does the same thing.

Ok, thanks. Do you what's the reasoning behind compiling all network
daemons as PIE ? Is it because of some address space randomization
feature ?

> > Have you pushed the patches upstream ?
> 
> of course, but the maintainer hasnt updated things in a while.
> probably because people are moving to rpcbind.

Should we as well ?

> > >       portmap: respect target CFLAGS
> > 
> > Why not after $(MAKE), like CC= ?
> 
> because it will override settings in the portmap make.  setting vars
> via the env and via the command line do not have the same semantics
> in make.

Yes, makes sense;

> > >       irda-utils: new package for IrDA devices
> > 
> > I know Peter wants a short description + author in each patch. Your
> > patches are fairly obvious, but that's the rule :)
> 
> i dont know what you mean by author.  git already tracks authorship.

Peter still wants the patch we have in Buildroot to carry a description
and an author. The author of the patch may not be the person who
imported it into Buildroot.

> > >       libpcap: update static handling
> > 
> > Could you use LIBPCAP_MAKE_OPT instead ?
> 
> i wasnt aware of that, but i guess it should work

No problem. This is one of the few things that is actually documented
in the Buildroot documentation :-)

> > >       toolchain-external: allow vendor-controlled defaults
> > 
> > I think this could be done with the "toolchain profile" mechanism I
> > proposed in the toolchain-improvements patch set I posted this
> > morning. Could you remove this patch for this patch series, so that
> > we can handle this later ? Thanks!
> 
> i'll take a look

Great thanks. I think it should work reasonably well with Blackfin
toolchains, adding the optional capability of having Buildroot
download/install the toolchain for the user if (s)he wants to. The only
thing I see problematic is that Blackfin toolchains are typically
shipped in two separate tarballs, so a little bit of hacking in
ext-tool.mk might be needed, but nothing that looks impossible.

> > >       target-finalize: punt config scripts too
> > 
> > No. What if a package really wants to install a binary called
> > foobar-config that must be kept on the target ? I know it's
> > unlikely, but I'd prefer not to have this policy at the global
> > level. Just do what other packages do: add a post install hook that
> > removes the pcap-config file.
> 
> can you name a package that does this ?  i havent seen one.

No, I can't name a package that does this. I'd just prefer to be
cautious.

> > I tested the Blackfin support (well only the build part of it,
> > since I don't have hardware to test), and I had a few issues with
> > the default Busybox configuration:
> 
> which are all fixed by another patch i have which adds defconfigs for
> Blackfin boards.  fixing the default defconfig makes no sense to me
> so i'm not going to spend time on it.

Ok. I think we generally want Buildroot to make a working build when
used out-of-the-box. I.e, without using any defconfig, if the user does
"make menuconfig", selects "blackfin" and then exits, the build should
be working. I think Peter quite likes this rule. But for the blackfin
case, we can probably discuss how to solve this later.

> > Another (unrelated) question: when using the Blackfin toolchains, I
> > found out that the linker needs zlib installed on the host, but it
> > isn't the case with the other toolchains I have. What feature of ld
> > requires zlib ?
> 
> it isnt ld, it's elf2flt-ld.  and elf2flt supports compression via
> the ZFLAT format.  although in newer binutils, they have added
> support for compressed debug sections which does require zlib in misc
> utils such as ld ... -mike

Ah, ok, good to know.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 198 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101206/f3ca4286/attachment.pgp>
