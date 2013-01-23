From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Wed, 23 Jan 2013 10:05:48 +0100
Subject: [Buildroot] [PATCHv2] python3: Port python2 patches to reduce the
	interpreter size
Message-ID: <1358931948-12341-1-git-send-email-maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some of the python2 patches were left behind when doing the python3
package. This was because the python build system can now autodetect
what packages can be built in the system.

However, some of these patches are actually useful to reduce drastically
the size of the interpreter.

This patch ports the relevant patches to the python3 package, and adds a
new patch to remove the idle3 IDE as well from the interpreter.

Fixes #5696

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 package/python3/Config.in                          |   11 ++
 ...thon3-000-generate-sysconfigdata-buildir.patch} |    0
 ...d.patch => python3-001-support-for-build.patch} |    0
 ...atch => python3-002-no-host-headers-libs.patch} |    0
 ...patch => python3-003-staging-header-libs.patch} |    0
 ...thon3-004-no-import-when-cross-compiling.patch} |    0
 ...=> python3-005-do-not-generate-pyo-files.patch} |    0
 ....patch => python3-006-reread-environment.patch} |    0
 ...> python3-007-change-pyconfig-h-location.patch} |    0
 ...8-no-rpath.patch => python3-008-no-rpath.patch} |    0
 ...atch => python3-009-verbose-module-build.patch} |    0
 ...-010-distutils-cross-compilation-support.patch} |    0
 ...=> python3-011-cross-compile-getaddrinfo.patch} |    0
 .../python3/python3-012-disable-extensions.patch   |   98 +++++++++++++++++
 .../python3-100-optional-test-modules.patch        |  102 ++++++++++++++++++
 package/python3/python3-101-optional-pydoc.patch   |   91 ++++++++++++++++
 package/python3/python3-102-optional-2to3.patch    |  111 ++++++++++++++++++++
 package/python3/python3-103-optional-sqlite.patch  |   64 +++++++++++
 package/python3/python3-104-optional-tk.patch      |   69 ++++++++++++
 package/python3/python3-105-optional-curses.patch  |   54 ++++++++++
 package/python3/python3-106-optional-expat.patch   |   85 +++++++++++++++
 .../python3/python3-107-optional-codecs-cjk.patch  |   25 +++++
 package/python3/python3-108-optional-nis.patch     |   28 +++++
 .../python3/python3-109-optional-unicodedata.patch |   25 +++++
 package/python3/python3-110-optional-idle.patch    |   83 +++++++++++++++
 package/python3/python3.mk                         |   25 +++--
 26 files changed, 862 insertions(+), 9 deletions(-)
 rename package/python3/{python3-3.3-000-generate-sysconfigdata-buildir.patch => python3-000-generate-sysconfigdata-buildir.patch} (100%)
 rename package/python3/{python3-3.3-001-support-for-build.patch => python3-001-support-for-build.patch} (100%)
 rename package/python3/{python3-3.3-002-no-host-headers-libs.patch => python3-002-no-host-headers-libs.patch} (100%)
 rename package/python3/{python3-3.3-003-staging-header-libs.patch => python3-003-staging-header-libs.patch} (100%)
 rename package/python3/{python3-3.3-004-no-import-when-cross-compiling.patch => python3-004-no-import-when-cross-compiling.patch} (100%)
 rename package/python3/{python3-3.3-005-do-not-generate-pyo-files.patch => python3-005-do-not-generate-pyo-files.patch} (100%)
 rename package/python3/{python3-3.3-006-reread-environment.patch => python3-006-reread-environment.patch} (100%)
 rename package/python3/{python3-3.3-007-change-pyconfig-h-location.patch => python3-007-change-pyconfig-h-location.patch} (100%)
 rename package/python3/{python3-3.3-008-no-rpath.patch => python3-008-no-rpath.patch} (100%)
 rename package/python3/{python3-3.3-009-verbose-module-build.patch => python3-009-verbose-module-build.patch} (100%)
 rename package/python3/{python3-3.3-010-distutils-cross-compilation-support.patch => python3-010-distutils-cross-compilation-support.patch} (100%)
 rename package/python3/{python3-3.3-011-cross-compile-getaddrinfo.patch => python3-011-cross-compile-getaddrinfo.patch} (100%)
 create mode 100644 package/python3/python3-012-disable-extensions.patch
 create mode 100644 package/python3/python3-100-optional-test-modules.patch
 create mode 100644 package/python3/python3-101-optional-pydoc.patch
 create mode 100644 package/python3/python3-102-optional-2to3.patch
 create mode 100644 package/python3/python3-103-optional-sqlite.patch
 create mode 100644 package/python3/python3-104-optional-tk.patch
 create mode 100644 package/python3/python3-105-optional-curses.patch
 create mode 100644 package/python3/python3-106-optional-expat.patch
 create mode 100644 package/python3/python3-107-optional-codecs-cjk.patch
 create mode 100644 package/python3/python3-108-optional-nis.patch
 create mode 100644 package/python3/python3-109-optional-unicodedata.patch
 create mode 100644 package/python3/python3-110-optional-idle.patch

diff --git a/package/python3/Config.in b/package/python3/Config.in
index 5959d31..4a70b5e 100644
--- a/package/python3/Config.in
+++ b/package/python3/Config.in
@@ -41,6 +41,11 @@ config BR2_PACKAGE_PYTHON3_BZIP2
 	help
 	  bzip2 module for Python3
 
+config BR2_PACKAGE_PYTHON3_CODECSCJK
+	bool "codecscjk module"
+	help
+	  Chinese/Japanese/Korean codecs module for Python (large).
+
 config BR2_PACKAGE_PYTHON3_CURSES
 	select BR2_PACKAGE_NCURSES
 	bool "curses module"
@@ -66,6 +71,12 @@ config BR2_PACKAGE_PYTHON3_SSL
 	help
 	  _ssl module for Python3 (required for https in urllib etc).
 
+config BR2_PACKAGE_PYTHON3_UNICODEDATA
+	bool "unicodedata module"
+	default y
+	help
+	  Unicode character database (used by stringprep module) (large).
+
 config BR2_PACKAGE_PYTHON3_SQLITE
 	bool "sqlite module"
 	select BR2_PACKAGE_SQLITE
diff --git a/package/python3/python3-3.3-000-generate-sysconfigdata-buildir.patch b/package/python3/python3-000-generate-sysconfigdata-buildir.patch
similarity index 100%
rename from package/python3/python3-3.3-000-generate-sysconfigdata-buildir.patch
rename to package/python3/python3-000-generate-sysconfigdata-buildir.patch
diff --git a/package/python3/python3-3.3-001-support-for-build.patch b/package/python3/python3-001-support-for-build.patch
similarity index 100%
rename from package/python3/python3-3.3-001-support-for-build.patch
rename to package/python3/python3-001-support-for-build.patch
diff --git a/package/python3/python3-3.3-002-no-host-headers-libs.patch b/package/python3/python3-002-no-host-headers-libs.patch
similarity index 100%
rename from package/python3/python3-3.3-002-no-host-headers-libs.patch
rename to package/python3/python3-002-no-host-headers-libs.patch
diff --git a/package/python3/python3-3.3-003-staging-header-libs.patch b/package/python3/python3-003-staging-header-libs.patch
similarity index 100%
rename from package/python3/python3-3.3-003-staging-header-libs.patch
rename to package/python3/python3-003-staging-header-libs.patch
diff --git a/package/python3/python3-3.3-004-no-import-when-cross-compiling.patch b/package/python3/python3-004-no-import-when-cross-compiling.patch
similarity index 100%
rename from package/python3/python3-3.3-004-no-import-when-cross-compiling.patch
rename to package/python3/python3-004-no-import-when-cross-compiling.patch
diff --git a/package/python3/python3-3.3-005-do-not-generate-pyo-files.patch b/package/python3/python3-005-do-not-generate-pyo-files.patch
similarity index 100%
rename from package/python3/python3-3.3-005-do-not-generate-pyo-files.patch
rename to package/python3/python3-005-do-not-generate-pyo-files.patch
diff --git a/package/python3/python3-3.3-006-reread-environment.patch b/package/python3/python3-006-reread-environment.patch
similarity index 100%
rename from package/python3/python3-3.3-006-reread-environment.patch
rename to package/python3/python3-006-reread-environment.patch
diff --git a/package/python3/python3-3.3-007-change-pyconfig-h-location.patch b/package/python3/python3-007-change-pyconfig-h-location.patch
similarity index 100%
rename from package/python3/python3-3.3-007-change-pyconfig-h-location.patch
rename to package/python3/python3-007-change-pyconfig-h-location.patch
diff --git a/package/python3/python3-3.3-008-no-rpath.patch b/package/python3/python3-008-no-rpath.patch
similarity index 100%
rename from package/python3/python3-3.3-008-no-rpath.patch
rename to package/python3/python3-008-no-rpath.patch
diff --git a/package/python3/python3-3.3-009-verbose-module-build.patch b/package/python3/python3-009-verbose-module-build.patch
similarity index 100%
rename from package/python3/python3-3.3-009-verbose-module-build.patch
rename to package/python3/python3-009-verbose-module-build.patch
diff --git a/package/python3/python3-3.3-010-distutils-cross-compilation-support.patch b/package/python3/python3-010-distutils-cross-compilation-support.patch
similarity index 100%
rename from package/python3/python3-3.3-010-distutils-cross-compilation-support.patch
rename to package/python3/python3-010-distutils-cross-compilation-support.patch
diff --git a/package/python3/python3-3.3-011-cross-compile-getaddrinfo.patch b/package/python3/python3-011-cross-compile-getaddrinfo.patch
similarity index 100%
rename from package/python3/python3-3.3-011-cross-compile-getaddrinfo.patch
rename to package/python3/python3-011-cross-compile-getaddrinfo.patch
diff --git a/package/python3/python3-012-disable-extensions.patch b/package/python3/python3-012-disable-extensions.patch
new file mode 100644
index 0000000..ed1d1e2
--- /dev/null
+++ b/package/python3/python3-012-disable-extensions.patch
@@ -0,0 +1,98 @@
+Add infrastructure to disable the build of certain extensions
+
+Some of the extensions part of the Python core have dependencies on
+external libraries (sqlite, tk, etc.) or are relatively big and not
+necessarly always useful (CJK codecs for example). By extensions, we
+mean part of Python modules that are written in C and therefore
+compiled to binary code.
+
+Therefore, we introduce a small infrastructure that allows to disable
+some of those extensions. This can be done inside the configure.ac by
+adding values to the DISABLED_EXTENSIONS variable (which is a
+word-separated list of extensions).
+
+The implementation works as follow :
+
+ * configure.ac defines a DISABLED_EXTENSIONS variable, which is
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
+ Makefile.pre.in |    4 ++++
+ configure.ac    |    2 ++
+ setup.py        |    5 ++++-
+ 3 files changed, 10 insertions(+), 1 deletion(-)
+
+Index: cpython/Makefile.pre.in
+===================================================================
+--- cpython.orig/Makefile.pre.in
++++ cpython/Makefile.pre.in
+@@ -155,6 +155,8 @@
+ # configure script arguments
+ CONFIG_ARGS=	@CONFIG_ARGS@
+ 
++# disabled extensions
++DISABLED_EXTENSIONS=	@DISABLED_EXTENSIONS@
+ 
+ # Subdirectories with code
+ SRCDIRS= 	@SRCDIRS@
+@@ -478,6 +480,7 @@
+ sharedmods: $(BUILDPYTHON) pybuilddir.txt
+ 	$(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' \
+ 		CONFIG_ARGS="$(CONFIG_ARGS)" \
++		DISABLED_EXTENSIONS="$(DISABLED_EXTENSIONS)" \
+ 		$(PYTHON_FOR_BUILD) $(srcdir)/setup.py build
+ 
+ # Build static library
+@@ -1185,6 +1188,7 @@
+ # This goes into $(exec_prefix)
+ sharedinstall: sharedmods
+ 	$(RUNSHARED) CONFIG_ARGS="$(CONFIG_ARGS)" \
++		DISABLED_EXTENSIONS="$(DISABLED_EXTENSIONS)" \
+ 		$(PYTHON_FOR_BUILD) $(srcdir)/setup.py install \
+ 	   	--prefix=$(prefix) \
+ 		--install-scripts=$(BINDIR) \
+Index: cpython/configure.ac
+===================================================================
+--- cpython.orig/configure.ac
++++ cpython/configure.ac
+@@ -2175,6 +2175,8 @@
+ 
+ AC_PATH_TOOL([PKG_CONFIG], [pkg-config])
+ 
++AC_SUBST(DISABLED_EXTENSIONS)
++
+ # Check for use of the system expat library
+ AC_MSG_CHECKING(for --with-system-expat)
+ AC_ARG_WITH(system_expat,
+Index: cpython/setup.py
+===================================================================
+--- cpython.orig/setup.py
++++ cpython/setup.py
+@@ -34,7 +34,10 @@
+ sysconfig._CONFIG_VARS.update(os.environ)
+ 
+ # This global variable is used to hold the list of modules to be disabled.
+-disabled_module_list = []
++try:
++    disabled_module_list = sysconfig.get_config_var("DISABLED_EXTENSIONS").split(" ")
++except KeyError:
++    disabled_module_list = list()
+ 
+ def add_dir_to_list(dirlist, dir):
+     """Add the directory 'dir' to the list 'dirlist' (after any relative
diff --git a/package/python3/python3-100-optional-test-modules.patch b/package/python3/python3-100-optional-test-modules.patch
new file mode 100644
index 0000000..13e73a7
--- /dev/null
+++ b/package/python3/python3-100-optional-test-modules.patch
@@ -0,0 +1,102 @@
+Add an option to disable installation of test modules
+
+The Python standard distribution comes with many test modules, that
+are not necessarly useful on embedded targets.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+
+---
+ Makefile.pre.in |   50 ++++++++++++++++++++++++++++++++------------------
+ configure.ac    |    6 ++++++
+ 2 files changed, 38 insertions(+), 18 deletions(-)
+
+Index: cpython/Makefile.pre.in
+===================================================================
+--- cpython.orig/Makefile.pre.in
++++ cpython/Makefile.pre.in
+@@ -976,8 +976,26 @@
+ EXTRAPLATDIR= @EXTRAPLATDIR@
+ MACHDEPS=	$(PLATDIR) $(EXTRAPLATDIR)
+ XMLLIBSUBDIRS=  xml xml/dom xml/etree xml/parsers xml/sax
+-LIBSUBDIRS=	tkinter tkinter/test tkinter/test/test_tkinter \
+-		tkinter/test/test_ttk site-packages test \
++LIBSUBDIRS=	tkinter \
++		site-packages \
++		collections concurrent concurrent/futures encodings \
++		email email/mime \
++		html json http dbm xmlrpc \
++		sqlite3 \
++		logging csv wsgiref urllib \
++		lib2to3 lib2to3/fixes lib2to3/pgen2 \
++		ctypes ctypes/macholib idlelib idlelib/Icons \
++		distutils distutils/command $(XMLLIBSUBDIRS) \
++		importlib \
++		turtledemo \
++		multiprocessing multiprocessing/dummy \
++		unittest \
++		venv venv/scripts venv/scripts/posix \
++		curses pydoc_data $(MACHDEPS)
++
++ifeq (@TEST_MODULES@,yes)
++LIBSUBDIRS += tkinter/test tkinter/test/test_tkinter \
++		tkinter/test/test_ttk test \
+ 		test/capath test/data \
+ 		test/cjkencodings test/decimaltestdata test/xmltestdata \
+ 		test/subprocessdata test/sndhdrdata \
+@@ -1000,26 +1018,22 @@
+ 		test/namespace_pkgs/project3 \
+ 		test/namespace_pkgs/project3/parent \
+ 		test/namespace_pkgs/project3/parent/child \
+-                test/namespace_pkgs/module_and_namespace_package \
+-                test/namespace_pkgs/module_and_namespace_package/a_test \
+-		collections concurrent concurrent/futures encodings \
+-		email email/mime test/test_email test/test_email/data \
+-		html json test/json_tests http dbm xmlrpc \
+-		sqlite3 sqlite3/test \
+-		logging csv wsgiref urllib \
+-		lib2to3 lib2to3/fixes lib2to3/pgen2 lib2to3/tests \
++		test/namespace_pkgs/module_and_namespace_package \
++		test/namespace_pkgs/module_and_namespace_package/a_test \
++		test/test_email test/test_email/data \
++		test/json_tests \
++		sqlite3/test \
++		lib2to3/tests \
+ 		lib2to3/tests/data lib2to3/tests/data/fixers \
+ 		lib2to3/tests/data/fixers/myfixes \
+-		ctypes ctypes/test ctypes/macholib idlelib idlelib/Icons \
+-		distutils distutils/command distutils/tests $(XMLLIBSUBDIRS) \
+-		importlib test/test_importlib test/test_importlib/builtin \
++		ctypes/test \
++		distutils/tests \
++		test/test_importlib test/test_importlib/builtin \
+ 		test/test_importlib/extension test/test_importlib/frozen \
+ 		test/test_importlib/import_ test/test_importlib/source \
+-		turtledemo \
+-		multiprocessing multiprocessing/dummy \
+-		unittest unittest/test unittest/test/testmock \
+-		venv venv/scripts venv/scripts/posix \
+-		curses pydoc_data $(MACHDEPS)
++		unittest unittest/test unittest/test/testmock
++endif
++
+ libinstall:	build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
+ 	@for i in $(SCRIPTDIR) $(LIBDEST); \
+ 	do \
+Index: cpython/configure.ac
+===================================================================
+--- cpython.orig/configure.ac
++++ cpython/configure.ac
+@@ -2449,6 +2449,12 @@
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
diff --git a/package/python3/python3-101-optional-pydoc.patch b/package/python3/python3-101-optional-pydoc.patch
new file mode 100644
index 0000000..ac50ac3
--- /dev/null
+++ b/package/python3/python3-101-optional-pydoc.patch
@@ -0,0 +1,91 @@
+Add an option to disable pydoc
+
+It removes 0.5 MB of data from the target plus the pydoc script
+itself.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+
+---
+ Makefile.pre.in |    8 +++++++-
+ configure.ac    |    5 +++++
+ setup.py        |    9 +++++++--
+ 3 files changed, 19 insertions(+), 3 deletions(-)
+
+Index: cpython/Makefile.pre.in
+===================================================================
+--- cpython.orig/Makefile.pre.in
++++ cpython/Makefile.pre.in
+@@ -952,7 +952,9 @@
+ 	-rm -f $(DESTDIR)$(BINDIR)/idle3
+ 	(cd $(DESTDIR)$(BINDIR); $(LN) -s idle$(VERSION) idle3)
+ 	-rm -f $(DESTDIR)$(BINDIR)/pydoc3
++ifeq (@PYDOC@,yes)
+ 	(cd $(DESTDIR)$(BINDIR); $(LN) -s pydoc$(VERSION) pydoc3)
++endif
+ 	-rm -f $(DESTDIR)$(BINDIR)/2to3
+ 	(cd $(DESTDIR)$(BINDIR); $(LN) -s 2to3-$(VERSION) 2to3)
+ 	-rm -f $(DESTDIR)$(BINDIR)/pyvenv
+@@ -991,7 +993,7 @@
+ 		multiprocessing multiprocessing/dummy \
+ 		unittest \
+ 		venv venv/scripts venv/scripts/posix \
+-		curses pydoc_data $(MACHDEPS)
++		curses $(MACHDEPS)
+ 
+ ifeq (@TEST_MODULES@,yes)
+ LIBSUBDIRS += tkinter/test tkinter/test/test_tkinter \
+@@ -1034,6 +1036,10 @@
+ 		unittest unittest/test unittest/test/testmock
+ endif
+ 
++ifeq (@PYDOC@,yes)
++LIBSUBDIRS += pydoc_data
++endif
++
+ libinstall:	build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
+ 	@for i in $(SCRIPTDIR) $(LIBDEST); \
+ 	do \
+Index: cpython/configure.ac
+===================================================================
+--- cpython.orig/configure.ac
++++ cpython/configure.ac
+@@ -2448,6 +2448,11 @@
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
+Index: cpython/setup.py
+===================================================================
+--- cpython.orig/setup.py
++++ cpython/setup.py
+@@ -2123,6 +2123,12 @@
+     # turn off warnings when deprecated modules are imported
+     import warnings
+     warnings.filterwarnings("ignore",category=DeprecationWarning)
++
++    scripts = ['Tools/scripts/idle3', 'Tools/scripts/2to3',
++               'Lib/smtpd.py']
++    if not '--disable-pydoc' in sysconfig.get_config_var("CONFIG_ARGS"):
++        scripts += [ 'Tools/scripts/pydoc3' ]
++
+     setup(# PyPI Metadata (PEP 301)
+           name = "Python",
+           version = sys.version.split()[0],
+@@ -2147,8 +2153,7 @@
+           # If you change the scripts installed here, you also need to
+           # check the PyBuildScripts command above, and change the links
+           # created by the bininstall target in Makefile.pre.in
+-          scripts = ["Tools/scripts/pydoc3", "Tools/scripts/idle3",
+-                     "Tools/scripts/2to3", "Tools/scripts/pyvenv"]
++          scripts = scripts,
+         )
+ 
+ # --install-platlib
diff --git a/package/python3/python3-102-optional-2to3.patch b/package/python3/python3-102-optional-2to3.patch
new file mode 100644
index 0000000..f5e821a
--- /dev/null
+++ b/package/python3/python3-102-optional-2to3.patch
@@ -0,0 +1,111 @@
+Add an option to disable lib2to3
+
+lib2to3 is a library to convert Python 2.x code to Python 3.x. As
+such, it is probably not very useful on embedded system targets.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+
+---
+ Makefile.pre.in |   18 ++++++++++++++----
+ configure.ac    |    6 ++++++
+ setup.py        |    5 +++--
+ 3 files changed, 23 insertions(+), 6 deletions(-)
+
+Index: cpython/Makefile.pre.in
+===================================================================
+--- cpython.orig/Makefile.pre.in
++++ cpython/Makefile.pre.in
+@@ -956,7 +956,9 @@
+ 	(cd $(DESTDIR)$(BINDIR); $(LN) -s pydoc$(VERSION) pydoc3)
+ endif
+ 	-rm -f $(DESTDIR)$(BINDIR)/2to3
++ifeq (@LIB2TO3@,yes)
+ 	(cd $(DESTDIR)$(BINDIR); $(LN) -s 2to3-$(VERSION) 2to3)
++endif
+ 	-rm -f $(DESTDIR)$(BINDIR)/pyvenv
+ 	(cd $(DESTDIR)$(BINDIR); $(LN) -s pyvenv-$(VERSION) pyvenv)
+ 
+@@ -985,7 +987,6 @@
+ 		html json http dbm xmlrpc \
+ 		sqlite3 \
+ 		logging csv wsgiref urllib \
+-		lib2to3 lib2to3/fixes lib2to3/pgen2 \
+ 		ctypes ctypes/macholib idlelib idlelib/Icons \
+ 		distutils distutils/command $(XMLLIBSUBDIRS) \
+ 		importlib \
+@@ -1025,9 +1026,6 @@
+ 		test/test_email test/test_email/data \
+ 		test/json_tests \
+ 		sqlite3/test \
+-		lib2to3/tests \
+-		lib2to3/tests/data lib2to3/tests/data/fixers \
+-		lib2to3/tests/data/fixers/myfixes \
+ 		ctypes/test \
+ 		distutils/tests \
+ 		test/test_importlib test/test_importlib/builtin \
+@@ -1040,6 +1038,16 @@
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
+ libinstall:	build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
+ 	@for i in $(SCRIPTDIR) $(LIBDEST); \
+ 	do \
+@@ -1109,10 +1117,12 @@
+ 		$(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py \
+ 		-d $(LIBDEST)/site-packages -f \
+ 		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
++ifeq (@LIB2TO3@,yes)
+ 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
+ 		$(PYTHON_FOR_BUILD) -m lib2to3.pgen2.driver $(DESTDIR)$(LIBDEST)/lib2to3/Grammar.txt
+ 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
+ 		$(PYTHON_FOR_BUILD) -m lib2to3.pgen2.driver $(DESTDIR)$(LIBDEST)/lib2to3/PatternGrammar.txt
++endif
+ 
+ # Create the PLATDIR source directory, if one wasn't distributed..
+ $(srcdir)/Lib/$(PLATDIR):
+Index: cpython/setup.py
+===================================================================
+--- cpython.orig/setup.py
++++ cpython/setup.py
+@@ -2124,10 +2124,11 @@
+     import warnings
+     warnings.filterwarnings("ignore",category=DeprecationWarning)
+ 
+-    scripts = ['Tools/scripts/idle3', 'Tools/scripts/2to3',
+-               'Lib/smtpd.py']
++    scripts = ['Tools/scripts/idle3', 'Lib/smtpd.py']
+     if not '--disable-pydoc' in sysconfig.get_config_var("CONFIG_ARGS"):
+         scripts += [ 'Tools/scripts/pydoc3' ]
++    if not '--disable-lib2to3' in sysconfig.get_config_var("CONFIG_ARGS"):
++        scripts += [ 'Tools/scripts/2to3' ]
+ 
+     setup(# PyPI Metadata (PEP 301)
+           name = "Python",
+Index: cpython/configure.ac
+===================================================================
+--- cpython.orig/configure.ac
++++ cpython/configure.ac
+@@ -2460,6 +2460,12 @@
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
diff --git a/package/python3/python3-103-optional-sqlite.patch b/package/python3/python3-103-optional-sqlite.patch
new file mode 100644
index 0000000..e3a63c3
--- /dev/null
+++ b/package/python3/python3-103-optional-sqlite.patch
@@ -0,0 +1,64 @@
+Add option to disable the sqlite3 module
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+
+---
+ Makefile.pre.in |    9 +++++++--
+ configure.ac    |    9 +++++++++
+ 2 files changed, 16 insertions(+), 2 deletions(-)
+
+Index: cpython/configure.ac
+===================================================================
+--- cpython.orig/configure.ac
++++ cpython/configure.ac
+@@ -2448,6 +2448,15 @@
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
+Index: cpython/Makefile.pre.in
+===================================================================
+--- cpython.orig/Makefile.pre.in
++++ cpython/Makefile.pre.in
+@@ -985,7 +985,6 @@
+ 		collections concurrent concurrent/futures encodings \
+ 		email email/mime \
+ 		html json http dbm xmlrpc \
+-		sqlite3 \
+ 		logging csv wsgiref urllib \
+ 		ctypes ctypes/macholib idlelib idlelib/Icons \
+ 		distutils distutils/command $(XMLLIBSUBDIRS) \
+@@ -1025,7 +1024,6 @@
+ 		test/namespace_pkgs/module_and_namespace_package/a_test \
+ 		test/test_email test/test_email/data \
+ 		test/json_tests \
+-		sqlite3/test \
+ 		ctypes/test \
+ 		distutils/tests \
+ 		test/test_importlib test/test_importlib/builtin \
+@@ -1048,6 +1046,13 @@
+ endif
+ endif
+ 
++ifeq (@SQLITE3@,yes)
++LIBSUBDIRS += sqlite3
++ifeq (@TEST_MODULES@,yes)
++LIBSUBDIRS += sqlite3/test
++endif
++endif
++
+ libinstall:	build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
+ 	@for i in $(SCRIPTDIR) $(LIBDEST); \
+ 	do \
diff --git a/package/python3/python3-104-optional-tk.patch b/package/python3/python3-104-optional-tk.patch
new file mode 100644
index 0000000..2f89fe0
--- /dev/null
+++ b/package/python3/python3-104-optional-tk.patch
@@ -0,0 +1,69 @@
+Add an option to disable the tk module
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+
+---
+ Makefile.pre.in |   14 +++++++++++---
+ configure.ac    |    9 +++++++++
+ 2 files changed, 20 insertions(+), 3 deletions(-)
+
+Index: cpython/Makefile.pre.in
+===================================================================
+--- cpython.orig/Makefile.pre.in
++++ cpython/Makefile.pre.in
+@@ -980,7 +980,7 @@
+ EXTRAPLATDIR= @EXTRAPLATDIR@
+ MACHDEPS=	$(PLATDIR) $(EXTRAPLATDIR)
+ XMLLIBSUBDIRS=  xml xml/dom xml/etree xml/parsers xml/sax
+-LIBSUBDIRS=	tkinter \
++LIBSUBDIRS=	\
+ 		site-packages \
+ 		collections concurrent concurrent/futures encodings \
+ 		email email/mime \
+@@ -996,8 +996,7 @@
+ 		curses $(MACHDEPS)
+ 
+ ifeq (@TEST_MODULES@,yes)
+-LIBSUBDIRS += tkinter/test tkinter/test/test_tkinter \
+-		tkinter/test/test_ttk test \
++LIBSUBDIRS += 	test \
+ 		test/capath test/data \
+ 		test/cjkencodings test/decimaltestdata test/xmltestdata \
+ 		test/subprocessdata test/sndhdrdata \
+@@ -1053,6 +1052,15 @@
+ endif
+ endif
+ 
++ifeq (@TK@,yes)
++LIBSUBDIRS += tkinter
++ifeq (@TEST_MODULES@,yes)
++LIBSUBDIRS += 	\
++		tkinter/test tkinter/test/test_tkinter \
++		tkinter/test/test_ttk
++endif
++endif
++
+ libinstall:	build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
+ 	@for i in $(SCRIPTDIR) $(LIBDEST); \
+ 	do \
+Index: cpython/configure.ac
+===================================================================
+--- cpython.orig/configure.ac
++++ cpython/configure.ac
+@@ -2457,6 +2457,15 @@
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
diff --git a/package/python3/python3-105-optional-curses.patch b/package/python3/python3-105-optional-curses.patch
new file mode 100644
index 0000000..adb3183
--- /dev/null
+++ b/package/python3/python3-105-optional-curses.patch
@@ -0,0 +1,54 @@
+Add an option to disable the curses module
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+
+---
+ Makefile.pre.in |    6 +++++-
+ configure.ac    |    9 +++++++++
+ 2 files changed, 14 insertions(+), 1 deletion(-)
+
+Index: cpython/Makefile.pre.in
+===================================================================
+--- cpython.orig/Makefile.pre.in
++++ cpython/Makefile.pre.in
+@@ -993,7 +993,7 @@
+ 		multiprocessing multiprocessing/dummy \
+ 		unittest \
+ 		venv venv/scripts venv/scripts/posix \
+-		curses $(MACHDEPS)
++		$(MACHDEPS)
+ 
+ ifeq (@TEST_MODULES@,yes)
+ LIBSUBDIRS += 	test \
+@@ -1061,6 +1061,10 @@
+ endif
+ endif
+ 
++ifeq (@CURSES@,yes)
++LIBSUBDIRS += curses
++endif
++
+ libinstall:	build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
+ 	@for i in $(SCRIPTDIR) $(LIBDEST); \
+ 	do \
+Index: cpython/configure.ac
+===================================================================
+--- cpython.orig/configure.ac
++++ cpython/configure.ac
+@@ -2466,6 +2466,15 @@
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
diff --git a/package/python3/python3-106-optional-expat.patch b/package/python3/python3-106-optional-expat.patch
new file mode 100644
index 0000000..d171b79
--- /dev/null
+++ b/package/python3/python3-106-optional-expat.patch
@@ -0,0 +1,85 @@
+Add an option to disable expat
+
+This patch replaces the existing --with-system-expat option with a
+--with-expat={system,builtin,none} option, which allows to tell Python
+whether we want to use the system expat (already installed), the expat
+builtin the Python sources, or no expat at all (which disables the
+installation of XML modules).
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+
+---
+ Makefile.pre.in |    6 +++++-
+ configure.ac    |   18 +++++++++++++-----
+ setup.py        |    2 +-
+ 3 files changed, 19 insertions(+), 7 deletions(-)
+
+Index: cpython/Makefile.pre.in
+===================================================================
+--- cpython.orig/Makefile.pre.in
++++ cpython/Makefile.pre.in
+@@ -987,7 +987,7 @@
+ 		html json http dbm xmlrpc \
+ 		logging csv wsgiref urllib \
+ 		ctypes ctypes/macholib idlelib idlelib/Icons \
+-		distutils distutils/command $(XMLLIBSUBDIRS) \
++		distutils distutils/command \
+ 		importlib \
+ 		turtledemo \
+ 		multiprocessing multiprocessing/dummy \
+@@ -1065,6 +1065,10 @@
+ LIBSUBDIRS += curses
+ endif
+ 
++ifeq (@EXPAT@,yes)
++LIBSUBDIRS += $(XMLLIBSUBDIRS)
++endif
++
+ libinstall:	build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
+ 	@for i in $(SCRIPTDIR) $(LIBDEST); \
+ 	do \
+Index: cpython/configure.ac
+===================================================================
+--- cpython.orig/configure.ac
++++ cpython/configure.ac
+@@ -2178,13 +2178,21 @@
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
+Index: cpython/setup.py
+===================================================================
+--- cpython.orig/setup.py
++++ cpython/setup.py
+@@ -1404,7 +1404,7 @@
+         #
+         # More information on Expat can be found at www.libexpat.org.
+         #
+-        if '--with-system-expat' in sysconfig.get_config_var("CONFIG_ARGS"):
++        if '--with-expat=system' in sysconfig.get_config_var("CONFIG_ARGS"):
+             expat_inc = []
+             define_macros = []
+             expat_lib = ['expat']
diff --git a/package/python3/python3-107-optional-codecs-cjk.patch b/package/python3/python3-107-optional-codecs-cjk.patch
new file mode 100644
index 0000000..de7f910
--- /dev/null
+++ b/package/python3/python3-107-optional-codecs-cjk.patch
@@ -0,0 +1,25 @@
+Add an option to disable CJK codecs
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+---
+ configure.ac |    6 ++++++
+ 1 file changed, 6 insertions(+)
+
+Index: cpython/configure.ac
+===================================================================
+--- cpython.orig/configure.ac
++++ cpython/configure.ac
+@@ -2465,6 +2465,12 @@
+    DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
+ fi
+ 
++AC_ARG_ENABLE(codecs-cjk,
++	AS_HELP_STRING([--disable-codecs-cjk], [disable CJK codecs]),
++	[ if test "$enableval" = "no"; then
++		DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _codecs_kr _codecs_jp _codecs_cn _codecs_tw _codecs_hk _codecs_iso2022"
++	fi])
++
+ AC_SUBST(TK)
+ AC_ARG_ENABLE(tk,
+ 	AS_HELP_STRING([--disable-tk], [disable tk]),
diff --git a/package/python3/python3-108-optional-nis.patch b/package/python3/python3-108-optional-nis.patch
new file mode 100644
index 0000000..3c91497
--- /dev/null
+++ b/package/python3/python3-108-optional-nis.patch
@@ -0,0 +1,28 @@
+Add an option to disable NIS
+
+NIS is not necessarily available in uClibc, so we need an option to
+not compile support for it.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+---
+ configure.ac |    6 ++++++
+ 1 file changed, 6 insertions(+)
+
+Index: cpython/configure.ac
+===================================================================
+--- cpython.orig/configure.ac
++++ cpython/configure.ac
+@@ -2471,6 +2471,12 @@
+ 		DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _codecs_kr _codecs_jp _codecs_cn _codecs_tw _codecs_hk _codecs_iso2022"
+ 	fi])
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
diff --git a/package/python3/python3-109-optional-unicodedata.patch b/package/python3/python3-109-optional-unicodedata.patch
new file mode 100644
index 0000000..c75ee27
--- /dev/null
+++ b/package/python3/python3-109-optional-unicodedata.patch
@@ -0,0 +1,25 @@
+Add an option to disable unicodedata
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+---
+ configure.ac |    6 ++++++
+ 1 file changed, 6 insertions(+)
+
+Index: cpython/configure.ac
+===================================================================
+--- cpython.orig/configure.ac
++++ cpython/configure.ac
+@@ -2477,6 +2477,12 @@
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
diff --git a/package/python3/python3-110-optional-idle.patch b/package/python3/python3-110-optional-idle.patch
new file mode 100644
index 0000000..1a7fa65
--- /dev/null
+++ b/package/python3/python3-110-optional-idle.patch
@@ -0,0 +1,83 @@
+Add an option to disable IDLE
+
+IDLE is an IDE embedded into python, written using Tk, so it doesn't make
+much sense to have it into our build.
+
+Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
+
+---
+ Makefile.pre.in |    8 +++++++-
+ configure.ac    |    6 ++++++
+ setup.py        |    4 +++-
+ 3 files changed, 16 insertions(+), 2 deletions(-)
+
+Index: cpython/Makefile.pre.in
+===================================================================
+--- cpython.orig/Makefile.pre.in
++++ cpython/Makefile.pre.in
+@@ -950,7 +950,9 @@
+ 	-rm -f $(DESTDIR)$(LIBPC)/python3.pc
+ 	(cd $(DESTDIR)$(LIBPC); $(LN) -s python-$(VERSION).pc python3.pc)
+ 	-rm -f $(DESTDIR)$(BINDIR)/idle3
++ifeq (@IDLE@,yes)
+ 	(cd $(DESTDIR)$(BINDIR); $(LN) -s idle$(VERSION) idle3)
++endif
+ 	-rm -f $(DESTDIR)$(BINDIR)/pydoc3
+ ifeq (@PYDOC@,yes)
+ 	(cd $(DESTDIR)$(BINDIR); $(LN) -s pydoc$(VERSION) pydoc3)
+@@ -986,7 +988,7 @@
+ 		email email/mime \
+ 		html json http dbm xmlrpc \
+ 		logging csv wsgiref urllib \
+-		ctypes ctypes/macholib idlelib idlelib/Icons \
++		ctypes ctypes/macholib \
+ 		distutils distutils/command \
+ 		importlib \
+ 		turtledemo \
+@@ -1069,6 +1071,10 @@
+ LIBSUBDIRS += $(XMLLIBSUBDIRS)
+ endif
+ 
++ifeq (@IDLE@,yes)
++LIBSUBDIRS += idlelib idlelib/Icons
++endif
++
+ libinstall:	build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
+ 	@for i in $(SCRIPTDIR) $(LIBDEST); \
+ 	do \
+Index: cpython/configure.ac
+===================================================================
+--- cpython.orig/configure.ac
++++ cpython/configure.ac
+@@ -2519,6 +2519,12 @@
+ 	AS_HELP_STRING([--disable-lib2to3], [disable lib2to3]),
+ 	[ LIB2TO3="${enableval}" ], [ LIB2TO3=yes ])
+ 
++AC_SUBST(IDLE)
++
++AC_ARG_ENABLE(idle3,
++	AS_HELP_STRING([--disable-idle3], [disable idle3 IDE]),
++	[ IDLE="${enableval}" ], [ IDLE=yes ])
++
+ # Check for enable-ipv6
+ AH_TEMPLATE(ENABLE_IPV6, [Define if --enable-ipv6 is specified])
+ AC_MSG_CHECKING([if --enable-ipv6 is specified])
+Index: cpython/setup.py
+===================================================================
+--- cpython.orig/setup.py
++++ cpython/setup.py
+@@ -2124,11 +2124,13 @@
+     import warnings
+     warnings.filterwarnings("ignore",category=DeprecationWarning)
+ 
+-    scripts = ['Tools/scripts/idle3', 'Lib/smtpd.py']
++    scripts = ['Lib/smtpd.py']
+     if not '--disable-pydoc' in sysconfig.get_config_var("CONFIG_ARGS"):
+         scripts += [ 'Tools/scripts/pydoc3' ]
+     if not '--disable-lib2to3' in sysconfig.get_config_var("CONFIG_ARGS"):
+         scripts += [ 'Tools/scripts/2to3' ]
++    if not '--disable-idle3' in sysconfig.get_config_var("CONFIG_ARGS"):
++        scripts += [ 'Tools/scripts/idle3' ]
+ 
+     setup(# PyPI Metadata (PEP 301)
+           name = "Python",
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index e7c0983..f62ed43 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -23,12 +23,8 @@ HOST_PYTHON3_CONF_OPT += 	\
 	--disable-codecs-cjk	\
 	--disable-nis		\
 	--disable-unicodedata	\
-	--disable-dbm		\
-	--disable-gdbm		\
-	--disable-bsddb		\
 	--disable-test-modules	\
-	--disable-bz2		\
-	--disable-ssl
+	--disable-idle3
 
 HOST_PYTHON3_MAKE_ENV = \
 	PYTHON_MODULES_INCLUDE=$(HOST_DIR)/usr/include \
@@ -61,6 +57,8 @@ endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_CURSES),y)
 PYTHON3_DEPENDENCIES += ncurses
+else
+PYTHON3_CONF_OPT += --disable-curses
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_PYEXPAT),y)
@@ -72,14 +70,24 @@ endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_SQLITE),y)
 PYTHON3_DEPENDENCIES += sqlite
+else
+PYTHON3_CONF_OPT += --disable-sqlite3
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_SSL),y)
-PYTHON_DEPENDENCIES += openssl
+PYTHON3_DEPENDENCIES += openssl
+endif
+
+ifneq ($(BR2_PACKAGE_PYTHON3_CODECSCJK),y)
+PYTHON3_CONF_OPT += --disable-codecs-cjk
+endif
+
+ifneq ($(BR2_PACKAGE_PYTHON3_UNICODEDATA),y)
+PYTHON3_CONF_OPT += --disable-unicodedata
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_BZIP2),y)
-PYTHON_DEPENDENCIES += bzip2
+PYTHON3_DEPENDENCIES += bzip2
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_ZLIB),y)
@@ -101,10 +109,9 @@ PYTHON3_CONF_OPT += \
 	--disable-pydoc		\
 	--disable-test-modules	\
 	--disable-lib2to3	\
-	--disable-gdbm		\
 	--disable-tk		\
 	--disable-nis		\
-	--disable-dbm
+	--disable-idle3
 
 PYTHON3_MAKE_ENV = \
 	_PROJECT_BASE=$(PYTHON3_DIR) \
-- 
1.7.10.4
