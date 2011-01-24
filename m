From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Jan 2011 12:01:35 +0100
Subject: [Buildroot] [PATCH 07/10] python: convert to autotargets,
	bump to 2.7.1, many improvements
In-Reply-To: <cover.1295866866.git.thomas.petazzoni@free-electrons.com>
References: <cover.1295866866.git.thomas.petazzoni@free-electrons.com>
Message-ID: <549a12fe9332b86bacdf6878e62878755767bb23.1295866866.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit does a number of changes and improvements to the Python
interpreter package :

 * It converts the .mk file to the AUTOTARGETS infrastructure. Even
   though Python uses only autoconf and not automake, the AUTOTARGETS
   is a fairly good fit for the Python interpreter, so we make use of
   it.

 * It bumps the version to 2.7.1. As this is a minor release compared
   to 2.7, there are no particular changes needed because of this
   bump. All changes done to the package are cleanups and improvements
   unrelated to the version bump.

 * It uses the system libffi. Until now, Python was building its own
   libffi (a library used by interprets to build code that makes
   function call at runtime). Using the Python internal libffi was not
   working as Python was not passing the appropriate arguments down to
   libffi ./configure script. And it sounded better to use a
   system-wide libffi, that could potentially be used by other
   packages as well. This libffi is needed for the ctypes Python
   module.

 * Remove all "depends on BR2_PACKAGE_PYTHON" by moving all
   Python-related options under a "if BR2_PACKAGE_PYTHON ... endif"
   condition.

 * Make the installation of pre-compiled Python modules (.pyc) the
   default, since they are smaller and do not need to be compiled on
   the target. It is still possible to install uncompiled modules, or
   both the uncompiled and pre-compiled versions.

 * The options to select the set of Python modules to compile has been
   moved to a submenu.

 * The codecscjk (Japanese, Korean and Chinese codecs) module is no
   longer enabled by default.

 * The commented options for gdbm and nis in Python have been
   removed. Those were not supported, so let's get rid of unused code.

 * The option for the tkinker module in Python has been removed, since
   we don't have a package for Tk in Buildroot.

 * Options for the bzip2, sqlite and zlib modules have been added,
   since those modules have external dependencies.

 * The set of patches has been completely reworked and extended, with
   more fine-grained patches and newer functionalities. The patches
   are split in two categories:

    - Patches that make various modifications to the Python build
      system to support cross-compilation or make some minor
      modifications. Those patches are numbered from 0 to 100.

    - Patches that add configuration options to the Python build
      system in order to enable/disable the compilation of Python
      extensions or modules (test modules, pydoc, lib2to3, sqlite, tk,
      curses, expat, codecs-cjk, nis, unicodedata, database modules,
      ssl, bzip2, zlib). These patches are numbered from 100 to 200.

   All features of the previous four patches are preserved, but they
   are organized differently and the patches have been renamed. This
   makes it difficult to see the differences from the existing
   patches.

 * The host Python interpreter is now installed in $(HOST_DIR), since
   it is used to build third party Python modules.

 * The BR2_PACKAGE_PYTHON_DEV option is removed since
   BR2_HAVE_DEVFILES already does the necessary work.

 * The "make -i install" workaround introduced by Maxime Ripard is no
   longer needed. It was caused by the compilation of the tests that
   required the unicodedata module (which wasn't built in the host
   Python interpreter). Since we no longer compile the Python tests,
   the problem doesn't exist anymore and we can avoid this "-i"
   option.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python/Config.in                           |   65 ++---
 package/python/python-2.7-001-cross-compile.patch  |  114 --------
 .../python/python-2.7-001-support-for-build.patch  |  153 +++++++++++
 .../python-2.7-002-cross-compile-variable.patch    |   55 ++++
 package/python/python-2.7-002-cross-compile.patch  |   47 ----
 ...on-2.7-003-no-import-when-cross-compiling.patch |   26 ++
 .../python-2.7-004-no-host-headers-libs.patch      |   97 +++++++
 .../python-2.7-005-staging-headers-libs.patch      |   38 +++
 .../python/python-2.7-006-disable-extensions.patch |  102 +++++++
 .../python-2.7-007-do-not-generate-pyo-files.patch |   40 +++
 .../python/python-2.7-008-reread-environment.patch |   65 +++++
 package/python/python-2.7-009-python-symlink.patch |   25 ++
 ...python-2.7-010-change-pyconfig-h-location.patch |   76 ++++++
 .../python-2.7-010-disable_modules_and_ssl.patch   |   49 ----
 package/python/python-2.7-011-no-rpath.patch       |   75 +++++
 .../python-2.7-012-correct-32bit-64bit-check.patch |   55 ++++
 .../python-2.7-020-gentoo_py_dontcompile.patch     |   27 --
 .../python-2.7-030-fix-long-long-format.patch      |   19 --
 .../python-2.7-040-bytecode-generation-fix.patch   |   38 ---
 .../python-2.7-100-optional-test-modules.patch     |   84 ++++++
 package/python/python-2.7-101-optional-pydoc.patch |   81 ++++++
 package/python/python-2.7-102-optional-2to3.patch  |   99 +++++++
 .../python/python-2.7-103-optional-sqlite.patch    |   28 ++
 package/python/python-2.7-104-optional-tk.patch    |   68 +++++
 .../python/python-2.7-105-optional-curses.patch    |   53 ++++
 package/python/python-2.7-106-optional-expat.patch |   84 ++++++
 .../python-2.7-107-optional-codecs-cjk.patch       |   25 ++
 package/python/python-2.7-108-optional-nis.patch   |   28 ++
 .../python-2.7-109-optional-unicodedata.patch      |   25 ++
 package/python/python-2.7-110-optional-db.patch    |   81 ++++++
 package/python/python-2.7-111-optional-ssl.patch   |   25 ++
 package/python/python-2.7-112-optional-bzip2.patch |   24 ++
 package/python/python-2.7-113-optional-zlib.patch  |   24 ++
 package/python/python.mk                           |  286 ++++++++------------
 34 files changed, 1671 insertions(+), 510 deletions(-)
 delete mode 100644 package/python/python-2.7-001-cross-compile.patch
 create mode 100644 package/python/python-2.7-001-support-for-build.patch
 create mode 100644 package/python/python-2.7-002-cross-compile-variable.patch
 delete mode 100644 package/python/python-2.7-002-cross-compile.patch
 create mode 100644 package/python/python-2.7-003-no-import-when-cross-compiling.patch
 create mode 100644 package/python/python-2.7-004-no-host-headers-libs.patch
 create mode 100644 package/python/python-2.7-005-staging-headers-libs.patch
 create mode 100644 package/python/python-2.7-006-disable-extensions.patch
 create mode 100644 package/python/python-2.7-007-do-not-generate-pyo-files.patch
 create mode 100644 package/python/python-2.7-008-reread-environment.patch
 create mode 100644 package/python/python-2.7-009-python-symlink.patch
 create mode 100644 package/python/python-2.7-010-change-pyconfig-h-location.patch
 delete mode 100644 package/python/python-2.7-010-disable_modules_and_ssl.patch
 create mode 100644 package/python/python-2.7-011-no-rpath.patch
 create mode 100644 package/python/python-2.7-012-correct-32bit-64bit-check.patch
 delete mode 100644 package/python/python-2.7-020-gentoo_py_dontcompile.patch
 delete mode 100644 package/python/python-2.7-030-fix-long-long-format.patch
 delete mode 100644 package/python/python-2.7-040-bytecode-generation-fix.patch
 create mode 100644 package/python/python-2.7-100-optional-test-modules.patch
 create mode 100644 package/python/python-2.7-101-optional-pydoc.patch
 create mode 100644 package/python/python-2.7-102-optional-2to3.patch
 create mode 100644 package/python/python-2.7-103-optional-sqlite.patch
 create mode 100644 package/python/python-2.7-104-optional-tk.patch
 create mode 100644 package/python/python-2.7-105-optional-curses.patch
 create mode 100644 package/python/python-2.7-106-optional-expat.patch
 create mode 100644 package/python/python-2.7-107-optional-codecs-cjk.patch
 create mode 100644 package/python/python-2.7-108-optional-nis.patch
 create mode 100644 package/python/python-2.7-109-optional-unicodedata.patch
 create mode 100644 package/python/python-2.7-110-optional-db.patch
 create mode 100644 package/python/python-2.7-111-optional-ssl.patch
 create mode 100644 package/python/python-2.7-112-optional-bzip2.patch
 create mode 100644 package/python/python-2.7-113-optional-zlib.patch

diff --git a/package/python/Config.in b/package/python/Config.in
index e77d7aa..11aa267 100644
--- a/package/python/Config.in
+++ b/package/python/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON
 	bool "python"
 	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_LIBFFI
 	help
 	  The python language interpreter.
 
@@ -9,17 +10,11 @@ config BR2_PACKAGE_PYTHON
 comment "python requires a toolchain with WCHAR support"
 	depends on !BR2_USE_WCHAR
 
-config BR2_PACKAGE_PYTHON_DEV
-	depends on BR2_PACKAGE_PYTHON
-	bool "development files on target"
-	help
-	  If enabled, development files (headers and static libpython) will be
-	  installed on the target.
+if BR2_PACKAGE_PYTHON
 
 choice
-	prompt "Module format to install"
-	depends on BR2_PACKAGE_PYTHON
-	default BR2_PACKAGE_PYTHON_PY_ONLY
+	prompt "python module format to install"
+	default BR2_PACKAGE_PYTHON_PYC_ONLY
 	help
 	  Select Python module format to install on target (py, pyc or both)
 
@@ -34,51 +29,40 @@ config BR2_PACKAGE_PYTHON_PY_PYC
 
 endchoice
 
+menu "core python modules"
+
 comment "The following modules are unusual or require extra libraries"
-	depends on BR2_PACKAGE_PYTHON
+
+config BR2_PACKAGE_PYTHON_BZIP2
+	select BR2_PACKAGE_BZIP2
+	bool "bzip2 module"
+	help
+	  bzip2 module for Python
 
 config BR2_PACKAGE_PYTHON_BSDDB
-	depends on BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_BERKELEYDB
 	bool "bsddb module"
 	help
 	  bsddb module for Python.
 
 config BR2_PACKAGE_PYTHON_CODECSCJK
-	depends on BR2_PACKAGE_PYTHON
 	bool "codecscjk module"
-	default y
 	help
 	  Chinese/Japanese/Korean codecs module for Python (large).
 
 config BR2_PACKAGE_PYTHON_CURSES
-	depends on BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_NCURSES
 	bool "curses module"
 	help
 	  curses module for Python.
 
-# config BR2_PACKAGE_PYTHON_GDBM
-# 	depends on BR2_PACKAGE_PYTHON
-# 	bool "gdbm module"
-# 	help
-# 	  gdbm module for Python.
-
-# config BR2_PACKAGE_PYTHON_NIS
-# 	depends on BR2_PACKAGE_PYTHON
-# 	bool "nis module"
-# 	help
-# 	  nis module for Python.
-
 config BR2_PACKAGE_PYTHON_PYEXPAT
-	depends on BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_EXPAT
 	bool "pyexpat"
 	help
 	  pyexpat module for Python.
 
 config BR2_PACKAGE_PYTHON_READLINE
-	depends on BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_READLINE
 	bool "readline"
 	help
@@ -86,22 +70,29 @@ config BR2_PACKAGE_PYTHON_READLINE
 	  editing in the Python shell).
 
 config BR2_PACKAGE_PYTHON_SSL
-	depends on BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_OPENSSL
 	bool "ssl"
 	help
 	  _ssl module for Python (required for https in urllib etc).
 
-config BR2_PACKAGE_PYTHON_TKINTER
-	depends on BR2_PACKAGE_PYTHON
-	select BR2_PACKAGE_TCL
-	bool "tkinter module"
-	help
-	  tkinter module for Python.
-
 config BR2_PACKAGE_PYTHON_UNICODEDATA
-	depends on BR2_PACKAGE_PYTHON
 	bool "unicodedata module"
 	default y
 	help
 	  Unicode character database (used by stringprep module) (large).
+
+config BR2_PACKAGE_PYTHON_SQLITE
+	bool "sqlite module"
+	select BR2_PACKAGE_SQLITE
+	help
+	  SQLite database support
+
+config BR2_PACKAGE_PYTHON_ZLIB
+	bool "zlib module"
+	select BR2_PACKAGE_ZLIB
+	help
+	  zlib support in Python
+
+endmenu
+
+endif
diff --git a/package/python/python-2.7-001-cross-compile.patch b/package/python/python-2.7-001-cross-compile.patch
deleted file mode 100644
index 1ee97a8..0000000
--- a/package/python/python-2.7-001-cross-compile.patch
+++ /dev/null
@@ -1,114 +0,0 @@
-Add cross-compilation support in the python Makefile and setup.py since
-python has no such support.
-
-The main point here is to first build a python interpreter to run on the
-host, and then use it to compile the target python.
-
-We also remove some error-generating code that is irrelevant in our
-situation, such as checking if we can import a cross-compiled module.
-
-Patch ported to python2.7 by Maxime Ripard <ripard@archos.com>
-
-diff -rduNp Python-2.7.orig/Makefile.pre.in Python-2.7/Makefile.pre.in
---- Python-2.7.orig/Makefile.pre.in	2010-04-12 02:10:46.000000000 +0200
-+++ Python-2.7/Makefile.pre.in	2010-09-21 16:46:07.000000000 +0200
-@@ -404,8 +404,8 @@ platform: $(BUILDPYTHON)
- # Build the shared modules
- sharedmods: $(BUILDPYTHON)
- 	@case $$MAKEFLAGS in \
--	*s*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' LDFLAGS='$(LDFLAGS)' OPT='$(OPT)' ./$(BUILDPYTHON) -E $(srcdir)/setup.py -q build;; \
--	*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' LDFLAGS='$(LDFLAGS)' OPT='$(OPT)' ./$(BUILDPYTHON) -E $(srcdir)/setup.py build;; \
-+	*s*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' LDFLAGS='$(LDFLAGS)' OPT='$(OPT)' $(HOSTPYTHON) -E $(srcdir)/setup.py -q build;; \
-+	*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' LDFLAGS='$(LDFLAGS)' OPT='$(OPT)' $(HOSTPYTHON) -E $(srcdir)/setup.py build;; \
- 	esac
- 
- # Build static library
-@@ -538,7 +538,7 @@ Modules/python.o: $(srcdir)/Modules/pyth
- 
- $(GRAMMAR_H) $(GRAMMAR_C): $(PGEN) $(GRAMMAR_INPUT)
- 		-@$(INSTALL) -d Include
--		-$(PGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
-+		-$(HOSTPGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
- 
- $(PGEN):	$(PGENOBJS)
- 		$(CC) $(OPT) $(LDFLAGS) $(PGENOBJS) $(LIBS) -o $(PGEN)
-@@ -920,25 +920,25 @@ libinstall:	build_all $(srcdir)/Lib/$(PL
- 	done
- 	$(INSTALL_DATA) $(srcdir)/LICENSE $(DESTDIR)$(LIBDEST)/LICENSE.txt
- 	PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
--		./$(BUILDPYTHON) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py \
-+		$(HOSTPYTHON) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py \
- 		-d $(LIBDEST) -f \
- 		-x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data' \
- 		$(DESTDIR)$(LIBDEST)
- 	PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
--		./$(BUILDPYTHON) -Wi -tt -O $(DESTDIR)$(LIBDEST)/compileall.py \
-+		$(HOSTPYTHON) -Wi -tt -O $(DESTDIR)$(LIBDEST)/compileall.py \
- 		-d $(LIBDEST) -f \
- 		-x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data' \
- 		$(DESTDIR)$(LIBDEST)
- 	-PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
--		./$(BUILDPYTHON) -Wi -t $(DESTDIR)$(LIBDEST)/compileall.py \
-+		$(HOSTPYTHON) -Wi -t $(DESTDIR)$(LIBDEST)/compileall.py \
- 		-d $(LIBDEST)/site-packages -f \
- 		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
- 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
--		./$(BUILDPYTHON) -Wi -t -O $(DESTDIR)$(LIBDEST)/compileall.py \
-+		$(HOSTPYTHON) -Wi -t -O $(DESTDIR)$(LIBDEST)/compileall.py \
- 		-d $(LIBDEST)/site-packages -f \
- 		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
- 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
--		./$(BUILDPYTHON) -Wi -t -c "import lib2to3.pygram, lib2to3.patcomp;lib2to3.patcomp.PatternCompiler()"
-+		$(HOSTPYTHON) -Wi -t -c "import lib2to3.pygram, lib2to3.patcomp;lib2to3.patcomp.PatternCompiler()"
- 
- # Create the PLATDIR source directory, if one wasn't distributed..
- $(srcdir)/Lib/$(PLATDIR):
-@@ -1043,7 +1043,7 @@ libainstall:	all python-config
- # Install the dynamically loadable modules
- # This goes into $(exec_prefix)
- sharedinstall:
--	$(RUNSHARED) ./$(BUILDPYTHON) -E $(srcdir)/setup.py install \
-+	$(RUNSHARED) $(HOSTPYTHON) -E $(srcdir)/setup.py install \
- 	   	--prefix=$(prefix) \
- 		--install-scripts=$(BINDIR) \
- 		--install-platlib=$(DESTSHARED) \
-diff -rduNp Python-2.7.orig/setup.py Python-2.7/setup.py
---- Python-2.7.orig/setup.py	2010-06-27 14:36:16.000000000 +0200
-+++ Python-2.7/setup.py	2010-09-21 16:59:59.000000000 +0200
-@@ -310,9 +310,9 @@ class PyBuildExt(build_ext):
-         try:
-             imp.load_dynamic(ext.name, ext_filename)
-         except ImportError, why:
--            self.failed.append(ext.name)
--            self.announce('*** WARNING: renaming "%s" since importing it'
--                          ' failed: %s' % (ext.name, why), level=3)
-+            self.announce('*** WARNING: Importing "%s" failed, probably '
-+                          'because of cross-compilation' % ext.name, level=3)
-+            return
-             assert not self.inplace
-             basename, tail = os.path.splitext(ext_filename)
-             newname = basename + "_failed" + tail
-@@ -346,10 +346,6 @@ class PyBuildExt(build_ext):
-         return sys.platform
- 
-     def detect_modules(self):
--        # Ensure that /usr/local is always used
--        add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
--        add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
--
-         # Add paths specified in the environment variables LDFLAGS and
-         # CPPFLAGS for header and library files.
-         # We must get the values from the Makefile and not the environment
-@@ -384,12 +380,6 @@ class PyBuildExt(build_ext):
-                     for directory in reversed(options.dirs):
-                         add_dir_to_list(dir_list, directory)
- 
--        if os.path.normpath(sys.prefix) != '/usr':
--            add_dir_to_list(self.compiler.library_dirs,
--                            sysconfig.get_config_var("LIBDIR"))
--            add_dir_to_list(self.compiler.include_dirs,
--                            sysconfig.get_config_var("INCLUDEDIR"))
--
-         try:
-             have_unicode = unicode
-         except NameError:
diff --git a/package/python/python-2.7-001-support-for-build.patch b/package/python/python-2.7-001-support-for-build.patch
new file mode 100644
index 0000000..2795e65
--- /dev/null
+++ b/package/python/python-2.7-001-support-for-build.patch
@@ -0,0 +1,153 @@
+Add support in Python build system to specify host tools
+
+Python needs a Python interpreter and a "pgen" program to build
+itself. Unfortunately, the Python build system assumes that it can use
+the interpreter and pgen program it has just built to build
+itself. Obviously, this cannot work in cross-compilation mode since
+the interpreter and the pgen program have been built for the target.
+
+Therefore, this patch adds support in the Python build system for the
+new PYTHON_FOR_BUILD and PGEN_FOR_BUILD variables, so that we can
+point Python ./configure script to the Python interpreter and pgen
+program that have been previously built for the host.
+
+Patch ported to python2.7 by Maxime Ripard <ripard@archos.com>, and
+later significantly reworked by Thomas Petazzoni
+<thomas.petazzoni@free-electrons.com>, with some inspiration taken
+from the Python patches of the PTXdist project.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ Makefile.pre.in |   32 +++++++++++++++++---------------
+ configure.in    |   17 +++++++++++++++++
+ 2 files changed, 34 insertions(+), 15 deletions(-)
+
+Index: Python-2.7.1/Makefile.pre.in
+===================================================================
+--- Python-2.7.1.orig/Makefile.pre.in
++++ Python-2.7.1/Makefile.pre.in
+@@ -178,7 +178,8 @@
+ UNICODE_OBJS=   @UNICODE_OBJS@
+ 
+ PYTHON=		python$(EXE)
+-BUILDPYTHON=	python$(BUILDEXE)
++BUILDPYTHON=	./python$(BUILDEXE)
++PYTHON_FOR_BUILD=@PYTHON_FOR_BUILD@
+ 
+ # The task to run while instrument when building the profile-opt target
+ PROFILE_TASK=	$(srcdir)/Tools/pybench/pybench.py -n 2 --with-gc --with-syscheck
+@@ -210,7 +211,8 @@
+ 
+ ##########################################################################
+ # Parser
+-PGEN=		Parser/pgen$(EXE)
++BUILDPGEN=	Parser/pgen$(EXE)
++PGEN_FOR_BUILD=@PGEN_FOR_BUILD@
+ 
+ POBJS=		\
+ 		Parser/acceler.o \
+@@ -404,8 +406,8 @@
+ # Build the shared modules
+ sharedmods: $(BUILDPYTHON)
+ 	@case $$MAKEFLAGS in \
+-	*s*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' ./$(BUILDPYTHON) -E $(srcdir)/setup.py -q build;; \
+-	*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' ./$(BUILDPYTHON) -E $(srcdir)/setup.py build;; \
++	*s*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' $(PYTHON_FOR_BUILD) -E $(srcdir)/setup.py -q build;; \
++	*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' $(PYTHON_FOR_BUILD) -E $(srcdir)/setup.py build;; \
+ 	esac
+ 
+ # Build static library
+@@ -536,12 +538,12 @@
+ 	$(MAINCC) -c $(PY_CFLAGS) -o $@ $(srcdir)/Modules/python.c
+ 
+ 
+-$(GRAMMAR_H) $(GRAMMAR_C): $(PGEN) $(GRAMMAR_INPUT)
++$(GRAMMAR_H) $(GRAMMAR_C): $(PGEN_FOR_BUILD) $(GRAMMAR_INPUT)
+ 		-@$(INSTALL) -d Include
+-		-$(PGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
++		-$(PGEN_FOR_BUILD) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
+ 
+-$(PGEN):	$(PGENOBJS)
+-		$(CC) $(OPT) $(LDFLAGS) $(PGENOBJS) $(LIBS) -o $(PGEN)
++$(BUILDPGEN):	$(PGENOBJS)
++		$(CC) $(OPT) $(LDFLAGS) $(PGENOBJS) $(LIBS) -o $(BUILDPGEN)
+ 
+ Parser/grammar.o:	$(srcdir)/Parser/grammar.c \
+ 				$(srcdir)/Include/token.h \
+@@ -921,25 +923,25 @@
+ 	done
+ 	$(INSTALL_DATA) $(srcdir)/LICENSE $(DESTDIR)$(LIBDEST)/LICENSE.txt
+ 	PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
+-		./$(BUILDPYTHON) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py \
++		$(PYTHON_FOR_BUILD) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py \
+ 		-d $(LIBDEST) -f \
+ 		-x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data' \
+ 		$(DESTDIR)$(LIBDEST)
+ 	PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
+-		./$(BUILDPYTHON) -Wi -tt -O $(DESTDIR)$(LIBDEST)/compileall.py \
++		$(PYTHON_FOR_BUILD) -Wi -tt -O $(DESTDIR)$(LIBDEST)/compileall.py \
+ 		-d $(LIBDEST) -f \
+ 		-x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data' \
+ 		$(DESTDIR)$(LIBDEST)
+ 	-PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
+-		./$(BUILDPYTHON) -Wi -t $(DESTDIR)$(LIBDEST)/compileall.py \
++		$(PYTHON_FOR_BUILD) -Wi -t $(DESTDIR)$(LIBDEST)/compileall.py \
+ 		-d $(LIBDEST)/site-packages -f \
+ 		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
+ 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
+-		./$(BUILDPYTHON) -Wi -t -O $(DESTDIR)$(LIBDEST)/compileall.py \
++		$(PYTHON_FOR_BUILD) -Wi -t -O $(DESTDIR)$(LIBDEST)/compileall.py \
+ 		-d $(LIBDEST)/site-packages -f \
+ 		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
+ 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
+-		./$(BUILDPYTHON) -Wi -t -c "import lib2to3.pygram, lib2to3.patcomp;lib2to3.patcomp.PatternCompiler()"
++		$(PYTHON_FOR_BUILD) -Wi -t -c "import lib2to3.pygram, lib2to3.patcomp;lib2to3.patcomp.PatternCompiler()"
+ 
+ # Create the PLATDIR source directory, if one wasn't distributed..
+ $(srcdir)/Lib/$(PLATDIR):
+@@ -1044,7 +1046,7 @@
+ # Install the dynamically loadable modules
+ # This goes into $(exec_prefix)
+ sharedinstall: sharedmods
+-	$(RUNSHARED) ./$(BUILDPYTHON) -E $(srcdir)/setup.py install \
++	$(RUNSHARED) $(PYTHON_FOR_BUILD) -E $(srcdir)/setup.py install \
+ 	   	--prefix=$(prefix) \
+ 		--install-scripts=$(BINDIR) \
+ 		--install-platlib=$(DESTSHARED) \
+@@ -1183,7 +1185,7 @@
+ 	find . -name '*.gc??' -exec rm -f {} ';'
+ 
+ clobber: clean profile-removal
+-	-rm -f $(BUILDPYTHON) $(PGEN) $(LIBRARY) $(LDLIBRARY) $(DLLLIBRARY) \
++	-rm -f $(BUILDPYTHON) $(BUILDPGEN) $(LIBRARY) $(LDLIBRARY) $(DLLLIBRARY) \
+ 		tags TAGS \
+ 		config.cache config.log pyconfig.h Modules/config.c
+ 	-rm -rf build platform
+Index: Python-2.7.1/configure.in
+===================================================================
+--- Python-2.7.1.orig/configure.in
++++ Python-2.7.1/configure.in
+@@ -4291,6 +4291,23 @@
+ done
+ AC_MSG_RESULT(done)
+ 
++if test "$cross_compiling" = "yes"; then
++   AC_MSG_CHECKING(python for build)
++   PYTHON_FOR_BUILD="${PYTHON_FOR_BUILD}"
++   AC_MSG_RESULT($PYTHON_FOR_BUILD)
++   AC_MSG_CHECKING(pgen for build)
++   PGEN_FOR_BUILD="${PGEN_FOR_BUILD}"
++   AC_MSG_RESULT($PGEN_FOR_BUILD)
++else
++   PYTHON_FOR_BUILD='$(BUILDPYTHON)'
++   PGEN_FOR_BUILD='$(BUILDPGEN)'
++fi
++
++AC_SUBST(PYTHON_FOR_BUILD)
++AC_SUBST(PGEN_FOR_BUILD)
++AC_ARG_VAR(PYTHON_FOR_BUILD,[build system Python])
++AC_ARG_VAR(PGEN_FOR_BUILD,[build system Python pgen])
++
+ # generate output files
+ AC_CONFIG_FILES(Makefile.pre Modules/Setup.config Misc/python.pc)
+ AC_CONFIG_FILES([Modules/ld_so_aix], [chmod +x Modules/ld_so_aix])
diff --git a/package/python/python-2.7-002-cross-compile-variable.patch b/package/python/python-2.7-002-cross-compile-variable.patch
new file mode 100644
index 0000000..04b71b0
--- /dev/null
+++ b/package/python/python-2.7-002-cross-compile-variable.patch
@@ -0,0 +1,55 @@
+Pass a CROSS_COMPILING variable to setup.py
+
+The setup.py script in the Python source code plays a significant role
+in the Python build process. It is responsible for building all the
+modules and extensions, and due to this, does various checks that need
+to be adjusted when we are cross-compiling.
+
+For that reason, this patch makes sure that a CROSS_COMPILING variable
+is passed in the environment of the setup.py script. Later patches in
+the stack make use of this variable.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ Makefile.pre.in |    6 +++---
+ configure.in    |    3 +++
+ 2 files changed, 6 insertions(+), 3 deletions(-)
+
+Index: Python-2.7.1/Makefile.pre.in
+===================================================================
+--- Python-2.7.1.orig/Makefile.pre.in
++++ Python-2.7.1/Makefile.pre.in
+@@ -406,8 +406,8 @@
+ # Build the shared modules
+ sharedmods: $(BUILDPYTHON)
+ 	@case $$MAKEFLAGS in \
+-	*s*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' $(PYTHON_FOR_BUILD) -E $(srcdir)/setup.py -q build;; \
+-	*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' $(PYTHON_FOR_BUILD) -E $(srcdir)/setup.py build;; \
++	*s*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' CROSS_COMPILING=@CROSS_COMPILING@ $(PYTHON_FOR_BUILD) -E $(srcdir)/setup.py -q build;; \
++	*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' CROSS_COMPILING=@CROSS_COMPILING@ $(PYTHON_FOR_BUILD) -E $(srcdir)/setup.py build;; \
+ 	esac
+ 
+ # Build static library
+@@ -1046,7 +1046,7 @@
+ # Install the dynamically loadable modules
+ # This goes into $(exec_prefix)
+ sharedinstall: sharedmods
+-	$(RUNSHARED) $(PYTHON_FOR_BUILD) -E $(srcdir)/setup.py install \
++	$(RUNSHARED) CROSS_COMPILING=@CROSS_COMPILING@ $(PYTHON_FOR_BUILD) -E $(srcdir)/setup.py install \
+ 	   	--prefix=$(prefix) \
+ 		--install-scripts=$(BINDIR) \
+ 		--install-platlib=$(DESTSHARED) \
+Index: Python-2.7.1/configure.in
+===================================================================
+--- Python-2.7.1.orig/configure.in
++++ Python-2.7.1/configure.in
+@@ -4308,6 +4308,9 @@
+ AC_ARG_VAR(PYTHON_FOR_BUILD,[build system Python])
+ AC_ARG_VAR(PGEN_FOR_BUILD,[build system Python pgen])
+ 
++CROSS_COMPILING=$cross_compiling
++AC_SUBST(CROSS_COMPILING)
++
+ # generate output files
+ AC_CONFIG_FILES(Makefile.pre Modules/Setup.config Misc/python.pc)
+ AC_CONFIG_FILES([Modules/ld_so_aix], [chmod +x Modules/ld_so_aix])
diff --git a/package/python/python-2.7-002-cross-compile.patch b/package/python/python-2.7-002-cross-compile.patch
deleted file mode 100644
index 598e5f5..0000000
--- a/package/python/python-2.7-002-cross-compile.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-Second patch to bring cross-compilation support to python build-system.
-
-Allow the libraries detection routine to look for headers and libs in
-other directories than /usr/include or /usr/lib through the env variables
-PYTHON_MODULES_INCLUDE and PYTHON_MODULES_LIB.
-
-We can then use it to look for libraries in the buildroot staging directory.
-
-
-Patch ported to python2.7 by Maxime Ripard <ripard@archos.com>
-
-diff -rduNp Python-2.7.orig/setup.py Python-2.7/setup.py
---- Python-2.7.orig/setup.py	2010-09-21 17:15:31.000000000 +0200
-+++ Python-2.7/setup.py	2010-09-21 17:20:46.000000000 +0200
-@@ -346,6 +346,18 @@ class PyBuildExt(build_ext):
-         return sys.platform
- 
-     def detect_modules(self):
-+        try:
-+            modules_include_dirs = os.environ["PYTHON_MODULES_INCLUDE"].split()
-+        except KeyError:
-+            modules_include_dirs = ['/usr/include']
-+        try:
-+            modules_lib_dirs = os.environ["PYTHON_MODULES_LIB"].split()
-+        except KeyError:
-+            modules_include_dirs = ['/usr/lib']
-+        for dir in modules_include_dirs:
-+            add_dir_to_list(self.compiler.include_dirs, dir)
-+        for dir in modules_lib_dirs:
-+            add_dir_to_list(self.compiler.library_dirs, dir)
-         # Add paths specified in the environment variables LDFLAGS and
-         # CPPFLAGS for header and library files.
-         # We must get the values from the Makefile and not the environment
-@@ -388,11 +400,8 @@ class PyBuildExt(build_ext):
-         # lib_dirs and inc_dirs are used to search for files;
-         # if a file is found in one of those directories, it can
-         # be assumed that no additional -I,-L directives are needed.
--        lib_dirs = self.compiler.library_dirs + [
--            '/lib64', '/usr/lib64',
--            '/lib', '/usr/lib',
--            ]
--        inc_dirs = self.compiler.include_dirs + ['/usr/include']
-+        lib_dirs = self.compiler.library_dirs
-+        inc_dirs = self.compiler.include_dirs
-         exts = []
-         missing = []
- 
diff --git a/package/python/python-2.7-003-no-import-when-cross-compiling.patch b/package/python/python-2.7-003-no-import-when-cross-compiling.patch
new file mode 100644
index 0000000..162ba50
--- /dev/null
+++ b/package/python/python-2.7-003-no-import-when-cross-compiling.patch
@@ -0,0 +1,26 @@
+Disable import check when cross-compiling
+
+Once Python has compiled an extension (i.e some C code, potentially
+linked to a library), it tries to import it. This cannot work in
+cross-compilation mode, so we just disable this check.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ setup.py |    4 ++++
+ 1 file changed, 4 insertions(+)
+
+Index: Python-2.7.1/setup.py
+===================================================================
+--- Python-2.7.1.orig/setup.py
++++ Python-2.7.1/setup.py
+@@ -304,6 +304,10 @@
+             self.announce('WARNING: skipping import check for Cygwin-based "%s"'
+                 % ext.name)
+             return
++        if os.environ.get('CROSS_COMPILING') == 'yes':
++            self.announce('WARNING: skipping import check for cross compiled "%s"'
++                          % ext.name)
++            return
+         ext_filename = os.path.join(
+             self.build_lib,
+             self.get_ext_filename(self.get_ext_fullname(ext.name)))
diff --git a/package/python/python-2.7-004-no-host-headers-libs.patch b/package/python/python-2.7-004-no-host-headers-libs.patch
new file mode 100644
index 0000000..033776d
--- /dev/null
+++ b/package/python/python-2.7-004-no-host-headers-libs.patch
@@ -0,0 +1,97 @@
+Do not look at host headers/libraries in cross-compile mode
+
+When we are cross-compiling, setup.py should never look in /usr or
+/usr/local to find headers or libraries. A later patch adds a
+mechanism to tell setup.py to look in a specific directory for headers
+and libraries.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ setup.py |   39 +++++++++++++++++++++------------------
+ 1 file changed, 21 insertions(+), 18 deletions(-)
+
+Index: Python-2.7.1/setup.py
+===================================================================
+--- Python-2.7.1.orig/setup.py
++++ Python-2.7.1/setup.py
+@@ -351,8 +351,9 @@
+ 
+     def detect_modules(self):
+         # Ensure that /usr/local is always used
+-        add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
+-        add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
++        if os.environ.get('CROSS_COMPILING') != 'yes':
++            add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
++            add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
+ 
+         # Add paths specified in the environment variables LDFLAGS and
+         # CPPFLAGS for header and library files.
+@@ -388,17 +389,6 @@
+                     for directory in reversed(options.dirs):
+                         add_dir_to_list(dir_list, directory)
+ 
+-        if os.path.normpath(sys.prefix) != '/usr' \
+-                and not sysconfig.get_config_var('PYTHONFRAMEWORK'):
+-            # OSX note: Don't add LIBDIR and INCLUDEDIR to building a framework
+-            # (PYTHONFRAMEWORK is set) to avoid # linking problems when
+-            # building a framework with different architectures than
+-            # the one that is currently installed (issue #7473)
+-            add_dir_to_list(self.compiler.library_dirs,
+-                            sysconfig.get_config_var("LIBDIR"))
+-            add_dir_to_list(self.compiler.include_dirs,
+-                            sysconfig.get_config_var("INCLUDEDIR"))
+-
+         try:
+             have_unicode = unicode
+         except NameError:
+@@ -407,11 +397,16 @@
+         # lib_dirs and inc_dirs are used to search for files;
+         # if a file is found in one of those directories, it can
+         # be assumed that no additional -I,-L directives are needed.
+-        lib_dirs = self.compiler.library_dirs + [
+-            '/lib64', '/usr/lib64',
+-            '/lib', '/usr/lib',
+-            ]
+-        inc_dirs = self.compiler.include_dirs + ['/usr/include']
++        lib_dirs = self.compiler.library_dirs
++        inc_dirs = self.compiler.include_dirs
++
++        if os.environ.get('CROSS_COMPILING') != 'yes':
++            lib_dirs += [
++                '/lib64', '/usr/lib64',
++                '/lib', '/usr/lib',
++                ]
++            inc_dirs += ['/usr/include']
++
+         exts = []
+         missing = []
+ 
+@@ -844,6 +839,9 @@
+             db_inc_paths.append('/pkg/db-3.%d/include' % x)
+             db_inc_paths.append('/opt/db-3.%d/include' % x)
+ 
++        if os.environ.get('CROSS_COMPILING') == 'yes':
++            db_inc_paths = []
++
+         # Add some common subdirectories for Sleepycat DB to the list,
+         # based on the standard include directories. This way DB3/4 gets
+         # picked up when it is installed in a non-standard prefix and
+@@ -996,6 +994,9 @@
+         MIN_SQLITE_VERSION = ".".join([str(x)
+                                     for x in MIN_SQLITE_VERSION_NUMBER])
+ 
++        if os.environ.get('CROSS_COMPILING') == 'yes':
++            sqlite_inc_paths = []
++
+         # Scan the default include directories before the SQLite specific
+         # ones. This allows one to override the copy of sqlite on OSX,
+         # where /usr/include contains an old version of sqlite.
+@@ -1095,6 +1096,8 @@
+         # the more recent berkeleydb's db.h file first in the include path
+         # when attempting to compile and it will fail.
+         f = "/usr/include/db.h"
++        if os.environ.get('CROSS_COMPILING') == 'yes':
++            f = ''
+ 
+         if sys.platform == 'darwin':
+             if is_macosx_sdk_path(f):
diff --git a/package/python/python-2.7-005-staging-headers-libs.patch b/package/python/python-2.7-005-staging-headers-libs.patch
new file mode 100644
index 0000000..ab3d88e
--- /dev/null
+++ b/package/python/python-2.7-005-staging-headers-libs.patch
@@ -0,0 +1,38 @@
+Tell setup.py the location of headers/libraries
+
+Allow the libraries detection routine to look for headers and libs in
+other directories than /usr/include or /usr/lib through the
+environment variables PYTHON_MODULES_INCLUDE and PYTHON_MODULES_LIB.
+
+We can then use it to look for libraries in the buildroot staging
+directory.
+
+Patch ported to python2.7 by Maxime Ripard <ripard@archos.com>
+---
+ setup.py |   13 +++++++++++++
+ 1 file changed, 13 insertions(+)
+
+Index: Python-2.7.1/setup.py
+===================================================================
+--- Python-2.7.1.orig/setup.py
++++ Python-2.7.1/setup.py
+@@ -350,6 +350,19 @@
+         return sys.platform
+ 
+     def detect_modules(self):
++        try:
++            modules_include_dirs = os.environ["PYTHON_MODULES_INCLUDE"].split()
++        except KeyError:
++            modules_include_dirs = ['/usr/include']
++        try:
++            modules_lib_dirs = os.environ["PYTHON_MODULES_LIB"].split()
++        except KeyError:
++            modules_include_dirs = ['/usr/lib']
++        for dir in modules_include_dirs:
++            add_dir_to_list(self.compiler.include_dirs, dir)
++        for dir in modules_lib_dirs:
++            add_dir_to_list(self.compiler.library_dirs, dir)
++
+         # Ensure that /usr/local is always used
+         if os.environ.get('CROSS_COMPILING') != 'yes':
+             add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
diff --git a/package/python/python-2.7-006-disable-extensions.patch b/package/python/python-2.7-006-disable-extensions.patch
new file mode 100644
index 0000000..642ebc5
--- /dev/null
+++ b/package/python/python-2.7-006-disable-extensions.patch
@@ -0,0 +1,102 @@
+Add infrastructure to disable the build of certain extensions
+
+Some of the extensions part of the Python core have dependencies on
+external libraries (sqlite, tk, etc.) or are relatively big and not
+necessarly always useful (CJK codecs for example). By extensions, we
+mean part of Python modules that are written in C and therefore
+compiled to binary code.
+
+Therefore, we introduce a small infrastructure that allows to disable
+some of those extensions. This can be done inside the configure.in by
+adding values to the DISABLED_EXTENSIONS variable (which is a
+word-separated list of extensions).
+
+The implementation works as follow :
+
+ * configure.in defines a DISABLED_EXTENSIONS variable, which is
+   substituted (so that when Makefile.pre is generated from
+   Makefile.pre.in, the value of the variable is substituted). For
+   now, this DISABLED_EXTENSIONS variable is empty, later patches will
+   use it.
+
+ * Makefile.pre.in passes the DISABLED_EXTENSIONS value down to the
+   variables passed in the environment when calling the setup.py
+   script that actually builds and installs those extensions.
+
+ * setup.py is modified so that the existing "disabled_module_list" is
+   filled with those pre-disabled extensions listed in
+   DISABLED_EXTENSIONS.
+
+Patch ported to python2.7 by Maxime Ripard <ripard@archos.com>, and
+then extended by Thomas Petazzoni
+<thomas.petazzoni@free-electrons.com>.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ Makefile.pre.in |    8 +++++---
+ configure.in    |    2 ++
+ setup.py        |    5 ++++-
+ 3 files changed, 11 insertions(+), 4 deletions(-)
+
+Index: Python-2.7.1/Makefile.pre.in
+===================================================================
+--- Python-2.7.1.orig/Makefile.pre.in
++++ Python-2.7.1/Makefile.pre.in
+@@ -141,6 +141,8 @@
+ # configure script arguments
+ CONFIG_ARGS=	@CONFIG_ARGS@
+ 
++# disabled extensions
++DISABLED_EXTENSIONS=	@DISABLED_EXTENSIONS@
+ 
+ # Subdirectories with code
+ SRCDIRS= 	@SRCDIRS@
+@@ -406,8 +408,8 @@
+ # Build the shared modules
+ sharedmods: $(BUILDPYTHON)
+ 	@case $$MAKEFLAGS in \
+-	*s*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' CROSS_COMPILING=@CROSS_COMPILING@ $(PYTHON_FOR_BUILD) -E $(srcdir)/setup.py -q build;; \
+-	*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' CROSS_COMPILING=@CROSS_COMPILING@ $(PYTHON_FOR_BUILD) -E $(srcdir)/setup.py build;; \
++	*s*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' CROSS_COMPILING=@CROSS_COMPILING@ DISABLED_EXTENSIONS="$(DISABLED_EXTENSIONS)" $(PYTHON_FOR_BUILD) -E $(srcdir)/setup.py -q build;; \
++	*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' CROSS_COMPILING=@CROSS_COMPILING@ DISABLED_EXTENSIONS="$(DISABLED_EXTENSIONS)" $(PYTHON_FOR_BUILD) -E $(srcdir)/setup.py build;; \
+ 	esac
+ 
+ # Build static library
+@@ -1046,7 +1048,7 @@
+ # Install the dynamically loadable modules
+ # This goes into $(exec_prefix)
+ sharedinstall: sharedmods
+-	$(RUNSHARED) CROSS_COMPILING=@CROSS_COMPILING@ $(PYTHON_FOR_BUILD) -E $(srcdir)/setup.py install \
++	$(RUNSHARED) CROSS_COMPILING=@CROSS_COMPILING@ DISABLED_EXTENSIONS="$(DISABLED_EXTENSIONS)" $(PYTHON_FOR_BUILD) -E $(srcdir)/setup.py install \
+ 	   	--prefix=$(prefix) \
+ 		--install-scripts=$(BINDIR) \
+ 		--install-platlib=$(DESTSHARED) \
+Index: Python-2.7.1/configure.in
+===================================================================
+--- Python-2.7.1.orig/configure.in
++++ Python-2.7.1/configure.in
+@@ -2084,6 +2084,8 @@
+ 
+ AC_PATH_TOOL([PKG_CONFIG], [pkg-config])
+ 
++AC_SUBST(DISABLED_EXTENSIONS)
++
+ # Check for use of the system expat library
+ AC_MSG_CHECKING(for --with-system-expat)
+ AC_ARG_WITH(system_expat,
+Index: Python-2.7.1/setup.py
+===================================================================
+--- Python-2.7.1.orig/setup.py
++++ Python-2.7.1/setup.py
+@@ -21,7 +21,10 @@
+ COMPILED_WITH_PYDEBUG = hasattr(sys, 'gettotalrefcount')
+ 
+ # This global variable is used to hold the list of modules to be disabled.
+-disabled_module_list = []
++try:
++    disabled_module_list = sysconfig.get_config_var("DISABLED_EXTENSIONS").split(" ")
++except KeyError:
++    disabled_module_list = list()
+ 
+ def add_dir_to_list(dirlist, dir):
+     """Add the directory 'dir' to the list 'dirlist' (at the front) if
diff --git a/package/python/python-2.7-007-do-not-generate-pyo-files.patch b/package/python/python-2.7-007-do-not-generate-pyo-files.patch
new file mode 100644
index 0000000..2cb90cc
--- /dev/null
+++ b/package/python/python-2.7-007-do-not-generate-pyo-files.patch
@@ -0,0 +1,40 @@
+Do not generate .pyo files
+
+By default, the Python installation byte-compiles all modules in two
+forms: the normal bytecode (.pyc) and an optimized bytecode (.pyo).
+
+According to
+http://www.network-theory.co.uk/docs/pytut/CompiledPythonfiles.html,
+the optimization do not do anything useful, and generating both the
+"non-optimized" and "optimized" bytecode variants takes time.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ Makefile.pre.in |    9 ---------
+ 1 file changed, 9 deletions(-)
+
+Index: Python-2.7.1/Makefile.pre.in
+===================================================================
+--- Python-2.7.1.orig/Makefile.pre.in
++++ Python-2.7.1/Makefile.pre.in
+@@ -929,20 +929,11 @@
+ 		-d $(LIBDEST) -f \
+ 		-x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data' \
+ 		$(DESTDIR)$(LIBDEST)
+-	PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
+-		$(PYTHON_FOR_BUILD) -Wi -tt -O $(DESTDIR)$(LIBDEST)/compileall.py \
+-		-d $(LIBDEST) -f \
+-		-x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data' \
+-		$(DESTDIR)$(LIBDEST)
+ 	-PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
+ 		$(PYTHON_FOR_BUILD) -Wi -t $(DESTDIR)$(LIBDEST)/compileall.py \
+ 		-d $(LIBDEST)/site-packages -f \
+ 		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
+ 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
+-		$(PYTHON_FOR_BUILD) -Wi -t -O $(DESTDIR)$(LIBDEST)/compileall.py \
+-		-d $(LIBDEST)/site-packages -f \
+-		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
+-	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
+ 		$(PYTHON_FOR_BUILD) -Wi -t -c "import lib2to3.pygram, lib2to3.patcomp;lib2to3.patcomp.PatternCompiler()"
+ 
+ # Create the PLATDIR source directory, if one wasn't distributed..
diff --git a/package/python/python-2.7-008-reread-environment.patch b/package/python/python-2.7-008-reread-environment.patch
new file mode 100644
index 0000000..e36d0cf
--- /dev/null
+++ b/package/python/python-2.7-008-reread-environment.patch
@@ -0,0 +1,65 @@
+Make sure setup.py reads the correct CONFIG_ARGS
+
+The setup.py script that builds and installs all the Python modules
+shipped with the interpreter looks at the CONFIG_ARGS variable stored
+in the "sysconfig" module to look at the ./configure options and
+adjust its behaviour accordingly.
+
+Unfortunately, when cross-compiling, the value of CONFIG_ARGS returned
+by the sysconfig are the one passed to the ./configure script of the
+*host* Python and not the one we're currently building for the target.
+
+In order to avoid that, we re-initialize the values in the sysconfig
+module by re-reading the environment at the beginning of the setup.py
+script, and we make sure that the CONFIG_ARGS variable is actually
+part of the environment of setup.py.
+
+See the beginning of
+http://article.gmane.org/gmane.comp.python.devel/99772 for the
+inspiration.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+---
+ Makefile.pre.in |    6 +++---
+ setup.py        |    3 +++
+ 2 files changed, 6 insertions(+), 3 deletions(-)
+
+Index: Python-2.7.1/Makefile.pre.in
+===================================================================
+--- Python-2.7.1.orig/Makefile.pre.in
++++ Python-2.7.1/Makefile.pre.in
+@@ -408,8 +408,8 @@
+ # Build the shared modules
+ sharedmods: $(BUILDPYTHON)
+ 	@case $$MAKEFLAGS in \
+-	*s*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' CROSS_COMPILING=@CROSS_COMPILING@ DISABLED_EXTENSIONS="$(DISABLED_EXTENSIONS)" $(PYTHON_FOR_BUILD) -E $(srcdir)/setup.py -q build;; \
+-	*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' CROSS_COMPILING=@CROSS_COMPILING@ DISABLED_EXTENSIONS="$(DISABLED_EXTENSIONS)" $(PYTHON_FOR_BUILD) -E $(srcdir)/setup.py build;; \
++	*s*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' CROSS_COMPILING=@CROSS_COMPILING@ DISABLED_EXTENSIONS="$(DISABLED_EXTENSIONS)" CONFIG_ARGS="$(CONFIG_ARGS)" $(PYTHON_FOR_BUILD) -E $(srcdir)/setup.py -q build;; \
++	*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' CROSS_COMPILING=@CROSS_COMPILING@ DISABLED_EXTENSIONS="$(DISABLED_EXTENSIONS)" CONFIG_ARGS="$(CONFIG_ARGS)" $(PYTHON_FOR_BUILD) -E $(srcdir)/setup.py build;; \
+ 	esac
+ 
+ # Build static library
+@@ -1039,7 +1039,7 @@
+ # Install the dynamically loadable modules
+ # This goes into $(exec_prefix)
+ sharedinstall: sharedmods
+-	$(RUNSHARED) CROSS_COMPILING=@CROSS_COMPILING@ DISABLED_EXTENSIONS="$(DISABLED_EXTENSIONS)" $(PYTHON_FOR_BUILD) -E $(srcdir)/setup.py install \
++	$(RUNSHARED) CROSS_COMPILING=@CROSS_COMPILING@ DISABLED_EXTENSIONS="$(DISABLED_EXTENSIONS)" CONFIG_ARGS="$(CONFIG_ARGS)" $(PYTHON_FOR_BUILD) -E $(srcdir)/setup.py install \
+ 	   	--prefix=$(prefix) \
+ 		--install-scripts=$(BINDIR) \
+ 		--install-platlib=$(DESTSHARED) \
+Index: Python-2.7.1/setup.py
+===================================================================
+--- Python-2.7.1.orig/setup.py
++++ Python-2.7.1/setup.py
+@@ -20,6 +20,9 @@
+ # Were we compiled --with-pydebug or with #define Py_DEBUG?
+ COMPILED_WITH_PYDEBUG = hasattr(sys, 'gettotalrefcount')
+ 
++sysconfig.get_config_vars()
++sysconfig._CONFIG_VARS.update(os.environ)
++
+ # This global variable is used to hold the list of modules to be disabled.
+ try:
+     disabled_module_list = sysconfig.get_config_var("DISABLED_EXTENSIONS").split(" ")
diff --git a/package/python/python-2.7-009-python-symlink.patch b/package/python/python-2.7-009-python-symlink.patch
new file mode 100644
index 0000000..f284dba
--- /dev/null
+++ b/package/python/python-2.7-009-python-symlink.patch
@@ -0,0 +1,25 @@
+Use a symlink between python and pythonVERSION
+
+By default, a hard link is used between /usr/bin/python and
+/usr/bin/pythonVERSION. Using hard links for such things is fairly
+uncommon, so let's make a symbolic link instead.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+---
+ Makefile.pre.in |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: Python-2.7.1/Makefile.pre.in
+===================================================================
+--- Python-2.7.1.orig/Makefile.pre.in
++++ Python-2.7.1/Makefile.pre.in
+@@ -791,7 +791,7 @@
+ 	then rm -f $(DESTDIR)$(BINDIR)/$(PYTHON); \
+ 	else true; \
+ 	fi
+-	(cd $(DESTDIR)$(BINDIR); $(LN) python$(VERSION)$(EXE) $(PYTHON))
++	(cd $(DESTDIR)$(BINDIR); $(LN) -s python$(VERSION)$(EXE) $(PYTHON))
+ 	-rm -f $(DESTDIR)$(BINDIR)/python-config
+ 	(cd $(DESTDIR)$(BINDIR); $(LN) -s python$(VERSION)-config python-config)
+ 	-test -d $(DESTDIR)$(LIBPC) || $(INSTALL) -d -m $(DIRMODE) $(DESTDIR)$(LIBPC)
diff --git a/package/python/python-2.7-010-change-pyconfig-h-location.patch b/package/python/python-2.7-010-change-pyconfig-h-location.patch
new file mode 100644
index 0000000..fddc6c8
--- /dev/null
+++ b/package/python/python-2.7-010-change-pyconfig-h-location.patch
@@ -0,0 +1,76 @@
+Change the location of pyconfig.h
+
+The Python interpreter has a really strange behaviour: at *runtime*,
+it reads a Makefile and a header file named pyconfig.h to get some
+information about the configuration.
+
+The Makefile is located in usr/lib/python2.7/config, which is fine
+since this location is kept on the target.
+
+However, by default, the pyconfig.h is installed in
+usr/include/python2.7, but we completely remove the usr/include
+directory for the target. Since making an exception just for
+pyconfig.h is annoying, this patch also installs pyconfig.h to
+usr/lib/python2.7/config, and modifies the sysconfig module so that it
+looks in this location instead of usr/include.
+
+The pyconfig.h is still kept in usr/include/python2.7, because it is
+needed in the $(STAGING_DIR) when building third-party Python
+extensions that contain C code.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+---
+ Lib/distutils/sysconfig.py |    3 ++-
+ Lib/sysconfig.py           |    2 +-
+ Makefile.pre.in            |    3 ++-
+ 3 files changed, 5 insertions(+), 3 deletions(-)
+
+Index: Python-2.7.1/Lib/distutils/sysconfig.py
+===================================================================
+--- Python-2.7.1.orig/Lib/distutils/sysconfig.py
++++ Python-2.7.1/Lib/distutils/sysconfig.py
+@@ -193,7 +193,8 @@
+         else:
+             inc_dir = project_base
+     else:
+-        inc_dir = get_python_inc(plat_specific=1)
++        lib_dir = get_python_lib(plat_specific=1, standard_lib=1)
++        inc_dir = os.path.join(lib_dir, "config")
+     if get_python_version() < '2.2':
+         config_h = 'config.h'
+     else:
+Index: Python-2.7.1/Lib/sysconfig.py
+===================================================================
+--- Python-2.7.1.orig/Lib/sysconfig.py
++++ Python-2.7.1/Lib/sysconfig.py
+@@ -371,7 +371,7 @@
+         else:
+             inc_dir = _PROJECT_BASE
+     else:
+-        inc_dir = get_path('platinclude')
++        inc_dir = os.path.join(get_path('stdlib'), "config")
+     return os.path.join(inc_dir, 'pyconfig.h')
+ 
+ def get_scheme_names():
+Index: Python-2.7.1/Makefile.pre.in
+===================================================================
+--- Python-2.7.1.orig/Makefile.pre.in
++++ Python-2.7.1/Makefile.pre.in
+@@ -967,7 +967,6 @@
+ 		echo $(INSTALL_DATA) $$i $(INCLUDEPY); \
+ 		$(INSTALL_DATA) $$i $(DESTDIR)$(INCLUDEPY); \
+ 	done
+-	$(INSTALL_DATA) pyconfig.h $(DESTDIR)$(CONFINCLUDEPY)/pyconfig.h
+ 
+ # Install the library and miscellaneous stuff needed for extending/embedding
+ # This goes into $(exec_prefix)
+@@ -1001,6 +1000,8 @@
+ 	$(INSTALL_DATA) Modules/python.o $(DESTDIR)$(LIBPL)/python.o
+ 	$(INSTALL_DATA) $(srcdir)/Modules/config.c.in $(DESTDIR)$(LIBPL)/config.c.in
+ 	$(INSTALL_DATA) Makefile $(DESTDIR)$(LIBPL)/Makefile
++	$(INSTALL_DATA) pyconfig.h $(DESTDIR)$(LIBPL)/pyconfig.h
++	$(INSTALL_DATA) pyconfig.h $(DESTDIR)$(CONFINCLUDEPY)/pyconfig.h
+ 	$(INSTALL_DATA) Modules/Setup $(DESTDIR)$(LIBPL)/Setup
+ 	$(INSTALL_DATA) Modules/Setup.local $(DESTDIR)$(LIBPL)/Setup.local
+ 	$(INSTALL_DATA) Modules/Setup.config $(DESTDIR)$(LIBPL)/Setup.config
diff --git a/package/python/python-2.7-010-disable_modules_and_ssl.patch b/package/python/python-2.7-010-disable_modules_and_ssl.patch
deleted file mode 100644
index 492e372..0000000
--- a/package/python/python-2.7-010-disable_modules_and_ssl.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-Support some customisation on python compilation.
-
-With this patch, we can now remove some modules introducing external
-dependencies from the compilation, thus removing these irrelevant in most
-cases dependencies (ie. openssl, ncurses, etc).
-
-This modules can be removed by listing them in the PYTHON_DISABLE_MODULES
-environment variable.
-
-Patch ported to python2.7 by Maxime Ripard <ripard@archos.com>
-
-diff -rduNp Python-2.7.orig/setup.py Python-2.7/setup.py
---- Python-2.7.orig/setup.py	2010-09-21 17:31:52.000000000 +0200
-+++ Python-2.7/setup.py	2010-09-21 17:35:20.000000000 +0200
-@@ -21,7 +21,15 @@ from distutils.spawn import find_executa
- COMPILED_WITH_PYDEBUG = hasattr(sys, 'gettotalrefcount')
- 
- # This global variable is used to hold the list of modules to be disabled.
--disabled_module_list = []
-+try:
-+    disabled_module_list = os.environ["PYTHON_DISABLE_MODULES"].split()
-+except KeyError:
-+    disabled_module_list = list()
-+
-+try:
-+    disable_ssl = os.environ["PYTHON_DISABLE_SSL"]
-+except KeyError:
-+    disable_ssl = 0
- 
- def add_dir_to_list(dirlist, dir):
-     """Add the directory 'dir' to the list 'dirlist' (at the front) if
-@@ -346,6 +354,7 @@ class PyBuildExt(build_ext):
-         return sys.platform
- 
-     def detect_modules(self):
-+        global disable_ssl
-         try:
-             modules_include_dirs = os.environ["PYTHON_MODULES_INCLUDE"].split()
-         except KeyError:
-@@ -685,7 +694,8 @@ class PyBuildExt(build_ext):
-                                      ] )
- 
-         if (ssl_incs is not None and
--            ssl_libs is not None):
-+            ssl_libs is not None and
-+            not disable_ssl):
-             exts.append( Extension('_ssl', ['_ssl.c'],
-                                    include_dirs = ssl_incs,
-                                    library_dirs = ssl_libs,
diff --git a/package/python/python-2.7-011-no-rpath.patch b/package/python/python-2.7-011-no-rpath.patch
new file mode 100644
index 0000000..700c4be
--- /dev/null
+++ b/package/python/python-2.7-011-no-rpath.patch
@@ -0,0 +1,75 @@
+Remove runtime library paths
+
+For some extensions (bsddb, sqlite and dbm), Python setup.py script
+hardcode a runtime path (rpath) into the extension. However, this
+runtime path is incorrect (because it points to the location of the
+library directory on the development machine) and useless (because on
+the target, all useful libraries are in a standard directory searched
+by the dynamic loader). For those reasons, we just get rid of the
+runtime paths in cross-compilation mode.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ setup.py |   21 ++++++++++++++++++---
+ 1 file changed, 18 insertions(+), 3 deletions(-)
+
+Index: Python-2.7.1/setup.py
+===================================================================
+--- Python-2.7.1.orig/setup.py
++++ Python-2.7.1/setup.py
+@@ -977,6 +977,12 @@
+                 print "bsddb lib dir:", dblib_dir, " inc dir:", db_incdir
+             db_incs = [db_incdir]
+             dblibs = [dblib]
++
++            if os.environ.get('CROSS_COMPILING') == 'yes':
++                bsddb_runtime_library_dir = None
++            else:
++                bsddb_runtime_library_dir = dblib_dir
++
+             # We add the runtime_library_dirs argument because the
+             # BerkeleyDB lib we're linking against often isn't in the
+             # system dynamic library search path.  This is usually
+@@ -986,7 +992,7 @@
+             exts.append(Extension('_bsddb', ['_bsddb.c'],
+                                   depends = ['bsddb.h'],
+                                   library_dirs=dblib_dir,
+-                                  runtime_library_dirs=dblib_dir,
++                                  runtime_library_dirs=bsddb_runtime_library_dir,
+                                   include_dirs=db_incs,
+                                   libraries=dblibs))
+         else:
+@@ -1092,12 +1098,17 @@
+             else:
+                 sqlite_extra_link_args = ()
+ 
++            if os.environ.get('CROSS_COMPILING') == 'yes':
++                sqlite_runtime_library_dirs = None
++            else:
++                sqlite_runtime_library_dirs = sqlite_libdir
++
+             exts.append(Extension('_sqlite3', sqlite_srcs,
+                                   define_macros=sqlite_defines,
+                                   include_dirs=["Modules/_sqlite",
+                                                 sqlite_incdir],
+                                   library_dirs=sqlite_libdir,
+-                                  runtime_library_dirs=sqlite_libdir,
++                                  runtime_library_dirs=sqlite_runtime_library_dirs,
+                                   extra_link_args=sqlite_extra_link_args,
+                                   libraries=["sqlite3",]))
+         else:
+@@ -1198,9 +1209,13 @@
+                 elif cand == "bdb":
+                     if db_incs is not None:
+                         print "building dbm using bdb"
++                        if os.environ.get('CROSS_COMPILING') == 'yes':
++                            db_runtime_library_dir = None
++                        else:
++                            db_runtime_library_dir = dblib_dir
+                         dbmext = Extension('dbm', ['dbmmodule.c'],
+                                            library_dirs=dblib_dir,
+-                                           runtime_library_dirs=dblib_dir,
++                                           runtime_library_dirs=db_runtime_library_dir,
+                                            include_dirs=db_incs,
+                                            define_macros=[
+                                                ('HAVE_BERKDB_H', None),
diff --git a/package/python/python-2.7-012-correct-32bit-64bit-check.patch b/package/python/python-2.7-012-correct-32bit-64bit-check.patch
new file mode 100644
index 0000000..88006f0
--- /dev/null
+++ b/package/python/python-2.7-012-correct-32bit-64bit-check.patch
@@ -0,0 +1,55 @@
+Use correct mechanism to determine 32/64 bits
+
+Python setup.py builds certain extensions (dl and imageop) only on 32
+bits architecture. However, to test whether the architecture is 32
+bits or not, it was looking at the sys.maxint value of the host Python
+interpreter... which might run on a 64 bits architecture even though
+the target is 32 bits, or which might run on a 32 bits architecture
+even though the target is 64 bits.
+
+Therefore, we introduce a is_arch_64_bits() function, which looks at
+the pyconfig.h file generated by ./configure for the value of
+SIZEOF_LONG to determine if the architecture is 32 or 64 bits.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ setup.py |   12 ++++++++++--
+ 1 file changed, 10 insertions(+), 2 deletions(-)
+
+Index: Python-2.7.1/setup.py
+===================================================================
+--- Python-2.7.1.orig/setup.py
++++ Python-2.7.1/setup.py
+@@ -29,6 +29,14 @@
+ except KeyError:
+     disabled_module_list = list()
+ 
++def is_arch_64_bits():
++    data = open('pyconfig.h').read()
++    m = re.search(r"#s*define\s+SIZEOF_LONG\s+4\s*", data)
++    if m is None:
++        return True
++    else:
++        return False
++
+ def add_dir_to_list(dirlist, dir):
+     """Add the directory 'dir' to the list 'dirlist' (at the front) if
+     1) 'dir' is not already in 'dirlist'
+@@ -608,7 +616,7 @@
+         exts.append( Extension('audioop', ['audioop.c']) )
+ 
+         # Disabled on 64-bit platforms
+-        if sys.maxint != 9223372036854775807L:
++        if not is_arch_64_bits():
+             # Operations on images
+             exts.append( Extension('imageop', ['imageop.c']) )
+         else:
+@@ -1424,7 +1432,7 @@
+                 missing.append('_codecs_%s' % loc)
+ 
+         # Dynamic loading module
+-        if sys.maxint == 0x7fffffff:
++        if not is_arch_64_bits():
+             # This requires sizeof(int) == sizeof(long) == sizeof(char*)
+             dl_inc = find_file('dlfcn.h', [], inc_dirs)
+             if (dl_inc is not None) and (platform not in ['atheos']):
diff --git a/package/python/python-2.7-020-gentoo_py_dontcompile.patch b/package/python/python-2.7-020-gentoo_py_dontcompile.patch
deleted file mode 100644
index 276f0e6..0000000
--- a/package/python/python-2.7-020-gentoo_py_dontcompile.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-This patch purpose is to allow not to save the generated python bytecode in
-a file for later use through the PYTHON_DONTCOMPILE environment variable.
-
-I do not see the use of it, because you can choose if you want but it seems
-somewhat related to gentoo.
-
-Maybe useful when the generated rootfs is mounted on read-only on the target.
-
-Patch ported to python2.7 by Maxime Ripard <ripard@archos.com>
-
-diff -rduNp Python-2.7.orig/Python/import.c Python-2.7/Python/import.c
---- Python-2.7.orig/Python/import.c	2010-09-30 12:05:53.000000000 +0200
-+++ Python-2.7/Python/import.c	2010-09-30 12:20:38.000000000 +0200
-@@ -886,7 +886,12 @@ write_compiled_module(PyCodeObject *co,
-     mode_t mode = srcstat->st_mode & ~S_IXUSR & ~S_IXGRP & ~S_IXOTH;
- #endif
- 
--    fp = open_exclusive(cpathname, mode);
-+    char *py_dontcompile = getenv("PYTHON_DONTCOMPILE");
-+
-+    if (!py_dontcompile)
-+      fp = open_exclusive(cpathname, mode);
-+    else
-+      fp = NULL;
-     if (fp == NULL) {
-         if (Py_VerboseFlag)
-             PySys_WriteStderr(
diff --git a/package/python/python-2.7-030-fix-long-long-format.patch b/package/python/python-2.7-030-fix-long-long-format.patch
deleted file mode 100644
index 5b9dddd..0000000
--- a/package/python/python-2.7-030-fix-long-long-format.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Python's configure assume than when cross-compiling the target has no
-support for long long int. This assumption breaks compilation later in the
-process. Since gcc handles long long support, we can change the value to
-assume that there is such support.
-
-Patch by Maxime Ripard <ripard@archos.com>
-
-diff -rduNp Python-2.7.orig/configure Python-2.7/configure
---- Python-2.7.orig/configure	2010-09-30 12:05:54.000000000 +0200
-+++ Python-2.7/configure	2010-09-30 12:12:30.000000000 +0200
-@@ -13517,7 +13517,7 @@ $as_echo_n "checking for %lld and %llu p
-   $as_echo_n "(cached) " >&6
- else
-   if test "$cross_compiling" = yes; then :
--  ac_cv_have_long_long_format=no
-+  ac_cv_have_long_long_format=yes
- else
-   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
- /* end confdefs.h.  */
diff --git a/package/python/python-2.7-040-bytecode-generation-fix.patch b/package/python/python-2.7-040-bytecode-generation-fix.patch
deleted file mode 100644
index 0984c48..0000000
--- a/package/python/python-2.7-040-bytecode-generation-fix.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-The compileall script is used to compile to python bytecode all the modules.
-However, it relies on the struct package that is not built for the host
-python, thus crashing at execution when compiling the target python.
-When compiling, the removed code block is never executed, so we can safely
-remove it, removing in the same time the dependency on struct.
-
-Patch by Maxime Ripard <ripard@archos.com>
-
-Index: Python-2.7/Lib/compileall.py
-===================================================================
---- Python-2.7.orig/Lib/compileall.py	(r??vision 84276)
-+++ Python-2.7/Lib/compileall.py	(copie de travail)
-@@ -14,7 +14,6 @@
- import os
- import sys
- import py_compile
--import struct
- import imp
- 
- __all__ = ["compile_dir","compile_file","compile_path"]
-@@ -83,17 +82,6 @@
-     if os.path.isfile(fullname):
-         head, tail = name[:-3], name[-3:]
-         if tail == '.py':
--            if not force:
--                try:
--                    mtime = int(os.stat(fullname).st_mtime)
--                    expect = struct.pack('<4sl', imp.get_magic(), mtime)
--                    cfile = fullname + (__debug__ and 'c' or 'o')
--                    with open(cfile, 'rb') as chandle:
--                        actual = chandle.read(8)
--                    if expect == actual:
--                        return success
--                except IOError:
--                    pass
-             if not quiet:
-                 print 'Compiling', fullname, '...'
-             try:
diff --git a/package/python/python-2.7-100-optional-test-modules.patch b/package/python/python-2.7-100-optional-test-modules.patch
new file mode 100644
index 0000000..b51ea57
--- /dev/null
+++ b/package/python/python-2.7-100-optional-test-modules.patch
@@ -0,0 +1,84 @@
+Add an option to disable installation of test modules
+
+The Python standard distribution comes with many test modules, that
+are not necessarly useful on embedded targets.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+---
+ Makefile.pre.in |   40 +++++++++++++++++++++++++++-------------
+ configure.in    |    6 ++++++
+ 2 files changed, 33 insertions(+), 13 deletions(-)
+
+Index: Python-2.7.1/Makefile.pre.in
+===================================================================
+--- Python-2.7.1.orig/Makefile.pre.in
++++ Python-2.7.1/Makefile.pre.in
+@@ -851,23 +851,37 @@
+ 	plat-mac/lib-scriptpackages/SystemEvents \
+ 	plat-mac/lib-scriptpackages/Terminal 
+ PLATMACPATH=:plat-mac:plat-mac/lib-scriptpackages
+-LIBSUBDIRS=	lib-tk lib-tk/test lib-tk/test/test_tkinter \
+-                lib-tk/test/test_ttk site-packages test test/data \
+-		test/decimaltestdata test/xmltestdata \
+-		test/tracedmodules \
++LIBSUBDIRS=	lib-tk \
++                site-packages \
+ 		encodings compiler hotshot \
+-		email email/mime email/test email/test/data \
+-		json json/tests \
+-		sqlite3 sqlite3/test \
+-		logging bsddb bsddb/test csv importlib wsgiref \
+-		lib2to3 lib2to3/fixes lib2to3/pgen2 lib2to3/tests \
+-		lib2to3/tests/data lib2to3/tests/data/fixers lib2to3/tests/data/fixers/myfixes \
+-		ctypes ctypes/test ctypes/macholib idlelib idlelib/Icons \
+-		distutils distutils/command distutils/tests $(XMLLIBSUBDIRS) \
++		email email/mime \
++		json \
++		sqlite3 \
++		logging bsddb csv importlib wsgiref \
++		lib2to3 lib2to3/fixes lib2to3/pgen2 \
++		ctypes ctypes/macholib idlelib idlelib/Icons \
++		distutils distutils/command $(XMLLIBSUBDIRS) \
+ 		multiprocessing multiprocessing/dummy \
+-		unittest unittest/test \
++		unittest \
+ 		lib-old \
+ 		curses pydoc_data $(MACHDEPS)
++
++ifeq (@TEST_MODULES@,yes)
++LIBSUBDIRS +=	lib-tk/test lib-tk/test/test_tkinter	\
++	      	lib-tk/test/test_ttk test test/data	\
++		test/decimaltestdata test/xmltestdata 	\
++		test/tracedmodules   			\
++		email/test email/test/data		\
++		sqlite3/test				\
++		bsddb/test				\
++		lib2to3/tests				\
++		lib2to3/tests/data			\
++		lib2to3/tests/data/fixers		\
++		lib2to3/tests/data/fixers/myfixes	\
++		ctypes/test distutils/tests		\
++		unittest/test
++endif
++
+ libinstall:	build_all $(srcdir)/Lib/$(PLATDIR)
+ 	@for i in $(SCRIPTDIR) $(LIBDEST); \
+ 	do \
+Index: Python-2.7.1/configure.in
+===================================================================
+--- Python-2.7.1.orig/configure.in
++++ Python-2.7.1/configure.in
+@@ -2393,6 +2393,12 @@
+ fi
+ 
+ 
++AC_SUBST(TEST_MODULES)
++
++AC_ARG_ENABLE(test-modules,
++	AS_HELP_STRING([--disable-test-modules], [disable test modules]),
++	[ TEST_MODULES="${enableval}" ], [ TEST_MODULES=yes ])
++
+ # Check for enable-ipv6
+ AH_TEMPLATE(ENABLE_IPV6, [Define if --enable-ipv6 is specified])
+ AC_MSG_CHECKING([if --enable-ipv6 is specified])
diff --git a/package/python/python-2.7-101-optional-pydoc.patch b/package/python/python-2.7-101-optional-pydoc.patch
new file mode 100644
index 0000000..8d51dc9
--- /dev/null
+++ b/package/python/python-2.7-101-optional-pydoc.patch
@@ -0,0 +1,81 @@
+Add an option to disable pydoc
+
+It removes 0.5 MB of data from the target plus the pydoc script
+itself.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+---
+ Makefile.pre.in |    6 +++++-
+ configure.in    |    5 +++++
+ setup.py        |   10 +++++++---
+ 3 files changed, 17 insertions(+), 4 deletions(-)
+
+Index: Python-2.7.1/Makefile.pre.in
+===================================================================
+--- Python-2.7.1.orig/Makefile.pre.in
++++ Python-2.7.1/Makefile.pre.in
+@@ -864,7 +864,7 @@
+ 		multiprocessing multiprocessing/dummy \
+ 		unittest \
+ 		lib-old \
+-		curses pydoc_data $(MACHDEPS)
++		curses $(MACHDEPS)
+ 
+ ifeq (@TEST_MODULES@,yes)
+ LIBSUBDIRS +=	lib-tk/test lib-tk/test/test_tkinter	\
+@@ -882,6 +882,10 @@
+ 		unittest/test
+ endif
+ 
++ifeq (@PYDOC@,yes)
++LIBSUBDIRS += pydoc_data
++endif
++
+ libinstall:	build_all $(srcdir)/Lib/$(PLATDIR)
+ 	@for i in $(SCRIPTDIR) $(LIBDEST); \
+ 	do \
+Index: Python-2.7.1/configure.in
+===================================================================
+--- Python-2.7.1.orig/configure.in
++++ Python-2.7.1/configure.in
+@@ -2392,6 +2392,11 @@
+         esac])
+ fi
+ 
++AC_SUBST(PYDOC)
++
++AC_ARG_ENABLE(pydoc,
++	AS_HELP_STRING([--disable-pydoc], [disable pydoc]),
++	[ PYDOC="${enableval}" ], [ PYDOC=yes ])
+ 
+ AC_SUBST(TEST_MODULES)
+ 
+Index: Python-2.7.1/setup.py
+===================================================================
+--- Python-2.7.1.orig/setup.py
++++ Python-2.7.1/setup.py
+@@ -2072,6 +2072,12 @@
+     # turn off warnings when deprecated modules are imported
+     import warnings
+     warnings.filterwarnings("ignore",category=DeprecationWarning)
++
++    scripts = ['Tools/scripts/idle', 'Tools/scripts/2to3',
++               'Lib/smtpd.py']
++    if not '--disable-pydoc' in sysconfig.get_config_var("CONFIG_ARGS"):
++        scripts += [ 'Tools/scripts/pydoc' ]
++
+     setup(# PyPI Metadata (PEP 301)
+           name = "Python",
+           version = sys.version.split()[0],
+@@ -2092,9 +2098,7 @@
+           ext_modules=[Extension('_struct', ['_struct.c'])],
+ 
+           # Scripts to install
+-          scripts = ['Tools/scripts/pydoc', 'Tools/scripts/idle',
+-                     'Tools/scripts/2to3',
+-                     'Lib/smtpd.py']
++          scripts = scripts,
+         )
+ 
+ # --install-platlib
diff --git a/package/python/python-2.7-102-optional-2to3.patch b/package/python/python-2.7-102-optional-2to3.patch
new file mode 100644
index 0000000..3550db1
--- /dev/null
+++ b/package/python/python-2.7-102-optional-2to3.patch
@@ -0,0 +1,99 @@
+Add an option to disable lib2to3
+
+lib2to3 is a library to convert Python 2.x code to Python 3.x. As
+such, it is probably not very useful on embedded system targets.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+---
+ Makefile.pre.in |   24 +++++++++++++++++-------
+ configure.in    |    6 ++++++
+ setup.py        |    5 +++--
+ 3 files changed, 26 insertions(+), 9 deletions(-)
+
+Index: Python-2.7.1/Makefile.pre.in
+===================================================================
+--- Python-2.7.1.orig/Makefile.pre.in
++++ Python-2.7.1/Makefile.pre.in
+@@ -856,9 +856,7 @@
+ 		encodings compiler hotshot \
+ 		email email/mime \
+ 		json \
+-		sqlite3 \
+ 		logging bsddb csv importlib wsgiref \
+-		lib2to3 lib2to3/fixes lib2to3/pgen2 \
+ 		ctypes ctypes/macholib idlelib idlelib/Icons \
+ 		distutils distutils/command $(XMLLIBSUBDIRS) \
+ 		multiprocessing multiprocessing/dummy \
+@@ -872,12 +870,7 @@
+ 		test/decimaltestdata test/xmltestdata 	\
+ 		test/tracedmodules   			\
+ 		email/test email/test/data		\
+-		sqlite3/test				\
+ 		bsddb/test				\
+-		lib2to3/tests				\
+-		lib2to3/tests/data			\
+-		lib2to3/tests/data/fixers		\
+-		lib2to3/tests/data/fixers/myfixes	\
+ 		ctypes/test distutils/tests		\
+ 		unittest/test
+ endif
+@@ -886,6 +879,23 @@
+ LIBSUBDIRS += pydoc_data
+ endif
+ 
++ifeq (@LIB2TO3@,yes)
++LIBSUBDIRS += lib2to3 lib2to3/fixes lib2to3/pgen2
++ifeq (@TEST_MODULES@,yes)
++LIBSUBDIRS += 	lib2to3/tests				\
++		lib2to3/tests/data			\
++		lib2to3/tests/data/fixers		\
++		lib2to3/tests/data/fixers/myfixes
++endif
++endif
++
++ifeq (@SQLITE3@,yes)
++LIBSUBDIRS += sqlite3
++ifeq (@TEST_MODULES@,yes)
++LIBSUBDIRS += sqlite3/test
++endif
++endif
++
+ libinstall:	build_all $(srcdir)/Lib/$(PLATDIR)
+ 	@for i in $(SCRIPTDIR) $(LIBDEST); \
+ 	do \
+Index: Python-2.7.1/configure.in
+===================================================================
+--- Python-2.7.1.orig/configure.in
++++ Python-2.7.1/configure.in
+@@ -2404,6 +2404,12 @@
+ 	AS_HELP_STRING([--disable-test-modules], [disable test modules]),
+ 	[ TEST_MODULES="${enableval}" ], [ TEST_MODULES=yes ])
+ 
++AC_SUBST(LIB2TO3)
++
++AC_ARG_ENABLE(lib2to3,
++	AS_HELP_STRING([--disable-lib2to3], [disable lib2to3]),
++	[ LIB2TO3="${enableval}" ], [ LIB2TO3=yes ])
++
+ # Check for enable-ipv6
+ AH_TEMPLATE(ENABLE_IPV6, [Define if --enable-ipv6 is specified])
+ AC_MSG_CHECKING([if --enable-ipv6 is specified])
+Index: Python-2.7.1/setup.py
+===================================================================
+--- Python-2.7.1.orig/setup.py
++++ Python-2.7.1/setup.py
+@@ -2073,10 +2073,11 @@
+     import warnings
+     warnings.filterwarnings("ignore",category=DeprecationWarning)
+ 
+-    scripts = ['Tools/scripts/idle', 'Tools/scripts/2to3',
+-               'Lib/smtpd.py']
++    scripts = ['Tools/scripts/idle', 'Lib/smtpd.py']
+     if not '--disable-pydoc' in sysconfig.get_config_var("CONFIG_ARGS"):
+         scripts += [ 'Tools/scripts/pydoc' ]
++    if not '--disable-lib2to3' in sysconfig.get_config_var("CONFIG_ARGS"):
++        scripts += [ 'Tools/scripts/2to3' ]
+ 
+     setup(# PyPI Metadata (PEP 301)
+           name = "Python",
diff --git a/package/python/python-2.7-103-optional-sqlite.patch b/package/python/python-2.7-103-optional-sqlite.patch
new file mode 100644
index 0000000..08e8b5d
--- /dev/null
+++ b/package/python/python-2.7-103-optional-sqlite.patch
@@ -0,0 +1,28 @@
+Add option to disable the sqlite3 module
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+---
+ configure.in |    9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+Index: Python-2.7.1/configure.in
+===================================================================
+--- Python-2.7.1.orig/configure.in
++++ Python-2.7.1/configure.in
+@@ -2392,6 +2392,15 @@
+         esac])
+ fi
+ 
++AC_SUBST(SQLITE3)
++AC_ARG_ENABLE(sqlite3,
++	AS_HELP_STRING([--disable-sqlite3], [disable sqlite3]),
++	[ SQLITE3="${enableval}" ], [ SQLITE3=yes ])
++
++if test "$SQLITE3" = "no" ; then
++   DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
++fi
++
+ AC_SUBST(PYDOC)
+ 
+ AC_ARG_ENABLE(pydoc,
diff --git a/package/python/python-2.7-104-optional-tk.patch b/package/python/python-2.7-104-optional-tk.patch
new file mode 100644
index 0000000..6bcdcb8
--- /dev/null
+++ b/package/python/python-2.7-104-optional-tk.patch
@@ -0,0 +1,68 @@
+Add an option to disable the tk module
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+---
+ Makefile.pre.in |   14 ++++++++++----
+ configure.in    |    9 +++++++++
+ 2 files changed, 19 insertions(+), 4 deletions(-)
+
+Index: Python-2.7.1/Makefile.pre.in
+===================================================================
+--- Python-2.7.1.orig/Makefile.pre.in
++++ Python-2.7.1/Makefile.pre.in
+@@ -851,8 +851,7 @@
+ 	plat-mac/lib-scriptpackages/SystemEvents \
+ 	plat-mac/lib-scriptpackages/Terminal 
+ PLATMACPATH=:plat-mac:plat-mac/lib-scriptpackages
+-LIBSUBDIRS=	lib-tk \
+-                site-packages \
++LIBSUBDIRS=	site-packages \
+ 		encodings compiler hotshot \
+ 		email email/mime \
+ 		json \
+@@ -865,8 +864,7 @@
+ 		curses $(MACHDEPS)
+ 
+ ifeq (@TEST_MODULES@,yes)
+-LIBSUBDIRS +=	lib-tk/test lib-tk/test/test_tkinter	\
+-	      	lib-tk/test/test_ttk test test/data	\
++LIBSUBDIRS +=	test test/data	\
+ 		test/decimaltestdata test/xmltestdata 	\
+ 		test/tracedmodules   			\
+ 		email/test email/test/data		\
+@@ -896,6 +894,14 @@
+ endif
+ endif
+ 
++ifeq (@TK@,yes)
++LIBSUBDIRS += lib-tk
++ifeq (@TEST_MODULES@,yes)
++LIBSUBDIRS += lib-tk/test lib-tk/test/test_tkinter	\
++	      lib-tk/test/test_ttk
++endif
++endif
++
+ libinstall:	build_all $(srcdir)/Lib/$(PLATDIR)
+ 	@for i in $(SCRIPTDIR) $(LIBDEST); \
+ 	do \
+Index: Python-2.7.1/configure.in
+===================================================================
+--- Python-2.7.1.orig/configure.in
++++ Python-2.7.1/configure.in
+@@ -2401,6 +2401,15 @@
+    DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
+ fi
+ 
++AC_SUBST(TK)
++AC_ARG_ENABLE(tk,
++	AS_HELP_STRING([--disable-tk], [disable tk]),
++	[ TK="${enableval}" ], [ TK=yes ])
++
++if test "$TK" = "no"; then
++   DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _tkinter"
++fi
++
+ AC_SUBST(PYDOC)
+ 
+ AC_ARG_ENABLE(pydoc,
diff --git a/package/python/python-2.7-105-optional-curses.patch b/package/python/python-2.7-105-optional-curses.patch
new file mode 100644
index 0000000..3a1ceab
--- /dev/null
+++ b/package/python/python-2.7-105-optional-curses.patch
@@ -0,0 +1,53 @@
+Add an option to disable the curses module
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+---
+ Makefile.pre.in |    6 +++++-
+ configure.in    |    9 +++++++++
+ 2 files changed, 14 insertions(+), 1 deletion(-)
+
+Index: Python-2.7.1/Makefile.pre.in
+===================================================================
+--- Python-2.7.1.orig/Makefile.pre.in
++++ Python-2.7.1/Makefile.pre.in
+@@ -861,7 +861,7 @@
+ 		multiprocessing multiprocessing/dummy \
+ 		unittest \
+ 		lib-old \
+-		curses $(MACHDEPS)
++		$(MACHDEPS)
+ 
+ ifeq (@TEST_MODULES@,yes)
+ LIBSUBDIRS +=	test test/data	\
+@@ -902,6 +902,10 @@
+ endif
+ endif
+ 
++ifeq (@CURSES@,yes)
++LIBSUBDIRS += curses
++endif
++
+ libinstall:	build_all $(srcdir)/Lib/$(PLATDIR)
+ 	@for i in $(SCRIPTDIR) $(LIBDEST); \
+ 	do \
+Index: Python-2.7.1/configure.in
+===================================================================
+--- Python-2.7.1.orig/configure.in
++++ Python-2.7.1/configure.in
+@@ -2410,6 +2410,15 @@
+    DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _tkinter"
+ fi
+ 
++AC_SUBST(CURSES)
++AC_ARG_ENABLE(curses,
++	AS_HELP_STRING([--disable-curses], [disable curses]),
++	[ CURSES="${enableval}" ], [ CURSES=yes ])
++
++if test "$CURSES" = "no"; then
++   DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _curses _curses_panel"
++fi
++
+ AC_SUBST(PYDOC)
+ 
+ AC_ARG_ENABLE(pydoc,
diff --git a/package/python/python-2.7-106-optional-expat.patch b/package/python/python-2.7-106-optional-expat.patch
new file mode 100644
index 0000000..24272d9
--- /dev/null
+++ b/package/python/python-2.7-106-optional-expat.patch
@@ -0,0 +1,84 @@
+Add an option to disable expat
+
+This patch replaces the existing --with-system-expat option with a
+--with-expat={system,builtin,none} option, which allows to tell Python
+whether we want to use the system expat (already installed), the expat
+builtin the Python sources, or no expat at all (which disables the
+installation of XML modules).
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+---
+ Makefile.pre.in |    6 +++++-
+ configure.in    |   18 +++++++++++++-----
+ setup.py        |    2 +-
+ 3 files changed, 19 insertions(+), 7 deletions(-)
+
+Index: Python-2.7.1/Makefile.pre.in
+===================================================================
+--- Python-2.7.1.orig/Makefile.pre.in
++++ Python-2.7.1/Makefile.pre.in
+@@ -857,7 +857,7 @@
+ 		json \
+ 		logging bsddb csv importlib wsgiref \
+ 		ctypes ctypes/macholib idlelib idlelib/Icons \
+-		distutils distutils/command $(XMLLIBSUBDIRS) \
++		distutils distutils/command \
+ 		multiprocessing multiprocessing/dummy \
+ 		unittest \
+ 		lib-old \
+@@ -906,6 +906,10 @@
+ LIBSUBDIRS += curses
+ endif
+ 
++ifeq (@EXPAT@,yes)
++LIBSUBDIRS += $(XMLLIBSUBDIRS)
++endif
++
+ libinstall:	build_all $(srcdir)/Lib/$(PLATDIR)
+ 	@for i in $(SCRIPTDIR) $(LIBDEST); \
+ 	do \
+Index: Python-2.7.1/configure.in
+===================================================================
+--- Python-2.7.1.orig/configure.in
++++ Python-2.7.1/configure.in
+@@ -2087,13 +2087,21 @@
+ AC_SUBST(DISABLED_EXTENSIONS)
+ 
+ # Check for use of the system expat library
+-AC_MSG_CHECKING(for --with-system-expat)
+-AC_ARG_WITH(system_expat,
+-            AS_HELP_STRING([--with-system-expat], [build pyexpat module using an installed expat library]),
++AC_MSG_CHECKING(for --with-expat)
++AC_ARG_WITH(expat,
++            AS_HELP_STRING([--with-expat], [select which expat version to use: system, builtin, none]),
+             [],
+-            [with_system_expat="no"])
++            [with_expat="builtin"])
+ 
+-AC_MSG_RESULT($with_system_expat)
++AC_MSG_RESULT($with_expat)
++
++if test "$with_expat" != "none"; then
++   EXPAT=yes
++else
++   DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} pyexpat"
++   EXPAT=no
++fi
++AC_SUBST(EXPAT)
+ 
+ # Check for use of the system libffi library
+ AC_MSG_CHECKING(for --with-system-ffi)
+Index: Python-2.7.1/setup.py
+===================================================================
+--- Python-2.7.1.orig/setup.py
++++ Python-2.7.1/setup.py
+@@ -1383,7 +1383,7 @@
+         #
+         # More information on Expat can be found at www.libexpat.org.
+         #
+-        if '--with-system-expat' in sysconfig.get_config_var("CONFIG_ARGS"):
++        if '--with-expat=system' in sysconfig.get_config_var("CONFIG_ARGS"):
+             expat_inc = []
+             define_macros = []
+             expat_lib = ['expat']
diff --git a/package/python/python-2.7-107-optional-codecs-cjk.patch b/package/python/python-2.7-107-optional-codecs-cjk.patch
new file mode 100644
index 0000000..1b0541b
--- /dev/null
+++ b/package/python/python-2.7-107-optional-codecs-cjk.patch
@@ -0,0 +1,25 @@
+Add an option to disable CJK codecs
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+---
+ configure.in |    6 ++++++
+ 1 file changed, 6 insertions(+)
+
+Index: Python-2.7.1/configure.in
+===================================================================
+--- Python-2.7.1.orig/configure.in
++++ Python-2.7.1/configure.in
+@@ -2409,6 +2409,12 @@
+    DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
+ fi
+ 
++AC_ARG_ENABLE(codecs-cjk,
++	AS_HELP_STRING([--disable-codecs-cjk], [disable CJK codecs]),
++	[ if test "$enableval" = "no"; then
++    	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _codecs_kr _codecs_jp _codecs_cn _codecs_tw _codecs_hk"
++  	  fi])
++
+ AC_SUBST(TK)
+ AC_ARG_ENABLE(tk,
+ 	AS_HELP_STRING([--disable-tk], [disable tk]),
diff --git a/package/python/python-2.7-108-optional-nis.patch b/package/python/python-2.7-108-optional-nis.patch
new file mode 100644
index 0000000..35be7ff
--- /dev/null
+++ b/package/python/python-2.7-108-optional-nis.patch
@@ -0,0 +1,28 @@
+Add an option to disable NIS
+
+NIS is not necessarily available in uClibc, so we need an option to
+not compile support for it.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+---
+ configure.in |    6 ++++++
+ 1 file changed, 6 insertions(+)
+
+Index: Python-2.7.1/configure.in
+===================================================================
+--- Python-2.7.1.orig/configure.in
++++ Python-2.7.1/configure.in
+@@ -2415,6 +2415,12 @@
+     	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _codecs_kr _codecs_jp _codecs_cn _codecs_tw _codecs_hk"
+   	  fi])
+ 
++AC_ARG_ENABLE(nis,
++	AS_HELP_STRING([--disable-nis], [disable NIS]),
++	[ if test "$enableval" = "no"; then
++    	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} nis"
++  	  fi])
++
+ AC_SUBST(TK)
+ AC_ARG_ENABLE(tk,
+ 	AS_HELP_STRING([--disable-tk], [disable tk]),
diff --git a/package/python/python-2.7-109-optional-unicodedata.patch b/package/python/python-2.7-109-optional-unicodedata.patch
new file mode 100644
index 0000000..9973c3c
--- /dev/null
+++ b/package/python/python-2.7-109-optional-unicodedata.patch
@@ -0,0 +1,25 @@
+Add an option to disable unicodedata
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+---
+ configure.in |    6 ++++++
+ 1 file changed, 6 insertions(+)
+
+Index: Python-2.7.1/configure.in
+===================================================================
+--- Python-2.7.1.orig/configure.in
++++ Python-2.7.1/configure.in
+@@ -2421,6 +2421,12 @@
+     	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} nis"
+   	  fi])
+ 
++AC_ARG_ENABLE(unicodedata,
++	AS_HELP_STRING([--disable-unicodedata], [disable unicodedata]),
++	[ if test "$enableval" = "no"; then
++    	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} unicodedata"
++  	  fi])
++
+ AC_SUBST(TK)
+ AC_ARG_ENABLE(tk,
+ 	AS_HELP_STRING([--disable-tk], [disable tk]),
diff --git a/package/python/python-2.7-110-optional-db.patch b/package/python/python-2.7-110-optional-db.patch
new file mode 100644
index 0000000..5589ed3
--- /dev/null
+++ b/package/python/python-2.7-110-optional-db.patch
@@ -0,0 +1,81 @@
+Add an option to disable bsddb
+
+bsddb has an external dependency on Berkeley DB. Since we want to be
+able to build Python without it, this patch adds an option to disable
+the build/installation of this Python module.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+---
+ Makefile.pre.in |   10 ++++++++--
+ configure.in    |   22 ++++++++++++++++++++++
+ 2 files changed, 30 insertions(+), 2 deletions(-)
+
+Index: Python-2.7.1/Makefile.pre.in
+===================================================================
+--- Python-2.7.1.orig/Makefile.pre.in
++++ Python-2.7.1/Makefile.pre.in
+@@ -855,7 +855,7 @@
+ 		encodings compiler hotshot \
+ 		email email/mime \
+ 		json \
+-		logging bsddb csv importlib wsgiref \
++		logging csv importlib wsgiref \
+ 		ctypes ctypes/macholib idlelib idlelib/Icons \
+ 		distutils distutils/command \
+ 		multiprocessing multiprocessing/dummy \
+@@ -868,7 +868,6 @@
+ 		test/decimaltestdata test/xmltestdata 	\
+ 		test/tracedmodules   			\
+ 		email/test email/test/data		\
+-		bsddb/test				\
+ 		ctypes/test distutils/tests		\
+ 		unittest/test
+ endif
+@@ -910,6 +909,13 @@
+ LIBSUBDIRS += $(XMLLIBSUBDIRS)
+ endif
+ 
++ifeq (@BSDDB@,yes)
++LIBSUBDIRS += bsddb
++ifeq (@TEST_MODULES@,yes)
++LIBSUBDIRS += bsddb/test
++endif
++endif
++
+ libinstall:	build_all $(srcdir)/Lib/$(PLATDIR)
+ 	@for i in $(SCRIPTDIR) $(LIBDEST); \
+ 	do \
+Index: Python-2.7.1/configure.in
+===================================================================
+--- Python-2.7.1.orig/configure.in
++++ Python-2.7.1/configure.in
+@@ -2421,6 +2421,28 @@
+     	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} nis"
+   	  fi])
+ 
++AC_ARG_ENABLE(dbm,
++	AS_HELP_STRING([--disable-dbm], [disable DBM]),
++	[ if test "$enableval" = "no"; then
++    	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} dbm"
++  	  fi])
++
++AC_ARG_ENABLE(gdbm,
++	AS_HELP_STRING([--disable-gdbm], [disable GDBM]),
++	[ if test "$enableval" = "no"; then
++    	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} gdbm"
++  	  fi])
++
++AC_SUBST(BSDDB)
++AC_ARG_ENABLE(bsddb,
++	AS_HELP_STRING([--disable-bsddb], [disable BerkeyleyDB]),
++	[ if test "$enableval" = "no"; then
++    	     BSDDB=no
++    	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} bsddb"
++  	  else
++	     BSDDB=yes
++  	  fi], [ BSDDB=yes ])
++
+ AC_ARG_ENABLE(unicodedata,
+ 	AS_HELP_STRING([--disable-unicodedata], [disable unicodedata]),
+ 	[ if test "$enableval" = "no"; then
diff --git a/package/python/python-2.7-111-optional-ssl.patch b/package/python/python-2.7-111-optional-ssl.patch
new file mode 100644
index 0000000..ff38507
--- /dev/null
+++ b/package/python/python-2.7-111-optional-ssl.patch
@@ -0,0 +1,25 @@
+Add an option to disable the ssl module
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+---
+ configure.in |    6 ++++++
+ 1 file changed, 6 insertions(+)
+
+Index: Python-2.7.1/configure.in
+===================================================================
+--- Python-2.7.1.orig/configure.in
++++ Python-2.7.1/configure.in
+@@ -2421,6 +2421,12 @@
+     	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} nis"
+   	  fi])
+ 
++AC_ARG_ENABLE(ssl,
++	AS_HELP_STRING([--disable-ssl], [disable SSL]),
++	[ if test "$enableval" = "no"; then
++    	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} ssl"
++  	  fi])
++
+ AC_ARG_ENABLE(dbm,
+ 	AS_HELP_STRING([--disable-dbm], [disable DBM]),
+ 	[ if test "$enableval" = "no"; then
diff --git a/package/python/python-2.7-112-optional-bzip2.patch b/package/python/python-2.7-112-optional-bzip2.patch
new file mode 100644
index 0000000..f2e4e7c
--- /dev/null
+++ b/package/python/python-2.7-112-optional-bzip2.patch
@@ -0,0 +1,24 @@
+Add an option to disable the bz2 module
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ configure.in |    6 ++++++
+ 1 file changed, 6 insertions(+)
+
+Index: Python-2.7.1/configure.in
+===================================================================
+--- Python-2.7.1.orig/configure.in
++++ Python-2.7.1/configure.in
+@@ -2427,6 +2427,12 @@
+     	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} ssl"
+   	  fi])
+ 
++AC_ARG_ENABLE(bz2,
++       AS_HELP_STRING([--disable-bz2], [disable BZIP2]),
++       [ if test "$enableval" = "no"; then
++            DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} bz2"
++         fi])
++
+ AC_ARG_ENABLE(dbm,
+ 	AS_HELP_STRING([--disable-dbm], [disable DBM]),
+ 	[ if test "$enableval" = "no"; then
diff --git a/package/python/python-2.7-113-optional-zlib.patch b/package/python/python-2.7-113-optional-zlib.patch
new file mode 100644
index 0000000..b5d9665
--- /dev/null
+++ b/package/python/python-2.7-113-optional-zlib.patch
@@ -0,0 +1,24 @@
+Add an option to disable the zlib module
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ configure.in |    6 ++++++
+ 1 file changed, 6 insertions(+)
+
+Index: Python-2.7.1/configure.in
+===================================================================
+--- Python-2.7.1.orig/configure.in
++++ Python-2.7.1/configure.in
+@@ -2433,6 +2433,12 @@
+             DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} bz2"
+          fi])
+ 
++AC_ARG_ENABLE(zlib,
++       AS_HELP_STRING([--disable-zlib], [disable ZLIB]),
++       [ if test "$enableval" = "no"; then
++            DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} zlib"
++         fi])
++
+ AC_ARG_ENABLE(dbm,
+ 	AS_HELP_STRING([--disable-dbm], [disable DBM]),
+ 	[ if test "$enableval" = "no"; then
diff --git a/package/python/python.mk b/package/python/python.mk
index 3afc132..d6ac6b9 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -3,218 +3,146 @@
 # python
 #
 #############################################################
-PYTHON_VERSION=2.7
-PYTHON_VERSION_MAJOR=2.7
-PYTHON_SOURCE:=Python-$(PYTHON_VERSION).tar.bz2
-PYTHON_SITE:=http://python.org/ftp/python/$(PYTHON_VERSION)
-PYTHON_DIR:=$(BUILD_DIR)/Python-$(PYTHON_VERSION)
-PYTHON_CAT:=$(BZCAT)
-PYTHON_BINARY:=python
-PYTHON_TARGET_BINARY:=usr/bin/python$(PYTHON_VERSION_MAJOR)
-PYTHON_DEPS:=
-PYTHON_SITE_PACKAGE_DIR=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
-
-BR2_PYTHON_DISABLED_MODULES=dbm zipfile
+PYTHON_VERSION_MAJOR = 2.7
+PYTHON_VERSION       = $(PYTHON_VERSION_MAJOR).1
+PYTHON_SOURCE        = Python-$(PYTHON_VERSION).tar.bz2
+PYTHON_SITE          = http://python.org/ftp/python/$(PYTHON_VERSION)
+
+# Python needs itself and a "pgen" program to build itself, both being
+# provided in the Python sources. So in order to cross-compile Python,
+# we need to build a host Python first. This host Python is also
+# installed in $(HOST_DIR), as it is needed when cross-compiling
+# third-party Python modules.
+
+HOST_PYTHON_CONF_OPT += 	\
+	--without-cxx-main 	\
+	--disable-sqlite3	\
+	--disable-tk		\
+	--with-expat=none	\
+	--disable-curses	\
+	--disable-codecs-cjk	\
+	--disable-nis		\
+	--disable-unicodedata	\
+	--disable-dbm		\
+	--disable-gdbm		\
+	--disable-bsddb		\
+	--disable-test-modules	\
+	--disable-bz2		\
+	--disable-zlib		\
+	--disable-ssl
+
+HOST_PYTHON_MAKE_ENV = \
+	PYTHON_MODULES_INCLUDE=$(HOST_DIR)/usr/include \
+	PYTHON_MODULES_LIB="$(HOST_DIR)/lib $(HOST_DIR)/usr/lib"
+
+HOST_PYTHON_AUTORECONF = YES
+
+PYTHON_DEPENDENCIES  = host-python libffi
+
+PYTHON_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_PYTHON_READLINE),y)
-PYTHON_DEPS += readline
-else
-BR2_PYTHON_DISABLED_MODULES += readline
+PYTHON_DEPENDENCIES += readline
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON_CURSES),y)
-PYTHON_DEPS += ncurses
+PYTHON_DEPENDENCIES += ncurses
 else
-BR2_PYTHON_DISABLED_MODULES += _curses _curses_panel
+PYTHON_CONF_OPT += --disable-curses
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON_PYEXPAT),y)
-PYTHON_DEPS += expat
-else
-BR2_PYTHON_DISABLED_MODULES += pyexpat
-endif
-
-ifeq ($(BR2_PACKAGE_PYTHON_GDBM),y)
-PYTHON_DEPS += gdbm
+PYTHON_DEPENDENCIES += expat
+PYTHON_CONF_OPT += --with-expat=system
 else
-BR2_PYTHON_DISABLED_MODULES += gdbm
+PYTHON_CONF_OPT += --with-expat=none
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON_BSDDB),y)
-PYTHON_DEPS += berkeleydb
+PYTHON_DEPENDENCIES += berkeleydb
 else
-BR2_PYTHON_DISABLED_MODULES += bsddb
+PYTHON_CONF_OPT += --disable-bsddb
 endif
 
-ifeq ($(BR2_PACKAGE_PYTHON_TKINTER),y)
-PYTHON_DEPS += tcl
+ifeq ($(BR2_PACKAGE_PYTHON_SQLITE),y)
+PYTHON_DEPENDENCIES += sqlite
 else
-BR2_PYTHON_DISABLED_MODULES += _tkinter
+PYTHON_CONF_OPT += --disable-sqlite3
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON_SSL),y)
-PYTHON_DEPS += openssl
-endif
-
-ifneq ($(BR2_PACKAGE_PYTHON_NIS),y)
-BR2_PYTHON_DISABLED_MODULES += nis
+PYTHON_DEPENDENCIES += openssl
+else
+PYTHON_CONF_OPT += --disable-ssl
 endif
 
 ifneq ($(BR2_PACKAGE_PYTHON_CODECSCJK),y)
-BR2_PYTHON_DISABLED_MODULES += _codecs_kr _codecs_jp _codecs_cn _codecs_tw _codecs_hk
+PYTHON_CONF_OPT += --disable-codecs-cjk
 endif
 
 ifneq ($(BR2_PACKAGE_PYTHON_UNICODEDATA),y)
-BR2_PYTHON_DISABLED_MODULES += unicodedata
+PYTHON_CONF_OPT += --disable-unicodedata
 endif
 
-$(DL_DIR)/$(PYTHON_SOURCE):
-	 $(call DOWNLOAD,$(PYTHON_SITE),$(PYTHON_SOURCE))
-
-python-source: $(DL_DIR)/$(PYTHON_SOURCE)
-
-$(PYTHON_DIR)/.unpacked: $(DL_DIR)/$(PYTHON_SOURCE)
-	$(PYTHON_CAT) $(DL_DIR)/$(PYTHON_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $@
-
-$(PYTHON_DIR)/.patched: $(PYTHON_DIR)/.unpacked
-	toolchain/patch-kernel.sh $(PYTHON_DIR) package/python/ python-$(PYTHON_VERSION_MAJOR)-\*.patch
-	touch $@
-
-$(PYTHON_DIR)/.hostpython: $(PYTHON_DIR)/.patched
-	(cd $(PYTHON_DIR); rm -rf config.cache; \
-		CC="$(HOSTCC)" OPT="-O2" \
-		./configure $(QUIET) \
-		--with-cxx=no \
-		$(DISABLE_NLS) && \
-		$(MAKE) python Parser/pgen && \
-		mv python hostpython && \
-		mv Parser/pgen Parser/hostpgen && \
-		$(MAKE) distclean \
-	) && \
-	touch $@
-
-$(PYTHON_DIR)/.configured: $(PYTHON_DIR)/.hostpython
-	(cd $(PYTHON_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		OPT="$(TARGET_CFLAGS)" \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--sysconfdir=/etc \
-		--with-cxx=no \
-		--enable-shared \
-		$(DISABLE_IPV6) \
-		$(DISABLE_NLS) \
-	)
-	touch $@
-
-$(PYTHON_DIR)/$(PYTHON_BINARY): $(PYTHON_DIR)/.configured
-ifneq ($(BR2_PACKAGE_PYTHON_SSL),y)
-	export PYTHON_DISABLE_SSL=1
-endif
-	$(MAKE) CC="$(TARGET_CC)" -C $(PYTHON_DIR) DESTDIR=$(TARGET_DIR) \
-		PYTHON_MODULES_INCLUDE=$(STAGING_DIR)/usr/include \
-		PYTHON_MODULES_LIB="$(STAGING_DIR)/lib $(STAGING_DIR)/usr/lib" \
-		PYTHON_DISABLE_MODULES="$(BR2_PYTHON_DISABLED_MODULES)" \
-		HOSTPYTHON=./hostpython HOSTPGEN=./Parser/hostpgen
-
-$(TARGET_DIR)/$(PYTHON_TARGET_BINARY): $(PYTHON_DIR)/$(PYTHON_BINARY)
-ifneq ($(BR2_PACKAGE_PYTHON_SSL),y)
-	export PYTHON_DISABLE_SSL=1
-endif
-	rm -rf $(PYTHON_DIR)/Lib/test
-	LD_LIBRARY_PATH=$(STAGING_DIR)/lib
-	# FIXME: The make -i just below is to work around python's bug
-	# #1669349 (http://bugs.python.org/issue1669349) which is introducing
-	# a failure at make install on a python-free system. Since none of
-	# the other the provided workaround work, the make -i is the only
-	# solution. The failing lib is install later in the process, so
-	# even if the compilation is failing without the patch, with it, the
-	# target python is fully functionnal.
-	# The "-i" will have to be removed when the bug will be solved.
-	$(MAKE) CC="$(TARGET_CC)" -C $(PYTHON_DIR) -i install \
-		DESTDIR=$(TARGET_DIR) CROSS_COMPILE=yes \
-		PYTHON_MODULES_INCLUDE=$(STAGING_DIR)/usr/include \
-		PYTHON_MODULES_LIB="$(STAGING_DIR)/lib $(STAGING_DIR)/usr/lib" \
-		PYTHON_DISABLE_MODULES="$(BR2_PYTHON_DISABLED_MODULES)" \
-		HOSTPYTHON=./hostpython HOSTPGEN=./Parser/hostpgen && \
-	rm $(TARGET_DIR)/usr/bin/python && \
-	ln -s python$(PYTHON_VERSION_MAJOR) $(TARGET_DIR)/usr/bin/python && \
-	rm $(TARGET_DIR)/usr/bin/idle && \
-	rm $(TARGET_DIR)/usr/bin/pydoc && \
-	find $(TARGET_DIR)/usr/lib/ -name '*.pyo' -exec rm {} \; && \
-	rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
-		$(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc \
-		$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/test
-	cp -dpr $(TARGET_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR) $(STAGING_DIR)/usr/include/
-	mkdir -p $(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)
-	cp -dpr $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/config $(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/
-
-ifeq ($(BR2_PACKAGE_PYTHON_PY_ONLY),y)
-	find $(TARGET_DIR)/usr/lib/ -name '*.pyc' -exec rm {} \;
-endif
-ifeq ($(BR2_PACKAGE_PYTHON_PYC_ONLY),y)
-	find $(TARGET_DIR)/usr/lib/ -name '*.py' -exec rm {} \;
-endif
-ifneq ($(BR2_PACKAGE_PYTHON_DEV),y)
-	rm -rf $(TARGET_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)
-	rm -rf $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/config
-endif
-ifneq ($(BR2_PACKAGE_PYTHON_BSDDB),y)
-	rm -rf $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/bsddb
-endif
-ifneq ($(BR2_PACKAGE_PYTHON_CURSES),y)
-	rm -rf $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/curses
-endif
-ifneq ($(BR2_PACKAGE_PYTHON_TKINTER),y)
-	rm -rf $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/lib-tk
+ifeq ($(BR2_PACKAGE_PYTHON_BZIP2),y)
+PYTHON_DEPENDENCIES += bzip2
+else
+PYTHON_CONF_OPT += --disable-bz2
 endif
-	touch -c $@
-
-python: $(PYTHON_DEPS) $(TARGET_DIR)/$(PYTHON_TARGET_BINARY)
-
-python-clean:
-	-$(MAKE) -C $(PYTHON_DIR) distclean
-	rm -f $(PYTHON_DIR)/.configured $(TARGET_DIR)/$(PYTHON_TARGET_BINARY)
-	-rm -rf $(TARGET_DIR)/usr/lib/python* $(TARGET_DIR)/usr/include/python*
-	-rm -f $(STAGING_DIR)/usr/lib/libpython$(PYTHON_VERSION_MAJOR).so
-
-python-dirclean:
-	rm -rf $(PYTHON_DIR)
-
-####  LIBPYTHON
 
+ifeq ($(BR2_PACKAGE_PYTHON_ZLIB),y)
+PYTHON_DEPENDENCIES += zlib
+else
+PYTHON_CONF_OPT += --disable-zlib
+endif
+
+PYTHON_CONF_ENV += \
+	PYTHON_FOR_BUILD=$(HOST_PYTHON_DIR)/python \
+	PGEN_FOR_BUILD=$(HOST_PYTHON_DIR)/Parser/pgen \
+	ac_cv_have_long_long_format=yes
+
+PYTHON_CONF_OPT += \
+	--without-cxx-main 	\
+	--without-doc-strings	\
+	--with-system-ffi	\
+	--disable-pydoc		\
+	--disable-test-modules	\
+	--disable-lib2to3	\
+	--disable-gdbm		\
+	--disable-tk		\
+	--disable-nis		\
+	--disable-dbm
+
+PYTHON_MAKE_ENV = \
+	PYTHON_MODULES_INCLUDE=$(STAGING_DIR)/usr/include \
+	PYTHON_MODULES_LIB="$(STAGING_DIR)/lib $(STAGING_DIR)/usr/lib"
 
-LIBPYTHON_BINARY:=libpython$(PYTHON_VERSION_MAJOR).so
+#
+# Development files removal
+#
+define PYTHON_REMOVE_DEVFILES
+	rm -f $(TARGET_DIR)/usr/bin/python$(PYTHON_VERSION_MAJOR)-config
+	rm -f $(TARGET_DIR)/usr/bin/python-config
+endef
 
-libpython:	python $(TARGET_DIR)/usr/lib/$(LIBPYTHON_BINARY)
+ifneq ($(BR2_HAVE_DEVFILES),y)
+PYTHON_POST_INSTALL_TARGET_HOOKS += PYTHON_REMOVE_DEVFILES
+endif
 
+#
+# Remove useless files. In the config/ directory, only the Makefile
+# and the pyconfig.h files are needed at runtime.
+#
+define PYTHON_REMOVE_USELESS_FILES
+	for i in `find $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/config/ \
+		-type f -not -name pyconfig.h -a -not -name Makefile` ; do \
+		rm -f $$i ; \
+	done
+endef
 
-$(STAGING_DIR)/usr/lib/$(LIBPYTHON_BINARY): $(TARGET_DIR)/$(PYTHON_TARGET_BINARY)
-		cp -dpr $(PYTHON_DIR)/$(LIBPYTHON_BINARY).* $(STAGING_DIR)/usr/lib
-		(\
-		cd $(STAGING_DIR)/usr/lib ; \
-		rm -f $(LIBPYTHON_BINARY) ; \
-		ln -s `basename  \`ls libpython*.so.*\`` $(LIBPYTHON_BINARY) \
-		)
+PYTHON_POST_INSTALL_TARGET_HOOKS += PYTHON_REMOVE_USELESS_FILES
 
-$(TARGET_DIR)/usr/lib/$(LIBPYTHON_BINARY): $(STAGING_DIR)/usr/lib/$(LIBPYTHON_BINARY)
-		cp -dpr $(STAGING_DIR)/usr/lib/$(LIBPYTHON_BINARY).* $(TARGET_DIR)/usr/lib
-		(\
-		cd $(TARGET_DIR)/usr/lib ; \
-		rm -f $(LIBPYTHON_BINARY) ; \
-		ln -s `basename  \`ls libpython*.so.*\`` $(LIBPYTHON_BINARY) \
-		)
+PYTHON_AUTORECONF = YES
 
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_PYTHON),y)
-TARGETS+=python
-endif
+$(eval $(call AUTOTARGETS,package,python))
+$(eval $(call AUTOTARGETS,package,python,host))
\ No newline at end of file
-- 
1.7.0.4
