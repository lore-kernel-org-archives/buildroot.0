From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 21 Mar 2019 22:56:56 +0100
Subject: [Buildroot] [PATCH v1] package/qt5base: fix xkbcommon option
In-Reply-To: <20190321213313.GC2660@scaer>
References: <20190321212323.22920-1-ps.report@gmx.net>
 <20190321213313.GC2660@scaer>
Message-ID: <20190321225656.675bb7ee@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 21 Mar 2019 22:33:13 +0100, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Peter, All,
>
> On 2019-03-21 22:23 +0100, Peter Seiderer spake thusly:
> > - Qt 5.6: according to configure --help the command line option to
> >   enable x11 xkbcommon support is '-system-xkbcommon-x11'
> >
> > - Qt 5.12: according to configure --help the command line option to
> >   enable xkbcommon support is '-xkbcommon'
> >
> > Fixes [1]:
> >
> >   ERROR: Invalid value given for boolean command line option 'xkbcommon'.
> >
> > [1] http://autobuild.buildroot.net/results/87076d03bb92a9940447ca80fc1f202e35ef39da
> >
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> >  package/qt5/qt5base/qt5base.mk | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> > index 14536980a8..b0469172c0 100644
> > --- a/package/qt5/qt5base/qt5base.mk
> > +++ b/package/qt5/qt5base/qt5base.mk
> > @@ -153,7 +153,13 @@ QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_DIRECTFB),-directfb,-no-dir
> >  QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_DIRECTFB),directfb)
> >
> >  ifeq ($(BR2_PACKAGE_QT5BASE_XCB),y)
> > -QT5BASE_CONFIGURE_OPTS += -xcb -system-xkbcommon
> > +QT5BASE_CONFIGURE_OPTS += -xcb
> > +ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
> > +QT5BASE_CONFIGURE_OPTS += -xcb -system-xkbcommon-x11
> > +else
> > +QT5BASE_CONFIGURE_OPTS += -xcb -xkbcommon
>
> Two things:
>
>  1. -xcb is passed twice: once uncoditionally on the Qt version, and
>     once for each Qt version;
>
>  2. The build failure you reference is about a qt-5.12 build, which
>     complains about an "Invalid value given for boolean command line
>     option 'xkbcommon'".

Should be:

ifeq ($(BR2_PACKAGE_QT5BASE_XCB),y)
QT5BASE_CONFIGURE_OPTS += -xcb
ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
QT5BASE_CONFIGURE_OPTS += -system-xkbcommon-x11
else
QT5BASE_CONFIGURE_OPTS += -xkbcommon
endif

So it becomes for

- Qt 5.6:  '-system-xkbcommon'   --> '-system-xkbcommon-x11'
- Qt 5.12: '-system-xkbcommon'   --> '-xkbcommon'

Will fix it in the next patch iteration...

>
> So, it looks like qt-5.12 does not linke -xkbcommon, but this is exactly
> what you are passing with this patch...

No, Qt 5.12 is given '-system-xkbcommon' without the patch, and
interprets it as -xkbcommon=system and complains that 'system' is
neither true or false...

Regards,
Peter

>
> Did I misunderstand something?
>
> Cordialement,
> Yann E. MORIN.
>
> > +endif
> > +
> >  QT5BASE_DEPENDENCIES   += \
> >  	libxcb \
> >  	xcb-util-wm \
> > --
> > 2.21.0
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
