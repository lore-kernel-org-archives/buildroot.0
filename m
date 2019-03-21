From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 21 Mar 2019 23:28:35 +0100
Subject: [Buildroot] [PATCH v1] package/qt5base: fix xkbcommon option
In-Reply-To: <20190321225656.675bb7ee@gmx.net>
References: <20190321212323.22920-1-ps.report@gmx.net>
 <20190321213313.GC2660@scaer> <20190321225656.675bb7ee@gmx.net>
Message-ID: <20190321222835.GF2660@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2019-03-21 22:56 +0100, Peter Seiderer spake thusly:
> On Thu, 21 Mar 2019 22:33:13 +0100, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > On 2019-03-21 22:23 +0100, Peter Seiderer spake thusly:
[--SNIP--]
> > >  ifeq ($(BR2_PACKAGE_QT5BASE_XCB),y)
> > > -QT5BASE_CONFIGURE_OPTS += -xcb -system-xkbcommon
> > > +QT5BASE_CONFIGURE_OPTS += -xcb
> > > +ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
> > > +QT5BASE_CONFIGURE_OPTS += -xcb -system-xkbcommon-x11
> > > +else
> > > +QT5BASE_CONFIGURE_OPTS += -xcb -xkbcommon
> >
> > Two things:
> >
> >  1. -xcb is passed twice: once uncoditionally on the Qt version, and
> >     once for each Qt version;
> >
> >  2. The build failure you reference is about a qt-5.12 build, which
> >     complains about an "Invalid value given for boolean command line
> >     option 'xkbcommon'".
> 
> Should be:
> 
> ifeq ($(BR2_PACKAGE_QT5BASE_XCB),y)
> QT5BASE_CONFIGURE_OPTS += -xcb
> ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
> QT5BASE_CONFIGURE_OPTS += -system-xkbcommon-x11
> else
> QT5BASE_CONFIGURE_OPTS += -xkbcommon
> endif
> 
> So it becomes for
> 
> - Qt 5.6:  '-system-xkbcommon'   --> '-system-xkbcommon-x11'
> - Qt 5.12: '-system-xkbcommon'   --> '-xkbcommon'

Ah, we're coming from '-system-xkbcommon' not '-xkbcommon'. OK, I had
missed that indeed...

> Will fix it in the next patch iteration...
> 
> >
> > So, it looks like qt-5.12 does not linke -xkbcommon, but this is exactly
> > what you are passing with this patch...
> 
> No, Qt 5.12 is given '-system-xkbcommon' without the patch, and
> interprets it as -xkbcommon=system and complains that 'system' is
> neither true or false...

Aha! Thanks for the explanations. That could have been part of the
commit log, I guess?

Regards,
Yann E. MORIN.

> Regards,
> Peter
> 
> >
> > Did I misunderstand something?
> >
> > Cordialement,
> > Yann E. MORIN.
> >
> > > +endif
> > > +
> > >  QT5BASE_DEPENDENCIES   += \
> > >  	libxcb \
> > >  	xcb-util-wm \
> > > --
> > > 2.21.0
> > >
> > > _______________________________________________
> > > buildroot mailing list
> > > buildroot at busybox.net
> > > http://lists.busybox.net/mailman/listinfo/buildroot
> >
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
