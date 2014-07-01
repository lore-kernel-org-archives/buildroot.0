From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Jul 2014 14:57:00 +0200
Subject: [Buildroot] [git commit] python: bump to Python 2.7.7
Message-ID: <20140701125921.AE5399CDAB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4d9ae3daf608f1a1ee4afe8e69043b5a06443a37
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Status of patches:

 - python-013-fix-readline-6.3.patch is removed, as it was a backport
   from an upstream fix.
 - all other patches are updated, with no special changes other than
   solving minor conflicts.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...python-004-sysconfigdata-install-location.patch |    6 ++--
 .../python/python-005-pyc-pyo-conditional.patch    |    2 +-
 .../python-006-cross-compile-getaddrinfo.patch     |    2 +-
 package/python/python-007-disable-extensions.patch |    4 +-
 package/python/python-010-fix-python-config.patch  |   39 +++++++++++---------
 .../python/python-011-remove-python-symlink.patch  |    9 +++--
 package/python/python-013-fix-readline-6.3.patch   |   34 -----------------
 .../python/python-100-optional-test-modules.patch  |   25 ++++++++-----
 package/python/python-101-optional-pydoc.patch     |   12 +++---
 package/python/python-102-optional-2to3.patch      |   16 ++++----
 package/python/python-103-optional-sqlite.patch    |   14 ++++----
 package/python/python-104-optional-tk.patch        |   20 +++++------
 package/python/python-105-optional-curses.patch    |    8 ++--
 package/python/python-106-optional-expat.patch     |   12 +++---
 .../python/python-107-optional-codecs-cjk.patch    |    2 +-
 package/python/python-108-optional-nis.patch       |    2 +-
 .../python/python-109-optional-unicodedata.patch   |    2 +-
 package/python/python-110-optional-db.patch        |   14 ++++----
 package/python/python-111-optional-ssl.patch       |    2 +-
 package/python/python-112-optional-bzip2.patch     |    2 +-
 package/python/python-113-optional-zlib.patch      |    2 +-
 package/python/python.mk                           |    2 +-
 22 files changed, 102 insertions(+), 129 deletions(-)

diff --git a/package/python/python-004-sysconfigdata-install-location.patch b/package/python/python-004-sysconfigdata-install-location.patch
index 940dde7..2a5e4f4 100644
--- a/package/python/python-004-sysconfigdata-install-location.patch
+++ b/package/python/python-004-sysconfigdata-install-location.patch
@@ -31,7 +31,7 @@ Index: b/Makefile.pre.in
  
  # Build the shared modules
  # Under GNU make, MAKEFLAGS are sorted and normalized; the 's' for
-@@ -965,7 +968,7 @@
+@@ -969,7 +972,7 @@
  		else	true; \
  		fi; \
  	done
@@ -40,7 +40,7 @@ Index: b/Makefile.pre.in
  	do \
  		if test -x $$i; then \
  			$(INSTALL_SCRIPT) $$i $(DESTDIR)$(LIBDEST); \
-@@ -975,6 +978,11 @@
+@@ -979,6 +982,11 @@
  			echo $(INSTALL_DATA) $$i $(LIBDEST); \
  		fi; \
  	done
@@ -52,7 +52,7 @@ Index: b/Makefile.pre.in
  	@for d in $(LIBSUBDIRS); \
  	do \
  		a=$(srcdir)/Lib/$$d; \
-@@ -1299,7 +1307,7 @@
+@@ -1303,7 +1311,7 @@
  		Modules/Setup Modules/Setup.local Modules/Setup.config \
  		Modules/ld_so_aix Modules/python.exp Misc/python.pc
  	-rm -f python*-gdb.py
diff --git a/package/python/python-005-pyc-pyo-conditional.patch b/package/python/python-005-pyc-pyo-conditional.patch
index aa3b330..fbcdaa6 100644
--- a/package/python/python-005-pyc-pyo-conditional.patch
+++ b/package/python/python-005-pyc-pyo-conditional.patch
@@ -2,7 +2,7 @@ Index: b/Makefile.pre.in
 ===================================================================
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1013,24 +1013,32 @@
+@@ -1017,24 +1017,32 @@
  		$(INSTALL_DATA) $(srcdir)/Modules/xxmodule.c \
  			$(DESTDIR)$(LIBDEST)/distutils/tests ; \
  	fi
diff --git a/package/python/python-006-cross-compile-getaddrinfo.patch b/package/python/python-006-cross-compile-getaddrinfo.patch
index 2c8248f..b16c7e9 100644
--- a/package/python/python-006-cross-compile-getaddrinfo.patch
+++ b/package/python/python-006-cross-compile-getaddrinfo.patch
@@ -2,7 +2,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3337,7 +3337,7 @@
+@@ -3330,7 +3330,7 @@
  
  AC_MSG_RESULT($ac_cv_buggy_getaddrinfo)
  
diff --git a/package/python/python-007-disable-extensions.patch b/package/python/python-007-disable-extensions.patch
index c03f84c..10b0a7c 100644
--- a/package/python/python-007-disable-extensions.patch
+++ b/package/python/python-007-disable-extensions.patch
@@ -19,7 +19,7 @@ Index: b/Makefile.pre.in
  		$(PYTHON_FOR_BUILD) $(srcdir)/setup.py $$quiet build
  
  # Build static library
-@@ -1154,7 +1157,8 @@
+@@ -1158,7 +1161,8 @@
  # Install the dynamically loadable modules
  # This goes into $(exec_prefix)
  sharedinstall: sharedmods
@@ -33,7 +33,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2275,6 +2275,8 @@
+@@ -2268,6 +2268,8 @@
  
  AC_PATH_TOOL([PKG_CONFIG], [pkg-config])
  
diff --git a/package/python/python-010-fix-python-config.patch b/package/python/python-010-fix-python-config.patch
index f093d91..9e35de6 100644
--- a/package/python/python-010-fix-python-config.patch
+++ b/package/python/python-010-fix-python-config.patch
@@ -6,10 +6,11 @@ on the sysconfig import that usually leads to bad data/results.
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 
-diff -Nura Python-2.7.6.orig/configure.ac Python-2.7.6/configure.ac
---- Python-2.7.6.orig/configure.ac	2014-02-25 12:48:16.726535439 -0300
-+++ Python-2.7.6/configure.ac	2014-02-25 12:49:00.992176462 -0300
-@@ -868,6 +868,7 @@
+Index: b/configure.ac
+===================================================================
+--- a/configure.ac
++++ b/configure.ac
+@@ -879,6 +879,7 @@
  
  # Other platforms follow
  if test $enable_shared = "yes"; then
@@ -17,7 +18,7 @@ diff -Nura Python-2.7.6.orig/configure.ac Python-2.7.6/configure.ac
    AC_DEFINE(Py_ENABLE_SHARED, 1, [Defined if Python is built as a shared library.])
    case $ac_sys_system in
      BeOS*)
-@@ -928,6 +929,7 @@
+@@ -939,6 +940,7 @@
  
    esac
  else # shared is disabled
@@ -25,7 +26,7 @@ diff -Nura Python-2.7.6.orig/configure.ac Python-2.7.6/configure.ac
    case $ac_sys_system in
      CYGWIN*)
            BLDLIBRARY='$(LIBRARY)'
-@@ -1905,6 +1907,9 @@
+@@ -1909,6 +1911,9 @@
  AC_SUBST(BLDSHARED)
  AC_SUBST(CCSHARED)
  AC_SUBST(LINKFORSHARED)
@@ -35,7 +36,7 @@ diff -Nura Python-2.7.6.orig/configure.ac Python-2.7.6/configure.ac
  # SO is the extension of shared libraries `(including the dot!)
  # -- usually .so, .sl on HP-UX, .dll on Cygwin
  AC_MSG_CHECKING(SO)
-@@ -4529,7 +4534,7 @@
+@@ -4550,7 +4555,7 @@
  AC_MSG_RESULT(done)
  
  # generate output files
@@ -44,10 +45,11 @@ diff -Nura Python-2.7.6.orig/configure.ac Python-2.7.6/configure.ac
  AC_CONFIG_FILES([Modules/ld_so_aix], [chmod +x Modules/ld_so_aix])
  AC_OUTPUT
  
-diff -Nura Python-2.7.6.orig/Makefile.pre.in Python-2.7.6/Makefile.pre.in
---- Python-2.7.6.orig/Makefile.pre.in	2014-02-25 12:48:16.611533773 -0300
-+++ Python-2.7.6/Makefile.pre.in	2014-02-25 12:49:00.993176482 -0300
-@@ -161,7 +161,7 @@
+Index: b/Makefile.pre.in
+===================================================================
+--- a/Makefile.pre.in
++++ b/Makefile.pre.in
+@@ -163,7 +163,7 @@
  SUBDIRSTOO=	Include Lib Misc Demo
  
  # Files and directories to be distributed
@@ -56,7 +58,7 @@ diff -Nura Python-2.7.6.orig/Makefile.pre.in Python-2.7.6/Makefile.pre.in
  DISTFILES=	README ChangeLog $(CONFIGFILES)
  DISTDIRS=	$(SUBDIRS) $(SUBDIRSTOO) Ext-dummy
  DIST=		$(DISTFILES) $(DISTDIRS)
-@@ -405,7 +405,7 @@
+@@ -407,7 +407,7 @@
  
  # Default target
  all:		build_all
@@ -65,7 +67,7 @@ diff -Nura Python-2.7.6.orig/Makefile.pre.in Python-2.7.6/Makefile.pre.in
  
  # Compile a binary with gcc profile guided optimization.
  profile-opt:
-@@ -1045,10 +1045,12 @@
+@@ -1068,10 +1068,12 @@
  	fi; \
  	cd $(srcdir)/Lib/$(PLATDIR); $(RUNSHARED) ./regen
  
@@ -80,7 +82,7 @@ diff -Nura Python-2.7.6.orig/Makefile.pre.in Python-2.7.6/Makefile.pre.in
  
  # Install the include files
  INCLDIRSTOMAKE=$(INCLUDEDIR) $(CONFINCLUDEDIR) $(INCLUDEPY) $(CONFINCLUDEPY)
-@@ -1107,7 +1109,7 @@
+@@ -1130,7 +1132,7 @@
  	$(INSTALL_SCRIPT) $(srcdir)/Modules/makesetup $(DESTDIR)$(LIBPL)/makesetup
  	$(INSTALL_SCRIPT) $(srcdir)/install-sh $(DESTDIR)$(LIBPL)/install-sh
  	$(INSTALL_SCRIPT) python-config $(DESTDIR)$(BINDIR)/python$(VERSION)-config
@@ -89,7 +91,7 @@ diff -Nura Python-2.7.6.orig/Makefile.pre.in Python-2.7.6/Makefile.pre.in
  	@if [ -s Modules/python.exp -a \
  		"`echo $(MACHDEP) | sed 's/^\(...\).*/\1/'`" = "aix" ]; then \
  		echo; echo "Installing support files for building shared extension modules on AIX:"; \
-@@ -1287,6 +1289,7 @@
+@@ -1311,6 +1313,7 @@
  		config.cache config.log pyconfig.h Modules/config.c
  	-rm -rf build platform
  	-rm -rf $(PYTHONFRAMEWORKDIR)
@@ -97,9 +99,10 @@ diff -Nura Python-2.7.6.orig/Makefile.pre.in Python-2.7.6/Makefile.pre.in
  
  # Make things extra clean, before making a distribution:
  # remove all generated files, even Makefile[.pre]
-diff -Nura Python-2.7.6.orig/Misc/python-config.sh.in Python-2.7.6/Misc/python-config.sh.in
---- Python-2.7.6.orig/Misc/python-config.sh.in	1969-12-31 21:00:00.000000000 -0300
-+++ Python-2.7.6/Misc/python-config.sh.in	2014-02-25 12:49:00.993176482 -0300
+Index: b/Misc/python-config.sh.in
+===================================================================
+--- /dev/null
++++ b/Misc/python-config.sh.in
 @@ -0,0 +1,102 @@
 +#!/bin/sh
 +
diff --git a/package/python/python-011-remove-python-symlink.patch b/package/python/python-011-remove-python-symlink.patch
index a9b1daa..af0a296 100644
--- a/package/python/python-011-remove-python-symlink.patch
+++ b/package/python/python-011-remove-python-symlink.patch
@@ -6,10 +6,11 @@ python symlink points to.
 
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 
-diff -purN a/Makefile.pre.in b/Makefile.pre.in
---- a/Makefile.pre.in	2014-03-02 17:56:56.529132499 +0100
-+++ b/Makefile.pre.in	2014-03-02 19:24:02.346491849 +0100
-@@ -857,17 +857,10 @@ $(DESTSHARED):
+Index: b/Makefile.pre.in
+===================================================================
+--- a/Makefile.pre.in
++++ b/Makefile.pre.in
+@@ -858,17 +858,10 @@
  #  $(PYTHON) -> python2 -> python$(VERSION))
  # Also create equivalent chains for other installed files
  bininstall:	altbininstall
diff --git a/package/python/python-013-fix-readline-6.3.patch b/package/python/python-013-fix-readline-6.3.patch
deleted file mode 100644
index 97ae45c..0000000
--- a/package/python/python-013-fix-readline-6.3.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-fix readline extension compilation against readline 6.3
-
-readline 6.3 removed some typedefs that had been deprecated for some time, but
-Python 2.7.6 still uses them and therefore fails to build the readline
-extension when it is enabled. This issue has been addressed in the Python bug
-tracker here: http://bugs.python.org/issue20374. The patch below is based on
-the readline_func_cast.patch patch uploaded there. Also see
-http://lists.gnu.org/archive/html/bug-readline/2014-03/msg00003.html for more
-information.
-
-This patch should be removed with the next Python 2.7 release, which should
-include the fix.
-
-Signed-off-by: Ivan Sergeev <vsergeev@kumunetworks.com>
-
-diff -purN python-2.7.6.orig/Modules/readline.c python-2.7.6/Modules/readline.c
---- python-2.7.6.orig/Modules/readline.c	2014-04-16 13:40:17.566874715 -0700
-+++ python-2.7.6/Modules/readline.c	2014-04-16 13:37:15.421231983 -0700
-@@ -911,12 +911,12 @@ setup_readline(void)
-     rl_bind_key_in_map ('\t', rl_complete, emacs_meta_keymap);
-     rl_bind_key_in_map ('\033', rl_complete, emacs_meta_keymap);
-     /* Set our hook functions */
--    rl_startup_hook = (Function *)on_startup_hook;
-+    rl_startup_hook = on_startup_hook;
- #ifdef HAVE_RL_PRE_INPUT_HOOK
--    rl_pre_input_hook = (Function *)on_pre_input_hook;
-+    rl_pre_input_hook = on_pre_input_hook;
- #endif
-     /* Set our completion function */
--    rl_attempted_completion_function = (CPPFunction *)flex_complete;
-+    rl_attempted_completion_function = flex_complete;
-     /* Set Python word break characters */
-     completer_word_break_characters =
-         rl_completer_word_break_characters =
diff --git a/package/python/python-100-optional-test-modules.patch b/package/python/python-100-optional-test-modules.patch
index a5f7545..ff9c914 100644
--- a/package/python/python-100-optional-test-modules.patch
+++ b/package/python/python-100-optional-test-modules.patch
@@ -15,16 +15,17 @@ Index: b/Makefile.pre.in
 ===================================================================
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -934,23 +934,40 @@
+@@ -928,26 +928,42 @@
  	plat-mac/lib-scriptpackages/SystemEvents \
  	plat-mac/lib-scriptpackages/Terminal
  PLATMACPATH=:plat-mac:plat-mac/lib-scriptpackages
 -LIBSUBDIRS=	lib-tk lib-tk/test lib-tk/test/test_tkinter \
 -		lib-tk/test/test_ttk site-packages test test/audiodata test/data \
--		test/cjkencodings test/decimaltestdata test/xmltestdata test/subprocessdata \
+-		test/cjkencodings test/decimaltestdata test/xmltestdata \
+-		test/imghdrdata \
+-		test/subprocessdata \
 -		test/tracedmodules \
-+LIBSUBDIRS=	lib-tk \
-+		site-packages \
++LIBSUBDIRS=	lib-tk site-packages \
  		encodings compiler hotshot \
 -		email email/mime email/test email/test/data \
 -		json json/tests \
@@ -32,14 +33,16 @@ Index: b/Makefile.pre.in
 -		logging bsddb bsddb/test csv importlib wsgiref \
 -		lib2to3 lib2to3/fixes lib2to3/pgen2 lib2to3/tests \
 -		lib2to3/tests/data lib2to3/tests/data/fixers lib2to3/tests/data/fixers/myfixes \
--		ctypes ctypes/test ctypes/macholib idlelib idlelib/Icons \
+-		ctypes ctypes/test ctypes/macholib \
+-		idlelib idlelib/Icons idlelib/idle_test \
 -		distutils distutils/command distutils/tests $(XMLLIBSUBDIRS) \
 +		email email/mime \
 +		json \
 +		sqlite3 \
 +		logging bsddb csv importlib wsgiref \
 +		lib2to3 lib2to3/fixes lib2to3/pgen2 \
-+		ctypes  ctypes/macholib idlelib idlelib/Icons \
++		ctypes ctypes/macholib \
++		idlelib idlelib/Icons \
 +		distutils distutils/command $(XMLLIBSUBDIRS) \
  		multiprocessing multiprocessing/dummy \
 -		unittest unittest/test \
@@ -48,9 +51,10 @@ Index: b/Makefile.pre.in
  		curses pydoc_data $(MACHDEPS)
 +
 +TESTSUBDIRS = lib-tk/test lib-tk/test/test_tkinter \
-+	lib-tk/test/test_ttk \
-+	test test/audiodata test/data \
-+	test/cjkencodings test/decimaltestdata test/xmltestdata test/subprocessdata \
++	lib-tk/test/test_ttk test test/audiodata test/data \
++	test/cjkencodings test/decimaltestdata test/xmltestdata \
++	test/imghdrdata \
++	test/subprocessdata \
 +	test/tracedmodules \
 +	email/test email/test/data \
 +	json/tests \
@@ -59,6 +63,7 @@ Index: b/Makefile.pre.in
 +	lib2to3/tests \
 +	lib2to3/tests/data lib2to3/tests/data/fixers lib2to3/tests/data/fixers/myfixes \
 +	ctypes/test \
++	idlelib/idle_test \
 +	distutils/tests \
 +	unittest/test
 +
@@ -73,7 +78,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2614,6 +2614,12 @@
+@@ -2612,6 +2612,12 @@
  fi
  
  
diff --git a/package/python/python-101-optional-pydoc.patch b/package/python/python-101-optional-pydoc.patch
index c9b05bd..7518b5e 100644
--- a/package/python/python-101-optional-pydoc.patch
+++ b/package/python/python-101-optional-pydoc.patch
@@ -16,7 +16,7 @@ Index: b/Makefile.pre.in
 ===================================================================
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -947,7 +947,7 @@
+@@ -941,7 +941,7 @@
  		multiprocessing multiprocessing/dummy \
  		unittest \
  		lib-old \
@@ -24,8 +24,8 @@ Index: b/Makefile.pre.in
 +		curses $(MACHDEPS)
  
  TESTSUBDIRS = lib-tk/test lib-tk/test/test_tkinter \
- 	lib-tk/test/test_ttk \
-@@ -968,6 +968,10 @@
+ 	lib-tk/test/test_ttk test test/audiodata test/data \
+@@ -964,6 +964,10 @@
  LIBSUBDIRS += $(TESTSUBDIRS)
  endif
  
@@ -40,7 +40,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2613,6 +2613,11 @@
+@@ -2611,6 +2611,11 @@
        AC_CHECK_FUNCS(pthread_atfork)
  fi
  
@@ -56,7 +56,7 @@ Index: b/setup.py
 ===================================================================
 --- a/setup.py
 +++ b/setup.py
-@@ -2205,6 +2205,12 @@
+@@ -2217,6 +2217,12 @@
      # turn off warnings when deprecated modules are imported
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
@@ -69,7 +69,7 @@ Index: b/setup.py
      setup(# PyPI Metadata (PEP 301)
            name = "Python",
            version = sys.version.split()[0],
-@@ -2225,9 +2231,7 @@
+@@ -2237,9 +2243,7 @@
            ext_modules=[Extension('_struct', ['_struct.c'])],
  
            # Scripts to install
diff --git a/package/python/python-102-optional-2to3.patch b/package/python/python-102-optional-2to3.patch
index 586b24b..3503f8c 100644
--- a/package/python/python-102-optional-2to3.patch
+++ b/package/python/python-102-optional-2to3.patch
@@ -16,24 +16,24 @@ Index: b/Makefile.pre.in
 ===================================================================
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -941,7 +941,6 @@
+@@ -934,7 +934,6 @@
  		json \
  		sqlite3 \
  		logging bsddb csv importlib wsgiref \
 -		lib2to3 lib2to3/fixes lib2to3/pgen2 \
- 		ctypes  ctypes/macholib idlelib idlelib/Icons \
+ 		ctypes ctypes/macholib \
+ 		idlelib idlelib/Icons \
  		distutils distutils/command $(XMLLIBSUBDIRS) \
- 		multiprocessing multiprocessing/dummy \
-@@ -958,8 +957,6 @@
+@@ -953,8 +952,6 @@
  	json/tests \
  	sqlite3/test \
  	bsddb/test \
 -	lib2to3/tests \
 -	lib2to3/tests/data lib2to3/tests/data/fixers lib2to3/tests/data/fixers/myfixes \
  	ctypes/test \
+ 	idlelib/idle_test \
  	distutils/tests \
- 	unittest/test
-@@ -972,6 +969,14 @@
+@@ -968,6 +965,14 @@
  LIBSUBDIRS += pydoc_data
  endif
  
@@ -52,7 +52,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2625,6 +2625,12 @@
+@@ -2623,6 +2623,12 @@
  	AS_HELP_STRING([--disable-test-modules], [disable test modules]),
  	[ TEST_MODULES="${enableval}" ], [ TEST_MODULES=yes ])
  
@@ -69,7 +69,7 @@ Index: b/setup.py
 ===================================================================
 --- a/setup.py
 +++ b/setup.py
-@@ -2206,10 +2206,11 @@
+@@ -2218,10 +2218,11 @@
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
  
diff --git a/package/python/python-103-optional-sqlite.patch b/package/python/python-103-optional-sqlite.patch
index a20afc7..a75acc8 100644
--- a/package/python/python-103-optional-sqlite.patch
+++ b/package/python/python-103-optional-sqlite.patch
@@ -12,7 +12,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2613,6 +2613,15 @@
+@@ -2611,6 +2611,15 @@
        AC_CHECK_FUNCS(pthread_atfork)
  fi
  
@@ -32,23 +32,23 @@ Index: b/Makefile.pre.in
 ===================================================================
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -939,7 +939,6 @@
+@@ -932,7 +932,6 @@
  		encodings compiler hotshot \
  		email email/mime \
  		json \
 -		sqlite3 \
  		logging bsddb csv importlib wsgiref \
- 		ctypes  ctypes/macholib idlelib idlelib/Icons \
- 		distutils distutils/command $(XMLLIBSUBDIRS) \
-@@ -955,7 +954,6 @@
+ 		ctypes ctypes/macholib \
+ 		idlelib idlelib/Icons \
+@@ -950,7 +949,6 @@
  	test/tracedmodules \
  	email/test email/test/data \
  	json/tests \
 -	sqlite3/test \
  	bsddb/test \
  	ctypes/test \
- 	distutils/tests \
-@@ -977,6 +975,11 @@
+ 	idlelib/idle_test \
+@@ -973,6 +971,11 @@
  		lib2to3/tests/data/fixers/myfixes
  endif
  
diff --git a/package/python/python-104-optional-tk.patch b/package/python/python-104-optional-tk.patch
index 3e0dd16..2e469ab 100644
--- a/package/python/python-104-optional-tk.patch
+++ b/package/python/python-104-optional-tk.patch
@@ -12,28 +12,26 @@ Index: b/Makefile.pre.in
 ===================================================================
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -934,8 +934,7 @@
+@@ -928,7 +928,7 @@
  	plat-mac/lib-scriptpackages/SystemEvents \
  	plat-mac/lib-scriptpackages/Terminal
  PLATMACPATH=:plat-mac:plat-mac/lib-scriptpackages
--LIBSUBDIRS=	lib-tk \
--		site-packages \
+-LIBSUBDIRS=	lib-tk site-packages \
 +LIBSUBDIRS=	site-packages \
  		encodings compiler hotshot \
  		email email/mime \
  		json \
-@@ -947,9 +946,7 @@
+@@ -941,8 +941,7 @@
  		lib-old \
  		curses $(MACHDEPS)
  
 -TESTSUBDIRS = lib-tk/test lib-tk/test/test_tkinter \
--	lib-tk/test/test_ttk \
--	test test/audiodata test/data \
+-	lib-tk/test/test_ttk test test/audiodata test/data \
 +TESTSUBDIRS = test test/audiodata test/data \
- 	test/cjkencodings test/decimaltestdata test/xmltestdata test/subprocessdata \
- 	test/tracedmodules \
- 	email/test email/test/data \
-@@ -980,6 +977,12 @@
+ 	test/cjkencodings test/decimaltestdata test/xmltestdata \
+ 	test/imghdrdata \
+ 	test/subprocessdata \
+@@ -976,6 +975,12 @@
  TESTSUBDIRS += sqlite3/test
  endif
  
@@ -50,7 +48,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2622,6 +2622,15 @@
+@@ -2620,6 +2620,15 @@
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
  fi
  
diff --git a/package/python/python-105-optional-curses.patch b/package/python/python-105-optional-curses.patch
index 2ae4989..384cad3 100644
--- a/package/python/python-105-optional-curses.patch
+++ b/package/python/python-105-optional-curses.patch
@@ -12,7 +12,7 @@ Index: b/Makefile.pre.in
 ===================================================================
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -944,7 +944,7 @@
+@@ -939,7 +939,7 @@
  		multiprocessing multiprocessing/dummy \
  		unittest \
  		lib-old \
@@ -20,8 +20,8 @@ Index: b/Makefile.pre.in
 +		$(MACHDEPS)
  
  TESTSUBDIRS = test test/audiodata test/data \
- 	test/cjkencodings test/decimaltestdata test/xmltestdata test/subprocessdata \
-@@ -983,6 +983,10 @@
+ 	test/cjkencodings test/decimaltestdata test/xmltestdata \
+@@ -981,6 +981,10 @@
  	      lib-tk/test/test_ttk
  endif
  
@@ -36,7 +36,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2631,6 +2631,15 @@
+@@ -2629,6 +2629,15 @@
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _tkinter"
  fi
  
diff --git a/package/python/python-106-optional-expat.patch b/package/python/python-106-optional-expat.patch
index 9eee2cd..c1de887 100644
--- a/package/python/python-106-optional-expat.patch
+++ b/package/python/python-106-optional-expat.patch
@@ -19,16 +19,16 @@ Index: b/Makefile.pre.in
 ===================================================================
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -940,7 +940,7 @@
- 		json \
+@@ -935,7 +935,7 @@
  		logging bsddb csv importlib wsgiref \
- 		ctypes  ctypes/macholib idlelib idlelib/Icons \
+ 		ctypes ctypes/macholib \
+ 		idlelib idlelib/Icons \
 -		distutils distutils/command $(XMLLIBSUBDIRS) \
 +		distutils distutils/command \
  		multiprocessing multiprocessing/dummy \
  		unittest \
  		lib-old \
-@@ -987,6 +987,10 @@
+@@ -985,6 +985,10 @@
  LIBSUBDIRS += curses
  endif
  
@@ -43,7 +43,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2278,13 +2278,21 @@
+@@ -2276,13 +2276,21 @@
  AC_SUBST(DISABLED_EXTENSIONS)
  
  # Check for use of the system expat library
@@ -74,7 +74,7 @@ Index: b/setup.py
 ===================================================================
 --- a/setup.py
 +++ b/setup.py
-@@ -1457,7 +1457,7 @@
+@@ -1469,7 +1469,7 @@
          #
          # More information on Expat can be found at www.libexpat.org.
          #
diff --git a/package/python/python-107-optional-codecs-cjk.patch b/package/python/python-107-optional-codecs-cjk.patch
index 1b3acac..ad1d41f 100644
--- a/package/python/python-107-optional-codecs-cjk.patch
+++ b/package/python/python-107-optional-codecs-cjk.patch
@@ -10,7 +10,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2630,6 +2630,12 @@
+@@ -2628,6 +2628,12 @@
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
  fi
  
diff --git a/package/python/python-108-optional-nis.patch b/package/python/python-108-optional-nis.patch
index 8749dfc..bac49ff 100644
--- a/package/python/python-108-optional-nis.patch
+++ b/package/python/python-108-optional-nis.patch
@@ -13,7 +13,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2636,6 +2636,12 @@
+@@ -2634,6 +2634,12 @@
      	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _codecs_kr _codecs_jp _codecs_cn _codecs_tw _codecs_hk"
    	  fi])
  
diff --git a/package/python/python-109-optional-unicodedata.patch b/package/python/python-109-optional-unicodedata.patch
index 2d78818..af9a28e 100644
--- a/package/python/python-109-optional-unicodedata.patch
+++ b/package/python/python-109-optional-unicodedata.patch
@@ -10,7 +10,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2642,6 +2642,12 @@
+@@ -2640,6 +2640,12 @@
      	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} nis"
    	  fi])
  
diff --git a/package/python/python-110-optional-db.patch b/package/python/python-110-optional-db.patch
index a3e5fe8..ff1979e 100644
--- a/package/python/python-110-optional-db.patch
+++ b/package/python/python-110-optional-db.patch
@@ -16,24 +16,24 @@ Index: b/Makefile.pre.in
 ===================================================================
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -938,7 +938,7 @@
+@@ -932,7 +932,7 @@
  		encodings compiler hotshot \
  		email email/mime \
  		json \
 -		logging bsddb csv importlib wsgiref \
 +		logging csv importlib wsgiref \
- 		ctypes  ctypes/macholib idlelib idlelib/Icons \
+ 		ctypes ctypes/macholib \
+ 		idlelib idlelib/Icons \
  		distutils distutils/command \
- 		multiprocessing multiprocessing/dummy \
-@@ -951,7 +951,6 @@
+@@ -948,7 +948,6 @@
  	test/tracedmodules \
  	email/test email/test/data \
  	json/tests \
 -	bsddb/test \
  	ctypes/test \
+ 	idlelib/idle_test \
  	distutils/tests \
- 	unittest/test
-@@ -991,6 +990,11 @@
+@@ -989,6 +988,11 @@
  LIBSUBDIRS += $(XMLLIBSUBDIRS)
  endif
  
@@ -49,7 +49,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2642,6 +2642,28 @@
+@@ -2640,6 +2640,28 @@
      	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} nis"
    	  fi])
  
diff --git a/package/python/python-111-optional-ssl.patch b/package/python/python-111-optional-ssl.patch
index 8d4599d..cde6bb6 100644
--- a/package/python/python-111-optional-ssl.patch
+++ b/package/python/python-111-optional-ssl.patch
@@ -10,7 +10,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2642,6 +2642,12 @@
+@@ -2640,6 +2640,12 @@
      	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} nis"
    	  fi])
  
diff --git a/package/python/python-112-optional-bzip2.patch b/package/python/python-112-optional-bzip2.patch
index ba7dbaa..1b139bf 100644
--- a/package/python/python-112-optional-bzip2.patch
+++ b/package/python/python-112-optional-bzip2.patch
@@ -9,7 +9,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2648,6 +2648,12 @@
+@@ -2646,6 +2646,12 @@
      	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} ssl"
    	  fi])
  
diff --git a/package/python/python-113-optional-zlib.patch b/package/python/python-113-optional-zlib.patch
index 19f100b..e98265f 100644
--- a/package/python/python-113-optional-zlib.patch
+++ b/package/python/python-113-optional-zlib.patch
@@ -9,7 +9,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2654,6 +2654,12 @@
+@@ -2652,6 +2652,12 @@
              DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} bz2"
           fi])
  
diff --git a/package/python/python.mk b/package/python/python.mk
index 8a2ba65..c005712 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON_VERSION_MAJOR = 2.7
-PYTHON_VERSION       = $(PYTHON_VERSION_MAJOR).6
+PYTHON_VERSION       = $(PYTHON_VERSION_MAJOR).7
 PYTHON_SOURCE        = Python-$(PYTHON_VERSION).tar.xz
 PYTHON_SITE          = http://python.org/ftp/python/$(PYTHON_VERSION)
 PYTHON_LICENSE       = Python software foundation license v2, others
