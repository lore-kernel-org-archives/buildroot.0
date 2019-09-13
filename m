From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 13 Sep 2019 13:34:01 -0500
Subject: [Buildroot] [PATCH] package/bc: bump to 1.07.1
In-Reply-To: <CANQCQpY_HqqxoUkAOcxN0_ORRnYLTdUdfBXC=5ZfShXOWCDeCg@mail.gmail.com>
References: <20190912205057.40777-1-matthew.weber@rockwellcollins.com>
 <20190913194622.303b5a31@windsurf.home>
 <CANQCQpY_HqqxoUkAOcxN0_ORRnYLTdUdfBXC=5ZfShXOWCDeCg@mail.gmail.com>
Message-ID: <CANQCQpbMuK-zoVeZyLrO3FFkQ5uiiuhs65wVYyScPnCFVmBwiw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Fri, Sep 13, 2019 at 1:14 PM Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
>
> Thomas,
>
> On Fri, Sep 13, 2019 at 12:46 PM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> >
> > Hello Matt,
> >
> > On Thu, 12 Sep 2019 15:50:57 -0500
> > Matt Weber <matthew.weber@rockwellcollins.com> wrote:
> >
> > >  * Added license hash files
> > >  * Updated site to new GNU location
> > >  * Reconfig required to use newer automake
> > >  * Dropped patch for 01_array_initialize.patch as it was fixed
> > >    in the latest
> > >  * Refactored patches for makeinfo variable and write io errs
> > >  * Added new dc fix exit code patch from Debian sid
> > >  * Added new libmath offline gen cross-compile patch from Yocto
> > >
> > > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> >
> > Do you know what is the upstream status for the different patches we
> > had and that are still needed ?
>
> For the patches that were kept in this bump, they were all still
> pending and on the debian / yocto distro patch lists.   I wasn't able
> to find any upstream submissions.  Are patches against gnu tools like
> bc done directly to the maintainer ( Phil Nelson
> <philnelson@acm.org>)?  I could definitely send them out to him if
> that makes sense.
>
> >
> > > diff --git a/package/bc/0001-bc-use-MAKEINFO-variable-for-docs.patch b/package/bc/0001-bc-use-MAKEINFO-variable-for-docs.patch
> > > new file mode 100644
> > > index 0000000000..6f82e9f82e
> > > --- /dev/null
> > > +++ b/package/bc/0001-bc-use-MAKEINFO-variable-for-docs.patch
> > > @@ -0,0 +1,34 @@
> > > +From 66d30778ec5bf98dbd106a3287d17fe0b5123490 Mon Sep 17 00:00:00 2001
> > > +From: Matt Weber <matthew.weber@rockwellcollins.com>
> > > +Date: Wed, 11 Sep 2019 21:57:35 -0500
> > > +Subject: [PATCH] bc: use MAKEINFO variable for docs
> > > +
> > > +Use the appropiate MAKEINFO variable rather than the hardcoded makeinfo
> > > +command directly, otherwise missing logic never works.
> > > +
> > > +Fixes:
> > > +http://autobuild.buildroot.net/results/b0b/b0b9dced0014a5a8026fa972f95085e8bd16a07b/
> > > +
> > > +[Recreated for 1.0.7.1 by Matt W]
> > > +Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> > > +Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> > > +---
> > > + doc/Makefile.in | 2 +-
> > > + 1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > This patch is useless, because it modifies Makefile.in, but you have
> > AUTORECONF = YES, so Makefile.in will be regenerated from Makefile.am.
> >
>
> Oops, true and it isn't easy to test on my system.  When recreating I
> definitely did use the wrong file.

Now I see what happened, I took Gustavo's original which was against
the Makefile.in.

I see that Makefile.am has a hardcoded
MAKEINFO = makeinfo --no-split

What would you propose I do?  I can see if instead I could set it to
the following which should also work, or I can just drop this patch
and see if it is still a corner case that a autobuilder finds....
MAKEINFO = @MAKEINFO@ --no-split

Matt
