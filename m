From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 20 May 2014 22:26:15 +0200
Subject: [Buildroot] [PATCH 1/1] matchbox-keyboard: Fix dependencies
In-Reply-To: <1400601515-29764-1-git-send-email-bernd.kuhls@t-online.de>
 (Bernd Kuhls's message of "Tue, 20 May 2014 17:58:35 +0200")
References: <1400601515-29764-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <87sio4gpso.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Always depend on xlib_libXft, pango is not used by the package
 > Fixes
 > http://autobuild.buildroot.net/results/473/47380d57e507ec395a1132dfd7b32d35459c1c7a//
 > http://autobuild.buildroot.net/results/d9a/d9aa2b6ddce920ea45fbd7093addfc0ee6b94467//
 > http://autobuild.buildroot.net/results/aad/aad393a81812df28cbc296f556de2acb4e6d114b//
 > http://autobuild.buildroot.net/results/124/124b28336ed61822fa6d5d2591b4e70d83b8a213//
 > and 17 other build errors, dating back to 2013-07-03

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

 > +++ b/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
 > @@ -9,7 +9,7 @@ MATCHBOX_KEYBOARD_SOURCE = matchbox-keyboard-$(MATCHBOX_KEYBOARD_VERSION).tar.bz
 >  MATCHBOX_KEYBOARD_SITE = http://downloads.yoctoproject.org/releases/matchbox/matchbox-keyboard/$(MATCHBOX_KEYBOARD_VERSION)
 >  MATCHBOX_KEYBOARD_LICENSE = GPLv2+
 >  MATCHBOX_KEYBOARD_LICENSE_FILES = COPYING
 > -MATCHBOX_KEYBOARD_DEPENDENCIES = matchbox-lib matchbox-fakekey
 > +MATCHBOX_KEYBOARD_DEPENDENCIES = matchbox-lib matchbox-fakekey xlib_libXft
 
 >  # Workaround bug in configure script
 >  MATCHBOX_KEYBOARD_CONF_ENV = expat=yes
 > @@ -20,14 +20,4 @@ endef
 
 >  MATCHBOX_KEYBOARD_POST_INSTALL_TARGET_HOOKS += MATCHBOX_KEYBOARD_POST_INSTALL_FIXES
 
 > -################################################################################
 > -
 > -ifeq ($(BR2_PACKAGE_PANGO),y)
 > -  MATCHBOX_PKEYBOARD_CONF_OPT += --enable-pango
 > -else
 > -  MATCHBOX_KEYBOARD_DEPENDENCIES += xlib_libXft
 > -endif

No?

./configure --help|grep cairo
  --enable-cairo    enable experimental Cairo support default=no

grep -A3 'enable_cairo =' configure.ac
if test x$enable_cairo = xyes; then
   PKG_CHECK_MODULES(CAIRO, cairo,, [enable_cairo="no"])
fi

if test x$enable_cairo = xno; then
PKG_CHECK_MODULES(XFT, xft,,
                 AC_MSG_ERROR([*** Required xft Librarys not found ***]))
fi

From that the previous logic seems correct?

-- 
Bye, Peter Korsgaard
