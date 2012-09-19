From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 19 Sep 2012 07:30:59 +0200
Subject: [Buildroot] [PATCH 7/9] firefox: GNU gnash flash plugin needs
 agg dependency
In-Reply-To: <1346855344-15081-8-git-send-email-stefan.froberg@petroprogram.com>
References: <1346855344-15081-1-git-send-email-stefan.froberg@petroprogram.com>
 <1346855344-15081-8-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <50595893.7080505@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/05/12 16:29, Stefan Fr?berg wrote:
>
> Signed-off-by: Stefan Fr?berg<stefan.froberg@petroprogram.com>

  A better commit message would be:

agg: new package

agg is needed for the GNU gnash flash plugin.


  Actually, this goes for many others in your series as well.


[snip]
> diff --git a/package/agg/Config.in b/package/agg/Config.in
> new file mode 100644
> index 0000000..98a7b02
> --- /dev/null
> +++ b/package/agg/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_AGG
> +	bool "agg"
> +	select BR2_PACKAGE_PKG_CONFIG

  This is unlikely...  You probably just need a dependency on
host-pkg-config in the .mk file.

> +	select BR2_PACKAGE_XLIB_LIBX11

  If you select an x11r7 package, you have to add

	depends on BR2_PACKAGE_XORG7

> +	select BR2_PACKAGE_SDL
> +	help
> +	  The Anti-Grain Geometry (AGG) package contains a general purpse C++ graphical toolkit.
> +	  It can be used in many areas of computer programming where high quality 2D graphics is
> +	  an essential part of the project.

  Word-wrap at 80 columns please (tab counts as 8 columns).

> +
> +	  http://www.antigrain.com
> +
> diff --git a/package/agg/agg-2.5.patch b/package/agg/agg-2.5.patch

  The patch filename should be more descriptive, and remove the version
number.

  There should also be an explanation of the patch (why and how)
and a signed-off-by line at the top of the patch.

> new file mode 100644
> index 0000000..d8749c5
> --- /dev/null
> +++ b/package/agg/agg-2.5.patch
> @@ -0,0 +1,207 @@
> +diff -Naur agg-2.5.org/authors agg-2.5/authors
> +--- agg-2.5.org/authors	2012-07-24 14:46:22.692942266 +0300
> ++++ agg-2.5/authors	1970-01-01 02:00:00.000000000 +0200
> +@@ -1,3 +0,0 @@
> +-Anti-Grain Geometry (AGG) - Version 2.5
> +-A high quality rendering engine for C++
> +-Copyright (C) 2002-2006 Maxim Shemanarev
> +diff -Naur agg-2.5.org/AUTHORS agg-2.5/AUTHORS
> +--- agg-2.5.org/AUTHORS	1970-01-01 02:00:00.000000000 +0200
> ++++ agg-2.5/AUTHORS	2006-10-09 07:06:36.000000000 +0300
> +@@ -0,0 +1,3 @@
> ++Anti-Grain Geometry (AGG) - Version 2.5
> ++A high quality rendering engine for C++
> ++Copyright (C) 2002-2006 Maxim Shemanarev

  Renaming a file is more appropriate to do in a
POST_PATCH_HOOK - then it's clearer what's happening.

> +diff -Naur agg-2.5.org/configure.in agg-2.5/configure.in
> +--- agg-2.5.org/configure.in	2012-07-24 14:46:22.685942274 +0300
> ++++ agg-2.5/configure.in	2012-07-24 14:48:22.177936690 +0300
> +@@ -8,7 +8,6 @@
> + AC_PROG_CC
> + AC_PROG_CXX
> + AC_ISC_POSIX
> +-AM_C_PROTOTYPES

  Is this really needed? There are a few packages (minicom, lame,
make, ...) that use AM_C_PROTOTYPES and they seem to work...

> + if test "x$U" != "x"; then
> +   AC_MSG_ERROR(Compiler not ANSI compliant)
> + fi
> +diff -Naur agg-2.5.org/news agg-2.5/news
> +--- agg-2.5.org/news	2012-07-24 14:46:22.692942266 +0300
> ++++ agg-2.5/news	1970-01-01 02:00:00.000000000 +0200
> +@@ -1 +0,0 @@
> +-Visit http://antigrain.com/news
> +\ Ei rivinvaihtoa tiedoston lopussa
> +diff -Naur agg-2.5.org/NEWS agg-2.5/NEWS
> +--- agg-2.5.org/NEWS	1970-01-01 02:00:00.000000000 +0200
> ++++ agg-2.5/NEWS	2006-10-09 07:06:36.000000000 +0300
> +@@ -0,0 +1 @@
> ++Visit http://antigrain.com/news
> +\ Ei rivinvaihtoa tiedoston lopussa
> +diff -Naur agg-2.5.org/readme agg-2.5/readme
> +--- agg-2.5.org/readme	2012-07-24 14:46:22.692942266 +0300
> ++++ agg-2.5/readme	1970-01-01 02:00:00.000000000 +0200
> +@@ -1,75 +0,0 @@
> +-Anti-Grain Geometry (AGG) - Version 2.5
> +-A high quality rendering engine for C++
> +-Copyright (C) 2002-2006 Maxim Shemanarev
> +-Contact: mcseem at antigrain.com
> +-         mcseemagg at yahoo.com
> +-         http://antigrain.com
> +-
> +-AGG is free software; you can redistribute it and/or
> +-modify it under the terms of the GNU General Public License
> +-as published by the Free Software Foundation; either version 2
> +-of the License, or (at your option) any later version.
> +-
> +-AGG is distributed in the hope that it will be useful,
> +-but WITHOUT ANY WARRANTY; without even the implied warranty of
> +-MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +-GNU General Public License for more details.
> +-
> +-You should have received a copy of the GNU General Public License
> +-along with AGG; if not, write to the Free Software
> +-Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
> +-MA 02110-1301, USA.
> +-
> +-
> +-
> +----------------------------------
> +-
> +-Use automake to build the library.
> +-
> +-If automake is not available you still can use the old make.
> +-There is a very simple Makefile that can be used. Note that
> +-if you use automake it will overwrite Makefile.
> +-
> +----------------------------------
> +-
> +-If building on AmigaOS 4.0 or higher type the following for
> +-instructions on what targets are available.
> +- make -f Makefile.AmigaOS
> +-
> +-To just build and install AGG into the standard AmigaOS SDK
> +-ready for use type:
> +- make -f Makefile.AmigaOS install
> +-
> +-If you just want to build one demo (e.g. lion) use:
> +- make -f Makefile.AmigaOS bin/lion
> +-
> +-If you have any questions about the AmigaOS port please
> +-contact Steven Solie (ssolie at telus.net) for help.
> +-
> +----------------------------------
> +-
> +-To build all examples using SDL (Mac or Linux) just type:
> +-
> +-cd /examples/sdl
> +-make
> +-
> +-Individual examples can be built with
> +-
> +-make aa_test
> +-
> +-In the same way the native Carbon examples can be built with
> +-
> +-cd /examples/macosx_carbon
> +-make
> +-
> +-In both cases the static library will be built (if it was not already)
> +-from the existing global Makefile in /src/.
> +-
> +-The Makefiles for both SDL and Carbon will also attempt to download the
> +-required .bmp files if they are not found in the system for a given
> +-example. If the files could not be fetched (wget) the user will receive
> +-a message explaining where to download the samples from (sphere.bmp,
> +-etc.)  Since all programs reside in the same directory there is no need
> +-to duplicate the .bmp files for each program that needs to use them.
> +-
> +----------------------------------
> +diff -Naur agg-2.5.org/README agg-2.5/README
> +--- agg-2.5.org/README	1970-01-01 02:00:00.000000000 +0200
> ++++ agg-2.5/README	2006-10-09 07:06:36.000000000 +0300
> +@@ -0,0 +1,75 @@
> ++Anti-Grain Geometry (AGG) - Version 2.5
> ++A high quality rendering engine for C++
> ++Copyright (C) 2002-2006 Maxim Shemanarev
> ++Contact: mcseem at antigrain.com
> ++         mcseemagg at yahoo.com
> ++         http://antigrain.com
> ++
> ++AGG is free software; you can redistribute it and/or
> ++modify it under the terms of the GNU General Public License
> ++as published by the Free Software Foundation; either version 2
> ++of the License, or (at your option) any later version.
> ++
> ++AGG is distributed in the hope that it will be useful,
> ++but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> ++GNU General Public License for more details.
> ++
> ++You should have received a copy of the GNU General Public License
> ++along with AGG; if not, write to the Free Software
> ++Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
> ++MA 02110-1301, USA.
> ++
> ++
> ++
> ++---------------------------------
> ++
> ++Use automake to build the library.
> ++
> ++If automake is not available you still can use the old make.
> ++There is a very simple Makefile that can be used. Note that
> ++if you use automake it will overwrite Makefile.
> ++
> ++---------------------------------
> ++
> ++If building on AmigaOS 4.0 or higher type the following for
> ++instructions on what targets are available.
> ++ make -f Makefile.AmigaOS
> ++
> ++To just build and install AGG into the standard AmigaOS SDK
> ++ready for use type:
> ++ make -f Makefile.AmigaOS install
> ++
> ++If you just want to build one demo (e.g. lion) use:
> ++ make -f Makefile.AmigaOS bin/lion
> ++
> ++If you have any questions about the AmigaOS port please
> ++contact Steven Solie (ssolie at telus.net) for help.
> ++
> ++---------------------------------
> ++
> ++To build all examples using SDL (Mac or Linux) just type:
> ++
> ++cd /examples/sdl
> ++make
> ++
> ++Individual examples can be built with
> ++
> ++make aa_test
> ++
> ++In the same way the native Carbon examples can be built with
> ++
> ++cd /examples/macosx_carbon
> ++make
> ++
> ++In both cases the static library will be built (if it was not already)
> ++from the existing global Makefile in /src/.
> ++
> ++The Makefiles for both SDL and Carbon will also attempt to download the
> ++required .bmp files if they are not found in the system for a given
> ++example. If the files could not be fetched (wget) the user will receive
> ++a message explaining where to download the samples from (sphere.bmp,
> ++etc.)  Since all programs reside in the same directory there is no need
> ++to duplicate the .bmp files for each program that needs to use them.
> ++
> ++---------------------------------
> +diff -Naur agg-2.5.org/src/platform/X11/Makefile.am agg-2.5/src/platform/X11/Makefile.am
> +--- agg-2.5.org/src/platform/X11/Makefile.am	2012-07-24 14:46:22.686942273 +0300
> ++++ agg-2.5/src/platform/X11/Makefile.am	2012-07-24 14:47:55.674937931 +0300
> +@@ -1,7 +1,7 @@
> + if ENABLE_X11
> + lib_LTLIBRARIES = libaggplatformX11.la
> +
> +-libaggplatformX11_la_LDFLAGS = -version-info @AGG_LIB_VERSION@  -L at x_libraries@
> ++libaggplatformX11_la_LDFLAGS = -version-info @AGG_LIB_VERSION@
> + libaggplatformX11_la_SOURCES = agg_platform_support.cpp
> + libaggplatformX11_la_CXXFLAGS =  -I$(top_srcdir)/include -I at x_includes@

  It surprises me that you need to remove @x_libraries@ but not @x_includes at ...

> + libaggplatformX11_la_LIBADD = -lX11
> diff --git a/package/agg/agg.mk b/package/agg/agg.mk
> new file mode 100644
> index 0000000..f4b9a75
> --- /dev/null
> +++ b/package/agg/agg.mk
> @@ -0,0 +1,17 @@
> +#############################################################
> +#
> +# agg
> +#
> +#############################################################
> +
> +AGG_VERSION = 2.5
> +AGG_SOURCE = agg-$(AGG_VERSION).tar.gz

  That's the default, you can remove this line.

> +AGG_SITE = http://www.antigrain.com/
> +AGG_DEPENDENCIES = xlib_libX11 pkg-config sdl

  Shouldn't that be host-pkg-config?

> +AGG_INSTALL_STAGING = YES
> +AGG_AUTORECONF = YES
> +AGG_LICENSE = GPLv2
> +AGG_LICENCE_FILE = readme

  Hah, this is a tough one: if you have already built the
package, it will be README, not readme.  But if you just do
a 'make legal-info' without building, legal-info will just
extract the package, not patch it...

  The easiest way out is probably to copy readme instead of
renaming it.

> +
> +$(eval $(autotools-package))
> +

  Spurious empty line at the end.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
