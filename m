From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  7 Feb 2014 17:52:31 -0300
Subject: [Buildroot] [PATCH 1/4] python: fixup python-config script
In-Reply-To: <1391806354-32698-1-git-send-email-gustavo@zacarias.com.ar>
References: <1391806354-32698-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1391806354-32698-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

The original version uses sysconfig from the python interpreter
(normally host-python) which isn't really suited to provide information
of the target python.
Use the pure shell preprocessed backport from the upcoming python 3.4

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../python/python-2.7-017-fix-python-config.patch  | 205 +++++++++++++++++++++
 1 file changed, 205 insertions(+)
 create mode 100644 package/python/python-2.7-017-fix-python-config.patch

diff --git a/package/python/python-2.7-017-fix-python-config.patch b/package/python/python-2.7-017-fix-python-config.patch
new file mode 100644
index 0000000..7f923b9
--- /dev/null
+++ b/package/python/python-2.7-017-fix-python-config.patch
@@ -0,0 +1,205 @@
+Add a backport of http://bugs.python.org/issue16235 so we can use
+python-config for cross builds.
+This basically replaces the python version of python-config with a pure-shell
+version that's already preprocessed when installed and doesn't depend
+on the sysconfig import that usually leads to bad data/results.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura Python-2.7.3.orig/configure.in Python-2.7.3/configure.in
+--- Python-2.7.3.orig/configure.in	2013-12-13 14:43:39.793541435 -0300
++++ Python-2.7.3/configure.in	2013-12-13 17:52:54.759489901 -0300
+@@ -764,6 +764,7 @@
+ 
+ # Other platforms follow
+ if test $enable_shared = "yes"; then
++  PY_ENABLE_SHARED=1
+   AC_DEFINE(Py_ENABLE_SHARED, 1, [Defined if Python is built as a shared library.])
+   case $ac_sys_system in
+     BeOS*)
+@@ -824,6 +825,7 @@
+ 
+   esac
+ else # shared is disabled
++  PY_ENABLE_SHARED=0
+   case $ac_sys_system in
+     CYGWIN*)
+           BLDLIBRARY='$(LIBRARY)'
+@@ -1747,6 +1749,9 @@
+ AC_SUBST(BLDSHARED)
+ AC_SUBST(CCSHARED)
+ AC_SUBST(LINKFORSHARED)
++AC_SUBST(PY_ENABLE_SHARED)
++LIBPL="${prefix}/lib/python${VERSION}/config"
++AC_SUBST(LIBPL)
+ # SO is the extension of shared libraries `(including the dot!)
+ # -- usually .so, .sl on HP-UX, .dll on Cygwin
+ AC_MSG_CHECKING(SO)
+@@ -4320,7 +4325,7 @@
+ AC_MSG_RESULT(done)
+ 
+ # generate output files
+-AC_CONFIG_FILES(Makefile.pre Modules/Setup.config Misc/python.pc)
++AC_CONFIG_FILES(Makefile.pre Modules/Setup.config Misc/python.pc Misc/python-config.sh)
+ AC_CONFIG_FILES([Modules/ld_so_aix], [chmod +x Modules/ld_so_aix])
+ AC_OUTPUT
+ 
+diff -Nura Python-2.7.3.orig/Makefile.pre.in Python-2.7.3/Makefile.pre.in
+--- Python-2.7.3.orig/Makefile.pre.in	2013-12-13 14:43:39.401528527 -0300
++++ Python-2.7.3/Makefile.pre.in	2013-12-12 15:15:34.828640321 -0300
+@@ -152,7 +152,7 @@
+ SUBDIRSTOO=	Include Lib Misc Demo
+ 
+ # Files and directories to be distributed
+-CONFIGFILES=	configure configure.in acconfig.h pyconfig.h.in Makefile.pre.in
++CONFIGFILES=	configure configure.in acconfig.h pyconfig.h.in Makefile.pre.in Misc/python-config.sh
+ DISTFILES=	README ChangeLog $(CONFIGFILES)
+ DISTDIRS=	$(SUBDIRS) $(SUBDIRSTOO) Ext-dummy
+ DIST=		$(DISTFILES) $(DISTDIRS)
+@@ -366,7 +366,7 @@
+ 
+ # Default target
+ all:		build_all
+-build_all:	$(BUILDPYTHON) oldsharedmods sharedmods gdbhooks
++build_all:	$(BUILDPYTHON) oldsharedmods sharedmods gdbhooks python-config
+ 
+ # Compile a binary with gcc profile guided optimization.
+ profile-opt:
+@@ -969,10 +969,12 @@
+ 	export EXE; EXE="$(BUILDEXE)"; \
+ 	cd $(srcdir)/Lib/$(PLATDIR); $(RUNSHARED) ./regen
+ 
+-python-config: $(srcdir)/Misc/python-config.in
++python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
+ 	# Substitution happens here, as the completely-expanded BINDIR
+ 	# is not available in configure
+-	sed -e "s, at EXENAME@,$(BINDIR)/python$(VERSION)$(EXE)," < $(srcdir)/Misc/python-config.in >python-config
++	sed -e "s, at EXENAME@,$(BINDIR)/python$(VERSION)$(EXE)," < $(srcdir)/Misc/python-config.in >python-config.py
++	# Replace makefile compat. variable references with shell script compat. ones; $(VAR) -> ${VAR}
++	sed -e 's,\$$(\([A-Za-z0-9_]*\)),\$$\{\1\},g' Misc/python-config.sh >python-config
+ 
+ # Install the include files
+ INCLDIRSTOMAKE=$(INCLUDEDIR) $(CONFINCLUDEDIR) $(INCLUDEPY) $(CONFINCLUDEPY)
+@@ -1031,7 +1033,7 @@
+ 	$(INSTALL_SCRIPT) $(srcdir)/Modules/makesetup $(DESTDIR)$(LIBPL)/makesetup
+ 	$(INSTALL_SCRIPT) $(srcdir)/install-sh $(DESTDIR)$(LIBPL)/install-sh
+ 	$(INSTALL_SCRIPT) python-config $(DESTDIR)$(BINDIR)/python$(VERSION)-config
+-	rm python-config
++	$(INSTALL_SCRIPT) python-config.py $(DESTDIR)$(LIBPL)/python-config.py
+ 	@if [ -s Modules/python.exp -a \
+ 		"`echo $(MACHDEP) | sed 's/^\(...\).*/\1/'`" = "aix" ]; then \
+ 		echo; echo "Installing support files for building shared extension modules on AIX:"; \
+@@ -1206,6 +1208,7 @@
+ 		config.cache config.log pyconfig.h Modules/config.c
+ 	-rm -rf build platform
+ 	-rm -rf $(PYTHONFRAMEWORKDIR)
++	-rm -f python-config.py python-config
+ 
+ # Make things extra clean, before making a distribution:
+ # remove all generated files, even Makefile[.pre]
+diff -Nura Python-2.7.3.orig/Misc/python-config.sh.in Python-2.7.3/Misc/python-config.sh.in
+--- Python-2.7.3.orig/Misc/python-config.sh.in	1969-12-31 21:00:00.000000000 -0300
++++ Python-2.7.3/Misc/python-config.sh.in	2013-12-13 17:53:07.752918023 -0300
+@@ -0,0 +1,102 @@
++#!/bin/sh
++
++exit_with_usage ()
++{
++	echo "Usage: $0 --prefix|--exec-prefix|--includes|--libs|--cflags|--ldflags|--extension-suffix|--help|--configdir"
++	exit $1
++}
++
++if [ "$1" = "" ] ; then
++	exit_with_usage 1
++fi
++
++# Returns the actual prefix where this script was installed to.
++installed_prefix ()
++{
++	RESULT=$(dirname $(cd $(dirname "$1") && pwd -P))
++	if which readlink >/dev/null 2>&1 ; then
++	RESULT=$(readlink -f "$RESULT")
++	fi
++	echo $RESULT
++}
++
++prefix_build="@prefix@"
++prefix_real=$(installed_prefix "$0")
++
++# Use sed to fix paths from their built to locations to their installed to locations.
++prefix=$(echo "$prefix_build" | sed "s#$prefix_build#$prefix_real#")
++exec_prefix_build="@exec_prefix@"
++exec_prefix=$(echo "$exec_prefix_build" | sed "s#$exec_prefix_build#$prefix_real#")
++includedir=$(echo "@includedir@")
++libdir=$(echo "@libdir@" | sed "s#$prefix_build#$prefix_real#")
++CFLAGS=$(echo "@CFLAGS@" | sed "s#$prefix_build#$prefix_real#")
++VERSION="@VERSION@"
++LIBM="@LIBM@"
++LIBC="@LIBC@"
++SYSLIBS="$LIBM $LIBC"
++LIBS="@LIBS@ $SYSLIBS -lpython${VERSION}"
++BASECFLAGS="@BASECFLAGS@"
++LDLIBRARY="@LDLIBRARY@"
++LINKFORSHARED="@LINKFORSHARED@"
++OPT="@OPT@"
++PY_ENABLE_SHARED="@PY_ENABLE_SHARED@"
++LDVERSION="@LDVERSION@"
++LIBDEST=${prefix}/lib/python${VERSION}
++LIBPL=$(echo "@LIBPL@" | sed "s#$prefix_build#$prefix_real#")
++SO="@SO@"
++PYTHONFRAMEWORK="@PYTHONFRAMEWORK@"
++INCDIR="-I$includedir/python${VERSION}"
++PLATINCDIR="-I$includedir/python${VERSION}"
++
++# Scan for --help or unknown argument.
++for ARG in $*
++do
++	case $ARG in
++	--help)
++		exit_with_usage 0
++	;;
++	--prefix|--exec-prefix|--includes|--libs|--cflags|--ldflags|--extension-suffix|--abiflags|--configdir)
++	;;
++	*)
++		exit_with_usage 1
++	;;
++esac
++done
++
++for ARG in "$@"
++do
++	case "$ARG" in
++	--prefix)
++		echo "$prefix"
++	;;
++	--exec-prefix)
++		echo "$exec_prefix"
++	;;
++	--includes)
++		 echo "$INCDIR $PLATINCDIR"
++	;;
++	--cflags)
++		echo "$INCDIR $PLATINCDIR $BASECFLAGS $CFLAGS $OPT"
++	;;
++	--libs)
++		echo "$LIBS"
++	;;
++	--ldflags)
++		LINKFORSHAREDUSED=
++		if [ -z "$PYTHONFRAMEWORK" ] ; then
++			LINKFORSHAREDUSED=$LINKFORSHARED
++		fi
++		LIBPLUSED=
++		if [ "$PY_ENABLE_SHARED" = "0" ] ; then
++			LIBPLUSED="-L$LIBPL"
++		fi
++		echo "$LIBPLUSED -L$libdir $LIBS $LINKFORSHAREDUSED"
++	;;
++	--extension-suffix)
++		echo "$SO"
++	;;
++	--configdir)
++		echo "$LIBPL"
++	;;
++esac
++done
-- 
1.8.3.2
