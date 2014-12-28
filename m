From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Dec 2014 21:54:54 +0100
Subject: [Buildroot] [PATCH 3/4] python: bump to 2.7.9
In-Reply-To: <1419800095-7808-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1419800095-7808-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1419800095-7808-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In addition to doing the bump, this commit also:

 - Refreshes all the patches
 - Removes python-003-properly-detect-if-python-build.patch, which has
   been applied upstream.
 - Passes the --without-ensurepip option, like is done in Python 3, to
   avoid having Python use PIP to automatically download stuff when it
   is being built.
 - PYTHON_LIBTOOL_PATH = NO is added to prevent Buildroot from trying
   to patch a version of libtool for which we don't have matching
   patches, which isn't a problem since we're anyway not using the
   part of the Python sources that uses libtool (it's the built-in
   copy of libffi, and we use the external libffi).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../python-001-remove-host-header-path.patch       |  2 +-
 ...ython-003-properly-detect-if-python-build.patch | 23 ----------------------
 ...python-004-sysconfigdata-install-location.patch | 22 ++++++++++-----------
 .../python/python-005-pyc-pyo-conditional.patch    |  4 ++--
 .../python-006-cross-compile-getaddrinfo.patch     |  2 +-
 package/python/python-007-disable-extensions.patch |  8 ++++----
 .../python/python-009-no-termcap-host-path.patch   |  2 +-
 package/python/python-010-fix-python-config.patch  | 20 +++++++++----------
 .../python/python-011-remove-python-symlink.patch  |  2 +-
 ...on-012-support-library-path-old-compilers.patch |  6 +++---
 .../python-013-dont-add-multiarch-path.patch       |  2 +-
 .../python-014-abort-on-failed-modules.patch       |  2 +-
 .../python-015-fix-sqlite-without-threads.patch    |  7 ++++---
 .../python-016-serial-ioctl-workaround.patch       |  7 ++++---
 .../python/python-100-optional-test-modules.patch  | 17 ++++++++--------
 package/python/python-101-optional-pydoc.patch     | 12 +++++------
 package/python/python-102-optional-2to3.patch      | 14 ++++++-------
 package/python/python-103-optional-sqlite.patch    | 12 +++++------
 package/python/python-104-optional-tk.patch        | 14 ++++++-------
 package/python/python-105-optional-curses.patch    |  8 ++++----
 package/python/python-106-optional-expat.patch     |  8 ++++----
 .../python/python-107-optional-codecs-cjk.patch    |  2 +-
 package/python/python-108-optional-nis.patch       |  2 +-
 .../python/python-109-optional-unicodedata.patch   |  2 +-
 package/python/python-110-optional-db.patch        | 10 +++++-----
 package/python/python-111-optional-ssl.patch       |  2 +-
 package/python/python-112-optional-bzip2.patch     |  2 +-
 package/python/python-113-optional-zlib.patch      |  2 +-
 package/python/python-114-remove-idle-editor.patch |  6 +++---
 package/python/python.mk                           |  3 ++-
 30 files changed, 103 insertions(+), 122 deletions(-)
 delete mode 100644 package/python/python-003-properly-detect-if-python-build.patch

diff --git a/package/python/python-001-remove-host-header-path.patch b/package/python/python-001-remove-host-header-path.patch
index 206751d..dfb84ff 100644
--- a/package/python/python-001-remove-host-header-path.patch
+++ b/package/python/python-001-remove-host-header-path.patch
@@ -21,7 +21,7 @@ Index: b/setup.py
 ===================================================================
 --- a/setup.py
 +++ b/setup.py
-@@ -478,7 +478,7 @@
+@@ -480,7 +480,7 @@
                      for directory in reversed(options.dirs):
                          add_dir_to_list(dir_list, directory)
  
diff --git a/package/python/python-003-properly-detect-if-python-build.patch b/package/python/python-003-properly-detect-if-python-build.patch
deleted file mode 100644
index 3fb865f..0000000
--- a/package/python/python-003-properly-detect-if-python-build.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-distutils: fix build_ext check to find whether we're building Python or not
-
-The build_ext logic uses
-sys.executable.startswith(os.path.join(sys.exec_prefix, "bin")) to
-determine whether we're building a third-party Python extension, or a
-built-in Python extension. However, this check is wrong in
-cross-compilation mode, and instead, the sysconfig.python_build
-variable should be used.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Index: b/Lib/distutils/command/build_ext.py
-===================================================================
---- a/Lib/distutils/command/build_ext.py
-+++ b/Lib/distutils/command/build_ext.py
-@@ -235,7 +235,7 @@
-         # Python's library directory must be appended to library_dirs
-         # See Issues: #1600860, #4366
-         if (sysconfig.get_config_var('Py_ENABLE_SHARED')):
--            if sys.executable.startswith(os.path.join(sys.exec_prefix, "bin")):
-+            if not sysconfig.python_build:
-                 # building third party extensions
-                 self.library_dirs.append(sysconfig.get_config_var('LIBDIR'))
-             else:
diff --git a/package/python/python-004-sysconfigdata-install-location.patch b/package/python/python-004-sysconfigdata-install-location.patch
index e053de3..a72db1a 100644
--- a/package/python/python-004-sysconfigdata-install-location.patch
+++ b/package/python/python-004-sysconfigdata-install-location.patch
@@ -21,17 +21,17 @@ Index: b/Makefile.pre.in
 ===================================================================
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -449,6 +449,9 @@
- # sys.path fixup -- see Modules/getpath.c.
- pybuilddir.txt: $(BUILDPYTHON)
- 		$(RUNSHARED) $(PYTHON_FOR_BUILD) -S -m sysconfig --generate-posix-vars
-+		echo `cat pybuilddir.txt`/sysconfigdata > pysysconfigdatadir.txt
-+		mkdir -p `cat pysysconfigdatadir.txt`
-+		cp `cat pybuilddir.txt`/_sysconfigdata.py `cat pysysconfigdatadir.txt`
+@@ -462,6 +462,9 @@
+ 		rm -f ./pybuilddir.txt ; \
+ 		exit 1 ; \
+ 	fi
++	echo `cat pybuilddir.txt`/sysconfigdata > pysysconfigdatadir.txt
++	mkdir -p `cat pysysconfigdatadir.txt`
++	cp `cat pybuilddir.txt`/_sysconfigdata.py `cat pysysconfigdatadir.txt`
  
  # Build the shared modules
  # Under GNU make, MAKEFLAGS are sorted and normalized; the 's' for
-@@ -969,7 +972,7 @@
+@@ -1002,7 +1005,7 @@
  		else	true; \
  		fi; \
  	done
@@ -40,7 +40,7 @@ Index: b/Makefile.pre.in
  	do \
  		if test -x $$i; then \
  			$(INSTALL_SCRIPT) $$i $(DESTDIR)$(LIBDEST); \
-@@ -979,6 +982,11 @@
+@@ -1012,6 +1015,11 @@
  			echo $(INSTALL_DATA) $$i $(LIBDEST); \
  		fi; \
  	done
@@ -52,7 +52,7 @@ Index: b/Makefile.pre.in
  	@for d in $(LIBSUBDIRS); \
  	do \
  		a=$(srcdir)/Lib/$$d; \
-@@ -1304,7 +1312,7 @@
+@@ -1337,7 +1345,7 @@
  		Modules/Setup Modules/Setup.local Modules/Setup.config \
  		Modules/ld_so_aix Modules/python.exp Misc/python.pc
  	-rm -f python*-gdb.py
@@ -65,7 +65,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -30,7 +30,7 @@
+@@ -33,7 +33,7 @@
  	    AC_MSG_ERROR([python$PACKAGE_VERSION interpreter not found])
  	fi
          AC_MSG_RESULT($interp)
diff --git a/package/python/python-005-pyc-pyo-conditional.patch b/package/python/python-005-pyc-pyo-conditional.patch
index fbcdaa6..0a2f727 100644
--- a/package/python/python-005-pyc-pyo-conditional.patch
+++ b/package/python/python-005-pyc-pyo-conditional.patch
@@ -2,7 +2,7 @@ Index: b/Makefile.pre.in
 ===================================================================
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1017,24 +1017,32 @@
+@@ -1050,24 +1050,32 @@
  		$(INSTALL_DATA) $(srcdir)/Modules/xxmodule.c \
  			$(DESTDIR)$(LIBDEST)/distutils/tests ; \
  	fi
@@ -39,7 +39,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -733,6 +733,17 @@
+@@ -736,6 +736,17 @@
      ;;
  esac
  
diff --git a/package/python/python-006-cross-compile-getaddrinfo.patch b/package/python/python-006-cross-compile-getaddrinfo.patch
index ff05095..ba6e6f0 100644
--- a/package/python/python-006-cross-compile-getaddrinfo.patch
+++ b/package/python/python-006-cross-compile-getaddrinfo.patch
@@ -2,7 +2,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3343,7 +3343,7 @@
+@@ -3346,7 +3346,7 @@
  
  AC_MSG_RESULT($ac_cv_buggy_getaddrinfo)
  
diff --git a/package/python/python-007-disable-extensions.patch b/package/python/python-007-disable-extensions.patch
index 40ed6df..be4d943 100644
--- a/package/python/python-007-disable-extensions.patch
+++ b/package/python/python-007-disable-extensions.patch
@@ -2,7 +2,7 @@ Index: b/Makefile.pre.in
 ===================================================================
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -153,6 +153,8 @@
+@@ -156,6 +156,8 @@
  # configure script arguments
  CONFIG_ARGS=	@CONFIG_ARGS@
  
@@ -11,7 +11,7 @@ Index: b/Makefile.pre.in
  
  # Subdirectories with code
  SRCDIRS= 	@SRCDIRS@
-@@ -464,6 +466,7 @@
+@@ -477,6 +479,7 @@
  	esac; \
  	$(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' \
  		_TCLTK_INCLUDES='$(TCLTK_INCLUDES)' _TCLTK_LIBS='$(TCLTK_LIBS)' \
@@ -19,7 +19,7 @@ Index: b/Makefile.pre.in
  		$(PYTHON_FOR_BUILD) $(srcdir)/setup.py $$quiet build
  
  # Build static library
-@@ -1158,7 +1161,8 @@
+@@ -1191,7 +1194,8 @@
  # Install the dynamically loadable modules
  # This goes into $(exec_prefix)
  sharedinstall: sharedmods
@@ -33,7 +33,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2281,6 +2281,8 @@
+@@ -2284,6 +2284,8 @@
  
  AC_PATH_TOOL([PKG_CONFIG], [pkg-config])
  
diff --git a/package/python/python-009-no-termcap-host-path.patch b/package/python/python-009-no-termcap-host-path.patch
index fadc7b3..781e179 100644
--- a/package/python/python-009-no-termcap-host-path.patch
+++ b/package/python/python-009-no-termcap-host-path.patch
@@ -7,7 +7,7 @@ Index: b/setup.py
 ===================================================================
 --- a/setup.py
 +++ b/setup.py
-@@ -762,12 +762,9 @@
+@@ -764,12 +764,9 @@
                  pass # Issue 7384: Already linked against curses or tinfo.
              elif curses_library:
                  readline_libs.append(curses_library)
diff --git a/package/python/python-010-fix-python-config.patch b/package/python/python-010-fix-python-config.patch
index 97ff157..2beb233 100644
--- a/package/python/python-010-fix-python-config.patch
+++ b/package/python/python-010-fix-python-config.patch
@@ -10,7 +10,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -879,6 +879,7 @@
+@@ -882,6 +882,7 @@
  
  # Other platforms follow
  if test $enable_shared = "yes"; then
@@ -18,7 +18,7 @@ Index: b/configure.ac
    AC_DEFINE(Py_ENABLE_SHARED, 1, [Defined if Python is built as a shared library.])
    case $ac_sys_system in
      BeOS*)
-@@ -939,6 +940,7 @@
+@@ -942,6 +943,7 @@
  
    esac
  else # shared is disabled
@@ -26,7 +26,7 @@ Index: b/configure.ac
    case $ac_sys_system in
      CYGWIN*)
            BLDLIBRARY='$(LIBRARY)'
-@@ -1915,6 +1917,9 @@
+@@ -1918,6 +1920,9 @@
  AC_SUBST(BLDSHARED)
  AC_SUBST(CCSHARED)
  AC_SUBST(LINKFORSHARED)
@@ -36,8 +36,8 @@ Index: b/configure.ac
  # SO is the extension of shared libraries `(including the dot!)
  # -- usually .so, .sl on HP-UX, .dll on Cygwin
  AC_MSG_CHECKING(SO)
-@@ -4563,7 +4568,7 @@
- AC_MSG_RESULT(done)
+@@ -4581,7 +4586,7 @@
+ AC_SUBST(ENSUREPIP)
  
  # generate output files
 -AC_CONFIG_FILES(Makefile.pre Modules/Setup.config Misc/python.pc)
@@ -49,7 +49,7 @@ Index: b/Makefile.pre.in
 ===================================================================
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -163,7 +163,7 @@
+@@ -166,7 +166,7 @@
  SUBDIRSTOO=	Include Lib Misc Demo
  
  # Files and directories to be distributed
@@ -58,7 +58,7 @@ Index: b/Makefile.pre.in
  DISTFILES=	README ChangeLog $(CONFIGFILES)
  DISTDIRS=	$(SUBDIRS) $(SUBDIRSTOO) Ext-dummy
  DIST=		$(DISTFILES) $(DISTDIRS)
-@@ -407,7 +407,7 @@
+@@ -410,7 +410,7 @@
  
  # Default target
  all:		build_all
@@ -67,7 +67,7 @@ Index: b/Makefile.pre.in
  
  # Compile a binary with gcc profile guided optimization.
  profile-opt:
-@@ -1068,10 +1068,12 @@
+@@ -1101,10 +1101,12 @@
  	fi; \
  	cd $(srcdir)/Lib/$(PLATDIR); $(RUNSHARED) ./regen
  
@@ -82,7 +82,7 @@ Index: b/Makefile.pre.in
  
  # Install the include files
  INCLDIRSTOMAKE=$(INCLUDEDIR) $(CONFINCLUDEDIR) $(INCLUDEPY) $(CONFINCLUDEPY)
-@@ -1130,7 +1132,7 @@
+@@ -1163,7 +1165,7 @@
  	$(INSTALL_SCRIPT) $(srcdir)/Modules/makesetup $(DESTDIR)$(LIBPL)/makesetup
  	$(INSTALL_SCRIPT) $(srcdir)/install-sh $(DESTDIR)$(LIBPL)/install-sh
  	$(INSTALL_SCRIPT) python-config $(DESTDIR)$(BINDIR)/python$(VERSION)-config
@@ -91,7 +91,7 @@ Index: b/Makefile.pre.in
  	@if [ -s Modules/python.exp -a \
  		"`echo $(MACHDEP) | sed 's/^\(...\).*/\1/'`" = "aix" ]; then \
  		echo; echo "Installing support files for building shared extension modules on AIX:"; \
-@@ -1312,6 +1314,7 @@
+@@ -1345,6 +1347,7 @@
  		config.cache config.log pyconfig.h Modules/config.c
  	-rm -rf build platform
  	-rm -rf $(PYTHONFRAMEWORKDIR)
diff --git a/package/python/python-011-remove-python-symlink.patch b/package/python/python-011-remove-python-symlink.patch
index af0a296..b0548c3 100644
--- a/package/python/python-011-remove-python-symlink.patch
+++ b/package/python/python-011-remove-python-symlink.patch
@@ -10,7 +10,7 @@ Index: b/Makefile.pre.in
 ===================================================================
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -858,17 +858,10 @@
+@@ -890,17 +890,10 @@
  #  $(PYTHON) -> python2 -> python$(VERSION))
  # Also create equivalent chains for other installed files
  bininstall:	altbininstall
diff --git a/package/python/python-012-support-library-path-old-compilers.patch b/package/python/python-012-support-library-path-old-compilers.patch
index 6c48d1b..9803821 100644
--- a/package/python/python-012-support-library-path-old-compilers.patch
+++ b/package/python/python-012-support-library-path-old-compilers.patch
@@ -20,7 +20,7 @@ Index: b/setup.py
 ===================================================================
 --- a/setup.py
 +++ b/setup.py
-@@ -416,6 +416,7 @@
+@@ -418,6 +418,7 @@
          in_incdirs = False
          inc_dirs = []
          lib_dirs = []
@@ -28,7 +28,7 @@ Index: b/setup.py
          try:
              if ret >> 8 == 0:
                  with open(tmpfile) as fp:
-@@ -427,6 +428,7 @@
+@@ -429,6 +430,7 @@
                          elif line.startswith("End of search list"):
                              in_incdirs = False
                          elif is_gcc and line.startswith("LIBRARY_PATH"):
@@ -36,7 +36,7 @@ Index: b/setup.py
                              for d in line.strip().split("=")[1].split(":"):
                                  d = os.path.normpath(d)
                                  if '/gcc/' not in d:
-@@ -438,6 +440,15 @@
+@@ -440,6 +442,15 @@
          finally:
              os.unlink(tmpfile)
  
diff --git a/package/python/python-013-dont-add-multiarch-path.patch b/package/python/python-013-dont-add-multiarch-path.patch
index 0ab38ac..24e7af9 100644
--- a/package/python/python-013-dont-add-multiarch-path.patch
+++ b/package/python/python-013-dont-add-multiarch-path.patch
@@ -14,7 +14,7 @@ Index: b/setup.py
 ===================================================================
 --- a/setup.py
 +++ b/setup.py
-@@ -454,9 +454,9 @@
+@@ -456,9 +456,9 @@
          if not cross_compiling:
              add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
              add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
diff --git a/package/python/python-014-abort-on-failed-modules.patch b/package/python/python-014-abort-on-failed-modules.patch
index 2031e20..4bceeb6 100644
--- a/package/python/python-014-abort-on-failed-modules.patch
+++ b/package/python/python-014-abort-on-failed-modules.patch
@@ -11,7 +11,7 @@ Index: b/setup.py
 ===================================================================
 --- a/setup.py
 +++ b/setup.py
-@@ -281,6 +281,7 @@
+@@ -283,6 +283,7 @@
              print "Failed to build these modules:"
              print_three_column(failed)
              print
diff --git a/package/python/python-015-fix-sqlite-without-threads.patch b/package/python/python-015-fix-sqlite-without-threads.patch
index 805edff..f51c37b 100644
--- a/package/python/python-015-fix-sqlite-without-threads.patch
+++ b/package/python/python-015-fix-sqlite-without-threads.patch
@@ -35,9 +35,10 @@ is never the last statement of the function.
 
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 
-diff -durN python-2.7.8.orig/Modules/_sqlite/connection.c python-2.7.8/Modules/_sqlite/connection.c
---- python-2.7.8.orig/Modules/_sqlite/connection.c	2014-06-30 04:05:42.000000000 +0200
-+++ python-2.7.8/Modules/_sqlite/connection.c	2014-07-12 13:53:32.258041224 +0200
+Index: b/Modules/_sqlite/connection.c
+===================================================================
+--- a/Modules/_sqlite/connection.c
++++ b/Modules/_sqlite/connection.c
 @@ -786,6 +786,7 @@
  #ifdef WITH_THREAD
      PyGILState_Release(threadstate);
diff --git a/package/python/python-016-serial-ioctl-workaround.patch b/package/python/python-016-serial-ioctl-workaround.patch
index 9ff775f..80ed65e 100644
--- a/package/python/python-016-serial-ioctl-workaround.patch
+++ b/package/python/python-016-serial-ioctl-workaround.patch
@@ -8,9 +8,10 @@ but isn't actually referenced in modern kernels.
 
 Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 ---
-diff -Nuar Python-2.7.8-orig/Modules/termios.c Python-2.7.8/Modules/termios.c
---- Python-2.7.8-orig/Modules/termios.c	2014-06-30 05:05:44.000000000 +0300
-+++ Python-2.7.8/Modules/termios.c	2014-07-18 06:16:43.393010357 +0300
+Index: b/Modules/termios.c
+===================================================================
+--- a/Modules/termios.c
++++ b/Modules/termios.c
 @@ -16,7 +16,9 @@
   * so this needs to be included first on that platform. */
  #include <termio.h>
diff --git a/package/python/python-100-optional-test-modules.patch b/package/python/python-100-optional-test-modules.patch
index 33bc5f8..1180b29 100644
--- a/package/python/python-100-optional-test-modules.patch
+++ b/package/python/python-100-optional-test-modules.patch
@@ -15,19 +15,21 @@ Index: b/Makefile.pre.in
 ===================================================================
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -928,26 +928,42 @@
+@@ -960,27 +960,43 @@
  	plat-mac/lib-scriptpackages/SystemEvents \
  	plat-mac/lib-scriptpackages/Terminal
  PLATMACPATH=:plat-mac:plat-mac/lib-scriptpackages
 -LIBSUBDIRS=	lib-tk lib-tk/test lib-tk/test/test_tkinter \
--		lib-tk/test/test_ttk site-packages test test/audiodata test/data \
--		test/cjkencodings test/decimaltestdata test/xmltestdata \
+-		lib-tk/test/test_ttk site-packages test test/audiodata test/capath \
+-		test/data test/cjkencodings test/decimaltestdata test/xmltestdata \
 -		test/imghdrdata \
 -		test/subprocessdata \
 -		test/tracedmodules \
 +LIBSUBDIRS=	lib-tk site-packages \
  		encodings compiler hotshot \
 -		email email/mime email/test email/test/data \
++		email email/mime \
+ 		ensurepip ensurepip/_bundled \
 -		json json/tests \
 -		sqlite3 sqlite3/test \
 -		logging bsddb bsddb/test csv importlib wsgiref \
@@ -36,9 +38,8 @@ Index: b/Makefile.pre.in
 -		ctypes ctypes/test ctypes/macholib \
 -		idlelib idlelib/Icons idlelib/idle_test \
 -		distutils distutils/command distutils/tests $(XMLLIBSUBDIRS) \
-+		email email/mime \
 +		json \
-+		sqlite3 \
++		sqlite3  \
 +		logging bsddb csv importlib wsgiref \
 +		lib2to3 lib2to3/fixes lib2to3/pgen2 \
 +		ctypes ctypes/macholib \
@@ -51,7 +52,7 @@ Index: b/Makefile.pre.in
  		curses pydoc_data $(MACHDEPS)
 +
 +TESTSUBDIRS = lib-tk/test lib-tk/test/test_tkinter \
-+	lib-tk/test/test_ttk test test/audiodata test/data \
++	lib-tk/test/test_ttk test test/audiodata test/capath test/data \
 +	test/cjkencodings test/decimaltestdata test/xmltestdata \
 +	test/imghdrdata \
 +	test/subprocessdata \
@@ -61,7 +62,7 @@ Index: b/Makefile.pre.in
 +	sqlite3/test \
 +	bsddb/test \
 +	lib2to3/tests \
-+	lib2to3/tests/data lib2to3/tests/data/fixers lib2to3/tests/data/fixers/myfixes \
++ 	lib2to3/tests/data lib2to3/tests/data/fixers lib2to3/tests/data/fixers/myfixes \
 +	ctypes/test \
 +	idlelib/idle_test \
 +	distutils/tests \
@@ -78,7 +79,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2625,6 +2625,12 @@
+@@ -2628,6 +2628,12 @@
  fi
  
  
diff --git a/package/python/python-101-optional-pydoc.patch b/package/python/python-101-optional-pydoc.patch
index cb8631a..d5dc3d7 100644
--- a/package/python/python-101-optional-pydoc.patch
+++ b/package/python/python-101-optional-pydoc.patch
@@ -16,7 +16,7 @@ Index: b/Makefile.pre.in
 ===================================================================
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -941,7 +941,7 @@
+@@ -974,7 +974,7 @@
  		multiprocessing multiprocessing/dummy \
  		unittest \
  		lib-old \
@@ -24,8 +24,8 @@ Index: b/Makefile.pre.in
 +		curses $(MACHDEPS)
  
  TESTSUBDIRS = lib-tk/test lib-tk/test/test_tkinter \
- 	lib-tk/test/test_ttk test test/audiodata test/data \
-@@ -964,6 +964,10 @@
+ 	lib-tk/test/test_ttk test test/audiodata test/capath test/data \
+@@ -997,6 +997,10 @@
  LIBSUBDIRS += $(TESTSUBDIRS)
  endif
  
@@ -40,7 +40,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2624,6 +2624,11 @@
+@@ -2627,6 +2627,11 @@
        AC_CHECK_FUNCS(pthread_atfork)
  fi
  
@@ -56,7 +56,7 @@ Index: b/setup.py
 ===================================================================
 --- a/setup.py
 +++ b/setup.py
-@@ -2219,6 +2219,12 @@
+@@ -2222,6 +2222,12 @@
      # turn off warnings when deprecated modules are imported
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
@@ -69,7 +69,7 @@ Index: b/setup.py
      setup(# PyPI Metadata (PEP 301)
            name = "Python",
            version = sys.version.split()[0],
-@@ -2239,9 +2245,7 @@
+@@ -2242,9 +2248,7 @@
            ext_modules=[Extension('_struct', ['_struct.c'])],
  
            # Scripts to install
diff --git a/package/python/python-102-optional-2to3.patch b/package/python/python-102-optional-2to3.patch
index 0d23ca3..76edfa1 100644
--- a/package/python/python-102-optional-2to3.patch
+++ b/package/python/python-102-optional-2to3.patch
@@ -16,24 +16,24 @@ Index: b/Makefile.pre.in
 ===================================================================
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -934,7 +934,6 @@
+@@ -967,7 +967,6 @@
  		json \
- 		sqlite3 \
+ 		sqlite3  \
  		logging bsddb csv importlib wsgiref \
 -		lib2to3 lib2to3/fixes lib2to3/pgen2 \
  		ctypes ctypes/macholib \
  		idlelib idlelib/Icons \
  		distutils distutils/command $(XMLLIBSUBDIRS) \
-@@ -953,8 +952,6 @@
+@@ -986,8 +985,6 @@
  	json/tests \
  	sqlite3/test \
  	bsddb/test \
 -	lib2to3/tests \
--	lib2to3/tests/data lib2to3/tests/data/fixers lib2to3/tests/data/fixers/myfixes \
+- 	lib2to3/tests/data lib2to3/tests/data/fixers lib2to3/tests/data/fixers/myfixes \
  	ctypes/test \
  	idlelib/idle_test \
  	distutils/tests \
-@@ -968,6 +965,14 @@
+@@ -1001,6 +998,14 @@
  LIBSUBDIRS += pydoc_data
  endif
  
@@ -52,7 +52,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2636,6 +2636,12 @@
+@@ -2639,6 +2639,12 @@
  	AS_HELP_STRING([--disable-test-modules], [disable test modules]),
  	[ TEST_MODULES="${enableval}" ], [ TEST_MODULES=yes ])
  
@@ -69,7 +69,7 @@ Index: b/setup.py
 ===================================================================
 --- a/setup.py
 +++ b/setup.py
-@@ -2220,10 +2220,11 @@
+@@ -2223,10 +2223,11 @@
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
  
diff --git a/package/python/python-103-optional-sqlite.patch b/package/python/python-103-optional-sqlite.patch
index 1e17530..eb43c7a 100644
--- a/package/python/python-103-optional-sqlite.patch
+++ b/package/python/python-103-optional-sqlite.patch
@@ -12,7 +12,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2624,6 +2624,15 @@
+@@ -2627,6 +2627,15 @@
        AC_CHECK_FUNCS(pthread_atfork)
  fi
  
@@ -32,15 +32,15 @@ Index: b/Makefile.pre.in
 ===================================================================
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -932,7 +932,6 @@
- 		encodings compiler hotshot \
+@@ -965,7 +965,6 @@
  		email email/mime \
+ 		ensurepip ensurepip/_bundled \
  		json \
--		sqlite3 \
+-		sqlite3  \
  		logging bsddb csv importlib wsgiref \
  		ctypes ctypes/macholib \
  		idlelib idlelib/Icons \
-@@ -950,7 +949,6 @@
+@@ -983,7 +982,6 @@
  	test/tracedmodules \
  	email/test email/test/data \
  	json/tests \
@@ -48,7 +48,7 @@ Index: b/Makefile.pre.in
  	bsddb/test \
  	ctypes/test \
  	idlelib/idle_test \
-@@ -973,6 +971,11 @@
+@@ -1006,6 +1004,11 @@
  		lib2to3/tests/data/fixers/myfixes
  endif
  
diff --git a/package/python/python-104-optional-tk.patch b/package/python/python-104-optional-tk.patch
index 298c91d..f402e42 100644
--- a/package/python/python-104-optional-tk.patch
+++ b/package/python/python-104-optional-tk.patch
@@ -12,7 +12,7 @@ Index: b/Makefile.pre.in
 ===================================================================
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -928,7 +928,7 @@
+@@ -960,7 +960,7 @@
  	plat-mac/lib-scriptpackages/SystemEvents \
  	plat-mac/lib-scriptpackages/Terminal
  PLATMACPATH=:plat-mac:plat-mac/lib-scriptpackages
@@ -20,18 +20,18 @@ Index: b/Makefile.pre.in
 +LIBSUBDIRS=	site-packages \
  		encodings compiler hotshot \
  		email email/mime \
- 		json \
-@@ -941,8 +941,7 @@
+ 		ensurepip ensurepip/_bundled \
+@@ -974,8 +974,7 @@
  		lib-old \
  		curses $(MACHDEPS)
  
 -TESTSUBDIRS = lib-tk/test lib-tk/test/test_tkinter \
--	lib-tk/test/test_ttk test test/audiodata test/data \
-+TESTSUBDIRS = test test/audiodata test/data \
+-	lib-tk/test/test_ttk test test/audiodata test/capath test/data \
++TESTSUBDIRS = test test/audiodata test/capath test/data \
  	test/cjkencodings test/decimaltestdata test/xmltestdata \
  	test/imghdrdata \
  	test/subprocessdata \
-@@ -976,6 +975,12 @@
+@@ -1009,6 +1008,12 @@
  TESTSUBDIRS += sqlite3/test
  endif
  
@@ -48,7 +48,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2633,6 +2633,15 @@
+@@ -2636,6 +2636,15 @@
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
  fi
  
diff --git a/package/python/python-105-optional-curses.patch b/package/python/python-105-optional-curses.patch
index 00f2266..a73fb04 100644
--- a/package/python/python-105-optional-curses.patch
+++ b/package/python/python-105-optional-curses.patch
@@ -12,16 +12,16 @@ Index: b/Makefile.pre.in
 ===================================================================
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -939,7 +939,7 @@
+@@ -972,7 +972,7 @@
  		multiprocessing multiprocessing/dummy \
  		unittest \
  		lib-old \
 -		curses $(MACHDEPS)
 +		$(MACHDEPS)
  
- TESTSUBDIRS = test test/audiodata test/data \
+ TESTSUBDIRS = test test/audiodata test/capath test/data \
  	test/cjkencodings test/decimaltestdata test/xmltestdata \
-@@ -981,6 +981,10 @@
+@@ -1014,6 +1014,10 @@
  	      lib-tk/test/test_ttk
  endif
  
@@ -36,7 +36,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2642,6 +2642,15 @@
+@@ -2645,6 +2645,15 @@
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _tkinter"
  fi
  
diff --git a/package/python/python-106-optional-expat.patch b/package/python/python-106-optional-expat.patch
index d80dee4..1ee117c 100644
--- a/package/python/python-106-optional-expat.patch
+++ b/package/python/python-106-optional-expat.patch
@@ -19,7 +19,7 @@ Index: b/Makefile.pre.in
 ===================================================================
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -935,7 +935,7 @@
+@@ -968,7 +968,7 @@
  		logging bsddb csv importlib wsgiref \
  		ctypes ctypes/macholib \
  		idlelib idlelib/Icons \
@@ -28,7 +28,7 @@ Index: b/Makefile.pre.in
  		multiprocessing multiprocessing/dummy \
  		unittest \
  		lib-old \
-@@ -985,6 +985,10 @@
+@@ -1018,6 +1018,10 @@
  LIBSUBDIRS += curses
  endif
  
@@ -43,7 +43,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2289,13 +2289,21 @@
+@@ -2292,13 +2292,21 @@
  AC_SUBST(DISABLED_EXTENSIONS)
  
  # Check for use of the system expat library
@@ -74,7 +74,7 @@ Index: b/setup.py
 ===================================================================
 --- a/setup.py
 +++ b/setup.py
-@@ -1471,7 +1471,7 @@
+@@ -1474,7 +1474,7 @@
          #
          # More information on Expat can be found at www.libexpat.org.
          #
diff --git a/package/python/python-107-optional-codecs-cjk.patch b/package/python/python-107-optional-codecs-cjk.patch
index 132b4bd..6329b0c 100644
--- a/package/python/python-107-optional-codecs-cjk.patch
+++ b/package/python/python-107-optional-codecs-cjk.patch
@@ -10,7 +10,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2641,6 +2641,12 @@
+@@ -2644,6 +2644,12 @@
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
  fi
  
diff --git a/package/python/python-108-optional-nis.patch b/package/python/python-108-optional-nis.patch
index 12aa2f1..f07bbb6 100644
--- a/package/python/python-108-optional-nis.patch
+++ b/package/python/python-108-optional-nis.patch
@@ -13,7 +13,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2647,6 +2647,12 @@
+@@ -2650,6 +2650,12 @@
      	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _codecs_kr _codecs_jp _codecs_cn _codecs_tw _codecs_hk"
    	  fi])
  
diff --git a/package/python/python-109-optional-unicodedata.patch b/package/python/python-109-optional-unicodedata.patch
index 99a0daa..10da1ea 100644
--- a/package/python/python-109-optional-unicodedata.patch
+++ b/package/python/python-109-optional-unicodedata.patch
@@ -10,7 +10,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2653,6 +2653,12 @@
+@@ -2656,6 +2656,12 @@
      	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} nis"
    	  fi])
  
diff --git a/package/python/python-110-optional-db.patch b/package/python/python-110-optional-db.patch
index baee963..4b54e24 100644
--- a/package/python/python-110-optional-db.patch
+++ b/package/python/python-110-optional-db.patch
@@ -16,16 +16,16 @@ Index: b/Makefile.pre.in
 ===================================================================
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -932,7 +932,7 @@
- 		encodings compiler hotshot \
+@@ -965,7 +965,7 @@
  		email email/mime \
+ 		ensurepip ensurepip/_bundled \
  		json \
 -		logging bsddb csv importlib wsgiref \
 +		logging csv importlib wsgiref \
  		ctypes ctypes/macholib \
  		idlelib idlelib/Icons \
  		distutils distutils/command \
-@@ -948,7 +948,6 @@
+@@ -981,7 +981,6 @@
  	test/tracedmodules \
  	email/test email/test/data \
  	json/tests \
@@ -33,7 +33,7 @@ Index: b/Makefile.pre.in
  	ctypes/test \
  	idlelib/idle_test \
  	distutils/tests \
-@@ -989,6 +988,11 @@
+@@ -1022,6 +1021,11 @@
  LIBSUBDIRS += $(XMLLIBSUBDIRS)
  endif
  
@@ -49,7 +49,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2653,6 +2653,28 @@
+@@ -2656,6 +2656,28 @@
      	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} nis"
    	  fi])
  
diff --git a/package/python/python-111-optional-ssl.patch b/package/python/python-111-optional-ssl.patch
index 5b20747..72891cd 100644
--- a/package/python/python-111-optional-ssl.patch
+++ b/package/python/python-111-optional-ssl.patch
@@ -10,7 +10,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2653,6 +2653,12 @@
+@@ -2656,6 +2656,12 @@
      	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} nis"
    	  fi])
  
diff --git a/package/python/python-112-optional-bzip2.patch b/package/python/python-112-optional-bzip2.patch
index eeb3303..3a646e1 100644
--- a/package/python/python-112-optional-bzip2.patch
+++ b/package/python/python-112-optional-bzip2.patch
@@ -9,7 +9,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2659,6 +2659,12 @@
+@@ -2662,6 +2662,12 @@
      	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} ssl"
    	  fi])
  
diff --git a/package/python/python-113-optional-zlib.patch b/package/python/python-113-optional-zlib.patch
index b93c983..a4ca8bd 100644
--- a/package/python/python-113-optional-zlib.patch
+++ b/package/python/python-113-optional-zlib.patch
@@ -9,7 +9,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2665,6 +2665,12 @@
+@@ -2668,6 +2668,12 @@
              DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} bz2"
           fi])
  
diff --git a/package/python/python-114-remove-idle-editor.patch b/package/python/python-114-remove-idle-editor.patch
index 9aba15c..67b9050 100644
--- a/package/python/python-114-remove-idle-editor.patch
+++ b/package/python/python-114-remove-idle-editor.patch
@@ -12,7 +12,7 @@ Index: b/Makefile.pre.in
 ===================================================================
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -934,7 +934,6 @@
+@@ -967,7 +967,6 @@
  		json \
  		logging csv importlib wsgiref \
  		ctypes ctypes/macholib \
@@ -20,7 +20,7 @@ Index: b/Makefile.pre.in
  		distutils distutils/command \
  		multiprocessing multiprocessing/dummy \
  		unittest \
-@@ -949,7 +948,6 @@
+@@ -982,7 +981,6 @@
  	email/test email/test/data \
  	json/tests \
  	ctypes/test \
@@ -32,7 +32,7 @@ Index: b/setup.py
 ===================================================================
 --- a/setup.py
 +++ b/setup.py
-@@ -2220,7 +2220,7 @@
+@@ -2223,7 +2223,7 @@
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
  
diff --git a/package/python/python.mk b/package/python/python.mk
index 3db31d3..45b1f7f 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -5,11 +5,12 @@
 ################################################################################
 
 PYTHON_VERSION_MAJOR = 2.7
-PYTHON_VERSION = $(PYTHON_VERSION_MAJOR).8
+PYTHON_VERSION = $(PYTHON_VERSION_MAJOR).9
 PYTHON_SOURCE = Python-$(PYTHON_VERSION).tar.xz
 PYTHON_SITE = http://python.org/ftp/python/$(PYTHON_VERSION)
 PYTHON_LICENSE = Python software foundation license v2, others
 PYTHON_LICENSE_FILES = LICENSE
+PYTHON_LIBTOOL_PATCH = NO
 
 # Python needs itself to be built, so in order to cross-compile
 # Python, we need to build a host Python first. This host Python is
-- 
2.1.0
