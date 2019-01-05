From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Jan 2019 15:10:52 +0100
Subject: [Buildroot] [PATCH 1/1] package/wine: Add gettext dependency
 for host-wine only with NLS enabled
In-Reply-To: <CAMw6YJKDP03RM3FXkvQgA4OEdvvoQvJoiA28xRyRVexVCH1y3Q@mail.gmail.com>
References: <20190104114909.14166-1-vadim4j@gmail.com>
 <20190104140109.GB19623@scaer>
 <CAMw6YJKDP03RM3FXkvQgA4OEdvvoQvJoiA28xRyRVexVCH1y3Q@mail.gmail.com>
Message-ID: <20190105151052.10295e2a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 4 Jan 2019 19:10:18 +0200, Vadim Kochan wrote:
> Yann, Thomas, All
> 
> On Fri, Jan 4, 2019 at 4:01 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> >
> > Vadim, All,
> >
> > On 2019-01-04 13:49 +0200, Vadim Kochan spake thusly:  
> > > Checked that host-wine compiles ok without host-gettext, so no
> > > needs to specify this dependency.
> > >
> > > libgettextpo is required by tools/wrc (https://linux.die.net/man/1/wrc)
> > > which allows to convert windows resources also to *.po format, which is
> > > not needed if NLS is disabled.
> > >
> > > Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
> > > ---
> > >  package/wine/wine.mk | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/package/wine/wine.mk b/package/wine/wine.mk
> > > index 78c8e6ab63..ef70b6276c 100644
> > > --- a/package/wine/wine.mk
> > > +++ b/package/wine/wine.mk
> > > @@ -307,8 +307,10 @@ WINE_CONF_OPTS += --without-zlib
> > >  endif
> > >
> > >  # host-gettext is essential for .po file support in host-wine wrc
> > > +ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
> > >  HOST_WINE_DEPENDENCIES += host-gettext
> > >  HOST_WINE_CONF_OPTS += --with-gettext --with-gettextpo
> > > +endif  
> >
> > At the beginning, I was failing to see how/why a target-related option,
> > BR2_SYSTEM_ENABLE_NLS, would affect a host package.
> >
> > But it truns out that the target wine needs the host wrc to buile the
> > .po stuff.
> >
> > However, we unconditionally compile the target wine with:
> >     --without-gettext --without-gettextpo
> >
> > So, why do we need a host wrc? And if we need it, why does it needs
> > gettext support?
> >  
> 
> So there are programs/*/ and dlls/*/ and there are 'tools/makedep.c' which
> generates programs/*/Makefile and dlls/*/Makefile for these
> sub-folders. This tool
> generates Makefile which calls 'wrc' from host to generate windows
> resource files,
> and if there was gettextpo enabled then it generates rules to create
> 'pot' files by wrc (tools/makedep.c +3169).
> But if gettextpo was disabled then the '.pot' rules does nothing (as I
> understand), for example
> here are the programs/regedit/Makefile:

But is this logic going away when --disable-nls is passed to the target
wine configure options ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
