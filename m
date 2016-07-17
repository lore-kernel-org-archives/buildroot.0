From: daggs <daggs@gmx.com>
Date: Sun, 17 Jul 2016 20:29:25 +0200
Subject: [Buildroot] prefix question for kodi.
In-Reply-To: <CAHXCMMKsfYBq46KzQ=_DgpUCFnefpuqV=mc7gDR5VKStakW74A@mail.gmail.com>
References: <trinity-f49f8e10-13bc-491a-a4be-f1a55d2f391d-1468088008466@3capp-mailcom-bs09>
 <CAHXCMM+xuaawC=rJiDrX8VwLQbhTVcDoekS86ZTsfRzK5mODdQ@mail.gmail.com>
 <trinity-cc016c92-f8fd-4e35-8ecb-627f04899e3c-1468270832325@3capp-mailcom-bs13>
 <CAHXCMMKO_1zD1bL1V1Z7j15byNTQf291Pu5W9ro6r4Qzh2qjiw@mail.gmail.com>
 <trinity-5d49d8ed-9951-4e33-97e5-190c56dca933-1468301099561@3capp-mailcom-bs12>
 <CAHXCMMKSc_qjLXXdvbUdvjhWvSnLOKODgVM4Lf+H2Gmr72tJ5w@mail.gmail.com>
 <trinity-ebbdc85a-c645-43c9-b000-8395114a47cb-1468340376643@3capp-mailcom-bs04>,
 <CAHXCMMKsfYBq46KzQ=_DgpUCFnefpuqV=mc7gDR5VKStakW74A@mail.gmail.com>
Message-ID: <trinity-04dd04f9-3b34-4775-b168-f27582d609ae-1468780165596@3capp-mailcom-bs10>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings,

> Hi Dagg, all,
> 
> On Tue, Jul 12, 2016 at 6:19 PM, daggs <daggs@gmx.com> wrote:
> > Greetings,
> >
> >> Sent: Tuesday, July 12, 2016 at 9:11 AM
> >> From: "Samuel Martin" <s.martin49@gmail.com>
> >> To: daggs <daggs@gmx.com>
> >> Subject: Re: [Buildroot] prefix question for kodi.
> >>
> >> Hi all,
> >>
> >> On Tue, Jul 12, 2016 at 7:24 AM, daggs <daggs@gmx.com> wrote:
> >> > Greetings,
> >> >
> >> >> Hi all,
> >> >>
> >> >> On Mon, Jul 11, 2016 at 11:00 PM, daggs <daggs@gmx.com> wrote:
> >> >> > Greetings,
> >> >> >
> >> >> >> This is not Kodi-specific, this is done like things for many packages
> >> >> >> (i.e. for all packages using a decent build-system, e.g. autotools
> >> >> >> [1], cmake [2], etc).. So, almost all packages.
> >> >> >>
> >> >> >> For building a target package, the prefix must point to /usr, and not
> >> >> >> to the staging dir. because:
> >> >> >> 1. The --prefix option sets the prefix location in the target
> >> >> >> directory, i.e. as its should be at runtime (at runtime in the target
> >> >> >> system).
> >> >> >> So, in the case of Buildroot, this is not (and must not be) the
> >> >> >> absolute location where stuff will be installed.
> >> >> >> Note that if you set prefix to STAGING_DIR, I bet your final rootfs
> >> >> >> won't look like what you'd expect, and may not work as expected... or
> >> >> >> not work at all!
> >> >> >> 2. To install stuff in a location different from the runtime one, we
> >> >> >> use the standard variable DESTDIR (see [3,4])
> >> >> >> So, basically when a package using a decent build-system execute an
> >> >> >> install rule, it computes the install location like this:
> >> >> >>   stuff_install_path = ${DESTDIR}${prefix}/${stuf_dir}
> >> >> >> 3. We don't (want to) build target packages twice, with only the
> >> >> >> --prefix option changed between these 2 builds (i.e. once with
> >> >> >> --prefix=$(STAGING_DIR)... and a second time with
> >> >> >> --prefix=$(TARGET_DIR)...).
> >> >> >> So, from the aforementioned reasons we build each target package once
> >> >> >> with the right prefix for the target rootfs, and install twice (if
> >> >> >> needed), once with DESTDIR=$(TARGET_DIR) and a second time with
> >> >> >> DESTDIR=$(STAGING_DIR), see [3,4].
> >> >> >>
> >> >> >> Note that for the build, things are correctly routed to the staging
> >> >> >> dir. thanks to:
> >> >> >> - the --sysroot option, optionally with -I.. or -L.. pointing to the
> >> >> >> staging tree;
> >> >> >> - the Buildroot compiler wrapper that enforce these options to be
> >> >> >> correctly set, and also check for poisoning paths (i.e. paths pointing
> >> >> >> to standard host system locations, e.g. /usr/lib or /usr/local/lib,
> >> >> >> etc).
> >> >> >>
> >> >> >> So, unless you are not lucky packaging a projet that use a
> >> >> >> non-standard build-system, or does nasty things at configure-time, you
> >> >> >> should not  paid much attention to this prefix option, Buildroot
> >> >> >> handles it for you ;-)
> >> >> >>
> >> >> >> Regards,
> >> >> >>
> >> >> >> [1] https://github.com/buildroot/buildroot/blob/master/package/pkg-autotools.mk#L181
> >> >> >> [2] https://github.com/buildroot/buildroot/blob/master/package/pkg-cmake.mk#L91
> >> >> >> [3] https://github.com/buildroot/buildroot/blob/master/package/pkg-autotools.mk#L159
> >> >> >> [4] https://github.com/buildroot/buildroot/blob/master/package/pkg-cmake.mk#L60
> >> >> >>
> >> >> >> --
> >> >> >> Samuel
> >> >> >>
> >> >> >
> >> >> > thanks for the detailed explenation, I'm not trying to do anyting fancy, only compile kodi with the --enable-codec=amcodec.
> >> >> On an autotools package, it should be pretty straight forward...
> >> >>
> >> >> > as seen in my previous mail, there is no --sysroot passed to kodi, also unless I'm misunderstood something,
> >> >> As mentioned above, the Buildroot wrapper ensure --sysroot is
> >> >> correctly passed to the actual cross-compiler, but may not print it on
> >> >> standard verbose make call. To see the actual full command, try
> >> >> setting the BR2_DEBUG_WRAPPER env. var. [5].
> >> > thanks for the tip, will enable it take a look.
> >> >
> >> >>
> >> >> > using the DESTDIR doesn't help at it is blank.
> >> >> DESTDIR is only useful at install time, not configure/build/run time.
> >> > I see, so DESTDIR is not what I need.
> >> >
> >> >>
> >> >> > my issue is that when amcodec is enabled, one of kodi's makefiles define adds new incldue path as follows: ${prefix}/usr/include/<something>.
> >> >> > as prefix is empty, instead of searching the code at staging's sysroot, it searches it on the local machine's path,
> >> >> Here is your issue.
> >> >>
> >> >> Few hints to move forward:
> >> >> 1- identify what Makefile{,.in,.am} sets this;
> >> > found it.
> >> >
> >> >> 2- how this makefile set this? does it call a *-config script, or call
> >> >> pkg_check_modules, or get it from some options/env. vars. when
> >> >> invoking the configure script (check: ./configure --help), or  just do
> >> >> nasty things manually/handwritten?
> >> > not sure I follow, buildroot does not call it, the kodi makefile does that.
> >> I meant the makefile from kodi's source.
> >> In this makefile, how does this "${prefix}/usr/include/<something>"
> >> end in some variables?
> >> Is it:
> >> - filled thanks to a call to pkg-config or some *-config script? (be
> >> carefull here, some intermediate variables set in the configure
> >> scripts may be used)
> >> - or filled from env. vars. and/or options from the configure script?
> >> - or just handwritten/hard-coded in the makefile?
> >> - or anything else?
> >> Once you have tracked down how this path ends up in the flags, it will
> >> be easier to know how to fix this the proper way.
> > you can find the code in question at https://github.com/xbmc/xbmc/blob/Jarvis/xbmc/cores/dvdplayer/DVDCodecs/Video/Makefile.in#L26
> > the issue is quite simple to understand.
> >
> In such case, I would fix upstream like this:
> 
> ifeq (@USE_LIBAMCODEC@,1)
> LIBAMCODEC_INCLUDES ?= -I$(prefix)/include/amcodec -I$(prefix)/include/amplayer
> SRCS += AMLCodec.cpp
> SRCS += DVDVideoCodecAmlogic.cpp
> INCLUDES += $(LIBAMCODEC_INCLUDES)
> endif
> 
> Then, this allows to override LIBAMCODEC_INCLUDES via the make command
> line (or make environment)
> 
> >>
> >> >
> >> >> 3- does amcodec provides a *-config script or a pkg-config module (i.e. a *.pc)?
> >> > no, it is a simple makefile project. just enter the folder and run make.
> >> Ok.
> >> This certainly means you'll have to do something like (in the
> >> Buildroot's kodi.mk file):
> >>
> >> KODI_CFLAGS = $(TARGET_CFLAGS)
> >> ...
> >> ifeq ($(BR2_PACKAGE_LIBAMCODEC),y)
> >> KODI_CONF_OPTS += --enable-amcodec
> >> KODI_DEPENDENCIES += libamcodec
> >> KODI_CFLAGS += -I$(STAGING_DIR)/usr/include/<something>
> >> KODI_LDFLAGS += -L$(STAGING_DIR)/usr/lib -lamcodec
> >> else
> >> KODI_CONF_OPTS += --disable-amcodec
> >> endif
> >> ...
> >> KODI_CONF_ENV += CFLAGS="$(KODI_CFLAGS)" LDFAGS="$(KODI_LDFLAGS)"
> > ok, I see where you are going, that might help.
> > will take into account, thanks.
> 
> So, here you just need to do:
> ifeq ($(BR2_PACKAGE_LIBAMCODEC),y)
> KODI_CONF_OPTS += --enable-amcodec
> KODI_DEPENDENCIES += libamcodec
> KODI_CONF_ENV +=
> LIBAMCODEC_INCLUDES="-I$(STAGING_DIR)/usr/include/amcodec
> -I$(STAGING_DIR)/usr/include/amplayer"
> else
> KODI_CONF_OPTS += --disable-amcodec
> endif
> 
> >
> >>
> >> >
> >> >>
> >> >> Depending on your findings in kodi and amcodec, you may need to patch
> >> >> the culprit (make?)file from kodi...
> >> >>
> >> >> > generating a WARNING: unsafe header/library path used in cross-compilation error.
> >> >> This is the poisin path check ;)
> >> >>
> >> >> >
> >> >> > how can I use DESTDIR properly?
> >> >> I'm not sure you need to do anything special about it.
> >> >> AFAICS, amcodec is autotools-based, so everything should already be
> >> >> correctly handled.
> >> > per your comment above, this isn't the var I need.
> >> >
> >> > Dagg.
> >>
> >> Regards,
> >>
> >> --
> >> Samuel
> >>
> >
> > Dagg.
> 
> Regards,
> 
> -- 
> Samuel
> 
I've tried your suggestion, it still complains about the same include path. it seems that the change doesn't apply for inner makefiles of kodi.

Dagg.
