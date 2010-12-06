From: Mike Frysinger <vapier@gentoo.org>
Date: Mon, 6 Dec 2010 02:50:01 -0500
Subject: [Buildroot] Pull request buildroot.git (vapier branch)
In-Reply-To: <20101205115745.0e86c054@surf>
References: <1291503121-24114-1-git-send-email-vapier@gentoo.org>
	<20101205115745.0e86c054@surf>
Message-ID: <201012060250.03103.vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sunday, December 05, 2010 05:57:45 Thomas Petazzoni wrote:
> Here is a review of your patches, comments below. Next time, it'd be
> great if you could post the patches together with the pull request. I
> know you have posted some earlier versions of them in the past, but
> it's good to see them with every pull request, IMO, as it makes the
> review process easier.

i dont know what you mean by "earlier versions".  these all should be the 
exact same version as i already posted in the past.  if people had feedback on 
the patches, i'd of expected them to be given at the time of patch posting.

> >       u-boot: version bump to 2010.09
> 
> I already carry this change in my for-2011.02/boards-cleanup branch, as
> I said previously. I don't care which one gets merged, either you or me
> will fix his patch series depending on which one goes in first. Is this
> ok for you ?

doesnt matter to me

> >       pax-utils: new package
> 
> I know you're going to say that it's more lines, it's stupid and so on,

you're right

> Moreover, pax-utils requires LARGEFILE support, so you have to do the
> usual stuff in the Config.in file:

why do you say this ?

> >       busybox: unify duplicated build steps
> 
> I'd very much prefer something like:
> 
> BUSYBOX_MAKE_OPTS = ...

i'll take a look

> >       busybox: let buildroot handle stripping
> 
> I'm obviously ok on the principle, but we'll have to keep updating the
> patch directory and patch name everytime we bump busybox (which happens
> quite often). Considering the simple change, wouldn't a $(SED) call
> directly in busybox.mk be more future-proof ? Or better, get this patch
> merged into Busybox. Anyway, this can be decided later, so:

it's already been merged upstream

> >       linux: support unpacked source trees
> 
> This is a useful feature, but we want to introduce it globally for all
> packages, not only for the Linux kernel. This needs some thoughts on
> what it should look like, how it should be presented to users, how it
> should work.
> 
> Could you remove this patch from the patch set, but keep the idea
> around ?

maybe i'm pessimistic, but i doubt that general support will be done in a 
reasonable time frame.  thus wouldnt it make sense to merge this and once 
someone does put together common code, switch the Linux one over to it ?

> >       toolchain: add a USE_MMU build option
> 
> It doesn't work, the uClibc define is __ARCH_USE_MMU__ and not
> __UCLIBC_USE_MMU_. This commit will have to be changed when my
> toolchain-improvements patch set goes in, but maybe your patch series
> will go first (I don't care). Whichever happens, either you or me will
> have to fix something :-)

copy & paste i guess from the other options

> >       portmap: add nommu support
> 
> Just curious: why was portmap compiled PIE ?

redhat takes the general position that network daemons be compiled as PIEs.  
since the portmap maintainer is a redhat employee, he put it into the portmap 
build system instead of keeping it in the redhat spec.  glibc does the same 
thing.

> Have you pushed the patches upstream ?

of course, but the maintainer hasnt updated things in a while.  probably 
because people are moving to rpcbind.

> >       portmap: respect target CFLAGS
> 
> Why not after $(MAKE), like CC= ?

because it will override settings in the portmap make.  setting vars via the 
env and via the command line do not have the same semantics in make.

> >       irda-utils: new package for IrDA devices
> 
> I know Peter wants a short description + author in each patch. Your
> patches are fairly obvious, but that's the rule :)

i dont know what you mean by author.  git already tracks authorship.

> >       libpcap: update static handling
> 
> Could you use LIBPCAP_MAKE_OPT instead ?

i wasnt aware of that, but i guess it should work

> >       toolchain-external: allow vendor-controlled defaults
> 
> I think this could be done with the "toolchain profile" mechanism I
> proposed in the toolchain-improvements patch set I posted this morning.
> Could you remove this patch for this patch series, so that we can
> handle this later ? Thanks!

i'll take a look

> >       target-finalize: punt config scripts too
> 
> No. What if a package really wants to install a binary called
> foobar-config that must be kept on the target ? I know it's unlikely,
> but I'd prefer not to have this policy at the global level. Just do
> what other packages do: add a post install hook that removes the
> pcap-config file.

can you name a package that does this ?  i havent seen one.

> I tested the Blackfin support (well only the build part of it, since I
> don't have hardware to test), and I had a few issues with the default
> Busybox configuration:

which are all fixed by another patch i have which adds defconfigs for Blackfin 
boards.  fixing the default defconfig makes no sense to me so i'm not going to 
spend time on it.

> Another (unrelated) question: when using the Blackfin toolchains, I
> found out that the linker needs zlib installed on the host, but it
> isn't the case with the other toolchains I have. What feature of ld
> requires zlib ?

it isnt ld, it's elf2flt-ld.  and elf2flt supports compression via the ZFLAT 
format.  although in newer binutils, they have added support for compressed 
debug sections which does require zlib in misc utils such as ld ...
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 836 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101206/e6b33314/attachment.pgp>
