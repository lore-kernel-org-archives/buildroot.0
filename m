From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Jan 2011 12:01:30 +0100
Subject: [Buildroot] [PATCH 02/10] python: Port the python2.4 patches to 2.7
In-Reply-To: <cover.1295866866.git.thomas.petazzoni@free-electrons.com>
References: <cover.1295866866.git.thomas.petazzoni@free-electrons.com>
Message-ID: <6f9dbd86810c3f3f216c9d678354886065ffe154.1295866866.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Maxime Ripard <maxime.ripard@anandra.org>

Signed-off-by: Maxime Ripard <ripard@archos.com>
---
 package/python/python-2.4-001-cross-compile.patch  |  106 ------------------
 package/python/python-2.4-002-cross-compile.patch  |   36 ------
 .../python-2.4-010-disable_modules_and_ssl.patch   |   37 -------
 .../python-2.4-020-gentoo_py_dontcompile.patch     |   18 ---
 package/python/python-2.7-001-cross-compile.patch  |  114 ++++++++++++++++++++
 package/python/python-2.7-002-cross-compile.patch  |   47 ++++++++
 .../python-2.7-010-disable_modules_and_ssl.patch   |   49 +++++++++
 .../python-2.7-020-gentoo_py_dontcompile.patch     |   27 +++++
 8 files changed, 237 insertions(+), 197 deletions(-)
 delete mode 100644 package/python/python-2.4-001-cross-compile.patch
 delete mode 100644 package/python/python-2.4-002-cross-compile.patch
 delete mode 100644 package/python/python-2.4-010-disable_modules_and_ssl.patch
 delete mode 100644 package/python/python-2.4-020-gentoo_py_dontcompile.patch
 create mode 100644 package/python/python-2.7-001-cross-compile.patch
 create mode 100644 package/python/python-2.7-002-cross-compile.patch
 create mode 100644 package/python/python-2.7-010-disable_modules_and_ssl.patch
 create mode 100644 package/python/python-2.7-020-gentoo_py_dontcompile.patch

diff --git a/package/python/python-2.4-001-cross-compile.patch b/package/python/python-2.4-001-cross-compile.patch
deleted file mode 100644
index 96e52a6..0000000
--- a/package/python/python-2.4-001-cross-compile.patch
+++ /dev/null
@@ -1,106 +0,0 @@
-diff -rduNp Python-2.4.2.orig/Makefile.pre.in Python-2.4.2/Makefile.pre.in
---- Python-2.4.2.orig/Makefile.pre.in	2005-03-29 01:23:01.000000000 +0200
-+++ Python-2.4.2/Makefile.pre.in	2007-01-22 19:37:08.000000000 +0100
-@@ -162,6 +162,7 @@ UNICODE_OBJS=   @UNICODE_OBJS@
- 
- PYTHON=		python$(EXE)
- BUILDPYTHON=	python$(BUILDEXE)
-+HOSTPYTHON=	$(BUILDPYTHON)
- 
- # === Definitions added by makesetup ===
- 
-@@ -188,7 +189,7 @@ GRAMMAR_INPUT=	$(srcdir)/Grammar/Grammar
- ##########################################################################
- # Parser
- PGEN=		Parser/pgen$(EXE)
--
-+HOSTPGEN=	$(PGEN)$(EXE)
- POBJS=		\
- 		Parser/acceler.o \
- 		Parser/grammar1.o \
-@@ -320,8 +321,8 @@ platform: $(BUILDPYTHON)
- # Build the shared modules
- sharedmods: $(BUILDPYTHON)
- 	case $$MAKEFLAGS in \
--	*-s*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' ./$(BUILDPYTHON) -E $(srcdir)/setup.py -q build;; \
--	*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' ./$(BUILDPYTHON) -E $(srcdir)/setup.py build;; \
-+	*-s*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' $(HOSTPYTHON) -E $(srcdir)/setup.py -q build;; \
-+	*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' $(HOSTPYTHON) -E $(srcdir)/setup.py build;; \
- 	esac
- 
- # buildno should really depend on something like LIBRARY_SRC
-@@ -442,7 +443,7 @@ Modules/ccpython.o: $(srcdir)/Modules/cc
- 
- 
- $(GRAMMAR_H) $(GRAMMAR_C): $(PGEN) $(GRAMMAR_INPUT)
--		-$(PGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
-+		-$(HOSTPGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
- 
- $(PGEN):	$(PGENOBJS)
- 		$(CC) $(OPT) $(LDFLAGS) $(PGENOBJS) $(LIBS) -o $(PGEN)
-@@ -719,19 +720,19 @@ libinstall:	$(BUILDPYTHON) $(srcdir)/Lib
- 	done
- 	$(INSTALL_DATA) $(srcdir)/LICENSE $(DESTDIR)$(LIBDEST)/LICENSE.txt
- 	PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
--		./$(BUILDPYTHON) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py \
-+		$(HOSTPYTHON) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py \
- 		-d $(LIBDEST) -f \
- 		-x 'badsyntax|site-packages' $(DESTDIR)$(LIBDEST)
- 	PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
--		./$(BUILDPYTHON) -Wi -tt -O $(DESTDIR)$(LIBDEST)/compileall.py \
-+		$(HOSTPYTHON) -Wi -tt -O $(DESTDIR)$(LIBDEST)/compileall.py \
- 		-d $(LIBDEST) -f \
- 		-x 'badsyntax|site-packages' $(DESTDIR)$(LIBDEST)
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
- 
-@@ -826,7 +827,7 @@ libainstall:	all
- # Install the dynamically loadable modules
- # This goes into $(exec_prefix)
- sharedinstall:
--	$(RUNSHARED) ./$(BUILDPYTHON) -E $(srcdir)/setup.py install \
-+	$(RUNSHARED) $(HOSTPYTHON) -E $(srcdir)/setup.py install \
- 	   	--prefix=$(prefix) \
- 		--install-scripts=$(BINDIR) \
- 		--install-platlib=$(DESTSHARED) \
-diff -rduNp Python-2.4.2.orig/setup.py Python-2.4.2/setup.py
---- Python-2.4.2.orig/setup.py	2005-03-09 23:27:24.000000000 +0100
-+++ Python-2.4.2/setup.py	2007-01-22 19:37:08.000000000 +0100
-@@ -204,6 +204,7 @@ class PyBuildExt(build_ext):
-         try:
-             imp.load_dynamic(ext.name, ext_filename)
-         except ImportError, why:
-+            return
-             self.announce('*** WARNING: renaming "%s" since importing it'
-                           ' failed: %s' % (ext.name, why), level=3)
-             assert not self.inplace
-@@ -239,8 +240,6 @@ class PyBuildExt(build_ext):
- 
-     def detect_modules(self):
-         # Ensure that /usr/local is always used
--        add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
--        add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
- 
-         # Add paths to popular package managers on OS X/darwin
-         if sys.platform == "darwin":
-@@ -251,12 +250,6 @@ class PyBuildExt(build_ext):
-             add_dir_to_list(self.compiler.library_dirs, '/opt/local/lib')
-             add_dir_to_list(self.compiler.include_dirs, '/opt/local/include')
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
diff --git a/package/python/python-2.4-002-cross-compile.patch b/package/python/python-2.4-002-cross-compile.patch
deleted file mode 100644
index 207335a..0000000
--- a/package/python/python-2.4-002-cross-compile.patch
+++ /dev/null
@@ -1,36 +0,0 @@
---- Python-2.4.2-001/setup.py	2007-01-23 16:18:37.000000000 +0100
-+++ Python-2.4.2/setup.py	2007-01-23 16:26:43.000000000 +0100
-@@ -239,7 +239,18 @@
-         return sys.platform
- 
-     def detect_modules(self):
--        # Ensure that /usr/local is always used
-+        try:
-+            modules_include_dirs = os.environ["PYTHON_MODULES_INCLUDE"].split()
-+        except KeyError:
-+            modules_include_dirs = ['/usr/include']
-+        try:
-+            modules_lib_dirs = os.environ["PYTHON_MODULES_LIB"].split()
-+        except KeyError:
-+            modules_lib_dirs = ['/usr/lib']
-+        for dir in modules_include_dirs:
-+                add_dir_to_list(self.compiler.include_dirs, dir)
-+        for dir in modules_lib_dirs:
-+                add_dir_to_list(self.compiler.library_dirs, dir)
- 
-         # Add paths to popular package managers on OS X/darwin
-         if sys.platform == "darwin":
-@@ -258,11 +269,8 @@
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
- 
-         platform = self.get_platform()
diff --git a/package/python/python-2.4-010-disable_modules_and_ssl.patch b/package/python/python-2.4-010-disable_modules_and_ssl.patch
deleted file mode 100644
index a690eae..0000000
--- a/package/python/python-2.4-010-disable_modules_and_ssl.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-diff -rduNp Python-2.4.2-002/setup.py Python-2.4.2/setup.py
---- Python-2.4.2-002/setup.py	2007-01-22 19:41:47.000000000 +0100
-+++ Python-2.4.2/setup.py	2007-01-22 19:47:25.000000000 +0100
-@@ -15,7 +15,14 @@ from distutils.command.install import in
- from distutils.command.install_lib import install_lib
- 
- # This global variable is used to hold the list of modules to be disabled.
--disabled_module_list = []
-+try:
-+	disabled_module_list = os.environ["PYTHON_DISABLE_MODULES"].split()
-+except KeyError:
-+	disabled_module_list = []
-+try:
-+	disable_ssl = os.environ["PYTHON_DISABLE_SSL"]
-+except KeyError:
-+	disable_ssl = 0
- 
- def add_dir_to_list(dirlist, dir):
-     """Add the directory 'dir' to the list 'dirlist' (at the front) if
-@@ -247,6 +254,7 @@ class PyBuildExt(build_ext):
-         return sys.platform
- 
-     def detect_modules(self):
-+        global disable_ssl
-         try:
-             modules_include_dirs = os.environ["PYTHON_MODULES_INCLUDE"].split()
-         except KeyError:
-@@ -468,7 +476,8 @@ class PyBuildExt(build_ext):
-                                      ] )
- 
-         if (ssl_incs is not None and
--            ssl_libs is not None):
-+            ssl_libs is not None and
-+			not disable_ssl):
-             exts.append( Extension('_ssl', ['_ssl.c'],
-                                    include_dirs = ssl_incs,
-                                    library_dirs = ssl_libs,
diff --git a/package/python/python-2.4-020-gentoo_py_dontcompile.patch b/package/python/python-2.4-020-gentoo_py_dontcompile.patch
deleted file mode 100644
index 6e634be..0000000
--- a/package/python/python-2.4-020-gentoo_py_dontcompile.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-diff -rduNp Python-2.4.2-010/Python/import.c Python-2.4.2/Python/import.c
---- Python-2.4.2-010/Python/import.c	2005-09-14 20:15:03.000000000 +0200
-+++ Python-2.4.2/Python/import.c	2007-01-22 19:49:18.000000000 +0100
-@@ -822,8 +822,12 @@ static void
- write_compiled_module(PyCodeObject *co, char *cpathname, long mtime)
- {
- 	FILE *fp;
--
--	fp = open_exclusive(cpathname);
-+   char *py_dontcompile = getenv("PYTHON_DONTCOMPILE");
-+   
-+   if (!py_dontcompile) 
-+     fp = open_exclusive(cpathname);
-+   else
-+     fp = NULL;
- 	if (fp == NULL) {
- 		if (Py_VerboseFlag)
- 			PySys_WriteStderr(
diff --git a/package/python/python-2.7-001-cross-compile.patch b/package/python/python-2.7-001-cross-compile.patch
new file mode 100644
index 0000000..1ee97a8
--- /dev/null
+++ b/package/python/python-2.7-001-cross-compile.patch
@@ -0,0 +1,114 @@
+Add cross-compilation support in the python Makefile and setup.py since
+python has no such support.
+
+The main point here is to first build a python interpreter to run on the
+host, and then use it to compile the target python.
+
+We also remove some error-generating code that is irrelevant in our
+situation, such as checking if we can import a cross-compiled module.
+
+Patch ported to python2.7 by Maxime Ripard <ripard@archos.com>
+
+diff -rduNp Python-2.7.orig/Makefile.pre.in Python-2.7/Makefile.pre.in
+--- Python-2.7.orig/Makefile.pre.in	2010-04-12 02:10:46.000000000 +0200
++++ Python-2.7/Makefile.pre.in	2010-09-21 16:46:07.000000000 +0200
+@@ -404,8 +404,8 @@ platform: $(BUILDPYTHON)
+ # Build the shared modules
+ sharedmods: $(BUILDPYTHON)
+ 	@case $$MAKEFLAGS in \
+-	*s*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' LDFLAGS='$(LDFLAGS)' OPT='$(OPT)' ./$(BUILDPYTHON) -E $(srcdir)/setup.py -q build;; \
+-	*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' LDFLAGS='$(LDFLAGS)' OPT='$(OPT)' ./$(BUILDPYTHON) -E $(srcdir)/setup.py build;; \
++	*s*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' LDFLAGS='$(LDFLAGS)' OPT='$(OPT)' $(HOSTPYTHON) -E $(srcdir)/setup.py -q build;; \
++	*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' LDFLAGS='$(LDFLAGS)' OPT='$(OPT)' $(HOSTPYTHON) -E $(srcdir)/setup.py build;; \
+ 	esac
+ 
+ # Build static library
+@@ -538,7 +538,7 @@ Modules/python.o: $(srcdir)/Modules/pyth
+ 
+ $(GRAMMAR_H) $(GRAMMAR_C): $(PGEN) $(GRAMMAR_INPUT)
+ 		-@$(INSTALL) -d Include
+-		-$(PGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
++		-$(HOSTPGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
+ 
+ $(PGEN):	$(PGENOBJS)
+ 		$(CC) $(OPT) $(LDFLAGS) $(PGENOBJS) $(LIBS) -o $(PGEN)
+@@ -920,25 +920,25 @@ libinstall:	build_all $(srcdir)/Lib/$(PL
+ 	done
+ 	$(INSTALL_DATA) $(srcdir)/LICENSE $(DESTDIR)$(LIBDEST)/LICENSE.txt
+ 	PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
+-		./$(BUILDPYTHON) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py \
++		$(HOSTPYTHON) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py \
+ 		-d $(LIBDEST) -f \
+ 		-x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data' \
+ 		$(DESTDIR)$(LIBDEST)
+ 	PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
+-		./$(BUILDPYTHON) -Wi -tt -O $(DESTDIR)$(LIBDEST)/compileall.py \
++		$(HOSTPYTHON) -Wi -tt -O $(DESTDIR)$(LIBDEST)/compileall.py \
+ 		-d $(LIBDEST) -f \
+ 		-x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data' \
+ 		$(DESTDIR)$(LIBDEST)
+ 	-PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
+-		./$(BUILDPYTHON) -Wi -t $(DESTDIR)$(LIBDEST)/compileall.py \
++		$(HOSTPYTHON) -Wi -t $(DESTDIR)$(LIBDEST)/compileall.py \
+ 		-d $(LIBDEST)/site-packages -f \
+ 		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
+ 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
+-		./$(BUILDPYTHON) -Wi -t -O $(DESTDIR)$(LIBDEST)/compileall.py \
++		$(HOSTPYTHON) -Wi -t -O $(DESTDIR)$(LIBDEST)/compileall.py \
+ 		-d $(LIBDEST)/site-packages -f \
+ 		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
+ 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
+-		./$(BUILDPYTHON) -Wi -t -c "import lib2to3.pygram, lib2to3.patcomp;lib2to3.patcomp.PatternCompiler()"
++		$(HOSTPYTHON) -Wi -t -c "import lib2to3.pygram, lib2to3.patcomp;lib2to3.patcomp.PatternCompiler()"
+ 
+ # Create the PLATDIR source directory, if one wasn't distributed..
+ $(srcdir)/Lib/$(PLATDIR):
+@@ -1043,7 +1043,7 @@ libainstall:	all python-config
+ # Install the dynamically loadable modules
+ # This goes into $(exec_prefix)
+ sharedinstall:
+-	$(RUNSHARED) ./$(BUILDPYTHON) -E $(srcdir)/setup.py install \
++	$(RUNSHARED) $(HOSTPYTHON) -E $(srcdir)/setup.py install \
+ 	   	--prefix=$(prefix) \
+ 		--install-scripts=$(BINDIR) \
+ 		--install-platlib=$(DESTSHARED) \
+diff -rduNp Python-2.7.orig/setup.py Python-2.7/setup.py
+--- Python-2.7.orig/setup.py	2010-06-27 14:36:16.000000000 +0200
++++ Python-2.7/setup.py	2010-09-21 16:59:59.000000000 +0200
+@@ -310,9 +310,9 @@ class PyBuildExt(build_ext):
+         try:
+             imp.load_dynamic(ext.name, ext_filename)
+         except ImportError, why:
+-            self.failed.append(ext.name)
+-            self.announce('*** WARNING: renaming "%s" since importing it'
+-                          ' failed: %s' % (ext.name, why), level=3)
++            self.announce('*** WARNING: Importing "%s" failed, probably '
++                          'because of cross-compilation' % ext.name, level=3)
++            return
+             assert not self.inplace
+             basename, tail = os.path.splitext(ext_filename)
+             newname = basename + "_failed" + tail
+@@ -346,10 +346,6 @@ class PyBuildExt(build_ext):
+         return sys.platform
+ 
+     def detect_modules(self):
+-        # Ensure that /usr/local is always used
+-        add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
+-        add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
+-
+         # Add paths specified in the environment variables LDFLAGS and
+         # CPPFLAGS for header and library files.
+         # We must get the values from the Makefile and not the environment
+@@ -384,12 +380,6 @@ class PyBuildExt(build_ext):
+                     for directory in reversed(options.dirs):
+                         add_dir_to_list(dir_list, directory)
+ 
+-        if os.path.normpath(sys.prefix) != '/usr':
+-            add_dir_to_list(self.compiler.library_dirs,
+-                            sysconfig.get_config_var("LIBDIR"))
+-            add_dir_to_list(self.compiler.include_dirs,
+-                            sysconfig.get_config_var("INCLUDEDIR"))
+-
+         try:
+             have_unicode = unicode
+         except NameError:
diff --git a/package/python/python-2.7-002-cross-compile.patch b/package/python/python-2.7-002-cross-compile.patch
new file mode 100644
index 0000000..598e5f5
--- /dev/null
+++ b/package/python/python-2.7-002-cross-compile.patch
@@ -0,0 +1,47 @@
+Second patch to bring cross-compilation support to python build-system.
+
+Allow the libraries detection routine to look for headers and libs in
+other directories than /usr/include or /usr/lib through the env variables
+PYTHON_MODULES_INCLUDE and PYTHON_MODULES_LIB.
+
+We can then use it to look for libraries in the buildroot staging directory.
+
+
+Patch ported to python2.7 by Maxime Ripard <ripard@archos.com>
+
+diff -rduNp Python-2.7.orig/setup.py Python-2.7/setup.py
+--- Python-2.7.orig/setup.py	2010-09-21 17:15:31.000000000 +0200
++++ Python-2.7/setup.py	2010-09-21 17:20:46.000000000 +0200
+@@ -346,6 +346,18 @@ class PyBuildExt(build_ext):
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
+         # Add paths specified in the environment variables LDFLAGS and
+         # CPPFLAGS for header and library files.
+         # We must get the values from the Makefile and not the environment
+@@ -388,11 +400,8 @@ class PyBuildExt(build_ext):
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
+         exts = []
+         missing = []
+ 
diff --git a/package/python/python-2.7-010-disable_modules_and_ssl.patch b/package/python/python-2.7-010-disable_modules_and_ssl.patch
new file mode 100644
index 0000000..492e372
--- /dev/null
+++ b/package/python/python-2.7-010-disable_modules_and_ssl.patch
@@ -0,0 +1,49 @@
+Support some customisation on python compilation.
+
+With this patch, we can now remove some modules introducing external
+dependencies from the compilation, thus removing these irrelevant in most
+cases dependencies (ie. openssl, ncurses, etc).
+
+This modules can be removed by listing them in the PYTHON_DISABLE_MODULES
+environment variable.
+
+Patch ported to python2.7 by Maxime Ripard <ripard@archos.com>
+
+diff -rduNp Python-2.7.orig/setup.py Python-2.7/setup.py
+--- Python-2.7.orig/setup.py	2010-09-21 17:31:52.000000000 +0200
++++ Python-2.7/setup.py	2010-09-21 17:35:20.000000000 +0200
+@@ -21,7 +21,15 @@ from distutils.spawn import find_executa
+ COMPILED_WITH_PYDEBUG = hasattr(sys, 'gettotalrefcount')
+ 
+ # This global variable is used to hold the list of modules to be disabled.
+-disabled_module_list = []
++try:
++    disabled_module_list = os.environ["PYTHON_DISABLE_MODULES"].split()
++except KeyError:
++    disabled_module_list = list()
++
++try:
++    disable_ssl = os.environ["PYTHON_DISABLE_SSL"]
++except KeyError:
++    disable_ssl = 0
+ 
+ def add_dir_to_list(dirlist, dir):
+     """Add the directory 'dir' to the list 'dirlist' (at the front) if
+@@ -346,6 +354,7 @@ class PyBuildExt(build_ext):
+         return sys.platform
+ 
+     def detect_modules(self):
++        global disable_ssl
+         try:
+             modules_include_dirs = os.environ["PYTHON_MODULES_INCLUDE"].split()
+         except KeyError:
+@@ -685,7 +694,8 @@ class PyBuildExt(build_ext):
+                                      ] )
+ 
+         if (ssl_incs is not None and
+-            ssl_libs is not None):
++            ssl_libs is not None and
++            not disable_ssl):
+             exts.append( Extension('_ssl', ['_ssl.c'],
+                                    include_dirs = ssl_incs,
+                                    library_dirs = ssl_libs,
diff --git a/package/python/python-2.7-020-gentoo_py_dontcompile.patch b/package/python/python-2.7-020-gentoo_py_dontcompile.patch
new file mode 100644
index 0000000..276f0e6
--- /dev/null
+++ b/package/python/python-2.7-020-gentoo_py_dontcompile.patch
@@ -0,0 +1,27 @@
+This patch purpose is to allow not to save the generated python bytecode in
+a file for later use through the PYTHON_DONTCOMPILE environment variable.
+
+I do not see the use of it, because you can choose if you want but it seems
+somewhat related to gentoo.
+
+Maybe useful when the generated rootfs is mounted on read-only on the target.
+
+Patch ported to python2.7 by Maxime Ripard <ripard@archos.com>
+
+diff -rduNp Python-2.7.orig/Python/import.c Python-2.7/Python/import.c
+--- Python-2.7.orig/Python/import.c	2010-09-30 12:05:53.000000000 +0200
++++ Python-2.7/Python/import.c	2010-09-30 12:20:38.000000000 +0200
+@@ -886,7 +886,12 @@ write_compiled_module(PyCodeObject *co,
+     mode_t mode = srcstat->st_mode & ~S_IXUSR & ~S_IXGRP & ~S_IXOTH;
+ #endif
+ 
+-    fp = open_exclusive(cpathname, mode);
++    char *py_dontcompile = getenv("PYTHON_DONTCOMPILE");
++
++    if (!py_dontcompile)
++      fp = open_exclusive(cpathname, mode);
++    else
++      fp = NULL;
+     if (fp == NULL) {
+         if (Py_VerboseFlag)
+             PySys_WriteStderr(
-- 
1.7.0.4
