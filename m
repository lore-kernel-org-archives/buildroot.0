From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 16 Apr 2021 14:42:17 +0200
Subject: [Buildroot] [PATCH] package/dmalloc: Fix for ARC with enabled
 BR2_SSP_ALL
In-Reply-To: <MN2PR12MB29119E9D500901372F8F7F48BA4C9@MN2PR12MB2911.namprd12.prod.outlook.com>
References: <20210209104726.20132-1-kremneva@synopsys.com>
 <20210210214514.GF1679218@scaer>
 <CAPi7W82a7VoXvCjiy_A=i69XzBV+SV1-Ca5PigWgtKneWb6-Dg@mail.gmail.com>
 <BN8PR12MB333092855272691D7C9F776FA18A9@BN8PR12MB3330.namprd12.prod.outlook.com>
 <SN1PR12MB2351CE14450D2AF4FA2C36B5CA9D9@SN1PR12MB2351.namprd12.prod.outlook.com>
 <MN2PR12MB29119E9D500901372F8F7F48BA4C9@MN2PR12MB2911.namprd12.prod.outlook.com>
Message-ID: <CAPi7W80F7da05AtQvjxwsJ=Pd-JkZE-Eo8tgB9Xe-1YH=i5pqw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Veronika,

I think we should merge both patches:
 - setting -fPIC conditionally
 - dropping first patch

If you have time to update your patch, please feel free to do so.
Otherwise, I'll update mine this week-end.

Best Regards,

Fabrice

Le ven. 16 avr. 2021 ? 14:13, Veronika Kremneva
<Veronika.Kremneva@synopsys.com> a ?crit :
>
> Hi Fabrice,
>
>
>
> This problem still persists:
> http://autobuild.buildroot.net/?reason=dmalloc-5.5.2
>
> Do you have any interest in proceeding with your patch fixing it or should I go with my patch instead?
>
>
>
> Best regards,
>
> Veronika
>
>
>
> From: Claudiu Zissulescu <claziss@synopsys.com>
> Sent: Friday, February 26, 2021 12:51 PM
> To: Alexey Brodkin <abrodkin@synopsys.com>; Fabrice Fontaine <fontaine.fabrice@gmail.com>; Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Veronika Kremneva <kremneva@synopsys.com>; Fabrice Fontaine via buildroot <buildroot@busybox.net>; Evgeniy Didin <didin@synopsys.com>; ARC Buildroot mailing list <arc-buildroot@synopsys.com>
> Subject: Re: [Buildroot] [PATCH] package/dmalloc: Fix for ARC with enabled BR2_SSP_ALL
>
>
>
> Hi,
>
>
>
> You can use -fpic with any static object, the linker will resolve all the symbols at compile-time. However, the resulted code may be less performant (code size/speed) than without fpic option.
>
>
>
> Cheers,
> Claudiu
>
> ________________________________
>
> From: Alexey Brodkin <abrodkin@synopsys.com>
> Sent: Saturday, February 13, 2021 10:27 AM
> To: Fabrice Fontaine <fontaine.fabrice@gmail.com>; Yann E. MORIN <yann.morin.1998@free.fr>; Claudiu Zissulescu <claziss@synopsys.com>
> Cc: Veronika Kremneva <kremneva@synopsys.com>; Fabrice Fontaine via buildroot <buildroot@busybox.net>; Evgeniy Didin <didin@synopsys.com>; Claudiu Zissulescu <claziss@synopsys.com>; ARC Buildroot mailing list <arc-buildroot@synopsys.com>
> Subject: Re: [Buildroot] [PATCH] package/dmalloc: Fix for ARC with enabled BR2_SSP_ALL
>
>
>
> Hi Yann, Fabrice, Veronika, all,
>
> > >
> > > Veronika, All,
> > >
> > > +Fabrice, see below...
> > >
> > > On 2021-02-09 13:47 +0300, Veronika Kremneva spake thusly:
> > > > When building dmalloc for ARC while having "-fstack-protector-all" option on,
> > > > we are getting the following error:
> > > > ------------------------------->8---------------------------
> > > > >>> dmalloc 5.5.2 Installing to target
> > > > cp -dpf $HOME/buildroot/output/host/arc-buildroot-linux-gnu/sysroot/usr/lib/libdmalloc*.so
> > > > $HOME/buildroot/output/target/usr/lib
> > > > cp -dpf $HOME/buildroot/output/host/arc-buildroot-linux-gnu/sysroot/usr/bin/dmalloc
> > > > $HOME/buildroot/output/target/usr/bin/dmalloc
> > > > ERROR: architecture for "/usr/lib/libdmallocthcxx.so" is "ARCompact", should be "ARCv2"
> > > > ERROR: architecture for "/usr/lib/libdmallocth.so" is "ARCompact", should be "ARCv2"
> > > > ERROR: architecture for "/usr/lib/libdmalloc.so" is "ARCompact", should be "ARCv2"
> > > > ERROR: architecture for "/usr/lib/libdmallocxx.so" is "ARCompact", should be "ARCv2"
> > > > make: *** [$HOME/buildroot/output/build/dmalloc-5.5.2/.stamp_installed] Error 1
> > > > ------------------------------->8---------------------------
> > > >
> > > > You can observe this error in following builds:
> > > > https://urldefense.com/v3/__http://autobuild.buildroot.net/results/57f/57fc51cee4ec9339ea3be23f8c8c9f7ecca1a857/__;!!A4F2R9G_pg!PHGtF8S30pSJyoPZQMVqH0kXGTbKzHEJjoQjJBl0QfYZsIsvjySA8l4aebUi2jb0DCT50oA$
> > > > https://urldefense.com/v3/__http://autobuild.buildroot.net/results/b4d/b4d457369f35e1942c294b0ea3b3cab4cae0d7a3/__;!!A4F2R9G_pg!PHGtF8S30pSJyoPZQMVqH0kXGTbKzHEJjoQjJBl0QfYZsIsvjySA8l4aebUi2jb0TIQeXfo$
> > > > https://urldefense.com/v3/__http://autobuild.buildroot.net/results/cfc/cfc111076c955dd5c1125c6e34a161121ea11200/__;!!A4F2R9G_pg!PHGtF8S30pSJyoPZQMVqH0kXGTbKzHEJjoQjJBl0QfYZsIsvjySA8l4aebUi2jb0Zou_QLI$
> > > > https://urldefense.com/v3/__http://autobuild.buildroot.net/results/1d0/1d0ffcefbf545d1748e928603fd07c0a8de98eb5/__;!!A4F2R9G_pg!PHGtF8S30pSJyoPZQMVqH0kXGTbKzHEJjoQjJBl0QfYZsIsvjySA8l4aebUi2jb0sWpt_q8$
> > > >
> > > > In all of those builds architecture "ARCv2" was explicitly chosen during configuration
> > > > yet we are getting this error. As we go deeper we find that the object file that linker
> > > > is trying to process contains no target code thus the default "ARCompact" is being used.
> > > > But why the object file is empty? Went to check link args:
> > > > ------------------------------->8---------------------------
> > > > $HOME/buildroot/output/host/bin/arc-buildroot-linux-gnu-ld: conftest.a(conftest.o):
> > > > relocation R_ARC_32_ME against `__stack_chk_guard' can not be used when making a shared
> > > > object; recompile with -fPIC
> > > > $HOME/buildrootc/output/host/bin/arc-buildroot-linux-gnu-ld: BFD (GNU Binutils) 2.34.50.20200611
> > > > assertion fail elf32-arc.c:1802
> > > > $HOME/buildroot/output/host/bin/arc-buildroot-linux-gnu-ld: unrecognized option '-all'
> > > > $HOME/buildroot/output/host/bin/arc-buildroot-linux-gnu-ld: use the --help option for usage information
> > > > configure:4475: result: $HOME/buildroot/output/host/bin/arc-buildroot-linux-gnu-ld -G -o $@.t
> > > > ------------------------------->8---------------------------
> > > >
> > > > Looks like we are missing the -fPIC flag in DMALLOC_CFLAGS. As shared libraries should always
> > > > be compiled with "-fPIC" following patch adds this flag to the dmalloc.mk.
> > >
> > > While reviewing that patch, I see that Fabrice already sent a similar
> > > patch quite some time ago now:
> > >
> > >     https://urldefense.com/v3/__https://patchwork.ozlabs.org/project/buildroot/patch/20200601092104.830051-1-fontaine.fabrice at gmail.com/__;!!A4F2R9G_pg!PHGtF8S30pSJyoPZQMVqH0kXGTbKzHEJjoQjJBl0QfYZsIsvjySA8l4aebUi2jb0HTmC8VI$
> > >
> > > > Signed-off-by: Veronika Kremneva <kremneva@synopsys.com>
> > > > ---
> > > >  package/dmalloc/dmalloc.mk | 4 ++++
> > > >  1 file changed, 4 insertions(+)
> > > >
> > > > diff --git a/package/dmalloc/dmalloc.mk b/package/dmalloc/dmalloc.mk
> > > > index 38b2c02027..638fe0fcda 100644
> > > > --- a/package/dmalloc/dmalloc.mk
> > > > +++ b/package/dmalloc/dmalloc.mk
> > > > @@ -16,6 +16,10 @@ DMALLOC_INSTALL_STAGING = YES
> > > >  DMALLOC_CONF_OPTS = --enable-shlib
> > > >  DMALLOC_CFLAGS = $(TARGET_CFLAGS)
> > > >
> > > > +ifeq ($(BR2_STATIC_LIBS),)
> > > > +DMALLOC_CFLAGS += -fPIC
> > >
> > > So, it seems that both of you arrived to a similar conclusion, with a
> > > similar analysis.
> > >
> > > I think the change from Fabrice would in the end be better, if it at
> > > least because it drops a bundled patch.
> > >
> > > Except for that, I wonder if we care about not adding -fPIC for static
> > > libs. Indeed, the current patch unconditionally adds -fPIC to all
> > > builds, shared and static alike...
> > >
> > > Besides, -fPIC is almost innocuous for static builds (maybe a very
> > > slight overhead to resolve or jump to some symbols)...
> > >
> > > What's your thoughts, both Veronika and Fabrice?
> > It seems that we're not always consistent with -fPIC handling:
> >  - most of the packages only set -fPIC if BR2_STATIC_LIBS is not set
> >  - but some packages (e.g. argp-standalone, ficl, jimtcl, lbase64 ...)
> > set it unconditionally
> > So I have no strong opinion on both options.
>
> Since I'm not a compiler person I don't have any strong opinion here,
> except maybe for some common sense idea of not using option typically used
> for shared libs (-fPIC) for statically linked stuff.
>
> Thus it would be good to hear our GCC expert how appropriate and/or safe
> is could be to compile object files with "-fPIC" if we're going to build
> a statically-linked application?
>
> Claudiu, could you please chime in and share your thoughts in general and
> if applied to ARC in particular.
>
> -Alexey
