From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Oct 2015 10:12:39 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/libsoil: new package
In-Reply-To: <1443913662-25402-1-git-send-email-bernd.kuhls@t-online.de>
 (Bernd Kuhls's message of "Sun, 4 Oct 2015 01:07:42 +0200")
References: <1443913662-25402-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <87k2r3xdag.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Needed for these new Kodi addons:
 > kodi-screensaver-asterwave
 > kodi-screensaver-cpblobs
 > kodi-screensaver-matrixtrails
 > kodi-screensaver-planestate
 > kodi-visualisation-fountain

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 > v2: added various changes after a review by Thomas
 >     - not available as static library
 >     - used author's upstream tarball instead from Debian

tarball? It looks like it's a .zip

>     - added a Makefile fix to simplify the usage of variable CC

 >  package/Config.in                       |  1 +
 >  package/libsoil/0001-fix-makefile.patch | 38 ++++++++++++++++++++++++++++++
 >  package/libsoil/Config.in               | 12 ++++++++++
 >  package/libsoil/libsoil.hash            |  2 ++
 >  package/libsoil/libsoil.mk              | 41 +++++++++++++++++++++++++++++++++
 >  5 files changed, 94 insertions(+)
 >  create mode 100644 package/libsoil/0001-fix-makefile.patch
 >  create mode 100644 package/libsoil/Config.in
 >  create mode 100644 package/libsoil/libsoil.hash
 >  create mode 100644 package/libsoil/libsoil.mk

 > diff --git a/package/Config.in b/package/Config.in
 > index a74669e..317de24 100644
 > --- a/package/Config.in
 > +++ b/package/Config.in
 > @@ -830,6 +830,7 @@ menu "Graphics"
 >  	source "package/libqrencode/Config.in"
 >  	source "package/libraw/Config.in"
 >  	source "package/librsvg/Config.in"
 > +	source "package/libsoil/Config.in"
 >  	source "package/libsvg/Config.in"
 >  	source "package/libsvg-cairo/Config.in"
 >  	source "package/libsvgtiny/Config.in"
 > diff --git a/package/libsoil/0001-fix-makefile.patch b/package/libsoil/0001-fix-makefile.patch
 > new file mode 100644
 > index 0000000..242b736
 > --- /dev/null
 > +++ b/package/libsoil/0001-fix-makefile.patch
 > @@ -0,0 +1,38 @@
 > +Various makefile fixes to allow cross compilation
 > +
 > +Partly ported from
 > +http://anonscm.debian.org/cgit/pkg-games/libsoil.git/tree/debian/patches/linking_correctly.patch
 > +
 > +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > +
 > +diff -uNr "Simple OpenGL Image Library.org/projects/makefile/alternate Makefile.txt" "Simple OpenGL Image Library/projects/makefile/alternate Makefile.txt"
 > +--- "a/Simple OpenGL Image Library.org/projects/makefile/alternate Makefile.txt"	2008-07-07 18:13:28.000000000 +0200
 > ++++ "a/Simple OpenGL Image Library/projects/makefile/alternate Makefile.txt"	2015-09-30 22:20:56.506718012 +0200
 > +@@ -1,10 +1,10 @@
 > + MAKE = make
 > +-CC = gcc
 > +-INSTALL_FILE = install -p -o root -g root -m 644
 > +-INSTALL_DIR = install -p -o root -g root -d
 > +-LN = ln -s
 > ++CC = $(GCC)
 > ++INSTALL_FILE = $(INSTALL) -m 644
 > ++INSTALL_DIR = $(INSTALL) -d
 > ++LN = ln -sf
 > + RM = rm -fv
 > +-CFLAGS += -c -O2 -Wall
 > ++CFLAGS += -c -O2 -Wall -fPIC

These are not strictly needed as we can just override them on the make
cmdline.

I see there's also a makefile in the same directory that looks a more
sensible to me. It builds a static library instead though, but for such
a small and simple library that's imho ok.

 > +define LIBSOIL_BUILD_CMDS
 > +	$(TARGET_CONFIGURE_OPTS) $(MAKE) \
 > +		-f ../projects/makefile/alternate\ Makefile.txt \
 > +		-C $(@D)/Simple\ OpenGL\ Image\ Library/src
 > +endef

Somebody apparently likes spaces in directory names ;)

> +
 > +define LIBSOIL_INSTALL_STAGING_CMDS
 > +	$(TARGET_CONFIGURE_OPTS) $(MAKE) \
 > +		-f ../projects/makefile/alternate\ Makefile.txt \
 > +		DESTDIR=$(STAGING_DIR) install \
 > +		INSTALL=$(INSTALL) \
 > +		-C $(@D)/Simple\ OpenGL\ Image\ Library/src
 > +endef
 > +
 > +define LIBSOIL_INSTALL_TARGET_CMDS
 > +	$(TARGET_CONFIGURE_OPTS) $(MAKE) \
 > +		-f ../projects/makefile/alternate\ Makefile.txt \
 > +		DESTDIR=$(TARGET_DIR) install \
 > +		INSTALL=$(INSTALL) \
 > +		-C $(@D)/Simple\ OpenGL\ Image\ Library/src
 > +endef

If we move to the other makefile this can be dropped (and
_INSTALL_TARGET = NO).

-- 
Bye, Peter Korsgaard
