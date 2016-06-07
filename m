From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Tue, 7 Jun 2016 05:42:29 +0000
Subject: [Buildroot] [PATCH] Binutils: ARC: Fix build failures if
	makeinfo is missing
In-Reply-To: <87fusqgfwi.fsf@dell.be.48ers.dk>
References: <1465211659-23861-1-git-send-email-vzakhar@synopsys.com>
 <87twh6hzxl.fsf@dell.be.48ers.dk>
 <20160606215833.57396ae8@free-electrons.com>
 <87fusqgfwi.fsf@dell.be.48ers.dk>
Message-ID: <1465278105.7088.20.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter, Thomas,

On Mon, 2016-06-06 at 23:34 +0200, Peter Korsgaard wrote:
> > 
> > > 
> > > > 
> > > > > 
> > > > > > 
> > > > > > "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> ?> Hello,
> ?> On Mon, 06 Jun 2016 21:36:54 +0200, Peter Korsgaard wrote:
> 
> ?>> > Signed-off-by: Zakharov Vlad <vzakhar@synopsys.com>??
> ?>>?
> ?>> Committed, thanks.
> 
> ?> Why?
> 
> It was fixing autobuilder issues and seemed like a sensible fix that
> could be upstreamed. Looking again, I do see that it patched Makefile.in
> and not Makefile.am, so that's not too nice though.

Indeed our goal was to fix an issue that causes all autobuilder jobs for ARC
to fail. The problem is host binutils couldn't be built any longer after we switched
to arc-2016.03 tools. And now we're unblocked.

As for patching Makefile.in vs Makefile.am again that's just to do a minimal fix
in existing sources. Otherwise if we patch Makefile.am we'll need to regenerate
Makefile.in.

Even though Vlad has already sent the same patch to Binutils mailing list
(https://sourceware.org/ml/binutils/2016-06/msg00053.html) that's indeed not
the right fix - he'll need to fix Makefile.am but at least we're moving
in upstreaming direction.

> ?> This problem also exists for other versions of binutils, and also for
> ?> gdb. And we have a patch series from Romain Naour sitting in patchwork
> ?> for several weeks.

Right so I would think as of now the same patch should be applied to other
affected instances of binutils and gdb.

> ?> I don't know if Zlad's version is better or not than Romain's version.
> ?> But at least Romain's version was handling all binutils and gdb
> ?> versions, without patching directly Makefile.in files. So at first
> ?> sight, it looked a lot better than Zlad's version.
> 
> Ok, we can always revert if it isn't needed any more once Romain's
> series is applied.

In opposite Romain's fix only makes sense for BR and I don't really like that
approach. Why implement hacks on top of
upstream sources that are not
upstreamable at all. Why not try "to fix" generic "missing" script if we do think
it behaves
improperly?

-Alexey
