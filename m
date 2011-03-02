From: bao bui <buiqbao@gmail.com>
Date: Tue, 1 Mar 2011 19:18:23 -0800
Subject: [Buildroot] error: expected identifier before '(' token ehwn
	compiling with arm-unknown-linux-uclibcgnueabi-g++
Message-ID: <AANLkTikKuq23dj_2Lpc9-JjsHKvUX1OpPVfyBF_hX_XD@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am trying to compile pdf-filters with buildroot. I got the error when
compiling pdftopdf.cxx

/usr/include/poppler/goo/GooString.h:38: note: the mangling of 'va_list' has
changed in GCC 4.4
In file included from P2PObject.h:32,
                 from P2PCatalog.h:36,
                 from P2PCatalog.cxx:32:
P2POutputStream.h:48: error: expected identifier before '(' token
P2POutputStream.h:48: error: expected identifier before '(' token

This error occurs at the putchar function.

This is strange because I can compile with native g++ for x86 without error

Please help! I am running out of idea

Below is the P2POutputStream.h file:

/*

Copyright (c) 2006-2007, BBR Inc.  All rights reserved.

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be included
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
/*
 P2POutputStream.h
 pdftopdf stream for output
*/
#ifndef _P2POUTPUTSTREAM_H_
#define _P2POUTPUTSTREAM_H_

#include "goo/gtypes.h"

#include <config.h>
#ifndef HAVE_ZLIB_H
#undef HAVE_LIBZ
#endif
#include <stdio.h>
#ifdef HAVE_LIBZ
#include <zlib.h>
#endif

class P2POutputStream {
public:
  P2POutputStream(FILE *fpA);
  ~P2POutputStream();
  int write(const void *buf, int n);
  int putchar(char c);
  int printf(const char *format, ...);



  int puts(const char *str);
  int getPosition() { return position; }
  GBool canDeflate() {
#ifdef HAVE_LIBZ
    return gTrue;
#else
    return gFalse;
#endif
  }
  void startDeflate();
  void endDeflate();
private:
  FILE *fp;
  /* output position */
  int position;
#ifdef HAVE_LIBZ
  z_stream zstream;
  GBool deflating;
#endif
};

#endif



And below is the Makedefs file:

#
# "$Id: Makedefs.in 7242 2008-01-22 22:37:21Z mike $"
#
#   Common makefile definitions for the Common UNIX Printing System (CUPS).
#
#   Copyright 2007-2008 by Apple Inc.
#   Copyright 1997-2007 by Easy Software Products, all rights reserved.
#
#   These coded instructions, statements, and computer programs are the
#   property of Apple Inc. and are protected by Federal copyright
#   law.  Distribution and use rights are outlined in the file "LICENSE.txt"
#   which should have been included with this file.  If this file is
#   file is missing or damaged, see the license at "http://www.cups.org/".
#

#
# Programs...
#

AR        =
/home/bao/work/buildroot/output/staging/usr/bin/arm-unknown-linux-uclibcgnueabi-ar
AWK        =    gawk
CC        =
 /home/bao/work/buildroot/output/staging/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
--sysroot=/home/bao/work/buildroot/output/staging
CXX        =
 /home/bao/work/buildroot/output/staging/usr/bin/arm-unknown-linux-uclibcgnueabi-g++
--sysroot=/home/bao/work/buildroot/output/staging
DSO        =    $(CC)
HTMLDOC        =
INSTALL        =    /usr/bin/install -c
LD        =
/home/bao/work/buildroot/output/staging/usr/bin/arm-unknown-linux-uclibcgnueabi-ld
--sysroot=/home/bao/work/buildroot/output/staging
LIBTOOL        =
LN        =    /bin/ln -sf
MV        =    /bin/mv
PHPCONFIG    =
RANLIB        =
/home/bao/work/buildroot/output/staging/usr/bin/arm-unknown-linux-uclibcgnueabi-ranlib
RM        =    /bin/rm -f
RMDIR        =    /bin/rmdir
SED        =    /bin/sed
SHELL        =    /bin/sh
STRIP        =
/home/bao/work/buildroot/output/staging/usr/bin/arm-unknown-linux-uclibcgnueabi-strip

#
# Installation programs...
#

INSTALL_BIN    =    $(LIBTOOL) $(INSTALL) -m 755
INSTALL_CONFIG    =    $(INSTALL) -m 640
INSTALL_DATA    =    $(INSTALL) -m 644
INSTALL_DIR    =    $(INSTALL) -d
INSTALL_LIB    =    $(LIBTOOL) $(INSTALL) -m 755
INSTALL_MAN    =    $(INSTALL) -m 644
INSTALL_SCRIPT    =    $(INSTALL) -m 755

#
# Default user, group, and system groups for the scheduler...
#

CUPS_USER    =    lp
CUPS_GROUP    =    lp
CUPS_SYSTEM_GROUPS =    lpadmin sys root
CUPS_PRIMARY_SYSTEM_GROUP =    lpadmin

#
# Default permissions...
#

CUPS_CONFIG_FILE_PERM = 640
CUPS_LOG_FILE_PERM = 644

#
# Languages to install...
#

LANGUAGES    =    da de es et fi fr he id it ja ko nl no pl pt pt_BR ru sv
zh zh_TW
INSTALL_LANGUAGES =    install-languages
UNINSTALL_LANGUAGES =    uninstall-languages

#
# Libraries...
#

LIBCUPS        =    libcups.so.2
LIBCUPSIMAGE    =    libcupsimage.so.2
LIBJPEG        =    -ljpeg
LIBLDAP        =
LIBMALLOC    =
LIBPAPER    =
LIBPNG        =    -lpng
LIBSLP        =
LIBGSSAPI    =
LIBTIFF        =    -ltiff
LIBZ        =    -lz

#
# Install static libraries?
#

INSTALLSTATIC    =

#
# Program options...
#
# ARCHFLAGS     Defines the default architecture build options.
# ARCH32FLAGS   Defines the 32-bit architecture build options, used
#               when compiling separate 32/64-bit libraries.
# ARCH64FLAGS   Defines the 64-bit architecture build options, used
#               when compiling separate 32/64-bit libraries.
# OPTIM         Defines the common compiler optimization/debugging options
#               for all architectures.
# OPTIONS       Defines other compile-time options (currently only -DDEBUG
#               for extra debug info)
#

ALL_CFLAGS    =    -Ifontembed -I.. -D_CUPS_SOURCE $(CFLAGS) $(SSLFLAGS) \
            -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_THREAD_SAFE
-D_REENTRANT $(OPTIONS)
ALL_CXXFLAGS    =    -Ioprs -Iopvp -I../opvp -I../.. -I.. -D_CUPS_SOURCE
$(CXXFLAGS) $(SSLFLAGS) \
            -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_THREAD_SAFE
-D_REENTRANT $(OPTIONS)
ARCHFLAGS    =
ARFLAGS        =    crvs
BACKLIBS    =
CFLAGS        =     -I/usr/include/poppler -I/usr/include/poppler
-I/usr/include/poppler -pipe -O2  -mtune=arm920t -march=armv4t
-mabi=aapcs-linux -msoft-float -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -I/home/bao/work/buildroot/output/staging/usr/include
-I/home/bao/work/buildroot/output/staging/include
-I/home/bao/work/buildroot/output/staging/usr/include/python2.4
COMMONLIBS    =    -lpthread -lm -lcrypt
CUPSDLIBS    =
CXXFLAGS    =     -I/usr/include/poppler -I/usr/include/poppler
-I/usr/include/poppler -DPDFTOPDF -pipe -O2  -mtune=arm920t -march=armv4t
-mabi=aapcs-linux -msoft-float -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -I/home/bao/work/buildroot/output/staging/usr/include
-I/home/bao/work/buildroot/output/staging/include
CXXLIBS        =
DSOFLAGS    =     -Wl,-soname,`basename $@` -shared $(OPTIM)
DSOLIBS        =    $(LIBTIFF) $(LIBPNG) $(LIBJPEG) $(LIBZ) $(COMMONLIBS)
DNSSDLIBS    =
FONTS        =    fonts
IMGLIBS        =
IMGFILTERS    =    imagetops imagetoraster
LAUNCHDLIBS    =
LDFLAGS        =    -L../cups -L../filter  \
            -L/home/bao/work/buildroot/output/staging/lib
-L/home/bao/work/buildroot/output/staging/usr/lib   $(OPTIM)
LEGACY_BACKENDS    =    parallel scsi
LIBCUPSORDER    =    libcups.order
LIBCUPSIMAGEORDER =    libcupsimage.order
LINKCUPS    =    -lcups $(SSLLIBS)
LINKCUPSIMAGE    =    -lcupsimage
LIBS        =    $(LINKCUPS) $(COMMONLIBS)
LCMS_LIBS    =    -llcms $(LIBS)
FONTCONFIG_LIBS    =    -lfontconfig   $(LIBS)
FREETYPE_LIBS    =    -lfreetype   $(LIBS)
IJS_LIBS    =    -lijs $(LIBS)
POPPLER_LIBS    =    -lpoppler -llcms $(LIBS)
OPTIM        =    -Wall -Wno-format-y2k -fPIC -g -D_GNU_SOURCE
OPTIONS        =
PAMLIBS        =
PAP        =
PDFTOPS        =
PHPDIR        =
SSLFLAGS    =    -DOPENSSL_DISABLE_OLD_DES_SUPPORT
SSLLIBS        =    -lssl -lcrypto

#
# Separate 32/64-bit library support...
#

ARCH32FLAGS    =
DSO32FLAGS    =     -Wl,-soname,`basename $@` -shared $(OPTIM)
INSTALL32    =
LIB32CUPS    =
LIB32CUPSIMAGE    =
LIB32DIR    =    $(BUILDROOT)
UNINSTALL32    =

ARCH64FLAGS    =
DSO64FLAGS    =     -Wl,-soname,`basename $@` -shared $(OPTIM)
INSTALL64    =
LIB64CUPS    =
LIB64CUPSIMAGE    =
LIB64DIR    =    $(BUILDROOT)
UNINSTALL64    =

#
# Directories...
#
# The first section uses the GNU names (which are *extremely*
# difficult to find in a makefile because they are lowercase...)
# We have to define these first because autoconf uses ${prefix}
# and ${exec_prefix} for most of the other directories...
#
# The "datarootdir" variable may not get defined if you are using
# a version of autoconf prior to 2.60.
#
# This is immediately followed by definition in ALL CAPS for the
# needed directories...
#

bindir        =    /usr/bin
datadir        =    /usr/share
datarootdir    =    /usr/share
exec_prefix    =    /usr
includedir    =    ${prefix}/include
infodir        =    ${datarootdir}/info
libdir        =    /usr/lib
libexecdir    =    ${exec_prefix}/libexec
localstatedir    =    /var
mandir        =    ${datarootdir}/man
oldincludedir    =    /usr/include
prefix        =    /usr
sbindir        =    /usr/sbin
sharedstatedir    =    ${prefix}/com
srcdir        =    .
sysconfdir    =    /etc
top_srcdir    =    .

BUILDROOT    =    $(DSTROOT)

AMANDIR        =    $(BUILDROOT)${datarootdir}/man
BINDIR        =    $(BUILDROOT)/usr/bin
CACHEDIR    =    $(BUILDROOT)/var/cache/cups
DATADIR        =    $(BUILDROOT)/usr/share/cups
DOCDIR        =    $(BUILDROOT)/usr/share/doc/cups
ICONDIR        =    /usr/share/icons
INCLUDEDIR    =    $(BUILDROOT)$(includedir)
INITDIR        =    /etc
INITDDIR    =
LIBDIR        =    $(BUILDROOT)$(libdir)
LOCALEDIR    =     $(BUILDROOT)/usr/share/locale
LOGDIR        =     $(BUILDROOT)/var/log/cups
MANDIR        =    $(BUILDROOT)${datarootdir}/man
MENUDIR        =    /usr/share/applications
PMANDIR        =    $(BUILDROOT)${datarootdir}/man
RCLEVELS    =    2 3 5
RCSTART        =    81
RCSTOP        =    36
REQUESTS    =     $(BUILDROOT)/var/spool/cups
SBINDIR        =    $(BUILDROOT)/usr/sbin
SERVERBIN    =     $(BUILDROOT)/usr/lib/cups
SERVERROOT    =     $(BUILDROOT)/etc/cups
STATEDIR    =    $(BUILDROOT)/var/run/cups
XINETD        =

MAN1EXT        =    1.gz
MAN5EXT        =    5.gz
MAN7EXT        =    7.gz
MAN8EXT        =    8.gz
MAN8DIR        =    8

PAMDIR        =
PAMFILE        =    pam.std

DEFAULT_LAUNCHD_CONF =
DBUSDIR        =    /etc/dbus-1


#
# Rules...
#

.SILENT:
.SUFFIXES:    .1 .1.gz .1m .1m.gz .5 .5.gz .7 .7.gz .8 .8.gz .a .c .cxx .h
.man .o .32.o .64.o .gz

.c.o:
    echo Compiling $<...
    $(CC) $(ARCHFLAGS) $(OPTIM) $(ALL_CFLAGS) -c $<

.c.32.o:
    echo Compiling 32-bit $<...
    $(CC) $(ARCH32FLAGS) $(OPTIM) $(ALL_CFLAGS) -c -o $@ $<

.c.64.o:
    echo Compiling 64-bit $<...
    $(CC) $(ARCH64FLAGS) $(OPTIM) $(ALL_CFLAGS) -c -o $@ $<

.cxx.o:
    echo Compiling $<...
    $(CXX) $(ARCHFLAGS) $(OPTIM) $(ALL_CXXFLAGS) -c $<

.man.1 .man.1m .man.5 .man.7 .man.8:
    echo Linking $<...
    $(RM) $@
    $(LN) $< $@

.man.1.gz .man.1m.gz .man.5.gz .man.7.gz .man.8.gz .man.gz:
    echo -n Compressing $<...
    $(RM) $@
    gzip -v9 <$< >$@


#
# End of "$Id: Makedefs.in 7242 2008-01-22 22:37:21Z mike $"
#
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110301/cbf15c94/attachment-0001.html>
