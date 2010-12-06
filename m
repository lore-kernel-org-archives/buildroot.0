From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Dec 2010 21:44:05 +0100
Subject: [Buildroot] Pull request buildroot.git (vapier branch)
In-Reply-To: <201012061520.47907.vapier@gentoo.org>
References: <1291503121-24114-1-git-send-email-vapier@gentoo.org>
	<201012060250.03103.vapier@gentoo.org>
	<20101206203910.15e7fd5a@surf>
	<201012061520.47907.vapier@gentoo.org>
Message-ID: <20101206214405.1fe43de1@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 6 Dec 2010 15:20:47 -0500
Mike Frysinger <vapier@gentoo.org> wrote:

> considering i'm one of the authors, i'd rather fix pax-utils upstream.  i see 
> no reason for it to be using glob64 code considering we build with _GNU_SOURCE 
> which implies LFS which transparently rewrites glob to glob64 with glibc.

Ok. Here is what I have with my !LARGEFILE toolchain:

/home/test/toolchains/br-arm-basic/usr/bin/arm-linux-gcc --sysroot=/home/test/outputs/pax/staging -Os -mabi=aapcs-linux -msoft-float -D_GNU_SOURCE -o scanelf.o -c scanelf.c
scanelf.c: In function 'load_ld_cache_config':
scanelf.c:1597: error: 'glob64_t' undeclared (first use in this function)
scanelf.c:1597: error: (Each undeclared identifier is reported only once
scanelf.c:1597: error: for each function it appears in.)
scanelf.c:1597: error: expected ';' before 'gl'
scanelf.c:1598: warning: ISO C90 forbids mixed declarations and code
scanelf.c:1608: warning: implicit declaration of function 'glob64'
scanelf.c:1608: warning: nested extern declaration of 'glob64'
scanelf.c:1608: error: 'gl' undeclared (first use in this function)
scanelf.c:1615: warning: implicit declaration of function 'globfree64'
scanelf.c:1615: warning: nested extern declaration of 'globfree64'
make[1]: *** [scanelf.o] Error 1

> > > redhat takes the general position that network daemons be compiled as
> > > PIEs. since the portmap maintainer is a redhat employee, he put it
> > > into the portmap build system instead of keeping it in the redhat
> > > spec.  glibc does the same thing.
> > 
> > Ok, thanks. Do you what's the reasoning behind compiling all network
> > daemons as PIE ? Is it because of some address space randomization
> > feature ?
> 
> i'm fairly certain that is why.  if it werent built as a PIE, then using ASLR 
> would cause unsharable mappings, and that can quickly suck up resources.

Ok, thanks.

> > > > Have you pushed the patches upstream ?
> > > 
> > > of course, but the maintainer hasnt updated things in a while.
> > > probably because people are moving to rpcbind.
> > 
> > Should we as well ?
> 
> the rpcbind stack isnt as friendly (yet) to uClibc.  so it might be an OK 
> future plan, but today it wont work out of the box.  and i dont have personal 
> interest to get it resolved today.

Ok. I am personally not that familiar with portmap/rpcbind.

> > > > >       irda-utils: new package for IrDA devices
> > > > 
> > > > I know Peter wants a short description + author in each patch. Your
> > > > patches are fairly obvious, but that's the rule :)
> > > 
> > > i dont know what you mean by author.  git already tracks authorship.
> > 
> > Peter still wants the patch we have in Buildroot to carry a description
> > and an author. The author of the patch may not be the person who
> > imported it into Buildroot.
> 
> when using `git am` or `git pull`, it does retain authorship.  i dont see how 
> the changeset would make it into the tree unless people were manually doing 
> `patch && git commit`.

I'm not talking about the patches you are sending to Buildroot, but the
patches that are added to packages (i.e patches inside the patches).

For Buildroot patches, obviously Git tracks everything. But not for
the individual package/*/*.patch, which can come from various sources.

> > Ok. I think we generally want Buildroot to make a working build when
> > used out-of-the-box. I.e, without using any defconfig, if the user does
> > "make menuconfig", selects "blackfin" and then exits, the build should
> > be working. I think Peter quite likes this rule. But for the blackfin
> > case, we can probably discuss how to solve this later.
> 
> well, it wont be specific to Blackfin, and would probably require digging down 
> into mmu/nommu specific options in things like busybox.

Yes, it is definitely not Blackfin specific, and is a problem all !MMU
arches would have. But again, we could solve it at a later time, I
don't see that as a problem to get the Blackfin arch support merged.

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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101206/24d28f36/attachment.pgp>
