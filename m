From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 19 Jan 2021 21:42:25 +0100
Subject: [Buildroot] [PATCH 2/2] package/nano: fix tiny build
In-Reply-To: <20210119203049.GZ2375@scaer>
References: <20210119175326.497192-1-fontaine.fabrice@gmail.com>
 <20210119175326.497192-2-fontaine.fabrice@gmail.com>
 <20210119203049.GZ2375@scaer>
Message-ID: <CAPi7W83W-1kK-SErgorJkkTPzy6DOEe+WEaJODdbjDTPbbdk2A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le mar. 19 janv. 2021 ? 21:30, Yann E. MORIN <yann.morin.1998@free.fr> a ?crit :
>
> Fabrice, All,
>
> On 2021-01-19 18:53 +0100, Fabrice Fontaine spake thusly:
> > Since upstream commit
> > https://git.savannah.gnu.org/cgit/nano.git/commit/configure.ac?id=235f92ce093099cd81f14827ab842bd331132790
> >
> > --enable-color --enable-nanorc are needed for libmagic support in tiny
> > builds however as --enable-color needs fork() and tiny is selected when
> > !BR2_USE_MMU, it is easier to just disable libmagic with tiny builds
> >
> > Fixes:
> >  - http://autobuild.buildroot.net/results/24894e62d6cf89d078959b12e67596c821d64696
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  package/nano/nano.mk | 12 +++++-------
> >  1 file changed, 5 insertions(+), 7 deletions(-)
> >
> > diff --git a/package/nano/nano.mk b/package/nano/nano.mk
> > index c688ff216c..af6e1d62de 100644
> > --- a/package/nano/nano.mk
> > +++ b/package/nano/nano.mk
> > @@ -19,18 +19,16 @@ NANO_CONF_ENV += ac_cv_prog_NCURSESW_CONFIG=false
> >  NANO_MAKE_ENV += CURSES_LIB="-lncurses"
> >  endif
> >
> > -ifeq ($(BR2_PACKAGE_FILE),y)
> > -NANO_DEPENDENCIES += file
> > -NANO_CONF_OPTS += --enable-libmagic
> > -else
> > -NANO_CONF_OPTS += --disable-libmagic
> > -endif
> > -
> >  ifeq ($(BR2_PACKAGE_NANO_TINY),y)
> >  NANO_CONF_OPTS += --enable-tiny
>
> Don't wee also need an explicit --disable-libmagice in this case?
libmagic is disabled by default when tiny is enabled, here is an
extract of configure.ac:

AC_ARG_ENABLE(tiny,
AS_HELP_STRING([--enable-tiny], [Disable features for the sake of size]))
if test "x$enable_tiny" = xyes; then
  AC_DEFINE(NANO_TINY, 1, [Define this to make the nano executable as
small as possible.])
  if test "x$enable_libmagic" != xyes; then
    enable_libmagic=no
  fi
fi
>
> >  define NANO_INSTALL_TARGET_CMDS
> >       $(INSTALL) -m 0755 $(@D)/src/nano $(TARGET_DIR)/usr/bin/nano
> >  endef
> > +else ifeq ($(BR2_PACKAGE_FILE),y)
> > +NANO_DEPENDENCIES += file
> > +NANO_CONF_OPTS += --enable-libmagic
>
> And here, don't we need explicit --enable-color --enable-nanorc ?
>
> Unless they are only needed for tiny?
Yes, they're only needed for tiny, here is an extract of configure.ac:

AC_ARG_ENABLE(libmagic,
AS_HELP_STRING([--disable-libmagic], [Disable detection of file types
via libmagic]))
if test "x$enable_libmagic" = xyes; then
  if test "x$enable_tiny" = xyes; then
    if test "x$enable_color" != xyes; then
      AC_MSG_ERROR([
        ***  --enable-libmagic needs --enable-color and
--enable-nanorc to work])
    fi
  fi
  if test "x$enable_color" = xno; then
    AC_MSG_ERROR([
      ***  --enable-libmagic cannot work with --disable-color nor
--disable-nanorc])
  fi
fi
>
> Regards,
> Yann E. MORIN.
>
> > +else
> > +NANO_CONF_OPTS += --disable-libmagic
> >  endif
> >
> >  $(eval $(autotools-package))
> > --
> > 2.29.2
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
