From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 6 Mar 2015 11:24:01 +0200
Subject: [Buildroot] [PATCH v2] lmbench: fix build with libtirpc
In-Reply-To: <CAHkwnC9QDdr1k00RcbS6Mu=JAn_6Ka2HxU_g9kFL9T+0Yx4Mhg@mail.gmail.com>
References: <7760c8e2eb6de04f4acc5b4fd348cb35216bc2b7.1425615675.git.baruch@tkos.co.il>
 <CAHkwnC9QDdr1k00RcbS6Mu=JAn_6Ka2HxU_g9kFL9T+0Yx4Mhg@mail.gmail.com>
Message-ID: <20150306092401.GB15668@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabio,

On Fri, Mar 06, 2015 at 08:53:23AM +0100, Fabio Porcedda wrote:
> On Fri, Mar 6, 2015 at 5:21 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> <snip>
> > +
> > +-LDLIBS=-lm
> > ++LDLIBS="${LDLIBS} -lm"
> 
> Because we already do that for CFLAGS, instead of adding a patch just use sed:
> 
>  define LMBENCH_CONFIGURE_CMDS
>         $(call CONFIG_UPDATE,$(@D))
>         sed -i 's/CFLAGS=/CFLAGS+=/g' $(@D)/src/Makefile
> +       sed -i 's/LDLIBS=/LDLIBS+=/g' $(@D)/scripts/build
>         sed -i '/cd .*doc/d' $(@D)/src/Makefile
>         sed -i '/include/d' $(@D)/src/Makefile
>         touch $@
>  endef

Good point. Will do in v3.

> > + # check for HP-UX's ANSI compiler
> > + echo "main(int ac, char *av[]) { int i; }" > ${BASE}$$.c
> > diff --git a/package/lmbench/lmbench.mk b/package/lmbench/lmbench.mk
> > index 59e750c5892f..224ec6983a66 100644
> > --- a/package/lmbench/lmbench.mk
> > +++ b/package/lmbench/lmbench.mk
> > @@ -11,12 +11,11 @@ LMBENCH_LICENSE = lmbench license (based on GPLv2)
> >  LMBENCH_LICENSE_FILES = COPYING COPYING-2
> >
> >  LMBENCH_CFLAGS = $(TARGET_CFLAGS)
> > -LMBENCH_LDLIBS = $(TARGET_LDFLAGS)
> 
> Why you don't want to use the TARGET_LDFLAGS variable anymore? This
> change is not needed to fix this build failure.

The $(LMBENCH_LDLIBS) variable was not used before this patch, so this is just 
dead code removal. Since this patch uses this variable I think we should 
remove this in this patch to avoid unintended side effects.

Thanks for reviewing,
baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
