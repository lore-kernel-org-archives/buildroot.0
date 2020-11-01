From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 1 Nov 2020 16:03:36 +0100
Subject: [Buildroot] [PATCH 1/1] package/libglib2: fix util-linux-libs
 dependency
In-Reply-To: <20201101130358.GE2887157@scaer>
References: <20201101121536.1089498-1-fontaine.fabrice@gmail.com>
 <20201101130358.GE2887157@scaer>
Message-ID: <CAPi7W82iy=kfpmsn1-z0F+ffScuVi1ivrMXFKNW+YUZy1vkrBA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Le dim. 1 nov. 2020 ? 14:04, Yann E. MORIN <yann.morin.1998@free.fr> a ?crit :
>
> Fabrice, All,
>
> On 2020-11-01 13:15 +0100, Fabrice Fontaine spake thusly:
> > Commit 2acaa86ce630f616b12aa92493e0269421c5bc97 replaced util-linux by
> > util-linux-libs but this raises the following build failure:
> >
> > Makefile:585: *** util-linux-libs is in the dependency chain of libglib2 that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.
> >
> > To fix this build failure, use util-linux or util-linux-libs depending
> > on BR2_PACKAGE_UTIL_LINUX_LIBS
>
> OK, so this is exactly what I did not like in this util-linux vs
> util-linus-libs split, and the fact that util-linux-libs is optional...
>
> IMHO:
>
>  1. util-linux-libs must be enabled as soon as util-linux is enabled,
>
>  2. packages should build-depend on util-linux-libs, and never on
>     util-linux, and should 'select BR2_PACKAGE_UTIL_LINUX_LIBS' if
>     all they need is a library.
We can't select BR2_PACKAGE_UTIL_LINUX_LIBS without selecting
BR2_PACKAGE_UTIL_LINUX as BR2_PACKAGE_UTIL_LINUX_LIBS is a hidden
option of BR2_PACKAGE_UTIL_LINUX.
Moreover, we'll select BR2_PACKAGE_UTIL_LINUX_LIBS as soon as
BR2_PACKAGE_UTIL_LINUX is enabled (as per your first suggestion).
As a result, util-linux will always be selected even if packages (such
as abootimg) only build-depend on util-linux-libs.
So, in the end, we'll fix/clean the build order but util-linux will
still be built but this is unavoidable unless util-linux-libs is moved
to its own package.
Did I misunderstood something?
I'll send a 2-patch serie that implements your first suggestion and
your second suggestion on abootimg. If it pleases you, I'll update the
other packages.
>
> So, for now I'll apply this patch, because we do need a fix.
>
> But ultimately, we wnat to sanitise this situation.
>
> Regards,
> Yann E. MORIN.
>
> > Fixes:
> >  - http://autobuild.buildroot.org/results/8bf6360a343edd10c73a756ab86cdba727f9ea43
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  package/libglib2/libglib2.mk | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
> > index 43fcb27fae..6e9dbd7b26 100644
> > --- a/package/libglib2/libglib2.mk
> > +++ b/package/libglib2/libglib2.mk
> > @@ -86,8 +86,12 @@ endif
> >
> >  ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBMOUNT),y)
> >  LIBGLIB2_CONF_OPTS += -Dlibmount=enabled
> > +ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBS),y)
> >  LIBGLIB2_DEPENDENCIES += util-linux-libs
> >  else
> > +LIBGLIB2_DEPENDENCIES += util-linux
> > +endif
> > +else
> >  LIBGLIB2_CONF_OPTS += -Dlibmount=disabled
> >  endif
> >
> > --
> > 2.28.0
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
Best Regards,

Fabrice
