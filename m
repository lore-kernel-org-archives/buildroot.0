From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 25 Oct 2018 19:27:32 +0200
Subject: [Buildroot] [PATCH v3,
 1/1] bdwgc: add optional cplusplus support
In-Reply-To: <87pnvy7k6l.fsf@tkos.co.il>
References: <20181024210136.8375-1-fontaine.fabrice@gmail.com>
 <87pnvy7k6l.fsf@tkos.co.il>
Message-ID: <CAPi7W82rJxNkrhi78e7f_xBs2cEMknWKrizCU1=B9Btr8+LHuw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch,
Le jeu. 25 oct. 2018 ? 05:57, Baruch Siach <baruch@tkos.co.il> a ?crit :
>
> Hi Fabrice,
>
> Fabrice Fontaine writes:
> > Use CFLAGS_EXTRA to pass C and C++ flags in a single variable
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> > Changes v2 -> v3 (after review of Baruch Siach):
> >  - Replace BDWGC_CFLAGS by BDWGC_CFLAGS_EXTRA
> >
> > Changes v1 -> v2 (after review of Arnout Vandecappelle and Baruch
> > Siach):
> >  - Use CFLAGS_EXTRA to pass C and C++ flags in a single variable instead
> >    of using CFLAGS and CPPFLAGS
> >
> >  package/bdwgc/bdwgc.mk | 15 +++++++++++----
> >  1 file changed, 11 insertions(+), 4 deletions(-)
> >
> > diff --git a/package/bdwgc/bdwgc.mk b/package/bdwgc/bdwgc.mk
> > index 5603df8d9d..1c80f47b92 100644
> > --- a/package/bdwgc/bdwgc.mk
> > +++ b/package/bdwgc/bdwgc.mk
> > @@ -19,17 +19,24 @@ HOST_BDWGC_DEPENDENCIES = host-libatomic_ops host-pkgconf
> >  # solution.
> >  BDWGC_AUTORECONF = YES
> >
> > -BDWGC_CFLAGS = $(TARGET_CFLAGS)
>
> This removes TARGET_CLAGS ...
Yes, TARGET_CFLAGS is already passed in CFLAGS and CXXFLAGS by the
autotools-package infrastructure.
Because we don't override CFLAGS anymore, this line can be removed.
Did I miss something?
>
> >  ifeq ($(BR2_sparc),y)
> > -BDWGC_CFLAGS += -DAO_NO_SPARC_V9
> > +BDWGC_CFLAGS_EXTRA += -DAO_NO_SPARC_V9
> >  endif
> >  ifeq ($(BR2_STATIC_LIBS),y)
> > -BDWGC_CFLAGS += -DGC_NO_DLOPEN
> > +BDWGC_CFLAGS_EXTRA += -DGC_NO_DLOPEN
> >  endif
> >
> > +BDWGC_CONF_OPTS = CFLAGS_EXTRA="$(BDWGC_CFLAGS_EXTRA)"
>
> ... so you need to add it back here.
>
> Nit: I'd move the BDWGC_CONF_OPTS assignment upper.
I can send a v4 with this update if you want. What is the best
practice in buildroot concerning variable assignment?
Should we set BDWGC_CONF_OPTS = CFLAGS_EXTRA="$(BDWGC_CFLAGS_EXTRA)"
before putting any value in BDWGC_CFLAGS_EXTRA?
Or perhaps the issue is that I used = to make the assignment after
ifeq statements.
If I replace = by +=, can I keep this line here?
>
> baruch
>
> > +
> >  # Ensure we use the system libatomic_ops, and not the internal one.
> > -BDWGC_CONF_OPTS = --with-libatomic-ops=yes CFLAGS="$(BDWGC_CFLAGS)"
> > +BDWGC_CONF_OPTS += --with-libatomic-ops=yes
> >  HOST_BDWGC_CONF_OPTS = --with-libatomic-ops=yes
> >
> > +ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
> > +BDWGC_CONF_OPTS += --enable-cplusplus
> > +else
> > +BDWGC_CONF_OPTS += --disable-cplusplus
> > +endif
> > +
> >  $(eval $(autotools-package))
> >  $(eval $(host-autotools-package))
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
Best Regards,

Fabrice
