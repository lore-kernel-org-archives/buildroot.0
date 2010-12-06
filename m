From: Mike Frysinger <vapier@gentoo.org>
Date: Mon, 6 Dec 2010 15:20:47 -0500
Subject: [Buildroot] Pull request buildroot.git (vapier branch)
In-Reply-To: <20101206203910.15e7fd5a@surf>
References: <1291503121-24114-1-git-send-email-vapier@gentoo.org>
	<201012060250.03103.vapier@gentoo.org>
	<20101206203910.15e7fd5a@surf>
Message-ID: <201012061520.47907.vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday, December 06, 2010 14:39:10 Thomas Petazzoni wrote:
> On Mon, 6 Dec 2010 02:50:01 -0500 Mike Frysinger wrote:
> > > Moreover, pax-utils requires LARGEFILE support, so you have to do
> > 
> > > the usual stuff in the Config.in file:
> > why do you say this ?
> 
> Because when you build it with a toolchain that doesn't support
> LARGEFILE you have undefined references to glob64_t. It can probably be
> fixed in pax-utils itself, but when we don't want to fix it, we just
> mark the package as depending on LARGEFILE.

considering i'm one of the authors, i'd rather fix pax-utils upstream.  i see 
no reason for it to be using glob64 code considering we build with _GNU_SOURCE 
which implies LFS which transparently rewrites glob to glob64 with glibc.

> > > >       portmap: add nommu support
> > > 
> > > Just curious: why was portmap compiled PIE ?
> > 
> > redhat takes the general position that network daemons be compiled as
> > PIEs. since the portmap maintainer is a redhat employee, he put it
> > into the portmap build system instead of keeping it in the redhat
> > spec.  glibc does the same thing.
> 
> Ok, thanks. Do you what's the reasoning behind compiling all network
> daemons as PIE ? Is it because of some address space randomization
> feature ?

i'm fairly certain that is why.  if it werent built as a PIE, then using ASLR 
would cause unsharable mappings, and that can quickly suck up resources.

> > > Have you pushed the patches upstream ?
> > 
> > of course, but the maintainer hasnt updated things in a while.
> > probably because people are moving to rpcbind.
> 
> Should we as well ?

the rpcbind stack isnt as friendly (yet) to uClibc.  so it might be an OK 
future plan, but today it wont work out of the box.  and i dont have personal 
interest to get it resolved today.

> > > >       irda-utils: new package for IrDA devices
> > > 
> > > I know Peter wants a short description + author in each patch. Your
> > > patches are fairly obvious, but that's the rule :)
> > 
> > i dont know what you mean by author.  git already tracks authorship.
> 
> Peter still wants the patch we have in Buildroot to carry a description
> and an author. The author of the patch may not be the person who
> imported it into Buildroot.

when using `git am` or `git pull`, it does retain authorship.  i dont see how 
the changeset would make it into the tree unless people were manually doing 
`patch && git commit`.

> > > I tested the Blackfin support (well only the build part of it,
> > > since I don't have hardware to test), and I had a few issues with
> > > the default Busybox configuration:
> > 
> > which are all fixed by another patch i have which adds defconfigs for
> > Blackfin boards.  fixing the default defconfig makes no sense to me
> > so i'm not going to spend time on it.
> 
> Ok. I think we generally want Buildroot to make a working build when
> used out-of-the-box. I.e, without using any defconfig, if the user does
> "make menuconfig", selects "blackfin" and then exits, the build should
> be working. I think Peter quite likes this rule. But for the blackfin
> case, we can probably discuss how to solve this later.

well, it wont be specific to Blackfin, and would probably require digging down 
into mmu/nommu specific options in things like busybox.
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 836 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101206/b479194e/attachment-0001.pgp>
