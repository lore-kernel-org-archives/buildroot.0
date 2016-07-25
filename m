From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Mon, 25 Jul 2016 16:34:09 -0300
Subject: [Buildroot] [PATCH] stella: new package
In-Reply-To: <20160724143035.285fb282@free-electrons.com>
References: <1469137607-8560-1-git-send-email-sergio.prado@e-labworks.com>
 <20160724143035.285fb282@free-electrons.com>
Message-ID: <CANu7NGuOxL3BhcbrXMu8_8=jZ7eZn5qqpF-Fqjkm-ezbq30-+Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas!

Thanks for reviewing the patch! I'll prepare V2.

> On Thu, 21 Jul 2016 18:46:47 -0300, Sergio Prado wrote:
> > Stella is a multi-platform Atari 2600 VCS emulator.
> >
> > Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
>
> Thanks for this contribution! Just curious, what are you doing with an
> Atari emulator in Buildroot ? :-)

I use Buildroot in my embedded Linux classes, and students always get
excited when there is some gaming activity in their exercises. :-)

Thanks!

Sergio Prado
Embedded Labworks
Office: +55 11 2628-3461
Mobile: +55 11 97123-3420

2016-07-24 9:30 GMT-03:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:
>
> Hello,
>
> On Thu, 21 Jul 2016 18:46:47 -0300, Sergio Prado wrote:
> > Stella is a multi-platform Atari 2600 VCS emulator.
> >
> > Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
>
> Thanks for this contribution! Just curious, what are you doing with an
> Atari emulator in Buildroot ? :-)
>
> See some comments below.
>
> > diff --git a/package/stella/0001-Add-cross-compilation-support.patch
b/package/stella/0001-Add-cross-compilation-support.patch
> > new file mode 100644
> > index 000000000000..f75b88a46985
> > --- /dev/null
> > +++ b/package/stella/0001-Add-cross-compilation-support.patch
> > @@ -0,0 +1,43 @@
> > +From 4d1087d29606c092919dd4375df674521af31c9c Mon Sep 17 00:00:00 2001
> > +From: Sergio Prado <sergio.prado@e-labworks.com>
> > +Date: Thu, 21 Jul 2016 13:36:21 -0300
> > +Subject: [PATCH] Add cross-compilation support
> > +
> > +Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
>
> It would be nice to submit this patch upstream.
>
> > +---
> > + Makefile  | 2 +-
> > + configure | 5 +++--
> > + 2 files changed, 4 insertions(+), 3 deletions(-)
> > +
> > +diff --git a/Makefile b/Makefile
> > +index 6dd0129587b3..b1aea5eed4a1 100644
> > +--- a/Makefile
> > ++++ b/Makefile
> > +@@ -172,7 +172,7 @@ config.mak: $(srcdir)/configure
> > +
> > + install: all
> > +     $(INSTALL) -d "$(DESTDIR)$(BINDIR)"
> > +-    $(INSTALL) -c -s -m 755 "$(srcdir)/stella$(EXEEXT)"
"$(DESTDIR)$(BINDIR)/stella$(EXEEXT)"
> > ++    $(INSTALL) -c -m 755 "$(srcdir)/stella$(EXEEXT)"
"$(DESTDIR)$(BINDIR)/stella$(EXEEXT)"
>
> This is not directly related to cross-compilation support, so it could
> ideally be part of a separate patch.
>
> > +     $(INSTALL) -d "$(DESTDIR)$(DOCDIR)"
> > +     $(INSTALL) -c -m 644 "$(srcdir)/Announce.txt"
"$(srcdir)/Changes.txt" "$(srcdir)/Copyright.txt" "$(srcdir)/License.txt"
"$(srcdir)/README-SDL.txt" "$(srcdir)/Readme.txt" "$(srcdir)/Todo.txt"
"$(srcdir)/docs/index.html" "$(srcdir)/docs/debugger.html"
"$(DESTDIR)$(DOCDIR)/"
> > +     $(INSTALL) -d "$(DESTDIR)$(DOCDIR)/graphics"
> > +diff --git a/configure b/configure
> > +index 0d90a4f0acde..a4afea8e1880 100755
> > +--- a/configure
> > ++++ b/configure
> > +@@ -502,8 +502,9 @@ if test -n "$_host"; then
> > +                     _host_os=win32
> > +                     ;;
> > +             *)
> > +-                    echo "Cross-compiling to unknown target, please
add your target to configure."
> > +-                    exit 1
> > ++                    echo "Cross-compiling to $_host target"
> > ++                    DEFINES="$DEFINES -DUNIX"
> > ++                    _host_os=unix
> > +                     ;;
> > +     esac
> > +
> > +--
> > +1.9.1
> > +
> > diff --git a/package/stella/Config.in b/package/stella/Config.in
> > new file mode 100644
> > index 000000000000..0bb96db68fbb
> > --- /dev/null
> > +++ b/package/stella/Config.in
> > @@ -0,0 +1,12 @@
> > +config BR2_PACKAGE_STELLA
> > +     bool "stella"
> > +     select BR2_PACKAGE_SDL2
>
> sdl2 depends on !BR2_STATIC_LIBS, so you must inherit this dependency
> here.
>
> > +     depends on BR2_INSTALL_LIBSTDCPP
> > +     depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
> > +     help
> > +       Stella is a multi-platform Atari 2600 VCS emulator.
> > +
> > +       http://stella.sourceforge.net/
> > +
> > +comment "stella needs a toolchain w/ C++, gcc >= 4.8"
> > +     depends on !BR2_INSTALL_LIBSTDCPP ||
!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> > diff --git a/package/stella/stella.hash b/package/stella/stella.hash
> > new file mode 100644
> > index 000000000000..71defd28d0f2
> > --- /dev/null
> > +++ b/package/stella/stella.hash
> > @@ -0,0 +1,2 @@
> > +# Locally computed:
> > +sha256
b2727a0e2d3b112d35dcb89b4bdc789e2c7f15e9d9c7054a69a2f67facd7416e
 stella-4.7.2-src.tar.xz
> > diff --git a/package/stella/stella.mk b/package/stella/stella.mk
> > new file mode 100644
> > index 000000000000..789a586bfd99
> > --- /dev/null
> > +++ b/package/stella/stella.mk
> > @@ -0,0 +1,25 @@
> >
+################################################################################
> > +#
> > +# stella
> > +#
> >
+################################################################################
> > +
> > +STELLA_VERSION = 4.7.2
> > +STELLA_SOURCE = stella-$(STELLA_VERSION)-src.tar.xz
> > +STELLA_SITE = http://downloads.sourceforge.net/stella
> > +LIBFOO_LICENSE = GPLv2
>
> According to Copyright.txt, it's GPLv2 or later, so this variable
> should contain "GPLv2+".
>
> > +LIBFOO_LICENSE_FILES = License.txt
>
> This should contain Copyright.txt as well.
>
> > +
> > +STELLA_DEPENDENCIES = sdl2
> > +
> > +STELLA_CONF_OPTS = --with-sdl-prefix=$(STAGING_DIR)/usr
> > +
> > +ifeq ($(BR2_PACKAGE_LIBPNG),y)
> > +STELLA_DEPENDENCIES += libpng
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_ZLIB),y)
> > +STELLA_DEPENDENCIES += zlib
> > +endif
>
> Both libpng and zlib are in fact mandatory. If they are not available,
> stella uses bundled versions. Since in Buildroot we don't like using
> bundled version, I'd prefer to have an unconditionally dependency on
> libpng and zlib.
>
> > +$(eval $(autotools-package))
>
> This last line is actually the biggest problem: this package is *not*
> an autotools package. Its configure script is not generated by
> autoconf, its Makefiles are not generated by automake. So it should be
> handled by the generic-package infrastructure.
>
> Yes, I know it *happens* that this package currently works with the
> autotools-package infra. But in the future, we might make changes to
> the autotools-package infra that are perfectly valid and correct for
> real autotools packages, but turn out to break the build of packages
> like stella that "look like" autotools but aren't. For this reason, I
> prefer to use generic-package for those non-autotools packages.
>
> Could you rework the stella package to take into account those comments?
>
> Thanks a lot!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160725/94e59f02/attachment.html>
