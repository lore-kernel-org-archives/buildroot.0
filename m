From: Hartley Sweeten <HartleyS@visionengravers.com>
Date: Wed, 8 Jan 2014 00:10:29 +0000
Subject: [Buildroot] ParaGUI package?
Message-ID: <DC148C5AA1CEBA4E87973D432B1C2D8817E678D7@P3PWEX4MB008.ex4.secureserver.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

Has anyone tried to create a package for ParaGUI?

I'm trying to find a simple GUI library that can be used with SDL and this one appears
to cover my needs. Unfortunately the ParaGUI library appears to be a bit dead. The
latest release at http://download.savannah.gnu.org/releases/paragui/ is

paragui-1.1.8.tar.gz	19-Oct-2004

I found a newer branch on https://github.com/pipelka/paragui that appears to be
version 1.1.11.

I tried creating a .mk for it but have some problems getting the auto reconf to work
correctly. There is an autogen.sh in the package that correctly does the auto reconf
when I try it local on my system but I can't get it to build with Buildroot.

Here's the .mk I have so far:


################################################################################
#
# paragui
#
################################################################################

PARAGUI_VERSION = 26365b27d184ec118057bbd9bc5ef65bc6b6f5b7
PARAGUI_SITE = $(call github,pipelka,paragui,$(PARAGUI_VERSION))
PARAGUI_LICENSE = GPLv2+
PARAGUI_LICENSE_FILES = COPYING

PARAGUI_AUTORECONF = YES

PARAGUI_INSTALL_STAGING = YES
PARAGUI_DEPENDENCIES = sdl
PARAGUI_CONF_OPT = \
	--with-sdl-prefix=$(STAGING_DIR)/usr \
	--disable-debug \
	--enable-internalphysfs

ifeq ($(BR2_PACKAGE_SDL_IMAGE),y)
PARAGUI_CONF_OPT += --enable-sdl_image
PARAGUI_DEPENDENCIES += sdl_image
else
PARAGUI_CONF_OPT += --disable-sdl_image
endif

ifeq ($(BR2_PACKAGE_EXPAT),y)
PARAGUI_CONF_OPT += --disable-internalexpat
PARAGUI_DEPENDENCIES += expat
else
PARAGUI_CONF_OPT += --enable-internalexpat
endif

$(eval $(autotools-package))


The Autoreconfiguring is failing like this:

>>> paragui 26365b27d184ec118057bbd9bc5ef65bc6b6f5b7 Autoreconfiguring
aclocal: warning: autoconf input should be named 'configure.ac', not 'configure.in'
aclocal: warning: autoconf input should be named 'configure.ac', not 'configure.in'
libtoolize: putting auxiliary files in `.'.
libtoolize: copying file `./ltmain.sh'
libtoolize: Consider adding `AC_CONFIG_MACRO_DIR([m4])' to configure.in and
libtoolize: rerunning libtoolize, to keep the correct libtool macros in-tree.
libtoolize: Consider adding `-I m4' to ACLOCAL_AMFLAGS in Makefile.am.
aclocal: warning: autoconf input should be named 'configure.ac', not 'configure.in'
automake: warning: autoconf input should be named 'configure.ac', not 'configure.in'
configure.in:48: warning: AM_INIT_AUTOMAKE: two- and three-arguments forms are deprecated.  For more info, see:
configure.in:48: http://www.gnu.org/software/automake/manual/automake.html#Modernize-AM_005fINIT_005fAUTOMAKE-invocation
configure.in:55: installing './compile'
configure.in:42: installing './config.guess'
configure.in:42: installing './config.sub'
configure.in:48: installing './install-sh'
configure.in:48: installing './missing'
archivers/Makefile.am:4: warning: 'INCLUDES' is the old name for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
automake: warning: autoconf input should be named 'configure.ac', not 'configure.in'
archivers/Makefile.am: installing './depcomp'
platform/Makefile.am:3: warning: 'INCLUDES' is the old name for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
test/Makefile.am:5: warning: 'INCLUDES' is the old name for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
libtoolize: putting auxiliary files in `.'.
libtoolize: copying file `./ltmain.sh'
libtoolize: Consider adding `AC_CONFIG_MACRO_DIR([m4])' to configure.in and
libtoolize: rerunning libtoolize, to keep the correct libtool macros in-tree.
libtoolize: Consider adding `-I m4' to ACLOCAL_AMFLAGS in Makefile.am.
aclocal: warning: autoconf input should be named 'configure.ac', not 'configure.in'
automake: warning: autoconf input should be named 'configure.ac', not 'configure.in'
configure.in:55: warning: AM_INIT_AUTOMAKE: two- and three-arguments forms are deprecated.  For more info, see:
configure.in:55: http://www.gnu.org/software/automake/manual/automake.html#Modernize-AM_005fINIT_005fAUTOMAKE-invocation
configure.in:63: installing './compile'
configure.in:51: installing './config.guess'
configure.in:51: installing './config.sub'
configure.in:55: installing './install-sh'
configure.in:55: installing './missing'
Makefile.am: error: required file './NEWS' not found
Makefile.am: error: required file './ChangeLog' not found
automake: warning: autoconf input should be named 'configure.ac', not 'configure.in'
bindings/python/Makefile.am:5: warning: shell ls $(top_srcdir: non-POSIX variable name
bindings/python/Makefile.am:5: (probably a GNU make extension)
bindings/python/Makefile.am:16: warning: 'INCLUDES' is the old name for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
bindings/ruby/Makefile.am:8: warning: shell ls $(top_srcdir: non-POSIX variable name
bindings/ruby/Makefile.am:8: (probably a GNU make extension)
bindings/ruby/Makefile.am:15: warning: 'INCLUDES' is the old name for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
src/Makefile.am:28: warning: 'INCLUDES' is the old name for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
src/Makefile.am: installing './depcomp'
src/core/Makefile.am:30: warning: 'INCLUDES' is the old name for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
src/draw/Makefile.am:16: warning: 'INCLUDES' is the old name for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
src/expat/Makefile.am:9: warning: 'INCLUDES' is the old name for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
src/font/Makefile.am:10: warning: 'INCLUDES' is the old name for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
src/gp2x/Makefile.am:7: warning: 'INCLUDES' is the old name for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
src/themes/Makefile.am:7: warning: 'INCLUDES' is the old name for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
src/widgets/Makefile.am:43: warning: 'INCLUDES' is the old name for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
src/ystring/Makefile.am:9: warning: 'INCLUDES' is the old name for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
test/Makefile.am:107: warning: 'INCLUDES' is the old name for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
test/colorselector/Makefile.am:16: warning: 'INCLUDES' is the old name for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
test/fireworks/Makefile.am:16: warning: 'INCLUDES' is the old name for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
test/keyboard/Makefile.am:16: warning: 'INCLUDES' is the old name for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
autoreconf: /home/bigguiness/rpc353/buildroot/output/host/usr/bin/automake failed with exit status: 1
make: *** [/home/bigguiness/rpc353/buildroot/output/build/paragui-26365b27d184ec118057bbd9bc5ef65bc6b6f5b7/.stamp_configured] Error 1


Does anyone have any ideas or suggestions to get this library to build?

Thanks,
Hartley
