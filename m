From: hamish at uclibc.org <hamish@uclibc.org>
Date: Tue,  7 Oct 2008 22:03:00 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/python
Message-ID: <20081008050300.29993F8006@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: hamish
Date: 2008-10-07 22:02:59 -0700 (Tue, 07 Oct 2008)
New Revision: 23622

Log:
Rename patches to include Python 2.4 version, in preparation for adding 2.5


Added:
   trunk/buildroot/package/python/python-2.4-001-cross-compile.patch
   trunk/buildroot/package/python/python-2.4-002-cross-compile.patch
   trunk/buildroot/package/python/python-2.4-010-disable_modules_and_ssl.patch
   trunk/buildroot/package/python/python-2.4-020-gentoo_py_dontcompile.patch

Removed:
   trunk/buildroot/package/python/python-001-cross-compile.patch
   trunk/buildroot/package/python/python-002-cross-compile.patch
   trunk/buildroot/package/python/python-010-disable_modules_and_ssl.patch
   trunk/buildroot/package/python/python-020-gentoo_py_dontcompile.patch

Modified:
   trunk/buildroot/package/python/python.mk


Changeset:
Deleted: trunk/buildroot/package/python/python-001-cross-compile.patch
===================================================================
--- trunk/buildroot/package/python/python-001-cross-compile.patch	2008-10-07 20:29:27 UTC (rev 23621)
+++ trunk/buildroot/package/python/python-001-cross-compile.patch	2008-10-08 05:02:59 UTC (rev 23622)
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

Deleted: trunk/buildroot/package/python/python-002-cross-compile.patch
===================================================================
--- trunk/buildroot/package/python/python-002-cross-compile.patch	2008-10-07 20:29:27 UTC (rev 23621)
+++ trunk/buildroot/package/python/python-002-cross-compile.patch	2008-10-08 05:02:59 UTC (rev 23622)
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

Deleted: trunk/buildroot/package/python/python-010-disable_modules_and_ssl.patch
===================================================================
--- trunk/buildroot/package/python/python-010-disable_modules_and_ssl.patch	2008-10-07 20:29:27 UTC (rev 23621)
+++ trunk/buildroot/package/python/python-010-disable_modules_and_ssl.patch	2008-10-08 05:02:59 UTC (rev 23622)
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

Deleted: trunk/buildroot/package/python/python-020-gentoo_py_dontcompile.patch
===================================================================
--- trunk/buildroot/package/python/python-020-gentoo_py_dontcompile.patch	2008-10-07 20:29:27 UTC (rev 23621)
+++ trunk/buildroot/package/python/python-020-gentoo_py_dontcompile.patch	2008-10-08 05:02:59 UTC (rev 23622)
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

Copied: trunk/buildroot/package/python/python-2.4-001-cross-compile.patch (from rev 23621, trunk/buildroot/package/python/python-001-cross-compile.patch)
===================================================================
--- trunk/buildroot/package/python/python-2.4-001-cross-compile.patch	                        (rev 0)
+++ trunk/buildroot/package/python/python-2.4-001-cross-compile.patch	2008-10-08 05:02:59 UTC (rev 23622)
@@ -0,0 +1,106 @@
+diff -rduNp Python-2.4.2.orig/Makefile.pre.in Python-2.4.2/Makefile.pre.in
+--- Python-2.4.2.orig/Makefile.pre.in	2005-03-29 01:23:01.000000000 +0200
++++ Python-2.4.2/Makefile.pre.in	2007-01-22 19:37:08.000000000 +0100
+@@ -162,6 +162,7 @@ UNICODE_OBJS=   @UNICODE_OBJS@
+ 
+ PYTHON=		python$(EXE)
+ BUILDPYTHON=	python$(BUILDEXE)
++HOSTPYTHON=	$(BUILDPYTHON)
+ 
+ # === Definitions added by makesetup ===
+ 
+@@ -188,7 +189,7 @@ GRAMMAR_INPUT=	$(srcdir)/Grammar/Grammar
+ ##########################################################################
+ # Parser
+ PGEN=		Parser/pgen$(EXE)
+-
++HOSTPGEN=	$(PGEN)$(EXE)
+ POBJS=		\
+ 		Parser/acceler.o \
+ 		Parser/grammar1.o \
+@@ -320,8 +321,8 @@ platform: $(BUILDPYTHON)
+ # Build the shared modules
+ sharedmods: $(BUILDPYTHON)
+ 	case $$MAKEFLAGS in \
+-	*-s*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' ./$(BUILDPYTHON) -E $(srcdir)/setup.py -q build;; \
+-	*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' ./$(BUILDPYTHON) -E $(srcdir)/setup.py build;; \
++	*-s*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' $(HOSTPYTHON) -E $(srcdir)/setup.py -q build;; \
++	*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' $(HOSTPYTHON) -E $(srcdir)/setup.py build;; \
+ 	esac
+ 
+ # buildno should really depend on something like LIBRARY_SRC
+@@ -442,7 +443,7 @@ Modules/ccpython.o: $(srcdir)/Modules/cc
+ 
+ 
+ $(GRAMMAR_H) $(GRAMMAR_C): $(PGEN) $(GRAMMAR_INPUT)
+-		-$(PGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
++		-$(HOSTPGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
+ 
+ $(PGEN):	$(PGENOBJS)
+ 		$(CC) $(OPT) $(LDFLAGS) $(PGENOBJS) $(LIBS) -o $(PGEN)
+@@ -719,19 +720,19 @@ libinstall:	$(BUILDPYTHON) $(srcdir)/Lib
+ 	done
+ 	$(INSTALL_DATA) $(srcdir)/LICENSE $(DESTDIR)$(LIBDEST)/LICENSE.txt
+ 	PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
+-		./$(BUILDPYTHON) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py \
++		$(HOSTPYTHON) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py \
+ 		-d $(LIBDEST) -f \
+ 		-x 'badsyntax|site-packages' $(DESTDIR)$(LIBDEST)
+ 	PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
+-		./$(BUILDPYTHON) -Wi -tt -O $(DESTDIR)$(LIBDEST)/compileall.py \
++		$(HOSTPYTHON) -Wi -tt -O $(DESTDIR)$(LIBDEST)/compileall.py \
+ 		-d $(LIBDEST) -f \
+ 		-x 'badsyntax|site-packages' $(DESTDIR)$(LIBDEST)
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
+ 
+@@ -826,7 +827,7 @@ libainstall:	all
+ # Install the dynamically loadable modules
+ # This goes into $(exec_prefix)
+ sharedinstall:
+-	$(RUNSHARED) ./$(BUILDPYTHON) -E $(srcdir)/setup.py install \
++	$(RUNSHARED) $(HOSTPYTHON) -E $(srcdir)/setup.py install \
+ 	   	--prefix=$(prefix) \
+ 		--install-scripts=$(BINDIR) \
+ 		--install-platlib=$(DESTSHARED) \
+diff -rduNp Python-2.4.2.orig/setup.py Python-2.4.2/setup.py
+--- Python-2.4.2.orig/setup.py	2005-03-09 23:27:24.000000000 +0100
++++ Python-2.4.2/setup.py	2007-01-22 19:37:08.000000000 +0100
+@@ -204,6 +204,7 @@ class PyBuildExt(build_ext):
+         try:
+             imp.load_dynamic(ext.name, ext_filename)
+         except ImportError, why:
++            return
+             self.announce('*** WARNING: renaming "%s" since importing it'
+                           ' failed: %s' % (ext.name, why), level=3)
+             assert not self.inplace
+@@ -239,8 +240,6 @@ class PyBuildExt(build_ext):
+ 
+     def detect_modules(self):
+         # Ensure that /usr/local is always used
+-        add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
+-        add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
+ 
+         # Add paths to popular package managers on OS X/darwin
+         if sys.platform == "darwin":
+@@ -251,12 +250,6 @@ class PyBuildExt(build_ext):
+             add_dir_to_list(self.compiler.library_dirs, '/opt/local/lib')
+             add_dir_to_list(self.compiler.include_dirs, '/opt/local/include')
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


Property changes on: trunk/buildroot/package/python/python-2.4-001-cross-compile.patch
___________________________________________________________________
Name: svn:mergeinfo
   + 

Copied: trunk/buildroot/package/python/python-2.4-002-cross-compile.patch (from rev 23621, trunk/buildroot/package/python/python-002-cross-compile.patch)
===================================================================
--- trunk/buildroot/package/python/python-2.4-002-cross-compile.patch	                        (rev 0)
+++ trunk/buildroot/package/python/python-2.4-002-cross-compile.patch	2008-10-08 05:02:59 UTC (rev 23622)
@@ -0,0 +1,36 @@
+--- Python-2.4.2-001/setup.py	2007-01-23 16:18:37.000000000 +0100
++++ Python-2.4.2/setup.py	2007-01-23 16:26:43.000000000 +0100
+@@ -239,7 +239,18 @@
+         return sys.platform
+ 
+     def detect_modules(self):
+-        # Ensure that /usr/local is always used
++        try:
++            modules_include_dirs = os.environ["PYTHON_MODULES_INCLUDE"].split()
++        except KeyError:
++            modules_include_dirs = ['/usr/include']
++        try:
++            modules_lib_dirs = os.environ["PYTHON_MODULES_LIB"].split()
++        except KeyError:
++            modules_lib_dirs = ['/usr/lib']
++        for dir in modules_include_dirs:
++                add_dir_to_list(self.compiler.include_dirs, dir)
++        for dir in modules_lib_dirs:
++                add_dir_to_list(self.compiler.library_dirs, dir)
+ 
+         # Add paths to popular package managers on OS X/darwin
+         if sys.platform == "darwin":
+@@ -258,11 +269,8 @@
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
+ 
+         platform = self.get_platform()


Property changes on: trunk/buildroot/package/python/python-2.4-002-cross-compile.patch
___________________________________________________________________
Name: svn:mergeinfo
   + 

Copied: trunk/buildroot/package/python/python-2.4-010-disable_modules_and_ssl.patch (from rev 23621, trunk/buildroot/package/python/python-010-disable_modules_and_ssl.patch)
===================================================================
--- trunk/buildroot/package/python/python-2.4-010-disable_modules_and_ssl.patch	                        (rev 0)
+++ trunk/buildroot/package/python/python-2.4-010-disable_modules_and_ssl.patch	2008-10-08 05:02:59 UTC (rev 23622)
@@ -0,0 +1,37 @@
+diff -rduNp Python-2.4.2-002/setup.py Python-2.4.2/setup.py
+--- Python-2.4.2-002/setup.py	2007-01-22 19:41:47.000000000 +0100
++++ Python-2.4.2/setup.py	2007-01-22 19:47:25.000000000 +0100
+@@ -15,7 +15,14 @@ from distutils.command.install import in
+ from distutils.command.install_lib import install_lib
+ 
+ # This global variable is used to hold the list of modules to be disabled.
+-disabled_module_list = []
++try:
++	disabled_module_list = os.environ["PYTHON_DISABLE_MODULES"].split()
++except KeyError:
++	disabled_module_list = []
++try:
++	disable_ssl = os.environ["PYTHON_DISABLE_SSL"]
++except KeyError:
++	disable_ssl = 0
+ 
+ def add_dir_to_list(dirlist, dir):
+     """Add the directory 'dir' to the list 'dirlist' (at the front) if
+@@ -247,6 +254,7 @@ class PyBuildExt(build_ext):
+         return sys.platform
+ 
+     def detect_modules(self):
++        global disable_ssl
+         try:
+             modules_include_dirs = os.environ["PYTHON_MODULES_INCLUDE"].split()
+         except KeyError:
+@@ -468,7 +476,8 @@ class PyBuildExt(build_ext):
+                                      ] )
+ 
+         if (ssl_incs is not None and
+-            ssl_libs is not None):
++            ssl_libs is not None and
++			not disable_ssl):
+             exts.append( Extension('_ssl', ['_ssl.c'],
+                                    include_dirs = ssl_incs,
+                                    library_dirs = ssl_libs,


Property changes on: trunk/buildroot/package/python/python-2.4-010-disable_modules_and_ssl.patch
___________________________________________________________________
Name: svn:mergeinfo
   + 

Copied: trunk/buildroot/package/python/python-2.4-020-gentoo_py_dontcompile.patch (from rev 23621, trunk/buildroot/package/python/python-020-gentoo_py_dontcompile.patch)
===================================================================
--- trunk/buildroot/package/python/python-2.4-020-gentoo_py_dontcompile.patch	                        (rev 0)
+++ trunk/buildroot/package/python/python-2.4-020-gentoo_py_dontcompile.patch	2008-10-08 05:02:59 UTC (rev 23622)
@@ -0,0 +1,18 @@
+diff -rduNp Python-2.4.2-010/Python/import.c Python-2.4.2/Python/import.c
+--- Python-2.4.2-010/Python/import.c	2005-09-14 20:15:03.000000000 +0200
++++ Python-2.4.2/Python/import.c	2007-01-22 19:49:18.000000000 +0100
+@@ -822,8 +822,12 @@ static void
+ write_compiled_module(PyCodeObject *co, char *cpathname, long mtime)
+ {
+ 	FILE *fp;
+-
+-	fp = open_exclusive(cpathname);
++   char *py_dontcompile = getenv("PYTHON_DONTCOMPILE");
++   
++   if (!py_dontcompile) 
++     fp = open_exclusive(cpathname);
++   else
++     fp = NULL;
+ 	if (fp == NULL) {
+ 		if (Py_VerboseFlag)
+ 			PySys_WriteStderr(


Property changes on: trunk/buildroot/package/python/python-2.4-020-gentoo_py_dontcompile.patch
___________________________________________________________________
Name: svn:mergeinfo
   + 

Modified: trunk/buildroot/package/python/python.mk
===================================================================
--- trunk/buildroot/package/python/python.mk	2008-10-07 20:29:27 UTC (rev 23621)
+++ trunk/buildroot/package/python/python.mk	2008-10-08 05:02:59 UTC (rev 23622)
@@ -78,7 +78,7 @@
 	touch $@
 
 $(PYTHON_DIR)/.patched: $(PYTHON_DIR)/.unpacked
-	toolchain/patch-kernel.sh $(PYTHON_DIR) package/python/ python\*.patch
+	toolchain/patch-kernel.sh $(PYTHON_DIR) package/python/ python-$(PYTHON_VERSION_SHORT)-\*.patch
 	touch $@
 
 $(PYTHON_DIR)/.hostpython: $(PYTHON_DIR)/.patched
