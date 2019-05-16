From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 May 2019 16:12:41 +0200
Subject: [Buildroot] [PATCH] package/python: security bump to version 2.7.16
Message-ID: <20190516141241.16065-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following security issues:

- CVE-2013-1752: Change use of readline() in :class:`imaplib.IMAP4_SSL` to limit line length

- CVE-2018-14647: The C accelerated _elementtree module now initializes hash
  randomization salt from _Py_HashSecret instead of libexpat's default
  CSPRNG.

For more details, see the NEWS file:
https://github.com/python/cpython/blob/v2.7.16/Misc/NEWS.d/2.7.16rc1.rst

Refresh patches, drop now upstream
package/python/0035-bpo-35746-Fix-segfault-in-ssl-s-cert-parser-GH-11569.patch
and adjust hash of LICENSE file for a change of copyright years.

run-tests results:
16:05:41 TestPython2                              Starting
16:05:42 TestPython2                              Building
16:11:26 TestPython2                              Building done
16:11:32 TestPython2                              Cleaning up
.
----------------------------------------------------------------------
Ran 1 test in 351.905s

OK

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...the-install-location-of-_sysconfigdata.py.patch |  24 ++--
 ...-compilation-of-.pyc-and-.pyo-conditional.patch |  14 ++-
 ...st-getaddrinfo-test-for-cross-compilation.patch |  10 +-
 ...-infrastructure-to-be-able-to-disable-ext.patch |  20 ++--
 .../0009-Fix-python-config-for-cross-builds.patch  |  34 +++---
 ...0-Remove-the-python-symlink-install-rules.patch |  10 +-
 ...on-to-disable-installation-of-test-module.patch |  18 +--
 .../0017-Add-an-option-to-disable-pydoc.patch      |  22 ++--
 .../0018-Add-an-option-to-disable-lib2to3.patch    |  22 ++--
 ...-Add-option-to-disable-the-sqlite3-module.patch |  18 +--
 ...20-Add-an-option-to-disable-the-tk-module.patch |  18 +--
 ...dd-an-option-to-disable-the-curses-module.patch |  16 +--
 .../0022-Add-an-option-to-disable-expat.patch      |  20 ++--
 .../0023-Add-an-option-to-disable-CJK-codecs.patch |  10 +-
 .../python/0024-Add-an-option-to-disable-NIS.patch |  10 +-
 ...0025-Add-an-option-to-disable-unicodedata.patch |  10 +-
 .../0026-Add-an-option-to-disable-bsddb.patch      |  18 +--
 ...7-Add-an-option-to-disable-the-ssl-module.patch |  10 +-
 ...8-Add-an-option-to-disable-the-bz2-module.patch |  12 +-
 ...-Add-an-option-to-disable-the-zlib-module.patch |  10 +-
 .../0030-Do-not-install-the-idle-editor.patch      |  16 +--
 ...-option-to-disable-the-ossaudiodev-module.patch |  10 +-
 ...-Add-option-to-disable-the-hashlib-module.patch |  12 +-
 ...-Add-an-option-to-disable-readline-module.patch |  10 +-
 ...ix-segfault-in-ssl-s-cert-parser-GH-11569.patch | 121 ---------------------
 package/python/python.hash                         |   8 +-
 package/python/python.mk                           |   2 +-
 27 files changed, 216 insertions(+), 289 deletions(-)
 delete mode 100644 package/python/0035-bpo-35746-Fix-segfault-in-ssl-s-cert-parser-GH-11569.patch

diff --git a/package/python/0003-Change-the-install-location-of-_sysconfigdata.py.patch b/package/python/0003-Change-the-install-location-of-_sysconfigdata.py.patch
index db5bfe1a10..9e05af2e31 100644
--- a/package/python/0003-Change-the-install-location-of-_sysconfigdata.py.patch
+++ b/package/python/0003-Change-the-install-location-of-_sysconfigdata.py.patch
@@ -1,4 +1,4 @@
-From 0ef0d4ddd3f2261e381f22061a9a451dfbb1dc9e Mon Sep 17 00:00:00 2001
+From e3f3c454ec4992a2283640cef0a35da5a05fb399 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Tue, 7 Mar 2017 22:17:59 +0100
 Subject: [PATCH] Change the install location of _sysconfigdata.py
@@ -19,16 +19,18 @@ this directory gets added to the PYTHONPATH of the host Python
 interpreter when building Python modules for the target.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[Peter: update for 2.7.16]
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 ---
  Makefile.pre.in | 12 ++++++++++--
  configure.ac    |  2 +-
  2 files changed, 11 insertions(+), 3 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index e288964..5367df7 100644
+index 9297e7fc89..49d3c0926f 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -529,6 +529,9 @@ pybuilddir.txt: $(BUILDPYTHON)
+@@ -509,6 +509,9 @@ pybuilddir.txt: $(BUILDPYTHON)
  		rm -f ./pybuilddir.txt ; \
  		exit 1 ; \
  	fi
@@ -38,7 +40,7 @@ index e288964..5367df7 100644
  
  # This is shared by the math and cmath modules
  Modules/_math.o: Modules/_math.c Modules/_math.h
-@@ -1080,7 +1083,7 @@ libinstall:	build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
+@@ -1091,7 +1094,7 @@ libinstall:	build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
  		else	true; \
  		fi; \
  	done
@@ -47,7 +49,7 @@ index e288964..5367df7 100644
  	do \
  		if test -x $$i; then \
  			$(INSTALL_SCRIPT) $$i $(DESTDIR)$(LIBDEST); \
-@@ -1090,6 +1093,11 @@ libinstall:	build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
+@@ -1101,6 +1104,11 @@ libinstall:	build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
  			echo $(INSTALL_DATA) $$i $(LIBDEST); \
  		fi; \
  	done
@@ -59,7 +61,7 @@ index e288964..5367df7 100644
  	@for d in $(LIBSUBDIRS); \
  	do \
  		a=$(srcdir)/Lib/$$d; \
-@@ -1418,7 +1426,7 @@ distclean: clobber
+@@ -1426,7 +1434,7 @@ distclean: clobber
  		Modules/Setup Modules/Setup.local Modules/Setup.config \
  		Modules/ld_so_aix Modules/python.exp Misc/python.pc
  	-rm -f python*-gdb.py
@@ -69,18 +71,18 @@ index e288964..5367df7 100644
  	# Expansion is performed here by shell (spawned by make) itself before
  	# arguments are passed to find. So LC_ALL=C must be set as a separate
 diff --git a/configure.ac b/configure.ac
-index 1273465..5f89797 100644
+index aecf6066e8..7143172b98 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -33,7 +33,7 @@ if test "$cross_compiling" = yes; then
+@@ -36,7 +36,7 @@ if test "$cross_compiling" = yes; then
  	    AC_MSG_ERROR([python$PACKAGE_VERSION interpreter not found])
  	fi
          AC_MSG_RESULT($interp)
 -	PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir) _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(shell test -f pybuilddir.txt && echo $(abs_builddir)/`cat pybuilddir.txt`:)$(srcdir)/Lib:$(srcdir)/Lib/$(PLATDIR) '$interp
 +	PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir) _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(shell test -f pysysconfigdatadir.txt && echo $(abs_builddir)/`cat pysysconfigdatadir.txt`:)$(srcdir)/Lib:$(srcdir)/Lib/$(PLATDIR) '$interp
      fi
-     # Used to comment out stuff for rebuilding generated files
-     GENERATED_COMMENT='#'
+ elif test "$cross_compiling" = maybe; then
+     AC_MSG_ERROR([Cross compiling required --host=HOST-TUPLE and --build=ARCH])
 -- 
-2.7.4
+2.11.0
 
diff --git a/package/python/0004-Make-the-compilation-of-.pyc-and-.pyo-conditional.patch b/package/python/0004-Make-the-compilation-of-.pyc-and-.pyo-conditional.patch
index 3bf407d542..ef1eb04046 100644
--- a/package/python/0004-Make-the-compilation-of-.pyc-and-.pyo-conditional.patch
+++ b/package/python/0004-Make-the-compilation-of-.pyc-and-.pyo-conditional.patch
@@ -1,4 +1,4 @@
-From 168e6c594e80395583de5ab0d082be119b2061fc Mon Sep 17 00:00:00 2001
+From 57ab41fa019d3ce276decd488938e5a00049cb9d Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Tue, 7 Mar 2017 22:18:57 +0100
 Subject: [PATCH] Make the compilation of .pyc and .pyo conditional
@@ -7,16 +7,18 @@ This commit adds --{enable,disable}-{pyc,pyo} options to enable/disable
 the compilation of pyc/pyo files.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[Peter: update for 2.7.16]
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 ---
  Makefile.pre.in |  8 ++++++++
  configure.ac    | 11 +++++++++++
  2 files changed, 19 insertions(+)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 5367df7..96fc718 100644
+index 49d3c0926f..247d3c2902 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1128,24 +1128,32 @@ libinstall:	build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
+@@ -1139,24 +1139,32 @@ libinstall:	build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
  		$(INSTALL_DATA) $(srcdir)/Modules/xxmodule.c \
  			$(DESTDIR)$(LIBDEST)/distutils/tests ; \
  	fi
@@ -50,10 +52,10 @@ index 5367df7..96fc718 100644
  		$(PYTHON_FOR_BUILD) -m lib2to3.pgen2.driver $(DESTDIR)$(LIBDEST)/lib2to3/Grammar.txt
  	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
 diff --git a/configure.ac b/configure.ac
-index 5f89797..4aafc82 100644
+index 7143172b98..6bd8369105 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -759,6 +759,17 @@ SunOS*)
+@@ -773,6 +773,17 @@ SunOS*)
      ;;
  esac
  
@@ -72,5 +74,5 @@ index 5f89797..4aafc82 100644
  AC_SUBST(LIBRARY)
  AC_MSG_CHECKING(LIBRARY)
 -- 
-2.7.4
+2.11.0
 
diff --git a/package/python/0005-Adjust-getaddrinfo-test-for-cross-compilation.patch b/package/python/0005-Adjust-getaddrinfo-test-for-cross-compilation.patch
index e0a24ec806..c910ae7181 100644
--- a/package/python/0005-Adjust-getaddrinfo-test-for-cross-compilation.patch
+++ b/package/python/0005-Adjust-getaddrinfo-test-for-cross-compilation.patch
@@ -1,4 +1,4 @@
-From 2d971c3cdca9ecc55f2da8aba12ca89e1a66519a Mon Sep 17 00:00:00 2001
+From e674e29ceba34e55c9149ce99489e543aa4ebb01 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Tue, 7 Mar 2017 22:19:47 +0100
 Subject: [PATCH] Adjust getaddrinfo() test for cross-compilation
@@ -7,15 +7,17 @@ The getaddrinfo() test in configure.ac uses AC_RUN_IFELSE(), which isn't
 cross-compilation friendly.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[Peter: update for 2.7.16]
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 ---
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 4aafc82..63e6918 100644
+index 6bd8369105..77ca6d86ca 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3527,7 +3527,7 @@ fi
+@@ -3563,7 +3563,7 @@ fi
  
  AC_MSG_RESULT($ac_cv_buggy_getaddrinfo)
  
@@ -25,5 +27,5 @@ index 4aafc82..63e6918 100644
  	if test $ipv6 = yes
  	then
 -- 
-2.7.4
+2.11.0
 
diff --git a/package/python/0006-Add-minimal-infrastructure-to-be-able-to-disable-ext.patch b/package/python/0006-Add-minimal-infrastructure-to-be-able-to-disable-ext.patch
index 44a8ae2cc5..b1a20eb04e 100644
--- a/package/python/0006-Add-minimal-infrastructure-to-be-able-to-disable-ext.patch
+++ b/package/python/0006-Add-minimal-infrastructure-to-be-able-to-disable-ext.patch
@@ -1,4 +1,4 @@
-From 977de9474c1fb46359ab6a487e153fbd91a2b568 Mon Sep 17 00:00:00 2001
+From 94ec96dd8827adfb5e272d28a4d76510e28657b3 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Tue, 7 Mar 2017 22:21:28 +0100
 Subject: [PATCH] Add minimal infrastructure to be able to disable extensions
@@ -8,6 +8,8 @@ disable Python extensions. Follow-up commits actually add options to
 disable specific extensions.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[Peter: update for 2.7.16]
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 ---
  Makefile.pre.in | 6 +++++-
  configure.ac    | 2 ++
@@ -15,10 +17,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  3 files changed, 11 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 96fc718..33b994d 100644
+index 247d3c2902..c1c98ecc5a 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -161,6 +161,8 @@ FILEMODE=	644
+@@ -160,6 +160,8 @@ FILEMODE=	644
  # configure script arguments
  CONFIG_ARGS=	@CONFIG_ARGS@
  
@@ -27,7 +29,7 @@ index 96fc718..33b994d 100644
  
  # Subdirectories with code
  SRCDIRS= 	@SRCDIRS@
-@@ -548,6 +550,7 @@ sharedmods: $(BUILDPYTHON) pybuilddir.txt Modules/_math.o
+@@ -528,6 +530,7 @@ sharedmods: $(BUILDPYTHON) pybuilddir.txt Modules/_math.o
  	esac; \
  	$(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' \
  		_TCLTK_INCLUDES='$(TCLTK_INCLUDES)' _TCLTK_LIBS='$(TCLTK_LIBS)' \
@@ -35,7 +37,7 @@ index 96fc718..33b994d 100644
  		$(PYTHON_FOR_BUILD) $(srcdir)/setup.py $$quiet build
  
  # Build static library
-@@ -1269,7 +1272,8 @@ libainstall:	all python-config
+@@ -1280,7 +1283,8 @@ libainstall:	@DEF_MAKE_RULE@ python-config
  # Install the dynamically loadable modules
  # This goes into $(exec_prefix)
  sharedinstall: sharedmods
@@ -46,10 +48,10 @@ index 96fc718..33b994d 100644
  		--install-scripts=$(BINDIR) \
  		--install-platlib=$(DESTSHARED) \
 diff --git a/configure.ac b/configure.ac
-index 63e6918..5d4232f 100644
+index 77ca6d86ca..13f90b3ddd 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2462,6 +2462,8 @@ LIBS="$withval $LIBS"
+@@ -2491,6 +2491,8 @@ LIBS="$withval $LIBS"
  
  PKG_PROG_PKG_CONFIG
  
@@ -59,7 +61,7 @@ index 63e6918..5d4232f 100644
  AC_MSG_CHECKING(for --with-system-expat)
  AC_ARG_WITH(system_expat,
 diff --git a/setup.py b/setup.py
-index 64001e2..3b51c0a 100644
+index 812d53d560..d426dd02ea 100644
 --- a/setup.py
 +++ b/setup.py
 @@ -33,7 +33,10 @@ host_platform = get_platform()
@@ -75,5 +77,5 @@ index 64001e2..3b51c0a 100644
  def add_dir_to_list(dirlist, dir):
      """Add the directory 'dir' to the list 'dirlist' (at the front) if
 -- 
-2.7.4
+2.11.0
 
diff --git a/package/python/0009-Fix-python-config-for-cross-builds.patch b/package/python/0009-Fix-python-config-for-cross-builds.patch
index 761d6d9294..3cf8797c03 100644
--- a/package/python/0009-Fix-python-config-for-cross-builds.patch
+++ b/package/python/0009-Fix-python-config-for-cross-builds.patch
@@ -1,4 +1,4 @@
-From e5b0d225f4343e82791cb80e4e0c01a9b49eeff4 Mon Sep 17 00:00:00 2001
+From 1522c6c00ee88eb1148d3b2021d32d819b416375 Mon Sep 17 00:00:00 2001
 From: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Date: Tue, 7 Mar 2017 22:23:14 +0100
 Subject: [PATCH] Fix python-config for cross-builds
@@ -14,6 +14,8 @@ data/results.
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 [Bernd: rebased for Python 2.7.15]
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[Peter: update for 2.7.16]
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 ---
  Makefile.pre.in          |  13 +++---
  Misc/python-config.sh.in | 102 +++++++++++++++++++++++++++++++++++++++++++++++
@@ -22,10 +24,10 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
  create mode 100644 Misc/python-config.sh.in
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 33b994d..beb0837 100644
+index c1c98ecc5a..727a92af42 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -171,7 +171,7 @@ SRCDIRS= 	@SRCDIRS@
+@@ -170,7 +170,7 @@ SRCDIRS= 	@SRCDIRS@
  SUBDIRSTOO=	Include Lib Misc Demo
  
  # Files and directories to be distributed
@@ -34,16 +36,16 @@ index 33b994d..beb0837 100644
  DISTFILES=	README ChangeLog $(CONFIGFILES)
  DISTDIRS=	$(SUBDIRS) $(SUBDIRSTOO) Ext-dummy
  DIST=		$(DISTFILES) $(DISTDIRS)
-@@ -431,7 +431,7 @@ LIBRARY_OBJS=	\
+@@ -403,7 +403,7 @@ LIBRARY_OBJS=	\
  
  # Default target
  all:		@DEF_MAKE_ALL_RULE@
 -build_all:	check-clean-src $(BUILDPYTHON) oldsharedmods sharedmods gdbhooks
 +build_all:	check-clean-src $(BUILDPYTHON) oldsharedmods sharedmods gdbhooks python-config
  
- # Compile a binary with profile guided optimization.
- profile-opt:
-@@ -1179,10 +1179,12 @@ $(srcdir)/Lib/$(PLATDIR):
+ # Check that the source is clean when building out of source.
+ check-clean-src:
+@@ -1190,10 +1190,12 @@ $(srcdir)/Lib/$(PLATDIR):
  	fi; \
  	cd $(srcdir)/Lib/$(PLATDIR); $(RUNSHARED) ./regen
  
@@ -58,7 +60,7 @@ index 33b994d..beb0837 100644
  
  # Install the include files
  INCLDIRSTOMAKE=$(INCLUDEDIR) $(CONFINCLUDEDIR) $(INCLUDEPY) $(CONFINCLUDEPY)
-@@ -1241,7 +1243,7 @@ libainstall:	all python-config
+@@ -1252,7 +1254,7 @@ libainstall:	@DEF_MAKE_RULE@ python-config
  	$(INSTALL_SCRIPT) $(srcdir)/Modules/makesetup $(DESTDIR)$(LIBPL)/makesetup
  	$(INSTALL_SCRIPT) $(srcdir)/install-sh $(DESTDIR)$(LIBPL)/install-sh
  	$(INSTALL_SCRIPT) python-config $(DESTDIR)$(BINDIR)/python$(VERSION)-config
@@ -67,7 +69,7 @@ index 33b994d..beb0837 100644
  	@if [ -s Modules/python.exp -a \
  		"`echo $(MACHDEP) | sed 's/^\(...\).*/\1/'`" = "aix" ]; then \
  		echo; echo "Installing support files for building shared extension modules on AIX:"; \
-@@ -1426,6 +1428,7 @@ clobber: clean profile-removal
+@@ -1434,6 +1436,7 @@ clobber: clean profile-removal
  		config.cache config.log pyconfig.h Modules/config.c
  	-rm -rf build platform
  	-rm -rf $(PYTHONFRAMEWORKDIR)
@@ -77,7 +79,7 @@ index 33b994d..beb0837 100644
  # remove all generated files, even Makefile[.pre]
 diff --git a/Misc/python-config.sh.in b/Misc/python-config.sh.in
 new file mode 100644
-index 0000000..10db4c1
+index 0000000000..10db4c12eb
 --- /dev/null
 +++ b/Misc/python-config.sh.in
 @@ -0,0 +1,102 @@
@@ -184,10 +186,10 @@ index 0000000..10db4c1
 +esac
 +done
 diff --git a/configure.ac b/configure.ac
-index 5d4232f..183a903 100644
+index 13f90b3ddd..3f28ef1371 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -905,6 +905,7 @@ fi
+@@ -919,6 +919,7 @@ fi
  
  # Other platforms follow
  if test $enable_shared = "yes"; then
@@ -195,7 +197,7 @@ index 5d4232f..183a903 100644
    AC_DEFINE(Py_ENABLE_SHARED, 1, [Defined if Python is built as a shared library.])
    case $ac_sys_system in
      BeOS*)
-@@ -965,6 +966,7 @@ if test $enable_shared = "yes"; then
+@@ -979,6 +980,7 @@ if test $enable_shared = "yes"; then
  
    esac
  else # shared is disabled
@@ -203,7 +205,7 @@ index 5d4232f..183a903 100644
    case $ac_sys_system in
      CYGWIN*)
            BLDLIBRARY='$(LIBRARY)'
-@@ -2096,6 +2098,9 @@ AC_SUBST(LDCXXSHARED)
+@@ -2128,6 +2130,9 @@ AC_SUBST(LDCXXSHARED)
  AC_SUBST(BLDSHARED)
  AC_SUBST(CCSHARED)
  AC_SUBST(LINKFORSHARED)
@@ -213,7 +215,7 @@ index 5d4232f..183a903 100644
  # SO is the extension of shared libraries `(including the dot!)
  # -- usually .so, .sl on HP-UX, .dll on Cygwin
  AC_MSG_CHECKING(SO)
-@@ -4818,7 +4823,7 @@ AC_MSG_RESULT($ENSUREPIP)
+@@ -4944,7 +4949,7 @@ AC_MSG_RESULT($ENSUREPIP)
  AC_SUBST(ENSUREPIP)
  
  # generate output files
@@ -223,5 +225,5 @@ index 5d4232f..183a903 100644
  AC_OUTPUT
  
 -- 
-2.7.4
+2.11.0
 
diff --git a/package/python/0010-Remove-the-python-symlink-install-rules.patch b/package/python/0010-Remove-the-python-symlink-install-rules.patch
index 864ccbfb7d..4a2116b1b0 100644
--- a/package/python/0010-Remove-the-python-symlink-install-rules.patch
+++ b/package/python/0010-Remove-the-python-symlink-install-rules.patch
@@ -1,4 +1,4 @@
-From bddfcbb8a4c011ca2fe471f7a4124cd64b5b0f00 Mon Sep 17 00:00:00 2001
+From 706d62599fb3c3cb9b9941364aaf4a1ef4ebd276 Mon Sep 17 00:00:00 2001
 From: Samuel Martin <s.martin49@gmail.com>
 Date: Tue, 7 Mar 2017 22:23:58 +0100
 Subject: [PATCH] Remove the python symlink install rules
@@ -10,15 +10,17 @@ or python3) the python symlink points to.
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 [Bernd: rebased against version 2.7.12.]
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[Peter: update for 2.7.16]
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 ---
  Makefile.pre.in | 7 -------
  1 file changed, 7 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index beb0837..dedcf61 100644
+index 727a92af42..37b2ff3a5f 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -968,17 +968,10 @@ bininstall:	altbininstall
+@@ -978,17 +978,10 @@ bininstall:	altbininstall
  		echo "Creating directory $(LIBPC)"; \
  		$(INSTALL) -d -m $(DIRMODE) $(DESTDIR)$(LIBPC); \
  	fi
@@ -37,5 +39,5 @@ index beb0837..dedcf61 100644
  	-rm -f $(DESTDIR)$(LIBPC)/python2.pc
  	(cd $(DESTDIR)$(LIBPC); $(LN) -s python-$(VERSION).pc python2.pc)
 -- 
-2.7.4
+2.11.0
 
diff --git a/package/python/0016-Add-an-option-to-disable-installation-of-test-module.patch b/package/python/0016-Add-an-option-to-disable-installation-of-test-module.patch
index 2e1a054f3b..600fc40b69 100644
--- a/package/python/0016-Add-an-option-to-disable-installation-of-test-module.patch
+++ b/package/python/0016-Add-an-option-to-disable-installation-of-test-module.patch
@@ -1,4 +1,4 @@
-From 0eac7789c0dd4aebe9e69d3c73d0c95e96922ea3 Mon Sep 17 00:00:00 2001
+From 2c1810fb002128a6d33cc3a391a157e316479d15 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Tue, 7 Mar 2017 22:27:16 +0100
 Subject: [PATCH] Add an option to disable installation of test modules
@@ -10,16 +10,18 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 [Bernd: rebased against version 2.7.14]
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[Peter: update for 2.7.16]
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 ---
- Makefile.pre.in | 48 ++++++++++++++++++++++++++++++++----------------
+ Makefile.pre.in | 50 +++++++++++++++++++++++++++++++++-----------------
  configure.ac    |  6 ++++++
- 2 files changed, 38 insertions(+), 16 deletions(-)
+ 2 files changed, 39 insertions(+), 17 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index dedcf61..280cc4e 100644
+index 37b2ff3a5f..2a5e8adc61 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1032,28 +1032,44 @@
+@@ -1048,28 +1048,44 @@ PLATMACDIRS= plat-mac plat-mac/Carbon plat-mac/lib-scriptpackages \
  	plat-mac/lib-scriptpackages/SystemEvents \
  	plat-mac/lib-scriptpackages/Terminal
  PLATMACPATH=:plat-mac:plat-mac/lib-scriptpackages
@@ -82,10 +84,10 @@ index dedcf61..280cc4e 100644
  	@for i in $(SCRIPTDIR) $(LIBDEST); \
  	do \
 diff --git a/configure.ac b/configure.ac
-index 183a903..a1a35f6 100644
+index 3f28ef1371..f257a25620 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2806,6 +2806,12 @@ if test "$posix_threads" = "yes"; then
+@@ -2835,6 +2835,12 @@ if test "$posix_threads" = "yes"; then
  fi
  
  
@@ -99,5 +101,5 @@ index 183a903..a1a35f6 100644
  AH_TEMPLATE(ENABLE_IPV6, [Define if --enable-ipv6 is specified])
  AC_MSG_CHECKING([if --enable-ipv6 is specified])
 -- 
-2.7.4
+2.11.0
 
diff --git a/package/python/0017-Add-an-option-to-disable-pydoc.patch b/package/python/0017-Add-an-option-to-disable-pydoc.patch
index 18582f189e..48c1b570df 100644
--- a/package/python/0017-Add-an-option-to-disable-pydoc.patch
+++ b/package/python/0017-Add-an-option-to-disable-pydoc.patch
@@ -1,4 +1,4 @@
-From 52463745b6c46a46a6f2e2bc17983bb3f7bdac6e Mon Sep 17 00:00:00 2001
+From f98c3f981643411449aba6f93178b2ca14f9a68c Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Tue, 7 Mar 2017 22:27:34 +0100
 Subject: [PATCH] Add an option to disable pydoc
@@ -8,6 +8,8 @@ itself.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+[Peter: update for 2.7.16]
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 ---
  Makefile.pre.in |  6 +++++-
  configure.ac    |  5 +++++
@@ -15,10 +17,10 @@ Signed-off-by: Samuel Martin <s.martin49@gmail.com>
  3 files changed, 17 insertions(+), 4 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 280cc4e..84d5fc6 100644
+index 2a5e8adc61..d3ba1aeb4e 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1052,7 +1052,7 @@ LIBSUBDIRS=	lib-tk site-packages \
+@@ -1062,7 +1062,7 @@ LIBSUBDIRS=	lib-tk site-packages \
  		multiprocessing multiprocessing/dummy \
  		unittest \
  		lib-old \
@@ -27,7 +29,7 @@ index 280cc4e..84d5fc6 100644
  
  TESTSUBDIRS = lib-tk/test lib-tk/test/test_tkinter \
  	lib-tk/test/test_ttk test test/audiodata test/capath test/data \
-@@ -1075,6 +1075,10 @@ ifeq (@TEST_MODULES@,yes)
+@@ -1086,6 +1086,10 @@ ifeq (@TEST_MODULES@,yes)
  LIBSUBDIRS += $(TESTSUBDIRS)
  endif
  
@@ -39,10 +41,10 @@ index 280cc4e..84d5fc6 100644
  	@for i in $(SCRIPTDIR) $(LIBDEST); \
  	do \
 diff --git a/configure.ac b/configure.ac
-index a1a35f6..8bab160 100644
+index f257a25620..2ed4119478 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2805,6 +2805,11 @@ if test "$posix_threads" = "yes"; then
+@@ -2834,6 +2834,11 @@ if test "$posix_threads" = "yes"; then
        AC_CHECK_FUNCS(pthread_atfork)
  fi
  
@@ -55,10 +57,10 @@ index a1a35f6..8bab160 100644
  AC_SUBST(TEST_MODULES)
  
 diff --git a/setup.py b/setup.py
-index 9a5c2b8..69771e2 100644
+index 2ef5b07189..49f810f72e 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -2233,6 +2233,12 @@ def main():
+@@ -2277,6 +2277,12 @@ def main():
      # turn off warnings when deprecated modules are imported
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
@@ -71,7 +73,7 @@ index 9a5c2b8..69771e2 100644
      setup(# PyPI Metadata (PEP 301)
            name = "Python",
            version = sys.version.split()[0],
-@@ -2253,9 +2259,7 @@ def main():
+@@ -2297,9 +2303,7 @@ def main():
            ext_modules=[Extension('_struct', ['_struct.c'])],
  
            # Scripts to install
@@ -83,5 +85,5 @@ index 9a5c2b8..69771e2 100644
  
  # --install-platlib
 -- 
-2.7.4
+2.11.0
 
diff --git a/package/python/0018-Add-an-option-to-disable-lib2to3.patch b/package/python/0018-Add-an-option-to-disable-lib2to3.patch
index 765b05d979..2c539fac35 100644
--- a/package/python/0018-Add-an-option-to-disable-lib2to3.patch
+++ b/package/python/0018-Add-an-option-to-disable-lib2to3.patch
@@ -1,4 +1,4 @@
-From d0cf9ebed6d34d820cf594578cf513797fb52772 Mon Sep 17 00:00:00 2001
+From d7f419246681e12f05e2eefc79286959c6aa18ab Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Tue, 7 Mar 2017 22:27:49 +0100
 Subject: [PATCH] Add an option to disable lib2to3
@@ -8,6 +8,8 @@ such, it is probably not very useful on embedded system targets.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+[Peter: update for 2.7.16]
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 ---
  Makefile.pre.in | 11 ++++++++---
  configure.ac    |  6 ++++++
@@ -15,10 +17,10 @@ Signed-off-by: Samuel Martin <s.martin49@gmail.com>
  3 files changed, 17 insertions(+), 5 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 84d5fc6..b2a0490 100644
+index d3ba1aeb4e..0e15b6d6f4 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1045,7 +1045,6 @@ LIBSUBDIRS=	lib-tk site-packages \
+@@ -1055,7 +1055,6 @@ LIBSUBDIRS=	lib-tk site-packages \
  		json \
  		sqlite3  \
  		logging bsddb csv importlib wsgiref \
@@ -26,7 +28,7 @@ index 84d5fc6..b2a0490 100644
  		ctypes ctypes/macholib \
  		idlelib idlelib/Icons \
  		distutils distutils/command $(XMLLIBSUBDIRS) \
-@@ -1064,8 +1063,6 @@ TESTSUBDIRS = lib-tk/test lib-tk/test/test_tkinter \
+@@ -1075,8 +1074,6 @@ TESTSUBDIRS = lib-tk/test lib-tk/test/test_tkinter \
  	json/tests \
  	sqlite3/test \
  	bsddb/test \
@@ -35,7 +37,7 @@ index 84d5fc6..b2a0490 100644
  	ctypes/test \
  	idlelib/idle_test \
  	distutils/tests \
-@@ -1079,6 +1076,14 @@ ifeq (@PYDOC@,yes)
+@@ -1090,6 +1087,14 @@ ifeq (@PYDOC@,yes)
  LIBSUBDIRS += pydoc_data
  endif
  
@@ -51,10 +53,10 @@ index 84d5fc6..b2a0490 100644
  	@for i in $(SCRIPTDIR) $(LIBDEST); \
  	do \
 diff --git a/configure.ac b/configure.ac
-index 8bab160..270f337 100644
+index 2ed4119478..a2810ab8ed 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2817,6 +2817,12 @@ AC_ARG_ENABLE(test-modules,
+@@ -2846,6 +2846,12 @@ AC_ARG_ENABLE(test-modules,
  	AS_HELP_STRING([--disable-test-modules], [disable test modules]),
  	[ TEST_MODULES="${enableval}" ], [ TEST_MODULES=yes ])
  
@@ -68,10 +70,10 @@ index 8bab160..270f337 100644
  AH_TEMPLATE(ENABLE_IPV6, [Define if --enable-ipv6 is specified])
  AC_MSG_CHECKING([if --enable-ipv6 is specified])
 diff --git a/setup.py b/setup.py
-index 69771e2..f51ef8c 100644
+index 49f810f72e..9130819454 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -2234,10 +2234,11 @@ def main():
+@@ -2278,10 +2278,11 @@ def main():
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
  
@@ -86,5 +88,5 @@ index 69771e2..f51ef8c 100644
      setup(# PyPI Metadata (PEP 301)
            name = "Python",
 -- 
-2.7.4
+2.11.0
 
diff --git a/package/python/0019-Add-option-to-disable-the-sqlite3-module.patch b/package/python/0019-Add-option-to-disable-the-sqlite3-module.patch
index bffe3faaba..433bb2973e 100644
--- a/package/python/0019-Add-option-to-disable-the-sqlite3-module.patch
+++ b/package/python/0019-Add-option-to-disable-the-sqlite3-module.patch
@@ -1,20 +1,22 @@
-From 570e1e81484d9bcbd30a7719b07d02785a5cab24 Mon Sep 17 00:00:00 2001
+From 123ecc50932e3ad3f7a2d90d430b74822c9695d4 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Tue, 7 Mar 2017 22:28:06 +0100
 Subject: [PATCH] Add option to disable the sqlite3 module
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+[Peter: update for 2.7.16]
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 ---
  Makefile.pre.in | 7 +++++--
  configure.ac    | 9 +++++++++
  2 files changed, 14 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index b2a0490..974a052 100644
+index 0e15b6d6f4..a2e5ac6d41 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1043,7 +1043,6 @@ LIBSUBDIRS=	lib-tk site-packages \
+@@ -1053,7 +1053,6 @@ LIBSUBDIRS=	lib-tk site-packages \
  		email email/mime \
  		ensurepip ensurepip/_bundled \
  		json \
@@ -22,7 +24,7 @@ index b2a0490..974a052 100644
  		logging bsddb csv importlib wsgiref \
  		ctypes ctypes/macholib \
  		idlelib idlelib/Icons \
-@@ -1061,7 +1060,6 @@ TESTSUBDIRS = lib-tk/test lib-tk/test/test_tkinter \
+@@ -1072,7 +1071,6 @@ TESTSUBDIRS = lib-tk/test lib-tk/test/test_tkinter \
  	test/tracedmodules \
  	email/test email/test/data \
  	json/tests \
@@ -30,7 +32,7 @@ index b2a0490..974a052 100644
  	bsddb/test \
  	ctypes/test \
  	idlelib/idle_test \
-@@ -1084,6 +1082,11 @@ TESTSUBDIRS += 	lib2to3/tests				\
+@@ -1095,6 +1093,11 @@ TESTSUBDIRS += 	lib2to3/tests				\
  		lib2to3/tests/data/fixers/myfixes
  endif
  
@@ -43,10 +45,10 @@ index b2a0490..974a052 100644
  	@for i in $(SCRIPTDIR) $(LIBDEST); \
  	do \
 diff --git a/configure.ac b/configure.ac
-index 270f337..e9e1897 100644
+index a2810ab8ed..4ee3c60501 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2805,6 +2805,15 @@ if test "$posix_threads" = "yes"; then
+@@ -2834,6 +2834,15 @@ if test "$posix_threads" = "yes"; then
        AC_CHECK_FUNCS(pthread_atfork)
  fi
  
@@ -63,5 +65,5 @@ index 270f337..e9e1897 100644
  
  AC_ARG_ENABLE(pydoc,
 -- 
-2.7.4
+2.11.0
 
diff --git a/package/python/0020-Add-an-option-to-disable-the-tk-module.patch b/package/python/0020-Add-an-option-to-disable-the-tk-module.patch
index 82df405e45..26ae1799f8 100644
--- a/package/python/0020-Add-an-option-to-disable-the-tk-module.patch
+++ b/package/python/0020-Add-an-option-to-disable-the-tk-module.patch
@@ -1,20 +1,22 @@
-From 05fbe2527b6f87edeef11f288c36bcbaa378ca02 Mon Sep 17 00:00:00 2001
+From f0dc1198360c6875ed846a961e85dc41e239aa29 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Tue, 7 Mar 2017 22:28:57 +0100
 Subject: [PATCH] Add an option to disable the tk module
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+[Peter: update for 2.7.16]
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 ---
  Makefile.pre.in | 11 ++++++++---
  configure.ac    |  9 +++++++++
  2 files changed, 17 insertions(+), 3 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 974a052..f7f025f 100644
+index a2e5ac6d41..37ed70ab1d 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1038,7 +1038,7 @@ PLATMACDIRS= plat-mac plat-mac/Carbon plat-mac/lib-scriptpackages \
+@@ -1048,7 +1048,7 @@ PLATMACDIRS= plat-mac plat-mac/Carbon plat-mac/lib-scriptpackages \
  	plat-mac/lib-scriptpackages/SystemEvents \
  	plat-mac/lib-scriptpackages/Terminal
  PLATMACPATH=:plat-mac:plat-mac/lib-scriptpackages
@@ -23,7 +25,7 @@ index 974a052..f7f025f 100644
  		encodings compiler hotshot \
  		email email/mime \
  		ensurepip ensurepip/_bundled \
-@@ -1052,8 +1052,7 @@ LIBSUBDIRS=	lib-tk site-packages \
+@@ -1062,8 +1062,7 @@ LIBSUBDIRS=	lib-tk site-packages \
  		lib-old \
  		curses $(MACHDEPS)
  
@@ -33,7 +35,7 @@ index 974a052..f7f025f 100644
  	test/cjkencodings test/decimaltestdata test/xmltestdata \
  	test/imghdrdata \
  	test/subprocessdata \
-@@ -1087,6 +1086,12 @@ LIBSUBDIRS += sqlite3
+@@ -1098,6 +1097,12 @@ LIBSUBDIRS += sqlite3
  TESTSUBDIRS += sqlite3/test
  endif
  
@@ -47,10 +49,10 @@ index 974a052..f7f025f 100644
  	@for i in $(SCRIPTDIR) $(LIBDEST); \
  	do \
 diff --git a/configure.ac b/configure.ac
-index e9e1897..d0f032c 100644
+index 4ee3c60501..2c20f826c5 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2814,6 +2814,15 @@ if test "$SQLITE3" = "no" ; then
+@@ -2843,6 +2843,15 @@ if test "$SQLITE3" = "no" ; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
  fi
  
@@ -67,5 +69,5 @@ index e9e1897..d0f032c 100644
  
  AC_ARG_ENABLE(pydoc,
 -- 
-2.7.4
+2.11.0
 
diff --git a/package/python/0021-Add-an-option-to-disable-the-curses-module.patch b/package/python/0021-Add-an-option-to-disable-the-curses-module.patch
index c36942ad6b..3b1ab7fb4c 100644
--- a/package/python/0021-Add-an-option-to-disable-the-curses-module.patch
+++ b/package/python/0021-Add-an-option-to-disable-the-curses-module.patch
@@ -1,20 +1,22 @@
-From dba12f15baad06cc7e17a275201cc022bb6c84f7 Mon Sep 17 00:00:00 2001
+From 3e51eef24c51b986c37b354f3de98218eb76909c Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Tue, 7 Mar 2017 22:29:06 +0100
 Subject: [PATCH] Add an option to disable the curses module
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+[Peter: update for 2.7.16]
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 ---
  Makefile.pre.in | 6 +++++-
  configure.ac    | 9 +++++++++
  2 files changed, 14 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index f7f025f..bd537d9 100644
+index 37ed70ab1d..458f4ad55b 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1050,7 +1050,7 @@ LIBSUBDIRS=	site-packages \
+@@ -1060,7 +1060,7 @@ LIBSUBDIRS=	site-packages \
  		multiprocessing multiprocessing/dummy \
  		unittest \
  		lib-old \
@@ -23,7 +25,7 @@ index f7f025f..bd537d9 100644
  
  TESTSUBDIRS = test test/audiodata test/capath test/data \
  	test/cjkencodings test/decimaltestdata test/xmltestdata \
-@@ -1092,6 +1092,10 @@ TESTSUBDIRS += lib-tk/test lib-tk/test/test_tkinter	\
+@@ -1103,6 +1103,10 @@ TESTSUBDIRS += lib-tk/test lib-tk/test/test_tkinter	\
  	      lib-tk/test/test_ttk
  endif
  
@@ -35,10 +37,10 @@ index f7f025f..bd537d9 100644
  	@for i in $(SCRIPTDIR) $(LIBDEST); \
  	do \
 diff --git a/configure.ac b/configure.ac
-index d0f032c..ab081bc 100644
+index 2c20f826c5..a7ebcd091e 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2823,6 +2823,15 @@ if test "$TK" = "no"; then
+@@ -2852,6 +2852,15 @@ if test "$TK" = "no"; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _tkinter"
  fi
  
@@ -55,5 +57,5 @@ index d0f032c..ab081bc 100644
  
  AC_ARG_ENABLE(pydoc,
 -- 
-2.7.4
+2.11.0
 
diff --git a/package/python/0022-Add-an-option-to-disable-expat.patch b/package/python/0022-Add-an-option-to-disable-expat.patch
index 8253f112fe..2ebe7eabda 100644
--- a/package/python/0022-Add-an-option-to-disable-expat.patch
+++ b/package/python/0022-Add-an-option-to-disable-expat.patch
@@ -1,4 +1,4 @@
-From 5f0f30bf342cd2b13f98513c39fd8f17351b1a2f Mon Sep 17 00:00:00 2001
+From 548413a659cc5320560d6b794fe8edd06dd1d22e Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Tue, 7 Mar 2017 22:29:20 +0100
 Subject: [PATCH] Add an option to disable expat
@@ -11,6 +11,8 @@ installation of XML modules).
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+[Peter: update for 2.7.16]
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 ---
  Makefile.pre.in |  6 +++++-
  configure.ac    | 18 +++++++++++++-----
@@ -18,10 +20,10 @@ Signed-off-by: Samuel Martin <s.martin49@gmail.com>
  3 files changed, 19 insertions(+), 7 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index bd537d9..e5d0dd7 100644
+index 458f4ad55b..8dee345539 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1046,7 +1046,7 @@ LIBSUBDIRS=	site-packages \
+@@ -1056,7 +1056,7 @@ LIBSUBDIRS=	site-packages \
  		logging bsddb csv importlib wsgiref \
  		ctypes ctypes/macholib \
  		idlelib idlelib/Icons \
@@ -30,7 +32,7 @@ index bd537d9..e5d0dd7 100644
  		multiprocessing multiprocessing/dummy \
  		unittest \
  		lib-old \
-@@ -1096,6 +1096,10 @@ ifeq (@CURSES@,yes)
+@@ -1107,6 +1107,10 @@ ifeq (@CURSES@,yes)
  LIBSUBDIRS += curses
  endif
  
@@ -42,10 +44,10 @@ index bd537d9..e5d0dd7 100644
  	@for i in $(SCRIPTDIR) $(LIBDEST); \
  	do \
 diff --git a/configure.ac b/configure.ac
-index ab081bc..63ee545 100644
+index a7ebcd091e..2f5759a890 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2470,13 +2470,21 @@ PKG_PROG_PKG_CONFIG
+@@ -2499,13 +2499,21 @@ PKG_PROG_PKG_CONFIG
  AC_SUBST(DISABLED_EXTENSIONS)
  
  # Check for use of the system expat library
@@ -73,10 +75,10 @@ index ab081bc..63ee545 100644
  # Check for use of the system libffi library
  AC_MSG_CHECKING(for --with-system-ffi)
 diff --git a/setup.py b/setup.py
-index f51ef8c..c68f6b4 100644
+index 9130819454..f439cbadc2 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -1483,7 +1483,7 @@ class PyBuildExt(build_ext):
+@@ -1475,7 +1475,7 @@ class PyBuildExt(build_ext):
          #
          # More information on Expat can be found at www.libexpat.org.
          #
@@ -86,5 +88,5 @@ index f51ef8c..c68f6b4 100644
              define_macros = []
              expat_lib = ['expat']
 -- 
-2.7.4
+2.11.0
 
diff --git a/package/python/0023-Add-an-option-to-disable-CJK-codecs.patch b/package/python/0023-Add-an-option-to-disable-CJK-codecs.patch
index e2c2d98b30..3ee77fec36 100644
--- a/package/python/0023-Add-an-option-to-disable-CJK-codecs.patch
+++ b/package/python/0023-Add-an-option-to-disable-CJK-codecs.patch
@@ -1,18 +1,20 @@
-From cb848dae763a3f57e31d734d3be6889f660fa0d0 Mon Sep 17 00:00:00 2001
+From 6761066addfb6028e183d7fe4322b283af18117f Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Tue, 7 Mar 2017 22:29:31 +0100
 Subject: [PATCH] Add an option to disable CJK codecs
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[Peter: update for 2.7.16]
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 ---
  configure.ac | 6 ++++++
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 63ee545..6a854ab 100644
+index 2f5759a890..862c8ae516 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2822,6 +2822,12 @@ if test "$SQLITE3" = "no" ; then
+@@ -2851,6 +2851,12 @@ if test "$SQLITE3" = "no" ; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
  fi
  
@@ -26,5 +28,5 @@ index 63ee545..6a854ab 100644
  AC_ARG_ENABLE(tk,
  	AS_HELP_STRING([--disable-tk], [disable tk]),
 -- 
-2.7.4
+2.11.0
 
diff --git a/package/python/0024-Add-an-option-to-disable-NIS.patch b/package/python/0024-Add-an-option-to-disable-NIS.patch
index 877dfd965c..bad4ba68dc 100644
--- a/package/python/0024-Add-an-option-to-disable-NIS.patch
+++ b/package/python/0024-Add-an-option-to-disable-NIS.patch
@@ -1,4 +1,4 @@
-From 133776d396b8eaf0243484dc990a53576de9685f Mon Sep 17 00:00:00 2001
+From ecd8e926bd364d866f492df87d7c46d029445480 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Tue, 7 Mar 2017 22:29:41 +0100
 Subject: [PATCH] Add an option to disable NIS
@@ -7,15 +7,17 @@ NIS is not necessarily available in uClibc, so we need an option to
 not compile support for it.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[Peter: update for 2.7.16]
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 ---
  configure.ac | 6 ++++++
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 6a854ab..4c2cbc1 100644
+index 862c8ae516..354212fb16 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2828,6 +2828,12 @@ AC_ARG_ENABLE(codecs-cjk,
+@@ -2857,6 +2857,12 @@ AC_ARG_ENABLE(codecs-cjk,
      	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _codecs_kr _codecs_jp _codecs_cn _codecs_tw _codecs_hk"
    	  fi])
  
@@ -29,5 +31,5 @@ index 6a854ab..4c2cbc1 100644
  AC_ARG_ENABLE(tk,
  	AS_HELP_STRING([--disable-tk], [disable tk]),
 -- 
-2.7.4
+2.11.0
 
diff --git a/package/python/0025-Add-an-option-to-disable-unicodedata.patch b/package/python/0025-Add-an-option-to-disable-unicodedata.patch
index a1255e5684..687ea5027e 100644
--- a/package/python/0025-Add-an-option-to-disable-unicodedata.patch
+++ b/package/python/0025-Add-an-option-to-disable-unicodedata.patch
@@ -1,18 +1,20 @@
-From aa78e3684c0e8f7a5e910e838f9eca2631262048 Mon Sep 17 00:00:00 2001
+From dc99b7a0331fe75d70ccb87dc0877ac5bbba51ca Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Tue, 7 Mar 2017 22:29:52 +0100
 Subject: [PATCH] Add an option to disable unicodedata
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[Peter: update for 2.7.16]
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 ---
  configure.ac | 6 ++++++
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 4c2cbc1..09cb3de 100644
+index 354212fb16..4e430d82b8 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2834,6 +2834,12 @@ AC_ARG_ENABLE(nis,
+@@ -2863,6 +2863,12 @@ AC_ARG_ENABLE(nis,
      	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} nis"
    	  fi])
  
@@ -26,5 +28,5 @@ index 4c2cbc1..09cb3de 100644
  AC_ARG_ENABLE(tk,
  	AS_HELP_STRING([--disable-tk], [disable tk]),
 -- 
-2.7.4
+2.11.0
 
diff --git a/package/python/0026-Add-an-option-to-disable-bsddb.patch b/package/python/0026-Add-an-option-to-disable-bsddb.patch
index e3ccd44986..f216e8bb57 100644
--- a/package/python/0026-Add-an-option-to-disable-bsddb.patch
+++ b/package/python/0026-Add-an-option-to-disable-bsddb.patch
@@ -1,4 +1,4 @@
-From cfad2bcae8f572a9422ce5a6adb4caa7c0e521ad Mon Sep 17 00:00:00 2001
+From a4bbbf0c5f1f68298d5f4e2c2cd80de7e758763c Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Tue, 7 Mar 2017 22:30:06 +0100
 Subject: [PATCH] Add an option to disable bsddb
@@ -9,16 +9,18 @@ the build/installation of this Python module.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+[Peter: update for 2.7.16]
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 ---
  Makefile.pre.in |  8 ++++++--
  configure.ac    | 22 ++++++++++++++++++++++
  2 files changed, 28 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index e5d0dd7..2582574 100644
+index 8dee345539..a0473096c1 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1043,7 +1043,7 @@ LIBSUBDIRS=	site-packages \
+@@ -1053,7 +1053,7 @@ LIBSUBDIRS=	site-packages \
  		email email/mime \
  		ensurepip ensurepip/_bundled \
  		json \
@@ -27,7 +29,7 @@ index e5d0dd7..2582574 100644
  		ctypes ctypes/macholib \
  		idlelib idlelib/Icons \
  		distutils distutils/command \
-@@ -1059,7 +1059,6 @@ TESTSUBDIRS = test test/audiodata test/capath test/data \
+@@ -1070,7 +1070,6 @@ TESTSUBDIRS = test test/audiodata test/capath test/data \
  	test/tracedmodules \
  	email/test email/test/data \
  	json/tests \
@@ -35,7 +37,7 @@ index e5d0dd7..2582574 100644
  	ctypes/test \
  	idlelib/idle_test \
  	distutils/tests \
-@@ -1100,6 +1099,11 @@ ifeq (@EXPAT@,yes)
+@@ -1111,6 +1110,11 @@ ifeq (@EXPAT@,yes)
  LIBSUBDIRS += $(XMLLIBSUBDIRS)
  endif
  
@@ -48,10 +50,10 @@ index e5d0dd7..2582574 100644
  	@for i in $(SCRIPTDIR) $(LIBDEST); \
  	do \
 diff --git a/configure.ac b/configure.ac
-index 09cb3de..524614c 100644
+index 4e430d82b8..361e8c120e 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2834,6 +2834,28 @@ AC_ARG_ENABLE(nis,
+@@ -2863,6 +2863,28 @@ AC_ARG_ENABLE(nis,
      	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} nis"
    	  fi])
  
@@ -81,5 +83,5 @@ index 09cb3de..524614c 100644
  	AS_HELP_STRING([--disable-unicodedata], [disable unicodedata]),
  	[ if test "$enableval" = "no"; then
 -- 
-2.7.4
+2.11.0
 
diff --git a/package/python/0027-Add-an-option-to-disable-the-ssl-module.patch b/package/python/0027-Add-an-option-to-disable-the-ssl-module.patch
index 5f2fb87b12..d62408e4e9 100644
--- a/package/python/0027-Add-an-option-to-disable-the-ssl-module.patch
+++ b/package/python/0027-Add-an-option-to-disable-the-ssl-module.patch
@@ -1,18 +1,20 @@
-From fc16ab40e3e6a5b4deed2fa7c5475fa216ff8d17 Mon Sep 17 00:00:00 2001
+From a0e56b96c3bfb04a5c8ecc0987cdd294d8ce116b Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Tue, 7 Mar 2017 22:30:22 +0100
 Subject: [PATCH] Add an option to disable the ssl module
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[Peter: update for 2.7.16]
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 ---
  configure.ac | 6 ++++++
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 524614c..cadac82 100644
+index 361e8c120e..8fe47d8c37 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2834,6 +2834,12 @@ AC_ARG_ENABLE(nis,
+@@ -2863,6 +2863,12 @@ AC_ARG_ENABLE(nis,
      	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} nis"
    	  fi])
  
@@ -26,5 +28,5 @@ index 524614c..cadac82 100644
  	AS_HELP_STRING([--disable-dbm], [disable DBM]),
  	[ if test "$enableval" = "no"; then
 -- 
-2.7.4
+2.11.0
 
diff --git a/package/python/0028-Add-an-option-to-disable-the-bz2-module.patch b/package/python/0028-Add-an-option-to-disable-the-bz2-module.patch
index da914b4783..5b89e8ef87 100644
--- a/package/python/0028-Add-an-option-to-disable-the-bz2-module.patch
+++ b/package/python/0028-Add-an-option-to-disable-the-bz2-module.patch
@@ -1,19 +1,21 @@
-From 6b10788fa040442ace100c3a28cbfff29c9db471 Mon Sep 17 00:00:00 2001
+From d1236c6f4d8d893709fa36f751af47b8ad9055c1 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Tue, 7 Mar 2017 22:30:33 +0100
 Subject: [PATCH] Add an option to disable the bz2 module
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[Peter: update for 2.7.16]
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 ---
  configure.ac | 6 ++++++
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 743707a..f1762e9 100644
+index 8fe47d8c37..85df7b1478 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2840,6 +2840,12 @@ AC_ARG_ENABLE(ssl,
-     	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} ssl"
+@@ -2869,6 +2869,12 @@ AC_ARG_ENABLE(ssl,
+     	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _ssl"
    	  fi])
  
 +AC_ARG_ENABLE(bz2,
@@ -26,5 +28,5 @@ index 743707a..f1762e9 100644
  	AS_HELP_STRING([--disable-dbm], [disable DBM]),
  	[ if test "$enableval" = "no"; then
 -- 
-2.7.4
+2.11.0
 
diff --git a/package/python/0029-Add-an-option-to-disable-the-zlib-module.patch b/package/python/0029-Add-an-option-to-disable-the-zlib-module.patch
index b4354e27d2..95da586e46 100644
--- a/package/python/0029-Add-an-option-to-disable-the-zlib-module.patch
+++ b/package/python/0029-Add-an-option-to-disable-the-zlib-module.patch
@@ -1,18 +1,20 @@
-From af2c56aa0a5900272cc2d04ce667d4b38e34b596 Mon Sep 17 00:00:00 2001
+From a9c7314e069036f74b503dfaef261e5f45477b7e Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Tue, 7 Mar 2017 22:30:45 +0100
 Subject: [PATCH] Add an option to disable the zlib module
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[Peter: update for 2.7.16]
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 ---
  configure.ac | 6 ++++++
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index f1762e9..291ba35 100644
+index 85df7b1478..3848b16b9f 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2846,6 +2846,12 @@ AC_ARG_ENABLE(bz2,
+@@ -2875,6 +2875,12 @@ AC_ARG_ENABLE(bz2,
              DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} bz2"
           fi])
  
@@ -26,5 +28,5 @@ index f1762e9..291ba35 100644
  	AS_HELP_STRING([--disable-dbm], [disable DBM]),
  	[ if test "$enableval" = "no"; then
 -- 
-2.7.4
+2.11.0
 
diff --git a/package/python/0030-Do-not-install-the-idle-editor.patch b/package/python/0030-Do-not-install-the-idle-editor.patch
index 60e64c885f..e101e6a12c 100644
--- a/package/python/0030-Do-not-install-the-idle-editor.patch
+++ b/package/python/0030-Do-not-install-the-idle-editor.patch
@@ -1,4 +1,4 @@
-From 4b7c45c756dccfd3b5ece36fe572042353d1c2f0 Mon Sep 17 00:00:00 2001
+From e789487c783f75c17a8951bd5324c86ceefde407 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Tue, 7 Mar 2017 22:30:56 +0100
 Subject: [PATCH] Do not install the idle editor
@@ -10,16 +10,18 @@ idle and the related Python modules. It saves 800 KB-900 KB of
 installed .pyc files.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[Peter: update for 2.7.16]
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 ---
  Makefile.pre.in | 2 --
  setup.py        | 2 +-
  2 files changed, 1 insertion(+), 3 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 2582574..3cfc590 100644
+index a0473096c1..750057fb96 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1045,7 +1045,6 @@ LIBSUBDIRS=	site-packages \
+@@ -1055,7 +1055,6 @@ LIBSUBDIRS=	site-packages \
  		json \
  		logging csv importlib wsgiref \
  		ctypes ctypes/macholib \
@@ -27,7 +29,7 @@ index 2582574..3cfc590 100644
  		distutils distutils/command \
  		multiprocessing multiprocessing/dummy \
  		unittest \
-@@ -1060,7 +1059,6 @@ TESTSUBDIRS = test test/audiodata test/capath test/data \
+@@ -1071,7 +1070,6 @@ TESTSUBDIRS = test test/audiodata test/capath test/data \
  	email/test email/test/data \
  	json/tests \
  	ctypes/test \
@@ -36,10 +38,10 @@ index 2582574..3cfc590 100644
  	unittest/test
  
 diff --git a/setup.py b/setup.py
-index c68f6b4..8045a9b 100644
+index f439cbadc2..227187681e 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -2234,7 +2234,7 @@ def main():
+@@ -2278,7 +2278,7 @@ def main():
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
  
@@ -49,5 +51,5 @@ index c68f6b4..8045a9b 100644
          scripts += [ 'Tools/scripts/pydoc' ]
      if not '--disable-lib2to3' in sysconfig.get_config_var("CONFIG_ARGS"):
 -- 
-2.7.4
+2.11.0
 
diff --git a/package/python/0031-Add-an-option-to-disable-the-ossaudiodev-module.patch b/package/python/0031-Add-an-option-to-disable-the-ossaudiodev-module.patch
index c2aea5ede7..9768faf676 100644
--- a/package/python/0031-Add-an-option-to-disable-the-ossaudiodev-module.patch
+++ b/package/python/0031-Add-an-option-to-disable-the-ossaudiodev-module.patch
@@ -1,18 +1,20 @@
-From 6af0f179d3db956146bbabac8748675e3abc1f78 Mon Sep 17 00:00:00 2001
+From 4ab280b8a7626de2565cf4ef6cf08a5c7326574b Mon Sep 17 00:00:00 2001
 From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
 Date: Tue, 7 Mar 2017 22:31:22 +0100
 Subject: [PATCH] Add an option to disable the ossaudiodev module
 
 Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
+[Peter: update for 2.7.16]
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 ---
  configure.ac | 6 ++++++
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 291ba35..8dc573e 100644
+index 3848b16b9f..6d19cdee95 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2898,6 +2898,12 @@ if test "$CURSES" = "no"; then
+@@ -2927,6 +2927,12 @@ if test "$CURSES" = "no"; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _curses _curses_panel"
  fi
  
@@ -26,5 +28,5 @@ index 291ba35..8dc573e 100644
  
  AC_ARG_ENABLE(pydoc,
 -- 
-2.7.4
+2.11.0
 
diff --git a/package/python/0032-Add-option-to-disable-the-hashlib-module.patch b/package/python/0032-Add-option-to-disable-the-hashlib-module.patch
index bb3ccfa765..82ef3a13f7 100644
--- a/package/python/0032-Add-option-to-disable-the-hashlib-module.patch
+++ b/package/python/0032-Add-option-to-disable-the-hashlib-module.patch
@@ -1,19 +1,21 @@
-From f11dc326ae216911a67bd563b619f39522c14bf2 Mon Sep 17 00:00:00 2001
+From 479bef8182c4f6b678a86820ccc06760ca60c286 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Tue, 7 Mar 2017 22:33:02 +0100
 Subject: [PATCH] Add option to disable the hashlib module
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[Peter: update for 2.7.16]
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 ---
  configure.ac | 6 ++++++
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 8dc573e..854724d 100644
+index 6d19cdee95..ddccc79c2c 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2840,6 +2840,12 @@ AC_ARG_ENABLE(ssl,
-     	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} ssl"
+@@ -2869,6 +2869,12 @@ AC_ARG_ENABLE(ssl,
+     	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _ssl"
    	  fi])
  
 +AC_ARG_ENABLE(hashlib,
@@ -26,5 +28,5 @@ index 8dc573e..854724d 100644
         AS_HELP_STRING([--disable-bz2], [disable BZIP2]),
         [ if test "$enableval" = "no"; then
 -- 
-2.7.4
+2.11.0
 
diff --git a/package/python/0033-Add-an-option-to-disable-readline-module.patch b/package/python/0033-Add-an-option-to-disable-readline-module.patch
index ade729fb37..02b1315179 100644
--- a/package/python/0033-Add-an-option-to-disable-readline-module.patch
+++ b/package/python/0033-Add-an-option-to-disable-readline-module.patch
@@ -1,18 +1,20 @@
-From 6b461f698bd33b3493207baf79f4ee02286be8e8 Mon Sep 17 00:00:00 2001
+From abea92958b073dfbf0c78bcb31ce9cfc709c20ca Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Tue, 7 Mar 2017 22:33:55 +0100
 Subject: [PATCH] Add an option to disable readline module
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[Peter: update for 2.7.16]
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 ---
  configure.ac | 6 ++++++
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 854724d..0a06497 100644
+index ddccc79c2c..dae266326e 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2846,6 +2846,12 @@ AC_ARG_ENABLE(hashlib,
+@@ -2875,6 +2875,12 @@ AC_ARG_ENABLE(hashlib,
  	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _hashlib"
  	  fi])
  
@@ -26,5 +28,5 @@ index 854724d..0a06497 100644
         AS_HELP_STRING([--disable-bz2], [disable BZIP2]),
         [ if test "$enableval" = "no"; then
 -- 
-2.7.4
+2.11.0
 
diff --git a/package/python/0035-bpo-35746-Fix-segfault-in-ssl-s-cert-parser-GH-11569.patch b/package/python/0035-bpo-35746-Fix-segfault-in-ssl-s-cert-parser-GH-11569.patch
deleted file mode 100644
index 9eec6db8c9..0000000000
--- a/package/python/0035-bpo-35746-Fix-segfault-in-ssl-s-cert-parser-GH-11569.patch
+++ /dev/null
@@ -1,121 +0,0 @@
-From 06b15424b0dcacb1c551b2a36e739fffa8d0c595 Mon Sep 17 00:00:00 2001
-From: "Miss Islington (bot)"
- <31488909+miss-islington@users.noreply.github.com>
-Date: Tue, 15 Jan 2019 15:11:52 -0800
-Subject: [PATCH] bpo-35746: Fix segfault in ssl's cert parser (GH-11569)
-
-Fix a NULL pointer deref in ssl module. The cert parser did not handle CRL
-distribution points with empty DP or URI correctly. A malicious or buggy
-certificate can result into segfault.
-
-Signed-off-by: Christian Heimes <christian@python.org>
-
-https://bugs.python.org/issue35746
-(cherry picked from commit a37f52436f9aa4b9292878b72f3ff1480e2606c3)
-
-Co-authored-by: Christian Heimes <christian@python.org>
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- Lib/test/talos-2019-0758.pem                       | 22 ++++++++++++++++++++++
- Lib/test/test_ssl.py                               | 22 ++++++++++++++++++++++
- .../2019-01-15-18-16-05.bpo-35746.nMSd0j.rst       |  3 +++
- Modules/_ssl.c                                     |  4 ++++
- 4 files changed, 51 insertions(+)
- create mode 100644 Lib/test/talos-2019-0758.pem
- create mode 100644 Misc/NEWS.d/next/Security/2019-01-15-18-16-05.bpo-35746.nMSd0j.rst
-
-diff --git a/Lib/test/talos-2019-0758.pem b/Lib/test/talos-2019-0758.pem
-new file mode 100644
-index 0000000000..13b95a77fd
---- /dev/null
-+++ b/Lib/test/talos-2019-0758.pem
-@@ -0,0 +1,22 @@
-+-----BEGIN CERTIFICATE-----
-+MIIDqDCCApKgAwIBAgIBAjALBgkqhkiG9w0BAQswHzELMAkGA1UEBhMCVUsxEDAO
-+BgNVBAMTB2NvZHktY2EwHhcNMTgwNjE4MTgwMDU4WhcNMjgwNjE0MTgwMDU4WjA7
-+MQswCQYDVQQGEwJVSzEsMCoGA1UEAxMjY29kZW5vbWljb24tdm0tMi50ZXN0Lmxh
-+bC5jaXNjby5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC63fGB
-+J80A9Av1GB0bptslKRIUtJm8EeEu34HkDWbL6AJY0P8WfDtlXjlPaLqFa6sqH6ES
-+V48prSm1ZUbDSVL8R6BYVYpOlK8/48xk4pGTgRzv69gf5SGtQLwHy8UPBKgjSZoD
-+5a5k5wJXGswhKFFNqyyxqCvWmMnJWxXTt2XDCiWc4g4YAWi4O4+6SeeHVAV9rV7C
-+1wxqjzKovVe2uZOHjKEzJbbIU6JBPb6TRfMdRdYOw98n1VXDcKVgdX2DuuqjCzHP
-+WhU4Tw050M9NaK3eXp4Mh69VuiKoBGOLSOcS8reqHIU46Reg0hqeL8LIL6OhFHIF
-+j7HR6V1X6F+BfRS/AgMBAAGjgdYwgdMwCQYDVR0TBAIwADAdBgNVHQ4EFgQUOktp
-+HQjxDXXUg8prleY9jeLKeQ4wTwYDVR0jBEgwRoAUx6zgPygZ0ZErF9sPC4+5e2Io
-+UU+hI6QhMB8xCzAJBgNVBAYTAlVLMRAwDgYDVQQDEwdjb2R5LWNhggkA1QEAuwb7
-+2s0wCQYDVR0SBAIwADAuBgNVHREEJzAlgiNjb2Rlbm9taWNvbi12bS0yLnRlc3Qu
-+bGFsLmNpc2NvLmNvbTAOBgNVHQ8BAf8EBAMCBaAwCwYDVR0fBAQwAjAAMAsGCSqG
-+SIb3DQEBCwOCAQEAvqantx2yBlM11RoFiCfi+AfSblXPdrIrHvccepV4pYc/yO6p
-+t1f2dxHQb8rWH3i6cWag/EgIZx+HJQvo0rgPY1BFJsX1WnYf1/znZpkUBGbVmlJr
-+t/dW1gSkNS6sPsM0Q+7HPgEv8CPDNK5eo7vU2seE0iWOkxSyVUuiCEY9ZVGaLVit
-+p0C78nZ35Pdv4I+1cosmHl28+es1WI22rrnmdBpH8J1eY6WvUw2xuZHLeNVN0TzV
-+Q3qq53AaCWuLOD1AjESWuUCxMZTK9DPS4JKXTK8RLyDeqOvJGjsSWp3kL0y3GaQ+
-+10T1rfkKJub2+m9A9duin1fn6tHc2wSvB7m3DA==
-+-----END CERTIFICATE-----
-diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.py
-index e476031702..9240184d98 100644
---- a/Lib/test/test_ssl.py
-+++ b/Lib/test/test_ssl.py
-@@ -72,6 +72,7 @@ NONEXISTINGCERT = data_file("XXXnonexisting.pem")
- BADKEY = data_file("badkey.pem")
- NOKIACERT = data_file("nokia.pem")
- NULLBYTECERT = data_file("nullbytecert.pem")
-+TALOS_INVALID_CRLDP = data_file("talos-2019-0758.pem")
- 
- DHFILE = data_file("ffdh3072.pem")
- BYTES_DHFILE = DHFILE.encode(sys.getfilesystemencoding())
-@@ -227,6 +228,27 @@ class BasicSocketTests(unittest.TestCase):
-         self.assertEqual(p['crlDistributionPoints'],
-                          ('http://SVRIntl-G3-crl.verisign.com/SVRIntlG3.crl',))
- 
-+    def test_parse_cert_CVE_2019_5010(self):
-+        p = ssl._ssl._test_decode_cert(TALOS_INVALID_CRLDP)
-+        if support.verbose:
-+            sys.stdout.write("\n" + pprint.pformat(p) + "\n")
-+        self.assertEqual(
-+            p,
-+            {
-+                'issuer': (
-+                    (('countryName', 'UK'),), (('commonName', 'cody-ca'),)),
-+                'notAfter': 'Jun 14 18:00:58 2028 GMT',
-+                'notBefore': 'Jun 18 18:00:58 2018 GMT',
-+                'serialNumber': '02',
-+                'subject': ((('countryName', 'UK'),),
-+                            (('commonName',
-+                              'codenomicon-vm-2.test.lal.cisco.com'),)),
-+                'subjectAltName': (
-+                    ('DNS', 'codenomicon-vm-2.test.lal.cisco.com'),),
-+                'version': 3
-+            }
-+        )
-+
-     def test_parse_cert_CVE_2013_4238(self):
-         p = ssl._ssl._test_decode_cert(NULLBYTECERT)
-         if support.verbose:
-diff --git a/Misc/NEWS.d/next/Security/2019-01-15-18-16-05.bpo-35746.nMSd0j.rst b/Misc/NEWS.d/next/Security/2019-01-15-18-16-05.bpo-35746.nMSd0j.rst
-new file mode 100644
-index 0000000000..dffe347eec
---- /dev/null
-+++ b/Misc/NEWS.d/next/Security/2019-01-15-18-16-05.bpo-35746.nMSd0j.rst
-@@ -0,0 +1,3 @@
-+[CVE-2019-5010] Fix a NULL pointer deref in ssl module. The cert parser did
-+not handle CRL distribution points with empty DP or URI correctly. A
-+malicious or buggy certificate can result into segfault.
-diff --git a/Modules/_ssl.c b/Modules/_ssl.c
-index a96c419260..19bb1207b4 100644
---- a/Modules/_ssl.c
-+++ b/Modules/_ssl.c
-@@ -1223,6 +1223,10 @@ _get_crl_dp(X509 *certificate) {
-         STACK_OF(GENERAL_NAME) *gns;
- 
-         dp = sk_DIST_POINT_value(dps, i);
-+        if (dp->distpoint == NULL) {
-+            /* Ignore empty DP value, CVE-2019-5010 */
-+            continue;
-+        }
-         gns = dp->distpoint->name.fullname;
- 
-         for (j=0; j < sk_GENERAL_NAME_num(gns); j++) {
--- 
-2.11.0
-
diff --git a/package/python/python.hash b/package/python/python.hash
index feadcfdcb5..52b9984b0c 100644
--- a/package/python/python.hash
+++ b/package/python/python.hash
@@ -1,5 +1,5 @@
-# From https://www.python.org/downloads/release/python-2715/
-md5 a80ae3cc478460b922242f43a1b4094d Python-2.7.15.tar.xz
+# From https://www.python.org/downloads/release/python-2716/
+md5 30157d85a2c0479c09ea2cbe61f2aaf5 Python-2.7.16.tar.xz
 # Locally calculated
-sha256 22d9b1ac5b26135ad2b8c2901a9413537e08749a753356ee913c84dbd2df5574  Python-2.7.15.tar.xz
-sha256 b9a6d9320b8f2693e8d41e496ce56caadacaddcca9be2a64a61749278f425cf2  LICENSE
+sha256 f222ef602647eecb6853681156d32de4450a2c39f4de93bd5b20235f2e660ed7  Python-2.7.16.tar.xz
+sha256 a77d71d6be6f9032e6b6e5d2cf6da68f9eeab9036edfbc043633c8979cd5e82c  LICENSE
diff --git a/package/python/python.mk b/package/python/python.mk
index 79df3c462a..d1e70a015a 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON_VERSION_MAJOR = 2.7
-PYTHON_VERSION = $(PYTHON_VERSION_MAJOR).15
+PYTHON_VERSION = $(PYTHON_VERSION_MAJOR).16
 PYTHON_SOURCE = Python-$(PYTHON_VERSION).tar.xz
 PYTHON_SITE = https://python.org/ftp/python/$(PYTHON_VERSION)
 PYTHON_LICENSE = Python-2.0, others
-- 
2.11.0
