From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 22 Jan 2007 10:48:50 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/python
Message-ID: <20070122184850.E1EC54858A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-22 10:48:48 -0800 (Mon, 22 Jan 2007)
New Revision: 17472

Log:
- fixup include- and libdirs. Closes #841
- rediff patches against 2.4.2


Added:
   trunk/buildroot/package/python/python-001-cross-compile.patch
   trunk/buildroot/package/python/python-002-cross-compile.patch
   trunk/buildroot/package/python/python-010-disable_modules_and_ssl.patch
   trunk/buildroot/package/python/python-020-gentoo_py_dontcompile.patch

Removed:
   trunk/buildroot/package/python/python-cross-compile.patch
   trunk/buildroot/package/python/python-disable_modules_and_ssl.patch
   trunk/buildroot/package/python/python-gentoo_py_dontcompile.patch

Modified:
   trunk/buildroot/package/python/python.mk


Changeset:
Added: trunk/buildroot/package/python/python-001-cross-compile.patch
===================================================================
--- trunk/buildroot/package/python/python-001-cross-compile.patch	                        (rev 0)
+++ trunk/buildroot/package/python/python-001-cross-compile.patch	2007-01-22 18:48:48 UTC (rev 17472)
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

Added: trunk/buildroot/package/python/python-002-cross-compile.patch
===================================================================
--- trunk/buildroot/package/python/python-002-cross-compile.patch	                        (rev 0)
+++ trunk/buildroot/package/python/python-002-cross-compile.patch	2007-01-22 18:48:48 UTC (rev 17472)
@@ -0,0 +1,44 @@
+diff -rduNp Python-2.4.2-001/setup.py Python-2.4.2/setup.py
+--- Python-2.4.2-001/setup.py	2007-01-22 19:37:08.000000000 +0100
++++ Python-2.4.2/setup.py	2007-01-22 19:41:47.000000000 +0100
+@@ -20,6 +20,14 @@ disabled_module_list = []
+ def add_dir_to_list(dirlist, dir):
+     """Add the directory 'dir' to the list 'dirlist' (at the front) if
+     1) 'dir' is not already in 'dirlist'
++	modules_include_dirs = os.environ["PYTHON_MODULES_INCLUDE"].split()
++except KeyError:
++	modules_include_dirs = ['/usr/include']
++try:
++	modules_lib_dirs = os.environ["PYTHON_MODULES_LIB"].split()
++except KeyError:
++	modules_lib_dirs = ['/usr/lib']
++try:
+     2) 'dir' actually exists, and is a directory."""
+     if dir is not None and os.path.isdir(dir) and dir not in dirlist:
+         dirlist.insert(0, dir)
+@@ -239,7 +247,10 @@ class PyBuildExt(build_ext):
+         return sys.platform
+ 
+     def detect_modules(self):
+-        # Ensure that /usr/local is always used
++        for dir in modules_include_dirs:
++                add_dir_to_list(self.compiler.include_dirs, dir)
++        for dir in modules_lib_dirs:
++                add_dir_to_list(self.compiler.library_dirs, dir)
+ 
+         # Add paths to popular package managers on OS X/darwin
+         if sys.platform == "darwin":
+@@ -258,11 +269,8 @@ class PyBuildExt(build_ext):
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

Added: trunk/buildroot/package/python/python-010-disable_modules_and_ssl.patch
===================================================================
--- trunk/buildroot/package/python/python-010-disable_modules_and_ssl.patch	                        (rev 0)
+++ trunk/buildroot/package/python/python-010-disable_modules_and_ssl.patch	2007-01-22 18:48:48 UTC (rev 17472)
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
+         for dir in modules_include_dirs:
+                 add_dir_to_list(self.compiler.include_dirs, dir)
+         for dir in modules_lib_dirs:
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

Added: trunk/buildroot/package/python/python-020-gentoo_py_dontcompile.patch
===================================================================
--- trunk/buildroot/package/python/python-020-gentoo_py_dontcompile.patch	                        (rev 0)
+++ trunk/buildroot/package/python/python-020-gentoo_py_dontcompile.patch	2007-01-22 18:48:48 UTC (rev 17472)
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

Deleted: trunk/buildroot/package/python/python-cross-compile.patch
===================================================================
--- trunk/buildroot/package/python/python-cross-compile.patch	2007-01-22 18:16:04 UTC (rev 17471)
+++ trunk/buildroot/package/python/python-cross-compile.patch	2007-01-22 18:48:48 UTC (rev 17472)
@@ -1,106 +0,0 @@
-Ripped from OpenEmbedded
-
---- Python-2.4c1/Makefile.pre.in
-+++ Python-2.4c1/Makefile.pre.in
-@@ -162,6 +162,7 @@
- 
- PYTHON=		python$(EXE)
- BUILDPYTHON=	python$(BUILDEXE)
-+HOSTPYTHON=	$(BUILDPYTHON)
- 
- # === Definitions added by makesetup ===
- 
-@@ -188,7 +189,7 @@
- ##########################################################################
- # Parser
- PGEN=		Parser/pgen$(EXE)
--
-+HOSTPGEN=	$(PGEN)$(EXE)
- POBJS=		\
- 		Parser/acceler.o \
- 		Parser/grammar1.o \
-@@ -320,8 +321,8 @@
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
-@@ -442,7 +443,7 @@
- 
- 
- $(GRAMMAR_H) $(GRAMMAR_C): $(PGEN) $(GRAMMAR_INPUT)
--		-$(PGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
-+		-$(HOSTPGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
- 
- $(PGEN):	$(PGENOBJS)
- 		$(CC) $(OPT) $(LDFLAGS) $(PGENOBJS) $(LIBS) -o $(PGEN)
-@@ -718,19 +719,19 @@
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
-@@ -825,7 +826,7 @@
- # Install the dynamically loadable modules
- # This goes into $(exec_prefix)
- sharedinstall:
--	$(RUNSHARED) ./$(BUILDPYTHON) -E $(srcdir)/setup.py install \
-+	$(RUNSHARED) $(HOSTPYTHON) -E $(srcdir)/setup.py install \
- 	   	--prefix=$(prefix) \
- 		--install-scripts=$(BINDIR) \
- 		--install-platlib=$(DESTSHARED) \
---- Python-2.4c1/setup.py
-+++ Python-2.4c1/setup.py
-@@ -206,6 +206,7 @@
-         try:
-             imp.load_dynamic(ext.name, ext_filename)
-         except ImportError, why:
-+            return
-             self.announce('*** WARNING: renaming "%s" since importing it'
-                           ' failed: %s' % (ext.name, why), level=3)
-             assert not self.inplace
-@@ -239,8 +240,6 @@
- 
-     def detect_modules(self):
-         # Ensure that /usr/local is always used
--        add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
--        add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
- 
-         # Add paths to popular package managers on OS X/darwin
-         if sys.platform == "darwin":
-@@ -260,12 +260,6 @@
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

Deleted: trunk/buildroot/package/python/python-disable_modules_and_ssl.patch
===================================================================
--- trunk/buildroot/package/python/python-disable_modules_and_ssl.patch	2007-01-22 18:16:04 UTC (rev 17471)
+++ trunk/buildroot/package/python/python-disable_modules_and_ssl.patch	2007-01-22 18:48:48 UTC (rev 17472)
@@ -1,36 +0,0 @@
---- python.old/setup.py	2003-11-01 19:23:48.495647848 +0000
-+++ python/setup.py	2003-11-01 19:24:16.044459792 +0000
-@@ -15,7 +15,14 @@
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
-@@ -240,6 +247,7 @@
-         return sys.platform
- 
-     def detect_modules(self):
-+        global disable_ssl
-         # Ensure that /usr/local is always used
-         add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
-         add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
-@@ -451,7 +459,8 @@
-                                      ] )
- 
-         if (ssl_incs is not None and
--            ssl_libs is not None):
-+            ssl_libs is not None and
-+			not disable_ssl):
-             exts.append( Extension('_ssl', ['_ssl.c'],
-                                    include_dirs = ssl_incs,
-                                    library_dirs = ssl_libs,

Deleted: trunk/buildroot/package/python/python-gentoo_py_dontcompile.patch
===================================================================
--- trunk/buildroot/package/python/python-gentoo_py_dontcompile.patch	2007-01-22 18:16:04 UTC (rev 17471)
+++ trunk/buildroot/package/python/python-gentoo_py_dontcompile.patch	2007-01-22 18:48:48 UTC (rev 17472)
@@ -1,17 +0,0 @@
---- Python-2.3.2/Python/import.c	2003-10-08 12:29:03.166032656 +0100
-+++ import.c	2003-10-08 12:32:57.423420120 +0100
-@@ -808,8 +808,12 @@
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

Modified: trunk/buildroot/package/python/python.mk
===================================================================
--- trunk/buildroot/package/python/python.mk	2007-01-22 18:16:04 UTC (rev 17471)
+++ trunk/buildroot/package/python/python.mk	2007-01-22 18:48:48 UTC (rev 17472)
@@ -55,6 +55,8 @@
 $(PYTHON_DIR)/$(PYTHON_BINARY): $(PYTHON_DIR)/.configured
 	export PYTHON_DISABLE_SSL=1
 	$(MAKE) CC=$(TARGET_CC) -C $(PYTHON_DIR) DESTDIR=$(TARGET_DIR) \
+		PYTHON_MODULES_INCLUDE=$(STAGING_DIR)/include \
+		PYTHON_MODULES_LIB=$(STAGING_DIR)/lib \
 		PYTHON_DISABLE_MODULES="readline pyexpat dbm gdbm bsddb _curses _curses_panel _tkinter" \
 		HOSTPYTHON=./hostpython HOSTPGEN=./Parser/hostpgen
 
@@ -63,12 +65,15 @@
 	LD_LIBRARY_PATH=$(STAGING_DIR)/lib
 	$(MAKE) CC=$(TARGET_CC) -C $(PYTHON_DIR) install \
 		DESTDIR=$(TARGET_DIR) CROSS_COMPILE=yes \
+		PYTHON_MODULES_INCLUDE=$(STAGING_DIR)/include \
+		PYTHON_MODULES_LIB=$(STAGING_DIR)/lib \
 		PYTHON_DISABLE_MODULES="readline pyexpat dbm gdbm bsddb _curses _curses_panel _tkinter" \
 		HOSTPYTHON=./hostpython HOSTPGEN=./Parser/hostpgen
 	rm $(TARGET_DIR)/usr/bin/python?.?
 	rm $(TARGET_DIR)/usr/bin/idle
 	rm $(TARGET_DIR)/usr/bin/pydoc
-	find $(TARGET_DIR)/usr/lib/ -name '*.pyc' -o -name '*.pyo' -exec rm {} \;
+	-find $(TARGET_DIR)/usr/lib/ -name '*.pyc' -exec rm {} \;
+	-find $(TARGET_DIR)/usr/lib/ -name '*.pyo' -exec rm {} \;
 	rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
 		$(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc \
 		$(TARGET_DIR)/usr/lib/python*/test
