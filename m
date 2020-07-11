From: Thomas W. <thomas.chiantia@gmail.com>
Date: Sat, 11 Jul 2020 13:32:22 -0400
Subject: [Buildroot] [PATCH] Fix swupdate build by installing mtd
 headers as expected
In-Reply-To: <CAPxu4wcB6NeoVrsGFKfZ1nGdRq7b1gouFTG=_aRkBHm3pvYySA@mail.gmail.com>
References: <CAPxu4wfxL4rCL2Q-CKUwHS+rbvUdwjhY=b0x5CV-OkBh--qBDQ@mail.gmail.com>
 <20200711130555.3a1aea7d@windsurf.home>
 <CAPxu4wcB6NeoVrsGFKfZ1nGdRq7b1gouFTG=_aRkBHm3pvYySA@mail.gmail.com>
Message-ID: <CAPxu4wfPtUrYspORihyQ9Bd7kRxJ0OsuCE_HJXjKpaLDLd8z0A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Your patch is badly line-wrapped by your e-mail client. Could you send
> your patches using git send-email ?

Sorry, I will try to send it again if you want to update swupdate (and
it is found that other packages will not be broken with this patch).

On Sat, Jul 11, 2020 at 1:26 PM Thomas W. <thomas.chiantia@gmail.com> wrote:
>
> > Which problem is this fixing ? Is there a build issue today ? We have
> > had mtd + swupdate for quite some time. Why suddenly should we change
> > this ?
>
> Hello,
>
> There is no issue with the current Buildroot. Swupdate-2019.11 expects
> MTD headers in /include/mtd folder, and swupdate-2020.4 expects MTD
> headers in /include folder.  I upgraded my swupdate to 2020.4 and
> found that the MTD header installation must change. I tried sending PR
> to swupdate to include MTD headers in the original /include/mtd folder
> but they said it should change in buildroot. I don't know if other
> projects depend on the mtd headers. If other projects depend on the
> MTD headers then they might break with this patch unless they are
> aware of this change.
>
> On Sat, Jul 11, 2020 at 7:05 AM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> >
> > Hello Thomas,
> >
> > Thanks for your contribution!
> >
> > On Fri, 10 Jul 2020 15:41:37 -0400
> > "Thomas W." <thomas.chiantia@gmail.com> wrote:
> >
> > > swupdate expects libmtd.h and libubi.h to be in the include folder and
> > > not in the mtd namespace.
> > > (see also:
> > > https://groups.google.com/forum/#!topic/swupdate/Apv_yRLmgzY
> > > https://groups.google.com/forum/#!topic/swupdate/gd25RIPa00w
> > > https://groups.google.com/forum/#!topic/swupdate/gei0Gc_5j8M)
> > >
> > > Signed-off-by: Thomas Chiantia <thomas.chiantia@gmail.com>
> >
> > Which problem is this fixing ? Is there a build issue today ? We have
> > had mtd + swupdate for quite some time. Why suddenly should we change
> > this ?
> >
> > > diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
> > > index 3477460200..76ede98879 100644
> > > --- a/package/mtd/mtd.mk
> > > +++ b/package/mtd/mtd.mk
> > > @@ -119,8 +119,8 @@ endef
> > >  # Those libraries are not installed by "make install", but are needed
> > >  # by other packages, such as swupdate.
> > >  define MTD_INSTALL_LIBS
> > > -    $(INSTALL) -D -m 0755 $(@D)/include/libmtd.h
> > > $(STAGING_DIR)/usr/include/mtd/libmtd.h
> > > -    $(INSTALL) -D -m 0755 $(@D)/include/libubi.h
> > > $(STAGING_DIR)/usr/include/mtd/libubi.h
> > > +    $(INSTALL) -D -m 0755 $(@D)/include/libmtd.h
> > > $(STAGING_DIR)/usr/include/libmtd.h
> > > +    $(INSTALL) -D -m 0755 $(@D)/include/libubi.h
> > > $(STAGING_DIR)/usr/include/libubi.h
> > >      $(INSTALL) -D -m 0755 $(@D)/include/mtd/ubi-media.h
> > > $(STAGING_DIR)/usr/include/mtd/ubi-media.h
> > >      $(INSTALL) -D -m 0755 $(@D)/libmtd.a $(STAGING_DIR)/usr/lib/libmtd.a
> > >      $(INSTALL) -D -m 0755 $(@D)/libubi.a $(STAGING_DIR)/usr/lib/libubi.a
> >
> > Your patch is badly line-wrapped by your e-mail client. Could you send
> > your patches using git send-email ?
> >
> > Thanks!
> >
> > Thomas
> > --
> > Thomas Petazzoni, CTO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
