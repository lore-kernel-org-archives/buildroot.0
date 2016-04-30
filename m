From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Apr 2016 14:47:48 +0200
Subject: [Buildroot] [PATCH v2 1/4] python3: bump to 3.5.1
In-Reply-To: <1462020471-29986-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1462020471-29986-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1462020471-29986-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The major changes in terms of Buildroot packaging are:

 - Due to PEP488, Python no longer generates .pyc (unoptimized) and
   .pyo (optimized) byte-code files. Instead, it generates <foo>.pyc,
   <foo>.opt-1.pyc and <foo>.opt-2.pyc. Therefore, we removed the
   --disable-pyo-build option and kept only the --disable-pyc-build
   option, which completely disables building all .pyc files. In
   addition, since the optimized .opt-X.pyc files don't work if the
   corresponding un-optimized .pyc file is not present, we are for the
   moment unconditionally removing the optimized ones (keeping both
   the unoptimized and optimized ones doubles the required filesystem
   size!). So basically we preserve the behavior we had before this
   commit:

     BR2_PACKAGE_PYTHON3_PY_ONLY -> only *.py
     BR2_PACKAGE_PYTHON3_PYC_ONLY -> only non-optimized *.pyc
     BR2_PACKAGE_PYTHON3_PY_PYC -> both the *.py and non-optimized *.pyc

   To achieve this, the TARGET_FINALIZE_HOOKS are reworked:

    PYTHON3_REMOVE_PY_FILES is responsible for removing *.py files in
    the BR2_PACKAGE_PYTHON3_PYC_ONLY case.

    PYTHON3_REMOVE_PYC_FILES is responsible for removing *.pyc files
    in the BR2_PACKAGE_PYTHON3_PY_ONLY case.

    PYTHON3_REMOVE_OPTIMIZED_PYC_FILES is responsible for removing the
    optimized *.opt-1.pyc and *.opt-2.pyc files, which is done
    unconditionally.

 - The PEP3147 disabling patch had to be significantly reworked due to
   the code having changed heavily. The code was moved into a
   _bootstrap_external.py, which is a "frozen" Python module, i.e a
   module generated into a .h file at compile time using the
   _freeze_importlib program.

 - Due to the above, we now need to regenerate importlib.h at build
   time. Unfortunately, for the target Python _freeze_importlib is
   built for the target, so we can't run it on the build machine. To
   fix this, we copy the _freeze_importlib program from the
   host-python in $(HOST_DIR), and then patch the target python to use
   it. Since the same solution can be used for 'pgen', we do it, and
   avoid having to touch the graminit.{c,h} files.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
Changes since v1:
 - Remove the no longer useful --disable-pyo-build, as noticed by
   Arnout.
 - Fix the handling of *.opt-X.pyc files by simply getting rid of them
   for the moment.
---
 ...up.py-do-not-add-invalid-header-locations.patch |  6 +-
 ...the-install-location-of-_sysconfigdata.py.patch | 18 +++---
 ...-Make-the-build-of-pyc-files-conditional.patch} | 50 ++++------------
 ...gy_getaddrinfo-configure-test-when-cross-.patch |  6 +-
 ...ructure-to-disable-the-build-of-certain-e.patch | 18 +++---
 ...006-distutils-sysconfig-use-sysconfigdata.patch |  6 +-
 ...ibrary-header-paths-for-cross-compilation.patch | 12 ++--
 ...n-t-look-in-usr-lib-termcap-for-libraries.patch |  6 +-
 .../python3/0009-Don-t-add-multiarch-paths.patch   |  6 +-
 .../0010-Abort-on-failed-module-build.patch        | 10 ++--
 package/python3/0011-Serial-ioctl-workaround.patch |  2 +-
 ...st-the-shebang-of-Python-scripts-for-cros.patch |  2 +-
 ...-config.sh.in-ensure-sed-invocations-only.patch |  6 +-
 ...-harcode-invalid-path-to-ncursesw-headers.patch |  6 +-
 ...stem-locale-and-set-to-default-when-addin.patch |  6 +-
 ...0016-Add-importlib-fix-for-PEP-3147-issue.patch | 69 ++++++++++++++--------
 ...on-to-disable-installation-of-test-module.patch | 16 ++---
 .../0018-Add-an-option-to-disable-pydoc.patch      | 20 +++----
 .../0019-Add-an-option-to-disable-lib2to3.patch    | 22 +++----
 ...-Add-option-to-disable-the-sqlite3-module.patch | 14 ++---
 ...21-Add-an-option-to-disable-the-tk-module.patch | 18 +++---
 ...dd-an-option-to-disable-the-curses-module.patch | 12 ++--
 .../0023-Add-an-option-to-disable-expat.patch      | 16 ++---
 .../0024-Add-an-option-to-disable-CJK-codecs.patch |  6 +-
 .../0025-Add-an-option-to-disable-NIS.patch        |  6 +-
 ...0026-Add-an-option-to-disable-unicodedata.patch |  6 +-
 .../0027-Add-an-option-to-disable-IDLE.patch       | 18 +++---
 .../0028-Add-an-option-to-disable-decimal.patch    | 10 ++--
 ...-option-to-disable-the-ossaudiodev-module.patch |  6 +-
 ...N_FOR_BUILD-and-FREEZE_IMPORTLIB_FOR_BUIL.patch | 62 +++++++++++++++++++
 package/python3/python3.hash                       |  6 +-
 package/python3/python3.mk                         | 58 +++++++++---------
 32 files changed, 292 insertions(+), 233 deletions(-)
 rename package/python3/{0003-Make-the-build-of-pyc-and-pyo-files-conditional.patch => 0003-Make-the-build-of-pyc-files-conditional.patch} (47%)
 create mode 100644 package/python3/0030-Support-PGEN_FOR_BUILD-and-FREEZE_IMPORTLIB_FOR_BUIL.patch

diff --git a/package/python3/0001-setup.py-do-not-add-invalid-header-locations.patch b/package/python3/0001-setup.py-do-not-add-invalid-header-locations.patch
index 3fafd90..defaad9 100644
--- a/package/python3/0001-setup.py-do-not-add-invalid-header-locations.patch
+++ b/package/python3/0001-setup.py-do-not-add-invalid-header-locations.patch
@@ -1,4 +1,4 @@
-From 03a4c313f42ea1bbdfc4c64a285b3930766c2b23 Mon Sep 17 00:00:00 2001
+From d6093bad6c700312ff7ff4a7bb15c815dda6f46b Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:28:34 +0100
 Subject: [PATCH] setup.py: do not add invalid header locations
@@ -28,10 +28,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/setup.py b/setup.py
-index 2779658..d3bf8e5 100644
+index da67731..dbd2a3c 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -493,7 +493,8 @@ class PyBuildExt(build_ext):
+@@ -511,7 +511,8 @@ class PyBuildExt(build_ext):
                          add_dir_to_list(dir_list, directory)
  
          if os.path.normpath(sys.base_prefix) != '/usr' \
diff --git a/package/python3/0002-Change-the-install-location-of-_sysconfigdata.py.patch b/package/python3/0002-Change-the-install-location-of-_sysconfigdata.py.patch
index 57b55fb..8e930ab 100644
--- a/package/python3/0002-Change-the-install-location-of-_sysconfigdata.py.patch
+++ b/package/python3/0002-Change-the-install-location-of-_sysconfigdata.py.patch
@@ -1,4 +1,4 @@
-From 2f706a2ba92c88f1c8288e34d1937b6ba0e0214c Mon Sep 17 00:00:00 2001
+From 4ac038d30ec71b3f223ac7c91613856dd82b6347 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:29:04 +0100
 Subject: [PATCH] Change the install location of _sysconfigdata.py
@@ -25,10 +25,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  2 files changed, 11 insertions(+), 3 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 76aef28..58dab28 100644
+index 823def3..4d2a061 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -559,6 +559,9 @@ pybuilddir.txt: $(BUILDPYTHON)
+@@ -585,6 +585,9 @@ pybuilddir.txt: $(BUILDPYTHON)
  		rm -f ./pybuilddir.txt ; \
  		exit 1 ; \
  	fi
@@ -38,7 +38,7 @@ index 76aef28..58dab28 100644
  
  # Build the shared modules
  # Under GNU make, MAKEFLAGS are sorted and normalized; the 's' for
-@@ -1197,7 +1200,7 @@ libinstall:	build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
+@@ -1235,7 +1238,7 @@ libinstall:	build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
  		else	true; \
  		fi; \
  	done
@@ -47,7 +47,7 @@ index 76aef28..58dab28 100644
  	do \
  		if test -x $$i; then \
  			$(INSTALL_SCRIPT) $$i $(DESTDIR)$(LIBDEST); \
-@@ -1207,6 +1210,11 @@ libinstall:	build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
+@@ -1245,6 +1248,11 @@ libinstall:	build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
  			echo $(INSTALL_DATA) $$i $(LIBDEST); \
  		fi; \
  	done
@@ -59,17 +59,17 @@ index 76aef28..58dab28 100644
  	@for d in $(LIBSUBDIRS); \
  	do \
  		a=$(srcdir)/Lib/$$d; \
-@@ -1533,7 +1541,7 @@ clean: pycremoval
+@@ -1580,7 +1588,7 @@ clean: pycremoval
  	find build -name 'fficonfig.h' -exec rm -f {} ';' || true
  	find build -name '*.py' -exec rm -f {} ';' || true
  	find build -name '*.py[co]' -exec rm -f {} ';' || true
 -	-rm -f pybuilddir.txt
 +	-rm -f pybuilddir.txt pysysconfigdatadir.txt
  	-rm -f Lib/lib2to3/*Grammar*.pickle
- 	-rm -f Modules/_testembed Modules/_freeze_importlib
- 
+ 	-rm -f Programs/_testembed Programs/_freeze_importlib
+ 	-rm -rf build
 diff --git a/configure.ac b/configure.ac
-index a0d0afa..7b491b4 100644
+index 694293e..76b70a0 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -70,7 +70,7 @@ if test "$cross_compiling" = yes; then
diff --git a/package/python3/0003-Make-the-build-of-pyc-and-pyo-files-conditional.patch b/package/python3/0003-Make-the-build-of-pyc-files-conditional.patch
similarity index 47%
rename from package/python3/0003-Make-the-build-of-pyc-and-pyo-files-conditional.patch
rename to package/python3/0003-Make-the-build-of-pyc-files-conditional.patch
index 03684af..3251da5 100644
--- a/package/python3/0003-Make-the-build-of-pyc-and-pyo-files-conditional.patch
+++ b/package/python3/0003-Make-the-build-of-pyc-files-conditional.patch
@@ -1,23 +1,22 @@
-From 7c5338161263c290f18b1ff90859084d314be98c Mon Sep 17 00:00:00 2001
+From 28f81597314ea3ed03935b519453a55cf6c3c20d Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:29:35 +0100
-Subject: [PATCH] Make the build of pyc and pyo files conditional
+Subject: [PATCH] Make the build of pyc files conditional
 
-This commit adds two new configure options: --disable-pyc-build and
---disable-pyo-build to disable the compilation of pyc and pyo files
-respectively.
+This commit adds a new configure option --disable-pyc-build to disable
+the compilation of pyc.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 ---
- Makefile.pre.in |  8 ++++++++
- configure.ac    | 12 ++++++++++++
- 2 files changed, 20 insertions(+)
+ Makefile.pre.in | 2 ++
+ configure.ac    | 6 ++++++
+ 2 files changed, 8 insertions(+)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 58dab28..f1bdd99 100644
+index 4d2a061..272f312 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1245,24 +1245,32 @@ libinstall:	build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
+@@ -1283,6 +1283,7 @@ libinstall:	build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
  		$(INSTALL_DATA) $(srcdir)/Modules/xxmodule.c \
  			$(DESTDIR)$(LIBDEST)/distutils/tests ; \
  	fi
@@ -25,25 +24,8 @@ index 58dab28..f1bdd99 100644
  	-PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
  		$(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py \
  		-d $(LIBDEST) -f \
- 		-x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data' \
- 		$(DESTDIR)$(LIBDEST)
-+endif
-+ifeq (@PYO_BUILD@,yes)
- 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
- 		$(PYTHON_FOR_BUILD) -Wi -O $(DESTDIR)$(LIBDEST)/compileall.py \
- 		-d $(LIBDEST) -f \
- 		-x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data' \
- 		$(DESTDIR)$(LIBDEST)
-+endif
-+ifeq (@PYC_BUILD@,yes)
- 	-PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
- 		$(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py \
- 		-d $(LIBDEST)/site-packages -f \
- 		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
-+endif
-+ifeq (@PYO_BUILD@,yes)
- 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
- 		$(PYTHON_FOR_BUILD) -Wi -O $(DESTDIR)$(LIBDEST)/compileall.py \
+@@ -1310,6 +1311,7 @@ libinstall:	build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
+ 		$(PYTHON_FOR_BUILD) -Wi -OO $(DESTDIR)$(LIBDEST)/compileall.py \
  		-d $(LIBDEST)/site-packages -f \
  		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
 +endif
@@ -51,10 +33,10 @@ index 58dab28..f1bdd99 100644
  		$(PYTHON_FOR_BUILD) -m lib2to3.pgen2.driver $(DESTDIR)$(LIBDEST)/lib2to3/Grammar.txt
  	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
 diff --git a/configure.ac b/configure.ac
-index 7b491b4..f2c4705 100644
+index 76b70a0..66d4642 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -922,6 +922,18 @@ fi
+@@ -1056,6 +1056,12 @@ fi
  
  AC_MSG_CHECKING(LDLIBRARY)
  
@@ -64,12 +46,6 @@ index 7b491b4..f2c4705 100644
 +	AS_HELP_STRING([--disable-pyc-build], [disable build of pyc files]),
 +	[ PYC_BUILD="${enableval}" ], [ PYC_BUILD=yes ])
 +
-+AC_SUBST(PYO_BUILD)
-+
-+AC_ARG_ENABLE(pyo-build,
-+	AS_HELP_STRING([--disable-pyo-build], [disable build of pyo files]),
-+	[ PYO_BUILD="${enableval}" ], [ PYO_BUILD=yes ])
-+
  # MacOSX framework builds need more magic. LDLIBRARY is the dynamic
  # library that we build, but we do not want to link against it (we
  # will find it with a -framework option). For this reason there is an
diff --git a/package/python3/0004-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch b/package/python3/0004-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
index da2a65b..183d6b3 100644
--- a/package/python3/0004-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
+++ b/package/python3/0004-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
@@ -1,4 +1,4 @@
-From ef95d6a49f17522ed120def8093fa2fc0b86cbc8 Mon Sep 17 00:00:00 2001
+From 093caf46b7a742ee2f7bcf617a915ac1653aa8ac Mon Sep 17 00:00:00 2001
 From: Vanya Sergeev <vsergeev@gmail.com>
 Date: Wed, 23 Dec 2015 11:30:33 +0100
 Subject: [PATCH] Disable buggy_getaddrinfo configure test when cross-compiling
@@ -10,10 +10,10 @@ Signed-off-by: Vanya Sergeev <vsergeev@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index f2c4705..6342b81 100644
+index 66d4642..c492594 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3415,7 +3415,7 @@ fi
+@@ -3662,7 +3662,7 @@ fi
  
  AC_MSG_RESULT($ac_cv_buggy_getaddrinfo)
  
diff --git a/package/python3/0005-Add-infrastructure-to-disable-the-build-of-certain-e.patch b/package/python3/0005-Add-infrastructure-to-disable-the-build-of-certain-e.patch
index 4a32bb1..76a553b 100644
--- a/package/python3/0005-Add-infrastructure-to-disable-the-build-of-certain-e.patch
+++ b/package/python3/0005-Add-infrastructure-to-disable-the-build-of-certain-e.patch
@@ -1,4 +1,4 @@
-From 9eb1076b61e83647028a2f6b665b6f9afcb793b0 Mon Sep 17 00:00:00 2001
+From 3a9f4aa255909ed152883eee787313efd20dbc58 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:31:08 +0100
 Subject: [PATCH] Add infrastructure to disable the build of certain extensions
@@ -42,10 +42,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  3 files changed, 11 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index f1bdd99..e0f9e0f 100644
+index 272f312..9420860 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -177,6 +177,8 @@ FILEMODE=	644
+@@ -182,6 +182,8 @@ FILEMODE=	644
  # configure script arguments
  CONFIG_ARGS=	@CONFIG_ARGS@
  
@@ -54,7 +54,7 @@ index f1bdd99..e0f9e0f 100644
  
  # Subdirectories with code
  SRCDIRS= 	@SRCDIRS@
-@@ -574,6 +576,7 @@ sharedmods: $(BUILDPYTHON) pybuilddir.txt
+@@ -600,6 +602,7 @@ sharedmods: $(BUILDPYTHON) pybuilddir.txt
  	esac; \
  	$(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' \
  		_TCLTK_INCLUDES='$(TCLTK_INCLUDES)' _TCLTK_LIBS='$(TCLTK_LIBS)' \
@@ -62,7 +62,7 @@ index f1bdd99..e0f9e0f 100644
  		$(PYTHON_FOR_BUILD) $(srcdir)/setup.py $$quiet build
  
  # Build static library
-@@ -1384,7 +1387,8 @@ libainstall:	all python-config
+@@ -1425,7 +1428,8 @@ libainstall:	all python-config
  # Install the dynamically loadable modules
  # This goes into $(exec_prefix)
  sharedinstall: sharedmods
@@ -73,10 +73,10 @@ index f1bdd99..e0f9e0f 100644
  		--install-scripts=$(BINDIR) \
  		--install-platlib=$(DESTSHARED) \
 diff --git a/configure.ac b/configure.ac
-index 6342b81..a3026b8 100644
+index c492594..bfb599e 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2352,6 +2352,8 @@ LIBS="$withval $LIBS"
+@@ -2588,6 +2588,8 @@ LIBS="$withval $LIBS"
  
  PKG_PROG_PKG_CONFIG
  
@@ -86,10 +86,10 @@ index 6342b81..a3026b8 100644
  AC_MSG_CHECKING(for --with-system-expat)
  AC_ARG_WITH(system_expat,
 diff --git a/setup.py b/setup.py
-index d3bf8e5..2a504d2 100644
+index dbd2a3c..1ebfa50 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -39,7 +39,10 @@ host_platform = get_platform()
+@@ -44,7 +44,10 @@ host_platform = get_platform()
  COMPILED_WITH_PYDEBUG = ('--with-pydebug' in sysconfig.get_config_var("CONFIG_ARGS"))
  
  # This global variable is used to hold the list of modules to be disabled.
diff --git a/package/python3/0006-distutils-sysconfig-use-sysconfigdata.patch b/package/python3/0006-distutils-sysconfig-use-sysconfigdata.patch
index dcf32d6..b3e41b1 100644
--- a/package/python3/0006-distutils-sysconfig-use-sysconfigdata.patch
+++ b/package/python3/0006-distutils-sysconfig-use-sysconfigdata.patch
@@ -1,4 +1,4 @@
-From bdb9cccdc2993e43af1e57ad3b8b0055bab64ba0 Mon Sep 17 00:00:00 2001
+From 7c560d917ee0e536c76fac275d1cb0b6136269ab Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:32:23 +0100
 Subject: [PATCH] distutils/sysconfig: use sysconfigdata
@@ -12,10 +12,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 4 insertions(+), 33 deletions(-)
 
 diff --git a/Lib/distutils/sysconfig.py b/Lib/distutils/sysconfig.py
-index a1452fe..1df20ad 100644
+index 573724d..721edec 100644
 --- a/Lib/distutils/sysconfig.py
 +++ b/Lib/distutils/sysconfig.py
-@@ -423,40 +423,11 @@ def expand_makefile_vars(s, vars):
+@@ -414,40 +414,11 @@ def expand_makefile_vars(s, vars):
  _config_vars = None
  
  def _init_posix():
diff --git a/package/python3/0007-Adjust-library-header-paths-for-cross-compilation.patch b/package/python3/0007-Adjust-library-header-paths-for-cross-compilation.patch
index 59d4ccd..9ac65ba 100644
--- a/package/python3/0007-Adjust-library-header-paths-for-cross-compilation.patch
+++ b/package/python3/0007-Adjust-library-header-paths-for-cross-compilation.patch
@@ -1,4 +1,4 @@
-From 678143ce6161379a3eebc20db6634f0c247f8605 Mon Sep 17 00:00:00 2001
+From e634929f76a45f5b683dc19bc01efed2ab83e19e Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:33:14 +0100
 Subject: [PATCH] Adjust library/header paths for cross-compilation
@@ -21,10 +21,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  2 files changed, 15 insertions(+), 5 deletions(-)
 
 diff --git a/Lib/distutils/command/build_ext.py b/Lib/distutils/command/build_ext.py
-index acbe648..494a8c9 100644
+index d4cb11e..e7a0ba9 100644
 --- a/Lib/distutils/command/build_ext.py
 +++ b/Lib/distutils/command/build_ext.py
-@@ -239,7 +239,10 @@ class build_ext(Command):
+@@ -232,7 +232,10 @@ class build_ext(Command):
          if (sysconfig.get_config_var('Py_ENABLE_SHARED')):
              if not sysconfig.python_build:
                  # building third party extensions
@@ -37,10 +37,10 @@ index acbe648..494a8c9 100644
                  # building python standard extensions
                  self.library_dirs.append('.')
 diff --git a/Lib/distutils/sysconfig.py b/Lib/distutils/sysconfig.py
-index 1df20ad..905d280 100644
+index 721edec..d20e2d8 100644
 --- a/Lib/distutils/sysconfig.py
 +++ b/Lib/distutils/sysconfig.py
-@@ -16,10 +16,17 @@ import sys
+@@ -17,10 +17,17 @@ import sys
  from .errors import DistutilsPlatformError
  
  # These are needed in a couple of spots, so just compute them once.
@@ -61,7 +61,7 @@ index 1df20ad..905d280 100644
 +    BASE_EXEC_PREFIX = os.path.normpath(sys.base_exec_prefix)
  
  # Path to the base directory of the project. On Windows the binary may
- # live in project/PCBuild9.  If we're dealing with an x64 Windows build,
+ # live in project/PCBuild/win32 or project/PCBuild/amd64.
 -- 
 2.6.4
 
diff --git a/package/python3/0008-Don-t-look-in-usr-lib-termcap-for-libraries.patch b/package/python3/0008-Don-t-look-in-usr-lib-termcap-for-libraries.patch
index 19a76cf..47a0b83 100644
--- a/package/python3/0008-Don-t-look-in-usr-lib-termcap-for-libraries.patch
+++ b/package/python3/0008-Don-t-look-in-usr-lib-termcap-for-libraries.patch
@@ -1,4 +1,4 @@
-From 3ef1e30b88c4166f22220812b68e14f39f7ed15b Mon Sep 17 00:00:00 2001
+From d7c568632f7cb83346096ea114a06f89a0b488d6 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:36:00 +0100
 Subject: [PATCH] Don't look in /usr/lib/termcap for libraries
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 1 insertion(+), 4 deletions(-)
 
 diff --git a/setup.py b/setup.py
-index 2a504d2..acc4ad0 100644
+index 1ebfa50..24a7153 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -733,12 +733,9 @@ class PyBuildExt(build_ext):
+@@ -753,12 +753,9 @@ class PyBuildExt(build_ext):
                  pass # Issue 7384: Already linked against curses or tinfo.
              elif curses_library:
                  readline_libs.append(curses_library)
diff --git a/package/python3/0009-Don-t-add-multiarch-paths.patch b/package/python3/0009-Don-t-add-multiarch-paths.patch
index 693ab6a..921e25c 100644
--- a/package/python3/0009-Don-t-add-multiarch-paths.patch
+++ b/package/python3/0009-Don-t-add-multiarch-paths.patch
@@ -1,4 +1,4 @@
-From b910b3a6e61afcaa6f77b533a5cb4290c528f439 Mon Sep 17 00:00:00 2001
+From bac5ac529cc0902a340a5cd03308433c6e80d1f6 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:36:27 +0100
 Subject: [PATCH] Don't add multiarch paths
@@ -17,10 +17,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/setup.py b/setup.py
-index acc4ad0..eab709e 100644
+index 24a7153..8380a64 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -456,10 +456,10 @@ class PyBuildExt(build_ext):
+@@ -474,10 +474,10 @@ class PyBuildExt(build_ext):
          if not cross_compiling:
              add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
              add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
diff --git a/package/python3/0010-Abort-on-failed-module-build.patch b/package/python3/0010-Abort-on-failed-module-build.patch
index d2e9822..131354b 100644
--- a/package/python3/0010-Abort-on-failed-module-build.patch
+++ b/package/python3/0010-Abort-on-failed-module-build.patch
@@ -1,4 +1,4 @@
-From 420e08fc9e77b650d11ce420f85257ce1710b70d Mon Sep 17 00:00:00 2001
+From 86ef08e36597e14cac06aef176f12375a27fdef5 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:43:24 +0100
 Subject: [PATCH] Abort on failed module build
@@ -14,17 +14,17 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/setup.py b/setup.py
-index eab709e..86758ce 100644
+index 8380a64..15b39f5 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -284,6 +284,7 @@ class PyBuildExt(build_ext):
+@@ -296,6 +296,7 @@ class PyBuildExt(build_ext):
              print("Failed to build these modules:")
              print_three_column(failed)
              print()
 +            sys.exit(1)
  
-     def build_extension(self, ext):
- 
+         if self.failed_on_import:
+             failed = self.failed_on_import[:]
 -- 
 2.6.4
 
diff --git a/package/python3/0011-Serial-ioctl-workaround.patch b/package/python3/0011-Serial-ioctl-workaround.patch
index f1db62b..9e7d79c 100644
--- a/package/python3/0011-Serial-ioctl-workaround.patch
+++ b/package/python3/0011-Serial-ioctl-workaround.patch
@@ -1,4 +1,4 @@
-From f67b0073a30eb83d42a2ead0a62020dfe5db8d1e Mon Sep 17 00:00:00 2001
+From ace3ebd517ea0ac42208b6a06c7e8f82da3b9c1b Mon Sep 17 00:00:00 2001
 From: Baruch Siach <baruch@tkos.co.il>
 Date: Wed, 23 Dec 2015 11:44:02 +0100
 Subject: [PATCH] Serial ioctl() workaround
diff --git a/package/python3/0012-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch b/package/python3/0012-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
index e4fbf4e..2e50c1b 100644
--- a/package/python3/0012-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
+++ b/package/python3/0012-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
@@ -1,4 +1,4 @@
-From 2cac07af643d989b352cccc3b96d86ed269df9b1 Mon Sep 17 00:00:00 2001
+From 45f482813de828415906e6a416c9c35450c38da7 Mon Sep 17 00:00:00 2001
 From: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
 Date: Wed, 23 Dec 2015 11:44:30 +0100
 Subject: [PATCH] Do not adjust the shebang of Python scripts for
diff --git a/package/python3/0013-Misc-python-config.sh.in-ensure-sed-invocations-only.patch b/package/python3/0013-Misc-python-config.sh.in-ensure-sed-invocations-only.patch
index f9c7225..872f040 100644
--- a/package/python3/0013-Misc-python-config.sh.in-ensure-sed-invocations-only.patch
+++ b/package/python3/0013-Misc-python-config.sh.in-ensure-sed-invocations-only.patch
@@ -1,4 +1,4 @@
-From 4c0893221e2978854174806f7e14f7643eea32e7 Mon Sep 17 00:00:00 2001
+From 5858abdc25acd522869103d64b60a0c9687e2ec1 Mon Sep 17 00:00:00 2001
 From: Peter Korsgaard <peter@korsgaard.com>
 Date: Thu, 20 Nov 2014 13:24:59 +0100
 Subject: [PATCH] Misc/python-config.sh.in: ensure sed invocations only match
@@ -25,7 +25,7 @@ Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
  1 file changed, 6 insertions(+), 6 deletions(-)
 
 diff --git a/Misc/python-config.sh.in b/Misc/python-config.sh.in
-index 64c81e5..f75eec5 100644
+index 30c6927..f905a71 100644
 --- a/Misc/python-config.sh.in
 +++ b/Misc/python-config.sh.in
 @@ -29,12 +29,12 @@ prefix_real=$(installed_prefix "$0")
@@ -52,7 +52,7 @@ index 64c81e5..f75eec5 100644
  LIBDEST=${prefix}/lib/python${VERSION}
 -LIBPL=$(echo "@LIBPL@" | sed "s#$prefix_build#$prefix_real#")
 +LIBPL=$(echo "@LIBPL@" | sed "s#^$prefix_build#$prefix_real#")
- SO="@SO@"
+ SO="@EXT_SUFFIX@"
  PYTHONFRAMEWORK="@PYTHONFRAMEWORK@"
  INCDIR="-I$includedir/python${VERSION}${ABIFLAGS}"
 -- 
diff --git a/package/python3/0014-Do-not-harcode-invalid-path-to-ncursesw-headers.patch b/package/python3/0014-Do-not-harcode-invalid-path-to-ncursesw-headers.patch
index 4a64427..f11d946 100644
--- a/package/python3/0014-Do-not-harcode-invalid-path-to-ncursesw-headers.patch
+++ b/package/python3/0014-Do-not-harcode-invalid-path-to-ncursesw-headers.patch
@@ -1,4 +1,4 @@
-From a87f08318cf40a27d41957dcc7312c3b3083ba86 Mon Sep 17 00:00:00 2001
+From be44636b36086ca1b6de24265b7c3cc0c2bae913 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:45:13 +0100
 Subject: [PATCH] Do not harcode invalid path to ncursesw headers
@@ -14,10 +14,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 1 deletion(-)
 
 diff --git a/setup.py b/setup.py
-index 86758ce..565c304 100644
+index 15b39f5..9e08e7e 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -1276,7 +1276,6 @@ class PyBuildExt(build_ext):
+@@ -1296,7 +1296,6 @@ class PyBuildExt(build_ext):
          panel_library = 'panel'
          if curses_library == 'ncursesw':
              curses_defines.append(('HAVE_NCURSESW', '1'))
diff --git a/package/python3/0015-Override-system-locale-and-set-to-default-when-addin.patch b/package/python3/0015-Override-system-locale-and-set-to-default-when-addin.patch
index e358e44..22af71d 100644
--- a/package/python3/0015-Override-system-locale-and-set-to-default-when-addin.patch
+++ b/package/python3/0015-Override-system-locale-and-set-to-default-when-addin.patch
@@ -1,4 +1,4 @@
-From 807357dc50a5a97016ce22646b5eb6a5b64a1a5d Mon Sep 17 00:00:00 2001
+From 46fda6fc83500bf5663397f9d28b618e6b6b20c1 Mon Sep 17 00:00:00 2001
 From: Samuel Cabrero <samuelcabrero@gmail.com>
 Date: Wed, 23 Dec 2015 11:45:48 +0100
 Subject: [PATCH] Override system locale and set to default when adding gcc
@@ -20,10 +20,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/setup.py b/setup.py
-index 565c304..8966779 100644
+index 9e08e7e..3feca04 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -423,7 +423,7 @@ class PyBuildExt(build_ext):
+@@ -441,7 +441,7 @@ class PyBuildExt(build_ext):
          tmpfile = os.path.join(self.build_temp, 'gccpaths')
          if not os.path.exists(self.build_temp):
              os.makedirs(self.build_temp)
diff --git a/package/python3/0016-Add-importlib-fix-for-PEP-3147-issue.patch b/package/python3/0016-Add-importlib-fix-for-PEP-3147-issue.patch
index 02f1d16..54a0b87 100644
--- a/package/python3/0016-Add-importlib-fix-for-PEP-3147-issue.patch
+++ b/package/python3/0016-Add-importlib-fix-for-PEP-3147-issue.patch
@@ -1,4 +1,4 @@
-From 1153f503a38daf6388021575f1ad6ce8b702911b Mon Sep 17 00:00:00 2001
+From d2b5be9a0627e38d2280ef865dab3e74b7d2bde4 Mon Sep 17 00:00:00 2001
 From: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
 Date: Wed, 23 Dec 2015 11:46:14 +0100
 Subject: [PATCH] Add importlib fix for PEP 3147 issue
@@ -19,44 +19,51 @@ This effectively disables PEP 3147 for:
 
 Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
 ---
- Lib/importlib/_bootstrap.py | 26 +++++---------------------
- 1 file changed, 5 insertions(+), 21 deletions(-)
+ Lib/importlib/_bootstrap_external.py | 37 +++++-------------------------------
+ 1 file changed, 5 insertions(+), 32 deletions(-)
 
-diff --git a/Lib/importlib/_bootstrap.py b/Lib/importlib/_bootstrap.py
-index 5b91c05..a1755ec 100644
---- a/Lib/importlib/_bootstrap.py
-+++ b/Lib/importlib/_bootstrap.py
-@@ -444,8 +444,6 @@ def cache_from_source(path, debug_override=None):
-     If debug_override is not None, then it must be a boolean and is used in
-     place of sys.flags.optimize.
+diff --git a/Lib/importlib/_bootstrap_external.py b/Lib/importlib/_bootstrap_external.py
+index 616b17f..e30129c 100644
+--- a/Lib/importlib/_bootstrap_external.py
++++ b/Lib/importlib/_bootstrap_external.py
+@@ -255,8 +255,6 @@ def cache_from_source(path, debug_override=None, *, optimization=None):
+     a True value is the same as setting 'optimization' to the empty string
+     while a False value is equivalent to setting 'optimization' to '1'.
  
 -    If sys.implementation.cache_tag is None then NotImplementedError is raised.
 -
      """
-     debug = not sys.flags.optimize if debug_override is None else debug_override
-     if debug:
-@@ -454,33 +452,19 @@ def cache_from_source(path, debug_override=None):
-         suffixes = OPTIMIZED_BYTECODE_SUFFIXES
+     if debug_override is not None:
+         _warnings.warn('the debug_override parameter is deprecated; use '
+@@ -267,10 +265,7 @@ def cache_from_source(path, debug_override=None, *, optimization=None):
+         optimization = '' if debug_override else 1
      head, tail = _path_split(path)
      base, sep, rest = tail.rpartition('.')
 -    tag = sys.implementation.cache_tag
 -    if tag is None:
 -        raise NotImplementedError('sys.implementation.cache_tag is None')
--    filename = ''.join([(base if base else rest), sep, tag, suffixes[0]])
--    return _path_join(head, _PYCACHE, filename)
-+    filename = ''.join([(base if base else rest), suffixes[0]])
-+    return _path_join(head, filename)
+-    almost_filename = ''.join([(base if base else rest), sep, tag])
++    almost_filename = ''.join([(base if base else rest)])
+     if optimization is None:
+         if sys.flags.optimize == 0:
+             optimization = ''
+@@ -281,39 +276,17 @@ def cache_from_source(path, debug_override=None, *, optimization=None):
+         if not optimization.isalnum():
+             raise ValueError('{!r} is not alphanumeric'.format(optimization))
+         almost_filename = '{}.{}{}'.format(almost_filename, _OPT, optimization)
+-    return _path_join(head, _PYCACHE, almost_filename + BYTECODE_SUFFIXES[0])
++    return _path_join(head, almost_filename + BYTECODE_SUFFIXES[0])
  
  
  def source_from_cache(path):
-     """Given the path to a .pyc./.pyo file, return the path to its .py file.
+     """Given the path to a .pyc. file, return the path to its .py file.
  
-     The .pyc/.pyo file does not need to exist; this simply returns the path to
--    the .py file calculated to correspond to the .pyc/.pyo file.  If path does
--    not conform to PEP 3147 format, ValueError will be raised. If
+     The .pyc file does not need to exist; this simply returns the path to
+-    the .py file calculated to correspond to the .pyc file.  If path does
+-    not conform to PEP 3147/488 format, ValueError will be raised. If
 -    sys.implementation.cache_tag is None then NotImplementedError is raised.
-+    the .py file calculated to correspond to the .pyc/.pyo file.
- 
+-
++    the .py file calculated to correspond to the .pyc file.
      """
 -    if sys.implementation.cache_tag is None:
 -        raise NotImplementedError('sys.implementation.cache_tag is None')
@@ -65,9 +72,19 @@ index 5b91c05..a1755ec 100644
 -    if pycache != _PYCACHE:
 -        raise ValueError('{} not bottom-level directory in '
 -                         '{!r}'.format(_PYCACHE, path))
--    if pycache_filename.count('.') != 2:
--        raise ValueError('expected only 2 dots in '
+-    dot_count = pycache_filename.count('.')
+-    if dot_count not in {2, 3}:
+-        raise ValueError('expected only 2 or 3 dots in '
 -                         '{!r}'.format(pycache_filename))
+-    elif dot_count == 3:
+-        optimization = pycache_filename.rsplit('.', 2)[-2]
+-        if not optimization.startswith(_OPT):
+-            raise ValueError("optimization portion of filename does not start "
+-                             "with {!r}".format(_OPT))
+-        opt_level = optimization[len(_OPT):]
+-        if not opt_level.isalnum():
+-            raise ValueError("optimization level {!r} is not an alphanumeric "
+-                             "value".format(optimization))
 -    base_filename = pycache_filename.partition('.')[0]
 +    head, filename = _path_split(path)
 +    base_filename = filename.partition('.')[0]
diff --git a/package/python3/0017-Add-an-option-to-disable-installation-of-test-module.patch b/package/python3/0017-Add-an-option-to-disable-installation-of-test-module.patch
index 6e0f07c..ee0134a 100644
--- a/package/python3/0017-Add-an-option-to-disable-installation-of-test-module.patch
+++ b/package/python3/0017-Add-an-option-to-disable-installation-of-test-module.patch
@@ -1,4 +1,4 @@
-From 3cdd905ad1ff001713d20b768c001b5299a2e72c Mon Sep 17 00:00:00 2001
+From 1d2891204c6bf05d5e2eb0e5fa2ee78f6a2b755b Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:47:00 +0100
 Subject: [PATCH] Add an option to disable installation of test modules
@@ -14,12 +14,12 @@ Signed-off-by: Samuel Martin <s.martin49@gmail.com>
  2 files changed, 42 insertions(+), 20 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index e0f9e0f..12fae84 100644
+index 9420860..d4c771a 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1133,8 +1133,30 @@ PLATDIR=	plat-$(MACHDEP)
- EXTRAPLATDIR= @EXTRAPLATDIR@
- MACHDEPS=	$(PLATDIR) $(EXTRAPLATDIR)
+@@ -1166,8 +1166,30 @@ maninstall:	altmaninstall
+ PLATDIR=	@PLATDIR@
+ MACHDEPS=	$(PLATDIR)
  XMLLIBSUBDIRS=  xml xml/dom xml/etree xml/parsers xml/sax
 -LIBSUBDIRS=	tkinter tkinter/test tkinter/test/test_tkinter \
 -		tkinter/test/test_ttk site-packages test \
@@ -50,7 +50,7 @@ index e0f9e0f..12fae84 100644
  		test/audiodata \
  		test/capath test/data \
  		test/cjkencodings test/decimaltestdata test/xmltestdata \
-@@ -1161,28 +1183,22 @@ LIBSUBDIRS=	tkinter tkinter/test tkinter/test/test_tkinter \
+@@ -1199,28 +1221,22 @@ LIBSUBDIRS=	tkinter tkinter/test tkinter/test/test_tkinter \
  		test/test_importlib/namespace_pkgs/project3/parent/child \
                  test/test_importlib/namespace_pkgs/module_and_namespace_package \
                  test/test_importlib/namespace_pkgs/module_and_namespace_package/a_test \
@@ -92,10 +92,10 @@ index e0f9e0f..12fae84 100644
  	@for i in $(SCRIPTDIR) $(LIBDEST); \
  	do \
 diff --git a/configure.ac b/configure.ac
-index a3026b8..b7a8836 100644
+index bfb599e..9f3d226 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2659,6 +2659,12 @@ if test "$posix_threads" = "yes"; then
+@@ -2895,6 +2895,12 @@ if test "$posix_threads" = "yes"; then
  fi
  
  
diff --git a/package/python3/0018-Add-an-option-to-disable-pydoc.patch b/package/python3/0018-Add-an-option-to-disable-pydoc.patch
index 22f194a..670ad40 100644
--- a/package/python3/0018-Add-an-option-to-disable-pydoc.patch
+++ b/package/python3/0018-Add-an-option-to-disable-pydoc.patch
@@ -1,4 +1,4 @@
-From 99ef88cb47a396e2c7005e59e50d34e0a60dd3cb Mon Sep 17 00:00:00 2001
+From a83b79b964700604de386800f86e5a55f53a0e17 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:47:11 +0100
 Subject: [PATCH] Add an option to disable pydoc
@@ -15,10 +15,10 @@ Signed-off-by: Samuel Martin <s.martin49@gmail.com>
  3 files changed, 19 insertions(+), 3 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 12fae84..5e2333e 100644
+index d4c771a..a98ad65 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1100,7 +1100,9 @@ bininstall: altbininstall
+@@ -1134,7 +1134,9 @@ bininstall: altbininstall
  	-rm -f $(DESTDIR)$(BINDIR)/idle3
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s idle$(VERSION) idle3)
  	-rm -f $(DESTDIR)$(BINDIR)/pydoc3
@@ -28,7 +28,7 @@ index 12fae84..5e2333e 100644
  	-rm -f $(DESTDIR)$(BINDIR)/2to3
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s 2to3-$(VERSION) 2to3)
  	-rm -f $(DESTDIR)$(BINDIR)/pyvenv
-@@ -1151,7 +1153,7 @@ LIBSUBDIRS=	tkinter \
+@@ -1184,7 +1186,7 @@ LIBSUBDIRS=	tkinter \
  		multiprocessing multiprocessing/dummy \
  		unittest \
  		venv venv/scripts venv/scripts/posix \
@@ -37,7 +37,7 @@ index 12fae84..5e2333e 100644
  
  TESTSUBDIRS = 	tkinter/test tkinter/test/test_tkinter tkinter/test/test_ttk \
  		test test/test_asyncio \
-@@ -1195,6 +1197,10 @@ TESTSUBDIRS = 	tkinter/test tkinter/test/test_tkinter tkinter/test/test_ttk \
+@@ -1233,6 +1235,10 @@ TESTSUBDIRS = 	tkinter/test tkinter/test/test_tkinter tkinter/test/test_ttk \
  		test/test_importlib/import_ test/test_importlib/source \
  		unittest/test unittest/test/testmock
  
@@ -49,10 +49,10 @@ index 12fae84..5e2333e 100644
  LIBSUBDIRS += $(TESTSUBDIRS)
  endif
 diff --git a/configure.ac b/configure.ac
-index b7a8836..2e75345 100644
+index 9f3d226..e9b6d6f 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2658,6 +2658,11 @@ if test "$posix_threads" = "yes"; then
+@@ -2894,6 +2894,11 @@ if test "$posix_threads" = "yes"; then
        AC_CHECK_FUNCS(pthread_atfork)
  fi
  
@@ -65,10 +65,10 @@ index b7a8836..2e75345 100644
  AC_SUBST(TEST_MODULES)
  
 diff --git a/setup.py b/setup.py
-index 8966779..69198db 100644
+index 3feca04..137911d 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -2200,6 +2200,12 @@ def main():
+@@ -2220,6 +2220,12 @@ def main():
      # turn off warnings when deprecated modules are imported
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
@@ -81,7 +81,7 @@ index 8966779..69198db 100644
      setup(# PyPI Metadata (PEP 301)
            name = "Python",
            version = sys.version.split()[0],
-@@ -2224,8 +2230,7 @@ def main():
+@@ -2244,8 +2250,7 @@ def main():
            # If you change the scripts installed here, you also need to
            # check the PyBuildScripts command above, and change the links
            # created by the bininstall target in Makefile.pre.in
diff --git a/package/python3/0019-Add-an-option-to-disable-lib2to3.patch b/package/python3/0019-Add-an-option-to-disable-lib2to3.patch
index 8a22c0f..f0d4770 100644
--- a/package/python3/0019-Add-an-option-to-disable-lib2to3.patch
+++ b/package/python3/0019-Add-an-option-to-disable-lib2to3.patch
@@ -1,4 +1,4 @@
-From 4d6bc8497ab740ae23a7091ff91dba06a63ba877 Mon Sep 17 00:00:00 2001
+From 3c877ea9f09913586f87064b7a2b9d2b49cb05aa Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:48:44 +0100
 Subject: [PATCH] Add an option to disable lib2to3
@@ -15,10 +15,10 @@ Signed-off-by: Samuel Martin <s.martin49@gmail.com>
  3 files changed, 21 insertions(+), 6 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 5e2333e..6656f48 100644
+index a98ad65..3823940 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1104,7 +1104,9 @@ ifeq (@PYDOC@,yes)
+@@ -1138,7 +1138,9 @@ ifeq (@PYDOC@,yes)
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s pydoc$(VERSION) pydoc3)
  endif
  	-rm -f $(DESTDIR)$(BINDIR)/2to3
@@ -28,7 +28,7 @@ index 5e2333e..6656f48 100644
  	-rm -f $(DESTDIR)$(BINDIR)/pyvenv
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s pyvenv-$(VERSION) pyvenv)
  	if test "x$(LIPO_32BIT_FLAGS)" != "x" ; then \
-@@ -1144,7 +1146,6 @@ LIBSUBDIRS=	tkinter \
+@@ -1177,7 +1179,6 @@ LIBSUBDIRS=	tkinter \
  		html json http dbm xmlrpc \
  		sqlite3 \
  		logging csv wsgiref urllib \
@@ -36,7 +36,7 @@ index 5e2333e..6656f48 100644
  		ctypes ctypes/macholib \
  		idlelib idlelib/Icons \
  		distutils distutils/command $(XMLLIBSUBDIRS) \
-@@ -1186,9 +1187,6 @@ TESTSUBDIRS = 	tkinter/test tkinter/test/test_tkinter tkinter/test/test_ttk \
+@@ -1224,9 +1225,6 @@ TESTSUBDIRS = 	tkinter/test tkinter/test/test_tkinter tkinter/test/test_ttk \
                  test/test_importlib/namespace_pkgs/module_and_namespace_package \
                  test/test_importlib/namespace_pkgs/module_and_namespace_package/a_test \
  		sqlite3/test \
@@ -46,7 +46,7 @@ index 5e2333e..6656f48 100644
  		ctypes/test \
  		idlelib/idle_test \
  		distutils/tests \
-@@ -1201,6 +1199,14 @@ ifeq (@PYDOC@,yes)
+@@ -1239,6 +1237,14 @@ ifeq (@PYDOC@,yes)
  LIBSUBDIRS += pydoc_data
  endif
  
@@ -61,7 +61,7 @@ index 5e2333e..6656f48 100644
  ifeq (@TEST_MODULES@,yes)
  LIBSUBDIRS += $(TESTSUBDIRS)
  endif
-@@ -1296,10 +1302,12 @@ ifeq (@PYO_BUILD@,yes)
+@@ -1337,10 +1343,12 @@ ifeq (@PYC_BUILD@,yes)
  		-d $(LIBDEST)/site-packages -f \
  		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
  endif
@@ -75,10 +75,10 @@ index 5e2333e..6656f48 100644
  # Create the PLATDIR source directory, if one wasn't distributed..
  $(srcdir)/Lib/$(PLATDIR):
 diff --git a/configure.ac b/configure.ac
-index 2e75345..0ed6b17 100644
+index e9b6d6f..652ad88 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2670,6 +2670,12 @@ AC_ARG_ENABLE(test-modules,
+@@ -2906,6 +2906,12 @@ AC_ARG_ENABLE(test-modules,
  	AS_HELP_STRING([--disable-test-modules], [disable test modules]),
  	[ TEST_MODULES="${enableval}" ], [ TEST_MODULES=yes ])
  
@@ -92,10 +92,10 @@ index 2e75345..0ed6b17 100644
  AH_TEMPLATE(ENABLE_IPV6, [Define if --enable-ipv6 is specified])
  AC_MSG_CHECKING([if --enable-ipv6 is specified])
 diff --git a/setup.py b/setup.py
-index 69198db..a2bf05a 100644
+index 137911d..722308b 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -2201,10 +2201,11 @@ def main():
+@@ -2221,10 +2221,11 @@ def main():
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
  
diff --git a/package/python3/0020-Add-option-to-disable-the-sqlite3-module.patch b/package/python3/0020-Add-option-to-disable-the-sqlite3-module.patch
index 26a7b34..2093684 100644
--- a/package/python3/0020-Add-option-to-disable-the-sqlite3-module.patch
+++ b/package/python3/0020-Add-option-to-disable-the-sqlite3-module.patch
@@ -1,4 +1,4 @@
-From f218ef22019d4c03427113982edc42beddd05683 Mon Sep 17 00:00:00 2001
+From 9ae1dce0a2fa01fc3dbc83d8b8c1b56e4b1b162b Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:49:01 +0100
 Subject: [PATCH] Add option to disable the sqlite3 module
@@ -11,10 +11,10 @@ Signed-off-by: Samuel Martin <s.martin49@gmail.com>
  2 files changed, 14 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 6656f48..433cac1 100644
+index 3823940..c822dbd 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1144,7 +1144,6 @@ LIBSUBDIRS=	tkinter \
+@@ -1177,7 +1177,6 @@ LIBSUBDIRS=	tkinter \
  		email email/mime \
  		ensurepip ensurepip/_bundled \
  		html json http dbm xmlrpc \
@@ -22,7 +22,7 @@ index 6656f48..433cac1 100644
  		logging csv wsgiref urllib \
  		ctypes ctypes/macholib \
  		idlelib idlelib/Icons \
-@@ -1186,7 +1185,6 @@ TESTSUBDIRS = 	tkinter/test tkinter/test/test_tkinter tkinter/test/test_ttk \
+@@ -1224,7 +1223,6 @@ TESTSUBDIRS = 	tkinter/test tkinter/test/test_tkinter tkinter/test/test_ttk \
  		test/test_importlib/namespace_pkgs/project3/parent/child \
                  test/test_importlib/namespace_pkgs/module_and_namespace_package \
                  test/test_importlib/namespace_pkgs/module_and_namespace_package/a_test \
@@ -30,7 +30,7 @@ index 6656f48..433cac1 100644
  		ctypes/test \
  		idlelib/idle_test \
  		distutils/tests \
-@@ -1207,6 +1205,11 @@ TESTSUBDIRS += lib2to3/tests			\
+@@ -1245,6 +1243,11 @@ TESTSUBDIRS += lib2to3/tests			\
  	lib2to3/tests/data/fixers/myfixes
  endif
  
@@ -43,10 +43,10 @@ index 6656f48..433cac1 100644
  LIBSUBDIRS += $(TESTSUBDIRS)
  endif
 diff --git a/configure.ac b/configure.ac
-index 0ed6b17..aaffbd6 100644
+index 652ad88..cae12ad 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2658,6 +2658,15 @@ if test "$posix_threads" = "yes"; then
+@@ -2894,6 +2894,15 @@ if test "$posix_threads" = "yes"; then
        AC_CHECK_FUNCS(pthread_atfork)
  fi
  
diff --git a/package/python3/0021-Add-an-option-to-disable-the-tk-module.patch b/package/python3/0021-Add-an-option-to-disable-the-tk-module.patch
index fc3c9b4..7dfb339 100644
--- a/package/python3/0021-Add-an-option-to-disable-the-tk-module.patch
+++ b/package/python3/0021-Add-an-option-to-disable-the-tk-module.patch
@@ -1,4 +1,4 @@
-From 006bf215734ad63007de044fe7803f66f83a4d19 Mon Sep 17 00:00:00 2001
+From d0d42570e5a23c3bf559e0413ec97729fd2f9e24 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:49:14 +0100
 Subject: [PATCH] Add an option to disable the tk module
@@ -11,19 +11,19 @@ Signed-off-by: Samuel Martin <s.martin49@gmail.com>
  2 files changed, 17 insertions(+), 3 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 433cac1..e492d7b 100644
+index c822dbd..0a93c27 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1137,7 +1137,7 @@ PLATDIR=	plat-$(MACHDEP)
- EXTRAPLATDIR= @EXTRAPLATDIR@
- MACHDEPS=	$(PLATDIR) $(EXTRAPLATDIR)
+@@ -1170,7 +1170,7 @@ maninstall:	altmaninstall
+ PLATDIR=	@PLATDIR@
+ MACHDEPS=	$(PLATDIR)
  XMLLIBSUBDIRS=  xml xml/dom xml/etree xml/parsers xml/sax
 -LIBSUBDIRS=	tkinter \
 +LIBSUBDIRS=	\
  		site-packages \
  		asyncio \
  		collections concurrent concurrent/futures encodings \
-@@ -1155,8 +1155,7 @@ LIBSUBDIRS=	tkinter \
+@@ -1188,8 +1188,7 @@ LIBSUBDIRS=	tkinter \
  		venv venv/scripts venv/scripts/posix \
  		curses $(MACHDEPS)
  
@@ -33,7 +33,7 @@ index 433cac1..e492d7b 100644
  		test/test_email test/test_email/data \
  		test/test_json \
  		test/audiodata \
-@@ -1210,6 +1209,12 @@ LIBSUBDIRS += sqlite3
+@@ -1248,6 +1247,12 @@ LIBSUBDIRS += sqlite3
  TESTSUBDIRS += sqlite3/test
  endif
  
@@ -47,10 +47,10 @@ index 433cac1..e492d7b 100644
  LIBSUBDIRS += $(TESTSUBDIRS)
  endif
 diff --git a/configure.ac b/configure.ac
-index aaffbd6..7efd54f 100644
+index cae12ad..787b185 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2667,6 +2667,15 @@ if test "$SQLITE3" = "no" ; then
+@@ -2903,6 +2903,15 @@ if test "$SQLITE3" = "no" ; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
  fi
  
diff --git a/package/python3/0022-Add-an-option-to-disable-the-curses-module.patch b/package/python3/0022-Add-an-option-to-disable-the-curses-module.patch
index de78bb0..22f7a24 100644
--- a/package/python3/0022-Add-an-option-to-disable-the-curses-module.patch
+++ b/package/python3/0022-Add-an-option-to-disable-the-curses-module.patch
@@ -1,4 +1,4 @@
-From 42725aef353df06f760f0a47b80001187d04d8b4 Mon Sep 17 00:00:00 2001
+From d04ec780bf7c0825ab260bd1d6b7292141b2dcde Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:49:30 +0100
 Subject: [PATCH] Add an option to disable the curses module
@@ -11,10 +11,10 @@ Signed-off-by: Samuel Martin <s.martin49@gmail.com>
  2 files changed, 14 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index e492d7b..66b2c45 100644
+index 0a93c27..b97c21e 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1153,7 +1153,7 @@ LIBSUBDIRS=	\
+@@ -1186,7 +1186,7 @@ LIBSUBDIRS=	\
  		multiprocessing multiprocessing/dummy \
  		unittest \
  		venv venv/scripts venv/scripts/posix \
@@ -23,7 +23,7 @@ index e492d7b..66b2c45 100644
  
  TESTSUBDIRS = 	test test/test_asyncio \
  		test/test_email test/test_email/data \
-@@ -1215,6 +1215,10 @@ TESTSUBDIRS += tkinter/test tkinter/test/test_tkinter \
+@@ -1253,6 +1253,10 @@ TESTSUBDIRS += tkinter/test tkinter/test/test_tkinter \
  	tkinter/test/test_ttk
  endif
  
@@ -35,10 +35,10 @@ index e492d7b..66b2c45 100644
  LIBSUBDIRS += $(TESTSUBDIRS)
  endif
 diff --git a/configure.ac b/configure.ac
-index 7efd54f..e48f38e 100644
+index 787b185..0be47b2 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2676,6 +2676,15 @@ if test "$TK" = "no"; then
+@@ -2912,6 +2912,15 @@ if test "$TK" = "no"; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _tkinter"
  fi
  
diff --git a/package/python3/0023-Add-an-option-to-disable-expat.patch b/package/python3/0023-Add-an-option-to-disable-expat.patch
index 9cb0799..73f9b36 100644
--- a/package/python3/0023-Add-an-option-to-disable-expat.patch
+++ b/package/python3/0023-Add-an-option-to-disable-expat.patch
@@ -1,4 +1,4 @@
-From f98b83bca09882d27bb04d7dbcd50f9979ad0569 Mon Sep 17 00:00:00 2001
+From 6281850ee8c3fb6d93b4997833af0cca4a48947b Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:49:42 +0100
 Subject: [PATCH] Add an option to disable expat
@@ -18,10 +18,10 @@ Signed-off-by: Samuel Martin <s.martin49@gmail.com>
  3 files changed, 19 insertions(+), 7 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 66b2c45..884d5aa 100644
+index b97c21e..bdfee19 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1147,7 +1147,7 @@ LIBSUBDIRS=	\
+@@ -1180,7 +1180,7 @@ LIBSUBDIRS=	\
  		logging csv wsgiref urllib \
  		ctypes ctypes/macholib \
  		idlelib idlelib/Icons \
@@ -30,7 +30,7 @@ index 66b2c45..884d5aa 100644
  		importlib \
  		turtledemo \
  		multiprocessing multiprocessing/dummy \
-@@ -1219,6 +1219,10 @@ ifeq (@CURSES@,yes)
+@@ -1257,6 +1257,10 @@ ifeq (@CURSES@,yes)
  LIBSUBDIRS += curses
  endif
  
@@ -42,10 +42,10 @@ index 66b2c45..884d5aa 100644
  LIBSUBDIRS += $(TESTSUBDIRS)
  endif
 diff --git a/configure.ac b/configure.ac
-index e48f38e..4bbd597 100644
+index 0be47b2..e6bcacc 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2355,13 +2355,21 @@ PKG_PROG_PKG_CONFIG
+@@ -2591,13 +2591,21 @@ PKG_PROG_PKG_CONFIG
  AC_SUBST(DISABLED_EXTENSIONS)
  
  # Check for use of the system expat library
@@ -73,10 +73,10 @@ index e48f38e..4bbd597 100644
  # Check for use of the system libffi library
  AC_MSG_CHECKING(for --with-system-ffi)
 diff --git a/setup.py b/setup.py
-index a2bf05a..fd3ac65 100644
+index 722308b..ecddb6a 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -1414,7 +1414,7 @@ class PyBuildExt(build_ext):
+@@ -1434,7 +1434,7 @@ class PyBuildExt(build_ext):
          #
          # More information on Expat can be found at www.libexpat.org.
          #
diff --git a/package/python3/0024-Add-an-option-to-disable-CJK-codecs.patch b/package/python3/0024-Add-an-option-to-disable-CJK-codecs.patch
index b4d7784..d3af94f 100644
--- a/package/python3/0024-Add-an-option-to-disable-CJK-codecs.patch
+++ b/package/python3/0024-Add-an-option-to-disable-CJK-codecs.patch
@@ -1,4 +1,4 @@
-From cf731841e1209c6faa99e2db4cf4c890e7c28080 Mon Sep 17 00:00:00 2001
+From 18265d05ee97ad0c43995acdadce2458b57d7d64 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:49:55 +0100
 Subject: [PATCH] Add an option to disable CJK codecs
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 4bbd597..05817f0 100644
+index e6bcacc..38b7515 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2675,6 +2675,12 @@ if test "$SQLITE3" = "no" ; then
+@@ -2911,6 +2911,12 @@ if test "$SQLITE3" = "no" ; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
  fi
  
diff --git a/package/python3/0025-Add-an-option-to-disable-NIS.patch b/package/python3/0025-Add-an-option-to-disable-NIS.patch
index cd6b19d..ef9ff42 100644
--- a/package/python3/0025-Add-an-option-to-disable-NIS.patch
+++ b/package/python3/0025-Add-an-option-to-disable-NIS.patch
@@ -1,4 +1,4 @@
-From f99823ef41d6f5c8e67b198b04b289d9b6ef8570 Mon Sep 17 00:00:00 2001
+From 733ee65f308ec48be427463c06f372ca116ccada Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:50:11 +0100
 Subject: [PATCH] Add an option to disable NIS
@@ -12,10 +12,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 05817f0..4fb35a8 100644
+index 38b7515..f25733a 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2681,6 +2681,12 @@ AC_ARG_ENABLE(codecs-cjk,
+@@ -2917,6 +2917,12 @@ AC_ARG_ENABLE(codecs-cjk,
  		DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _codecs_kr _codecs_jp _codecs_cn _codecs_tw _codecs_hk _codecs_iso2022"
  	fi])
  
diff --git a/package/python3/0026-Add-an-option-to-disable-unicodedata.patch b/package/python3/0026-Add-an-option-to-disable-unicodedata.patch
index a5880f2..56a5178 100644
--- a/package/python3/0026-Add-an-option-to-disable-unicodedata.patch
+++ b/package/python3/0026-Add-an-option-to-disable-unicodedata.patch
@@ -1,4 +1,4 @@
-From 4a32e709d128886dab10e59fad60fde005933aff Mon Sep 17 00:00:00 2001
+From 64fa1fc3a9aea7ffba7b96d08a14df91051f2b6f Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:50:27 +0100
 Subject: [PATCH] Add an option to disable unicodedata
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 4fb35a8..58f2dd9 100644
+index f25733a..a7ddb2b 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2687,6 +2687,12 @@ AC_ARG_ENABLE(nis,
+@@ -2923,6 +2923,12 @@ AC_ARG_ENABLE(nis,
      	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} nis"
    	  fi])
  
diff --git a/package/python3/0027-Add-an-option-to-disable-IDLE.patch b/package/python3/0027-Add-an-option-to-disable-IDLE.patch
index c2b59e8..73fc395 100644
--- a/package/python3/0027-Add-an-option-to-disable-IDLE.patch
+++ b/package/python3/0027-Add-an-option-to-disable-IDLE.patch
@@ -1,4 +1,4 @@
-From 9336cf4eb4ded1eaa83da5549e4aba62b34ef888 Mon Sep 17 00:00:00 2001
+From 2766bcdd8f9b7395ce32a6d8480ef0a2186f2098 Mon Sep 17 00:00:00 2001
 From: Maxime Ripard <maxime.ripard@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:50:42 +0100
 Subject: [PATCH] Add an option to disable IDLE
@@ -14,10 +14,10 @@ Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
  3 files changed, 15 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 884d5aa..48b4812 100644
+index bdfee19..2466615 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1098,7 +1098,9 @@ bininstall: altbininstall
+@@ -1132,7 +1132,9 @@ bininstall: altbininstall
  	-rm -f $(DESTDIR)$(LIBPC)/python3.pc
  	(cd $(DESTDIR)$(LIBPC); $(LN) -s python-$(VERSION).pc python3.pc)
  	-rm -f $(DESTDIR)$(BINDIR)/idle3
@@ -27,7 +27,7 @@ index 884d5aa..48b4812 100644
  	-rm -f $(DESTDIR)$(BINDIR)/pydoc3
  ifeq (@PYDOC@,yes)
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s pydoc$(VERSION) pydoc3)
-@@ -1146,7 +1148,6 @@ LIBSUBDIRS=	\
+@@ -1179,7 +1181,6 @@ LIBSUBDIRS=	\
  		html json http dbm xmlrpc \
  		logging csv wsgiref urllib \
  		ctypes ctypes/macholib \
@@ -35,7 +35,7 @@ index 884d5aa..48b4812 100644
  		distutils distutils/command \
  		importlib \
  		turtledemo \
-@@ -1223,6 +1224,10 @@ ifeq (@EXPAT@,yes)
+@@ -1261,6 +1262,10 @@ ifeq (@EXPAT@,yes)
  LIBSUBDIRS += $(XMLLIBSUBDIRS)
  endif
  
@@ -47,10 +47,10 @@ index 884d5aa..48b4812 100644
  LIBSUBDIRS += $(TESTSUBDIRS)
  endif
 diff --git a/configure.ac b/configure.ac
-index 58f2dd9..0ba25e4 100644
+index a7ddb2b..6b59792 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2729,6 +2729,12 @@ AC_ARG_ENABLE(lib2to3,
+@@ -2965,6 +2965,12 @@ AC_ARG_ENABLE(lib2to3,
  	AS_HELP_STRING([--disable-lib2to3], [disable lib2to3]),
  	[ LIB2TO3="${enableval}" ], [ LIB2TO3=yes ])
  
@@ -64,10 +64,10 @@ index 58f2dd9..0ba25e4 100644
  AH_TEMPLATE(ENABLE_IPV6, [Define if --enable-ipv6 is specified])
  AC_MSG_CHECKING([if --enable-ipv6 is specified])
 diff --git a/setup.py b/setup.py
-index fd3ac65..3655e57 100644
+index ecddb6a..7fe68e8 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -2201,11 +2201,13 @@ def main():
+@@ -2221,11 +2221,13 @@ def main():
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
  
diff --git a/package/python3/0028-Add-an-option-to-disable-decimal.patch b/package/python3/0028-Add-an-option-to-disable-decimal.patch
index df85325..1ac91dd 100644
--- a/package/python3/0028-Add-an-option-to-disable-decimal.patch
+++ b/package/python3/0028-Add-an-option-to-disable-decimal.patch
@@ -1,4 +1,4 @@
-From 8fee92a85c170ac4ce24dda5a960f24b83d6f103 Mon Sep 17 00:00:00 2001
+From ff77defc777a57d4caee5183796fd44dd265e78b Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:51:31 +0100
 Subject: [PATCH] Add an option to disable decimal
@@ -15,10 +15,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  2 files changed, 13 insertions(+), 6 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 0ba25e4..536b9b2 100644
+index 6b59792..51e1760 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2388,13 +2388,20 @@ AC_SUBST(LIBFFI_INCLUDEDIR)
+@@ -2624,13 +2624,20 @@ AC_SUBST(LIBFFI_INCLUDEDIR)
  AC_MSG_RESULT($with_system_ffi)
  
  # Check for use of the system libmpdec library
@@ -45,10 +45,10 @@ index 0ba25e4..536b9b2 100644
  # Check for support for loadable sqlite extensions
  AC_MSG_CHECKING(for --enable-loadable-sqlite-extensions)
 diff --git a/setup.py b/setup.py
-index 3655e57..7f7627d 100644
+index 7fe68e8..364b350 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -1968,7 +1968,7 @@ class PyBuildExt(build_ext):
+@@ -1988,7 +1988,7 @@ class PyBuildExt(build_ext):
      def _decimal_ext(self):
          extra_compile_args = []
          undef_macros = []
diff --git a/package/python3/0029-Add-an-option-to-disable-the-ossaudiodev-module.patch b/package/python3/0029-Add-an-option-to-disable-the-ossaudiodev-module.patch
index 56b6ae1..9ac9173 100644
--- a/package/python3/0029-Add-an-option-to-disable-the-ossaudiodev-module.patch
+++ b/package/python3/0029-Add-an-option-to-disable-the-ossaudiodev-module.patch
@@ -1,4 +1,4 @@
-From 53639100c2f7836ce9a51b5e5b9b4ea08ba1dc4e Mon Sep 17 00:00:00 2001
+From 789b0f99d7c1d25bfa9c05fd12f4d55bb70f377b Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:51:58 +0100
 Subject: [PATCH] Add an option to disable the ossaudiodev module
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 536b9b2..c1ab3a1 100644
+index 51e1760..c4c2353 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2403,6 +2403,12 @@ else
+@@ -2639,6 +2639,12 @@ else
  fi
  AC_SUBST(MPDEC)
  
diff --git a/package/python3/0030-Support-PGEN_FOR_BUILD-and-FREEZE_IMPORTLIB_FOR_BUIL.patch b/package/python3/0030-Support-PGEN_FOR_BUILD-and-FREEZE_IMPORTLIB_FOR_BUIL.patch
new file mode 100644
index 0000000..156eb29
--- /dev/null
+++ b/package/python3/0030-Support-PGEN_FOR_BUILD-and-FREEZE_IMPORTLIB_FOR_BUIL.patch
@@ -0,0 +1,62 @@
+From 4f851142b8f3149d23654117621285df34ec768b Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Wed, 23 Dec 2015 13:58:00 +0100
+Subject: [PATCH] Support PGEN_FOR_BUILD and FREEZE_IMPORTLIB_FOR_BUILD
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ Makefile.pre.in | 10 ++++++++++
+ configure.ac    |  3 +++
+ 2 files changed, 13 insertions(+)
+
+diff --git a/Makefile.pre.in b/Makefile.pre.in
+index 2466615..fdf622d 100644
+--- a/Makefile.pre.in
++++ b/Makefile.pre.in
+@@ -712,10 +712,15 @@ Programs/_testembed: Programs/_testembed.o $(LIBRARY) $(LDLIBRARY) $(PY3LIBRARY)
+ ############################################################################
+ # Importlib
+ 
++ifeq (@FREEZE_IMPORTLIB_FOR_BUILD@,)
+ Programs/_freeze_importlib.o: Programs/_freeze_importlib.c Makefile
+ 
+ Programs/_freeze_importlib: Programs/_freeze_importlib.o $(LIBRARY_OBJS_OMIT_FROZEN)
+ 	$(LINKCC) $(PY_LDFLAGS) -o $@ Programs/_freeze_importlib.o $(LIBRARY_OBJS_OMIT_FROZEN) $(LIBS) $(MODLIBS) $(SYSLIBS) $(LDLAST)
++else
++Programs/_freeze_importlib: @FREEZE_IMPORTLIB_FOR_BUILD@
++	cp $^ $@
++endif
+ 
+ Python/importlib_external.h: $(srcdir)/Lib/importlib/_bootstrap_external.py Programs/_freeze_importlib
+ 	./Programs/_freeze_importlib \
+@@ -789,8 +794,13 @@ $(GRAMMAR_H): $(GRAMMAR_INPUT) $(PGEN)
+ $(GRAMMAR_C): $(GRAMMAR_H)
+ 		touch $(GRAMMAR_C)
+ 
++ifeq (@PGEN_FOR_BUILD@,)
+ $(PGEN): $(PGENOBJS)
+ 		$(CC) $(OPT) $(PY_LDFLAGS) $(PGENOBJS) $(LIBS) -o $(PGEN)
++else
++$(PGEN): @PGEN_FOR_BUILD@
++		cp $^ $@
++endif
+ 
+ Parser/grammar.o:	$(srcdir)/Parser/grammar.c \
+ 				$(srcdir)/Include/token.h \
+diff --git a/configure.ac b/configure.ac
+index c4c2353..750c232 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -79,6 +79,9 @@ else
+ fi
+ AC_SUBST(PYTHON_FOR_BUILD)
+ 
++AC_SUBST(PGEN_FOR_BUILD)
++AC_SUBST(FREEZE_IMPORTLIB_FOR_BUILD)
++
+ dnl Ensure that if prefix is specified, it does not end in a slash. If
+ dnl it does, we get path names containing '//' which is both ugly and
+ dnl can cause trouble.
+-- 
+2.6.4
+
diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 60ac230..2894003 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,4 +1,4 @@
-# From https://www.python.org/downloads/release/python-343/
-md5 7d092d1bba6e17f0d9bd21b49e441dd5 Python-3.4.3.tar.xz
+# From https://www.python.org/downloads/release/python-351/
+md5 e9ea6f2623fffcdd871b7b19113fde80 Python-3.5.1.tar.xz
 # Locally computed
-sha256 b5b3963533768d5fc325a4d7a6bd6f666726002d696f1d399ec06b043ea996b8 Python-3.4.3.tar.xz
+sha256 c6d57c0c366d9060ab6c0cdf889ebf3d92711d466cc0119c441dbf2746f725c9 Python-3.5.1.tar.xz
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index a37b791..fddbf1b 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON3_VERSION_MAJOR = 3.4
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).3
+PYTHON3_VERSION_MAJOR = 3.5
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).1
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = http://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python software foundation license v2, others
@@ -36,8 +36,7 @@ HOST_PYTHON3_CONF_OPTS += 	\
 	--enable-unicodedata	\
 	--disable-test-modules	\
 	--disable-idle3		\
-	--disable-ossaudiodev	\
-	--disable-pyo-build
+	--disable-ossaudiodev
 
 # Make sure that LD_LIBRARY_PATH overrides -rpath.
 # This is needed because libpython may be installed at the same time that
@@ -136,28 +135,23 @@ PYTHON3_CONF_OPTS += \
 	--disable-lib2to3	\
 	--disable-tk		\
 	--disable-nis		\
-	--disable-idle3		\
-	--disable-pyo-build
-
-# This is needed to make sure the Python build process doesn't try to
-# regenerate those files with the pgen program. Otherwise, it builds
-# pgen for the target, and tries to run it on the host.
-
-define PYTHON3_TOUCH_GRAMMAR_FILES
-	touch $(@D)/Include/graminit.h $(@D)/Python/graminit.c
-endef
-
-# This prevents the Python Makefile from regenerating the
-# Python/importlib.h header if Lib/importlib/_bootstrap.py has changed
-# because its generation is broken in a cross-compilation environment
-# and importlib.h is not used.
-
-define PYTHON3_TOUCH_IMPORTLIB_H
-	touch $(@D)/Python/importlib.h
+	--disable-idle3
+
+# Python builds two tools to generate code: 'pgen' and
+# '_freeze_importlib'. Unfortunately, for the target Python, they are
+# built for the target, while we need to run them at build time. So
+# when installing host-python, we copy them to
+# $(HOST_DIR)/usr/bin. And then, when building the target python
+# package, we tell the configure script where they are located.
+define HOST_PYTHON3_INSTALL_TOOLS
+	cp $(@D)/Parser/pgen $(HOST_DIR)/usr/bin/python-pgen
+	cp $(@D)/Programs/_freeze_importlib $(HOST_DIR)/usr/bin/python-freeze-importlib
 endef
+HOST_PYTHON3_POST_INSTALL_HOOKS += HOST_PYTHON3_INSTALL_TOOLS
 
-PYTHON3_POST_PATCH_HOOKS += PYTHON3_TOUCH_GRAMMAR_FILES
-PYTHON3_POST_PATCH_HOOKS += PYTHON3_TOUCH_IMPORTLIB_H
+PYTHON3_CONF_ENV += \
+	PGEN_FOR_BUILD=$(HOST_DIR)/usr/bin/python-pgen \
+	FREEZE_IMPORTLIB_FOR_BUILD=$(HOST_DIR)/usr/bin/python-freeze-importlib
 
 #
 # Remove useless files. In the config/ directory, only the Makefile
@@ -219,15 +213,25 @@ $(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
 ifeq ($(BR2_PACKAGE_PYTHON3_PYC_ONLY),y)
-define PYTHON3_FINALIZE_TARGET
+define PYTHON3_REMOVE_PY_FILES
 	find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR) -name '*.py' -print0 | xargs -0 rm -f
 endef
+TARGET_FINALIZE_HOOKS += PYTHON3_REMOVE_PY_FILES
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_PY_ONLY),y)
-define PYTHON3_FINALIZE_TARGET
+define PYTHON3_REMOVE_PYC_FILES
 	find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR) -name '*.pyc' -print0 | xargs -0 rm -f
 endef
+TARGET_FINALIZE_HOOKS += PYTHON3_REMOVE_PYC_FILES
 endif
 
-TARGET_FINALIZE_HOOKS += PYTHON3_FINALIZE_TARGET
+# In all cases, we don't want to keep the optimized .opt-1.pyc and
+# .opt-2.pyc files, since they can't work without their non-optimized
+# variant.
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+define PYTHON3_REMOVE_OPTIMIZED_PYC_FILES
+	find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR) -name '*.opt-1.pyc' -print0 -o -name '*.opt-2.pyc' -print0 | xargs -0 rm -f
+endef
+TARGET_FINALIZE_HOOKS += PYTHON3_REMOVE_OPTIMIZED_PYC_FILES
+endif
-- 
2.6.4
