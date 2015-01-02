From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Jan 2015 19:29:53 +0100
Subject: [Buildroot] [git commit] python3: bump to 3.4.2
Message-ID: <20150102183036.0EE7980D94@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=144e21f203cf88c1768488d08e201e9579db857e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit bumps python3 to Python 3.4.2. Two patches had to be
changed slightly to fix some minor conflicts.

PYTHON3_LIBTOOL_PATH = NO was added to prevent Buildroot from trying
to patch a version of libtool for which we don't have matching
patches, which isn't a problem since we're anyway not using the part
of the Python sources that uses libtool (it's the built-in copy of
libffi, and we use the external libffi).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 .../python3-001-remove-host-header-path.patch      |    2 +-
 ...thon3-002-properly-detect-if-python-build.patch |    2 +-
 ...ython3-003-sysconfigdata-install-location.patch |   16 ++++++++--------
 package/python3/python3-004-old-stdlib-cache.patch |    6 +++---
 .../python3/python3-005-pyc-pyo-conditional.patch  |    4 ++--
 .../python3-006-cross-compile-getaddrinfo.patch    |    2 +-
 .../python3/python3-007-disable-extensions.patch   |   10 +++++-----
 ...008-distutils-sysconfig-use-sysconfigdata.patch |   19 +++++--------------
 .../python3-009-distutils-use-python-sysroot.patch |    2 +-
 .../python3/python3-010-no-termcap-host-path.patch |    2 +-
 ...n3-011-support-library-path-old-compilers.patch |    6 +++---
 .../python3-012-dont-add-multiarch-path.patch      |    2 +-
 .../python3-013-abort-on-failed-modules.patch      |    2 +-
 .../python3-100-optional-test-modules.patch        |    6 +++---
 package/python3/python3-101-optional-pydoc.patch   |   12 ++++++------
 package/python3/python3-102-optional-2to3.patch    |   14 +++++++-------
 package/python3/python3-103-optional-sqlite.patch  |    8 ++++----
 package/python3/python3-104-optional-tk.patch      |    8 ++++----
 package/python3/python3-105-optional-curses.patch  |    6 +++---
 package/python3/python3-106-optional-expat.patch   |    8 ++++----
 .../python3/python3-107-optional-codecs-cjk.patch  |    2 +-
 package/python3/python3-108-optional-nis.patch     |    2 +-
 .../python3/python3-109-optional-unicodedata.patch |    2 +-
 package/python3/python3-110-optional-idle.patch    |   10 +++++-----
 package/python3/python3-111-optional-decimal.patch |    4 ++--
 package/python3/python3.mk                         |    9 ++++++++-
 26 files changed, 82 insertions(+), 84 deletions(-)

diff --git a/package/python3/python3-001-remove-host-header-path.patch b/package/python3/python3-001-remove-host-header-path.patch
index e159e86..1eff608 100644
--- a/package/python3/python3-001-remove-host-header-path.patch
+++ b/package/python3/python3-001-remove-host-header-path.patch
@@ -24,7 +24,7 @@ Index: b/setup.py
 ===================================================================
 --- a/setup.py
 +++ b/setup.py
-@@ -487,7 +487,8 @@
+@@ -493,7 +493,8 @@
                          add_dir_to_list(dir_list, directory)
  
          if os.path.normpath(sys.base_prefix) != '/usr' \
diff --git a/package/python3/python3-002-properly-detect-if-python-build.patch b/package/python3/python3-002-properly-detect-if-python-build.patch
index ce874c6..e8ccd36 100644
--- a/package/python3/python3-002-properly-detect-if-python-build.patch
+++ b/package/python3/python3-002-properly-detect-if-python-build.patch
@@ -12,7 +12,7 @@ Index: b/Lib/distutils/command/build_ext.py
 ===================================================================
 --- a/Lib/distutils/command/build_ext.py
 +++ b/Lib/distutils/command/build_ext.py
-@@ -246,7 +246,7 @@
+@@ -237,7 +237,7 @@
          # Python's library directory must be appended to library_dirs
          # See Issues: #1600860, #4366
          if (sysconfig.get_config_var('Py_ENABLE_SHARED')):
diff --git a/package/python3/python3-003-sysconfigdata-install-location.patch b/package/python3/python3-003-sysconfigdata-install-location.patch
index 1f230d4..dfcadf5 100644
--- a/package/python3/python3-003-sysconfigdata-install-location.patch
+++ b/package/python3/python3-003-sysconfigdata-install-location.patch
@@ -21,17 +21,17 @@ Index: b/Makefile.pre.in
 ===================================================================
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -543,6 +543,9 @@
- # sys.path fixup -- see Modules/getpath.c.
- pybuilddir.txt: $(BUILDPYTHON)
- 	$(RUNSHARED) $(PYTHON_FOR_BUILD) -S -m sysconfig --generate-posix-vars
+@@ -558,6 +558,9 @@
+ 		rm -f ./pybuilddir.txt ; \
+ 		exit 1 ; \
+ 	fi
 +	echo `cat pybuilddir.txt`/sysconfigdata > pysysconfigdatadir.txt
 +	mkdir -p `cat pysysconfigdatadir.txt`
 +	cp `cat pybuilddir.txt`/_sysconfigdata.py `cat pysysconfigdatadir.txt`
  
  # Build the shared modules
  # Under GNU make, MAKEFLAGS are sorted and normalized; the 's' for
-@@ -1181,7 +1184,7 @@
+@@ -1196,7 +1199,7 @@
  		else	true; \
  		fi; \
  	done
@@ -40,7 +40,7 @@ Index: b/Makefile.pre.in
  	do \
  		if test -x $$i; then \
  			$(INSTALL_SCRIPT) $$i $(DESTDIR)$(LIBDEST); \
-@@ -1191,6 +1194,11 @@
+@@ -1206,6 +1209,11 @@
  			echo $(INSTALL_DATA) $$i $(LIBDEST); \
  		fi; \
  	done
@@ -52,7 +52,7 @@ Index: b/Makefile.pre.in
  	@for d in $(LIBSUBDIRS); \
  	do \
  		a=$(srcdir)/Lib/$$d; \
-@@ -1514,7 +1522,7 @@
+@@ -1529,7 +1537,7 @@
  	find build -name 'fficonfig.h' -exec rm -f {} ';' || true
  	find build -name '*.py' -exec rm -f {} ';' || true
  	find build -name '*.py[co]' -exec rm -f {} ';' || true
@@ -65,7 +65,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -67,7 +67,7 @@
+@@ -70,7 +70,7 @@
  	    AC_MSG_ERROR([python$PACKAGE_VERSION interpreter not found])
  	fi
          AC_MSG_RESULT($interp)
diff --git a/package/python3/python3-004-old-stdlib-cache.patch b/package/python3/python3-004-old-stdlib-cache.patch
index ac34f8d..4ed994d 100644
--- a/package/python3/python3-004-old-stdlib-cache.patch
+++ b/package/python3/python3-004-old-stdlib-cache.patch
@@ -12,7 +12,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -349,6 +349,23 @@
+@@ -352,6 +352,23 @@
  AC_SUBST(FRAMEWORKUNIXTOOLSPREFIX)
  AC_SUBST(FRAMEWORKINSTALLAPPSPREFIX)
  
@@ -40,7 +40,7 @@ Index: b/Makefile.pre.in
 ===================================================================
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -157,6 +157,9 @@
+@@ -162,6 +162,9 @@
  # Options to enable prebinding (for fast startup prior to Mac OS X 10.3)
  OTHER_LIBTOOL_OPT=@OTHER_LIBTOOL_OPT@
  
@@ -50,7 +50,7 @@ Index: b/Makefile.pre.in
  # Environment to run shared python without installed libraries
  RUNSHARED=       @RUNSHARED@
  
-@@ -1231,21 +1234,21 @@
+@@ -1246,21 +1249,21 @@
  	fi
  	-PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
  		$(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py \
diff --git a/package/python3/python3-005-pyc-pyo-conditional.patch b/package/python3/python3-005-pyc-pyo-conditional.patch
index 6b08c82..42dfa2f 100644
--- a/package/python3/python3-005-pyc-pyo-conditional.patch
+++ b/package/python3/python3-005-pyc-pyo-conditional.patch
@@ -2,7 +2,7 @@ Index: b/Makefile.pre.in
 ===================================================================
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1232,24 +1232,32 @@
+@@ -1247,24 +1247,32 @@
  		$(INSTALL_DATA) $(srcdir)/Modules/xxmodule.c \
  			$(DESTDIR)$(LIBDEST)/distutils/tests ; \
  	fi
@@ -39,7 +39,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -936,6 +936,18 @@
+@@ -939,6 +939,18 @@
  
  AC_MSG_CHECKING(LDLIBRARY)
  
diff --git a/package/python3/python3-006-cross-compile-getaddrinfo.patch b/package/python3/python3-006-cross-compile-getaddrinfo.patch
index 7347be5..62a8aa4 100644
--- a/package/python3/python3-006-cross-compile-getaddrinfo.patch
+++ b/package/python3/python3-006-cross-compile-getaddrinfo.patch
@@ -10,7 +10,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3412,7 +3412,7 @@
+@@ -3429,7 +3429,7 @@
  
  AC_MSG_RESULT($ac_cv_buggy_getaddrinfo)
  
diff --git a/package/python3/python3-007-disable-extensions.patch b/package/python3/python3-007-disable-extensions.patch
index 63c06b1..3b603f7 100644
--- a/package/python3/python3-007-disable-extensions.patch
+++ b/package/python3/python3-007-disable-extensions.patch
@@ -42,7 +42,7 @@ Index: b/Makefile.pre.in
 ===================================================================
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -175,6 +175,8 @@
+@@ -180,6 +180,8 @@
  # configure script arguments
  CONFIG_ARGS=	@CONFIG_ARGS@
  
@@ -51,7 +51,7 @@ Index: b/Makefile.pre.in
  
  # Subdirectories with code
  SRCDIRS= 	@SRCDIRS@
-@@ -561,6 +563,7 @@
+@@ -576,6 +578,7 @@
  	esac; \
  	$(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' \
  		_TCLTK_INCLUDES='$(TCLTK_INCLUDES)' _TCLTK_LIBS='$(TCLTK_LIBS)' \
@@ -59,7 +59,7 @@ Index: b/Makefile.pre.in
  		$(PYTHON_FOR_BUILD) $(srcdir)/setup.py $$quiet build
  
  # Build static library
-@@ -1371,7 +1374,8 @@
+@@ -1386,7 +1389,8 @@
  # Install the dynamically loadable modules
  # This goes into $(exec_prefix)
  sharedinstall: sharedmods
@@ -73,7 +73,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2349,6 +2349,8 @@
+@@ -2366,6 +2366,8 @@
  
  AC_PATH_TOOL([PKG_CONFIG], [pkg-config])
  
@@ -86,7 +86,7 @@ Index: b/setup.py
 ===================================================================
 --- a/setup.py
 +++ b/setup.py
-@@ -33,7 +33,10 @@
+@@ -39,7 +39,10 @@
  COMPILED_WITH_PYDEBUG = ('--with-pydebug' in sysconfig.get_config_var("CONFIG_ARGS"))
  
  # This global variable is used to hold the list of modules to be disabled.
diff --git a/package/python3/python3-008-distutils-sysconfig-use-sysconfigdata.patch b/package/python3/python3-008-distutils-sysconfig-use-sysconfigdata.patch
index c77fed3..d0758b1 100644
--- a/package/python3/python3-008-distutils-sysconfig-use-sysconfigdata.patch
+++ b/package/python3/python3-008-distutils-sysconfig-use-sysconfigdata.patch
@@ -2,10 +2,11 @@ Index: b/Lib/distutils/sysconfig.py
 ===================================================================
 --- a/Lib/distutils/sysconfig.py
 +++ b/Lib/distutils/sysconfig.py
-@@ -430,49 +430,11 @@
+@@ -423,40 +423,11 @@
+ _config_vars = None
  
  def _init_posix():
-     """Initialize the module as appropriate for POSIX systems."""
+-    """Initialize the module as appropriate for POSIX systems."""
 -    g = {}
 -    # load the installed Makefile:
 -    try:
@@ -36,23 +37,13 @@ Index: b/Lib/distutils/sysconfig.py
 -    if python_build:
 -        g['LDSHARED'] = g['BLDSHARED']
 -
--    elif get_python_version() < '2.1':
--        # The following two branches are for 1.5.2 compatibility.
--        if sys.platform == 'aix4':          # what about AIX 3.x ?
--            # Linker script is in the config directory, not in Modules as the
--            # Makefile says.
--            python_lib = get_python_lib(standard_lib=1)
--            ld_so_aix = os.path.join(python_lib, 'config', 'ld_so_aix')
--            python_exp = os.path.join(python_lib, 'config', 'python.exp')
--
--            g['LDSHARED'] = "%s %s -bI:%s" % (ld_so_aix, g['CC'], python_exp)
--
 +    # _sysconfigdata is generated@build time, see the sysconfig module
 +    from _sysconfigdata import build_time_vars
      global _config_vars
 -    _config_vars = g
+-
 +    _config_vars = {}
 +    _config_vars.update(build_time_vars)
  
- 
  def _init_nt():
+     """Initialize the module as appropriate for NT"""
diff --git a/package/python3/python3-009-distutils-use-python-sysroot.patch b/package/python3/python3-009-distutils-use-python-sysroot.patch
index cfe30fe..06f2039 100644
--- a/package/python3/python3-009-distutils-use-python-sysroot.patch
+++ b/package/python3/python3-009-distutils-use-python-sysroot.patch
@@ -43,7 +43,7 @@ Index: b/Lib/distutils/command/build_ext.py
 ===================================================================
 --- a/Lib/distutils/command/build_ext.py
 +++ b/Lib/distutils/command/build_ext.py
-@@ -248,7 +248,10 @@
+@@ -239,7 +239,10 @@
          if (sysconfig.get_config_var('Py_ENABLE_SHARED')):
              if not sysconfig.python_build:
                  # building third party extensions
diff --git a/package/python3/python3-010-no-termcap-host-path.patch b/package/python3/python3-010-no-termcap-host-path.patch
index 57fe47a..46c8a77 100644
--- a/package/python3/python3-010-no-termcap-host-path.patch
+++ b/package/python3/python3-010-no-termcap-host-path.patch
@@ -6,7 +6,7 @@ Index: b/setup.py
 ===================================================================
 --- a/setup.py
 +++ b/setup.py
-@@ -725,12 +725,9 @@
+@@ -733,12 +733,9 @@
                  pass # Issue 7384: Already linked against curses or tinfo.
              elif curses_library:
                  readline_libs.append(curses_library)
diff --git a/package/python3/python3-011-support-library-path-old-compilers.patch b/package/python3/python3-011-support-library-path-old-compilers.patch
index 4e0088a..296e9fe 100644
--- a/package/python3/python3-011-support-library-path-old-compilers.patch
+++ b/package/python3/python3-011-support-library-path-old-compilers.patch
@@ -20,7 +20,7 @@ Index: b/setup.py
 ===================================================================
 --- a/setup.py
 +++ b/setup.py
-@@ -421,6 +421,7 @@
+@@ -427,6 +427,7 @@
          in_incdirs = False
          inc_dirs = []
          lib_dirs = []
@@ -28,7 +28,7 @@ Index: b/setup.py
          try:
              if ret >> 8 == 0:
                  with open(tmpfile) as fp:
-@@ -432,6 +433,7 @@
+@@ -438,6 +439,7 @@
                          elif line.startswith("End of search list"):
                              in_incdirs = False
                          elif is_gcc and line.startswith("LIBRARY_PATH"):
@@ -36,7 +36,7 @@ Index: b/setup.py
                              for d in line.strip().split("=")[1].split(":"):
                                  d = os.path.normpath(d)
                                  if '/gcc/' not in d:
-@@ -443,6 +445,15 @@
+@@ -449,6 +451,15 @@
          finally:
              os.unlink(tmpfile)
  
diff --git a/package/python3/python3-012-dont-add-multiarch-path.patch b/package/python3/python3-012-dont-add-multiarch-path.patch
index cfd88b2..6867b9a 100644
--- a/package/python3/python3-012-dont-add-multiarch-path.patch
+++ b/package/python3/python3-012-dont-add-multiarch-path.patch
@@ -14,7 +14,7 @@ Index: b/setup.py
 ===================================================================
 --- a/setup.py
 +++ b/setup.py
-@@ -461,10 +461,10 @@
+@@ -467,10 +467,10 @@
          if not cross_compiling:
              add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
              add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
diff --git a/package/python3/python3-013-abort-on-failed-modules.patch b/package/python3/python3-013-abort-on-failed-modules.patch
index c54c72e..5ad86fb 100644
--- a/package/python3/python3-013-abort-on-failed-modules.patch
+++ b/package/python3/python3-013-abort-on-failed-modules.patch
@@ -11,7 +11,7 @@ Index: b/setup.py
 ===================================================================
 --- a/setup.py
 +++ b/setup.py
-@@ -278,6 +278,7 @@
+@@ -284,6 +284,7 @@
              print("Failed to build these modules:")
              print_three_column(failed)
              print()
diff --git a/package/python3/python3-100-optional-test-modules.patch b/package/python3/python3-100-optional-test-modules.patch
index f6214d0..e3e81b7 100644
--- a/package/python3/python3-100-optional-test-modules.patch
+++ b/package/python3/python3-100-optional-test-modules.patch
@@ -15,7 +15,7 @@ Index: b/Makefile.pre.in
 ===================================================================
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1120,8 +1120,30 @@
+@@ -1135,8 +1135,30 @@
  EXTRAPLATDIR= @EXTRAPLATDIR@
  MACHDEPS=	$(PLATDIR) $(EXTRAPLATDIR)
  XMLLIBSUBDIRS=  xml xml/dom xml/etree xml/parsers xml/sax
@@ -48,7 +48,7 @@ Index: b/Makefile.pre.in
  		test/audiodata \
  		test/capath test/data \
  		test/cjkencodings test/decimaltestdata test/xmltestdata \
-@@ -1148,28 +1170,22 @@
+@@ -1163,28 +1185,22 @@
  		test/test_importlib/namespace_pkgs/project3/parent/child \
                  test/test_importlib/namespace_pkgs/module_and_namespace_package \
                  test/test_importlib/namespace_pkgs/module_and_namespace_package/a_test \
@@ -93,7 +93,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2656,6 +2656,12 @@
+@@ -2673,6 +2673,12 @@
  fi
  
  
diff --git a/package/python3/python3-101-optional-pydoc.patch b/package/python3/python3-101-optional-pydoc.patch
index ddd5468..616ccb5 100644
--- a/package/python3/python3-101-optional-pydoc.patch
+++ b/package/python3/python3-101-optional-pydoc.patch
@@ -16,7 +16,7 @@ Index: b/Makefile.pre.in
 ===================================================================
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1087,7 +1087,9 @@
+@@ -1102,7 +1102,9 @@
  	-rm -f $(DESTDIR)$(BINDIR)/idle3
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s idle$(VERSION) idle3)
  	-rm -f $(DESTDIR)$(BINDIR)/pydoc3
@@ -26,7 +26,7 @@ Index: b/Makefile.pre.in
  	-rm -f $(DESTDIR)$(BINDIR)/2to3
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s 2to3-$(VERSION) 2to3)
  	-rm -f $(DESTDIR)$(BINDIR)/pyvenv
-@@ -1138,7 +1140,7 @@
+@@ -1153,7 +1155,7 @@
  		multiprocessing multiprocessing/dummy \
  		unittest \
  		venv venv/scripts venv/scripts/posix \
@@ -35,7 +35,7 @@ Index: b/Makefile.pre.in
  
  TESTSUBDIRS = 	tkinter/test tkinter/test/test_tkinter tkinter/test/test_ttk \
  		test test/test_asyncio \
-@@ -1182,6 +1184,10 @@
+@@ -1197,6 +1199,10 @@
  		test/test_importlib/import_ test/test_importlib/source \
  		unittest/test unittest/test/testmock
  
@@ -50,7 +50,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2655,6 +2655,11 @@
+@@ -2672,6 +2672,11 @@
        AC_CHECK_FUNCS(pthread_atfork)
  fi
  
@@ -66,7 +66,7 @@ Index: b/setup.py
 ===================================================================
 --- a/setup.py
 +++ b/setup.py
-@@ -2203,6 +2203,12 @@
+@@ -2212,6 +2212,12 @@
      # turn off warnings when deprecated modules are imported
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
@@ -79,7 +79,7 @@ Index: b/setup.py
      setup(# PyPI Metadata (PEP 301)
            name = "Python",
            version = sys.version.split()[0],
-@@ -2227,8 +2233,7 @@
+@@ -2236,8 +2242,7 @@
            # If you change the scripts installed here, you also need to
            # check the PyBuildScripts command above, and change the links
            # created by the bininstall target in Makefile.pre.in
diff --git a/package/python3/python3-102-optional-2to3.patch b/package/python3/python3-102-optional-2to3.patch
index a23584f..cc010bc 100644
--- a/package/python3/python3-102-optional-2to3.patch
+++ b/package/python3/python3-102-optional-2to3.patch
@@ -16,7 +16,7 @@ Index: b/Makefile.pre.in
 ===================================================================
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1091,7 +1091,9 @@
+@@ -1106,7 +1106,9 @@
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s pydoc$(VERSION) pydoc3)
  endif
  	-rm -f $(DESTDIR)$(BINDIR)/2to3
@@ -26,7 +26,7 @@ Index: b/Makefile.pre.in
  	-rm -f $(DESTDIR)$(BINDIR)/pyvenv
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s pyvenv-$(VERSION) pyvenv)
  	if test "x$(LIPO_32BIT_FLAGS)" != "x" ; then \
-@@ -1131,7 +1133,6 @@
+@@ -1146,7 +1148,6 @@
  		html json http dbm xmlrpc \
  		sqlite3 \
  		logging csv wsgiref urllib \
@@ -34,7 +34,7 @@ Index: b/Makefile.pre.in
  		ctypes ctypes/macholib \
  		idlelib idlelib/Icons \
  		distutils distutils/command $(XMLLIBSUBDIRS) \
-@@ -1173,9 +1174,6 @@
+@@ -1188,9 +1189,6 @@
                  test/test_importlib/namespace_pkgs/module_and_namespace_package \
                  test/test_importlib/namespace_pkgs/module_and_namespace_package/a_test \
  		sqlite3/test \
@@ -44,7 +44,7 @@ Index: b/Makefile.pre.in
  		ctypes/test \
  		idlelib/idle_test \
  		distutils/tests \
-@@ -1188,6 +1186,14 @@
+@@ -1203,6 +1201,14 @@
  LIBSUBDIRS += pydoc_data
  endif
  
@@ -59,7 +59,7 @@ Index: b/Makefile.pre.in
  ifeq (@TEST_MODULES@,yes)
  LIBSUBDIRS += $(TESTSUBDIRS)
  endif
-@@ -1283,10 +1289,12 @@
+@@ -1298,10 +1304,12 @@
  		-d $(LIBDEST)/site-packages -f $(STDLIB_CACHE_FLAGS) \
  		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
  endif
@@ -76,7 +76,7 @@ Index: b/setup.py
 ===================================================================
 --- a/setup.py
 +++ b/setup.py
-@@ -2204,10 +2204,11 @@
+@@ -2213,10 +2213,11 @@
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
  
@@ -94,7 +94,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2667,6 +2667,12 @@
+@@ -2684,6 +2684,12 @@
  	AS_HELP_STRING([--disable-test-modules], [disable test modules]),
  	[ TEST_MODULES="${enableval}" ], [ TEST_MODULES=yes ])
  
diff --git a/package/python3/python3-103-optional-sqlite.patch b/package/python3/python3-103-optional-sqlite.patch
index e444301..f9cfeeb 100644
--- a/package/python3/python3-103-optional-sqlite.patch
+++ b/package/python3/python3-103-optional-sqlite.patch
@@ -12,7 +12,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2655,6 +2655,15 @@
+@@ -2672,6 +2672,15 @@
        AC_CHECK_FUNCS(pthread_atfork)
  fi
  
@@ -32,7 +32,7 @@ Index: b/Makefile.pre.in
 ===================================================================
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1131,7 +1131,6 @@
+@@ -1146,7 +1146,6 @@
  		email email/mime \
  		ensurepip ensurepip/_bundled \
  		html json http dbm xmlrpc \
@@ -40,7 +40,7 @@ Index: b/Makefile.pre.in
  		logging csv wsgiref urllib \
  		ctypes ctypes/macholib \
  		idlelib idlelib/Icons \
-@@ -1173,7 +1172,6 @@
+@@ -1188,7 +1187,6 @@
  		test/test_importlib/namespace_pkgs/project3/parent/child \
                  test/test_importlib/namespace_pkgs/module_and_namespace_package \
                  test/test_importlib/namespace_pkgs/module_and_namespace_package/a_test \
@@ -48,7 +48,7 @@ Index: b/Makefile.pre.in
  		ctypes/test \
  		idlelib/idle_test \
  		distutils/tests \
-@@ -1194,6 +1192,11 @@
+@@ -1209,6 +1207,11 @@
  	lib2to3/tests/data/fixers/myfixes
  endif
  
diff --git a/package/python3/python3-104-optional-tk.patch b/package/python3/python3-104-optional-tk.patch
index 0d15fe1..7d67204 100644
--- a/package/python3/python3-104-optional-tk.patch
+++ b/package/python3/python3-104-optional-tk.patch
@@ -12,7 +12,7 @@ Index: b/Makefile.pre.in
 ===================================================================
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1124,7 +1124,7 @@
+@@ -1139,7 +1139,7 @@
  EXTRAPLATDIR= @EXTRAPLATDIR@
  MACHDEPS=	$(PLATDIR) $(EXTRAPLATDIR)
  XMLLIBSUBDIRS=  xml xml/dom xml/etree xml/parsers xml/sax
@@ -21,7 +21,7 @@ Index: b/Makefile.pre.in
  		site-packages \
  		asyncio \
  		collections concurrent concurrent/futures encodings \
-@@ -1142,8 +1142,7 @@
+@@ -1157,8 +1157,7 @@
  		venv venv/scripts venv/scripts/posix \
  		curses $(MACHDEPS)
  
@@ -31,7 +31,7 @@ Index: b/Makefile.pre.in
  		test/test_email test/test_email/data \
  		test/test_json \
  		test/audiodata \
-@@ -1197,6 +1196,12 @@
+@@ -1212,6 +1211,12 @@
  TESTSUBDIRS += sqlite3/test
  endif
  
@@ -48,7 +48,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2664,6 +2664,15 @@
+@@ -2681,6 +2681,15 @@
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
  fi
  
diff --git a/package/python3/python3-105-optional-curses.patch b/package/python3/python3-105-optional-curses.patch
index 8e63908..b61528e 100644
--- a/package/python3/python3-105-optional-curses.patch
+++ b/package/python3/python3-105-optional-curses.patch
@@ -12,7 +12,7 @@ Index: b/Makefile.pre.in
 ===================================================================
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1140,7 +1140,7 @@
+@@ -1155,7 +1155,7 @@
  		multiprocessing multiprocessing/dummy \
  		unittest \
  		venv venv/scripts venv/scripts/posix \
@@ -21,7 +21,7 @@ Index: b/Makefile.pre.in
  
  TESTSUBDIRS = 	test test/test_asyncio \
  		test/test_email test/test_email/data \
-@@ -1202,6 +1202,10 @@
+@@ -1217,6 +1217,10 @@
  	tkinter/test/test_ttk
  endif
  
@@ -36,7 +36,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2673,6 +2673,15 @@
+@@ -2690,6 +2690,15 @@
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _tkinter"
  fi
  
diff --git a/package/python3/python3-106-optional-expat.patch b/package/python3/python3-106-optional-expat.patch
index ce1eb2a..c05e4e9 100644
--- a/package/python3/python3-106-optional-expat.patch
+++ b/package/python3/python3-106-optional-expat.patch
@@ -19,7 +19,7 @@ Index: b/Makefile.pre.in
 ===================================================================
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1134,7 +1134,7 @@
+@@ -1149,7 +1149,7 @@
  		logging csv wsgiref urllib \
  		ctypes ctypes/macholib \
  		idlelib idlelib/Icons \
@@ -28,7 +28,7 @@ Index: b/Makefile.pre.in
  		importlib \
  		turtledemo \
  		multiprocessing multiprocessing/dummy \
-@@ -1206,6 +1206,10 @@
+@@ -1221,6 +1221,10 @@
  LIBSUBDIRS += curses
  endif
  
@@ -43,7 +43,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2352,13 +2352,21 @@
+@@ -2369,13 +2369,21 @@
  AC_SUBST(DISABLED_EXTENSIONS)
  
  # Check for use of the system expat library
@@ -74,7 +74,7 @@ Index: b/setup.py
 ===================================================================
 --- a/setup.py
 +++ b/setup.py
-@@ -1417,7 +1417,7 @@
+@@ -1426,7 +1426,7 @@
          #
          # More information on Expat can be found at www.libexpat.org.
          #
diff --git a/package/python3/python3-107-optional-codecs-cjk.patch b/package/python3/python3-107-optional-codecs-cjk.patch
index 0f261fc..5d26c91 100644
--- a/package/python3/python3-107-optional-codecs-cjk.patch
+++ b/package/python3/python3-107-optional-codecs-cjk.patch
@@ -10,7 +10,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2672,6 +2672,12 @@
+@@ -2689,6 +2689,12 @@
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
  fi
  
diff --git a/package/python3/python3-108-optional-nis.patch b/package/python3/python3-108-optional-nis.patch
index de6057c..58dcc1e 100644
--- a/package/python3/python3-108-optional-nis.patch
+++ b/package/python3/python3-108-optional-nis.patch
@@ -13,7 +13,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2678,6 +2678,12 @@
+@@ -2695,6 +2695,12 @@
  		DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _codecs_kr _codecs_jp _codecs_cn _codecs_tw _codecs_hk _codecs_iso2022"
  	fi])
  
diff --git a/package/python3/python3-109-optional-unicodedata.patch b/package/python3/python3-109-optional-unicodedata.patch
index 46e9a6f..939ce34 100644
--- a/package/python3/python3-109-optional-unicodedata.patch
+++ b/package/python3/python3-109-optional-unicodedata.patch
@@ -10,7 +10,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2684,6 +2684,12 @@
+@@ -2701,6 +2701,12 @@
      	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} nis"
    	  fi])
  
diff --git a/package/python3/python3-110-optional-idle.patch b/package/python3/python3-110-optional-idle.patch
index 4d5e70b..555f5ef 100644
--- a/package/python3/python3-110-optional-idle.patch
+++ b/package/python3/python3-110-optional-idle.patch
@@ -15,7 +15,7 @@ Index: b/Makefile.pre.in
 ===================================================================
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1085,7 +1085,9 @@
+@@ -1100,7 +1100,9 @@
  	-rm -f $(DESTDIR)$(LIBPC)/python3.pc
  	(cd $(DESTDIR)$(LIBPC); $(LN) -s python-$(VERSION).pc python3.pc)
  	-rm -f $(DESTDIR)$(BINDIR)/idle3
@@ -25,7 +25,7 @@ Index: b/Makefile.pre.in
  	-rm -f $(DESTDIR)$(BINDIR)/pydoc3
  ifeq (@PYDOC@,yes)
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s pydoc$(VERSION) pydoc3)
-@@ -1133,7 +1135,6 @@
+@@ -1148,7 +1150,6 @@
  		html json http dbm xmlrpc \
  		logging csv wsgiref urllib \
  		ctypes ctypes/macholib \
@@ -33,7 +33,7 @@ Index: b/Makefile.pre.in
  		distutils distutils/command \
  		importlib \
  		turtledemo \
-@@ -1210,6 +1211,10 @@
+@@ -1225,6 +1226,10 @@
  LIBSUBDIRS += $(XMLLIBSUBDIRS)
  endif
  
@@ -48,7 +48,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2726,6 +2726,12 @@
+@@ -2743,6 +2743,12 @@
  	AS_HELP_STRING([--disable-lib2to3], [disable lib2to3]),
  	[ LIB2TO3="${enableval}" ], [ LIB2TO3=yes ])
  
@@ -65,7 +65,7 @@ Index: b/setup.py
 ===================================================================
 --- a/setup.py
 +++ b/setup.py
-@@ -2204,11 +2204,13 @@
+@@ -2213,11 +2213,13 @@
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
  
diff --git a/package/python3/python3-111-optional-decimal.patch b/package/python3/python3-111-optional-decimal.patch
index d895ee5..c325ce2 100644
--- a/package/python3/python3-111-optional-decimal.patch
+++ b/package/python3/python3-111-optional-decimal.patch
@@ -12,7 +12,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2385,13 +2385,20 @@
+@@ -2402,13 +2402,20 @@
  AC_MSG_RESULT($with_system_ffi)
  
  # Check for use of the system libmpdec library
@@ -42,7 +42,7 @@ Index: b/setup.py
 ===================================================================
 --- a/setup.py
 +++ b/setup.py
-@@ -1972,7 +1972,7 @@
+@@ -1980,7 +1980,7 @@
      def _decimal_ext(self):
          extra_compile_args = []
          undef_macros = []
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 5c72c6e..f6663dc 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,12 +5,19 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.4
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).1
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).2
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = http://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python software foundation license v2, others
 PYTHON3_LICENSE_FILES = LICENSE
 
+# Python itself doesn't use libtool, but it includes the source code
+# of libffi, which uses libtool. Unfortunately, it uses a beta version
+# of libtool for which we don't have a matching patch. However, this
+# is not a problem, because we don't use the libffi copy included in
+# the Python sources, but instead use an external libffi library.
+PYTHON3_LIBTOOL_PATCH = NO
+
 # Python needs itself and a "pgen" program to build itself, both being
 # provided in the Python sources. So in order to cross-compile Python,
 # we need to build a host Python first. This host Python is also
