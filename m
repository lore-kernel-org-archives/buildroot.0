From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Wed, 02 Nov 2016 20:56:59 +0100
Subject: [Buildroot] [PATCH] ubifs: Fix regression in ubifs_readdir()
In-Reply-To: <20161101232215.5bf7cabd@free-electrons.com>
References: <1477648432-9543-1-git-send-email-richard@nod.at>
 <1477671544.8927.1.camel@embedded.rocks>
 <c542e099-0404-be8e-ebeb-d4265d3204d6@nod.at>
 <1477693395.31471.1.camel@embedded.rocks>
 <20161101232215.5bf7cabd@free-electrons.com>
Message-ID: <1478116619.8549.1.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2016-11-01 at 23:22 +0100, Thomas Petazzoni wrote:
> Hello J?rg,
> 
> [E-mail thread hijacked from the linux-mtd mailing list, since there
> is
> a Buildroot related problem reported.]
> 
> On Sat, 29 Oct 2016 00:23:15 +0200, J?rg Krause wrote:
> 
> > > > I'm not sure if it's related to the issue reported by Peter
> > > > Rosin
> > > > and
> > > > Ralph Sennhauser, but I am still getting a kernel panic using
> > > > UBIFS
> > > > with OverlayFS on Linux v4.9.0-rc2 with this patch applied:??
> > > 
> > > Does reverting c83ed4c9dbb35 help?
> > > And are you 100% sure you applied the fix???
> > 
> > I double double checked. The fix was applied on the git tree, but
> > the
> > compiler cache (I am using Buildroot with this option enabled)
> > fooled
> > me by using an old copy. After disabling the compiler cache I got a
> > fixed build of the kernel. The panic is gone! Thanks!
> 
> This is *really* bad. Which Buildroot version are you using?

2016.11 #

Note that I am using Buildroot as a submodule [1] and I needed to port
the br2-external tree. Maybe I messed something up?

> Are you able to reproduce the bad ccache behavior here?

Yes, I am. Linux kernel source directory is located locally and the
path is set using LINUX_OVERRIDE_SRCDIR in local.mk.

1/ Checkout Linux kernel version 4.7.10
2/ make linux-dirclean all
3/ Booted Linux version is 4.7.10

4/ Checkout Linux kernel version 4.8.5
5/ make linux-dirclean all
6/ Booted Linux version is still 4.7.10

> A modified source code should definitely lead to a different hash of
> the preprocessed code, and therefore there shouldn't be such a
> confusion between two cache results.

I checked the Linux source files in output/build/linux-custom/ and they
are correct - after step 2 the directory contains the Linux sources of
version 4.7.10 and after step 5 it contains version 4.8.5.

[1] https://github.com/Openwide-Ingenierie/buildroot-submodule

Best regards,
J?rg Krause
