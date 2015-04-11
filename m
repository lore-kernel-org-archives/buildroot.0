From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 11 Apr 2015 11:57:36 +0200
Subject: [Buildroot] [PATCH 1/2] package/lame: Fix autoreconf
In-Reply-To: <1428746257-29810-1-git-send-email-bernd.kuhls@t-online.de>
References: <1428746257-29810-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1428746257-29810-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/lame/0001-configure.patch          |   69 +++++++++
 package/lame/0002-gtk1-ac-directives.patch |  210 ++++++++++++++++++++++++++++
 package/lame/lame.mk                       |    1 +
 3 files changed, 280 insertions(+)
 create mode 100644 package/lame/0001-configure.patch
 create mode 100644 package/lame/0002-gtk1-ac-directives.patch

diff --git a/package/lame/0001-configure.patch b/package/lame/0001-configure.patch
new file mode 100644
index 0000000..7e407f2
--- /dev/null
+++ b/package/lame/0001-configure.patch
@@ -0,0 +1,69 @@
+Various patches to fix autoreconf errors.
+
+All patches besides
+- AM_ICONV in configure.in
+are already applied upstream:
+http://lame.cvs.sourceforge.net/viewvc/lame/lame/configure.in?r1=1.145&r2=1.146
+http://lame.cvs.sourceforge.net/viewvc/lame/lame/doc/html/Makefile.am?r1=1.8&r2=1.9
+http://lame.cvs.sourceforge.net/viewvc/lame/lame/doc/man/Makefile.am?r1=1.1&r2=1.2
+
+libmp3lame/i386/Makefile.am patch ported from Debian
+http://anonscm.debian.org/cgit/pkg-multimedia/lame.git/tree/debian/patches/ansi2knr2devnull.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr lame-3.99.5.org/configure.in lame-3.99.5/configure.in
+--- lame-3.99.5.org/configure.in	2012-02-28 19:50:27.000000000 +0100
++++ lame-3.99.5/configure.in	2015-04-11 11:36:15.464835008 +0200
+@@ -77,9 +77,6 @@
+ 	AC_MSG_RESULT(${GCC_version})
+ fi
+ 
+-dnl more automake stuff
+-AM_C_PROTOTYPES
+-
+ AC_CHECK_HEADER(dmalloc.h)
+ if test "${ac_cv_header_dmalloc_h}" = "yes"; then
+ 	AM_WITH_DMALLOC
+@@ -376,8 +373,6 @@
+ AC_CHECK_LIB(curses, initscr, HAVE_TERMCAP="curses")
+ AC_CHECK_LIB(ncurses, initscr, HAVE_TERMCAP="ncurses")
+ 
+-AM_ICONV
+- 
+ dnl math lib
+ AC_CHECK_LIB(m, cos, USE_LIBM="-lm")
+ dnl free fast math library
+diff -uNr lame-3.99.5.org/doc/html/Makefile.am lame-3.99.5/doc/html/Makefile.am
+--- lame-3.99.5.org/doc/html/Makefile.am	2010-09-30 22:58:40.000000000 +0200
++++ lame-3.99.5/doc/html/Makefile.am	2015-04-11 11:37:02.880239754 +0200
+@@ -1,6 +1,6 @@
+ ## $Id: Makefile.am,v 1.7 2010/09/30 20:58:40 jaz001 Exp $
+ 
+-AUTOMAKE_OPTIONS = foreign ansi2knr
++AUTOMAKE_OPTIONS = foreign
+ 
+ docdir = $(datadir)/doc
+ pkgdocdir = $(docdir)/$(PACKAGE)
+diff -uNr lame-3.99.5.org/doc/man/Makefile.am lame-3.99.5/doc/man/Makefile.am
+--- lame-3.99.5.org/doc/man/Makefile.am	2000-10-22 13:39:44.000000000 +0200
++++ lame-3.99.5/doc/man/Makefile.am	2015-04-11 11:37:08.704167318 +0200
+@@ -1,6 +1,6 @@
+ ## $Id: Makefile.am,v 1.1 2000/10/22 11:39:44 aleidinger Exp $
+ 
+-AUTOMAKE_OPTIONS = foreign ansi2knr
++AUTOMAKE_OPTIONS = foreign
+ 
+ man_MANS = lame.1
+ EXTRA_DIST = ${man_MANS}
+diff -uNr lame-3.99.5.org/libmp3lame/i386/Makefile.am lame-3.99.5/libmp3lame/i386/Makefile.am
+--- lame-3.99.5.org/libmp3lame/i386/Makefile.am	2011-04-04 11:42:34.000000000 +0200
++++ lame-3.99.5/libmp3lame/i386/Makefile.am	2015-04-11 11:37:35.191833351 +0200
+@@ -1,6 +1,6 @@
+ ## $Id: Makefile.am,v 1.26 2011/04/04 09:42:34 aleidinger Exp $
+ 
+-AUTOMAKE_OPTIONS = foreign $(top_srcdir)/ansi2knr
++AUTOMAKE_OPTIONS = foreign
+ 
+ DEFS = @DEFS@ @CONFIG_DEFS@
+ 
diff --git a/package/lame/0002-gtk1-ac-directives.patch b/package/lame/0002-gtk1-ac-directives.patch
new file mode 100644
index 0000000..858ee0b
--- /dev/null
+++ b/package/lame/0002-gtk1-ac-directives.patch
@@ -0,0 +1,210 @@
+Include GTK-1 autoconf directives in build system.
+Applied-Upstream: http://lame.cvs.sf.net/viewvc/lame/lame/acinclude.m4?r1=1.5&r2=1.6
+
+Downloaded from
+http://lame.cvs.sf.net/viewvc/lame/lame/acinclude.m4?r1=1.5&r2=1.6&view=patch
+
+to fix autoreconf.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+--- a/acinclude.m4	2006/12/21 09:03:03	1.5
++++ b/acinclude.m4	2012/06/18 20:51:05	1.6
+@@ -85,4 +85,197 @@
+ [AC_MSG_WARN(can't check for IEEE854 compliant 80 bit floats)]
+ )])]) # alex_IEEE854_FLOAT80
+ 
++# Configure paths for GTK+
++# Owen Taylor     97-11-3
+ 
++dnl AM_PATH_GTK([MINIMUM-VERSION, [ACTION-IF-FOUND [, ACTION-IF-NOT-FOUND [, MODULES]]]])
++dnl Test for GTK, and define GTK_CFLAGS and GTK_LIBS
++dnl
++AC_DEFUN([AM_PATH_GTK],
++[dnl
++dnl Get the cflags and libraries from the gtk-config script
++dnl
++AC_ARG_WITH(gtk-prefix,[  --with-gtk-prefix=PFX   Prefix where GTK is installed (optional)],
++            gtk_config_prefix="$withval", gtk_config_prefix="")
++AC_ARG_WITH(gtk-exec-prefix,[  --with-gtk-exec-prefix=PFX Exec prefix where GTK is installed (optional)],
++            gtk_config_exec_prefix="$withval", gtk_config_exec_prefix="")
++AC_ARG_ENABLE(gtktest, [  --disable-gtktest       Do not try to compile and run a test GTK program],
++        , enable_gtktest=yes)
++
++  for module in . $4
++  do
++      case "$module" in
++         gthread)
++             gtk_config_args="$gtk_config_args gthread"
++         ;;
++      esac
++  done
++
++  if test x$gtk_config_exec_prefix != x ; then
++     gtk_config_args="$gtk_config_args --exec-prefix=$gtk_config_exec_prefix"
++     if test x${GTK_CONFIG+set} != xset ; then
++        GTK_CONFIG=$gtk_config_exec_prefix/bin/gtk-config
++     fi
++  fi
++  if test x$gtk_config_prefix != x ; then
++     gtk_config_args="$gtk_config_args --prefix=$gtk_config_prefix"
++     if test x${GTK_CONFIG+set} != xset ; then
++        GTK_CONFIG=$gtk_config_prefix/bin/gtk-config
++     fi
++  fi
++
++  AC_PATH_PROG(GTK_CONFIG, gtk-config, no)
++  min_gtk_version=ifelse([$1], ,0.99.7,$1)
++  AC_MSG_CHECKING(for GTK - version >= $min_gtk_version)
++  no_gtk=""
++  if test "$GTK_CONFIG" = "no" ; then
++    no_gtk=yes
++  else
++    GTK_CFLAGS=`$GTK_CONFIG $gtk_config_args --cflags`
++    GTK_LIBS=`$GTK_CONFIG $gtk_config_args --libs`
++    gtk_config_major_version=`$GTK_CONFIG $gtk_config_args --version | \
++           sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\1/'`
++    gtk_config_minor_version=`$GTK_CONFIG $gtk_config_args --version | \
++           sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\2/'`
++    gtk_config_micro_version=`$GTK_CONFIG $gtk_config_args --version | \
++           sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\3/'`
++    if test "x$enable_gtktest" = "xyes" ; then
++      ac_save_CFLAGS="$CFLAGS"
++      ac_save_LIBS="$LIBS"
++      CFLAGS="$CFLAGS $GTK_CFLAGS"
++      LIBS="$GTK_LIBS $LIBS"
++dnl
++dnl Now check if the installed GTK is sufficiently new. (Also sanity
++dnl checks the results of gtk-config to some extent
++dnl
++      rm -f conf.gtktest
++      AC_TRY_RUN([
++#include <gtk/gtk.h>
++#include <stdio.h>
++#include <stdlib.h>
++
++int
++main ()
++{
++  int major, minor, micro;
++  char *tmp_version;
++
++  system ("touch conf.gtktest");
++
++  /* HP/UX 9 (%@#!) writes to sscanf strings */
++  tmp_version = g_strdup("$min_gtk_version");
++  if (sscanf(tmp_version, "%d.%d.%d", &major, &minor, &micro) != 3) {
++     printf("%s, bad version string\n", "$min_gtk_version");
++     exit(1);
++   }
++
++  if ((gtk_major_version != $gtk_config_major_version) ||
++      (gtk_minor_version != $gtk_config_minor_version) ||
++      (gtk_micro_version != $gtk_config_micro_version))
++    {
++      printf("\n*** 'gtk-config --version' returned %d.%d.%d, but GTK+ (%d.%d.%d)\n",
++             $gtk_config_major_version, $gtk_config_minor_version, $gtk_config_micro_version,
++             gtk_major_version, gtk_minor_version, gtk_micro_version);
++      printf ("*** was found! If gtk-config was correct, then it is best\n");
++      printf ("*** to remove the old version of GTK+. You may also be able to fix the error\n");
++      printf("*** by modifying your LD_LIBRARY_PATH enviroment variable, or by editing\n");
++      printf("*** /etc/ld.so.conf. Make sure you have run ldconfig if that is\n");
++      printf("*** required on your system.\n");
++      printf("*** If gtk-config was wrong, set the environment variable GTK_CONFIG\n");
++      printf("*** to point to the correct copy of gtk-config, and remove the file config.cache\n");
++      printf("*** before re-running configure\n");
++    }
++#if defined (GTK_MAJOR_VERSION) && defined (GTK_MINOR_VERSION) && defined (GTK_MICRO_VERSION)
++  else if ((gtk_major_version != GTK_MAJOR_VERSION) ||
++     (gtk_minor_version != GTK_MINOR_VERSION) ||
++           (gtk_micro_version != GTK_MICRO_VERSION))
++    {
++      printf("*** GTK+ header files (version %d.%d.%d) do not match\n",
++       GTK_MAJOR_VERSION, GTK_MINOR_VERSION, GTK_MICRO_VERSION);
++      printf("*** library (version %d.%d.%d)\n",
++       gtk_major_version, gtk_minor_version, gtk_micro_version);
++    }
++#endif /* defined (GTK_MAJOR_VERSION) ... */
++  else
++    {
++      if ((gtk_major_version > major) ||
++        ((gtk_major_version == major) && (gtk_minor_version > minor)) ||
++        ((gtk_major_version == major) && (gtk_minor_version == minor) && (gtk_micro_version >= micro)))
++      {
++        return 0;
++       }
++     else
++      {
++        printf("\n*** An old version of GTK+ (%d.%d.%d) was found.\n",
++               gtk_major_version, gtk_minor_version, gtk_micro_version);
++        printf("*** You need a version of GTK+ newer than %d.%d.%d. The latest version of\n",
++         major, minor, micro);
++        printf("*** GTK+ is always available from ftp://ftp.gtk.org.\n");
++        printf("***\n");
++        printf("*** If you have already installed a sufficiently new version, this error\n");
++        printf("*** probably means that the wrong copy of the gtk-config shell script is\n");
++        printf("*** being found. The easiest way to fix this is to remove the old version\n");
++        printf("*** of GTK+, but you can also set the GTK_CONFIG environment to point to the\n");
++        printf("*** correct copy of gtk-config. (In this case, you will have to\n");
++        printf("*** modify your LD_LIBRARY_PATH enviroment variable, or edit /etc/ld.so.conf\n");
++        printf("*** so that the correct libraries are found at run-time))\n");
++      }
++    }
++  return 1;
++}
++],, no_gtk=yes,[echo $ac_n "cross compiling; assumed OK... $ac_c"])
++       CFLAGS="$ac_save_CFLAGS"
++       LIBS="$ac_save_LIBS"
++     fi
++  fi
++  if test "x$no_gtk" = x ; then
++     AC_MSG_RESULT(yes)
++     ifelse([$2], , :, [$2])
++  else
++     AC_MSG_RESULT(no)
++     if test "$GTK_CONFIG" = "no" ; then
++       echo "*** The gtk-config script installed by GTK could not be found"
++       echo "*** If GTK was installed in PREFIX, make sure PREFIX/bin is in"
++       echo "*** your path, or set the GTK_CONFIG environment variable to the"
++       echo "*** full path to gtk-config."
++     else
++       if test -f conf.gtktest ; then
++        :
++       else
++          echo "*** Could not run GTK test program, checking why..."
++          CFLAGS="$CFLAGS $GTK_CFLAGS"
++          LIBS="$LIBS $GTK_LIBS"
++          AC_TRY_LINK([
++#include <gtk/gtk.h>
++#include <stdio.h>
++],      [ return ((gtk_major_version) || (gtk_minor_version) || (gtk_micro_version)); ],
++        [ echo "*** The test program compiled, but did not run. This usually means"
++          echo "*** that the run-time linker is not finding GTK or finding the wrong"
++          echo "*** version of GTK. If it is not finding GTK, you'll need to set your"
++          echo "*** LD_LIBRARY_PATH environment variable, or edit /etc/ld.so.conf to point"
++          echo "*** to the installed location  Also, make sure you have run ldconfig if that"
++          echo "*** is required on your system"
++    echo "***"
++          echo "*** If you have an old version installed, it is best to remove it, although"
++          echo "*** you may also be able to get things to work by modifying LD_LIBRARY_PATH"
++          echo "***"
++          echo "*** If you have a RedHat 5.0 system, you should remove the GTK package that"
++          echo "*** came with the system with the command"
++          echo "***"
++          echo "***    rpm --erase --nodeps gtk gtk-devel" ],
++        [ echo "*** The test program failed to compile or link. See the file config.log for the"
++          echo "*** exact error that occured. This usually means GTK was incorrectly installed"
++          echo "*** or that you have moved GTK since it was installed. In the latter case, you"
++          echo "*** may want to edit the gtk-config script: $GTK_CONFIG" ])
++          CFLAGS="$ac_save_CFLAGS"
++          LIBS="$ac_save_LIBS"
++       fi
++     fi
++     GTK_CFLAGS=""
++     GTK_LIBS=""
++     ifelse([$3], , :, [$3])
++  fi
++  AC_SUBST(GTK_CFLAGS)
++  AC_SUBST(GTK_LIBS)
++  rm -f conf.gtktest
++])
diff --git a/package/lame/lame.mk b/package/lame/lame.mk
index e47e0af..ac68369 100644
--- a/package/lame/lame.mk
+++ b/package/lame/lame.mk
@@ -8,6 +8,7 @@ LAME_VERSION_MAJOR = 3.99
 LAME_VERSION = $(LAME_VERSION_MAJOR).5
 LAME_SITE = http://downloads.sourceforge.net/project/lame/lame/$(LAME_VERSION_MAJOR)
 LAME_DEPENDENCIES = host-pkgconf
+LAME_AUTORECONF = YES
 LAME_INSTALL_STAGING = YES
 LAME_CONF_ENV = GTK_CONFIG=/bin/false
 LAME_CONF_OPTS = --enable-dynamic-frontends
-- 
1.7.10.4
