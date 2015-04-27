From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Apr 2015 00:26:46 +0200
Subject: [Buildroot] [git commit] python3: bump to version 3.4.3
Message-ID: <20150427222741.19A9F819BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6afba01e5dc5ed536e33a46d40fd970cfd40f243
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

All patches are simply refreshed, except
002-properly-detect-if-python-build.patch which is removed because an
identical fix has been merged upstream:

  https://github.com/python/cpython/commit/e128ea78e5964929ca902bebc07c242d58609dfc

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../002-properly-detect-if-python-build.patch      |   23 --------------------
 .../003-sysconfigdata-install-location.patch       |    8 +++---
 package/python3/004-old-stdlib-cache.patch         |    2 +-
 package/python3/005-pyc-pyo-conditional.patch      |    2 +-
 .../python3/006-cross-compile-getaddrinfo.patch    |    2 +-
 package/python3/007-disable-extensions.patch       |    8 +++---
 package/python3/012-dont-add-multiarch-path.patch  |    2 +-
 package/python3/014-serial-ioctl-workaround.patch  |    7 +++--
 .../python3/017-python-config-include-libdir.patch |   11 +++------
 .../018-ncursesw-remove-wrong-includedir.patch     |    2 +-
 package/python3/100-optional-test-modules.patch    |    6 ++--
 package/python3/101-optional-pydoc.patch           |   12 +++++-----
 package/python3/102-optional-2to3.patch            |   14 ++++++------
 package/python3/103-optional-sqlite.patch          |    8 +++---
 package/python3/104-optional-tk.patch              |    8 +++---
 package/python3/105-optional-curses.patch          |    6 ++--
 package/python3/106-optional-expat.patch           |    8 +++---
 package/python3/107-optional-codecs-cjk.patch      |    2 +-
 package/python3/108-optional-nis.patch             |    2 +-
 package/python3/109-optional-unicodedata.patch     |    2 +-
 package/python3/110-optional-idle.patch            |   10 ++++----
 package/python3/111-optional-decimal.patch         |    4 +-
 package/python3/112-optional-ossaudiodev.patch     |    2 +-
 package/python3/python3.mk                         |    2 +-
 24 files changed, 64 insertions(+), 89 deletions(-)

diff --git a/package/python3/002-properly-detect-if-python-build.patch b/package/python3/002-properly-detect-if-python-build.patch
deleted file mode 100644
index e8ccd36..0000000
--- a/package/python3/002-properly-detect-if-python-build.patch
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
-@@ -237,7 +237,7 @@
-         # Python's library directory must be appended to library_dirs
-         # See Issues: #1600860, #4366
-         if (sysconfig.get_config_var('Py_ENABLE_SHARED')):
--            if sys.executable.startswith(os.path.join(sys.exec_prefix, "bin")):
-+            if not sysconfig.python_build:
-                 # building third party extensions
-                 self.library_dirs.append(sysconfig.get_config_var('LIBDIR'))
-             else:
diff --git a/package/python3/003-sysconfigdata-install-location.patch b/package/python3/003-sysconfigdata-install-location.patch
index dfcadf5..cd01ccf 100644
--- a/package/python3/003-sysconfigdata-install-location.patch
+++ b/package/python3/003-sysconfigdata-install-location.patch
@@ -21,7 +21,7 @@ Index: b/Makefile.pre.in
 ===================================================================
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -558,6 +558,9 @@
+@@ -559,6 +559,9 @@
  		rm -f ./pybuilddir.txt ; \
  		exit 1 ; \
  	fi
@@ -31,7 +31,7 @@ Index: b/Makefile.pre.in
  
  # Build the shared modules
  # Under GNU make, MAKEFLAGS are sorted and normalized; the 's' for
-@@ -1196,7 +1199,7 @@
+@@ -1197,7 +1200,7 @@
  		else	true; \
  		fi; \
  	done
@@ -40,7 +40,7 @@ Index: b/Makefile.pre.in
  	do \
  		if test -x $$i; then \
  			$(INSTALL_SCRIPT) $$i $(DESTDIR)$(LIBDEST); \
-@@ -1206,6 +1209,11 @@
+@@ -1207,6 +1210,11 @@
  			echo $(INSTALL_DATA) $$i $(LIBDEST); \
  		fi; \
  	done
@@ -52,7 +52,7 @@ Index: b/Makefile.pre.in
  	@for d in $(LIBSUBDIRS); \
  	do \
  		a=$(srcdir)/Lib/$$d; \
-@@ -1529,7 +1537,7 @@
+@@ -1533,7 +1541,7 @@
  	find build -name 'fficonfig.h' -exec rm -f {} ';' || true
  	find build -name '*.py' -exec rm -f {} ';' || true
  	find build -name '*.py[co]' -exec rm -f {} ';' || true
diff --git a/package/python3/004-old-stdlib-cache.patch b/package/python3/004-old-stdlib-cache.patch
index 4ed994d..9ed7e59 100644
--- a/package/python3/004-old-stdlib-cache.patch
+++ b/package/python3/004-old-stdlib-cache.patch
@@ -50,7 +50,7 @@ Index: b/Makefile.pre.in
  # Environment to run shared python without installed libraries
  RUNSHARED=       @RUNSHARED@
  
-@@ -1246,21 +1249,21 @@
+@@ -1247,21 +1250,21 @@
  	fi
  	-PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
  		$(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py \
diff --git a/package/python3/005-pyc-pyo-conditional.patch b/package/python3/005-pyc-pyo-conditional.patch
index 42dfa2f..c3b159d 100644
--- a/package/python3/005-pyc-pyo-conditional.patch
+++ b/package/python3/005-pyc-pyo-conditional.patch
@@ -2,7 +2,7 @@ Index: b/Makefile.pre.in
 ===================================================================
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1247,24 +1247,32 @@
+@@ -1248,24 +1248,32 @@
  		$(INSTALL_DATA) $(srcdir)/Modules/xxmodule.c \
  			$(DESTDIR)$(LIBDEST)/distutils/tests ; \
  	fi
diff --git a/package/python3/006-cross-compile-getaddrinfo.patch b/package/python3/006-cross-compile-getaddrinfo.patch
index 62a8aa4..c530883 100644
--- a/package/python3/006-cross-compile-getaddrinfo.patch
+++ b/package/python3/006-cross-compile-getaddrinfo.patch
@@ -10,7 +10,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3429,7 +3429,7 @@
+@@ -3432,7 +3432,7 @@
  
  AC_MSG_RESULT($ac_cv_buggy_getaddrinfo)
  
diff --git a/package/python3/007-disable-extensions.patch b/package/python3/007-disable-extensions.patch
index 3b603f7..ce931f7 100644
--- a/package/python3/007-disable-extensions.patch
+++ b/package/python3/007-disable-extensions.patch
@@ -51,7 +51,7 @@ Index: b/Makefile.pre.in
  
  # Subdirectories with code
  SRCDIRS= 	@SRCDIRS@
-@@ -576,6 +578,7 @@
+@@ -577,6 +579,7 @@
  	esac; \
  	$(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' \
  		_TCLTK_INCLUDES='$(TCLTK_INCLUDES)' _TCLTK_LIBS='$(TCLTK_LIBS)' \
@@ -59,7 +59,7 @@ Index: b/Makefile.pre.in
  		$(PYTHON_FOR_BUILD) $(srcdir)/setup.py $$quiet build
  
  # Build static library
-@@ -1386,7 +1389,8 @@
+@@ -1387,7 +1390,8 @@
  # Install the dynamically loadable modules
  # This goes into $(exec_prefix)
  sharedinstall: sharedmods
@@ -73,9 +73,9 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2366,6 +2366,8 @@
+@@ -2369,6 +2369,8 @@
  
- AC_PATH_TOOL([PKG_CONFIG], [pkg-config])
+ PKG_PROG_PKG_CONFIG
  
 +AC_SUBST(DISABLED_EXTENSIONS)
 +
diff --git a/package/python3/012-dont-add-multiarch-path.patch b/package/python3/012-dont-add-multiarch-path.patch
index 6867b9a..f32372c 100644
--- a/package/python3/012-dont-add-multiarch-path.patch
+++ b/package/python3/012-dont-add-multiarch-path.patch
@@ -14,7 +14,7 @@ Index: b/setup.py
 ===================================================================
 --- a/setup.py
 +++ b/setup.py
-@@ -467,10 +467,10 @@
+@@ -456,10 +456,10 @@
          if not cross_compiling:
              add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
              add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
diff --git a/package/python3/014-serial-ioctl-workaround.patch b/package/python3/014-serial-ioctl-workaround.patch
index 9786d03..e4aae00 100644
--- a/package/python3/014-serial-ioctl-workaround.patch
+++ b/package/python3/014-serial-ioctl-workaround.patch
@@ -8,9 +8,10 @@ but isn't actually referenced in modern kernels.
 
 Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 ---
-diff -Nuar Python-3.4.1-orig/Modules/termios.c Python-3.4.1/Modules/termios.c
---- Python-3.4.1-orig/Modules/termios.c	2014-05-19 08:19:39.000000000 +0300
-+++ Python-3.4.1/Modules/termios.c	2014-08-06 21:16:11.892362933 +0300
+Index: b/Modules/termios.c
+===================================================================
+--- a/Modules/termios.c
++++ b/Modules/termios.c
 @@ -9,7 +9,9 @@
  #endif
  
diff --git a/package/python3/017-python-config-include-libdir.patch b/package/python3/017-python-config-include-libdir.patch
index 50a856d..46d4633 100644
--- a/package/python3/017-python-config-include-libdir.patch
+++ b/package/python3/017-python-config-include-libdir.patch
@@ -24,11 +24,11 @@ Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
  Misc/python-config.sh.in | 12 ++++++------
  1 file changed, 6 insertions(+), 6 deletions(-)
 
-diff --git a/Misc/python-config.sh.in b/Misc/python-config.sh.in
-index 64c81e5..f75eec5 100644
+Index: b/Misc/python-config.sh.in
+===================================================================
 --- a/Misc/python-config.sh.in
 +++ b/Misc/python-config.sh.in
-@@ -29,12 +29,12 @@ prefix_real=$(installed_prefix "$0")
+@@ -29,12 +29,12 @@
  
  # Use sed to fix paths from their built-to locations to their installed-to
  # locations.
@@ -46,7 +46,7 @@ index 64c81e5..f75eec5 100644
  VERSION="@VERSION@"
  LIBM="@LIBM@"
  LIBC="@LIBC@"
-@@ -48,7 +48,7 @@ OPT="@OPT@"
+@@ -48,7 +48,7 @@
  PY_ENABLE_SHARED="@PY_ENABLE_SHARED@"
  LDVERSION="@LDVERSION@"
  LIBDEST=${prefix}/lib/python${VERSION}
@@ -55,6 +55,3 @@ index 64c81e5..f75eec5 100644
  SO="@SO@"
  PYTHONFRAMEWORK="@PYTHONFRAMEWORK@"
  INCDIR="-I$includedir/python${VERSION}${ABIFLAGS}"
--- 
-2.1.3
-
diff --git a/package/python3/018-ncursesw-remove-wrong-includedir.patch b/package/python3/018-ncursesw-remove-wrong-includedir.patch
index ae87bbf..1c26438 100644
--- a/package/python3/018-ncursesw-remove-wrong-includedir.patch
+++ b/package/python3/018-ncursesw-remove-wrong-includedir.patch
@@ -11,7 +11,7 @@ Index: b/setup.py
 ===================================================================
 --- a/setup.py
 +++ b/setup.py
-@@ -1287,7 +1287,6 @@
+@@ -1276,7 +1276,6 @@
          panel_library = 'panel'
          if curses_library == 'ncursesw':
              curses_defines.append(('HAVE_NCURSESW', '1'))
diff --git a/package/python3/100-optional-test-modules.patch b/package/python3/100-optional-test-modules.patch
index e3e81b7..765e937 100644
--- a/package/python3/100-optional-test-modules.patch
+++ b/package/python3/100-optional-test-modules.patch
@@ -15,7 +15,7 @@ Index: b/Makefile.pre.in
 ===================================================================
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1135,8 +1135,30 @@
+@@ -1136,8 +1136,30 @@
  EXTRAPLATDIR= @EXTRAPLATDIR@
  MACHDEPS=	$(PLATDIR) $(EXTRAPLATDIR)
  XMLLIBSUBDIRS=  xml xml/dom xml/etree xml/parsers xml/sax
@@ -48,7 +48,7 @@ Index: b/Makefile.pre.in
  		test/audiodata \
  		test/capath test/data \
  		test/cjkencodings test/decimaltestdata test/xmltestdata \
-@@ -1163,28 +1185,22 @@
+@@ -1164,28 +1186,22 @@
  		test/test_importlib/namespace_pkgs/project3/parent/child \
                  test/test_importlib/namespace_pkgs/module_and_namespace_package \
                  test/test_importlib/namespace_pkgs/module_and_namespace_package/a_test \
@@ -93,7 +93,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2673,6 +2673,12 @@
+@@ -2676,6 +2676,12 @@
  fi
  
  
diff --git a/package/python3/101-optional-pydoc.patch b/package/python3/101-optional-pydoc.patch
index 616ccb5..a1b63d5 100644
--- a/package/python3/101-optional-pydoc.patch
+++ b/package/python3/101-optional-pydoc.patch
@@ -16,7 +16,7 @@ Index: b/Makefile.pre.in
 ===================================================================
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1102,7 +1102,9 @@
+@@ -1103,7 +1103,9 @@
  	-rm -f $(DESTDIR)$(BINDIR)/idle3
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s idle$(VERSION) idle3)
  	-rm -f $(DESTDIR)$(BINDIR)/pydoc3
@@ -26,7 +26,7 @@ Index: b/Makefile.pre.in
  	-rm -f $(DESTDIR)$(BINDIR)/2to3
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s 2to3-$(VERSION) 2to3)
  	-rm -f $(DESTDIR)$(BINDIR)/pyvenv
-@@ -1153,7 +1155,7 @@
+@@ -1154,7 +1156,7 @@
  		multiprocessing multiprocessing/dummy \
  		unittest \
  		venv venv/scripts venv/scripts/posix \
@@ -35,7 +35,7 @@ Index: b/Makefile.pre.in
  
  TESTSUBDIRS = 	tkinter/test tkinter/test/test_tkinter tkinter/test/test_ttk \
  		test test/test_asyncio \
-@@ -1197,6 +1199,10 @@
+@@ -1198,6 +1200,10 @@
  		test/test_importlib/import_ test/test_importlib/source \
  		unittest/test unittest/test/testmock
  
@@ -50,7 +50,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2672,6 +2672,11 @@
+@@ -2675,6 +2675,11 @@
        AC_CHECK_FUNCS(pthread_atfork)
  fi
  
@@ -66,7 +66,7 @@ Index: b/setup.py
 ===================================================================
 --- a/setup.py
 +++ b/setup.py
-@@ -2212,6 +2212,12 @@
+@@ -2200,6 +2200,12 @@
      # turn off warnings when deprecated modules are imported
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
@@ -79,7 +79,7 @@ Index: b/setup.py
      setup(# PyPI Metadata (PEP 301)
            name = "Python",
            version = sys.version.split()[0],
-@@ -2236,8 +2242,7 @@
+@@ -2224,8 +2230,7 @@
            # If you change the scripts installed here, you also need to
            # check the PyBuildScripts command above, and change the links
            # created by the bininstall target in Makefile.pre.in
diff --git a/package/python3/102-optional-2to3.patch b/package/python3/102-optional-2to3.patch
index cc010bc..4181456 100644
--- a/package/python3/102-optional-2to3.patch
+++ b/package/python3/102-optional-2to3.patch
@@ -16,7 +16,7 @@ Index: b/Makefile.pre.in
 ===================================================================
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1106,7 +1106,9 @@
+@@ -1107,7 +1107,9 @@
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s pydoc$(VERSION) pydoc3)
  endif
  	-rm -f $(DESTDIR)$(BINDIR)/2to3
@@ -26,7 +26,7 @@ Index: b/Makefile.pre.in
  	-rm -f $(DESTDIR)$(BINDIR)/pyvenv
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s pyvenv-$(VERSION) pyvenv)
  	if test "x$(LIPO_32BIT_FLAGS)" != "x" ; then \
-@@ -1146,7 +1148,6 @@
+@@ -1147,7 +1149,6 @@
  		html json http dbm xmlrpc \
  		sqlite3 \
  		logging csv wsgiref urllib \
@@ -34,7 +34,7 @@ Index: b/Makefile.pre.in
  		ctypes ctypes/macholib \
  		idlelib idlelib/Icons \
  		distutils distutils/command $(XMLLIBSUBDIRS) \
-@@ -1188,9 +1189,6 @@
+@@ -1189,9 +1190,6 @@
                  test/test_importlib/namespace_pkgs/module_and_namespace_package \
                  test/test_importlib/namespace_pkgs/module_and_namespace_package/a_test \
  		sqlite3/test \
@@ -44,7 +44,7 @@ Index: b/Makefile.pre.in
  		ctypes/test \
  		idlelib/idle_test \
  		distutils/tests \
-@@ -1203,6 +1201,14 @@
+@@ -1204,6 +1202,14 @@
  LIBSUBDIRS += pydoc_data
  endif
  
@@ -59,7 +59,7 @@ Index: b/Makefile.pre.in
  ifeq (@TEST_MODULES@,yes)
  LIBSUBDIRS += $(TESTSUBDIRS)
  endif
-@@ -1298,10 +1304,12 @@
+@@ -1299,10 +1305,12 @@
  		-d $(LIBDEST)/site-packages -f $(STDLIB_CACHE_FLAGS) \
  		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
  endif
@@ -76,7 +76,7 @@ Index: b/setup.py
 ===================================================================
 --- a/setup.py
 +++ b/setup.py
-@@ -2213,10 +2213,11 @@
+@@ -2201,10 +2201,11 @@
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
  
@@ -94,7 +94,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2684,6 +2684,12 @@
+@@ -2687,6 +2687,12 @@
  	AS_HELP_STRING([--disable-test-modules], [disable test modules]),
  	[ TEST_MODULES="${enableval}" ], [ TEST_MODULES=yes ])
  
diff --git a/package/python3/103-optional-sqlite.patch b/package/python3/103-optional-sqlite.patch
index f9cfeeb..f8e5352 100644
--- a/package/python3/103-optional-sqlite.patch
+++ b/package/python3/103-optional-sqlite.patch
@@ -12,7 +12,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2672,6 +2672,15 @@
+@@ -2675,6 +2675,15 @@
        AC_CHECK_FUNCS(pthread_atfork)
  fi
  
@@ -32,7 +32,7 @@ Index: b/Makefile.pre.in
 ===================================================================
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1146,7 +1146,6 @@
+@@ -1147,7 +1147,6 @@
  		email email/mime \
  		ensurepip ensurepip/_bundled \
  		html json http dbm xmlrpc \
@@ -40,7 +40,7 @@ Index: b/Makefile.pre.in
  		logging csv wsgiref urllib \
  		ctypes ctypes/macholib \
  		idlelib idlelib/Icons \
-@@ -1188,7 +1187,6 @@
+@@ -1189,7 +1188,6 @@
  		test/test_importlib/namespace_pkgs/project3/parent/child \
                  test/test_importlib/namespace_pkgs/module_and_namespace_package \
                  test/test_importlib/namespace_pkgs/module_and_namespace_package/a_test \
@@ -48,7 +48,7 @@ Index: b/Makefile.pre.in
  		ctypes/test \
  		idlelib/idle_test \
  		distutils/tests \
-@@ -1209,6 +1207,11 @@
+@@ -1210,6 +1208,11 @@
  	lib2to3/tests/data/fixers/myfixes
  endif
  
diff --git a/package/python3/104-optional-tk.patch b/package/python3/104-optional-tk.patch
index 7d67204..8a852c5 100644
--- a/package/python3/104-optional-tk.patch
+++ b/package/python3/104-optional-tk.patch
@@ -12,7 +12,7 @@ Index: b/Makefile.pre.in
 ===================================================================
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1139,7 +1139,7 @@
+@@ -1140,7 +1140,7 @@
  EXTRAPLATDIR= @EXTRAPLATDIR@
  MACHDEPS=	$(PLATDIR) $(EXTRAPLATDIR)
  XMLLIBSUBDIRS=  xml xml/dom xml/etree xml/parsers xml/sax
@@ -21,7 +21,7 @@ Index: b/Makefile.pre.in
  		site-packages \
  		asyncio \
  		collections concurrent concurrent/futures encodings \
-@@ -1157,8 +1157,7 @@
+@@ -1158,8 +1158,7 @@
  		venv venv/scripts venv/scripts/posix \
  		curses $(MACHDEPS)
  
@@ -31,7 +31,7 @@ Index: b/Makefile.pre.in
  		test/test_email test/test_email/data \
  		test/test_json \
  		test/audiodata \
-@@ -1212,6 +1211,12 @@
+@@ -1213,6 +1212,12 @@
  TESTSUBDIRS += sqlite3/test
  endif
  
@@ -48,7 +48,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2681,6 +2681,15 @@
+@@ -2684,6 +2684,15 @@
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
  fi
  
diff --git a/package/python3/105-optional-curses.patch b/package/python3/105-optional-curses.patch
index b61528e..72979cf 100644
--- a/package/python3/105-optional-curses.patch
+++ b/package/python3/105-optional-curses.patch
@@ -12,7 +12,7 @@ Index: b/Makefile.pre.in
 ===================================================================
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1155,7 +1155,7 @@
+@@ -1156,7 +1156,7 @@
  		multiprocessing multiprocessing/dummy \
  		unittest \
  		venv venv/scripts venv/scripts/posix \
@@ -21,7 +21,7 @@ Index: b/Makefile.pre.in
  
  TESTSUBDIRS = 	test test/test_asyncio \
  		test/test_email test/test_email/data \
-@@ -1217,6 +1217,10 @@
+@@ -1218,6 +1218,10 @@
  	tkinter/test/test_ttk
  endif
  
@@ -36,7 +36,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2690,6 +2690,15 @@
+@@ -2693,6 +2693,15 @@
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _tkinter"
  fi
  
diff --git a/package/python3/106-optional-expat.patch b/package/python3/106-optional-expat.patch
index c05e4e9..0bdd6f9 100644
--- a/package/python3/106-optional-expat.patch
+++ b/package/python3/106-optional-expat.patch
@@ -19,7 +19,7 @@ Index: b/Makefile.pre.in
 ===================================================================
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1149,7 +1149,7 @@
+@@ -1150,7 +1150,7 @@
  		logging csv wsgiref urllib \
  		ctypes ctypes/macholib \
  		idlelib idlelib/Icons \
@@ -28,7 +28,7 @@ Index: b/Makefile.pre.in
  		importlib \
  		turtledemo \
  		multiprocessing multiprocessing/dummy \
-@@ -1221,6 +1221,10 @@
+@@ -1222,6 +1222,10 @@
  LIBSUBDIRS += curses
  endif
  
@@ -43,7 +43,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2369,13 +2369,21 @@
+@@ -2372,13 +2372,21 @@
  AC_SUBST(DISABLED_EXTENSIONS)
  
  # Check for use of the system expat library
@@ -74,7 +74,7 @@ Index: b/setup.py
 ===================================================================
 --- a/setup.py
 +++ b/setup.py
-@@ -1426,7 +1426,7 @@
+@@ -1414,7 +1414,7 @@
          #
          # More information on Expat can be found at www.libexpat.org.
          #
diff --git a/package/python3/107-optional-codecs-cjk.patch b/package/python3/107-optional-codecs-cjk.patch
index 5d26c91..2759dd9 100644
--- a/package/python3/107-optional-codecs-cjk.patch
+++ b/package/python3/107-optional-codecs-cjk.patch
@@ -10,7 +10,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2689,6 +2689,12 @@
+@@ -2692,6 +2692,12 @@
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
  fi
  
diff --git a/package/python3/108-optional-nis.patch b/package/python3/108-optional-nis.patch
index 58dcc1e..8b8c4a0 100644
--- a/package/python3/108-optional-nis.patch
+++ b/package/python3/108-optional-nis.patch
@@ -13,7 +13,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2695,6 +2695,12 @@
+@@ -2698,6 +2698,12 @@
  		DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _codecs_kr _codecs_jp _codecs_cn _codecs_tw _codecs_hk _codecs_iso2022"
  	fi])
  
diff --git a/package/python3/109-optional-unicodedata.patch b/package/python3/109-optional-unicodedata.patch
index 939ce34..7291852 100644
--- a/package/python3/109-optional-unicodedata.patch
+++ b/package/python3/109-optional-unicodedata.patch
@@ -10,7 +10,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2701,6 +2701,12 @@
+@@ -2704,6 +2704,12 @@
      	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} nis"
    	  fi])
  
diff --git a/package/python3/110-optional-idle.patch b/package/python3/110-optional-idle.patch
index 555f5ef..d30eb02 100644
--- a/package/python3/110-optional-idle.patch
+++ b/package/python3/110-optional-idle.patch
@@ -15,7 +15,7 @@ Index: b/Makefile.pre.in
 ===================================================================
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1100,7 +1100,9 @@
+@@ -1101,7 +1101,9 @@
  	-rm -f $(DESTDIR)$(LIBPC)/python3.pc
  	(cd $(DESTDIR)$(LIBPC); $(LN) -s python-$(VERSION).pc python3.pc)
  	-rm -f $(DESTDIR)$(BINDIR)/idle3
@@ -25,7 +25,7 @@ Index: b/Makefile.pre.in
  	-rm -f $(DESTDIR)$(BINDIR)/pydoc3
  ifeq (@PYDOC@,yes)
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s pydoc$(VERSION) pydoc3)
-@@ -1148,7 +1150,6 @@
+@@ -1149,7 +1151,6 @@
  		html json http dbm xmlrpc \
  		logging csv wsgiref urllib \
  		ctypes ctypes/macholib \
@@ -33,7 +33,7 @@ Index: b/Makefile.pre.in
  		distutils distutils/command \
  		importlib \
  		turtledemo \
-@@ -1225,6 +1226,10 @@
+@@ -1226,6 +1227,10 @@
  LIBSUBDIRS += $(XMLLIBSUBDIRS)
  endif
  
@@ -48,7 +48,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2743,6 +2743,12 @@
+@@ -2746,6 +2746,12 @@
  	AS_HELP_STRING([--disable-lib2to3], [disable lib2to3]),
  	[ LIB2TO3="${enableval}" ], [ LIB2TO3=yes ])
  
@@ -65,7 +65,7 @@ Index: b/setup.py
 ===================================================================
 --- a/setup.py
 +++ b/setup.py
-@@ -2213,11 +2213,13 @@
+@@ -2201,11 +2201,13 @@
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
  
diff --git a/package/python3/111-optional-decimal.patch b/package/python3/111-optional-decimal.patch
index c325ce2..be17c94 100644
--- a/package/python3/111-optional-decimal.patch
+++ b/package/python3/111-optional-decimal.patch
@@ -12,7 +12,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2402,13 +2402,20 @@
+@@ -2405,13 +2405,20 @@
  AC_MSG_RESULT($with_system_ffi)
  
  # Check for use of the system libmpdec library
@@ -42,7 +42,7 @@ Index: b/setup.py
 ===================================================================
 --- a/setup.py
 +++ b/setup.py
-@@ -1980,7 +1980,7 @@
+@@ -1968,7 +1968,7 @@
      def _decimal_ext(self):
          extra_compile_args = []
          undef_macros = []
diff --git a/package/python3/112-optional-ossaudiodev.patch b/package/python3/112-optional-ossaudiodev.patch
index bc5ceca..7f1611b 100644
--- a/package/python3/112-optional-ossaudiodev.patch
+++ b/package/python3/112-optional-ossaudiodev.patch
@@ -6,7 +6,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2417,6 +2417,12 @@
+@@ -2420,6 +2420,12 @@
  fi
  AC_SUBST(MPDEC)
  
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index b12c460..fd5709a 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.4
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).2
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).3
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = http://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python software foundation license v2, others
