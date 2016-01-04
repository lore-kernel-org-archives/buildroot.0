From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  4 Jan 2016 19:23:28 +0100
Subject: [Buildroot] [PATCH 1/2] python3: switch to Git formatted patches
Message-ID: <1451931809-24511-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In preparation for the bump to Python 3.5.0, let's switch all the
patches to the Git format. This way, a Git repository of the Python
source code can be used to manage those patches, which makes it easier
to bump to newer Python versions.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...p.py-do-not-add-invalid-header-locations.patch} | 18 ++++--
 ...he-install-location-of-_sysconfigdata.py.patch} | 30 ++++++---
 ...e-build-of-pyc-and-pyo-files-conditional.patch} | 30 +++++++--
 ...gy_getaddrinfo-configure-test-when-cross-.patch | 27 ++++++++
 ...ucture-to-disable-the-build-of-certain-e.patch} | 38 ++++++-----
 ...06-distutils-sysconfig-use-sysconfigdata.patch} | 22 ++++++-
 ...brary-header-paths-for-cross-compilation.patch} | 50 +++++++++------
 ...-t-look-in-usr-lib-termcap-for-libraries.patch} | 17 +++--
 ....patch => 0009-Don-t-add-multiarch-paths.patch} | 17 +++--
 ...tch => 0010-Abort-on-failed-module-build.patch} | 17 +++--
 ...nd.patch => 0011-Serial-ioctl-workaround.patch} | 15 ++++-
 ...t-the-shebang-of-Python-scripts-for-cros.patch} | 18 ++++--
 ...config.sh.in-ensure-sed-invocations-only.patch} | 13 ++--
 ...harcode-invalid-path-to-ncursesw-headers.patch} | 17 +++--
 ...tem-locale-and-set-to-default-when-addin.patch} | 18 ++++--
 ...016-Add-importlib-fix-for-PEP-3147-issue.patch} | 22 +++++--
 ...n-to-disable-installation-of-test-module.patch} | 29 +++++----
 ...h => 0018-Add-an-option-to-disable-pydoc.patch} | 39 +++++++-----
 ...=> 0019-Add-an-option-to-disable-lib2to3.patch} | 73 ++++++++++++----------
 ...Add-option-to-disable-the-sqlite3-module.patch} | 65 ++++++++++---------
 ...1-Add-an-option-to-disable-the-tk-module.patch} | 31 +++++----
 ...d-an-option-to-disable-the-curses-module.patch} | 27 ++++----
 ...h => 0023-Add-an-option-to-disable-expat.patch} | 35 ++++++-----
 ...0024-Add-an-option-to-disable-CJK-codecs.patch} | 17 +++--
 ...tch => 0025-Add-an-option-to-disable-NIS.patch} | 17 +++--
 ...026-Add-an-option-to-disable-unicodedata.patch} | 17 +++--
 ...ch => 0027-Add-an-option-to-disable-IDLE.patch} | 39 +++++++-----
 ...=> 0028-Add-an-option-to-disable-decimal.patch} | 23 ++++---
 ...option-to-disable-the-ossaudiodev-module.patch} | 17 +++--
 .../python3/006-cross-compile-getaddrinfo.patch    | 21 -------
 30 files changed, 523 insertions(+), 296 deletions(-)
 rename package/python3/{001-remove-host-header-path.patch => 0001-setup.py-do-not-add-invalid-header-locations.patch} (80%)
 rename package/python3/{003-sysconfigdata-install-location.patch => 0002-Change-the-install-location-of-_sysconfigdata.py.patch} (76%)
 rename package/python3/{005-pyc-pyo-conditional.patch => 0003-Make-the-build-of-pyc-and-pyo-files-conditional.patch} (69%)
 create mode 100644 package/python3/0004-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
 rename package/python3/{007-disable-extensions.patch => 0005-Add-infrastructure-to-disable-the-build-of-certain-e.patch} (77%)
 rename package/python3/{008-distutils-sysconfig-use-sysconfigdata.patch => 0006-distutils-sysconfig-use-sysconfigdata.patch} (69%)
 rename package/python3/{009-distutils-use-python-sysroot.patch => 0007-Adjust-library-header-paths-for-cross-compilation.patch} (76%)
 rename package/python3/{010-no-termcap-host-path.patch => 0008-Don-t-look-in-usr-lib-termcap-for-libraries.patch} (67%)
 rename package/python3/{012-dont-add-multiarch-path.patch => 0009-Don-t-add-multiarch-paths.patch} (70%)
 rename package/python3/{013-abort-on-failed-modules.patch => 0010-Abort-on-failed-module-build.patch} (57%)
 rename package/python3/{014-serial-ioctl-workaround.patch => 0011-Serial-ioctl-workaround.patch} (64%)
 rename package/python3/{015-distutils-scripts-dont-adjust-shebang.patch => 0012-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch} (61%)
 rename package/python3/{017-python-config-include-libdir.patch => 0013-Misc-python-config.sh.in-ensure-sed-invocations-only.patch} (89%)
 rename package/python3/{018-ncursesw-remove-wrong-includedir.patch => 0014-Do-not-harcode-invalid-path-to-ncursesw-headers.patch} (62%)
 rename package/python3/{019-fix-add-gcc-paths-logic.patch => 0015-Override-system-locale-and-set-to-default-when-addin.patch} (69%)
 rename package/python3/{020-importlib-no-pep3147.patch => 0016-Add-importlib-fix-for-PEP-3147-issue.patch} (80%)
 rename package/python3/{100-optional-test-modules.patch => 0017-Add-an-option-to-disable-installation-of-test-module.patch} (81%)
 rename package/python3/{101-optional-pydoc.patch => 0018-Add-an-option-to-disable-pydoc.patch} (72%)
 rename package/python3/{102-optional-2to3.patch => 0019-Add-an-option-to-disable-lib2to3.patch} (75%)
 rename package/python3/{103-optional-sqlite.patch => 0020-Add-option-to-disable-the-sqlite3-module.patch} (61%)
 rename package/python3/{104-optional-tk.patch => 0021-Add-an-option-to-disable-the-tk-module.patch} (65%)
 rename package/python3/{105-optional-curses.patch => 0022-Add-an-option-to-disable-the-curses-module.patch} (61%)
 rename package/python3/{106-optional-expat.patch => 0023-Add-an-option-to-disable-expat.patch} (75%)
 rename package/python3/{107-optional-codecs-cjk.patch => 0024-Add-an-option-to-disable-CJK-codecs.patch} (58%)
 rename package/python3/{108-optional-nis.patch => 0025-Add-an-option-to-disable-NIS.patch} (63%)
 rename package/python3/{109-optional-unicodedata.patch => 0026-Add-an-option-to-disable-unicodedata.patch} (58%)
 rename package/python3/{110-optional-idle.patch => 0027-Add-an-option-to-disable-IDLE.patch} (71%)
 rename package/python3/{111-optional-decimal.patch => 0028-Add-an-option-to-disable-decimal.patch} (74%)
 rename package/python3/{112-optional-ossaudiodev.patch => 0029-Add-an-option-to-disable-the-ossaudiodev-module.patch} (54%)
 delete mode 100644 package/python3/006-cross-compile-getaddrinfo.patch

diff --git a/package/python3/001-remove-host-header-path.patch b/package/python3/0001-setup.py-do-not-add-invalid-header-locations.patch
similarity index 80%
rename from package/python3/001-remove-host-header-path.patch
rename to package/python3/0001-setup.py-do-not-add-invalid-header-locations.patch
index 1eff608..3fafd90 100644
--- a/package/python3/001-remove-host-header-path.patch
+++ b/package/python3/0001-setup.py-do-not-add-invalid-header-locations.patch
@@ -1,4 +1,7 @@
-setup.py: do not add invalid header locations
+From 03a4c313f42ea1bbdfc4c64a285b3930766c2b23 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Wed, 23 Dec 2015 11:28:34 +0100
+Subject: [PATCH] setup.py: do not add invalid header locations
 
 This piece of code incorrectly adds /usr/include to
 self.compiler.include_dirs, and results in the following invalid
@@ -20,11 +23,15 @@ The -I/usr/include is wrong when cross compiling, so we disable adding
 INCLUDEDIR and LIBDIR from the host when cross compiling.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Index: b/setup.py
-===================================================================
+---
+ setup.py | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index 2779658..d3bf8e5 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -493,7 +493,8 @@
+@@ -493,7 +493,8 @@ class PyBuildExt(build_ext):
                          add_dir_to_list(dir_list, directory)
  
          if os.path.normpath(sys.base_prefix) != '/usr' \
@@ -34,3 +41,6 @@ Index: b/setup.py
              # OSX note: Don't add LIBDIR and INCLUDEDIR to building a framework
              # (PYTHONFRAMEWORK is set) to avoid # linking problems when
              # building a framework with different architectures than
+-- 
+2.6.4
+
diff --git a/package/python3/003-sysconfigdata-install-location.patch b/package/python3/0002-Change-the-install-location-of-_sysconfigdata.py.patch
similarity index 76%
rename from package/python3/003-sysconfigdata-install-location.patch
rename to package/python3/0002-Change-the-install-location-of-_sysconfigdata.py.patch
index cd01ccf..57b55fb 100644
--- a/package/python3/003-sysconfigdata-install-location.patch
+++ b/package/python3/0002-Change-the-install-location-of-_sysconfigdata.py.patch
@@ -1,4 +1,7 @@
-Change the install location of _sysconfigdata.py
+From 2f706a2ba92c88f1c8288e34d1937b6ba0e0214c Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Wed, 23 Dec 2015 11:29:04 +0100
+Subject: [PATCH] Change the install location of _sysconfigdata.py
 
 The _sysconfigdata.py module contains definitions that are needed when
 building Python modules. In cross-compilation mode, when building
@@ -16,12 +19,16 @@ this directory gets added to the PYTHONPATH of the host Python
 interpreter when building Python modules for the target.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ Makefile.pre.in | 12 ++++++++++--
+ configure.ac    |  2 +-
+ 2 files changed, 11 insertions(+), 3 deletions(-)
 
-Index: b/Makefile.pre.in
-===================================================================
+diff --git a/Makefile.pre.in b/Makefile.pre.in
+index 76aef28..58dab28 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -559,6 +559,9 @@
+@@ -559,6 +559,9 @@ pybuilddir.txt: $(BUILDPYTHON)
  		rm -f ./pybuilddir.txt ; \
  		exit 1 ; \
  	fi
@@ -31,7 +38,7 @@ Index: b/Makefile.pre.in
  
  # Build the shared modules
  # Under GNU make, MAKEFLAGS are sorted and normalized; the 's' for
-@@ -1197,7 +1200,7 @@
+@@ -1197,7 +1200,7 @@ libinstall:	build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
  		else	true; \
  		fi; \
  	done
@@ -40,7 +47,7 @@ Index: b/Makefile.pre.in
  	do \
  		if test -x $$i; then \
  			$(INSTALL_SCRIPT) $$i $(DESTDIR)$(LIBDEST); \
-@@ -1207,6 +1210,11 @@
+@@ -1207,6 +1210,11 @@ libinstall:	build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
  			echo $(INSTALL_DATA) $$i $(LIBDEST); \
  		fi; \
  	done
@@ -52,7 +59,7 @@ Index: b/Makefile.pre.in
  	@for d in $(LIBSUBDIRS); \
  	do \
  		a=$(srcdir)/Lib/$$d; \
-@@ -1533,7 +1541,7 @@
+@@ -1533,7 +1541,7 @@ clean: pycremoval
  	find build -name 'fficonfig.h' -exec rm -f {} ';' || true
  	find build -name '*.py' -exec rm -f {} ';' || true
  	find build -name '*.py[co]' -exec rm -f {} ';' || true
@@ -61,11 +68,11 @@ Index: b/Makefile.pre.in
  	-rm -f Lib/lib2to3/*Grammar*.pickle
  	-rm -f Modules/_testembed Modules/_freeze_importlib
  
-Index: b/configure.ac
-===================================================================
+diff --git a/configure.ac b/configure.ac
+index a0d0afa..7b491b4 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -70,7 +70,7 @@
+@@ -70,7 +70,7 @@ if test "$cross_compiling" = yes; then
  	    AC_MSG_ERROR([python$PACKAGE_VERSION interpreter not found])
  	fi
          AC_MSG_RESULT($interp)
@@ -74,3 +81,6 @@ Index: b/configure.ac
      fi
  elif test "$cross_compiling" = maybe; then
      AC_MSG_ERROR([Cross compiling required --host=HOST-TUPLE and --build=ARCH])
+-- 
+2.6.4
+
diff --git a/package/python3/005-pyc-pyo-conditional.patch b/package/python3/0003-Make-the-build-of-pyc-and-pyo-files-conditional.patch
similarity index 69%
rename from package/python3/005-pyc-pyo-conditional.patch
rename to package/python3/0003-Make-the-build-of-pyc-and-pyo-files-conditional.patch
index 0d60ff6..03684af 100644
--- a/package/python3/005-pyc-pyo-conditional.patch
+++ b/package/python3/0003-Make-the-build-of-pyc-and-pyo-files-conditional.patch
@@ -1,8 +1,23 @@
-Index: b/Makefile.pre.in
-===================================================================
+From 7c5338161263c290f18b1ff90859084d314be98c Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Wed, 23 Dec 2015 11:29:35 +0100
+Subject: [PATCH] Make the build of pyc and pyo files conditional
+
+This commit adds two new configure options: --disable-pyc-build and
+--disable-pyo-build to disable the compilation of pyc and pyo files
+respectively.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ Makefile.pre.in |  8 ++++++++
+ configure.ac    | 12 ++++++++++++
+ 2 files changed, 20 insertions(+)
+
+diff --git a/Makefile.pre.in b/Makefile.pre.in
+index 58dab28..f1bdd99 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1248,24 +1248,32 @@
+@@ -1245,24 +1245,32 @@ libinstall:	build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
  		$(INSTALL_DATA) $(srcdir)/Modules/xxmodule.c \
  			$(DESTDIR)$(LIBDEST)/distutils/tests ; \
  	fi
@@ -35,11 +50,11 @@ Index: b/Makefile.pre.in
  	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
  		$(PYTHON_FOR_BUILD) -m lib2to3.pgen2.driver $(DESTDIR)$(LIBDEST)/lib2to3/Grammar.txt
  	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
-Index: b/configure.ac
-===================================================================
+diff --git a/configure.ac b/configure.ac
+index 7b491b4..f2c4705 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -939,6 +939,18 @@
+@@ -922,6 +922,18 @@ fi
  
  AC_MSG_CHECKING(LDLIBRARY)
  
@@ -58,3 +73,6 @@ Index: b/configure.ac
  # MacOSX framework builds need more magic. LDLIBRARY is the dynamic
  # library that we build, but we do not want to link against it (we
  # will find it with a -framework option). For this reason there is an
+-- 
+2.6.4
+
diff --git a/package/python3/0004-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch b/package/python3/0004-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
new file mode 100644
index 0000000..da2a65b
--- /dev/null
+++ b/package/python3/0004-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
@@ -0,0 +1,27 @@
+From ef95d6a49f17522ed120def8093fa2fc0b86cbc8 Mon Sep 17 00:00:00 2001
+From: Vanya Sergeev <vsergeev@gmail.com>
+Date: Wed, 23 Dec 2015 11:30:33 +0100
+Subject: [PATCH] Disable buggy_getaddrinfo configure test when cross-compiling
+ with IPv6 support
+
+Signed-off-by: Vanya Sergeev <vsergeev@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index f2c4705..6342b81 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -3415,7 +3415,7 @@ fi
+ 
+ AC_MSG_RESULT($ac_cv_buggy_getaddrinfo)
+ 
+-if test $have_getaddrinfo = no || test "$ac_cv_buggy_getaddrinfo" = yes
++if test $have_getaddrinfo = no || test "$cross_compiling" != "yes" -a "$ac_cv_buggy_getaddrinfo" = yes
+ then
+ 	if test $ipv6 = yes
+ 	then
+-- 
+2.6.4
+
diff --git a/package/python3/007-disable-extensions.patch b/package/python3/0005-Add-infrastructure-to-disable-the-build-of-certain-e.patch
similarity index 77%
rename from package/python3/007-disable-extensions.patch
rename to package/python3/0005-Add-infrastructure-to-disable-the-build-of-certain-e.patch
index ce931f7..4a32bb1 100644
--- a/package/python3/007-disable-extensions.patch
+++ b/package/python3/0005-Add-infrastructure-to-disable-the-build-of-certain-e.patch
@@ -1,4 +1,7 @@
-Add infrastructure to disable the build of certain extensions
+From 9eb1076b61e83647028a2f6b665b6f9afcb793b0 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Wed, 23 Dec 2015 11:31:08 +0100
+Subject: [PATCH] Add infrastructure to disable the build of certain extensions
 
 Some of the extensions part of the Python core have dependencies on
 external libraries (sqlite, tk, etc.) or are relatively big and not
@@ -33,16 +36,16 @@ then extended by Thomas Petazzoni
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 ---
- Makefile.pre.in |    4 ++++
- configure.ac    |    2 ++
- setup.py        |    5 ++++-
- 3 files changed, 10 insertions(+), 1 deletion(-)
+ Makefile.pre.in | 6 +++++-
+ configure.ac    | 2 ++
+ setup.py        | 5 ++++-
+ 3 files changed, 11 insertions(+), 2 deletions(-)
 
-Index: b/Makefile.pre.in
-===================================================================
+diff --git a/Makefile.pre.in b/Makefile.pre.in
+index f1bdd99..e0f9e0f 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -180,6 +180,8 @@
+@@ -177,6 +177,8 @@ FILEMODE=	644
  # configure script arguments
  CONFIG_ARGS=	@CONFIG_ARGS@
  
@@ -51,7 +54,7 @@ Index: b/Makefile.pre.in
  
  # Subdirectories with code
  SRCDIRS= 	@SRCDIRS@
-@@ -577,6 +579,7 @@
+@@ -574,6 +576,7 @@ sharedmods: $(BUILDPYTHON) pybuilddir.txt
  	esac; \
  	$(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' \
  		_TCLTK_INCLUDES='$(TCLTK_INCLUDES)' _TCLTK_LIBS='$(TCLTK_LIBS)' \
@@ -59,7 +62,7 @@ Index: b/Makefile.pre.in
  		$(PYTHON_FOR_BUILD) $(srcdir)/setup.py $$quiet build
  
  # Build static library
-@@ -1387,7 +1390,8 @@
+@@ -1384,7 +1387,8 @@ libainstall:	all python-config
  # Install the dynamically loadable modules
  # This goes into $(exec_prefix)
  sharedinstall: sharedmods
@@ -69,11 +72,11 @@ Index: b/Makefile.pre.in
  	   	--prefix=$(prefix) \
  		--install-scripts=$(BINDIR) \
  		--install-platlib=$(DESTSHARED) \
-Index: b/configure.ac
-===================================================================
+diff --git a/configure.ac b/configure.ac
+index 6342b81..a3026b8 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2369,6 +2369,8 @@
+@@ -2352,6 +2352,8 @@ LIBS="$withval $LIBS"
  
  PKG_PROG_PKG_CONFIG
  
@@ -82,11 +85,11 @@ Index: b/configure.ac
  # Check for use of the system expat library
  AC_MSG_CHECKING(for --with-system-expat)
  AC_ARG_WITH(system_expat,
-Index: b/setup.py
-===================================================================
+diff --git a/setup.py b/setup.py
+index d3bf8e5..2a504d2 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -39,7 +39,10 @@
+@@ -39,7 +39,10 @@ host_platform = get_platform()
  COMPILED_WITH_PYDEBUG = ('--with-pydebug' in sysconfig.get_config_var("CONFIG_ARGS"))
  
  # This global variable is used to hold the list of modules to be disabled.
@@ -98,3 +101,6 @@ Index: b/setup.py
  
  def add_dir_to_list(dirlist, dir):
      """Add the directory 'dir' to the list 'dirlist' (after any relative
+-- 
+2.6.4
+
diff --git a/package/python3/008-distutils-sysconfig-use-sysconfigdata.patch b/package/python3/0006-distutils-sysconfig-use-sysconfigdata.patch
similarity index 69%
rename from package/python3/008-distutils-sysconfig-use-sysconfigdata.patch
rename to package/python3/0006-distutils-sysconfig-use-sysconfigdata.patch
index d0758b1..dcf32d6 100644
--- a/package/python3/008-distutils-sysconfig-use-sysconfigdata.patch
+++ b/package/python3/0006-distutils-sysconfig-use-sysconfigdata.patch
@@ -1,8 +1,21 @@
-Index: b/Lib/distutils/sysconfig.py
-===================================================================
+From bdb9cccdc2993e43af1e57ad3b8b0055bab64ba0 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Wed, 23 Dec 2015 11:32:23 +0100
+Subject: [PATCH] distutils/sysconfig: use sysconfigdata
+
+In order to make the use of sysconfig cross-compilation compatible,
+use _sysconfigdata.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ Lib/distutils/sysconfig.py | 37 ++++---------------------------------
+ 1 file changed, 4 insertions(+), 33 deletions(-)
+
+diff --git a/Lib/distutils/sysconfig.py b/Lib/distutils/sysconfig.py
+index a1452fe..1df20ad 100644
 --- a/Lib/distutils/sysconfig.py
 +++ b/Lib/distutils/sysconfig.py
-@@ -423,40 +423,11 @@
+@@ -423,40 +423,11 @@ def expand_makefile_vars(s, vars):
  _config_vars = None
  
  def _init_posix():
@@ -47,3 +60,6 @@ Index: b/Lib/distutils/sysconfig.py
  
  def _init_nt():
      """Initialize the module as appropriate for NT"""
+-- 
+2.6.4
+
diff --git a/package/python3/009-distutils-use-python-sysroot.patch b/package/python3/0007-Adjust-library-header-paths-for-cross-compilation.patch
similarity index 76%
rename from package/python3/009-distutils-use-python-sysroot.patch
rename to package/python3/0007-Adjust-library-header-paths-for-cross-compilation.patch
index 06f2039..59d4ccd 100644
--- a/package/python3/009-distutils-use-python-sysroot.patch
+++ b/package/python3/0007-Adjust-library-header-paths-for-cross-compilation.patch
@@ -1,4 +1,7 @@
-Adjust library/header paths for cross-compilation
+From 678143ce6161379a3eebc20db6634f0c247f8605 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Wed, 23 Dec 2015 11:33:14 +0100
+Subject: [PATCH] Adjust library/header paths for cross-compilation
 
 When cross-compiling third-party extensions, the get_python_inc() or
 get_python_lib() can be called, to return the path to headers or
@@ -12,12 +15,32 @@ values, and get correct header/library paths when cross-compiling
 third-party Python modules.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ Lib/distutils/command/build_ext.py |  5 ++++-
+ Lib/distutils/sysconfig.py         | 15 +++++++++++----
+ 2 files changed, 15 insertions(+), 5 deletions(-)
 
-Index: b/Lib/distutils/sysconfig.py
-===================================================================
+diff --git a/Lib/distutils/command/build_ext.py b/Lib/distutils/command/build_ext.py
+index acbe648..494a8c9 100644
+--- a/Lib/distutils/command/build_ext.py
++++ b/Lib/distutils/command/build_ext.py
+@@ -239,7 +239,10 @@ class build_ext(Command):
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
+diff --git a/Lib/distutils/sysconfig.py b/Lib/distutils/sysconfig.py
+index 1df20ad..905d280 100644
 --- a/Lib/distutils/sysconfig.py
 +++ b/Lib/distutils/sysconfig.py
-@@ -16,10 +16,17 @@
+@@ -16,10 +16,17 @@ import sys
  from .errors import DistutilsPlatformError
  
  # These are needed in a couple of spots, so just compute them once.
@@ -39,19 +62,6 @@ Index: b/Lib/distutils/sysconfig.py
  
  # Path to the base directory of the project. On Windows the binary may
  # live in project/PCBuild9.  If we're dealing with an x64 Windows build,
-Index: b/Lib/distutils/command/build_ext.py
-===================================================================
---- a/Lib/distutils/command/build_ext.py
-+++ b/Lib/distutils/command/build_ext.py
-@@ -239,7 +239,10 @@
-         if (sysconfig.get_config_var('Py_ENABLE_SHARED')):
-             if not sysconfig.python_build:
-                 # building third party extensions
--                self.library_dirs.append(sysconfig.get_config_var('LIBDIR'))
-+                libdir = sysconfig.get_config_var('LIBDIR')
-+                if "_python_sysroot" in os.environ:
-+                    libdir = os.environ.get("_python_sysroot") + libdir
-+                self.library_dirs.append(libdir)
-             else:
-                 # building python standard extensions
-                 self.library_dirs.append('.')
+-- 
+2.6.4
+
diff --git a/package/python3/010-no-termcap-host-path.patch b/package/python3/0008-Don-t-look-in-usr-lib-termcap-for-libraries.patch
similarity index 67%
rename from package/python3/010-no-termcap-host-path.patch
rename to package/python3/0008-Don-t-look-in-usr-lib-termcap-for-libraries.patch
index 46c8a77..19a76cf 100644
--- a/package/python3/010-no-termcap-host-path.patch
+++ b/package/python3/0008-Don-t-look-in-usr-lib-termcap-for-libraries.patch
@@ -1,12 +1,18 @@
-Don't look in /usr/lib/termcap for libraries
+From 3ef1e30b88c4166f22220812b68e14f39f7ed15b Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Wed, 23 Dec 2015 11:36:00 +0100
+Subject: [PATCH] Don't look in /usr/lib/termcap for libraries
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ setup.py | 5 +----
+ 1 file changed, 1 insertion(+), 4 deletions(-)
 
-Index: b/setup.py
-===================================================================
+diff --git a/setup.py b/setup.py
+index 2a504d2..acc4ad0 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -733,12 +733,9 @@
+@@ -733,12 +733,9 @@ class PyBuildExt(build_ext):
                  pass # Issue 7384: Already linked against curses or tinfo.
              elif curses_library:
                  readline_libs.append(curses_library)
@@ -20,3 +26,6 @@ Index: b/setup.py
                                     extra_link_args=readline_extra_link_args,
                                     libraries=readline_libs) )
          else:
+-- 
+2.6.4
+
diff --git a/package/python3/012-dont-add-multiarch-path.patch b/package/python3/0009-Don-t-add-multiarch-paths.patch
similarity index 70%
rename from package/python3/012-dont-add-multiarch-path.patch
rename to package/python3/0009-Don-t-add-multiarch-paths.patch
index f32372c..693ab6a 100644
--- a/package/python3/012-dont-add-multiarch-path.patch
+++ b/package/python3/0009-Don-t-add-multiarch-paths.patch
@@ -1,4 +1,7 @@
-Don't add multiarch paths
+From b910b3a6e61afcaa6f77b533a5cb4290c528f439 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Wed, 23 Dec 2015 11:36:27 +0100
+Subject: [PATCH] Don't add multiarch paths
 
 The add_multiarch_paths() function leads, in certain build
 environments, to the addition of host header paths to the CFLAGS,
@@ -9,12 +12,15 @@ cross-compiling.
 Investigation done by David <buildroot-2014@inbox.com>.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ setup.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: b/setup.py
-===================================================================
+diff --git a/setup.py b/setup.py
+index acc4ad0..eab709e 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -456,10 +456,10 @@
+@@ -456,10 +456,10 @@ class PyBuildExt(build_ext):
          if not cross_compiling:
              add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
              add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
@@ -26,3 +32,6 @@ Index: b/setup.py
  
          # Add paths specified in the environment variables LDFLAGS and
          # CPPFLAGS for header and library files.
+-- 
+2.6.4
+
diff --git a/package/python3/013-abort-on-failed-modules.patch b/package/python3/0010-Abort-on-failed-module-build.patch
similarity index 57%
rename from package/python3/013-abort-on-failed-modules.patch
rename to package/python3/0010-Abort-on-failed-module-build.patch
index 5ad86fb..d2e9822 100644
--- a/package/python3/013-abort-on-failed-modules.patch
+++ b/package/python3/0010-Abort-on-failed-module-build.patch
@@ -1,4 +1,7 @@
-Abort on failed module build
+From 420e08fc9e77b650d11ce420f85257ce1710b70d Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Wed, 23 Dec 2015 11:43:24 +0100
+Subject: [PATCH] Abort on failed module build
 
 When building a Python module fails, the setup.py script currently
 doesn't exit with an error, and simply continues. This is not a really
@@ -6,12 +9,15 @@ nice behavior, so this patch changes setup.py to abort with an error,
 so that the build issue is clearly noticeable.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ setup.py | 1 +
+ 1 file changed, 1 insertion(+)
 
-Index: b/setup.py
-===================================================================
+diff --git a/setup.py b/setup.py
+index eab709e..86758ce 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -284,6 +284,7 @@
+@@ -284,6 +284,7 @@ class PyBuildExt(build_ext):
              print("Failed to build these modules:")
              print_three_column(failed)
              print()
@@ -19,3 +25,6 @@ Index: b/setup.py
  
      def build_extension(self, ext):
  
+-- 
+2.6.4
+
diff --git a/package/python3/014-serial-ioctl-workaround.patch b/package/python3/0011-Serial-ioctl-workaround.patch
similarity index 64%
rename from package/python3/014-serial-ioctl-workaround.patch
rename to package/python3/0011-Serial-ioctl-workaround.patch
index e4aae00..f1db62b 100644
--- a/package/python3/014-serial-ioctl-workaround.patch
+++ b/package/python3/0011-Serial-ioctl-workaround.patch
@@ -1,4 +1,7 @@
-Serial ioctl() workaround
+From f67b0073a30eb83d42a2ead0a62020dfe5db8d1e Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Wed, 23 Dec 2015 11:44:02 +0100
+Subject: [PATCH] Serial ioctl() workaround
 
 The ioctls.h of some architectures (notably xtensa) references structs from
 linux/serial.h. Make sure to include this header as well.
@@ -8,8 +11,11 @@ but isn't actually referenced in modern kernels.
 
 Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 ---
-Index: b/Modules/termios.c
-===================================================================
+ Modules/termios.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/Modules/termios.c b/Modules/termios.c
+index b78d33e..58b0444 100644
 --- a/Modules/termios.c
 +++ b/Modules/termios.c
 @@ -9,7 +9,9 @@
@@ -22,3 +28,6 @@ Index: b/Modules/termios.c
  
  /* HP-UX requires that this be included to pick up MDCD, MCTS, MDSR,
   * MDTR, MRI, and MRTS (appearantly used internally by some things
+-- 
+2.6.4
+
diff --git a/package/python3/015-distutils-scripts-dont-adjust-shebang.patch b/package/python3/0012-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
similarity index 61%
rename from package/python3/015-distutils-scripts-dont-adjust-shebang.patch
rename to package/python3/0012-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
index ed2f193..e4fbf4e 100644
--- a/package/python3/015-distutils-scripts-dont-adjust-shebang.patch
+++ b/package/python3/0012-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
@@ -1,4 +1,8 @@
-Do not adjust the shebang of Python scripts for cross-compilation
+From 2cac07af643d989b352cccc3b96d86ed269df9b1 Mon Sep 17 00:00:00 2001
+From: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
+Date: Wed, 23 Dec 2015 11:44:30 +0100
+Subject: [PATCH] Do not adjust the shebang of Python scripts for
+ cross-compilation
 
 The copy_scripts() method in distutils copies the scripts listed in
 the setup file and adjusts the first line to refer to the current
@@ -9,12 +13,15 @@ This patch modifies copy_scripts() to preserve the shebang when
 cross-compilation is detected.
 
 Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
+---
+ Lib/distutils/command/build_scripts.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: b/Lib/distutils/command/build_scripts.py
-===================================================================
+diff --git a/Lib/distutils/command/build_scripts.py b/Lib/distutils/command/build_scripts.py
+index 90a8380..bdf4cf1 100644
 --- a/Lib/distutils/command/build_scripts.py
 +++ b/Lib/distutils/command/build_scripts.py
-@@ -91,7 +91,7 @@
+@@ -91,7 +91,7 @@ class build_scripts(Command):
                      adjust = True
                      post_interp = match.group(1) or b''
  
@@ -23,3 +30,6 @@ Index: b/Lib/distutils/command/build_scripts.py
                  log.info("copying and adjusting %s -> %s", script,
                           self.build_dir)
                  updated_files.append(outfile)
+-- 
+2.6.4
+
diff --git a/package/python3/017-python-config-include-libdir.patch b/package/python3/0013-Misc-python-config.sh.in-ensure-sed-invocations-only.patch
similarity index 89%
rename from package/python3/017-python-config-include-libdir.patch
rename to package/python3/0013-Misc-python-config.sh.in-ensure-sed-invocations-only.patch
index 46d4633..f9c7225 100644
--- a/package/python3/017-python-config-include-libdir.patch
+++ b/package/python3/0013-Misc-python-config.sh.in-ensure-sed-invocations-only.patch
@@ -1,4 +1,4 @@
-From 50f34d2cac63b6bf0935294a7d63d9451714f4c4 Mon Sep 17 00:00:00 2001
+From 4c0893221e2978854174806f7e14f7643eea32e7 Mon Sep 17 00:00:00 2001
 From: Peter Korsgaard <peter@korsgaard.com>
 Date: Thu, 20 Nov 2014 13:24:59 +0100
 Subject: [PATCH] Misc/python-config.sh.in: ensure sed invocations only match
@@ -24,11 +24,11 @@ Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
  Misc/python-config.sh.in | 12 ++++++------
  1 file changed, 6 insertions(+), 6 deletions(-)
 
-Index: b/Misc/python-config.sh.in
-===================================================================
+diff --git a/Misc/python-config.sh.in b/Misc/python-config.sh.in
+index 64c81e5..f75eec5 100644
 --- a/Misc/python-config.sh.in
 +++ b/Misc/python-config.sh.in
-@@ -29,12 +29,12 @@
+@@ -29,12 +29,12 @@ prefix_real=$(installed_prefix "$0")
  
  # Use sed to fix paths from their built-to locations to their installed-to
  # locations.
@@ -46,7 +46,7 @@ Index: b/Misc/python-config.sh.in
  VERSION="@VERSION@"
  LIBM="@LIBM@"
  LIBC="@LIBC@"
-@@ -48,7 +48,7 @@
+@@ -48,7 +48,7 @@ OPT="@OPT@"
  PY_ENABLE_SHARED="@PY_ENABLE_SHARED@"
  LDVERSION="@LDVERSION@"
  LIBDEST=${prefix}/lib/python${VERSION}
@@ -55,3 +55,6 @@ Index: b/Misc/python-config.sh.in
  SO="@SO@"
  PYTHONFRAMEWORK="@PYTHONFRAMEWORK@"
  INCDIR="-I$includedir/python${VERSION}${ABIFLAGS}"
+-- 
+2.6.4
+
diff --git a/package/python3/018-ncursesw-remove-wrong-includedir.patch b/package/python3/0014-Do-not-harcode-invalid-path-to-ncursesw-headers.patch
similarity index 62%
rename from package/python3/018-ncursesw-remove-wrong-includedir.patch
rename to package/python3/0014-Do-not-harcode-invalid-path-to-ncursesw-headers.patch
index 1c26438..4a64427 100644
--- a/package/python3/018-ncursesw-remove-wrong-includedir.patch
+++ b/package/python3/0014-Do-not-harcode-invalid-path-to-ncursesw-headers.patch
@@ -1,4 +1,7 @@
-Do not harcode invalid path to ncursesw headers
+From a87f08318cf40a27d41957dcc7312c3b3083ba86 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Wed, 23 Dec 2015 11:45:13 +0100
+Subject: [PATCH] Do not harcode invalid path to ncursesw headers
 
 Adding /usr/include/ncursesw is obviously invalid when
 cross-compiling. Since the ncursesw headers are no longer installed in
@@ -6,12 +9,15 @@ usr/include/ncursesw/, but directly in usr/include, there is anyway no
 need for a special header path.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ setup.py | 1 -
+ 1 file changed, 1 deletion(-)
 
-Index: b/setup.py
-===================================================================
+diff --git a/setup.py b/setup.py
+index 86758ce..565c304 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -1276,7 +1276,6 @@
+@@ -1276,7 +1276,6 @@ class PyBuildExt(build_ext):
          panel_library = 'panel'
          if curses_library == 'ncursesw':
              curses_defines.append(('HAVE_NCURSESW', '1'))
@@ -19,3 +25,6 @@ Index: b/setup.py
              # Bug 1464056: If _curses.so links with ncursesw,
              # _curses_panel.so must link with panelw.
              panel_library = 'panelw'
+-- 
+2.6.4
+
diff --git a/package/python3/019-fix-add-gcc-paths-logic.patch b/package/python3/0015-Override-system-locale-and-set-to-default-when-addin.patch
similarity index 69%
rename from package/python3/019-fix-add-gcc-paths-logic.patch
rename to package/python3/0015-Override-system-locale-and-set-to-default-when-addin.patch
index 179a29a..e358e44 100644
--- a/package/python3/019-fix-add-gcc-paths-logic.patch
+++ b/package/python3/0015-Override-system-locale-and-set-to-default-when-addin.patch
@@ -1,4 +1,8 @@
-Override system locale and set to default when adding gcc paths
+From 807357dc50a5a97016ce22646b5eb6a5b64a1a5d Mon Sep 17 00:00:00 2001
+From: Samuel Cabrero <samuelcabrero@gmail.com>
+Date: Wed, 23 Dec 2015 11:45:48 +0100
+Subject: [PATCH] Override system locale and set to default when adding gcc
+ paths
 
 Forces the use of the default locale in the function
 add_gcc_paths, which is called when cross compiling to add the
@@ -11,12 +15,15 @@ any system library (eg. libz, libssl, etc.)
 
 Signed-off-by: Samuel Cabrero <samuelcabrero@gmail.com>
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ setup.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: b/setup.py
-===================================================================
+diff --git a/setup.py b/setup.py
+index 565c304..8966779 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -423,7 +423,7 @@
+@@ -423,7 +423,7 @@ class PyBuildExt(build_ext):
          tmpfile = os.path.join(self.build_temp, 'gccpaths')
          if not os.path.exists(self.build_temp):
              os.makedirs(self.build_temp)
@@ -25,3 +32,6 @@ Index: b/setup.py
          is_gcc = False
          in_incdirs = False
          inc_dirs = []
+-- 
+2.6.4
+
diff --git a/package/python3/020-importlib-no-pep3147.patch b/package/python3/0016-Add-importlib-fix-for-PEP-3147-issue.patch
similarity index 80%
rename from package/python3/020-importlib-no-pep3147.patch
rename to package/python3/0016-Add-importlib-fix-for-PEP-3147-issue.patch
index 779b5e2..02f1d16 100644
--- a/package/python3/020-importlib-no-pep3147.patch
+++ b/package/python3/0016-Add-importlib-fix-for-PEP-3147-issue.patch
@@ -1,4 +1,7 @@
-Add importlib fix for PEP 3147 issue
+From 1153f503a38daf6388021575f1ad6ce8b702911b Mon Sep 17 00:00:00 2001
+From: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
+Date: Wed, 23 Dec 2015 11:46:14 +0100
+Subject: [PATCH] Add importlib fix for PEP 3147 issue
 
 Python 3 has a new standard for installing .pyc file, called PEP
 3147. Unfortunately, this standard requires both the .py and .pyc
@@ -15,11 +18,15 @@ This effectively disables PEP 3147 for:
 * Packages built with automake that use the `py-compile` helper
 
 Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
+---
+ Lib/importlib/_bootstrap.py | 26 +++++---------------------
+ 1 file changed, 5 insertions(+), 21 deletions(-)
 
-diff -purN a/Lib/importlib/_bootstrap.py b/Lib/importlib/_bootstrap.py
---- a/Lib/importlib/_bootstrap.py	2015-02-25 12:27:44.000000000 +0100
-+++ b/Lib/importlib/_bootstrap.py	2015-08-27 17:33:26.167191059 +0200
-@@ -444,8 +444,6 @@ def cache_from_source(path, debug_overri
+diff --git a/Lib/importlib/_bootstrap.py b/Lib/importlib/_bootstrap.py
+index 5b91c05..a1755ec 100644
+--- a/Lib/importlib/_bootstrap.py
++++ b/Lib/importlib/_bootstrap.py
+@@ -444,8 +444,6 @@ def cache_from_source(path, debug_override=None):
      If debug_override is not None, then it must be a boolean and is used in
      place of sys.flags.optimize.
  
@@ -28,7 +35,7 @@ diff -purN a/Lib/importlib/_bootstrap.py b/Lib/importlib/_bootstrap.py
      """
      debug = not sys.flags.optimize if debug_override is None else debug_override
      if debug:
-@@ -454,33 +452,19 @@ def cache_from_source(path, debug_overri
+@@ -454,33 +452,19 @@ def cache_from_source(path, debug_override=None):
          suffixes = OPTIMIZED_BYTECODE_SUFFIXES
      head, tail = _path_split(path)
      base, sep, rest = tail.rpartition('.')
@@ -67,3 +74,6 @@ diff -purN a/Lib/importlib/_bootstrap.py b/Lib/importlib/_bootstrap.py
      return _path_join(head, base_filename + SOURCE_SUFFIXES[0])
  
  
+-- 
+2.6.4
+
diff --git a/package/python3/100-optional-test-modules.patch b/package/python3/0017-Add-an-option-to-disable-installation-of-test-module.patch
similarity index 81%
rename from package/python3/100-optional-test-modules.patch
rename to package/python3/0017-Add-an-option-to-disable-installation-of-test-module.patch
index 765e937..6e0f07c 100644
--- a/package/python3/100-optional-test-modules.patch
+++ b/package/python3/0017-Add-an-option-to-disable-installation-of-test-module.patch
@@ -1,21 +1,23 @@
-Add an option to disable installation of test modules
+From 3cdd905ad1ff001713d20b768c001b5299a2e72c Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Wed, 23 Dec 2015 11:47:00 +0100
+Subject: [PATCH] Add an option to disable installation of test modules
 
 The Python standard distribution comes with many test modules, that
 are not necessarly useful on embedded targets.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
-
 ---
- Makefile.pre.in |   50 ++++++++++++++++++++++++++++++++------------------
- configure.ac    |    6 ++++++
- 2 files changed, 38 insertions(+), 18 deletions(-)
+ Makefile.pre.in | 56 ++++++++++++++++++++++++++++++++++++--------------------
+ configure.ac    |  6 ++++++
+ 2 files changed, 42 insertions(+), 20 deletions(-)
 
-Index: b/Makefile.pre.in
-===================================================================
+diff --git a/Makefile.pre.in b/Makefile.pre.in
+index e0f9e0f..12fae84 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1136,8 +1136,30 @@
+@@ -1133,8 +1133,30 @@ PLATDIR=	plat-$(MACHDEP)
  EXTRAPLATDIR= @EXTRAPLATDIR@
  MACHDEPS=	$(PLATDIR) $(EXTRAPLATDIR)
  XMLLIBSUBDIRS=  xml xml/dom xml/etree xml/parsers xml/sax
@@ -48,7 +50,7 @@ Index: b/Makefile.pre.in
  		test/audiodata \
  		test/capath test/data \
  		test/cjkencodings test/decimaltestdata test/xmltestdata \
-@@ -1164,28 +1186,22 @@
+@@ -1161,28 +1183,22 @@ LIBSUBDIRS=	tkinter tkinter/test tkinter/test/test_tkinter \
  		test/test_importlib/namespace_pkgs/project3/parent/child \
                  test/test_importlib/namespace_pkgs/module_and_namespace_package \
                  test/test_importlib/namespace_pkgs/module_and_namespace_package/a_test \
@@ -89,11 +91,11 @@ Index: b/Makefile.pre.in
  libinstall:	build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
  	@for i in $(SCRIPTDIR) $(LIBDEST); \
  	do \
-Index: b/configure.ac
-===================================================================
+diff --git a/configure.ac b/configure.ac
+index a3026b8..b7a8836 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2676,6 +2676,12 @@
+@@ -2659,6 +2659,12 @@ if test "$posix_threads" = "yes"; then
  fi
  
  
@@ -106,3 +108,6 @@ Index: b/configure.ac
  # Check for enable-ipv6
  AH_TEMPLATE(ENABLE_IPV6, [Define if --enable-ipv6 is specified])
  AC_MSG_CHECKING([if --enable-ipv6 is specified])
+-- 
+2.6.4
+
diff --git a/package/python3/101-optional-pydoc.patch b/package/python3/0018-Add-an-option-to-disable-pydoc.patch
similarity index 72%
rename from package/python3/101-optional-pydoc.patch
rename to package/python3/0018-Add-an-option-to-disable-pydoc.patch
index a1b63d5..22f194a 100644
--- a/package/python3/101-optional-pydoc.patch
+++ b/package/python3/0018-Add-an-option-to-disable-pydoc.patch
@@ -1,22 +1,24 @@
-Add an option to disable pydoc
+From 99ef88cb47a396e2c7005e59e50d34e0a60dd3cb Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Wed, 23 Dec 2015 11:47:11 +0100
+Subject: [PATCH] Add an option to disable pydoc
 
 It removes 0.5 MB of data from the target plus the pydoc script
 itself.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
-
 ---
- Makefile.pre.in |    8 +++++++-
- configure.ac    |    5 +++++
- setup.py        |    9 +++++++--
+ Makefile.pre.in | 8 +++++++-
+ configure.ac    | 5 +++++
+ setup.py        | 9 +++++++--
  3 files changed, 19 insertions(+), 3 deletions(-)
 
-Index: b/Makefile.pre.in
-===================================================================
+diff --git a/Makefile.pre.in b/Makefile.pre.in
+index 12fae84..5e2333e 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1103,7 +1103,9 @@
+@@ -1100,7 +1100,9 @@ bininstall: altbininstall
  	-rm -f $(DESTDIR)$(BINDIR)/idle3
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s idle$(VERSION) idle3)
  	-rm -f $(DESTDIR)$(BINDIR)/pydoc3
@@ -26,7 +28,7 @@ Index: b/Makefile.pre.in
  	-rm -f $(DESTDIR)$(BINDIR)/2to3
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s 2to3-$(VERSION) 2to3)
  	-rm -f $(DESTDIR)$(BINDIR)/pyvenv
-@@ -1154,7 +1156,7 @@
+@@ -1151,7 +1153,7 @@ LIBSUBDIRS=	tkinter \
  		multiprocessing multiprocessing/dummy \
  		unittest \
  		venv venv/scripts venv/scripts/posix \
@@ -35,7 +37,7 @@ Index: b/Makefile.pre.in
  
  TESTSUBDIRS = 	tkinter/test tkinter/test/test_tkinter tkinter/test/test_ttk \
  		test test/test_asyncio \
-@@ -1198,6 +1200,10 @@
+@@ -1195,6 +1197,10 @@ TESTSUBDIRS = 	tkinter/test tkinter/test/test_tkinter tkinter/test/test_ttk \
  		test/test_importlib/import_ test/test_importlib/source \
  		unittest/test unittest/test/testmock
  
@@ -46,11 +48,11 @@ Index: b/Makefile.pre.in
  ifeq (@TEST_MODULES@,yes)
  LIBSUBDIRS += $(TESTSUBDIRS)
  endif
-Index: b/configure.ac
-===================================================================
+diff --git a/configure.ac b/configure.ac
+index b7a8836..2e75345 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2675,6 +2675,11 @@
+@@ -2658,6 +2658,11 @@ if test "$posix_threads" = "yes"; then
        AC_CHECK_FUNCS(pthread_atfork)
  fi
  
@@ -62,11 +64,11 @@ Index: b/configure.ac
  
  AC_SUBST(TEST_MODULES)
  
-Index: b/setup.py
-===================================================================
+diff --git a/setup.py b/setup.py
+index 8966779..69198db 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -2200,6 +2200,12 @@
+@@ -2200,6 +2200,12 @@ def main():
      # turn off warnings when deprecated modules are imported
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
@@ -79,7 +81,7 @@ Index: b/setup.py
      setup(# PyPI Metadata (PEP 301)
            name = "Python",
            version = sys.version.split()[0],
-@@ -2224,8 +2230,7 @@
+@@ -2224,8 +2230,7 @@ def main():
            # If you change the scripts installed here, you also need to
            # check the PyBuildScripts command above, and change the links
            # created by the bininstall target in Makefile.pre.in
@@ -89,3 +91,6 @@ Index: b/setup.py
          )
  
  # --install-platlib
+-- 
+2.6.4
+
diff --git a/package/python3/102-optional-2to3.patch b/package/python3/0019-Add-an-option-to-disable-lib2to3.patch
similarity index 75%
rename from package/python3/102-optional-2to3.patch
rename to package/python3/0019-Add-an-option-to-disable-lib2to3.patch
index 4181456..8a22c0f 100644
--- a/package/python3/102-optional-2to3.patch
+++ b/package/python3/0019-Add-an-option-to-disable-lib2to3.patch
@@ -1,22 +1,24 @@
-Add an option to disable lib2to3
+From 4d6bc8497ab740ae23a7091ff91dba06a63ba877 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Wed, 23 Dec 2015 11:48:44 +0100
+Subject: [PATCH] Add an option to disable lib2to3
 
 lib2to3 is a library to convert Python 2.x code to Python 3.x. As
 such, it is probably not very useful on embedded system targets.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
-
 ---
- Makefile.pre.in |   18 ++++++++++++++----
- configure.ac    |    6 ++++++
- setup.py        |    5 +++--
- 3 files changed, 23 insertions(+), 6 deletions(-)
+ Makefile.pre.in | 16 ++++++++++++----
+ configure.ac    |  6 ++++++
+ setup.py        |  5 +++--
+ 3 files changed, 21 insertions(+), 6 deletions(-)
 
-Index: b/Makefile.pre.in
-===================================================================
+diff --git a/Makefile.pre.in b/Makefile.pre.in
+index 5e2333e..6656f48 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1107,7 +1107,9 @@
+@@ -1104,7 +1104,9 @@ ifeq (@PYDOC@,yes)
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s pydoc$(VERSION) pydoc3)
  endif
  	-rm -f $(DESTDIR)$(BINDIR)/2to3
@@ -26,7 +28,7 @@ Index: b/Makefile.pre.in
  	-rm -f $(DESTDIR)$(BINDIR)/pyvenv
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s pyvenv-$(VERSION) pyvenv)
  	if test "x$(LIPO_32BIT_FLAGS)" != "x" ; then \
-@@ -1147,7 +1149,6 @@
+@@ -1144,7 +1146,6 @@ LIBSUBDIRS=	tkinter \
  		html json http dbm xmlrpc \
  		sqlite3 \
  		logging csv wsgiref urllib \
@@ -34,7 +36,7 @@ Index: b/Makefile.pre.in
  		ctypes ctypes/macholib \
  		idlelib idlelib/Icons \
  		distutils distutils/command $(XMLLIBSUBDIRS) \
-@@ -1189,9 +1190,6 @@
+@@ -1186,9 +1187,6 @@ TESTSUBDIRS = 	tkinter/test tkinter/test/test_tkinter tkinter/test/test_ttk \
                  test/test_importlib/namespace_pkgs/module_and_namespace_package \
                  test/test_importlib/namespace_pkgs/module_and_namespace_package/a_test \
  		sqlite3/test \
@@ -44,7 +46,7 @@ Index: b/Makefile.pre.in
  		ctypes/test \
  		idlelib/idle_test \
  		distutils/tests \
-@@ -1204,6 +1202,14 @@
+@@ -1201,6 +1199,14 @@ ifeq (@PYDOC@,yes)
  LIBSUBDIRS += pydoc_data
  endif
  
@@ -59,8 +61,8 @@ Index: b/Makefile.pre.in
  ifeq (@TEST_MODULES@,yes)
  LIBSUBDIRS += $(TESTSUBDIRS)
  endif
-@@ -1299,10 +1305,12 @@
- 		-d $(LIBDEST)/site-packages -f $(STDLIB_CACHE_FLAGS) \
+@@ -1296,10 +1302,12 @@ ifeq (@PYO_BUILD@,yes)
+ 		-d $(LIBDEST)/site-packages -f \
  		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
  endif
 +ifeq (@LIB2TO3@,yes)
@@ -72,11 +74,28 @@ Index: b/Makefile.pre.in
  
  # Create the PLATDIR source directory, if one wasn't distributed..
  $(srcdir)/Lib/$(PLATDIR):
-Index: b/setup.py
-===================================================================
+diff --git a/configure.ac b/configure.ac
+index 2e75345..0ed6b17 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -2670,6 +2670,12 @@ AC_ARG_ENABLE(test-modules,
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
+diff --git a/setup.py b/setup.py
+index 69198db..a2bf05a 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -2201,10 +2201,11 @@
+@@ -2201,10 +2201,11 @@ def main():
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
  
@@ -90,20 +109,6 @@ Index: b/setup.py
  
      setup(# PyPI Metadata (PEP 301)
            name = "Python",
-Index: b/configure.ac
-===================================================================
---- a/configure.ac
-+++ b/configure.ac
-@@ -2687,6 +2687,12 @@
- 	AS_HELP_STRING([--disable-test-modules], [disable test modules]),
- 	[ TEST_MODULES="${enableval}" ], [ TEST_MODULES=yes ])
- 
-+AC_SUBST(LIB2TO3)
-+
-+AC_ARG_ENABLE(lib2to3,
-+	AS_HELP_STRING([--disable-lib2to3], [disable lib2to3]),
-+	[ LIB2TO3="${enableval}" ], [ LIB2TO3=yes ])
-+
- # Check for enable-ipv6
- AH_TEMPLATE(ENABLE_IPV6, [Define if --enable-ipv6 is specified])
- AC_MSG_CHECKING([if --enable-ipv6 is specified])
+-- 
+2.6.4
+
diff --git a/package/python3/103-optional-sqlite.patch b/package/python3/0020-Add-option-to-disable-the-sqlite3-module.patch
similarity index 61%
rename from package/python3/103-optional-sqlite.patch
rename to package/python3/0020-Add-option-to-disable-the-sqlite3-module.patch
index f8e5352..26a7b34 100644
--- a/package/python3/103-optional-sqlite.patch
+++ b/package/python3/0020-Add-option-to-disable-the-sqlite3-module.patch
@@ -1,38 +1,20 @@
-Add option to disable the sqlite3 module
+From f218ef22019d4c03427113982edc42beddd05683 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Wed, 23 Dec 2015 11:49:01 +0100
+Subject: [PATCH] Add option to disable the sqlite3 module
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
-
 ---
- Makefile.pre.in |    9 +++++++--
- configure.ac    |    9 +++++++++
- 2 files changed, 16 insertions(+), 2 deletions(-)
+ Makefile.pre.in | 7 +++++--
+ configure.ac    | 9 +++++++++
+ 2 files changed, 14 insertions(+), 2 deletions(-)
 
-Index: b/configure.ac
-===================================================================
---- a/configure.ac
-+++ b/configure.ac
-@@ -2675,6 +2675,15 @@
-       AC_CHECK_FUNCS(pthread_atfork)
- fi
- 
-+AC_SUBST(SQLITE3)
-+AC_ARG_ENABLE(sqlite3,
-+	AS_HELP_STRING([--disable-sqlite3], [disable sqlite3]),
-+	[ SQLITE3="${enableval}" ], [ SQLITE3=yes ])
-+
-+if test "$SQLITE3" = "no" ; then
-+   DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
-+fi
-+
- AC_SUBST(PYDOC)
- 
- AC_ARG_ENABLE(pydoc,
-Index: b/Makefile.pre.in
-===================================================================
+diff --git a/Makefile.pre.in b/Makefile.pre.in
+index 6656f48..433cac1 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1147,7 +1147,6 @@
+@@ -1144,7 +1144,6 @@ LIBSUBDIRS=	tkinter \
  		email email/mime \
  		ensurepip ensurepip/_bundled \
  		html json http dbm xmlrpc \
@@ -40,7 +22,7 @@ Index: b/Makefile.pre.in
  		logging csv wsgiref urllib \
  		ctypes ctypes/macholib \
  		idlelib idlelib/Icons \
-@@ -1189,7 +1188,6 @@
+@@ -1186,7 +1185,6 @@ TESTSUBDIRS = 	tkinter/test tkinter/test/test_tkinter tkinter/test/test_ttk \
  		test/test_importlib/namespace_pkgs/project3/parent/child \
                  test/test_importlib/namespace_pkgs/module_and_namespace_package \
                  test/test_importlib/namespace_pkgs/module_and_namespace_package/a_test \
@@ -48,7 +30,7 @@ Index: b/Makefile.pre.in
  		ctypes/test \
  		idlelib/idle_test \
  		distutils/tests \
-@@ -1210,6 +1208,11 @@
+@@ -1207,6 +1205,11 @@ TESTSUBDIRS += lib2to3/tests			\
  	lib2to3/tests/data/fixers/myfixes
  endif
  
@@ -60,3 +42,26 @@ Index: b/Makefile.pre.in
  ifeq (@TEST_MODULES@,yes)
  LIBSUBDIRS += $(TESTSUBDIRS)
  endif
+diff --git a/configure.ac b/configure.ac
+index 0ed6b17..aaffbd6 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -2658,6 +2658,15 @@ if test "$posix_threads" = "yes"; then
+       AC_CHECK_FUNCS(pthread_atfork)
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
+-- 
+2.6.4
+
diff --git a/package/python3/104-optional-tk.patch b/package/python3/0021-Add-an-option-to-disable-the-tk-module.patch
similarity index 65%
rename from package/python3/104-optional-tk.patch
rename to package/python3/0021-Add-an-option-to-disable-the-tk-module.patch
index 8a852c5..fc3c9b4 100644
--- a/package/python3/104-optional-tk.patch
+++ b/package/python3/0021-Add-an-option-to-disable-the-tk-module.patch
@@ -1,18 +1,20 @@
-Add an option to disable the tk module
+From 006bf215734ad63007de044fe7803f66f83a4d19 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Wed, 23 Dec 2015 11:49:14 +0100
+Subject: [PATCH] Add an option to disable the tk module
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
-
 ---
- Makefile.pre.in |   14 +++++++++++---
- configure.ac    |    9 +++++++++
- 2 files changed, 20 insertions(+), 3 deletions(-)
+ Makefile.pre.in | 11 ++++++++---
+ configure.ac    |  9 +++++++++
+ 2 files changed, 17 insertions(+), 3 deletions(-)
 
-Index: b/Makefile.pre.in
-===================================================================
+diff --git a/Makefile.pre.in b/Makefile.pre.in
+index 433cac1..e492d7b 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1140,7 +1140,7 @@
+@@ -1137,7 +1137,7 @@ PLATDIR=	plat-$(MACHDEP)
  EXTRAPLATDIR= @EXTRAPLATDIR@
  MACHDEPS=	$(PLATDIR) $(EXTRAPLATDIR)
  XMLLIBSUBDIRS=  xml xml/dom xml/etree xml/parsers xml/sax
@@ -21,7 +23,7 @@ Index: b/Makefile.pre.in
  		site-packages \
  		asyncio \
  		collections concurrent concurrent/futures encodings \
-@@ -1158,8 +1158,7 @@
+@@ -1155,8 +1155,7 @@ LIBSUBDIRS=	tkinter \
  		venv venv/scripts venv/scripts/posix \
  		curses $(MACHDEPS)
  
@@ -31,7 +33,7 @@ Index: b/Makefile.pre.in
  		test/test_email test/test_email/data \
  		test/test_json \
  		test/audiodata \
-@@ -1213,6 +1212,12 @@
+@@ -1210,6 +1209,12 @@ LIBSUBDIRS += sqlite3
  TESTSUBDIRS += sqlite3/test
  endif
  
@@ -44,11 +46,11 @@ Index: b/Makefile.pre.in
  ifeq (@TEST_MODULES@,yes)
  LIBSUBDIRS += $(TESTSUBDIRS)
  endif
-Index: b/configure.ac
-===================================================================
+diff --git a/configure.ac b/configure.ac
+index aaffbd6..7efd54f 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2684,6 +2684,15 @@
+@@ -2667,6 +2667,15 @@ if test "$SQLITE3" = "no" ; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
  fi
  
@@ -64,3 +66,6 @@ Index: b/configure.ac
  AC_SUBST(PYDOC)
  
  AC_ARG_ENABLE(pydoc,
+-- 
+2.6.4
+
diff --git a/package/python3/105-optional-curses.patch b/package/python3/0022-Add-an-option-to-disable-the-curses-module.patch
similarity index 61%
rename from package/python3/105-optional-curses.patch
rename to package/python3/0022-Add-an-option-to-disable-the-curses-module.patch
index 72979cf..de78bb0 100644
--- a/package/python3/105-optional-curses.patch
+++ b/package/python3/0022-Add-an-option-to-disable-the-curses-module.patch
@@ -1,18 +1,20 @@
-Add an option to disable the curses module
+From 42725aef353df06f760f0a47b80001187d04d8b4 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Wed, 23 Dec 2015 11:49:30 +0100
+Subject: [PATCH] Add an option to disable the curses module
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
-
 ---
- Makefile.pre.in |    6 +++++-
- configure.ac    |    9 +++++++++
+ Makefile.pre.in | 6 +++++-
+ configure.ac    | 9 +++++++++
  2 files changed, 14 insertions(+), 1 deletion(-)
 
-Index: b/Makefile.pre.in
-===================================================================
+diff --git a/Makefile.pre.in b/Makefile.pre.in
+index e492d7b..66b2c45 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1156,7 +1156,7 @@
+@@ -1153,7 +1153,7 @@ LIBSUBDIRS=	\
  		multiprocessing multiprocessing/dummy \
  		unittest \
  		venv venv/scripts venv/scripts/posix \
@@ -21,7 +23,7 @@ Index: b/Makefile.pre.in
  
  TESTSUBDIRS = 	test test/test_asyncio \
  		test/test_email test/test_email/data \
-@@ -1218,6 +1218,10 @@
+@@ -1215,6 +1215,10 @@ TESTSUBDIRS += tkinter/test tkinter/test/test_tkinter \
  	tkinter/test/test_ttk
  endif
  
@@ -32,11 +34,11 @@ Index: b/Makefile.pre.in
  ifeq (@TEST_MODULES@,yes)
  LIBSUBDIRS += $(TESTSUBDIRS)
  endif
-Index: b/configure.ac
-===================================================================
+diff --git a/configure.ac b/configure.ac
+index 7efd54f..e48f38e 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2693,6 +2693,15 @@
+@@ -2676,6 +2676,15 @@ if test "$TK" = "no"; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _tkinter"
  fi
  
@@ -52,3 +54,6 @@ Index: b/configure.ac
  AC_SUBST(PYDOC)
  
  AC_ARG_ENABLE(pydoc,
+-- 
+2.6.4
+
diff --git a/package/python3/106-optional-expat.patch b/package/python3/0023-Add-an-option-to-disable-expat.patch
similarity index 75%
rename from package/python3/106-optional-expat.patch
rename to package/python3/0023-Add-an-option-to-disable-expat.patch
index 0bdd6f9..9cb0799 100644
--- a/package/python3/106-optional-expat.patch
+++ b/package/python3/0023-Add-an-option-to-disable-expat.patch
@@ -1,4 +1,7 @@
-Add an option to disable expat
+From f98b83bca09882d27bb04d7dbcd50f9979ad0569 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Wed, 23 Dec 2015 11:49:42 +0100
+Subject: [PATCH] Add an option to disable expat
 
 This patch replaces the existing --with-system-expat option with a
 --with-expat={system,builtin,none} option, which allows to tell Python
@@ -8,18 +11,17 @@ installation of XML modules).
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
-
 ---
- Makefile.pre.in |    6 +++++-
- configure.ac    |   18 +++++++++++++-----
- setup.py        |    2 +-
+ Makefile.pre.in |  6 +++++-
+ configure.ac    | 18 +++++++++++++-----
+ setup.py        |  2 +-
  3 files changed, 19 insertions(+), 7 deletions(-)
 
-Index: b/Makefile.pre.in
-===================================================================
+diff --git a/Makefile.pre.in b/Makefile.pre.in
+index 66b2c45..884d5aa 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1150,7 +1150,7 @@
+@@ -1147,7 +1147,7 @@ LIBSUBDIRS=	\
  		logging csv wsgiref urllib \
  		ctypes ctypes/macholib \
  		idlelib idlelib/Icons \
@@ -28,7 +30,7 @@ Index: b/Makefile.pre.in
  		importlib \
  		turtledemo \
  		multiprocessing multiprocessing/dummy \
-@@ -1222,6 +1222,10 @@
+@@ -1219,6 +1219,10 @@ ifeq (@CURSES@,yes)
  LIBSUBDIRS += curses
  endif
  
@@ -39,11 +41,11 @@ Index: b/Makefile.pre.in
  ifeq (@TEST_MODULES@,yes)
  LIBSUBDIRS += $(TESTSUBDIRS)
  endif
-Index: b/configure.ac
-===================================================================
+diff --git a/configure.ac b/configure.ac
+index e48f38e..4bbd597 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2372,13 +2372,21 @@
+@@ -2355,13 +2355,21 @@ PKG_PROG_PKG_CONFIG
  AC_SUBST(DISABLED_EXTENSIONS)
  
  # Check for use of the system expat library
@@ -70,11 +72,11 @@ Index: b/configure.ac
  
  # Check for use of the system libffi library
  AC_MSG_CHECKING(for --with-system-ffi)
-Index: b/setup.py
-===================================================================
+diff --git a/setup.py b/setup.py
+index a2bf05a..fd3ac65 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -1414,7 +1414,7 @@
+@@ -1414,7 +1414,7 @@ class PyBuildExt(build_ext):
          #
          # More information on Expat can be found at www.libexpat.org.
          #
@@ -83,3 +85,6 @@ Index: b/setup.py
              expat_inc = []
              define_macros = []
              expat_lib = ['expat']
+-- 
+2.6.4
+
diff --git a/package/python3/107-optional-codecs-cjk.patch b/package/python3/0024-Add-an-option-to-disable-CJK-codecs.patch
similarity index 58%
rename from package/python3/107-optional-codecs-cjk.patch
rename to package/python3/0024-Add-an-option-to-disable-CJK-codecs.patch
index 2759dd9..b4d7784 100644
--- a/package/python3/107-optional-codecs-cjk.patch
+++ b/package/python3/0024-Add-an-option-to-disable-CJK-codecs.patch
@@ -1,16 +1,18 @@
-Add an option to disable CJK codecs
+From cf731841e1209c6faa99e2db4cf4c890e7c28080 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Wed, 23 Dec 2015 11:49:55 +0100
+Subject: [PATCH] Add an option to disable CJK codecs
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
 ---
- configure.ac |    6 ++++++
+ configure.ac | 6 ++++++
  1 file changed, 6 insertions(+)
 
-Index: b/configure.ac
-===================================================================
+diff --git a/configure.ac b/configure.ac
+index 4bbd597..05817f0 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2692,6 +2692,12 @@
+@@ -2675,6 +2675,12 @@ if test "$SQLITE3" = "no" ; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
  fi
  
@@ -23,3 +25,6 @@ Index: b/configure.ac
  AC_SUBST(TK)
  AC_ARG_ENABLE(tk,
  	AS_HELP_STRING([--disable-tk], [disable tk]),
+-- 
+2.6.4
+
diff --git a/package/python3/108-optional-nis.patch b/package/python3/0025-Add-an-option-to-disable-NIS.patch
similarity index 63%
rename from package/python3/108-optional-nis.patch
rename to package/python3/0025-Add-an-option-to-disable-NIS.patch
index 8b8c4a0..cd6b19d 100644
--- a/package/python3/108-optional-nis.patch
+++ b/package/python3/0025-Add-an-option-to-disable-NIS.patch
@@ -1,19 +1,21 @@
-Add an option to disable NIS
+From f99823ef41d6f5c8e67b198b04b289d9b6ef8570 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Wed, 23 Dec 2015 11:50:11 +0100
+Subject: [PATCH] Add an option to disable NIS
 
 NIS is not necessarily available in uClibc, so we need an option to
 not compile support for it.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
 ---
- configure.ac |    6 ++++++
+ configure.ac | 6 ++++++
  1 file changed, 6 insertions(+)
 
-Index: b/configure.ac
-===================================================================
+diff --git a/configure.ac b/configure.ac
+index 05817f0..4fb35a8 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2698,6 +2698,12 @@
+@@ -2681,6 +2681,12 @@ AC_ARG_ENABLE(codecs-cjk,
  		DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _codecs_kr _codecs_jp _codecs_cn _codecs_tw _codecs_hk _codecs_iso2022"
  	fi])
  
@@ -26,3 +28,6 @@ Index: b/configure.ac
  AC_SUBST(TK)
  AC_ARG_ENABLE(tk,
  	AS_HELP_STRING([--disable-tk], [disable tk]),
+-- 
+2.6.4
+
diff --git a/package/python3/109-optional-unicodedata.patch b/package/python3/0026-Add-an-option-to-disable-unicodedata.patch
similarity index 58%
rename from package/python3/109-optional-unicodedata.patch
rename to package/python3/0026-Add-an-option-to-disable-unicodedata.patch
index 7291852..a5880f2 100644
--- a/package/python3/109-optional-unicodedata.patch
+++ b/package/python3/0026-Add-an-option-to-disable-unicodedata.patch
@@ -1,16 +1,18 @@
-Add an option to disable unicodedata
+From 4a32e709d128886dab10e59fad60fde005933aff Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Wed, 23 Dec 2015 11:50:27 +0100
+Subject: [PATCH] Add an option to disable unicodedata
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
 ---
- configure.ac |    6 ++++++
+ configure.ac | 6 ++++++
  1 file changed, 6 insertions(+)
 
-Index: b/configure.ac
-===================================================================
+diff --git a/configure.ac b/configure.ac
+index 4fb35a8..58f2dd9 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2704,6 +2704,12 @@
+@@ -2687,6 +2687,12 @@ AC_ARG_ENABLE(nis,
      	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} nis"
    	  fi])
  
@@ -23,3 +25,6 @@ Index: b/configure.ac
  AC_SUBST(TK)
  AC_ARG_ENABLE(tk,
  	AS_HELP_STRING([--disable-tk], [disable tk]),
+-- 
+2.6.4
+
diff --git a/package/python3/110-optional-idle.patch b/package/python3/0027-Add-an-option-to-disable-IDLE.patch
similarity index 71%
rename from package/python3/110-optional-idle.patch
rename to package/python3/0027-Add-an-option-to-disable-IDLE.patch
index d30eb02..c2b59e8 100644
--- a/package/python3/110-optional-idle.patch
+++ b/package/python3/0027-Add-an-option-to-disable-IDLE.patch
@@ -1,21 +1,23 @@
-Add an option to disable IDLE
+From 9336cf4eb4ded1eaa83da5549e4aba62b34ef888 Mon Sep 17 00:00:00 2001
+From: Maxime Ripard <maxime.ripard@free-electrons.com>
+Date: Wed, 23 Dec 2015 11:50:42 +0100
+Subject: [PATCH] Add an option to disable IDLE
 
 IDLE is an IDE embedded into python, written using Tk, so it doesn't make
 much sense to have it into our build.
 
 Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
-
 ---
- Makefile.pre.in |    8 +++++++-
- configure.ac    |    6 ++++++
- setup.py        |    4 +++-
- 3 files changed, 16 insertions(+), 2 deletions(-)
+ Makefile.pre.in | 7 ++++++-
+ configure.ac    | 6 ++++++
+ setup.py        | 4 +++-
+ 3 files changed, 15 insertions(+), 2 deletions(-)
 
-Index: b/Makefile.pre.in
-===================================================================
+diff --git a/Makefile.pre.in b/Makefile.pre.in
+index 884d5aa..48b4812 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1101,7 +1101,9 @@
+@@ -1098,7 +1098,9 @@ bininstall: altbininstall
  	-rm -f $(DESTDIR)$(LIBPC)/python3.pc
  	(cd $(DESTDIR)$(LIBPC); $(LN) -s python-$(VERSION).pc python3.pc)
  	-rm -f $(DESTDIR)$(BINDIR)/idle3
@@ -25,7 +27,7 @@ Index: b/Makefile.pre.in
  	-rm -f $(DESTDIR)$(BINDIR)/pydoc3
  ifeq (@PYDOC@,yes)
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s pydoc$(VERSION) pydoc3)
-@@ -1149,7 +1151,6 @@
+@@ -1146,7 +1148,6 @@ LIBSUBDIRS=	\
  		html json http dbm xmlrpc \
  		logging csv wsgiref urllib \
  		ctypes ctypes/macholib \
@@ -33,7 +35,7 @@ Index: b/Makefile.pre.in
  		distutils distutils/command \
  		importlib \
  		turtledemo \
-@@ -1226,6 +1227,10 @@
+@@ -1223,6 +1224,10 @@ ifeq (@EXPAT@,yes)
  LIBSUBDIRS += $(XMLLIBSUBDIRS)
  endif
  
@@ -44,11 +46,11 @@ Index: b/Makefile.pre.in
  ifeq (@TEST_MODULES@,yes)
  LIBSUBDIRS += $(TESTSUBDIRS)
  endif
-Index: b/configure.ac
-===================================================================
+diff --git a/configure.ac b/configure.ac
+index 58f2dd9..0ba25e4 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2746,6 +2746,12 @@
+@@ -2729,6 +2729,12 @@ AC_ARG_ENABLE(lib2to3,
  	AS_HELP_STRING([--disable-lib2to3], [disable lib2to3]),
  	[ LIB2TO3="${enableval}" ], [ LIB2TO3=yes ])
  
@@ -61,11 +63,11 @@ Index: b/configure.ac
  # Check for enable-ipv6
  AH_TEMPLATE(ENABLE_IPV6, [Define if --enable-ipv6 is specified])
  AC_MSG_CHECKING([if --enable-ipv6 is specified])
-Index: b/setup.py
-===================================================================
+diff --git a/setup.py b/setup.py
+index fd3ac65..3655e57 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -2201,11 +2201,13 @@
+@@ -2201,11 +2201,13 @@ def main():
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
  
@@ -80,3 +82,6 @@ Index: b/setup.py
  
      setup(# PyPI Metadata (PEP 301)
            name = "Python",
+-- 
+2.6.4
+
diff --git a/package/python3/111-optional-decimal.patch b/package/python3/0028-Add-an-option-to-disable-decimal.patch
similarity index 74%
rename from package/python3/111-optional-decimal.patch
rename to package/python3/0028-Add-an-option-to-disable-decimal.patch
index be17c94..df85325 100644
--- a/package/python3/111-optional-decimal.patch
+++ b/package/python3/0028-Add-an-option-to-disable-decimal.patch
@@ -1,4 +1,7 @@
-Add an option to disable decimal
+From 8fee92a85c170ac4ce24dda5a960f24b83d6f103 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Wed, 23 Dec 2015 11:51:31 +0100
+Subject: [PATCH] Add an option to disable decimal
 
 This patch replaces the existing --with-system-libmpdec option with a
 --with-libmpdec={system,builtin,none} option, which allows to tell
@@ -7,12 +10,15 @@ the libmpdec builtin the Python sources, or no libmpdec at all.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 ---
+ configure.ac | 17 ++++++++++++-----
+ setup.py     |  2 +-
+ 2 files changed, 13 insertions(+), 6 deletions(-)
 
-Index: b/configure.ac
-===================================================================
+diff --git a/configure.ac b/configure.ac
+index 0ba25e4..536b9b2 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2405,13 +2405,20 @@
+@@ -2388,13 +2388,20 @@ AC_SUBST(LIBFFI_INCLUDEDIR)
  AC_MSG_RESULT($with_system_ffi)
  
  # Check for use of the system libmpdec library
@@ -38,11 +44,11 @@ Index: b/configure.ac
  
  # Check for support for loadable sqlite extensions
  AC_MSG_CHECKING(for --enable-loadable-sqlite-extensions)
-Index: b/setup.py
-===================================================================
+diff --git a/setup.py b/setup.py
+index 3655e57..7f7627d 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -1968,7 +1968,7 @@
+@@ -1968,7 +1968,7 @@ class PyBuildExt(build_ext):
      def _decimal_ext(self):
          extra_compile_args = []
          undef_macros = []
@@ -51,3 +57,6 @@ Index: b/setup.py
              include_dirs = []
              libraries = [':libmpdec.so.2']
              sources = ['_decimal/_decimal.c']
+-- 
+2.6.4
+
diff --git a/package/python3/112-optional-ossaudiodev.patch b/package/python3/0029-Add-an-option-to-disable-the-ossaudiodev-module.patch
similarity index 54%
rename from package/python3/112-optional-ossaudiodev.patch
rename to package/python3/0029-Add-an-option-to-disable-the-ossaudiodev-module.patch
index 7f1611b..56b6ae1 100644
--- a/package/python3/112-optional-ossaudiodev.patch
+++ b/package/python3/0029-Add-an-option-to-disable-the-ossaudiodev-module.patch
@@ -1,12 +1,18 @@
-Add an option to disable the ossaudiodev module
+From 53639100c2f7836ce9a51b5e5b9b4ea08ba1dc4e Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Wed, 23 Dec 2015 11:51:58 +0100
+Subject: [PATCH] Add an option to disable the ossaudiodev module
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ configure.ac | 6 ++++++
+ 1 file changed, 6 insertions(+)
 
-Index: b/configure.ac
-===================================================================
+diff --git a/configure.ac b/configure.ac
+index 536b9b2..c1ab3a1 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2420,6 +2420,12 @@
+@@ -2403,6 +2403,12 @@ else
  fi
  AC_SUBST(MPDEC)
  
@@ -19,3 +25,6 @@ Index: b/configure.ac
  # Check for support for loadable sqlite extensions
  AC_MSG_CHECKING(for --enable-loadable-sqlite-extensions)
  AC_ARG_ENABLE(loadable-sqlite-extensions,
+-- 
+2.6.4
+
diff --git a/package/python3/006-cross-compile-getaddrinfo.patch b/package/python3/006-cross-compile-getaddrinfo.patch
deleted file mode 100644
index c530883..0000000
--- a/package/python3/006-cross-compile-getaddrinfo.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Disable buggy_getaddrinfo configure test when cross-compiling with IPv6 support
-
-Signed-off-by: Vanya Sergeev <vsergeev@gmail.com>
-
----
- configure.ac |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: b/configure.ac
-===================================================================
---- a/configure.ac
-+++ b/configure.ac
-@@ -3432,7 +3432,7 @@
- 
- AC_MSG_RESULT($ac_cv_buggy_getaddrinfo)
- 
--if test $have_getaddrinfo = no || test "$ac_cv_buggy_getaddrinfo" = yes
-+if test $have_getaddrinfo = no || test "$cross_compiling" != "yes" -a "$ac_cv_buggy_getaddrinfo" = yes
- then
- 	if test $ipv6 = yes
- 	then
-- 
2.6.4
