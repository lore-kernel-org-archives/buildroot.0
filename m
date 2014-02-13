From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Feb 2014 21:48:53 +0100
Subject: [Buildroot] [PATCHv1 04/26] python: bump to 2.7.6
In-Reply-To: <1392324555-29246-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1392324555-29246-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1392324555-29246-5-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Even though jumping from 2.7.3 to 2.7.6 looks like a minor version
bump, it is in fact a fairly significant one, because a good number of
changes to help cross-compilation have been merged into Python
upstream. Therefore, most of our patches are affected by this change.

In detail, this commit:

 * Renames all the patches to follow the naming convention of patches
   in Buildroot: the patch file names should not have any version
   number.

 * The patches numbered above 100, that add configuration options to
   disable certain modules of the Python standard library, are only
   renamed and slightly adapted, they didn't change that much.

 * The patches numbered below 100 are almost entirely rewritten: many
   of the cross-compilation problems that used to exist in Python
   2.7.3 no longer exist, and the number of remaining problems is
   smaller, and can be fixed with smaller patches.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../python-001-remove-host-header-path.patch       |  32 +++++
 package/python/python-002-fix-get-python-inc.patch |  36 +++++
 ...ython-003-properly-detect-if-python-build.patch |  23 +++
 ...python-004-sysconfigdata-install-location.patch |  76 ++++++++++
 .../python/python-005-pyc-pyo-conditional.patch    |  59 ++++++++
 .../python-006-cross-compile-getaddrinfo.patch     |  13 ++
 package/python/python-007-disable-extensions.patch |  60 ++++++++
 .../python-008-distutils-use-python-sysroot.patch  |  54 ++++++++
 .../python/python-009-no-termcap-host-path.patch   |  23 +++
 ...atch => python-100-optional-test-modules.patch} |  48 ++++---
 ...pydoc.patch => python-101-optional-pydoc.patch} |  36 ++---
 ...l-2to3.patch => python-102-optional-2to3.patch} |  51 ++++---
 ...lite.patch => python-103-optional-sqlite.patch} |  49 ++++---
 ...ional-tk.patch => python-104-optional-tk.patch} |  46 +++---
 ...rses.patch => python-105-optional-curses.patch} |  24 ++--
 ...expat.patch => python-106-optional-expat.patch} |  30 ++--
 ....patch => python-107-optional-codecs-cjk.patch} |   8 +-
 ...nal-nis.patch => python-108-optional-nis.patch} |   8 +-
 ...patch => python-109-optional-unicodedata.patch} |   8 +-
 ...ional-db.patch => python-110-optional-db.patch} |  41 +++---
 ...nal-ssl.patch => python-111-optional-ssl.patch} |   8 +-
 ...bzip2.patch => python-112-optional-bzip2.patch} |   8 +-
 ...l-zlib.patch => python-113-optional-zlib.patch} |   8 +-
 .../python/python-2.7-001-support-for-build.patch  | 154 ---------------------
 .../python-2.7-002-cross-compile-variable.patch    |  55 --------
 ...on-2.7-003-no-import-when-cross-compiling.patch |  26 ----
 .../python-2.7-004-no-host-headers-libs.patch      | 111 ---------------
 .../python-2.7-005-staging-headers-libs.patch      |  38 -----
 .../python/python-2.7-006-disable-extensions.patch | 102 --------------
 .../python-2.7-007-do-not-generate-pyo-files.patch |  40 ------
 .../python/python-2.7-008-reread-environment.patch |  65 ---------
 ...python-2.7-010-change-pyconfig-h-location.patch |  76 ----------
 package/python/python-2.7-011-no-rpath.patch       |  75 ----------
 .../python-2.7-012-correct-32bit-64bit-check.patch |  55 --------
 .../python-2.7-013-fix-linux-3-compilation.patch   |  24 ----
 .../python-2.7-014-verbose-module-build.patch      |  19 ---
 ...7-015-distutils-cross-compilation-support.patch | 125 -----------------
 .../python-2.7-016-cross-compile-getaddrinfo.patch |  15 --
 package/python/python.mk                           |  49 +++----
 39 files changed, 589 insertions(+), 1189 deletions(-)
 create mode 100644 package/python/python-001-remove-host-header-path.patch
 create mode 100644 package/python/python-002-fix-get-python-inc.patch
 create mode 100644 package/python/python-003-properly-detect-if-python-build.patch
 create mode 100644 package/python/python-004-sysconfigdata-install-location.patch
 create mode 100644 package/python/python-005-pyc-pyo-conditional.patch
 create mode 100644 package/python/python-006-cross-compile-getaddrinfo.patch
 create mode 100644 package/python/python-007-disable-extensions.patch
 create mode 100644 package/python/python-008-distutils-use-python-sysroot.patch
 create mode 100644 package/python/python-009-no-termcap-host-path.patch
 rename package/python/{python-2.7-100-optional-test-modules.patch => python-100-optional-test-modules.patch} (71%)
 rename package/python/{python-2.7-101-optional-pydoc.patch => python-101-optional-pydoc.patch} (77%)
 rename package/python/{python-2.7-102-optional-2to3.patch => python-102-optional-2to3.patch} (70%)
 rename package/python/{python-2.7-103-optional-sqlite.patch => python-103-optional-sqlite.patch} (57%)
 rename package/python/{python-2.7-104-optional-tk.patch => python-104-optional-tk.patch} (59%)
 rename package/python/{python-2.7-105-optional-curses.patch => python-105-optional-curses.patch} (75%)
 rename package/python/{python-2.7-106-optional-expat.patch => python-106-optional-expat.patch} (84%)
 rename package/python/{python-2.7-107-optional-codecs-cjk.patch => python-107-optional-codecs-cjk.patch} (84%)
 rename package/python/{python-2.7-108-optional-nis.patch => python-108-optional-nis.patch} (85%)
 rename package/python/{python-2.7-109-optional-unicodedata.patch => python-109-optional-unicodedata.patch} (83%)
 rename package/python/{python-2.7-110-optional-db.patch => python-110-optional-db.patch} (75%)
 rename package/python/{python-2.7-111-optional-ssl.patch => python-111-optional-ssl.patch} (83%)
 rename package/python/{python-2.7-112-optional-bzip2.patch => python-112-optional-bzip2.patch} (83%)
 rename package/python/{python-2.7-113-optional-zlib.patch => python-113-optional-zlib.patch} (84%)
 delete mode 100644 package/python/python-2.7-001-support-for-build.patch
 delete mode 100644 package/python/python-2.7-002-cross-compile-variable.patch
 delete mode 100644 package/python/python-2.7-003-no-import-when-cross-compiling.patch
 delete mode 100644 package/python/python-2.7-004-no-host-headers-libs.patch
 delete mode 100644 package/python/python-2.7-005-staging-headers-libs.patch
 delete mode 100644 package/python/python-2.7-006-disable-extensions.patch
 delete mode 100644 package/python/python-2.7-007-do-not-generate-pyo-files.patch
 delete mode 100644 package/python/python-2.7-008-reread-environment.patch
 delete mode 100644 package/python/python-2.7-010-change-pyconfig-h-location.patch
 delete mode 100644 package/python/python-2.7-011-no-rpath.patch
 delete mode 100644 package/python/python-2.7-012-correct-32bit-64bit-check.patch
 delete mode 100644 package/python/python-2.7-013-fix-linux-3-compilation.patch
 delete mode 100644 package/python/python-2.7-014-verbose-module-build.patch
 delete mode 100644 package/python/python-2.7-015-distutils-cross-compilation-support.patch
 delete mode 100644 package/python/python-2.7-016-cross-compile-getaddrinfo.patch

diff --git a/package/python/python-001-remove-host-header-path.patch b/package/python/python-001-remove-host-header-path.patch
new file mode 100644
index 0000000..206751d
--- /dev/null
+++ b/package/python/python-001-remove-host-header-path.patch
@@ -0,0 +1,32 @@
+setup.py: do not add invalid header locations
+
+This piece of code incorrectly adds /usr/include to
+self.compiler.include_dirs, and results in the following invalid
+compilation line:
+
+/home/thomas/projets/buildroot/output/host/usr/bin/arm-none-linux-gnueabi-gcc -fPIC \
+  -fno-strict-aliasing -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 \
+  -pipe -Os -DNDEBUG -g -O3 -Wall -Wstrict-prototypes \
+  -I/usr/include -I. -IInclude -I./Include \
+  -I/home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include \
+  -I/home/thomas/projets/buildroot/output/build/python-2.7.6/Include \
+  -I/home/thomas/projets/buildroot/output/build/python-2.7.6 \
+  -c /home/thomas/projets/buildroot/output/build/python-2.7.6/Modules/mathmodule.c \
+  -o build/temp.linux2-arm-2.7/home/thomas/projets/buildroot/output/build/python-2.7.6/Modules/mathmodule.o
+cc1: warning: include location "/usr/include" is unsafe for cross-compilation [-Wpoison-system-directories]
+[...]
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Index: b/setup.py
+===================================================================
+--- a/setup.py
++++ b/setup.py
+@@ -478,7 +478,7 @@
+                     for directory in reversed(options.dirs):
+                         add_dir_to_list(dir_list, directory)
+ 
+-        if os.path.normpath(sys.prefix) != '/usr' \
++        if False and os.path.normpath(sys.prefix) != '/usr' \
+                 and not sysconfig.get_config_var('PYTHONFRAMEWORK'):
+             # OSX note: Don't add LIBDIR and INCLUDEDIR to building a framework
+             # (PYTHONFRAMEWORK is set) to avoid # linking problems when
diff --git a/package/python/python-002-fix-get-python-inc.patch b/package/python/python-002-fix-get-python-inc.patch
new file mode 100644
index 0000000..bfee03a
--- /dev/null
+++ b/package/python/python-002-fix-get-python-inc.patch
@@ -0,0 +1,36 @@
+Fix get_python_inc() for cross-compilation
+
+When we are cross compiling, doing os.path.dirname(sys.executable) to
+get the build directory is incorrect, because we're executing the host
+Python to build things for the target. Instead, we should use the
+project_base variable.
+
+This fixes cross-compilation, which was adding incorrect header paths
+pointing to the location where the host Python was built:
+
+/home/thomas/projets/buildroot/output/host/usr/bin/arm-none-linux-gnueabi-gcc -fPIC -fno-strict-aliasing \
+  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -pipe -Os -DNDEBUG -g -O3 -Wall -Wstrict-prototypes \
+  -I/usr/include -I. -IInclude -I./Include -I/home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include \
+  -I/home/thomas/projets/buildroot/output/host/usr/bin/Include -I/home/thomas/projets/buildroot/output/host/usr/bin \
+  -c /home/thomas/projets/buildroot/output/build/python-2.7.6/Modules/_struct.c \
+  -o build/temp.linux2-arm-2.7/home/thomas/projets/buildroot/output/build/python-2.7.6/Modules/_struct.o
+
+This patch allows to fix the
+/home/thomas/projets/buildroot/output/host/usr/bin/Include and
+/home/thomas/projets/buildroot/output/host/usr/bin paths that are
+incorrectly added to the header paths.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Index: b/Lib/distutils/sysconfig.py
+===================================================================
+--- a/Lib/distutils/sysconfig.py
++++ b/Lib/distutils/sysconfig.py
+@@ -79,7 +79,7 @@
+ 
+     if os.name == "posix":
+         if python_build:
+-            buildir = os.path.dirname(sys.executable)
++            buildir = project_base
+             if plat_specific:
+                 # python.h is located in the buildir
+                 inc_dir = buildir
diff --git a/package/python/python-003-properly-detect-if-python-build.patch b/package/python/python-003-properly-detect-if-python-build.patch
new file mode 100644
index 0000000..3fb865f
--- /dev/null
+++ b/package/python/python-003-properly-detect-if-python-build.patch
@@ -0,0 +1,23 @@
+distutils: fix build_ext check to find whether we're building Python or not
+
+The build_ext logic uses
+sys.executable.startswith(os.path.join(sys.exec_prefix, "bin")) to
+determine whether we're building a third-party Python extension, or a
+built-in Python extension. However, this check is wrong in
+cross-compilation mode, and instead, the sysconfig.python_build
+variable should be used.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Index: b/Lib/distutils/command/build_ext.py
+===================================================================
+--- a/Lib/distutils/command/build_ext.py
++++ b/Lib/distutils/command/build_ext.py
+@@ -235,7 +235,7 @@
+         # Python's library directory must be appended to library_dirs
+         # See Issues: #1600860, #4366
+         if (sysconfig.get_config_var('Py_ENABLE_SHARED')):
+-            if sys.executable.startswith(os.path.join(sys.exec_prefix, "bin")):
++            if not sysconfig.python_build:
+                 # building third party extensions
+                 self.library_dirs.append(sysconfig.get_config_var('LIBDIR'))
+             else:
diff --git a/package/python/python-004-sysconfigdata-install-location.patch b/package/python/python-004-sysconfigdata-install-location.patch
new file mode 100644
index 0000000..940dde7
--- /dev/null
+++ b/package/python/python-004-sysconfigdata-install-location.patch
@@ -0,0 +1,76 @@
+Change the install location of _sysconfigdata.py
+
+The _sysconfigdata.py module contains definitions that are needed when
+building Python modules. In cross-compilation mode, when building
+Python extensions for the target, we need to use the _sysconfigdata.py
+of the target Python while executing the host Python.
+
+However until now, the _sysconfigdata.py module was installed in
+build/lib.<arch>-<version> directory, together with a number of
+architecture-specific shared objects, which cannot be used with the
+host Python.
+
+To solve this problem, this patch moves _sysconfigdata.py to a
+separate location, build/sysconfigdata.<arch>-<version>/, and only
+this directory gets added to the PYTHONPATH of the host Python
+interpreter when building Python modules for the target.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/Makefile.pre.in
+===================================================================
+--- a/Makefile.pre.in
++++ b/Makefile.pre.in
+@@ -449,6 +449,9 @@
+ # sys.path fixup -- see Modules/getpath.c.
+ pybuilddir.txt: $(BUILDPYTHON)
+ 		$(RUNSHARED) $(PYTHON_FOR_BUILD) -S -m sysconfig --generate-posix-vars
++		echo `cat pybuilddir.txt`/sysconfigdata > pysysconfigdatadir.txt
++		mkdir -p `cat pysysconfigdatadir.txt`
++		cp `cat pybuilddir.txt`/_sysconfigdata.py `cat pysysconfigdatadir.txt`
+ 
+ # Build the shared modules
+ # Under GNU make, MAKEFLAGS are sorted and normalized; the 's' for
+@@ -965,7 +968,7 @@
+ 		else	true; \
+ 		fi; \
+ 	done
+-	@for i in $(srcdir)/Lib/*.py `cat pybuilddir.txt`/_sysconfigdata.py $(srcdir)/Lib/*.doc $(srcdir)/Lib/*.egg-info ; \
++	@for i in $(srcdir)/Lib/*.py $(srcdir)/Lib/*.doc $(srcdir)/Lib/*.egg-info ; \
+ 	do \
+ 		if test -x $$i; then \
+ 			$(INSTALL_SCRIPT) $$i $(DESTDIR)$(LIBDEST); \
+@@ -975,6 +978,11 @@
+ 			echo $(INSTALL_DATA) $$i $(LIBDEST); \
+ 		fi; \
+ 	done
++	$(INSTALL_DATA) `cat pysysconfigdatadir.txt`/_sysconfigdata.py \
++		$(DESTDIR)$(LIBDEST)
++	mkdir -p $(DESTDIR)$(LIBDEST)/sysconfigdata
++	$(INSTALL_DATA) `cat pysysconfigdatadir.txt`/_sysconfigdata.py \
++		$(DESTDIR)$(LIBDEST)/sysconfigdata
+ 	@for d in $(LIBSUBDIRS); \
+ 	do \
+ 		a=$(srcdir)/Lib/$$d; \
+@@ -1299,7 +1307,7 @@
+ 		Modules/Setup Modules/Setup.local Modules/Setup.config \
+ 		Modules/ld_so_aix Modules/python.exp Misc/python.pc
+ 	-rm -f python*-gdb.py
+-	-rm -f pybuilddir.txt
++	-rm -f pybuilddir.txt pysysconfigdatadir.txt
+ 	find $(srcdir)/[a-zA-Z]* '(' -name '*.fdc' -o -name '*~' \
+ 				     -o -name '[@,#]*' -o -name '*.old' \
+ 				     -o -name '*.orig' -o -name '*.rej' \
+Index: b/configure.ac
+===================================================================
+--- a/configure.ac
++++ b/configure.ac
+@@ -30,7 +30,7 @@
+ 	    AC_MSG_ERROR([python$PACKAGE_VERSION interpreter not found])
+ 	fi
+         AC_MSG_RESULT($interp)
+-	PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir) _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(shell test -f pybuilddir.txt && echo $(abs_builddir)/`cat pybuilddir.txt`:)$(srcdir)/Lib:$(srcdir)/Lib/plat-$(MACHDEP) '$interp
++	PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir) _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(shell test -f pysysconfigdatadir.txt && echo $(abs_builddir)/`cat pysysconfigdatadir.txt`:)$(srcdir)/Lib:$(srcdir)/Lib/plat-$(MACHDEP) '$interp
+     fi
+ elif test "$cross_compiling" = maybe; then
+     AC_MSG_ERROR([Cross compiling required --host=HOST-TUPLE and --build=ARCH])
diff --git a/package/python/python-005-pyc-pyo-conditional.patch b/package/python/python-005-pyc-pyo-conditional.patch
new file mode 100644
index 0000000..aa3b330
--- /dev/null
+++ b/package/python/python-005-pyc-pyo-conditional.patch
@@ -0,0 +1,59 @@
+Index: b/Makefile.pre.in
+===================================================================
+--- a/Makefile.pre.in
++++ b/Makefile.pre.in
+@@ -1013,24 +1013,32 @@
+ 		$(INSTALL_DATA) $(srcdir)/Modules/xxmodule.c \
+ 			$(DESTDIR)$(LIBDEST)/distutils/tests ; \
+ 	fi
++ifeq (@PYC_BUILD@,yes)
+ 	PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
+ 		$(PYTHON_FOR_BUILD) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py \
+ 		-d $(LIBDEST) -f \
+ 		-x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data' \
+ 		$(DESTDIR)$(LIBDEST)
++endif
++ifeq (@PYO_BUILD@,yes)
+ 	PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
+ 		$(PYTHON_FOR_BUILD) -Wi -tt -O $(DESTDIR)$(LIBDEST)/compileall.py \
+ 		-d $(LIBDEST) -f \
+ 		-x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data' \
+ 		$(DESTDIR)$(LIBDEST)
++endif
++ifeq (@PYC_BUILD@,yes)
+ 	-PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
+ 		$(PYTHON_FOR_BUILD) -Wi -t $(DESTDIR)$(LIBDEST)/compileall.py \
+ 		-d $(LIBDEST)/site-packages -f \
+ 		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
++endif
++ifeq (@PYO_BUILD@,yes)
+ 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
+ 		$(PYTHON_FOR_BUILD) -Wi -t -O $(DESTDIR)$(LIBDEST)/compileall.py \
+ 		-d $(LIBDEST)/site-packages -f \
+ 		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
++endif
+ 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
+ 		$(PYTHON_FOR_BUILD) -m lib2to3.pgen2.driver $(DESTDIR)$(LIBDEST)/lib2to3/Grammar.txt
+ 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
+Index: b/configure.ac
+===================================================================
+--- a/configure.ac
++++ b/configure.ac
+@@ -733,6 +733,17 @@
+     ;;
+ esac
+ 
++AC_SUBST(PYC_BUILD)
++
++AC_ARG_ENABLE(pyc-build,
++	AS_HELP_STRING([--disable-pyc-build], [disable build of pyc files]),
++	[ PYC_BUILD="${enableval}" ], [ PYC_BUILD=yes ])
++
++AC_SUBST(PYO_BUILD)
++
++AC_ARG_ENABLE(pyo-build,
++	AS_HELP_STRING([--disable-pyo-build], [disable build of pyo files]),
++	[ PYO_BUILD="${enableval}" ], [ PYO_BUILD=yes ])
+ 
+ AC_SUBST(LIBRARY)
+ AC_MSG_CHECKING(LIBRARY)
diff --git a/package/python/python-006-cross-compile-getaddrinfo.patch b/package/python/python-006-cross-compile-getaddrinfo.patch
new file mode 100644
index 0000000..2c8248f
--- /dev/null
+++ b/package/python/python-006-cross-compile-getaddrinfo.patch
@@ -0,0 +1,13 @@
+Index: b/configure.ac
+===================================================================
+--- a/configure.ac
++++ b/configure.ac
+@@ -3337,7 +3337,7 @@
+ 
+ AC_MSG_RESULT($ac_cv_buggy_getaddrinfo)
+ 
+-if test $have_getaddrinfo = no -o "$ac_cv_buggy_getaddrinfo" = yes
++if test $have_getaddrinfo = no || test "$cross_compiling" != "yes" -a "$ac_cv_buggy_getaddrinfo" = yes
+ then
+ 	if test $ipv6 = yes
+ 	then
diff --git a/package/python/python-007-disable-extensions.patch b/package/python/python-007-disable-extensions.patch
new file mode 100644
index 0000000..c03f84c
--- /dev/null
+++ b/package/python/python-007-disable-extensions.patch
@@ -0,0 +1,60 @@
+Index: b/Makefile.pre.in
+===================================================================
+--- a/Makefile.pre.in
++++ b/Makefile.pre.in
+@@ -153,6 +153,8 @@
+ # configure script arguments
+ CONFIG_ARGS=	@CONFIG_ARGS@
+ 
++# disabled extensions
++DISABLED_EXTENSIONS=	@DISABLED_EXTENSIONS@
+ 
+ # Subdirectories with code
+ SRCDIRS= 	@SRCDIRS@
+@@ -464,6 +466,7 @@
+ 	esac; \
+ 	$(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' \
+ 		_TCLTK_INCLUDES='$(TCLTK_INCLUDES)' _TCLTK_LIBS='$(TCLTK_LIBS)' \
++		DISABLED_EXTENSIONS="$(DISABLED_EXTENSIONS)" \
+ 		$(PYTHON_FOR_BUILD) $(srcdir)/setup.py $$quiet build
+ 
+ # Build static library
+@@ -1154,7 +1157,8 @@
+ # Install the dynamically loadable modules
+ # This goes into $(exec_prefix)
+ sharedinstall: sharedmods
+-	$(RUNSHARED) $(PYTHON_FOR_BUILD) $(srcdir)/setup.py install \
++	$(RUNSHARED) DISABLED_EXTENSIONS="$(DISABLED_EXTENSIONS)" \
++		$(PYTHON_FOR_BUILD) $(srcdir)/setup.py install \
+ 	   	--prefix=$(prefix) \
+ 		--install-scripts=$(BINDIR) \
+ 		--install-platlib=$(DESTSHARED) \
+Index: b/configure.ac
+===================================================================
+--- a/configure.ac
++++ b/configure.ac
+@@ -2275,6 +2275,8 @@
+ 
+ AC_PATH_TOOL([PKG_CONFIG], [pkg-config])
+ 
++AC_SUBST(DISABLED_EXTENSIONS)
++
+ # Check for use of the system expat library
+ AC_MSG_CHECKING(for --with-system-expat)
+ AC_ARG_WITH(system_expat,
+Index: b/setup.py
+===================================================================
+--- a/setup.py
++++ b/setup.py
+@@ -33,7 +33,10 @@
+ COMPILED_WITH_PYDEBUG = ('--with-pydebug' in sysconfig.get_config_var("CONFIG_ARGS"))
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
diff --git a/package/python/python-008-distutils-use-python-sysroot.patch b/package/python/python-008-distutils-use-python-sysroot.patch
new file mode 100644
index 0000000..7cd7487
--- /dev/null
+++ b/package/python/python-008-distutils-use-python-sysroot.patch
@@ -0,0 +1,54 @@
+Adjust library/header paths for cross-compilation
+
+When cross-compiling third-party extensions, the get_python_inc() or
+get_python_lib() can be called, to return the path to headers or
+libraries. However, they use the sys.prefix of the host Python, which
+returns incorrect paths when cross-compiling (paths pointing to host
+headers and libraries).
+
+In order to fix this, we introduce the _python_sysroot, _python_prefix
+and _python_exec_prefix variables, that allow to override these
+values, and get correct header/library paths when cross-compiling
+third-party Python modules.
+
+The _python_sysroot variable is also used to prefix the LIBDIR value
+taken from the sysconfigdata module.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/Lib/distutils/sysconfig.py
+===================================================================
+--- a/Lib/distutils/sysconfig.py
++++ b/Lib/distutils/sysconfig.py
+@@ -19,8 +19,13 @@
+ from distutils.errors import DistutilsPlatformError
+ 
+ # These are needed in a couple of spots, so just compute them once.
+-PREFIX = os.path.normpath(sys.prefix)
+-EXEC_PREFIX = os.path.normpath(sys.exec_prefix)
++if "_python_sysroot" in os.environ:
++    _sysroot=os.environ.get('_python_sysroot')
++    PREFIX = os.path.normpath(_sysroot + os.environ.get('_python_prefix'))
++    EXEC_PREFIX = os.path.normpath(_sysroot + os.environ.get('_python_exec_prefix'))
++else:
++    PREFIX = os.path.normpath(sys.prefix)
++    EXEC_PREFIX = os.path.normpath(sys.exec_prefix)
+ 
+ # Path to the base directory of the project. On Windows the binary may
+ # live in project/PCBuild9.  If we're dealing with an x64 Windows build,
+Index: b/Lib/distutils/command/build_ext.py
+===================================================================
+--- a/Lib/distutils/command/build_ext.py
++++ b/Lib/distutils/command/build_ext.py
+@@ -237,7 +237,10 @@
+         if (sysconfig.get_config_var('Py_ENABLE_SHARED')):
+             if not sysconfig.python_build:
+                 # building third party extensions
+-                self.library_dirs.append(sysconfig.get_config_var('LIBDIR'))
++                libdir = sysconfig.get_config_var('LIBDIR')
++                if "_python_sysroot" in os.environ:
++                    libdir = os.environ.get("_python_sysroot") + libdir
++                self.library_dirs.append(libdir)
+             else:
+                 # building python standard extensions
+                 self.library_dirs.append('.')
diff --git a/package/python/python-009-no-termcap-host-path.patch b/package/python/python-009-no-termcap-host-path.patch
new file mode 100644
index 0000000..7df8a32
--- /dev/null
+++ b/package/python/python-009-no-termcap-host-path.patch
@@ -0,0 +1,23 @@
+Don't look in /usr/lib/termcap for libraries
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+
+Index: b/setup.py
+===================================================================
+--- a/setup.py
++++ b/setup.py
+@@ -760,12 +760,9 @@
+                 pass # Issue 7384: Already linked against curses or tinfo.
+             elif curses_library:
+                 readline_libs.append(curses_library)
+-            elif self.compiler.find_library_file(lib_dirs +
+-                                                     ['/usr/lib/termcap'],
+-                                                     'termcap'):
++            elif self.compiler.find_library_file(lib_dirs, 'termcap'):
+                 readline_libs.append('termcap')
+             exts.append( Extension('readline', ['readline.c'],
+-                                   library_dirs=['/usr/lib/termcap'],
+                                    extra_link_args=readline_extra_link_args,
+                                    libraries=readline_libs) )
+         else:
diff --git a/package/python/python-2.7-100-optional-test-modules.patch b/package/python/python-100-optional-test-modules.patch
similarity index 71%
rename from package/python/python-2.7-100-optional-test-modules.patch
rename to package/python/python-100-optional-test-modules.patch
index a988717..a5f7545 100644
--- a/package/python/python-2.7-100-optional-test-modules.patch
+++ b/package/python/python-100-optional-test-modules.patch
@@ -11,19 +11,20 @@ Signed-off-by: Samuel Martin <s.martin49@gmail.com>
  configure.in    |    6 ++++++
  2 files changed, 33 insertions(+), 13 deletions(-)
 
-Index: Python-2.7.2/Makefile.pre.in
+Index: b/Makefile.pre.in
 ===================================================================
---- Python-2.7.2.orig/Makefile.pre.in
-+++ Python-2.7.2/Makefile.pre.in
-@@ -856,23 +856,30 @@
+--- a/Makefile.pre.in
++++ b/Makefile.pre.in
+@@ -934,23 +934,40 @@
  	plat-mac/lib-scriptpackages/SystemEvents \
- 	plat-mac/lib-scriptpackages/Terminal 
+ 	plat-mac/lib-scriptpackages/Terminal
  PLATMACPATH=:plat-mac:plat-mac/lib-scriptpackages
 -LIBSUBDIRS=	lib-tk lib-tk/test lib-tk/test/test_tkinter \
--		lib-tk/test/test_ttk site-packages test test/data \
+-		lib-tk/test/test_ttk site-packages test test/audiodata test/data \
 -		test/cjkencodings test/decimaltestdata test/xmltestdata test/subprocessdata \
 -		test/tracedmodules \
-+LIBSUBDIRS=	lib-tk  site-packages \
++LIBSUBDIRS=	lib-tk \
++		site-packages \
  		encodings compiler hotshot \
 -		email email/mime email/test email/test/data \
 -		json json/tests \
@@ -39,31 +40,40 @@ Index: Python-2.7.2/Makefile.pre.in
 +		logging bsddb csv importlib wsgiref \
 +		lib2to3 lib2to3/fixes lib2to3/pgen2 \
 +		ctypes  ctypes/macholib idlelib idlelib/Icons \
-+		distutils distutils/command  $(XMLLIBSUBDIRS) \
++		distutils distutils/command $(XMLLIBSUBDIRS) \
  		multiprocessing multiprocessing/dummy \
 -		unittest unittest/test \
 +		unittest \
  		lib-old \
  		curses pydoc_data $(MACHDEPS)
 +
++TESTSUBDIRS = lib-tk/test lib-tk/test/test_tkinter \
++	lib-tk/test/test_ttk \
++	test test/audiodata test/data \
++	test/cjkencodings test/decimaltestdata test/xmltestdata test/subprocessdata \
++	test/tracedmodules \
++	email/test email/test/data \
++	json/tests \
++	sqlite3/test \
++	bsddb/test \
++	lib2to3/tests \
++	lib2to3/tests/data lib2to3/tests/data/fixers lib2to3/tests/data/fixers/myfixes \
++	ctypes/test \
++	distutils/tests \
++	unittest/test
++
 +ifeq (@TEST_MODULES@,yes)
-+LIBSUBDIRS += lib-tk/test lib-tk/test/test_tkinter \
-+		lib-tk/test/test_ttk test test/data \
-+		test/cjkencodings test/decimaltestdata test/xmltestdata test/subprocessdata \
-+		test/tracedmodules email/test email/test/data \
-+		json/tests sqlite3/test bsddb/test lib2to3/tests \
-+		lib2to3/tests/data lib2to3/tests/data/fixers lib2to3/tests/data/fixers/myfixes \
-+		ctypes/test distutils/tests unittest/test
++LIBSUBDIRS += $(TESTSUBDIRS)
 +endif
 +
  libinstall:	build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
  	@for i in $(SCRIPTDIR) $(LIBDEST); \
  	do \
-Index: Python-2.7.2/configure.in
+Index: b/configure.ac
 ===================================================================
---- Python-2.7.2.orig/configure.in
-+++ Python-2.7.2/configure.in
-@@ -2408,6 +2408,12 @@
+--- a/configure.ac
++++ b/configure.ac
+@@ -2614,6 +2614,12 @@
  fi
  
  
diff --git a/package/python/python-2.7-101-optional-pydoc.patch b/package/python/python-101-optional-pydoc.patch
similarity index 77%
rename from package/python/python-2.7-101-optional-pydoc.patch
rename to package/python/python-101-optional-pydoc.patch
index ccc937b..c9b05bd 100644
--- a/package/python/python-2.7-101-optional-pydoc.patch
+++ b/package/python/python-101-optional-pydoc.patch
@@ -12,21 +12,21 @@ Signed-off-by: Samuel Martin <s.martin49@gmail.com>
  setup.py        |   10 +++++++---
  3 files changed, 17 insertions(+), 4 deletions(-)
 
-Index: Python-2.7.2/Makefile.pre.in
+Index: b/Makefile.pre.in
 ===================================================================
---- Python-2.7.2.orig/Makefile.pre.in
-+++ Python-2.7.2/Makefile.pre.in
-@@ -868,7 +868,7 @@
+--- a/Makefile.pre.in
++++ b/Makefile.pre.in
+@@ -947,7 +947,7 @@
  		multiprocessing multiprocessing/dummy \
  		unittest \
  		lib-old \
 -		curses pydoc_data $(MACHDEPS)
 +		curses $(MACHDEPS)
  
- ifeq (@TEST_MODULES@,yes)
- LIBSUBDIRS += lib-tk/test lib-tk/test/test_tkinter \
-@@ -880,6 +880,10 @@
- 		ctypes/test distutils/tests unittest/test
+ TESTSUBDIRS = lib-tk/test lib-tk/test/test_tkinter \
+ 	lib-tk/test/test_ttk \
+@@ -968,6 +968,10 @@
+ LIBSUBDIRS += $(TESTSUBDIRS)
  endif
  
 +ifeq (@PYDOC@,yes)
@@ -36,12 +36,12 @@ Index: Python-2.7.2/Makefile.pre.in
  libinstall:	build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
  	@for i in $(SCRIPTDIR) $(LIBDEST); \
  	do \
-Index: Python-2.7.2/configure.in
+Index: b/configure.ac
 ===================================================================
---- Python-2.7.2.orig/configure.in
-+++ Python-2.7.2/configure.in
-@@ -2407,6 +2407,11 @@
-         esac])
+--- a/configure.ac
++++ b/configure.ac
+@@ -2613,6 +2613,11 @@
+       AC_CHECK_FUNCS(pthread_atfork)
  fi
  
 +AC_SUBST(PYDOC)
@@ -52,11 +52,11 @@ Index: Python-2.7.2/configure.in
  
  AC_SUBST(TEST_MODULES)
  
-Index: Python-2.7.2/setup.py
+Index: b/setup.py
 ===================================================================
---- Python-2.7.2.orig/setup.py
-+++ Python-2.7.2/setup.py
-@@ -2092,6 +2092,12 @@
+--- a/setup.py
++++ b/setup.py
+@@ -2205,6 +2205,12 @@
      # turn off warnings when deprecated modules are imported
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
@@ -69,7 +69,7 @@ Index: Python-2.7.2/setup.py
      setup(# PyPI Metadata (PEP 301)
            name = "Python",
            version = sys.version.split()[0],
-@@ -2112,9 +2118,7 @@
+@@ -2225,9 +2231,7 @@
            ext_modules=[Extension('_struct', ['_struct.c'])],
  
            # Scripts to install
diff --git a/package/python/python-2.7-102-optional-2to3.patch b/package/python/python-102-optional-2to3.patch
similarity index 70%
rename from package/python/python-2.7-102-optional-2to3.patch
rename to package/python/python-102-optional-2to3.patch
index 0321619..586b24b 100644
--- a/package/python/python-2.7-102-optional-2to3.patch
+++ b/package/python/python-102-optional-2to3.patch
@@ -12,50 +12,47 @@ Signed-off-by: Samuel Martin <s.martin49@gmail.com>
  setup.py        |    5 +++--
  3 files changed, 26 insertions(+), 9 deletions(-)
 
-Index: Python-2.7.2/Makefile.pre.in
+Index: b/Makefile.pre.in
 ===================================================================
---- Python-2.7.2.orig/Makefile.pre.in
-+++ Python-2.7.2/Makefile.pre.in
-@@ -862,7 +862,6 @@
+--- a/Makefile.pre.in
++++ b/Makefile.pre.in
+@@ -941,7 +941,6 @@
  		json \
  		sqlite3 \
  		logging bsddb csv importlib wsgiref \
 -		lib2to3 lib2to3/fixes lib2to3/pgen2 \
  		ctypes  ctypes/macholib idlelib idlelib/Icons \
- 		distutils distutils/command  $(XMLLIBSUBDIRS) \
+ 		distutils distutils/command $(XMLLIBSUBDIRS) \
  		multiprocessing multiprocessing/dummy \
-@@ -875,8 +874,7 @@
- 		lib-tk/test/test_ttk test test/data \
- 		test/cjkencodings test/decimaltestdata test/xmltestdata test/subprocessdata \
- 		test/tracedmodules email/test email/test/data \
--		json/tests sqlite3/test bsddb/test lib2to3/tests \
--		lib2to3/tests/data lib2to3/tests/data/fixers lib2to3/tests/data/fixers/myfixes \
-+		json/tests sqlite3/test bsddb/test \
- 		ctypes/test distutils/tests unittest/test
- endif
- 
-@@ -884,6 +882,16 @@
+@@ -958,8 +957,6 @@
+ 	json/tests \
+ 	sqlite3/test \
+ 	bsddb/test \
+-	lib2to3/tests \
+-	lib2to3/tests/data lib2to3/tests/data/fixers lib2to3/tests/data/fixers/myfixes \
+ 	ctypes/test \
+ 	distutils/tests \
+ 	unittest/test
+@@ -972,6 +969,14 @@
  LIBSUBDIRS += pydoc_data
  endif
  
 +ifeq (@LIB2TO3@,yes)
 +LIBSUBDIRS += lib2to3 lib2to3/fixes lib2to3/pgen2
-+ifeq (@TEST_MODULES@,yes)
-+LIBSUBDIRS += 	lib2to3/tests				\
++TESTSUBDIRS += 	lib2to3/tests				\
 +		lib2to3/tests/data			\
 +		lib2to3/tests/data/fixers		\
 +		lib2to3/tests/data/fixers/myfixes
 +endif
-+endif
 +
  libinstall:	build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
  	@for i in $(SCRIPTDIR) $(LIBDEST); \
  	do \
-Index: Python-2.7.2/configure.in
+Index: b/configure.ac
 ===================================================================
---- Python-2.7.2.orig/configure.in
-+++ Python-2.7.2/configure.in
-@@ -2419,6 +2419,12 @@
+--- a/configure.ac
++++ b/configure.ac
+@@ -2625,6 +2625,12 @@
  	AS_HELP_STRING([--disable-test-modules], [disable test modules]),
  	[ TEST_MODULES="${enableval}" ], [ TEST_MODULES=yes ])
  
@@ -68,11 +65,11 @@ Index: Python-2.7.2/configure.in
  # Check for enable-ipv6
  AH_TEMPLATE(ENABLE_IPV6, [Define if --enable-ipv6 is specified])
  AC_MSG_CHECKING([if --enable-ipv6 is specified])
-Index: Python-2.7.2/setup.py
+Index: b/setup.py
 ===================================================================
---- Python-2.7.2.orig/setup.py
-+++ Python-2.7.2/setup.py
-@@ -2093,10 +2093,11 @@
+--- a/setup.py
++++ b/setup.py
+@@ -2206,10 +2206,11 @@
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
  
diff --git a/package/python/python-2.7-103-optional-sqlite.patch b/package/python/python-103-optional-sqlite.patch
similarity index 57%
rename from package/python/python-2.7-103-optional-sqlite.patch
rename to package/python/python-103-optional-sqlite.patch
index a915c55..a20afc7 100644
--- a/package/python/python-2.7-103-optional-sqlite.patch
+++ b/package/python/python-103-optional-sqlite.patch
@@ -8,12 +8,12 @@ Signed-off-by: Samuel Martin <s.martin49@gmail.com>
  configure.in |    9 +++++++++
  2 file changed, 9 insertions(+)
 
-Index: Python-2.7.2/configure.in
+Index: b/configure.ac
 ===================================================================
---- Python-2.7.2.orig/configure.in
-+++ Python-2.7.2/configure.in
-@@ -2407,6 +2407,15 @@
-         esac])
+--- a/configure.ac
++++ b/configure.ac
+@@ -2613,6 +2613,15 @@
+       AC_CHECK_FUNCS(pthread_atfork)
  fi
  
 +AC_SUBST(SQLITE3)
@@ -28,28 +28,33 @@ Index: Python-2.7.2/configure.in
  AC_SUBST(PYDOC)
  
  AC_ARG_ENABLE(pydoc,
-Index: Python-2.7.2/Makefile.pre.in
+Index: b/Makefile.pre.in
 ===================================================================
---- Python-2.7.2.orig/Makefile.pre.in
-+++ Python-2.7.2/Makefile.pre.in
-@@ -875,7 +874,7 @@
- 		lib-tk/test/test_ttk test test/data \
- 		test/cjkencodings test/decimaltestdata test/xmltestdata test/subprocessdata \
- 		test/tracedmodules email/test email/test/data \
--		json/tests sqlite3/test bsddb/test \
-+		json/tests  bsddb/test \
- 		ctypes/test distutils/tests unittest/test
- endif
- 
-@@ -884,6 +882,13 @@
- LIBSUBDIRS += pydoc_data
+--- a/Makefile.pre.in
++++ b/Makefile.pre.in
+@@ -939,7 +939,6 @@
+ 		encodings compiler hotshot \
+ 		email email/mime \
+ 		json \
+-		sqlite3 \
+ 		logging bsddb csv importlib wsgiref \
+ 		ctypes  ctypes/macholib idlelib idlelib/Icons \
+ 		distutils distutils/command $(XMLLIBSUBDIRS) \
+@@ -955,7 +954,6 @@
+ 	test/tracedmodules \
+ 	email/test email/test/data \
+ 	json/tests \
+-	sqlite3/test \
+ 	bsddb/test \
+ 	ctypes/test \
+ 	distutils/tests \
+@@ -977,6 +975,11 @@
+ 		lib2to3/tests/data/fixers/myfixes
  endif
  
 +ifeq (@SQLITE3@,yes)
 +LIBSUBDIRS += sqlite3
-+ifeq (@TEST_MODULES@,yes)
-+LIBSUBDIRS += sqlite3/test
-+endif
++TESTSUBDIRS += sqlite3/test
 +endif
 +
  libinstall:	build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
diff --git a/package/python/python-2.7-104-optional-tk.patch b/package/python/python-104-optional-tk.patch
similarity index 59%
rename from package/python/python-2.7-104-optional-tk.patch
rename to package/python/python-104-optional-tk.patch
index 9333e33..3e0dd16 100644
--- a/package/python/python-2.7-104-optional-tk.patch
+++ b/package/python/python-104-optional-tk.patch
@@ -8,49 +8,49 @@ Signed-off-by: Samuel Martin <s.martin49@gmail.com>
  configure.in    |    9 +++++++++
  2 files changed, 19 insertions(+), 4 deletions(-)
 
-Index: Python-2.7.2/Makefile.pre.in
+Index: b/Makefile.pre.in
 ===================================================================
---- Python-2.7.2.orig/Makefile.pre.in
-+++ Python-2.7.2/Makefile.pre.in
-@@ -856,7 +856,7 @@
+--- a/Makefile.pre.in
++++ b/Makefile.pre.in
+@@ -934,8 +934,7 @@
  	plat-mac/lib-scriptpackages/SystemEvents \
- 	plat-mac/lib-scriptpackages/Terminal 
+ 	plat-mac/lib-scriptpackages/Terminal
  PLATMACPATH=:plat-mac:plat-mac/lib-scriptpackages
--LIBSUBDIRS=	lib-tk  site-packages \
+-LIBSUBDIRS=	lib-tk \
+-		site-packages \
 +LIBSUBDIRS=	site-packages \
  		encodings compiler hotshot \
  		email email/mime \
  		json \
-@@ -870,8 +870,7 @@
+@@ -947,9 +946,7 @@
+ 		lib-old \
  		curses $(MACHDEPS)
  
- ifeq (@TEST_MODULES@,yes)
--LIBSUBDIRS += lib-tk/test lib-tk/test/test_tkinter \
--		lib-tk/test/test_ttk test test/data \
-+LIBSUBDIRS +=   test test/data \
- 		test/cjkencodings test/decimaltestdata test/xmltestdata test/subprocessdata \
- 		test/tracedmodules email/test email/test/data \
- 		json/tests sqlite3/test bsddb/test \
-@@ -899,6 +898,14 @@
- endif
+-TESTSUBDIRS = lib-tk/test lib-tk/test/test_tkinter \
+-	lib-tk/test/test_ttk \
+-	test test/audiodata test/data \
++TESTSUBDIRS = test test/audiodata test/data \
+ 	test/cjkencodings test/decimaltestdata test/xmltestdata test/subprocessdata \
+ 	test/tracedmodules \
+ 	email/test email/test/data \
+@@ -980,6 +977,12 @@
+ TESTSUBDIRS += sqlite3/test
  endif
  
 +ifeq (@TK@,yes)
 +LIBSUBDIRS += lib-tk
-+ifeq (@TEST_MODULES@,yes)
-+LIBSUBDIRS += lib-tk/test lib-tk/test/test_tkinter	\
++TESTSUBDIRS += lib-tk/test lib-tk/test/test_tkinter	\
 +	      lib-tk/test/test_ttk
 +endif
-+endif
 +
  libinstall:	build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
  	@for i in $(SCRIPTDIR) $(LIBDEST); \
  	do \
-Index: Python-2.7.2/configure.in
+Index: b/configure.ac
 ===================================================================
---- Python-2.7.2.orig/configure.in
-+++ Python-2.7.2/configure.in
-@@ -2416,6 +2416,15 @@
+--- a/configure.ac
++++ b/configure.ac
+@@ -2622,6 +2622,15 @@
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
  fi
  
diff --git a/package/python/python-2.7-105-optional-curses.patch b/package/python/python-105-optional-curses.patch
similarity index 75%
rename from package/python/python-2.7-105-optional-curses.patch
rename to package/python/python-105-optional-curses.patch
index 7f8da7c..2ae4989 100644
--- a/package/python/python-2.7-105-optional-curses.patch
+++ b/package/python/python-105-optional-curses.patch
@@ -8,21 +8,21 @@ Signed-off-by: Samuel Martin <s.martin49@gmail.com>
  configure.in    |    9 +++++++++
  2 files changed, 14 insertions(+), 1 deletion(-)
 
-Index: Python-2.7.2/Makefile.pre.in
+Index: b/Makefile.pre.in
 ===================================================================
---- Python-2.7.2.orig/Makefile.pre.in
-+++ Python-2.7.2/Makefile.pre.in
-@@ -867,7 +867,7 @@
+--- a/Makefile.pre.in
++++ b/Makefile.pre.in
+@@ -944,7 +944,7 @@
  		multiprocessing multiprocessing/dummy \
  		unittest \
  		lib-old \
 -		curses $(MACHDEPS)
 +		$(MACHDEPS)
  
- ifeq (@TEST_MODULES@,yes)
- LIBSUBDIRS +=   test test/data \
-@@ -906,6 +906,10 @@
- endif
+ TESTSUBDIRS = test test/audiodata test/data \
+ 	test/cjkencodings test/decimaltestdata test/xmltestdata test/subprocessdata \
+@@ -983,6 +983,10 @@
+ 	      lib-tk/test/test_ttk
  endif
  
 +ifeq (@CURSES@,yes)
@@ -32,11 +32,11 @@ Index: Python-2.7.2/Makefile.pre.in
  libinstall:	build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
  	@for i in $(SCRIPTDIR) $(LIBDEST); \
  	do \
-Index: Python-2.7.2/configure.in
+Index: b/configure.ac
 ===================================================================
---- Python-2.7.2.orig/configure.in
-+++ Python-2.7.2/configure.in
-@@ -2425,6 +2425,15 @@
+--- a/configure.ac
++++ b/configure.ac
+@@ -2631,6 +2631,15 @@
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _tkinter"
  fi
  
diff --git a/package/python/python-2.7-106-optional-expat.patch b/package/python/python-106-optional-expat.patch
similarity index 84%
rename from package/python/python-2.7-106-optional-expat.patch
rename to package/python/python-106-optional-expat.patch
index 2d8ae74..9eee2cd 100644
--- a/package/python/python-2.7-106-optional-expat.patch
+++ b/package/python/python-106-optional-expat.patch
@@ -15,20 +15,20 @@ Signed-off-by: Samuel Martin <s.martin49@gmail.com>
  setup.py        |    2 +-
  3 files changed, 19 insertions(+), 7 deletions(-)
 
-Index: Python-2.7.2/Makefile.pre.in
+Index: b/Makefile.pre.in
 ===================================================================
---- Python-2.7.2.orig/Makefile.pre.in
-+++ Python-2.7.2/Makefile.pre.in
-@@ -863,7 +863,7 @@
- 		sqlite3 \
+--- a/Makefile.pre.in
++++ b/Makefile.pre.in
+@@ -940,7 +940,7 @@
+ 		json \
  		logging bsddb csv importlib wsgiref \
  		ctypes  ctypes/macholib idlelib idlelib/Icons \
--		distutils distutils/command  $(XMLLIBSUBDIRS) \
+-		distutils distutils/command $(XMLLIBSUBDIRS) \
 +		distutils distutils/command \
  		multiprocessing multiprocessing/dummy \
  		unittest \
  		lib-old \
-@@ -910,6 +910,10 @@
+@@ -987,6 +987,10 @@
  LIBSUBDIRS += curses
  endif
  
@@ -39,11 +39,11 @@ Index: Python-2.7.2/Makefile.pre.in
  libinstall:	build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
  	@for i in $(SCRIPTDIR) $(LIBDEST); \
  	do \
-Index: Python-2.7.2/configure.in
+Index: b/configure.ac
 ===================================================================
---- Python-2.7.2.orig/configure.in
-+++ Python-2.7.2/configure.in
-@@ -2102,13 +2102,21 @@
+--- a/configure.ac
++++ b/configure.ac
+@@ -2278,13 +2278,21 @@
  AC_SUBST(DISABLED_EXTENSIONS)
  
  # Check for use of the system expat library
@@ -70,11 +70,11 @@ Index: Python-2.7.2/configure.in
  
  # Check for use of the system libffi library
  AC_MSG_CHECKING(for --with-system-ffi)
-Index: Python-2.7.2/setup.py
+Index: b/setup.py
 ===================================================================
---- Python-2.7.2.orig/setup.py
-+++ Python-2.7.2/setup.py
-@@ -1403,7 +1403,7 @@
+--- a/setup.py
++++ b/setup.py
+@@ -1457,7 +1457,7 @@
          #
          # More information on Expat can be found at www.libexpat.org.
          #
diff --git a/package/python/python-2.7-107-optional-codecs-cjk.patch b/package/python/python-107-optional-codecs-cjk.patch
similarity index 84%
rename from package/python/python-2.7-107-optional-codecs-cjk.patch
rename to package/python/python-107-optional-codecs-cjk.patch
index 8ba61fe..1b3acac 100644
--- a/package/python/python-2.7-107-optional-codecs-cjk.patch
+++ b/package/python/python-107-optional-codecs-cjk.patch
@@ -6,11 +6,11 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  configure.in |    6 ++++++
  1 file changed, 6 insertions(+)
 
-Index: Python-2.7.2/configure.in
+Index: b/configure.ac
 ===================================================================
---- Python-2.7.2.orig/configure.in
-+++ Python-2.7.2/configure.in
-@@ -2424,6 +2424,12 @@
+--- a/configure.ac
++++ b/configure.ac
+@@ -2630,6 +2630,12 @@
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
  fi
  
diff --git a/package/python/python-2.7-108-optional-nis.patch b/package/python/python-108-optional-nis.patch
similarity index 85%
rename from package/python/python-2.7-108-optional-nis.patch
rename to package/python/python-108-optional-nis.patch
index 212f8d6..8749dfc 100644
--- a/package/python/python-2.7-108-optional-nis.patch
+++ b/package/python/python-108-optional-nis.patch
@@ -9,11 +9,11 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  configure.in |    6 ++++++
  1 file changed, 6 insertions(+)
 
-Index: Python-2.7.2/configure.in
+Index: b/configure.ac
 ===================================================================
---- Python-2.7.2.orig/configure.in
-+++ Python-2.7.2/configure.in
-@@ -2430,6 +2430,12 @@
+--- a/configure.ac
++++ b/configure.ac
+@@ -2636,6 +2636,12 @@
      	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _codecs_kr _codecs_jp _codecs_cn _codecs_tw _codecs_hk"
    	  fi])
  
diff --git a/package/python/python-2.7-109-optional-unicodedata.patch b/package/python/python-109-optional-unicodedata.patch
similarity index 83%
rename from package/python/python-2.7-109-optional-unicodedata.patch
rename to package/python/python-109-optional-unicodedata.patch
index 229ba8c..2d78818 100644
--- a/package/python/python-2.7-109-optional-unicodedata.patch
+++ b/package/python/python-109-optional-unicodedata.patch
@@ -6,11 +6,11 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  configure.in |    6 ++++++
  1 file changed, 6 insertions(+)
 
-Index: Python-2.7.2/configure.in
+Index: b/configure.ac
 ===================================================================
---- Python-2.7.2.orig/configure.in
-+++ Python-2.7.2/configure.in
-@@ -2436,6 +2436,12 @@
+--- a/configure.ac
++++ b/configure.ac
+@@ -2642,6 +2642,12 @@
      	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} nis"
    	  fi])
  
diff --git a/package/python/python-2.7-110-optional-db.patch b/package/python/python-110-optional-db.patch
similarity index 75%
rename from package/python/python-2.7-110-optional-db.patch
rename to package/python/python-110-optional-db.patch
index b32eea9..ea756da 100644
--- a/package/python/python-2.7-110-optional-db.patch
+++ b/package/python/python-110-optional-db.patch
@@ -12,47 +12,44 @@ Signed-off-by: Samuel Martin <s.martin49@gmail.com>
  configure.in    |   22 ++++++++++++++++++++++
  2 files changed, 30 insertions(+), 2 deletions(-)
 
-Index: Python-2.7.2/Makefile.pre.in
+Index: b/Makefile.pre.in
 ===================================================================
---- Python-2.7.2.orig/Makefile.pre.in
-+++ Python-2.7.2/Makefile.pre.in
-@@ -861,7 +861,7 @@
+--- a/Makefile.pre.in
++++ b/Makefile.pre.in
+@@ -938,7 +938,7 @@
+ 		encodings compiler hotshot \
  		email email/mime \
  		json \
- 		sqlite3 \
 -		logging bsddb csv importlib wsgiref \
 +		logging csv importlib wsgiref \
  		ctypes  ctypes/macholib idlelib idlelib/Icons \
  		distutils distutils/command \
  		multiprocessing multiprocessing/dummy \
-@@ -873,7 +873,7 @@
- LIBSUBDIRS +=   test test/data \
- 		test/cjkencodings test/decimaltestdata test/xmltestdata test/subprocessdata \
- 		test/tracedmodules email/test email/test/data \
--		json/tests  bsddb/test \
-+		json/tests \
- 		ctypes/test distutils/tests unittest/test
- endif
- 
-@@ -914,6 +914,13 @@
+@@ -951,7 +951,6 @@
+ 	test/tracedmodules \
+ 	email/test email/test/data \
+ 	json/tests \
+-	bsddb/test \
+ 	ctypes/test \
+ 	distutils/tests \
+ 	unittest/test
+@@ -991,6 +990,11 @@
  LIBSUBDIRS += $(XMLLIBSUBDIRS)
  endif
  
 +ifeq (@BSDDB@,yes)
 +LIBSUBDIRS += bsddb
-+ifeq (@TEST_MODULES@,yes)
-+LIBSUBDIRS += bsddb/test
-+endif
++TESTSUBDIRS += bsddb/test
 +endif
 +
  libinstall:	build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
  	@for i in $(SCRIPTDIR) $(LIBDEST); \
  	do \
-Index: Python-2.7.2/configure.in
+Index: b/configure.ac
 ===================================================================
---- Python-2.7.2.orig/configure.in
-+++ Python-2.7.2/configure.in
-@@ -2436,6 +2436,28 @@
+--- a/configure.ac
++++ b/configure.ac
+@@ -2642,6 +2642,28 @@
      	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} nis"
    	  fi])
  
diff --git a/package/python/python-2.7-111-optional-ssl.patch b/package/python/python-111-optional-ssl.patch
similarity index 83%
rename from package/python/python-2.7-111-optional-ssl.patch
rename to package/python/python-111-optional-ssl.patch
index 5885b4e..8d4599d 100644
--- a/package/python/python-2.7-111-optional-ssl.patch
+++ b/package/python/python-111-optional-ssl.patch
@@ -6,11 +6,11 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  configure.in |    6 ++++++
  1 file changed, 6 insertions(+)
 
-Index: Python-2.7.2/configure.in
+Index: b/configure.ac
 ===================================================================
---- Python-2.7.2.orig/configure.in
-+++ Python-2.7.2/configure.in
-@@ -2436,6 +2436,12 @@
+--- a/configure.ac
++++ b/configure.ac
+@@ -2642,6 +2642,12 @@
      	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} nis"
    	  fi])
  
diff --git a/package/python/python-2.7-112-optional-bzip2.patch b/package/python/python-112-optional-bzip2.patch
similarity index 83%
rename from package/python/python-2.7-112-optional-bzip2.patch
rename to package/python/python-112-optional-bzip2.patch
index 83a2479..ba7dbaa 100644
--- a/package/python/python-2.7-112-optional-bzip2.patch
+++ b/package/python/python-112-optional-bzip2.patch
@@ -5,11 +5,11 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  configure.in |    6 ++++++
  1 file changed, 6 insertions(+)
 
-Index: Python-2.7.2/configure.in
+Index: b/configure.ac
 ===================================================================
---- Python-2.7.2.orig/configure.in
-+++ Python-2.7.2/configure.in
-@@ -2442,6 +2442,12 @@
+--- a/configure.ac
++++ b/configure.ac
+@@ -2648,6 +2648,12 @@
      	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} ssl"
    	  fi])
  
diff --git a/package/python/python-2.7-113-optional-zlib.patch b/package/python/python-113-optional-zlib.patch
similarity index 84%
rename from package/python/python-2.7-113-optional-zlib.patch
rename to package/python/python-113-optional-zlib.patch
index f24eb17..19f100b 100644
--- a/package/python/python-2.7-113-optional-zlib.patch
+++ b/package/python/python-113-optional-zlib.patch
@@ -5,11 +5,11 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  configure.in |    6 ++++++
  1 file changed, 6 insertions(+)
 
-Index: Python-2.7.2/configure.in
+Index: b/configure.ac
 ===================================================================
---- Python-2.7.2.orig/configure.in
-+++ Python-2.7.2/configure.in
-@@ -2448,6 +2448,12 @@
+--- a/configure.ac
++++ b/configure.ac
+@@ -2654,6 +2654,12 @@
              DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} bz2"
           fi])
  
diff --git a/package/python/python-2.7-001-support-for-build.patch b/package/python/python-2.7-001-support-for-build.patch
deleted file mode 100644
index b0430a4..0000000
--- a/package/python/python-2.7-001-support-for-build.patch
+++ /dev/null
@@ -1,154 +0,0 @@
-Add support in Python build system to specify host tools
-
-Python needs a Python interpreter and a "pgen" program to build
-itself. Unfortunately, the Python build system assumes that it can use
-the interpreter and pgen program it has just built to build
-itself. Obviously, this cannot work in cross-compilation mode since
-the interpreter and the pgen program have been built for the target.
-
-Therefore, this patch adds support in the Python build system for the
-new PYTHON_FOR_BUILD and PGEN_FOR_BUILD variables, so that we can
-point Python ./configure script to the Python interpreter and pgen
-program that have been previously built for the host.
-
-Patch ported to python2.7 by Maxime Ripard <ripard@archos.com>, and
-later significantly reworked by Thomas Petazzoni
-<thomas.petazzoni@free-electrons.com>, with some inspiration taken
-from the Python patches of the PTXdist project.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- Makefile.pre.in |   32 +++++++++++++++++---------------
- configure.in    |   17 +++++++++++++++++
- 2 files changed, 34 insertions(+), 15 deletions(-)
-
-Index: Python-2.7.2/Makefile.pre.in
-===================================================================
---- Python-2.7.2.orig/Makefile.pre.in
-+++ Python-2.7.2/Makefile.pre.in
-@@ -181,7 +181,8 @@
- UNICODE_OBJS=   @UNICODE_OBJS@
- 
- PYTHON=		python$(EXE)
--BUILDPYTHON=	python$(BUILDEXE)
-+BUILDPYTHON=	./python$(BUILDEXE)
-+PYTHON_FOR_BUILD=@PYTHON_FOR_BUILD@
- 
- # The task to run while instrument when building the profile-opt target
- PROFILE_TASK=	$(srcdir)/Tools/pybench/pybench.py -n 2 --with-gc --with-syscheck
-@@ -213,7 +214,8 @@
- 
- ##########################################################################
- # Parser
--PGEN=		Parser/pgen$(EXE)
-+BUILDPGEN=	Parser/pgen$(EXE)
-+PGEN_FOR_BUILD=@PGEN_FOR_BUILD@
- 
- POBJS=		\
- 		Parser/acceler.o \
-@@ -407,8 +409,8 @@
- # Build the shared modules
- sharedmods: $(BUILDPYTHON)
- 	@case $$MAKEFLAGS in \
--	*s*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' ./$(BUILDPYTHON) -E $(srcdir)/setup.py -q build;; \
--	*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' ./$(BUILDPYTHON) -E $(srcdir)/setup.py build;; \
-+	*s*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' $(PYTHON_FOR_BUILD) -E $(srcdir)/setup.py -q build;; \
-+	*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' $(PYTHON_FOR_BUILD) -E $(srcdir)/setup.py build;; \
- 	esac
- 
- # Build static library
-@@ -540,13 +542,13 @@
- 
- # Use a stamp file to prevent make -j invoking pgen twice
- $(GRAMMAR_H) $(GRAMMAR_C): Parser/pgen.stamp
--Parser/pgen.stamp: $(PGEN) $(GRAMMAR_INPUT)
-+Parser/pgen.stamp: $(PGEN_FOR_BUILD) $(GRAMMAR_INPUT)
- 		-@$(INSTALL) -d Include
--		$(PGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
-+		$(PGEN_FOR_BUILD) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
- 		-touch Parser/pgen.stamp
- 
--$(PGEN):	$(PGENOBJS)
--		$(CC) $(OPT) $(LDFLAGS) $(PGENOBJS) $(LIBS) -o $(PGEN)
-+$(BUILDPGEN):	$(PGENOBJS)
-+		$(CC) $(OPT) $(LDFLAGS) $(PGENOBJS) $(LIBS) -o $(BUILDPGEN)
- 
- Parser/grammar.o:	$(srcdir)/Parser/grammar.c \
- 				$(srcdir)/Include/token.h \
-@@ -926,25 +928,25 @@
- 	done
- 	$(INSTALL_DATA) $(srcdir)/LICENSE $(DESTDIR)$(LIBDEST)/LICENSE.txt
- 	PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
--		./$(BUILDPYTHON) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py \
-+		$(PYTHON_FOR_BUILD) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py \
- 		-d $(LIBDEST) -f \
- 		-x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data' \
- 		$(DESTDIR)$(LIBDEST)
- 	PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
--		./$(BUILDPYTHON) -Wi -tt -O $(DESTDIR)$(LIBDEST)/compileall.py \
-+		$(PYTHON_FOR_BUILD) -Wi -tt -O $(DESTDIR)$(LIBDEST)/compileall.py \
- 		-d $(LIBDEST) -f \
- 		-x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data' \
- 		$(DESTDIR)$(LIBDEST)
- 	-PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
--		./$(BUILDPYTHON) -Wi -t $(DESTDIR)$(LIBDEST)/compileall.py \
-+		$(PYTHON_FOR_BUILD) -Wi -t $(DESTDIR)$(LIBDEST)/compileall.py \
- 		-d $(LIBDEST)/site-packages -f \
- 		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
- 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
--		./$(BUILDPYTHON) -Wi -t -O $(DESTDIR)$(LIBDEST)/compileall.py \
-+		$(PYTHON_FOR_BUILD) -Wi -t -O $(DESTDIR)$(LIBDEST)/compileall.py \
- 		-d $(LIBDEST)/site-packages -f \
- 		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
- 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
--		./$(BUILDPYTHON) -Wi -t -c "import lib2to3.pygram, lib2to3.patcomp;lib2to3.patcomp.PatternCompiler()"
-+		$(PYTHON_FOR_BUILD) -Wi -t -c "import lib2to3.pygram, lib2to3.patcomp;lib2to3.patcomp.PatternCompiler()"
- 
- # Create the PLATDIR source directory, if one wasn't distributed..
- $(srcdir)/Lib/$(PLATDIR):
-@@ -1049,7 +1051,7 @@
- # Install the dynamically loadable modules
- # This goes into $(exec_prefix)
- sharedinstall: sharedmods
--	$(RUNSHARED) ./$(BUILDPYTHON) -E $(srcdir)/setup.py install \
-+	$(RUNSHARED) $(PYTHON_FOR_BUILD) -E $(srcdir)/setup.py install \
- 	   	--prefix=$(prefix) \
- 		--install-scripts=$(BINDIR) \
- 		--install-platlib=$(DESTSHARED) \
-@@ -1188,7 +1190,7 @@
- 	find . -name '*.gc??' -exec rm -f {} ';'
- 
- clobber: clean profile-removal
--	-rm -f $(BUILDPYTHON) $(PGEN) $(LIBRARY) $(LDLIBRARY) $(DLLLIBRARY) \
-+	-rm -f $(BUILDPYTHON) $(BUILDPGEN) $(LIBRARY) $(LDLIBRARY) $(DLLLIBRARY) \
- 		tags TAGS Parser/pgen.stamp \
- 		config.cache config.log pyconfig.h Modules/config.c
- 	-rm -rf build platform
-Index: Python-2.7.2/configure.in
-===================================================================
---- Python-2.7.2.orig/configure.in
-+++ Python-2.7.2/configure.in
-@@ -4305,6 +4305,23 @@
- done
- AC_MSG_RESULT(done)
- 
-+if test "$cross_compiling" = "yes"; then
-+   AC_MSG_CHECKING(python for build)
-+   PYTHON_FOR_BUILD="${PYTHON_FOR_BUILD}"
-+   AC_MSG_RESULT($PYTHON_FOR_BUILD)
-+   AC_MSG_CHECKING(pgen for build)
-+   PGEN_FOR_BUILD="${PGEN_FOR_BUILD}"
-+   AC_MSG_RESULT($PGEN_FOR_BUILD)
-+else
-+   PYTHON_FOR_BUILD='$(BUILDPYTHON)'
-+   PGEN_FOR_BUILD='$(BUILDPGEN)'
-+fi
-+
-+AC_SUBST(PYTHON_FOR_BUILD)
-+AC_SUBST(PGEN_FOR_BUILD)
-+AC_ARG_VAR(PYTHON_FOR_BUILD,[build system Python])
-+AC_ARG_VAR(PGEN_FOR_BUILD,[build system Python pgen])
-+
- # generate output files
- AC_CONFIG_FILES(Makefile.pre Modules/Setup.config Misc/python.pc)
- AC_CONFIG_FILES([Modules/ld_so_aix], [chmod +x Modules/ld_so_aix])
diff --git a/package/python/python-2.7-002-cross-compile-variable.patch b/package/python/python-2.7-002-cross-compile-variable.patch
deleted file mode 100644
index f91ee71..0000000
--- a/package/python/python-2.7-002-cross-compile-variable.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-Pass a CROSS_COMPILING variable to setup.py
-
-The setup.py script in the Python source code plays a significant role
-in the Python build process. It is responsible for building all the
-modules and extensions, and due to this, does various checks that need
-to be adjusted when we are cross-compiling.
-
-For that reason, this patch makes sure that a CROSS_COMPILING variable
-is passed in the environment of the setup.py script. Later patches in
-the stack make use of this variable.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- Makefile.pre.in |    6 +++---
- configure.in    |    3 +++
- 2 files changed, 6 insertions(+), 3 deletions(-)
-
-Index: Python-2.7.2/Makefile.pre.in
-===================================================================
---- Python-2.7.2.orig/Makefile.pre.in
-+++ Python-2.7.2/Makefile.pre.in
-@@ -409,8 +409,8 @@
- # Build the shared modules
- sharedmods: $(BUILDPYTHON)
- 	@case $$MAKEFLAGS in \
--	*s*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' $(PYTHON_FOR_BUILD) -E $(srcdir)/setup.py -q build;; \
--	*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' $(PYTHON_FOR_BUILD) -E $(srcdir)/setup.py build;; \
-+	*s*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' CROSS_COMPILING=@CROSS_COMPILING@ $(PYTHON_FOR_BUILD) -E $(srcdir)/setup.py -q build;; \
-+	*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' CROSS_COMPILING=@CROSS_COMPILING@ $(PYTHON_FOR_BUILD) -E $(srcdir)/setup.py build;; \
- 	esac
- 
- # Build static library
-@@ -1051,7 +1051,7 @@
- # Install the dynamically loadable modules
- # This goes into $(exec_prefix)
- sharedinstall: sharedmods
--	$(RUNSHARED) $(PYTHON_FOR_BUILD) -E $(srcdir)/setup.py install \
-+	$(RUNSHARED) CROSS_COMPILING=@CROSS_COMPILING@ $(PYTHON_FOR_BUILD) -E $(srcdir)/setup.py install \
- 	   	--prefix=$(prefix) \
- 		--install-scripts=$(BINDIR) \
- 		--install-platlib=$(DESTSHARED) \
-Index: Python-2.7.2/configure.in
-===================================================================
---- Python-2.7.2.orig/configure.in
-+++ Python-2.7.2/configure.in
-@@ -4322,6 +4322,9 @@
- AC_ARG_VAR(PYTHON_FOR_BUILD,[build system Python])
- AC_ARG_VAR(PGEN_FOR_BUILD,[build system Python pgen])
- 
-+CROSS_COMPILING=$cross_compiling
-+AC_SUBST(CROSS_COMPILING)
-+
- # generate output files
- AC_CONFIG_FILES(Makefile.pre Modules/Setup.config Misc/python.pc)
- AC_CONFIG_FILES([Modules/ld_so_aix], [chmod +x Modules/ld_so_aix])
diff --git a/package/python/python-2.7-003-no-import-when-cross-compiling.patch b/package/python/python-2.7-003-no-import-when-cross-compiling.patch
deleted file mode 100644
index 17d6702..0000000
--- a/package/python/python-2.7-003-no-import-when-cross-compiling.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Disable import check when cross-compiling
-
-Once Python has compiled an extension (i.e some C code, potentially
-linked to a library), it tries to import it. This cannot work in
-cross-compilation mode, so we just disable this check.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- setup.py |    4 ++++
- 1 file changed, 4 insertions(+)
-
-Index: Python-2.7.2/setup.py
-===================================================================
---- Python-2.7.2.orig/setup.py
-+++ Python-2.7.2/setup.py
-@@ -304,6 +304,10 @@
-             self.announce('WARNING: skipping import check for Cygwin-based "%s"'
-                 % ext.name)
-             return
-+        if os.environ.get('CROSS_COMPILING') == 'yes':
-+            self.announce('WARNING: skipping import check for cross compiled "%s"'
-+                          % ext.name)
-+            return
-         ext_filename = os.path.join(
-             self.build_lib,
-             self.get_ext_filename(self.get_ext_fullname(ext.name)))
diff --git a/package/python/python-2.7-004-no-host-headers-libs.patch b/package/python/python-2.7-004-no-host-headers-libs.patch
deleted file mode 100644
index c0c528a..0000000
--- a/package/python/python-2.7-004-no-host-headers-libs.patch
+++ /dev/null
@@ -1,111 +0,0 @@
-Do not look at host headers/libraries in cross-compile mode
-
-When we are cross-compiling, setup.py should never look in /usr or
-/usr/local to find headers or libraries. A later patch adds a
-mechanism to tell setup.py to look in a specific directory for headers
-and libraries.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- setup.py |   39 +++++++++++++++++++++------------------
- 1 file changed, 21 insertions(+), 18 deletions(-)
-
-Index: Python-2.7.2/setup.py
-===================================================================
---- Python-2.7.2.orig/setup.py
-+++ Python-2.7.2/setup.py
-@@ -373,9 +373,10 @@
- 
-     def detect_modules(self):
-         # Ensure that /usr/local is always used
--        add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
--        add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
--        self.add_multiarch_paths()
-+        if os.environ.get('CROSS_COMPILING') != 'yes':
-+            add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
-+            add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
-+            self.add_multiarch_paths()
- 
-         # Add paths specified in the environment variables LDFLAGS and
-         # CPPFLAGS for header and library files.
-@@ -383,10 +384,7 @@
-         # directly since an inconsistently reproducible issue comes up where
-         # the environment variable is not set even though the value were passed
-         # into configure and stored in the Makefile (issue found on OS X 10.3).
--        for env_var, arg_name, dir_list in (
--                ('LDFLAGS', '-R', self.compiler.runtime_library_dirs),
--                ('LDFLAGS', '-L', self.compiler.library_dirs),
--                ('CPPFLAGS', '-I', self.compiler.include_dirs)):
-+        for env_var, arg_name, dir_list in ():
-             env_val = sysconfig.get_config_var(env_var)
-             if env_val:
-                 # To prevent optparse from raising an exception about any
-@@ -411,17 +409,6 @@
-                     for directory in reversed(options.dirs):
-                         add_dir_to_list(dir_list, directory)
- 
--        if os.path.normpath(sys.prefix) != '/usr' \
--                and not sysconfig.get_config_var('PYTHONFRAMEWORK'):
--            # OSX note: Don't add LIBDIR and INCLUDEDIR to building a framework
--            # (PYTHONFRAMEWORK is set) to avoid # linking problems when
--            # building a framework with different architectures than
--            # the one that is currently installed (issue #7473)
--            add_dir_to_list(self.compiler.library_dirs,
--                            sysconfig.get_config_var("LIBDIR"))
--            add_dir_to_list(self.compiler.include_dirs,
--                            sysconfig.get_config_var("INCLUDEDIR"))
--
-         try:
-             have_unicode = unicode
-         except NameError:
-@@ -430,11 +417,16 @@
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
-+
-+        if os.environ.get('CROSS_COMPILING') != 'yes':
-+            lib_dirs += [
-+                '/lib64', '/usr/lib64',
-+                '/lib', '/usr/lib',
-+                ]
-+            inc_dirs += ['/usr/include']
-+
-         exts = []
-         missing = []
- 
-@@ -867,6 +859,9 @@
-             db_inc_paths.append('/pkg/db-3.%d/include' % x)
-             db_inc_paths.append('/opt/db-3.%d/include' % x)
- 
-+        if os.environ.get('CROSS_COMPILING') == 'yes':
-+            db_inc_paths = []
-+
-         # Add some common subdirectories for Sleepycat DB to the list,
-         # based on the standard include directories. This way DB3/4 gets
-         # picked up when it is installed in a non-standard prefix and
-@@ -1019,6 +1014,9 @@
-         MIN_SQLITE_VERSION = ".".join([str(x)
-                                     for x in MIN_SQLITE_VERSION_NUMBER])
- 
-+        if os.environ.get('CROSS_COMPILING') == 'yes':
-+            sqlite_inc_paths = []
-+
-         # Scan the default include directories before the SQLite specific
-         # ones. This allows one to override the copy of sqlite on OSX,
-         # where /usr/include contains an old version of sqlite.
-@@ -1118,6 +1116,8 @@
-         # the more recent berkeleydb's db.h file first in the include path
-         # when attempting to compile and it will fail.
-         f = "/usr/include/db.h"
-+        if os.environ.get('CROSS_COMPILING') == 'yes':
-+            f = ''
- 
-         if sys.platform == 'darwin':
-             if is_macosx_sdk_path(f):
diff --git a/package/python/python-2.7-005-staging-headers-libs.patch b/package/python/python-2.7-005-staging-headers-libs.patch
deleted file mode 100644
index cd378f2..0000000
--- a/package/python/python-2.7-005-staging-headers-libs.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-Tell setup.py the location of headers/libraries
-
-Allow the libraries detection routine to look for headers and libs in
-other directories than /usr/include or /usr/lib through the
-environment variables PYTHON_MODULES_INCLUDE and PYTHON_MODULES_LIB.
-
-We can then use it to look for libraries in the buildroot staging
-directory.
-
-Patch ported to python2.7 by Maxime Ripard <ripard@archos.com>
----
- setup.py |   13 +++++++++++++
- 1 file changed, 13 insertions(+)
-
-Index: Python-2.7.2/setup.py
-===================================================================
---- Python-2.7.2.orig/setup.py
-+++ Python-2.7.2/setup.py
-@@ -372,6 +372,19 @@
-             os.unlink(tmpfile)
- 
-     def detect_modules(self):
-+        try:
-+            modules_include_dirs = os.environ["PYTHON_MODULES_INCLUDE"].split()
-+        except KeyError:
-+            modules_include_dirs = ['/usr/include']
-+        try:
-+            modules_lib_dirs = os.environ["PYTHON_MODULES_LIB"].split()
-+        except KeyError:
-+            modules_lib_dirs = ['/usr/lib']
-+        for dir in modules_include_dirs:
-+            add_dir_to_list(self.compiler.include_dirs, dir)
-+        for dir in modules_lib_dirs:
-+            add_dir_to_list(self.compiler.library_dirs, dir)
-+
-         # Ensure that /usr/local is always used
-         if os.environ.get('CROSS_COMPILING') != 'yes':
-             add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
diff --git a/package/python/python-2.7-006-disable-extensions.patch b/package/python/python-2.7-006-disable-extensions.patch
deleted file mode 100644
index f62a50f..0000000
--- a/package/python/python-2.7-006-disable-extensions.patch
+++ /dev/null
@@ -1,102 +0,0 @@
-Add infrastructure to disable the build of certain extensions
-
-Some of the extensions part of the Python core have dependencies on
-external libraries (sqlite, tk, etc.) or are relatively big and not
-necessarly always useful (CJK codecs for example). By extensions, we
-mean part of Python modules that are written in C and therefore
-compiled to binary code.
-
-Therefore, we introduce a small infrastructure that allows to disable
-some of those extensions. This can be done inside the configure.in by
-adding values to the DISABLED_EXTENSIONS variable (which is a
-word-separated list of extensions).
-
-The implementation works as follow :
-
- * configure.in defines a DISABLED_EXTENSIONS variable, which is
-   substituted (so that when Makefile.pre is generated from
-   Makefile.pre.in, the value of the variable is substituted). For
-   now, this DISABLED_EXTENSIONS variable is empty, later patches will
-   use it.
-
- * Makefile.pre.in passes the DISABLED_EXTENSIONS value down to the
-   variables passed in the environment when calling the setup.py
-   script that actually builds and installs those extensions.
-
- * setup.py is modified so that the existing "disabled_module_list" is
-   filled with those pre-disabled extensions listed in
-   DISABLED_EXTENSIONS.
-
-Patch ported to python2.7 by Maxime Ripard <ripard@archos.com>, and
-then extended by Thomas Petazzoni
-<thomas.petazzoni@free-electrons.com>.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- Makefile.pre.in |    8 +++++---
- configure.in    |    2 ++
- setup.py        |    5 ++++-
- 3 files changed, 11 insertions(+), 4 deletions(-)
-
-Index: Python-2.7.2/Makefile.pre.in
-===================================================================
---- Python-2.7.2.orig/Makefile.pre.in
-+++ Python-2.7.2/Makefile.pre.in
-@@ -144,6 +144,8 @@
- # configure script arguments
- CONFIG_ARGS=	@CONFIG_ARGS@
- 
-+# disabled extensions
-+DISABLED_EXTENSIONS=	@DISABLED_EXTENSIONS@
- 
- # Subdirectories with code
- SRCDIRS= 	@SRCDIRS@
-@@ -409,8 +411,8 @@
- # Build the shared modules
- sharedmods: $(BUILDPYTHON)
- 	@case $$MAKEFLAGS in \
--	*s*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' CROSS_COMPILING=@CROSS_COMPILING@ $(PYTHON_FOR_BUILD) -E $(srcdir)/setup.py -q build;; \
--	*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' CROSS_COMPILING=@CROSS_COMPILING@ $(PYTHON_FOR_BUILD) -E $(srcdir)/setup.py build;; \
-+	*s*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' CROSS_COMPILING=@CROSS_COMPILING@ DISABLED_EXTENSIONS="$(DISABLED_EXTENSIONS)" $(PYTHON_FOR_BUILD) -E $(srcdir)/setup.py -q build;; \
-+	*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' CROSS_COMPILING=@CROSS_COMPILING@ DISABLED_EXTENSIONS="$(DISABLED_EXTENSIONS)" $(PYTHON_FOR_BUILD) -E $(srcdir)/setup.py build;; \
- 	esac
- 
- # Build static library
-@@ -1051,7 +1053,7 @@
- # Install the dynamically loadable modules
- # This goes into $(exec_prefix)
- sharedinstall: sharedmods
--	$(RUNSHARED) CROSS_COMPILING=@CROSS_COMPILING@ $(PYTHON_FOR_BUILD) -E $(srcdir)/setup.py install \
-+	$(RUNSHARED) CROSS_COMPILING=@CROSS_COMPILING@ DISABLED_EXTENSIONS="$(DISABLED_EXTENSIONS)" $(PYTHON_FOR_BUILD) -E $(srcdir)/setup.py install \
- 	   	--prefix=$(prefix) \
- 		--install-scripts=$(BINDIR) \
- 		--install-platlib=$(DESTSHARED) \
-Index: Python-2.7.2/configure.in
-===================================================================
---- Python-2.7.2.orig/configure.in
-+++ Python-2.7.2/configure.in
-@@ -2098,6 +2098,8 @@
- 
- AC_PATH_TOOL([PKG_CONFIG], [pkg-config])
- 
-+AC_SUBST(DISABLED_EXTENSIONS)
-+
- # Check for use of the system expat library
- AC_MSG_CHECKING(for --with-system-expat)
- AC_ARG_WITH(system_expat,
-Index: Python-2.7.2/setup.py
-===================================================================
---- Python-2.7.2.orig/setup.py
-+++ Python-2.7.2/setup.py
-@@ -21,7 +21,10 @@
- COMPILED_WITH_PYDEBUG = hasattr(sys, 'gettotalrefcount')
- 
- # This global variable is used to hold the list of modules to be disabled.
--disabled_module_list = []
-+try:
-+    disabled_module_list = sysconfig.get_config_var("DISABLED_EXTENSIONS").split(" ")
-+except KeyError:
-+    disabled_module_list = list()
- 
- def add_dir_to_list(dirlist, dir):
-     """Add the directory 'dir' to the list 'dirlist' (at the front) if
diff --git a/package/python/python-2.7-007-do-not-generate-pyo-files.patch b/package/python/python-2.7-007-do-not-generate-pyo-files.patch
deleted file mode 100644
index 4ae5ef5..0000000
--- a/package/python/python-2.7-007-do-not-generate-pyo-files.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-Do not generate .pyo files
-
-By default, the Python installation byte-compiles all modules in two
-forms: the normal bytecode (.pyc) and an optimized bytecode (.pyo).
-
-According to
-http://www.network-theory.co.uk/docs/pytut/CompiledPythonfiles.html,
-the optimization do not do anything useful, and generating both the
-"non-optimized" and "optimized" bytecode variants takes time.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- Makefile.pre.in |    9 ---------
- 1 file changed, 9 deletions(-)
-
-Index: Python-2.7.2/Makefile.pre.in
-===================================================================
---- Python-2.7.2.orig/Makefile.pre.in
-+++ Python-2.7.2/Makefile.pre.in
-@@ -934,20 +934,11 @@
- 		-d $(LIBDEST) -f \
- 		-x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data' \
- 		$(DESTDIR)$(LIBDEST)
--	PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
--		$(PYTHON_FOR_BUILD) -Wi -tt -O $(DESTDIR)$(LIBDEST)/compileall.py \
--		-d $(LIBDEST) -f \
--		-x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data' \
--		$(DESTDIR)$(LIBDEST)
- 	-PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
- 		$(PYTHON_FOR_BUILD) -Wi -t $(DESTDIR)$(LIBDEST)/compileall.py \
- 		-d $(LIBDEST)/site-packages -f \
- 		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
- 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
--		$(PYTHON_FOR_BUILD) -Wi -t -O $(DESTDIR)$(LIBDEST)/compileall.py \
--		-d $(LIBDEST)/site-packages -f \
--		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
--	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
- 		$(PYTHON_FOR_BUILD) -Wi -t -c "import lib2to3.pygram, lib2to3.patcomp;lib2to3.patcomp.PatternCompiler()"
- 
- # Create the PLATDIR source directory, if one wasn't distributed..
diff --git a/package/python/python-2.7-008-reread-environment.patch b/package/python/python-2.7-008-reread-environment.patch
deleted file mode 100644
index 4ca22a4..0000000
--- a/package/python/python-2.7-008-reread-environment.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-Make sure setup.py reads the correct CONFIG_ARGS
-
-The setup.py script that builds and installs all the Python modules
-shipped with the interpreter looks at the CONFIG_ARGS variable stored
-in the "sysconfig" module to look at the ./configure options and
-adjust its behaviour accordingly.
-
-Unfortunately, when cross-compiling, the value of CONFIG_ARGS returned
-by the sysconfig are the one passed to the ./configure script of the
-*host* Python and not the one we're currently building for the target.
-
-In order to avoid that, we re-initialize the values in the sysconfig
-module by re-reading the environment at the beginning of the setup.py
-script, and we make sure that the CONFIG_ARGS variable is actually
-part of the environment of setup.py.
-
-See the beginning of
-http://article.gmane.org/gmane.comp.python.devel/99772 for the
-inspiration.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
----
- Makefile.pre.in |    6 +++---
- setup.py        |    3 +++
- 2 files changed, 6 insertions(+), 3 deletions(-)
-
-Index: Python-2.7.2/Makefile.pre.in
-===================================================================
---- Python-2.7.2.orig/Makefile.pre.in
-+++ Python-2.7.2/Makefile.pre.in
-@@ -411,8 +411,8 @@
- # Build the shared modules
- sharedmods: $(BUILDPYTHON)
- 	@case $$MAKEFLAGS in \
--	*s*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' CROSS_COMPILING=@CROSS_COMPILING@ DISABLED_EXTENSIONS="$(DISABLED_EXTENSIONS)" $(PYTHON_FOR_BUILD) -E $(srcdir)/setup.py -q build;; \
--	*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' CROSS_COMPILING=@CROSS_COMPILING@ DISABLED_EXTENSIONS="$(DISABLED_EXTENSIONS)" $(PYTHON_FOR_BUILD) -E $(srcdir)/setup.py build;; \
-+	*s*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' CROSS_COMPILING=@CROSS_COMPILING@ DISABLED_EXTENSIONS="$(DISABLED_EXTENSIONS)" CONFIG_ARGS="$(CONFIG_ARGS)" $(PYTHON_FOR_BUILD) -E $(srcdir)/setup.py -q build;; \
-+	*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' CROSS_COMPILING=@CROSS_COMPILING@ DISABLED_EXTENSIONS="$(DISABLED_EXTENSIONS)" CONFIG_ARGS="$(CONFIG_ARGS)" $(PYTHON_FOR_BUILD) -E $(srcdir)/setup.py build;; \
- 	esac
- 
- # Build static library
-@@ -1044,7 +1044,7 @@
- # Install the dynamically loadable modules
- # This goes into $(exec_prefix)
- sharedinstall: sharedmods
--	$(RUNSHARED) CROSS_COMPILING=@CROSS_COMPILING@ DISABLED_EXTENSIONS="$(DISABLED_EXTENSIONS)" $(PYTHON_FOR_BUILD) -E $(srcdir)/setup.py install \
-+	$(RUNSHARED) CROSS_COMPILING=@CROSS_COMPILING@ DISABLED_EXTENSIONS="$(DISABLED_EXTENSIONS)" CONFIG_ARGS="$(CONFIG_ARGS)" $(PYTHON_FOR_BUILD) -E $(srcdir)/setup.py install \
- 	   	--prefix=$(prefix) \
- 		--install-scripts=$(BINDIR) \
- 		--install-platlib=$(DESTSHARED) \
-Index: Python-2.7.2/setup.py
-===================================================================
---- Python-2.7.2.orig/setup.py
-+++ Python-2.7.2/setup.py
-@@ -20,6 +20,9 @@
- # Were we compiled --with-pydebug or with #define Py_DEBUG?
- COMPILED_WITH_PYDEBUG = hasattr(sys, 'gettotalrefcount')
- 
-+sysconfig.get_config_vars()
-+sysconfig._CONFIG_VARS.update(os.environ)
-+
- # This global variable is used to hold the list of modules to be disabled.
- try:
-     disabled_module_list = sysconfig.get_config_var("DISABLED_EXTENSIONS").split(" ")
diff --git a/package/python/python-2.7-010-change-pyconfig-h-location.patch b/package/python/python-2.7-010-change-pyconfig-h-location.patch
deleted file mode 100644
index 9b95ddb..0000000
--- a/package/python/python-2.7-010-change-pyconfig-h-location.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-Change the location of pyconfig.h
-
-The Python interpreter has a really strange behaviour: at *runtime*,
-it reads a Makefile and a header file named pyconfig.h to get some
-information about the configuration.
-
-The Makefile is located in usr/lib/python2.7/config, which is fine
-since this location is kept on the target.
-
-However, by default, the pyconfig.h is installed in
-usr/include/python2.7, but we completely remove the usr/include
-directory for the target. Since making an exception just for
-pyconfig.h is annoying, this patch also installs pyconfig.h to
-usr/lib/python2.7/config, and modifies the sysconfig module so that it
-looks in this location instead of usr/include.
-
-The pyconfig.h is still kept in usr/include/python2.7, because it is
-needed in the $(STAGING_DIR) when building third-party Python
-extensions that contain C code.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
----
- Lib/distutils/sysconfig.py |    3 ++-
- Lib/sysconfig.py           |    2 +-
- Makefile.pre.in            |    3 ++-
- 3 files changed, 5 insertions(+), 3 deletions(-)
-
-Index: Python-2.7.2/Lib/distutils/sysconfig.py
-===================================================================
---- Python-2.7.2.orig/Lib/distutils/sysconfig.py
-+++ Python-2.7.2/Lib/distutils/sysconfig.py
-@@ -193,7 +193,8 @@
-         else:
-             inc_dir = project_base
-     else:
--        inc_dir = get_python_inc(plat_specific=1)
-+        lib_dir = get_python_lib(plat_specific=1, standard_lib=1)
-+        inc_dir = os.path.join(lib_dir, "config")
-     if get_python_version() < '2.2':
-         config_h = 'config.h'
-     else:
-Index: Python-2.7.2/Lib/sysconfig.py
-===================================================================
---- Python-2.7.2.orig/Lib/sysconfig.py
-+++ Python-2.7.2/Lib/sysconfig.py
-@@ -356,7 +356,7 @@
-         else:
-             inc_dir = _PROJECT_BASE
-     else:
--        inc_dir = get_path('platinclude')
-+        inc_dir = os.path.join(get_path('stdlib'), "config")
-     return os.path.join(inc_dir, 'pyconfig.h')
- 
- def get_scheme_names():
-Index: Python-2.7.2/Makefile.pre.in
-===================================================================
---- Python-2.7.2.orig/Makefile.pre.in
-+++ Python-2.7.2/Makefile.pre.in
-@@ -972,7 +972,6 @@
- 		echo $(INSTALL_DATA) $$i $(INCLUDEPY); \
- 		$(INSTALL_DATA) $$i $(DESTDIR)$(INCLUDEPY); \
- 	done
--	$(INSTALL_DATA) pyconfig.h $(DESTDIR)$(CONFINCLUDEPY)/pyconfig.h
- 
- # Install the library and miscellaneous stuff needed for extending/embedding
- # This goes into $(exec_prefix)
-@@ -1006,6 +1005,8 @@
- 	$(INSTALL_DATA) Modules/python.o $(DESTDIR)$(LIBPL)/python.o
- 	$(INSTALL_DATA) $(srcdir)/Modules/config.c.in $(DESTDIR)$(LIBPL)/config.c.in
- 	$(INSTALL_DATA) Makefile $(DESTDIR)$(LIBPL)/Makefile
-+	$(INSTALL_DATA) pyconfig.h $(DESTDIR)$(LIBPL)/pyconfig.h
-+	$(INSTALL_DATA) pyconfig.h $(DESTDIR)$(CONFINCLUDEPY)/pyconfig.h
- 	$(INSTALL_DATA) Modules/Setup $(DESTDIR)$(LIBPL)/Setup
- 	$(INSTALL_DATA) Modules/Setup.local $(DESTDIR)$(LIBPL)/Setup.local
- 	$(INSTALL_DATA) Modules/Setup.config $(DESTDIR)$(LIBPL)/Setup.config
diff --git a/package/python/python-2.7-011-no-rpath.patch b/package/python/python-2.7-011-no-rpath.patch
deleted file mode 100644
index 3422dce..0000000
--- a/package/python/python-2.7-011-no-rpath.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-Remove runtime library paths
-
-For some extensions (bsddb, sqlite and dbm), Python setup.py script
-hardcode a runtime path (rpath) into the extension. However, this
-runtime path is incorrect (because it points to the location of the
-library directory on the development machine) and useless (because on
-the target, all useful libraries are in a standard directory searched
-by the dynamic loader). For those reasons, we just get rid of the
-runtime paths in cross-compilation mode.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- setup.py |   21 ++++++++++++++++++---
- 1 file changed, 18 insertions(+), 3 deletions(-)
-
-Index: Python-2.7.2/setup.py
-===================================================================
---- Python-2.7.2.orig/setup.py
-+++ Python-2.7.2/setup.py
-@@ -997,6 +997,12 @@
-                 print "bsddb lib dir:", dblib_dir, " inc dir:", db_incdir
-             db_incs = [db_incdir]
-             dblibs = [dblib]
-+
-+            if os.environ.get('CROSS_COMPILING') == 'yes':
-+                bsddb_runtime_library_dir = None
-+            else:
-+                bsddb_runtime_library_dir = dblib_dir
-+
-             # We add the runtime_library_dirs argument because the
-             # BerkeleyDB lib we're linking against often isn't in the
-             # system dynamic library search path.  This is usually
-@@ -1006,7 +1012,7 @@
-             exts.append(Extension('_bsddb', ['_bsddb.c'],
-                                   depends = ['bsddb.h'],
-                                   library_dirs=dblib_dir,
--                                  runtime_library_dirs=dblib_dir,
-+                                  runtime_library_dirs=bsddb_runtime_library_dir,
-                                   include_dirs=db_incs,
-                                   libraries=dblibs))
-         else:
-@@ -1112,12 +1118,17 @@
-             else:
-                 sqlite_extra_link_args = ()
- 
-+            if os.environ.get('CROSS_COMPILING') == 'yes':
-+                sqlite_runtime_library_dirs = None
-+            else:
-+                sqlite_runtime_library_dirs = sqlite_libdir
-+
-             exts.append(Extension('_sqlite3', sqlite_srcs,
-                                   define_macros=sqlite_defines,
-                                   include_dirs=["Modules/_sqlite",
-                                                 sqlite_incdir],
-                                   library_dirs=sqlite_libdir,
--                                  runtime_library_dirs=sqlite_libdir,
-+                                  runtime_library_dirs=sqlite_runtime_library_dirs,
-                                   extra_link_args=sqlite_extra_link_args,
-                                   libraries=["sqlite3",]))
-         else:
-@@ -1218,9 +1229,13 @@
-                 elif cand == "bdb":
-                     if db_incs is not None:
-                         print "building dbm using bdb"
-+                        if os.environ.get('CROSS_COMPILING') == 'yes':
-+                            db_runtime_library_dir = None
-+                        else:
-+                            db_runtime_library_dir = dblib_dir
-                         dbmext = Extension('dbm', ['dbmmodule.c'],
-                                            library_dirs=dblib_dir,
--                                           runtime_library_dirs=dblib_dir,
-+                                           runtime_library_dirs=db_runtime_library_dir,
-                                            include_dirs=db_incs,
-                                            define_macros=[
-                                                ('HAVE_BERKDB_H', None),
diff --git a/package/python/python-2.7-012-correct-32bit-64bit-check.patch b/package/python/python-2.7-012-correct-32bit-64bit-check.patch
deleted file mode 100644
index bfccbfd..0000000
--- a/package/python/python-2.7-012-correct-32bit-64bit-check.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-Use correct mechanism to determine 32/64 bits
-
-Python setup.py builds certain extensions (dl and imageop) only on 32
-bits architecture. However, to test whether the architecture is 32
-bits or not, it was looking at the sys.maxint value of the host Python
-interpreter... which might run on a 64 bits architecture even though
-the target is 32 bits, or which might run on a 32 bits architecture
-even though the target is 64 bits.
-
-Therefore, we introduce a is_arch_64_bits() function, which looks at
-the pyconfig.h file generated by ./configure for the value of
-SIZEOF_LONG to determine if the architecture is 32 or 64 bits.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- setup.py |   12 ++++++++++--
- 1 file changed, 10 insertions(+), 2 deletions(-)
-
-Index: Python-2.7.2/setup.py
-===================================================================
---- Python-2.7.2.orig/setup.py
-+++ Python-2.7.2/setup.py
-@@ -29,6 +29,14 @@
- except KeyError:
-     disabled_module_list = list()
- 
-+def is_arch_64_bits():
-+    data = open('pyconfig.h').read()
-+    m = re.search(r"#s*define\s+SIZEOF_LONG\s+4\s*", data)
-+    if m is None:
-+        return True
-+    else:
-+        return False
-+
- def add_dir_to_list(dirlist, dir):
-     """Add the directory 'dir' to the list 'dirlist' (at the front) if
-     1) 'dir' is not already in 'dirlist'
-@@ -628,7 +636,7 @@
-         exts.append( Extension('audioop', ['audioop.c']) )
- 
-         # Disabled on 64-bit platforms
--        if sys.maxint != 9223372036854775807L:
-+        if not is_arch_64_bits():
-             # Operations on images
-             exts.append( Extension('imageop', ['imageop.c']) )
-         else:
-@@ -1444,7 +1452,7 @@
-                 missing.append('_codecs_%s' % loc)
- 
-         # Dynamic loading module
--        if sys.maxint == 0x7fffffff:
-+        if not is_arch_64_bits():
-             # This requires sizeof(int) == sizeof(long) == sizeof(char*)
-             dl_inc = find_file('dlfcn.h', [], inc_dirs)
-             if (dl_inc is not None) and (platform not in ['atheos']):
diff --git a/package/python/python-2.7-013-fix-linux-3-compilation.patch b/package/python/python-2.7-013-fix-linux-3-compilation.patch
deleted file mode 100644
index e834b9f..0000000
--- a/package/python/python-2.7-013-fix-linux-3-compilation.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Index: Python-2.7.2/configure
-===================================================================
---- Python-2.7.2.orig/configure
-+++ Python-2.7.2/configure
-@@ -3007,6 +3007,7 @@
- 	darwin*) MACHDEP="darwin";;
- 	atheos*) MACHDEP="atheos";;
-         irix646) MACHDEP="irix6";;
-+        linux*) MACHDEP="linux2";;
- 	'')	MACHDEP="unknown";;
- 	esac
- fi
-Index: Python-2.7.2/configure.in
-===================================================================
---- Python-2.7.2.orig/configure.in
-+++ Python-2.7.2/configure.in
-@@ -297,6 +297,7 @@
- 	darwin*) MACHDEP="darwin";;
- 	atheos*) MACHDEP="atheos";;
-         irix646) MACHDEP="irix6";;
-+        linux*) MACHDEP="linux2";;
- 	'')	MACHDEP="unknown";;
- 	esac
- fi
diff --git a/package/python/python-2.7-014-verbose-module-build.patch b/package/python/python-2.7-014-verbose-module-build.patch
deleted file mode 100644
index ea81e55..0000000
--- a/package/python/python-2.7-014-verbose-module-build.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Enables verbose output when building modules
-
-Patch borrowed from OpenBricks.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: Python-2.7.2/Makefile.pre.in
-===================================================================
---- Python-2.7.2.orig/Makefile.pre.in
-+++ Python-2.7.2/Makefile.pre.in
-@@ -411,7 +411,7 @@
- # Build the shared modules
- sharedmods: $(BUILDPYTHON)
- 	@case $$MAKEFLAGS in \
--	*s*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' CROSS_COMPILING=@CROSS_COMPILING@ DISABLED_EXTENSIONS="$(DISABLED_EXTENSIONS)" CONFIG_ARGS="$(CONFIG_ARGS)" $(PYTHON_FOR_BUILD) -E $(srcdir)/setup.py -q build;; \
-+	*s*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' CROSS_COMPILING=@CROSS_COMPILING@ DISABLED_EXTENSIONS="$(DISABLED_EXTENSIONS)" CONFIG_ARGS="$(CONFIG_ARGS)" $(PYTHON_FOR_BUILD) -E $(srcdir)/setup.py build;; \
- 	*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' CROSS_COMPILING=@CROSS_COMPILING@ DISABLED_EXTENSIONS="$(DISABLED_EXTENSIONS)" CONFIG_ARGS="$(CONFIG_ARGS)" $(PYTHON_FOR_BUILD) -E $(srcdir)/setup.py build;; \
- 	esac
- 
diff --git a/package/python/python-2.7-015-distutils-cross-compilation-support.patch b/package/python/python-2.7-015-distutils-cross-compilation-support.patch
deleted file mode 100644
index 7fd404e..0000000
--- a/package/python/python-2.7-015-distutils-cross-compilation-support.patch
+++ /dev/null
@@ -1,125 +0,0 @@
-Add some cross-compilation fixes to distutils
-
-Inspired by work done by Marc Kleine-Budde <mkl@pengutronix.de> in
-PTXdist.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- Lib/distutils/sysconfig.py |    7 ++++---
- 1 files changed, 4 insertions(+), 3 deletions(-)
-
-Index: b/Lib/distutils/sysconfig.py
-===================================================================
---- a/Lib/distutils/sysconfig.py
-+++ b/Lib/distutils/sysconfig.py
-@@ -18,14 +18,38 @@
- 
- from distutils.errors import DistutilsPlatformError
- 
--# These are needed in a couple of spots, so just compute them once.
--PREFIX = os.path.normpath(sys.prefix)
--EXEC_PREFIX = os.path.normpath(sys.exec_prefix)
-+if os.environ.get('CROSS_COMPILING') == 'yes':
-+    _sysroot=os.environ.get('_python_sysroot')
-+    PREFIX = os.path.normpath(_sysroot + os.environ.get('_python_prefix'))
-+    EXEC_PREFIX = os.path.normpath(_sysroot + os.environ.get('_python_exec_prefix'))
-+    # In the cross-compilation case, we have two cases:
-+    #
-+    #  1/ We're currently cross-compiling Python itself. In this case,
-+    #  EXECUTABLE_DIRNAME should point to the source directory of the
-+    #  target Python, so that the rest of the code, especially the
-+    #  _python_build() function will properly understand that we are
-+    #  building Python itself. In this case, _python_srcdir is
-+    #  defined.
-+    #
-+    #  2/ We're currently cross-compiling third party Python
-+    #  modules. In this case, EXECUTABLE_DIRNAME should point to where
-+    #  the target python executable is installed in the sysroot, so
-+    #  that the proper Makefile is going to be read. In this case,
-+    #  _python_srcdir is not defined.
-+    #
-+    if os.environ.get('_python_srcdir') is not None:
-+        EXECUTABLE_DIRNAME = os.environ.get('_python_srcdir')
-+    else:
-+        EXECUTABLE_DIRNAME = os.path.join(_sysroot, "usr/bin")
-+else:
-+    PREFIX = os.path.normpath(sys.prefix)
-+    EXEC_PREFIX = os.path.normpath(sys.exec_prefix)
-+    EXECUTABLE_DIRNAME = os.path.dirname(os.path.realpath(sys.executable))
- 
- # Path to the base directory of the project. On Windows the binary may
- # live in project/PCBuild9.  If we're dealing with an x64 Windows build,
- # it'll live in project/PCbuild/amd64.
--project_base = os.path.dirname(os.path.abspath(sys.executable))
-+project_base = EXECUTABLE_DIRNAME
- if os.name == "nt" and "pcbuild" in project_base[-8:].lower():
-     project_base = os.path.abspath(os.path.join(project_base, os.path.pardir))
- # PC/VS7.1
-@@ -74,7 +98,7 @@
- 
-     if os.name == "posix":
-         if python_build:
--            buildir = os.path.dirname(sys.executable)
-+            buildir = EXECUTABLE_DIRNAME
-             if plat_specific:
-                 # python.h is located in the buildir
-                 inc_dir = buildir
-@@ -245,7 +269,7 @@
- def get_makefile_filename():
-     """Return full pathname of installed Makefile from the Python build."""
-     if python_build:
--        return os.path.join(os.path.dirname(sys.executable), "Makefile")
-+        return os.path.join(EXECUTABLE_DIRNAME, "Makefile")
-     lib_dir = get_python_lib(plat_specific=1, standard_lib=1)
-     return os.path.join(lib_dir, "config", "Makefile")
- 
-@@ -311,6 +335,11 @@
-             # `$$' is a literal `$' in make
-             tmpv = v.replace('$$', '')
- 
-+            # Adjust prefix and exec_prefix when we're cross compiling
-+            if os.environ.get('CROSS_COMPILING') == "yes":
-+                if n == "prefix" or n == "exec_prefix":
-+                    v = _sysroot + v
-+
-             if "$" in tmpv:
-                 notdone[n] = v
-             else:
-Index: b/configure.in
-===================================================================
---- a/configure.in
-+++ b/configure.in
-@@ -4342,6 +4342,20 @@
- CROSS_COMPILING=$cross_compiling
- AC_SUBST(CROSS_COMPILING)
- 
-+#
-+# Cross compiling
-+#
-+# special RUNSHARED
-+if test "$cross_compiling" = "yes"; then
-+    RUNSHARED="\
-+               CROSS_COMPILING=yes \
-+               _python_cross_host=${ac_cv_host} \
-+               _python_srcdir=\"\$(srcdir)\" \
-+               _python_prefix=\"\$(prefix)\" \
-+               _python_exec_prefix=\"\$(exec_prefix)\""
-+fi
-+
-+
- # generate output files
- AC_CONFIG_FILES(Makefile.pre Modules/Setup.config Misc/python.pc)
- AC_CONFIG_FILES([Modules/ld_so_aix], [chmod +x Modules/ld_so_aix])
-Index: b/Lib/distutils/command/build_ext.py
-===================================================================
---- a/Lib/distutils/command/build_ext.py
-+++ b/Lib/distutils/command/build_ext.py
-@@ -237,7 +237,7 @@
-         if ((sys.platform.startswith('linux') or sys.platform.startswith('gnu')
-              or sys.platform.startswith('sunos'))
-             and sysconfig.get_config_var('Py_ENABLE_SHARED')):
--            if sys.executable.startswith(os.path.join(sys.exec_prefix, "bin")):
-+            if not sysconfig.python_build:
-                 # building third party extensions
-                 self.library_dirs.append(sysconfig.get_config_var('LIBDIR'))
-             else:
diff --git a/package/python/python-2.7-016-cross-compile-getaddrinfo.patch b/package/python/python-2.7-016-cross-compile-getaddrinfo.patch
deleted file mode 100644
index dae3005..0000000
--- a/package/python/python-2.7-016-cross-compile-getaddrinfo.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Disable buggy_getaddrinfo configure test when cross-compiling with IPv6 support
-
-Signed-off-by: Vanya Sergeev <vsergeev@gmail.com>
-
---- python-2.7.2.orig/configure.in	2012-04-22 06:52:09.361809545 -0400
-+++ python-2.7.2/configure.in	2012-04-22 06:56:37.900634194 -0400
-@@ -3128,7 +3128,7 @@
- 
- AC_MSG_RESULT($ac_cv_buggy_getaddrinfo)
- 
--if test $have_getaddrinfo = no -o "$ac_cv_buggy_getaddrinfo" = yes
-+if test $have_getaddrinfo = no || test "$cross_compiling" != "yes" -a "$ac_cv_buggy_getaddrinfo" = yes
- then
- 	if test $ipv6 = yes
- 	then
diff --git a/package/python/python.mk b/package/python/python.mk
index f2e48c4..0469820 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -5,16 +5,15 @@
 ################################################################################
 
 PYTHON_VERSION_MAJOR = 2.7
-PYTHON_VERSION       = $(PYTHON_VERSION_MAJOR).3
+PYTHON_VERSION       = $(PYTHON_VERSION_MAJOR).6
 PYTHON_SOURCE        = Python-$(PYTHON_VERSION).tar.xz
 PYTHON_SITE          = http://python.org/ftp/python/$(PYTHON_VERSION)
 PYTHON_LICENSE       = Python software foundation license v2, others
 PYTHON_LICENSE_FILES = LICENSE
 
-# Python needs itself and a "pgen" program to build itself, both being
-# provided in the Python sources. So in order to cross-compile Python,
-# we need to build a host Python first. This host Python is also
-# installed in $(HOST_DIR), as it is needed when cross-compiling
+# Python needs itself to be built, so in order to cross-compile
+# Python, we need to build a host Python first. This host Python is
+# also installed in $(HOST_DIR), as it is needed when cross-compiling
 # third-party Python modules.
 
 HOST_PYTHON_CONF_OPT += 	\
@@ -32,12 +31,8 @@ HOST_PYTHON_CONF_OPT += 	\
 	--disable-bsddb		\
 	--disable-test-modules	\
 	--disable-bz2		\
-	--disable-ssl
-
-HOST_PYTHON_MAKE_ENV = \
-	PYTHON_MODULES_INCLUDE=$(HOST_DIR)/usr/include \
-	PYTHON_MODULES_LIB="$(HOST_DIR)/lib $(HOST_DIR)/usr/lib"
-
+	--disable-ssl		\
+	--disable-pyo-build
 
 # Building host python in parallel sometimes triggers a "Bus error"
 # during the execution of "./python setup.py build" in the
@@ -51,12 +46,6 @@ PYTHON_DEPENDENCIES  = host-python libffi
 
 HOST_PYTHON_DEPENDENCIES = host-expat host-zlib
 
-define HOST_PYTHON_INSTALL_PGEN
-	$(INSTALL) -m0755 -D $(@D)/Parser/pgen $(HOST_DIR)/usr/bin/python-pgen
-endef
-
-HOST_PYTHON_POST_INSTALL_HOOKS += HOST_PYTHON_INSTALL_PGEN
-
 PYTHON_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_PYTHON_READLINE),y)
@@ -124,14 +113,9 @@ PYTHON_DEPENDENCIES += openssl
 endif
 
 PYTHON_CONF_ENV += \
-	PYTHON_FOR_BUILD=$(HOST_DIR)/usr/bin/python \
-	PGEN_FOR_BUILD=$(HOST_DIR)/usr/bin/python-pgen \
-	ac_cv_have_long_long_format=yes
-
-PYTHON_MAKE_ENV += \
-	_python_sysroot=$(STAGING_DIR) \
-	PYTHON_MODULES_INCLUDE=$(STAGING_DIR)/usr/include \
-	PYTHON_MODULES_LIB="$(STAGING_DIR)/lib $(STAGING_DIR)/usr/lib"
+	ac_cv_have_long_long_format=yes \
+	ac_cv_file__dev_ptmx=yes \
+	ac_cv_file__dev_ptc=yes
 
 PYTHON_CONF_OPT += \
 	--without-cxx-main 	\
@@ -143,7 +127,18 @@ PYTHON_CONF_OPT += \
 	--disable-gdbm		\
 	--disable-tk		\
 	--disable-nis		\
-	--disable-dbm
+	--disable-dbm		\
+	--disable-pyo-build
+
+# This is needed to make sure the Python build process doesn't try to
+# regenerate those files with the pgen program. Otherwise, it builds
+# pgen for the target, and tries to run it on the host.
+
+define PYTHON_TOUCH_GRAMMAR_FILES
+	touch $(@D)/Include/graminit.h $(@D)/Python/graminit.c
+endef
+
+PYTHON_POST_PATCH_HOOKS += PYTHON_TOUCH_GRAMMAR_FILES
 
 #
 # Remove useless files. In the config/ directory, only the Makefile
@@ -168,7 +163,7 @@ PYTHON_POST_INSTALL_TARGET_HOOKS += PYTHON_REMOVE_USELESS_FILES
 PYTHON_AUTORECONF = YES
 
 # Provided to other packages
-PYTHON_PATH = $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/
+PYTHON_PATH = $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/sysconfigdata/:$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
1.8.3.2
