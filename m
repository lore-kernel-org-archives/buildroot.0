From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Thu, 23 Mar 2017 08:21:12 -0700
Subject: [Buildroot] [PATCH v3] python3: Bump version to 3.6.1
Message-ID: <20170323152112.25631-1-andrew.smirnov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update all appropriate version numbers as well as SHAs and MD5s as well
as repbasing BR's patches on top of 3.6.1 codebase (new github repo
tree, v3.6.1 tag was used). Note that patch:

   [PATCH] Change the install location of _sysconfigdata.py

was dropped due to the fact taht build system now adds platform
specific suffix to sysconfigdata's name, so each platform's file
should have a unique name and distutils now allows to specify which
sysconfigdata is used via _PYTHON_SYSCONFIGDATA_NAME

see:

    https://github.com/python/cpython/commit/c4b53afce491142b80b228a21a05de5dcfd8d36f
    https://github.com/python/cpython/commit/92dec548ff1494b86f08bd3753ca91a9330b4ea9

and patches:

    [PATCH] distutils/sysconfig: use sysconfigdata
    [PATCH] setup.py: do not add invalid header locations
    [PATCH] Do not harcode invalid path to ncursesw headers

was dropped since it looks like it made it's way upstream, see:

    https://github.com/python/cpython/commit/409482251b06fe75c4ee56e85ffbb4b23d934159
    https://github.com/python/cpython/commit/1351c31aa9651b278d7ef8ec79af3b646a520235
    https://github.com/python/cpython/commit/e13c3201fb66c4c211b4ebb7604d1435bedc1015

respectively.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---

Changes since v2 (see [2]):

	- Convert patch to be against Python 3.6.1, which also
          resulted in two more of Buildroot's custom patches becoming
          obsolete

	- Convert the code looking for _sysconfigdata file to use make
          only tools and avoid forking off a shell as per Thomas'
          suggestion

	- Re-generated patches to supress numbering (-N) as well as
          having changes in "From" field


Changes since v1 (see [1]):

	- Rebased on latest master to accomodate to latest changes from Thomas
	- Added explanation for reasoning behind dropping 2 of custom BR the patches


[1] http://lists.busybox.net/pipermail/buildroot/2017-March/186161.html
[2] http://lists.busybox.net/pipermail/buildroot/2017-March/186929.html


 package/pkg-python.mk                              |  6 ++
 ...-Make-the-build-of-pyc-files-conditional.patch} | 18 +++--
 ...up.py-do-not-add-invalid-header-locations.patch | 46 ------------
 ...the-install-location-of-_sysconfigdata.py.patch | 86 ----------------------
 ...y_getaddrinfo-configure-test-when-cross-.patch} |  8 +-
 ...ucture-to-disable-the-build-of-certain-e.patch} | 31 ++++----
 ...brary-header-paths-for-cross-compilation.patch} | 10 +--
 ...-t-look-in-usr-lib-termcap-for-libraries.patch} |  8 +-
 ....patch => 0006-Don-t-add-multiarch-paths.patch} |  6 +-
 ...006-distutils-sysconfig-use-sysconfigdata.patch | 65 ----------------
 ...tch => 0007-Abort-on-failed-module-build.patch} |  6 +-
 ...nd.patch => 0008-Serial-ioctl-workaround.patch} |  4 +-
 ...t-the-shebang-of-Python-scripts-for-cros.patch} |  6 +-
 ...config.sh.in-ensure-sed-invocations-only.patch} |  4 +-
 ...tem-locale-and-set-to-default-when-addin.patch} |  6 +-
 ...012-Add-importlib-fix-for-PEP-3147-issue.patch} | 23 +++---
 ...n-to-disable-installation-of-test-module.patch} | 58 ++++++++-------
 ...h => 0014-Add-an-option-to-disable-pydoc.patch} | 55 +++++++-------
 ...-harcode-invalid-path-to-ncursesw-headers.patch | 30 --------
 ...=> 0015-Add-an-option-to-disable-lib2to3.patch} | 38 +++++-----
 ...Add-option-to-disable-the-sqlite3-module.patch} | 26 ++++---
 ...7-Add-an-option-to-disable-the-tk-module.patch} | 52 ++++++-------
 ...d-an-option-to-disable-the-curses-module.patch} | 39 +++++-----
 ...h => 0019-Add-an-option-to-disable-expat.patch} | 28 +++----
 ...0020-Add-an-option-to-disable-CJK-codecs.patch} |  8 +-
 ...tch => 0021-Add-an-option-to-disable-NIS.patch} |  8 +-
 ...022-Add-an-option-to-disable-unicodedata.patch} |  8 +-
 ...ch => 0023-Add-an-option-to-disable-IDLE.patch} | 32 ++++----
 ...=> 0024-Add-an-option-to-disable-decimal.patch} | 12 +--
 ...option-to-disable-the-ossaudiodev-module.patch} |  8 +-
 ..._FOR_BUILD-and-FREEZE_IMPORTLIB_FOR_BUIL.patch} | 26 ++++---
 ...Add-an-option-to-disable-openssl-support.patch} | 10 +--
 ...an-option-to-disable-the-readline-module.patch} |  8 +-
 ...ons-to-disable-zlib-bzip2-and-xz-modules.patch} |  8 +-
 package/python3/python3.hash                       |  7 +-
 package/python3/python3.mk                         |  6 +-
 36 files changed, 304 insertions(+), 496 deletions(-)
 rename package/python3/{0003-Make-the-build-of-pyc-files-conditional.patch => 0001-Make-the-build-of-pyc-files-conditional.patch} (78%)
 delete mode 100644 package/python3/0001-setup.py-do-not-add-invalid-header-locations.patch
 delete mode 100644 package/python3/0002-Change-the-install-location-of-_sysconfigdata.py.patch
 rename package/python3/{0004-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch => 0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch} (83%)
 rename package/python3/{0005-Add-infrastructure-to-disable-the-build-of-certain-e.patch => 0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch} (84%)
 rename package/python3/{0007-Adjust-library-header-paths-for-cross-compilation.patch => 0004-Adjust-library-header-paths-for-cross-compilation.patch} (94%)
 rename package/python3/{0008-Don-t-look-in-usr-lib-termcap-for-libraries.patch => 0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch} (88%)
 rename package/python3/{0009-Don-t-add-multiarch-paths.patch => 0006-Don-t-add-multiarch-paths.patch} (92%)
 delete mode 100644 package/python3/0006-distutils-sysconfig-use-sysconfigdata.patch
 rename package/python3/{0010-Abort-on-failed-module-build.patch => 0007-Abort-on-failed-module-build.patch} (89%)
 rename package/python3/{0011-Serial-ioctl-workaround.patch => 0008-Serial-ioctl-workaround.patch} (92%)
 rename package/python3/{0012-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch => 0009-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch} (92%)
 rename package/python3/{0013-Misc-python-config.sh.in-ensure-sed-invocations-only.patch => 0010-Misc-python-config.sh.in-ensure-sed-invocations-only.patch} (97%)
 rename package/python3/{0015-Override-system-locale-and-set-to-default-when-addin.patch => 0011-Override-system-locale-and-set-to-default-when-addin.patch} (92%)
 rename package/python3/{0016-Add-importlib-fix-for-PEP-3147-issue.patch => 0012-Add-importlib-fix-for-PEP-3147-issue.patch} (86%)
 rename package/python3/{0017-Add-an-option-to-disable-installation-of-test-module.patch => 0013-Add-an-option-to-disable-installation-of-test-module.patch} (73%)
 rename package/python3/{0018-Add-an-option-to-disable-pydoc.patch => 0014-Add-an-option-to-disable-pydoc.patch} (68%)
 delete mode 100644 package/python3/0014-Do-not-harcode-invalid-path-to-ncursesw-headers.patch
 rename package/python3/{0019-Add-an-option-to-disable-lib2to3.patch => 0015-Add-an-option-to-disable-lib2to3.patch} (77%)
 rename package/python3/{0020-Add-option-to-disable-the-sqlite3-module.patch => 0016-Add-option-to-disable-the-sqlite3-module.patch} (66%)
 rename package/python3/{0021-Add-an-option-to-disable-the-tk-module.patch => 0017-Add-an-option-to-disable-the-tk-module.patch} (53%)
 rename package/python3/{0022-Add-an-option-to-disable-the-curses-module.patch => 0018-Add-an-option-to-disable-the-curses-module.patch} (54%)
 rename package/python3/{0023-Add-an-option-to-disable-expat.patch => 0019-Add-an-option-to-disable-expat.patch} (80%)
 rename package/python3/{0024-Add-an-option-to-disable-CJK-codecs.patch => 0020-Add-an-option-to-disable-CJK-codecs.patch} (83%)
 rename package/python3/{0025-Add-an-option-to-disable-NIS.patch => 0021-Add-an-option-to-disable-NIS.patch} (85%)
 rename package/python3/{0026-Add-an-option-to-disable-unicodedata.patch => 0022-Add-an-option-to-disable-unicodedata.patch} (83%)
 rename package/python3/{0027-Add-an-option-to-disable-IDLE.patch => 0023-Add-an-option-to-disable-IDLE.patch} (77%)
 rename package/python3/{0028-Add-an-option-to-disable-decimal.patch => 0024-Add-an-option-to-disable-decimal.patch} (89%)
 rename package/python3/{0029-Add-an-option-to-disable-the-ossaudiodev-module.patch => 0025-Add-an-option-to-disable-the-ossaudiodev-module.patch} (85%)
 rename package/python3/{0030-Support-PGEN_FOR_BUILD-and-FREEZE_IMPORTLIB_FOR_BUIL.patch => 0026-Support-PGEN_FOR_BUILD-and-FREEZE_IMPORTLIB_FOR_BUIL.patch} (71%)
 rename package/python3/{0031-Add-an-option-to-disable-openssl-support.patch => 0027-Add-an-option-to-disable-openssl-support.patch} (79%)
 rename package/python3/{0032-Add-an-option-to-disable-the-readline-module.patch => 0028-Add-an-option-to-disable-the-readline-module.patch} (83%)
 rename package/python3/{0033-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch => 0029-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch} (88%)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 38bc45f..fb124e1 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -20,6 +20,10 @@
 #
 ################################################################################
 
+define PKG_PYTHON_SYSCONFIGDATA_NAME
+$(basename $(notdir $(wildcard $(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/_sysconfigdata_m_linux_*.py)))
+endef
+
 # Target distutils-based packages
 PKG_PYTHON_DISTUTILS_ENV = \
 	PATH=$(BR_PATH) \
@@ -28,6 +32,7 @@ PKG_PYTHON_DISTUTILS_ENV = \
 	LDFLAGS="$(TARGET_LDFLAGS)" \
 	LDSHARED="$(TARGET_CROSS)gcc -shared" \
 	PYTHONPATH="$(if $(BR2_PACKAGE_PYTHON3),$(PYTHON3_PATH),$(PYTHON_PATH))" \
+	_PYTHON_SYSCONFIGDATA_NAME="$(PKG_PYTHON_SYSCONFIGDATA_NAME)" \
 	_python_sysroot=$(STAGING_DIR) \
 	_python_prefix=/usr \
 	_python_exec_prefix=/usr
@@ -50,6 +55,7 @@ HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS = \
 
 # Target setuptools-based packages
 PKG_PYTHON_SETUPTOOLS_ENV = \
+	_PYTHON_SYSCONFIGDATA_NAME="$(PKG_PYTHON_SYSCONFIGDATA_NAME)" \
 	PATH=$(BR_PATH) \
 	PYTHONPATH="$(if $(BR2_PACKAGE_PYTHON3),$(PYTHON3_PATH),$(PYTHON_PATH))" \
 	_python_sysroot=$(STAGING_DIR) \
diff --git a/package/python3/0003-Make-the-build-of-pyc-files-conditional.patch b/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
similarity index 78%
rename from package/python3/0003-Make-the-build-of-pyc-files-conditional.patch
rename to package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
index 8ab09c0..326f15e 100644
--- a/package/python3/0003-Make-the-build-of-pyc-files-conditional.patch
+++ b/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
@@ -1,22 +1,24 @@
-From 5df8e9556e8026dd19cf932fa8f2b726f56182d1 Mon Sep 17 00:00:00 2001
+From 1c2d155d1ef3da49b5ed970ab8d63958c516e9b9 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 23 Dec 2015 11:29:35 +0100
+Date: Wed, 22 Feb 2017 16:21:31 -0800
 Subject: [PATCH] Make the build of pyc files conditional
 
 This commit adds a new configure option --disable-pyc-build to disable
 the compilation of pyc.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[ Andrey Smrinov: ported to Python 3.6 ]
+Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 ---
  Makefile.pre.in | 2 ++
  configure.ac    | 6 ++++++
  2 files changed, 8 insertions(+)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 5a258e0..6a7d974 100644
+index 8f27d73..b78a765 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1309,6 +1309,7 @@ libinstall:	build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
+@@ -1308,6 +1308,7 @@ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
  		$(INSTALL_DATA) $(srcdir)/Modules/xxmodule.c \
  			$(DESTDIR)$(LIBDEST)/distutils/tests ; \
  	fi
@@ -24,7 +26,7 @@ index 5a258e0..6a7d974 100644
  	-PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
  		$(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py \
  		-d $(LIBDEST) -f \
-@@ -1336,6 +1337,7 @@ libinstall:	build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
+@@ -1335,6 +1336,7 @@ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
  		$(PYTHON_FOR_BUILD) -Wi -OO $(DESTDIR)$(LIBDEST)/compileall.py \
  		-d $(LIBDEST)/site-packages -f \
  		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
@@ -33,10 +35,10 @@ index 5a258e0..6a7d974 100644
  		$(PYTHON_FOR_BUILD) -m lib2to3.pgen2.driver $(DESTDIR)$(LIBDEST)/lib2to3/Grammar.txt
  	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
 diff --git a/configure.ac b/configure.ac
-index 8d0a43b..db0e336 100644
+index 9eacf52..8e7b2ad 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1074,6 +1074,12 @@ fi
+@@ -1122,6 +1122,12 @@ fi
  
  AC_MSG_CHECKING(LDLIBRARY)
  
@@ -50,5 +52,5 @@ index 8d0a43b..db0e336 100644
  # library that we build, but we do not want to link against it (we
  # will find it with a -framework option). For this reason there is an
 -- 
-2.7.4
+2.9.3
 
diff --git a/package/python3/0001-setup.py-do-not-add-invalid-header-locations.patch b/package/python3/0001-setup.py-do-not-add-invalid-header-locations.patch
deleted file mode 100644
index 4d8c897..0000000
--- a/package/python3/0001-setup.py-do-not-add-invalid-header-locations.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 093733d806e32ef47db5c6d2379d7c93ae71524b Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 23 Dec 2015 11:28:34 +0100
-Subject: [PATCH] setup.py: do not add invalid header locations
-
-This piece of code incorrectly adds /usr/include to
-self.compiler.include_dirs, and results in the following invalid
-compilation line:
-
-/home/thomas/projets/buildroot/output/host/usr/bin/arm-none-linux-gnueabi-gcc
-  -fPIC -Wno-unused-result -Werror=declaration-after-statement -DNDEBUG -g
-  -O3 -Wall -Wstrict-prototypes -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-  -D_FILE_OFFSET_BITS=64 -pipe -Os
-  -I./Include -I/usr/include -I. -IInclude
-  -I/home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include
-  -I/home/thomas/projets/buildroot/output/build/python3-3.4.0b1/Include
-  -I/home/thomas/projets/buildroot/output/build/python3-3.4.0b1
-  -c /home/thomas/projets/buildroot/output/build/python3-3.4.0b1/Modules/_struct.c
-  -o build/temp.linux-arm-3.4/home/thomas/projets/buildroot/output/build/python3-3.4.0b1/Modules/_struct.o
-cc1: warning: include location "/usr/include" is unsafe for cross-compilation [-Wpoison-system-directories]
-
-The -I/usr/include is wrong when cross compiling, so we disable adding
-INCLUDEDIR and LIBDIR from the host when cross compiling.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- setup.py | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/setup.py b/setup.py
-index 174ce72..b67d913 100644
---- a/setup.py
-+++ b/setup.py
-@@ -534,7 +534,8 @@ class PyBuildExt(build_ext):
-                         add_dir_to_list(dir_list, directory)
- 
-         if os.path.normpath(sys.base_prefix) != '/usr' \
--                and not sysconfig.get_config_var('PYTHONFRAMEWORK'):
-+                and not sysconfig.get_config_var('PYTHONFRAMEWORK') \
-+                and not cross_compiling:
-             # OSX note: Don't add LIBDIR and INCLUDEDIR to building a framework
-             # (PYTHONFRAMEWORK is set) to avoid # linking problems when
-             # building a framework with different architectures than
--- 
-2.7.4
-
diff --git a/package/python3/0002-Change-the-install-location-of-_sysconfigdata.py.patch b/package/python3/0002-Change-the-install-location-of-_sysconfigdata.py.patch
deleted file mode 100644
index 6325397..0000000
--- a/package/python3/0002-Change-the-install-location-of-_sysconfigdata.py.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-From 1fca2c29a600b1eaa28da19e8c258fa0300c4eaf Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 23 Dec 2015 11:29:04 +0100
-Subject: [PATCH] Change the install location of _sysconfigdata.py
-
-The _sysconfigdata.py module contains definitions that are needed when
-building Python modules. In cross-compilation mode, when building
-Python extensions for the target, we need to use the _sysconfigdata.py
-of the target Python while executing the host Python.
-
-However until now, the _sysconfigdata.py module was installed in
-build/lib.<arch>-<version> directory, together with a number of
-architecture-specific shared objects, which cannot be used with the
-host Python.
-
-To solve this problem, this patch moves _sysconfigdata.py to a
-separate location, build/sysconfigdata.<arch>-<version>/, and only
-this directory gets added to the PYTHONPATH of the host Python
-interpreter when building Python modules for the target.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- Makefile.pre.in | 12 ++++++++++--
- configure.ac    |  2 +-
- 2 files changed, 11 insertions(+), 3 deletions(-)
-
-diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 87528a0..5a258e0 100644
---- a/Makefile.pre.in
-+++ b/Makefile.pre.in
-@@ -588,6 +588,9 @@ pybuilddir.txt: $(BUILDPYTHON)
- 		rm -f ./pybuilddir.txt ; \
- 		exit 1 ; \
- 	fi
-+	echo `cat pybuilddir.txt`/sysconfigdata > pysysconfigdatadir.txt
-+	mkdir -p `cat pysysconfigdatadir.txt`
-+	cp `cat pybuilddir.txt`/_sysconfigdata.py `cat pysysconfigdatadir.txt`
- 
- # This is shared by the math and cmath modules
- Modules/_math.o: Modules/_math.c Modules/_math.h
-@@ -1261,7 +1264,7 @@ libinstall:	build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
- 		else	true; \
- 		fi; \
- 	done
--	@for i in $(srcdir)/Lib/*.py `cat pybuilddir.txt`/_sysconfigdata.py; \
-+	@for i in $(srcdir)/Lib/*.py ; \
- 	do \
- 		if test -x $$i; then \
- 			$(INSTALL_SCRIPT) $$i $(DESTDIR)$(LIBDEST); \
-@@ -1271,6 +1274,11 @@ libinstall:	build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
- 			echo $(INSTALL_DATA) $$i $(LIBDEST); \
- 		fi; \
- 	done
-+	$(INSTALL_DATA) `cat pysysconfigdatadir.txt`/_sysconfigdata.py \
-+		$(DESTDIR)$(LIBDEST)
-+	mkdir -p $(DESTDIR)$(LIBDEST)/sysconfigdata
-+	$(INSTALL_DATA) `cat pysysconfigdatadir.txt`/_sysconfigdata.py \
-+		$(DESTDIR)$(LIBDEST)/sysconfigdata
- 	@for d in $(LIBSUBDIRS); \
- 	do \
- 		a=$(srcdir)/Lib/$$d; \
-@@ -1606,7 +1614,7 @@ clean: pycremoval
- 	find build -name 'fficonfig.h' -exec rm -f {} ';' || true
- 	find build -name '*.py' -exec rm -f {} ';' || true
- 	find build -name '*.py[co]' -exec rm -f {} ';' || true
--	-rm -f pybuilddir.txt
-+	-rm -f pybuilddir.txt pysysconfigdatadir.txt
- 	-rm -f Lib/lib2to3/*Grammar*.pickle
- 	-rm -f Programs/_testembed Programs/_freeze_importlib
- 	-rm -rf build
-diff --git a/configure.ac b/configure.ac
-index 1c07c05..8d0a43b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -71,7 +71,7 @@ if test "$cross_compiling" = yes; then
- 	    AC_MSG_ERROR([python$PACKAGE_VERSION interpreter not found])
- 	fi
-         AC_MSG_RESULT($interp)
--	PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir) _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(shell test -f pybuilddir.txt && echo $(abs_builddir)/`cat pybuilddir.txt`:)$(srcdir)/Lib:$(srcdir)/Lib/$(PLATDIR) '$interp
-+	PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir) _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(shell test -f pysysconfigdatadir.txt && echo $(abs_builddir)/`cat pysysconfigdatadir.txt`:)$(srcdir)/Lib:$(srcdir)/Lib/$(PLATDIR) '$interp
-     fi
- elif test "$cross_compiling" = maybe; then
-     AC_MSG_ERROR([Cross compiling required --host=HOST-TUPLE and --build=ARCH])
--- 
-2.7.4
-
diff --git a/package/python3/0004-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch b/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
similarity index 83%
rename from package/python3/0004-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
rename to package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
index 3957041..49a1422 100644
--- a/package/python3/0004-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
+++ b/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
@@ -1,4 +1,4 @@
-From 449ac686b4c0f73bbbf0202c4a5689b5ddb37d53 Mon Sep 17 00:00:00 2001
+From cc5adc98d981cff5acf0f1c52bf7ae4709a35fc3 Mon Sep 17 00:00:00 2001
 From: Vanya Sergeev <vsergeev@gmail.com>
 Date: Wed, 23 Dec 2015 11:30:33 +0100
 Subject: [PATCH] Disable buggy_getaddrinfo configure test when cross-compiling
@@ -10,10 +10,10 @@ Signed-off-by: Vanya Sergeev <vsergeev@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index db0e336..f57f2eb 100644
+index 8e7b2ad..250b23b 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3744,7 +3744,7 @@ fi
+@@ -3908,7 +3908,7 @@ fi
  
  AC_MSG_RESULT($ac_cv_buggy_getaddrinfo)
  
@@ -23,5 +23,5 @@ index db0e336..f57f2eb 100644
  	if test $ipv6 = yes
  	then
 -- 
-2.7.4
+2.9.3
 
diff --git a/package/python3/0005-Add-infrastructure-to-disable-the-build-of-certain-e.patch b/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch
similarity index 84%
rename from package/python3/0005-Add-infrastructure-to-disable-the-build-of-certain-e.patch
rename to package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch
index 78bb5d9..bf8cd92 100644
--- a/package/python3/0005-Add-infrastructure-to-disable-the-build-of-certain-e.patch
+++ b/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch
@@ -1,6 +1,6 @@
-From cbf8556ad057a402629a5be93dc77c906f3a86ab Mon Sep 17 00:00:00 2001
+From 300143451b42717eb05fc8b876f25ff4b202d8c4 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 23 Dec 2015 11:31:08 +0100
+Date: Wed, 22 Feb 2017 16:33:22 -0800
 Subject: [PATCH] Add infrastructure to disable the build of certain extensions
 
 Some of the extensions part of the Python core have dependencies on
@@ -35,17 +35,19 @@ then extended by Thomas Petazzoni
 <thomas.petazzoni@free-electrons.com>.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[ Andrey Smirnov: ported to Python 3.6 ]
+Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 ---
  Makefile.pre.in | 6 +++++-
  configure.ac    | 2 ++
- setup.py        | 5 ++++-
- 3 files changed, 11 insertions(+), 2 deletions(-)
+ setup.py        | 6 +++++-
+ 3 files changed, 12 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 6a7d974..d70375a 100644
+index b78a765..0e06ddb 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -182,6 +182,8 @@ FILEMODE=	644
+@@ -188,6 +188,8 @@ FILEMODE=	644
  # configure script arguments
  CONFIG_ARGS=	@CONFIG_ARGS@
  
@@ -54,15 +56,15 @@ index 6a7d974..d70375a 100644
  
  # Subdirectories with code
  SRCDIRS= 	@SRCDIRS@
-@@ -607,6 +609,7 @@ sharedmods: $(BUILDPYTHON) pybuilddir.txt Modules/_math.o
+@@ -606,6 +608,7 @@ sharedmods: $(BUILDPYTHON) pybuilddir.txt Modules/_math.o
  	esac; \
  	$(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' \
  		_TCLTK_INCLUDES='$(TCLTK_INCLUDES)' _TCLTK_LIBS='$(TCLTK_LIBS)' \
 +		DISABLED_EXTENSIONS="$(DISABLED_EXTENSIONS)" \
  		$(PYTHON_FOR_BUILD) $(srcdir)/setup.py $$quiet build
  
- # Build static library
-@@ -1451,7 +1454,8 @@ libainstall:	all python-config
+ 
+@@ -1433,7 +1436,8 @@ libainstall:	all python-config
  # Install the dynamically loadable modules
  # This goes into $(exec_prefix)
  sharedinstall: sharedmods
@@ -73,10 +75,10 @@ index 6a7d974..d70375a 100644
  		--install-scripts=$(BINDIR) \
  		--install-platlib=$(DESTSHARED) \
 diff --git a/configure.ac b/configure.ac
-index f57f2eb..c43ff9f 100644
+index 250b23b..fc4e71a 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2670,6 +2670,8 @@ LIBS="$withval $LIBS"
+@@ -2779,6 +2779,8 @@ LIBS="$withval $LIBS"
  
  PKG_PROG_PKG_CONFIG
  
@@ -86,10 +88,10 @@ index f57f2eb..c43ff9f 100644
  AC_MSG_CHECKING(for --with-system-expat)
  AC_ARG_WITH(system_expat,
 diff --git a/setup.py b/setup.py
-index b67d913..149911c 100644
+index f04bf22..c5bce21 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -44,7 +44,10 @@ host_platform = get_platform()
+@@ -43,7 +43,11 @@ host_platform = get_platform()
  COMPILED_WITH_PYDEBUG = ('--with-pydebug' in sysconfig.get_config_var("CONFIG_ARGS"))
  
  # This global variable is used to hold the list of modules to be disabled.
@@ -98,9 +100,10 @@ index b67d913..149911c 100644
 +    disabled_module_list = sysconfig.get_config_var("DISABLED_EXTENSIONS").split(" ")
 +except KeyError:
 +    disabled_module_list = list()
++
  
  def add_dir_to_list(dirlist, dir):
      """Add the directory 'dir' to the list 'dirlist' (after any relative
 -- 
-2.7.4
+2.9.3
 
diff --git a/package/python3/0007-Adjust-library-header-paths-for-cross-compilation.patch b/package/python3/0004-Adjust-library-header-paths-for-cross-compilation.patch
similarity index 94%
rename from package/python3/0007-Adjust-library-header-paths-for-cross-compilation.patch
rename to package/python3/0004-Adjust-library-header-paths-for-cross-compilation.patch
index d15ffc0..89b8ed8 100644
--- a/package/python3/0007-Adjust-library-header-paths-for-cross-compilation.patch
+++ b/package/python3/0004-Adjust-library-header-paths-for-cross-compilation.patch
@@ -1,4 +1,4 @@
-From f24bff04a609d30ead9776ae3b27aa579135c8bf Mon Sep 17 00:00:00 2001
+From 7c21396776e10346dccd805d4250e26e8172a812 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:33:14 +0100
 Subject: [PATCH] Adjust library/header paths for cross-compilation
@@ -21,10 +21,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  2 files changed, 15 insertions(+), 5 deletions(-)
 
 diff --git a/Lib/distutils/command/build_ext.py b/Lib/distutils/command/build_ext.py
-index f03a4e3..0355963 100644
+index 74de782..d0c847b 100644
 --- a/Lib/distutils/command/build_ext.py
 +++ b/Lib/distutils/command/build_ext.py
-@@ -232,7 +232,10 @@ class build_ext(Command):
+@@ -233,7 +233,10 @@ class build_ext(Command):
          if (sysconfig.get_config_var('Py_ENABLE_SHARED')):
              if not sysconfig.python_build:
                  # building third party extensions
@@ -37,7 +37,7 @@ index f03a4e3..0355963 100644
                  # building python standard extensions
                  self.library_dirs.append('.')
 diff --git a/Lib/distutils/sysconfig.py b/Lib/distutils/sysconfig.py
-index 721edec..d20e2d8 100644
+index 8bf1a70..5a02145 100644
 --- a/Lib/distutils/sysconfig.py
 +++ b/Lib/distutils/sysconfig.py
 @@ -17,10 +17,17 @@ import sys
@@ -63,5 +63,5 @@ index 721edec..d20e2d8 100644
  # Path to the base directory of the project. On Windows the binary may
  # live in project/PCBuild/win32 or project/PCBuild/amd64.
 -- 
-2.7.4
+2.9.3
 
diff --git a/package/python3/0008-Don-t-look-in-usr-lib-termcap-for-libraries.patch b/package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch
similarity index 88%
rename from package/python3/0008-Don-t-look-in-usr-lib-termcap-for-libraries.patch
rename to package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch
index 624139a..fa0e33d 100644
--- a/package/python3/0008-Don-t-look-in-usr-lib-termcap-for-libraries.patch
+++ b/package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch
@@ -1,4 +1,4 @@
-From f59154777625b039d8f76aa787817b108867ee04 Mon Sep 17 00:00:00 2001
+From 0458813245e8ba3d5b567cd53303cbe975144e95 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:36:00 +0100
 Subject: [PATCH] Don't look in /usr/lib/termcap for libraries
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 1 insertion(+), 4 deletions(-)
 
 diff --git a/setup.py b/setup.py
-index 149911c..1b4b981 100644
+index c5bce21..c5eb97d 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -783,12 +783,9 @@ class PyBuildExt(build_ext):
+@@ -786,12 +786,9 @@ class PyBuildExt(build_ext):
                  pass # Issue 7384: Already linked against curses or tinfo.
              elif curses_library:
                  readline_libs.append(curses_library)
@@ -27,5 +27,5 @@ index 149911c..1b4b981 100644
                                     libraries=readline_libs) )
          else:
 -- 
-2.7.4
+2.9.3
 
diff --git a/package/python3/0009-Don-t-add-multiarch-paths.patch b/package/python3/0006-Don-t-add-multiarch-paths.patch
similarity index 92%
rename from package/python3/0009-Don-t-add-multiarch-paths.patch
rename to package/python3/0006-Don-t-add-multiarch-paths.patch
index 92b09f3..5a858e0 100644
--- a/package/python3/0009-Don-t-add-multiarch-paths.patch
+++ b/package/python3/0006-Don-t-add-multiarch-paths.patch
@@ -1,4 +1,4 @@
-From f270af67f4ea6cc781f7cf05ba66e078190368df Mon Sep 17 00:00:00 2001
+From 0d6f96e2fcc7d07000e9077622cd411e3b4a4569 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:36:27 +0100
 Subject: [PATCH] Don't add multiarch paths
@@ -17,7 +17,7 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/setup.py b/setup.py
-index 1b4b981..9a48d5f 100644
+index c5eb97d..09fc3ee 100644
 --- a/setup.py
 +++ b/setup.py
 @@ -497,10 +497,10 @@ class PyBuildExt(build_ext):
@@ -33,5 +33,5 @@ index 1b4b981..9a48d5f 100644
          # Add paths specified in the environment variables LDFLAGS and
          # CPPFLAGS for header and library files.
 -- 
-2.7.4
+2.9.3
 
diff --git a/package/python3/0006-distutils-sysconfig-use-sysconfigdata.patch b/package/python3/0006-distutils-sysconfig-use-sysconfigdata.patch
deleted file mode 100644
index f36966c..0000000
--- a/package/python3/0006-distutils-sysconfig-use-sysconfigdata.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From 5855e029370e5636e3eb2283eaa8d11248744eac Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 23 Dec 2015 11:32:23 +0100
-Subject: [PATCH] distutils/sysconfig: use sysconfigdata
-
-In order to make the use of sysconfig cross-compilation compatible,
-use _sysconfigdata.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- Lib/distutils/sysconfig.py | 37 ++++---------------------------------
- 1 file changed, 4 insertions(+), 33 deletions(-)
-
-diff --git a/Lib/distutils/sysconfig.py b/Lib/distutils/sysconfig.py
-index 573724d..721edec 100644
---- a/Lib/distutils/sysconfig.py
-+++ b/Lib/distutils/sysconfig.py
-@@ -414,40 +414,11 @@ def expand_makefile_vars(s, vars):
- _config_vars = None
- 
- def _init_posix():
--    """Initialize the module as appropriate for POSIX systems."""
--    g = {}
--    # load the installed Makefile:
--    try:
--        filename = get_makefile_filename()
--        parse_makefile(filename, g)
--    except OSError as msg:
--        my_msg = "invalid Python installation: unable to open %s" % filename
--        if hasattr(msg, "strerror"):
--            my_msg = my_msg + " (%s)" % msg.strerror
--
--        raise DistutilsPlatformError(my_msg)
--
--    # load the installed pyconfig.h:
--    try:
--        filename = get_config_h_filename()
--        with open(filename) as file:
--            parse_config_h(file, g)
--    except OSError as msg:
--        my_msg = "invalid Python installation: unable to open %s" % filename
--        if hasattr(msg, "strerror"):
--            my_msg = my_msg + " (%s)" % msg.strerror
--
--        raise DistutilsPlatformError(my_msg)
--
--    # On AIX, there are wrong paths to the linker scripts in the Makefile
--    # -- these paths are relative to the Python source, but when installed
--    # the scripts are in another directory.
--    if python_build:
--        g['LDSHARED'] = g['BLDSHARED']
--
-+    # _sysconfigdata is generated at build time, see the sysconfig module
-+    from _sysconfigdata import build_time_vars
-     global _config_vars
--    _config_vars = g
--
-+    _config_vars = {}
-+    _config_vars.update(build_time_vars)
- 
- def _init_nt():
-     """Initialize the module as appropriate for NT"""
--- 
-2.7.4
-
diff --git a/package/python3/0010-Abort-on-failed-module-build.patch b/package/python3/0007-Abort-on-failed-module-build.patch
similarity index 89%
rename from package/python3/0010-Abort-on-failed-module-build.patch
rename to package/python3/0007-Abort-on-failed-module-build.patch
index 74342da..09aa472 100644
--- a/package/python3/0010-Abort-on-failed-module-build.patch
+++ b/package/python3/0007-Abort-on-failed-module-build.patch
@@ -1,4 +1,4 @@
-From 01780527e647b15f7f1aed4351c18fb4098a8707 Mon Sep 17 00:00:00 2001
+From 03936d5f998e60f234617b41f85053ea10b7a3d8 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:43:24 +0100
 Subject: [PATCH] Abort on failed module build
@@ -14,7 +14,7 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/setup.py b/setup.py
-index 9a48d5f..d02012d 100644
+index 09fc3ee..0be015e 100644
 --- a/setup.py
 +++ b/setup.py
 @@ -312,6 +312,7 @@ class PyBuildExt(build_ext):
@@ -26,5 +26,5 @@ index 9a48d5f..d02012d 100644
          if self.failed_on_import:
              failed = self.failed_on_import[:]
 -- 
-2.7.4
+2.9.3
 
diff --git a/package/python3/0011-Serial-ioctl-workaround.patch b/package/python3/0008-Serial-ioctl-workaround.patch
similarity index 92%
rename from package/python3/0011-Serial-ioctl-workaround.patch
rename to package/python3/0008-Serial-ioctl-workaround.patch
index cbd96b4..48ecd83 100644
--- a/package/python3/0011-Serial-ioctl-workaround.patch
+++ b/package/python3/0008-Serial-ioctl-workaround.patch
@@ -1,4 +1,4 @@
-From 49bfbdadd4808e7868e443b2786faf513c9818ea Mon Sep 17 00:00:00 2001
+From 076ac00569a0e6b330d75951c599a36464c4902b Mon Sep 17 00:00:00 2001
 From: Baruch Siach <baruch@tkos.co.il>
 Date: Wed, 23 Dec 2015 11:44:02 +0100
 Subject: [PATCH] Serial ioctl() workaround
@@ -29,5 +29,5 @@ index b78d33e..58b0444 100644
  /* HP-UX requires that this be included to pick up MDCD, MCTS, MDSR,
   * MDTR, MRI, and MRTS (appearantly used internally by some things
 -- 
-2.7.4
+2.9.3
 
diff --git a/package/python3/0012-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch b/package/python3/0009-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
similarity index 92%
rename from package/python3/0012-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
rename to package/python3/0009-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
index 9f49706..015ecc0 100644
--- a/package/python3/0012-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
+++ b/package/python3/0009-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
@@ -1,4 +1,4 @@
-From c0eb115234b1c41a25c1a9e8a39e49155357c45a Mon Sep 17 00:00:00 2001
+From 0d63a5df20abeea7a5f10eaceed376151565e766 Mon Sep 17 00:00:00 2001
 From: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
 Date: Wed, 23 Dec 2015 11:44:30 +0100
 Subject: [PATCH] Do not adjust the shebang of Python scripts for
@@ -18,7 +18,7 @@ Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Lib/distutils/command/build_scripts.py b/Lib/distutils/command/build_scripts.py
-index 90a8380..bdf4cf1 100644
+index ccc70e6..d6d5419 100644
 --- a/Lib/distutils/command/build_scripts.py
 +++ b/Lib/distutils/command/build_scripts.py
 @@ -91,7 +91,7 @@ class build_scripts(Command):
@@ -31,5 +31,5 @@ index 90a8380..bdf4cf1 100644
                           self.build_dir)
                  updated_files.append(outfile)
 -- 
-2.7.4
+2.9.3
 
diff --git a/package/python3/0013-Misc-python-config.sh.in-ensure-sed-invocations-only.patch b/package/python3/0010-Misc-python-config.sh.in-ensure-sed-invocations-only.patch
similarity index 97%
rename from package/python3/0013-Misc-python-config.sh.in-ensure-sed-invocations-only.patch
rename to package/python3/0010-Misc-python-config.sh.in-ensure-sed-invocations-only.patch
index d5e330f..8a2391f 100644
--- a/package/python3/0013-Misc-python-config.sh.in-ensure-sed-invocations-only.patch
+++ b/package/python3/0010-Misc-python-config.sh.in-ensure-sed-invocations-only.patch
@@ -1,4 +1,4 @@
-From a92c541ce8dd40af86642ac420e628aeeb6a5f05 Mon Sep 17 00:00:00 2001
+From 6bb211f4b53e92ffba793863f8c8b97a90f8dd3c Mon Sep 17 00:00:00 2001
 From: Peter Korsgaard <peter@korsgaard.com>
 Date: Thu, 20 Nov 2014 13:24:59 +0100
 Subject: [PATCH] Misc/python-config.sh.in: ensure sed invocations only match
@@ -56,5 +56,5 @@ index 30c6927..f905a71 100644
  PYTHONFRAMEWORK="@PYTHONFRAMEWORK@"
  INCDIR="-I$includedir/python${VERSION}${ABIFLAGS}"
 -- 
-2.7.4
+2.9.3
 
diff --git a/package/python3/0015-Override-system-locale-and-set-to-default-when-addin.patch b/package/python3/0011-Override-system-locale-and-set-to-default-when-addin.patch
similarity index 92%
rename from package/python3/0015-Override-system-locale-and-set-to-default-when-addin.patch
rename to package/python3/0011-Override-system-locale-and-set-to-default-when-addin.patch
index 2c45a43..139537b 100644
--- a/package/python3/0015-Override-system-locale-and-set-to-default-when-addin.patch
+++ b/package/python3/0011-Override-system-locale-and-set-to-default-when-addin.patch
@@ -1,4 +1,4 @@
-From 3f2764f8433f49cb7a9e647d3e4ec2ba3cffb694 Mon Sep 17 00:00:00 2001
+From 147a1974d15654c579d5ac854f969d7393a20744 Mon Sep 17 00:00:00 2001
 From: Samuel Cabrero <samuelcabrero@gmail.com>
 Date: Wed, 23 Dec 2015 11:45:48 +0100
 Subject: [PATCH] Override system locale and set to default when adding gcc
@@ -20,7 +20,7 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/setup.py b/setup.py
-index cc2f00b..1c3b838 100644
+index 0be015e..c865172 100644
 --- a/setup.py
 +++ b/setup.py
 @@ -457,7 +457,7 @@ class PyBuildExt(build_ext):
@@ -33,5 +33,5 @@ index cc2f00b..1c3b838 100644
          in_incdirs = False
          inc_dirs = []
 -- 
-2.7.4
+2.9.3
 
diff --git a/package/python3/0016-Add-importlib-fix-for-PEP-3147-issue.patch b/package/python3/0012-Add-importlib-fix-for-PEP-3147-issue.patch
similarity index 86%
rename from package/python3/0016-Add-importlib-fix-for-PEP-3147-issue.patch
rename to package/python3/0012-Add-importlib-fix-for-PEP-3147-issue.patch
index a3ab570..b929fa3 100644
--- a/package/python3/0016-Add-importlib-fix-for-PEP-3147-issue.patch
+++ b/package/python3/0012-Add-importlib-fix-for-PEP-3147-issue.patch
@@ -1,6 +1,6 @@
-From 66c1baaf357f75591ee2f31966385b6eb96c8eb4 Mon Sep 17 00:00:00 2001
+From 7615840f2298aedc990db3d9be2badb19294a807 Mon Sep 17 00:00:00 2001
 From: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
-Date: Wed, 23 Dec 2015 11:46:14 +0100
+Date: Wed, 22 Feb 2017 16:48:49 -0800
 Subject: [PATCH] Add importlib fix for PEP 3147 issue
 
 Python 3 has a new standard for installing .pyc file, called PEP
@@ -18,15 +18,17 @@ This effectively disables PEP 3147 for:
 * Packages built with automake that use the `py-compile` helper
 
 Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
+[ Andrey Smirnov: ported to Python 3.6 ]
+Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 ---
- Lib/importlib/_bootstrap_external.py | 37 +++++-------------------------------
- 1 file changed, 5 insertions(+), 32 deletions(-)
+ Lib/importlib/_bootstrap_external.py | 38 +++++-------------------------------
+ 1 file changed, 5 insertions(+), 33 deletions(-)
 
 diff --git a/Lib/importlib/_bootstrap_external.py b/Lib/importlib/_bootstrap_external.py
-index 9788828..dfcc27e 100644
+index 9feec50..3550013 100644
 --- a/Lib/importlib/_bootstrap_external.py
 +++ b/Lib/importlib/_bootstrap_external.py
-@@ -258,8 +258,6 @@ def cache_from_source(path, debug_override=None, *, optimization=None):
+@@ -275,8 +275,6 @@ def cache_from_source(path, debug_override=None, *, optimization=None):
      a True value is the same as setting 'optimization' to the empty string
      while a False value is equivalent to setting 'optimization' to '1'.
  
@@ -35,8 +37,8 @@ index 9788828..dfcc27e 100644
      """
      if debug_override is not None:
          _warnings.warn('the debug_override parameter is deprecated; use '
-@@ -270,10 +268,7 @@ def cache_from_source(path, debug_override=None, *, optimization=None):
-         optimization = '' if debug_override else 1
+@@ -288,10 +286,7 @@ def cache_from_source(path, debug_override=None, *, optimization=None):
+     path = _os.fspath(path)
      head, tail = _path_split(path)
      base, sep, rest = tail.rpartition('.')
 -    tag = sys.implementation.cache_tag
@@ -47,7 +49,7 @@ index 9788828..dfcc27e 100644
      if optimization is None:
          if sys.flags.optimize == 0:
              optimization = ''
-@@ -284,39 +279,17 @@ def cache_from_source(path, debug_override=None, *, optimization=None):
+@@ -302,40 +297,17 @@ def cache_from_source(path, debug_override=None, *, optimization=None):
          if not optimization.isalnum():
              raise ValueError('{!r} is not alphanumeric'.format(optimization))
          almost_filename = '{}.{}{}'.format(almost_filename, _OPT, optimization)
@@ -67,6 +69,7 @@ index 9788828..dfcc27e 100644
      """
 -    if sys.implementation.cache_tag is None:
 -        raise NotImplementedError('sys.implementation.cache_tag is None')
+-    path = _os.fspath(path)
 -    head, pycache_filename = _path_split(path)
 -    head, pycache = _path_split(head)
 -    if pycache != _PYCACHE:
@@ -92,5 +95,5 @@ index 9788828..dfcc27e 100644
  
  
 -- 
-2.7.4
+2.9.3
 
diff --git a/package/python3/0017-Add-an-option-to-disable-installation-of-test-module.patch b/package/python3/0013-Add-an-option-to-disable-installation-of-test-module.patch
similarity index 73%
rename from package/python3/0017-Add-an-option-to-disable-installation-of-test-module.patch
rename to package/python3/0013-Add-an-option-to-disable-installation-of-test-module.patch
index 563b5ba..17a214f 100644
--- a/package/python3/0017-Add-an-option-to-disable-installation-of-test-module.patch
+++ b/package/python3/0013-Add-an-option-to-disable-installation-of-test-module.patch
@@ -1,6 +1,6 @@
-From 78e54257cf149408036661be98be6f2650c5a8f9 Mon Sep 17 00:00:00 2001
+From 203087fe335a4b254c415f298ac6710d3f98b27e Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 23 Dec 2015 11:47:00 +0100
+Date: Wed, 22 Feb 2017 17:01:18 -0800
 Subject: [PATCH] Add an option to disable installation of test modules
 
 The Python standard distribution comes with many test modules, that
@@ -8,23 +8,25 @@ are not necessarly useful on embedded targets.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+[ Andrey Smirnov: ported to Python 3.6 ]
+Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 ---
- Makefile.pre.in | 56 ++++++++++++++++++++++++++++++++++++--------------------
- configure.ac    |  6 ++++++
- 2 files changed, 42 insertions(+), 20 deletions(-)
+ Makefile.pre.in | 55 ++++++++++++++++++++++++++++++++++++-------------------
+ configure.ac    |  5 +++++
+ 2 files changed, 41 insertions(+), 19 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index d70375a..e5a4372 100644
+index 0e06ddb..029d3e3 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1192,8 +1192,30 @@ maninstall:	altmaninstall
- PLATDIR=	@PLATDIR@
- MACHDEPS=	$(PLATDIR)
+@@ -1191,8 +1191,28 @@ maninstall:	altmaninstall
+ 
+ # Install the library
  XMLLIBSUBDIRS=  xml xml/dom xml/etree xml/parsers xml/sax
 -LIBSUBDIRS=	tkinter tkinter/test tkinter/test/test_tkinter \
 -		tkinter/test/test_ttk site-packages test \
-+LIBSUBDIRS=	tkinter \
-+		site-packages \
++
++LIBSUBDIRS=	tkinter site-packages \
 +		asyncio \
 +		collections concurrent concurrent/futures encodings \
 +		email email/mime \
@@ -40,22 +42,20 @@ index d70375a..e5a4372 100644
 +		turtledemo \
 +		multiprocessing multiprocessing/dummy \
 +		unittest \
-+		venv venv/scripts venv/scripts/posix \
-+		curses pydoc_data $(MACHDEPS)
++		venv venv/scripts venv/scripts/common venv/scripts/posix \
++		curses pydoc_data
 +
-+TESTSUBDIRS = 	tkinter/test tkinter/test/test_tkinter tkinter/test/test_ttk \
-+		test test/test_asyncio \
-+		test/test_email test/test_email/data \
-+		test/test_json \
++TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
++		tkinter/test/test_ttk test \
  		test/audiodata \
  		test/capath test/data \
  		test/cjkencodings test/decimaltestdata test/xmltestdata \
-@@ -1225,28 +1247,22 @@ LIBSUBDIRS=	tkinter tkinter/test tkinter/test/test_tkinter \
+@@ -1226,29 +1246,26 @@ LIBSUBDIRS=	tkinter tkinter/test tkinter/test/test_tkinter \
  		test/test_importlib/namespace_pkgs/project3/parent/child \
                  test/test_importlib/namespace_pkgs/module_and_namespace_package \
                  test/test_importlib/namespace_pkgs/module_and_namespace_package/a_test \
 -		asyncio \
--		test/test_asyncio \
+ 		test/test_asyncio \
 -		collections concurrent concurrent/futures encodings \
 -		email email/mime test/test_email test/test_email/data \
 -		ensurepip ensurepip/_bundled \
@@ -63,6 +63,8 @@ index d70375a..e5a4372 100644
 -		sqlite3 sqlite3/test \
 -		logging csv wsgiref urllib \
 -		lib2to3 lib2to3/fixes lib2to3/pgen2 lib2to3/tests \
++		test/test_email test/test_email/data \
++		test/test_json \
 +		sqlite3/test \
 +		lib2to3/tests \
  		lib2to3/tests/data lib2to3/tests/data/fixers \
@@ -77,37 +79,37 @@ index d70375a..e5a4372 100644
 +		test/test_importlib test/test_importlib/builtin \
  		test/test_importlib/extension test/test_importlib/frozen \
  		test/test_importlib/import_ test/test_importlib/source \
+ 		test/test_tools test/test_warnings test/test_warnings/data \
 -		turtledemo \
 -		multiprocessing multiprocessing/dummy \
 -		unittest unittest/test unittest/test/testmock \
--		venv venv/scripts venv/scripts/posix \
--		curses pydoc_data $(MACHDEPS)
+-		venv venv/scripts venv/scripts/common venv/scripts/posix \
+-		curses pydoc_data
 +		unittest/test unittest/test/testmock
 +
 +ifeq (@TEST_MODULES@,yes)
 +LIBSUBDIRS += $(TESTSUBDIRS)
 +endif
 +
- libinstall:	build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
+ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
  	@for i in $(SCRIPTDIR) $(LIBDEST); \
  	do \
 diff --git a/configure.ac b/configure.ac
-index c43ff9f..8b8c249 100644
+index fc4e71a..972eaca 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2977,6 +2977,12 @@ if test "$posix_threads" = "yes"; then
+@@ -3081,6 +3081,11 @@ if test "$posix_threads" = "yes"; then
+       AC_CHECK_FUNCS(pthread_atfork)
  fi
  
- 
 +AC_SUBST(TEST_MODULES)
 +
 +AC_ARG_ENABLE(test-modules,
 +	AS_HELP_STRING([--disable-test-modules], [disable test modules]),
 +	[ TEST_MODULES="${enableval}" ], [ TEST_MODULES=yes ])
-+
+ 
  # Check for enable-ipv6
  AH_TEMPLATE(ENABLE_IPV6, [Define if --enable-ipv6 is specified])
- AC_MSG_CHECKING([if --enable-ipv6 is specified])
 -- 
-2.7.4
+2.9.3
 
diff --git a/package/python3/0018-Add-an-option-to-disable-pydoc.patch b/package/python3/0014-Add-an-option-to-disable-pydoc.patch
similarity index 68%
rename from package/python3/0018-Add-an-option-to-disable-pydoc.patch
rename to package/python3/0014-Add-an-option-to-disable-pydoc.patch
index f8192dd..b62a564 100644
--- a/package/python3/0018-Add-an-option-to-disable-pydoc.patch
+++ b/package/python3/0014-Add-an-option-to-disable-pydoc.patch
@@ -1,6 +1,6 @@
-From e07206329b3a4cdecaeca7991996950f82cd8744 Mon Sep 17 00:00:00 2001
+From 5255a7e995d67a7f192b4cf3921826a365c00281 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 23 Dec 2015 11:47:11 +0100
+Date: Wed, 22 Feb 2017 17:07:56 -0800
 Subject: [PATCH] Add an option to disable pydoc
 
 It removes 0.5 MB of data from the target plus the pydoc script
@@ -8,17 +8,19 @@ itself.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+[ Andrey Smirnov: ported to Python 3.6 ]
+Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 ---
  Makefile.pre.in | 8 +++++++-
- configure.ac    | 5 +++++
+ configure.ac    | 6 ++++++
  setup.py        | 9 +++++++--
- 3 files changed, 19 insertions(+), 3 deletions(-)
+ 3 files changed, 20 insertions(+), 3 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index e5a4372..83fc343 100644
+index 029d3e3..92315f2 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1160,7 +1160,9 @@ bininstall: altbininstall
+@@ -1161,7 +1161,9 @@ bininstall: altbininstall
  	-rm -f $(DESTDIR)$(BINDIR)/idle3
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s idle$(VERSION) idle3)
  	-rm -f $(DESTDIR)$(BINDIR)/pydoc3
@@ -28,31 +30,31 @@ index e5a4372..83fc343 100644
  	-rm -f $(DESTDIR)$(BINDIR)/2to3
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s 2to3-$(VERSION) 2to3)
  	-rm -f $(DESTDIR)$(BINDIR)/pyvenv
-@@ -1210,7 +1212,7 @@ LIBSUBDIRS=	tkinter \
+@@ -1209,7 +1211,7 @@ LIBSUBDIRS=	tkinter site-packages \
  		multiprocessing multiprocessing/dummy \
  		unittest \
- 		venv venv/scripts venv/scripts/posix \
--		curses pydoc_data $(MACHDEPS)
-+		curses $(MACHDEPS)
+ 		venv venv/scripts venv/scripts/common venv/scripts/posix \
+-		curses pydoc_data
++		curses
  
- TESTSUBDIRS = 	tkinter/test tkinter/test/test_tkinter tkinter/test/test_ttk \
- 		test test/test_asyncio \
-@@ -1259,6 +1261,10 @@ TESTSUBDIRS = 	tkinter/test tkinter/test/test_tkinter tkinter/test/test_ttk \
- 		test/test_importlib/import_ test/test_importlib/source \
- 		unittest/test unittest/test/testmock
+ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
+ 		tkinter/test/test_ttk test \
+@@ -1266,6 +1268,10 @@ ifeq (@TEST_MODULES@,yes)
+ LIBSUBDIRS += $(TESTSUBDIRS)
+ endif
  
 +ifeq (@PYDOC@,yes)
 +LIBSUBDIRS += pydoc_data
 +endif
 +
- ifeq (@TEST_MODULES@,yes)
- LIBSUBDIRS += $(TESTSUBDIRS)
- endif
+ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
+ 	@for i in $(SCRIPTDIR) $(LIBDEST); \
+ 	do \
 diff --git a/configure.ac b/configure.ac
-index 8b8c249..eea25d4 100644
+index 972eaca..654594a 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2976,6 +2976,11 @@ if test "$posix_threads" = "yes"; then
+@@ -3081,6 +3081,12 @@ if test "$posix_threads" = "yes"; then
        AC_CHECK_FUNCS(pthread_atfork)
  fi
  
@@ -61,14 +63,15 @@ index 8b8c249..eea25d4 100644
 +AC_ARG_ENABLE(pydoc,
 +	AS_HELP_STRING([--disable-pydoc], [disable pydoc]),
 +	[ PYDOC="${enableval}" ], [ PYDOC=yes ])
- 
++
  AC_SUBST(TEST_MODULES)
  
+ AC_ARG_ENABLE(test-modules,
 diff --git a/setup.py b/setup.py
-index 1c3b838..2a01896 100644
+index c865172..26bf414 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -2253,6 +2253,12 @@ def main():
+@@ -2278,6 +2278,12 @@ def main():
      # turn off warnings when deprecated modules are imported
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
@@ -81,16 +84,16 @@ index 1c3b838..2a01896 100644
      setup(# PyPI Metadata (PEP 301)
            name = "Python",
            version = sys.version.split()[0],
-@@ -2277,8 +2283,7 @@ def main():
+@@ -2302,8 +2308,7 @@ def main():
            # If you change the scripts installed here, you also need to
            # check the PyBuildScripts command above, and change the links
            # created by the bininstall target in Makefile.pre.in
 -          scripts = ["Tools/scripts/pydoc3", "Tools/scripts/idle3",
 -                     "Tools/scripts/2to3", "Tools/scripts/pyvenv"]
-+          scripts = scripts,
++          scripts = scripts
          )
  
  # --install-platlib
 -- 
-2.7.4
+2.9.3
 
diff --git a/package/python3/0014-Do-not-harcode-invalid-path-to-ncursesw-headers.patch b/package/python3/0014-Do-not-harcode-invalid-path-to-ncursesw-headers.patch
deleted file mode 100644
index b781f49..0000000
--- a/package/python3/0014-Do-not-harcode-invalid-path-to-ncursesw-headers.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From f33d59b67f26649babc8c91e38eff9bc817d0470 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 23 Dec 2015 11:45:13 +0100
-Subject: [PATCH] Do not harcode invalid path to ncursesw headers
-
-Adding /usr/include/ncursesw is obviously invalid when
-cross-compiling. Since the ncursesw headers are no longer installed in
-usr/include/ncursesw/, but directly in usr/include, there is anyway no
-need for a special header path.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- setup.py | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/setup.py b/setup.py
-index d02012d..cc2f00b 100644
---- a/setup.py
-+++ b/setup.py
-@@ -1326,7 +1326,6 @@ class PyBuildExt(build_ext):
-         panel_library = 'panel'
-         if curses_library == 'ncursesw':
-             curses_defines.append(('HAVE_NCURSESW', '1'))
--            curses_includes.append('/usr/include/ncursesw')
-             # Bug 1464056: If _curses.so links with ncursesw,
-             # _curses_panel.so must link with panelw.
-             panel_library = 'panelw'
--- 
-2.7.4
-
diff --git a/package/python3/0019-Add-an-option-to-disable-lib2to3.patch b/package/python3/0015-Add-an-option-to-disable-lib2to3.patch
similarity index 77%
rename from package/python3/0019-Add-an-option-to-disable-lib2to3.patch
rename to package/python3/0015-Add-an-option-to-disable-lib2to3.patch
index 5386fd7..fc44e6f 100644
--- a/package/python3/0019-Add-an-option-to-disable-lib2to3.patch
+++ b/package/python3/0015-Add-an-option-to-disable-lib2to3.patch
@@ -1,6 +1,6 @@
-From a42283b5bee8bfd0a6a39e6805787643d075f1a5 Mon Sep 17 00:00:00 2001
+From a60b0237cb8eb1899b5c4dcf71527437e79972c9 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 23 Dec 2015 11:48:44 +0100
+Date: Wed, 22 Feb 2017 17:15:31 -0800
 Subject: [PATCH] Add an option to disable lib2to3
 
 lib2to3 is a library to convert Python 2.x code to Python 3.x. As
@@ -8,6 +8,8 @@ such, it is probably not very useful on embedded system targets.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+[ Andrey Smirnov: ported to Python 3.6 ]
+Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 ---
  Makefile.pre.in | 16 ++++++++++++----
  configure.ac    |  6 ++++++
@@ -15,10 +17,10 @@ Signed-off-by: Samuel Martin <s.martin49@gmail.com>
  3 files changed, 21 insertions(+), 6 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 83fc343..aeedad9 100644
+index 92315f2..8e67c91 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1164,7 +1164,9 @@ ifeq (@PYDOC@,yes)
+@@ -1165,7 +1165,9 @@ ifeq (@PYDOC@,yes)
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s pydoc$(VERSION) pydoc3)
  endif
  	-rm -f $(DESTDIR)$(BINDIR)/2to3
@@ -28,7 +30,7 @@ index 83fc343..aeedad9 100644
  	-rm -f $(DESTDIR)$(BINDIR)/pyvenv
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s pyvenv-$(VERSION) pyvenv)
  	if test "x$(LIPO_32BIT_FLAGS)" != "x" ; then \
-@@ -1203,7 +1205,6 @@ LIBSUBDIRS=	tkinter \
+@@ -1202,7 +1204,6 @@ LIBSUBDIRS=	tkinter site-packages \
  		html json http dbm xmlrpc \
  		sqlite3 \
  		logging csv wsgiref urllib \
@@ -36,9 +38,9 @@ index 83fc343..aeedad9 100644
  		ctypes ctypes/macholib \
  		idlelib idlelib/Icons \
  		distutils distutils/command $(XMLLIBSUBDIRS) \
-@@ -1250,9 +1251,6 @@ TESTSUBDIRS = 	tkinter/test tkinter/test/test_tkinter tkinter/test/test_ttk \
-                 test/test_importlib/namespace_pkgs/module_and_namespace_package \
-                 test/test_importlib/namespace_pkgs/module_and_namespace_package/a_test \
+@@ -1252,9 +1253,6 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
+ 		test/test_email test/test_email/data \
+ 		test/test_json \
  		sqlite3/test \
 -		lib2to3/tests \
 -		lib2to3/tests/data lib2to3/tests/data/fixers \
@@ -46,9 +48,9 @@ index 83fc343..aeedad9 100644
  		ctypes/test \
  		idlelib/idle_test \
  		distutils/tests \
-@@ -1265,6 +1263,14 @@ ifeq (@PYDOC@,yes)
- LIBSUBDIRS += pydoc_data
- endif
+@@ -1264,6 +1262,14 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
+ 		test/test_tools test/test_warnings test/test_warnings/data \
+ 		unittest/test unittest/test/testmock
  
 +ifeq (@LIB2TO3@,yes)
 +LIBSUBDIRS += lib2to3 lib2to3/fixes lib2to3/pgen2
@@ -72,13 +74,13 @@ index 83fc343..aeedad9 100644
  		$(PYTHON_FOR_BUILD) -m lib2to3.pgen2.driver $(DESTDIR)$(LIBDEST)/lib2to3/PatternGrammar.txt
 +endif
  
- # Create the PLATDIR source directory, if one wasn't distributed..
- $(srcdir)/Lib/$(PLATDIR):
+ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
+ 	# Substitution happens here, as the completely-expanded BINDIR
 diff --git a/configure.ac b/configure.ac
-index eea25d4..32239d3 100644
+index 654594a..b518cbe 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2988,6 +2988,12 @@ AC_ARG_ENABLE(test-modules,
+@@ -3093,6 +3093,12 @@ AC_ARG_ENABLE(test-modules,
  	AS_HELP_STRING([--disable-test-modules], [disable test modules]),
  	[ TEST_MODULES="${enableval}" ], [ TEST_MODULES=yes ])
  
@@ -92,10 +94,10 @@ index eea25d4..32239d3 100644
  AH_TEMPLATE(ENABLE_IPV6, [Define if --enable-ipv6 is specified])
  AC_MSG_CHECKING([if --enable-ipv6 is specified])
 diff --git a/setup.py b/setup.py
-index 2a01896..be27531 100644
+index 26bf414..80ec79b 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -2254,10 +2254,11 @@ def main():
+@@ -2279,10 +2279,11 @@ def main():
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
  
@@ -110,5 +112,5 @@ index 2a01896..be27531 100644
      setup(# PyPI Metadata (PEP 301)
            name = "Python",
 -- 
-2.7.4
+2.9.3
 
diff --git a/package/python3/0020-Add-option-to-disable-the-sqlite3-module.patch b/package/python3/0016-Add-option-to-disable-the-sqlite3-module.patch
similarity index 66%
rename from package/python3/0020-Add-option-to-disable-the-sqlite3-module.patch
rename to package/python3/0016-Add-option-to-disable-the-sqlite3-module.patch
index da1c01d..9d34f6a 100644
--- a/package/python3/0020-Add-option-to-disable-the-sqlite3-module.patch
+++ b/package/python3/0016-Add-option-to-disable-the-sqlite3-module.patch
@@ -1,20 +1,22 @@
-From 3d12c6e8180bc250d77a4bbb78899ccf8566b1cb Mon Sep 17 00:00:00 2001
+From 59b833c2ee545e53bcb920e9509b67419c2fb1ad Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 23 Dec 2015 11:49:01 +0100
+Date: Wed, 22 Feb 2017 17:20:45 -0800
 Subject: [PATCH] Add option to disable the sqlite3 module
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+[ Andrey Smirnov: ported to Python 3.6 ]
+Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 ---
  Makefile.pre.in | 7 +++++--
  configure.ac    | 9 +++++++++
  2 files changed, 14 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index aeedad9..d262c04 100644
+index 8e67c91..3907f92 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1203,7 +1203,6 @@ LIBSUBDIRS=	tkinter \
+@@ -1202,7 +1202,6 @@ LIBSUBDIRS=	tkinter site-packages \
  		email email/mime \
  		ensurepip ensurepip/_bundled \
  		html json http dbm xmlrpc \
@@ -22,15 +24,15 @@ index aeedad9..d262c04 100644
  		logging csv wsgiref urllib \
  		ctypes ctypes/macholib \
  		idlelib idlelib/Icons \
-@@ -1250,7 +1249,6 @@ TESTSUBDIRS = 	tkinter/test tkinter/test/test_tkinter tkinter/test/test_ttk \
- 		test/test_importlib/namespace_pkgs/project3/parent/child \
-                 test/test_importlib/namespace_pkgs/module_and_namespace_package \
-                 test/test_importlib/namespace_pkgs/module_and_namespace_package/a_test \
+@@ -1252,7 +1251,6 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
+ 		test/test_asyncio \
+ 		test/test_email test/test_email/data \
+ 		test/test_json \
 -		sqlite3/test \
  		ctypes/test \
  		idlelib/idle_test \
  		distutils/tests \
-@@ -1271,6 +1269,11 @@ TESTSUBDIRS += lib2to3/tests			\
+@@ -1270,6 +1268,11 @@ TESTSUBDIRS += lib2to3/tests			\
  	lib2to3/tests/data/fixers/myfixes
  endif
  
@@ -43,10 +45,10 @@ index aeedad9..d262c04 100644
  LIBSUBDIRS += $(TESTSUBDIRS)
  endif
 diff --git a/configure.ac b/configure.ac
-index 32239d3..c9d0912 100644
+index b518cbe..a30c45d 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2976,6 +2976,15 @@ if test "$posix_threads" = "yes"; then
+@@ -3081,6 +3081,15 @@ if test "$posix_threads" = "yes"; then
        AC_CHECK_FUNCS(pthread_atfork)
  fi
  
@@ -63,5 +65,5 @@ index 32239d3..c9d0912 100644
  
  AC_ARG_ENABLE(pydoc,
 -- 
-2.7.4
+2.9.3
 
diff --git a/package/python3/0021-Add-an-option-to-disable-the-tk-module.patch b/package/python3/0017-Add-an-option-to-disable-the-tk-module.patch
similarity index 53%
rename from package/python3/0021-Add-an-option-to-disable-the-tk-module.patch
rename to package/python3/0017-Add-an-option-to-disable-the-tk-module.patch
index e766452..925eb82 100644
--- a/package/python3/0021-Add-an-option-to-disable-the-tk-module.patch
+++ b/package/python3/0017-Add-an-option-to-disable-the-tk-module.patch
@@ -1,41 +1,43 @@
-From 61f201afe59bbfbb1094d987fd74ac9cd4764d52 Mon Sep 17 00:00:00 2001
+From 4fc4260e66f8b004f14feb332c57a2d8fdd305de Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 23 Dec 2015 11:49:14 +0100
+Date: Wed, 22 Feb 2017 17:23:42 -0800
 Subject: [PATCH] Add an option to disable the tk module
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+[ Andrey Smirnov: ported to Python 3.6 ]
+Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 ---
  Makefile.pre.in | 11 ++++++++---
  configure.ac    |  9 +++++++++
  2 files changed, 17 insertions(+), 3 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index d262c04..851faa3 100644
+index 3907f92..93ef34d 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
 @@ -1196,7 +1196,7 @@ maninstall:	altmaninstall
- PLATDIR=	@PLATDIR@
- MACHDEPS=	$(PLATDIR)
+ # Install the library
  XMLLIBSUBDIRS=  xml xml/dom xml/etree xml/parsers xml/sax
--LIBSUBDIRS=	tkinter \
-+LIBSUBDIRS=	\
- 		site-packages \
+ 
+-LIBSUBDIRS=	tkinter site-packages \
++LIBSUBDIRS=	site-packages \
  		asyncio \
  		collections concurrent concurrent/futures encodings \
-@@ -1214,8 +1214,7 @@ LIBSUBDIRS=	tkinter \
- 		venv venv/scripts venv/scripts/posix \
- 		curses $(MACHDEPS)
+ 		email email/mime \
+@@ -1213,8 +1213,7 @@ LIBSUBDIRS=	tkinter site-packages \
+ 		venv venv/scripts venv/scripts/common venv/scripts/posix \
+ 		curses
  
--TESTSUBDIRS = 	tkinter/test tkinter/test/test_tkinter tkinter/test/test_ttk \
--		test test/test_asyncio \
-+TESTSUBDIRS = 	test test/test_asyncio \
- 		test/test_email test/test_email/data \
- 		test/test_json \
+-TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
+-		tkinter/test/test_ttk test \
++TESTSUBDIRS=	test \
  		test/audiodata \
-@@ -1274,6 +1273,12 @@ LIBSUBDIRS += sqlite3
- TESTSUBDIRS += sqlite3/test
- endif
+ 		test/capath test/data \
+ 		test/cjkencodings test/decimaltestdata test/xmltestdata \
+@@ -1260,6 +1259,12 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
+ 		test/test_tools test/test_warnings test/test_warnings/data \
+ 		unittest/test unittest/test/testmock
  
 +ifeq (@TK@,yes)
 +LIBSUBDIRS += tkinter
@@ -43,14 +45,14 @@ index d262c04..851faa3 100644
 +	tkinter/test/test_ttk
 +endif
 +
- ifeq (@TEST_MODULES@,yes)
- LIBSUBDIRS += $(TESTSUBDIRS)
- endif
+ ifeq (@LIB2TO3@,yes)
+ LIBSUBDIRS += lib2to3 lib2to3/fixes lib2to3/pgen2
+ TESTSUBDIRS += lib2to3/tests			\
 diff --git a/configure.ac b/configure.ac
-index c9d0912..d5047ec 100644
+index a30c45d..52887c9 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2985,6 +2985,15 @@ if test "$SQLITE3" = "no" ; then
+@@ -3090,6 +3090,15 @@ if test "$SQLITE3" = "no" ; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
  fi
  
@@ -67,5 +69,5 @@ index c9d0912..d5047ec 100644
  
  AC_ARG_ENABLE(pydoc,
 -- 
-2.7.4
+2.9.3
 
diff --git a/package/python3/0022-Add-an-option-to-disable-the-curses-module.patch b/package/python3/0018-Add-an-option-to-disable-the-curses-module.patch
similarity index 54%
rename from package/python3/0022-Add-an-option-to-disable-the-curses-module.patch
rename to package/python3/0018-Add-an-option-to-disable-the-curses-module.patch
index 37cf66f..18d6431 100644
--- a/package/python3/0022-Add-an-option-to-disable-the-curses-module.patch
+++ b/package/python3/0018-Add-an-option-to-disable-the-curses-module.patch
@@ -1,29 +1,32 @@
-From 2d1a718b6fc386e718c26dec23633f478e8791a0 Mon Sep 17 00:00:00 2001
+From 25cb62e9ff67c990be5a694d66394f20b7ca1fda Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 23 Dec 2015 11:49:30 +0100
+Date: Wed, 22 Feb 2017 17:31:51 -0800
 Subject: [PATCH] Add an option to disable the curses module
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+[ Andrey Smirnov: ported to Python 3.6 ]
+Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 ---
- Makefile.pre.in | 6 +++++-
+ Makefile.pre.in | 7 +++++--
  configure.ac    | 9 +++++++++
- 2 files changed, 14 insertions(+), 1 deletion(-)
+ 2 files changed, 14 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 851faa3..90a055c 100644
+index 93ef34d..3621130 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1212,7 +1212,7 @@ LIBSUBDIRS=	\
+@@ -1210,8 +1210,7 @@ LIBSUBDIRS=	site-packages \
+ 		turtledemo \
  		multiprocessing multiprocessing/dummy \
  		unittest \
- 		venv venv/scripts venv/scripts/posix \
--		curses $(MACHDEPS)
-+		$(MACHDEPS)
+-		venv venv/scripts venv/scripts/common venv/scripts/posix \
+-		curses
++		venv venv/scripts venv/scripts/common venv/scripts/posix
  
- TESTSUBDIRS = 	test test/test_asyncio \
- 		test/test_email test/test_email/data \
-@@ -1279,6 +1279,10 @@ TESTSUBDIRS += tkinter/test tkinter/test/test_tkinter \
+ TESTSUBDIRS=	test \
+ 		test/audiodata \
+@@ -1265,6 +1264,10 @@ TESTSUBDIRS += tkinter/test tkinter/test/test_tkinter \
  	tkinter/test/test_ttk
  endif
  
@@ -31,14 +34,14 @@ index 851faa3..90a055c 100644
 +LIBSUBDIRS += curses
 +endif
 +
- ifeq (@TEST_MODULES@,yes)
- LIBSUBDIRS += $(TESTSUBDIRS)
- endif
+ ifeq (@LIB2TO3@,yes)
+ LIBSUBDIRS += lib2to3 lib2to3/fixes lib2to3/pgen2
+ TESTSUBDIRS += lib2to3/tests			\
 diff --git a/configure.ac b/configure.ac
-index d5047ec..3814ba0 100644
+index 52887c9..485f73c 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2994,6 +2994,15 @@ if test "$TK" = "no"; then
+@@ -3099,6 +3099,15 @@ if test "$TK" = "no"; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _tkinter"
  fi
  
@@ -55,5 +58,5 @@ index d5047ec..3814ba0 100644
  
  AC_ARG_ENABLE(pydoc,
 -- 
-2.7.4
+2.9.3
 
diff --git a/package/python3/0023-Add-an-option-to-disable-expat.patch b/package/python3/0019-Add-an-option-to-disable-expat.patch
similarity index 80%
rename from package/python3/0023-Add-an-option-to-disable-expat.patch
rename to package/python3/0019-Add-an-option-to-disable-expat.patch
index eff1af8..bdbfece 100644
--- a/package/python3/0023-Add-an-option-to-disable-expat.patch
+++ b/package/python3/0019-Add-an-option-to-disable-expat.patch
@@ -1,6 +1,6 @@
-From cb39a3171e28ac6db79d3604959730746e50c2b4 Mon Sep 17 00:00:00 2001
+From a7e1fc80dc729018e806d6f3202c852c0d69cba7 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 23 Dec 2015 11:49:42 +0100
+Date: Wed, 22 Feb 2017 17:40:45 -0800
 Subject: [PATCH] Add an option to disable expat
 
 This patch replaces the existing --with-system-expat option with a
@@ -11,6 +11,8 @@ installation of XML modules).
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+[ Andrey Smirnov: ported to Python 3.6 ]
+Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 ---
  Makefile.pre.in |  6 +++++-
  configure.ac    | 18 +++++++++++++-----
@@ -18,10 +20,10 @@ Signed-off-by: Samuel Martin <s.martin49@gmail.com>
  3 files changed, 19 insertions(+), 7 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 90a055c..fcb1ac4 100644
+index 3621130..a9bdbde 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1206,7 +1206,7 @@ LIBSUBDIRS=	\
+@@ -1205,7 +1205,7 @@ LIBSUBDIRS=	site-packages \
  		logging csv wsgiref urllib \
  		ctypes ctypes/macholib \
  		idlelib idlelib/Icons \
@@ -30,7 +32,7 @@ index 90a055c..fcb1ac4 100644
  		importlib \
  		turtledemo \
  		multiprocessing multiprocessing/dummy \
-@@ -1283,6 +1283,10 @@ ifeq (@CURSES@,yes)
+@@ -1268,6 +1268,10 @@ ifeq (@CURSES@,yes)
  LIBSUBDIRS += curses
  endif
  
@@ -38,14 +40,14 @@ index 90a055c..fcb1ac4 100644
 +LIBSUBDIRS += $(XMLLIBSUBDIRS)
 +endif
 +
- ifeq (@TEST_MODULES@,yes)
- LIBSUBDIRS += $(TESTSUBDIRS)
- endif
+ ifeq (@LIB2TO3@,yes)
+ LIBSUBDIRS += lib2to3 lib2to3/fixes lib2to3/pgen2
+ TESTSUBDIRS += lib2to3/tests			\
 diff --git a/configure.ac b/configure.ac
-index 3814ba0..a7e9d16 100644
+index 485f73c..a426b3a 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2673,13 +2673,21 @@ PKG_PROG_PKG_CONFIG
+@@ -2782,13 +2782,21 @@ PKG_PROG_PKG_CONFIG
  AC_SUBST(DISABLED_EXTENSIONS)
  
  # Check for use of the system expat library
@@ -73,10 +75,10 @@ index 3814ba0..a7e9d16 100644
  # Check for use of the system libffi library
  AC_MSG_CHECKING(for --with-system-ffi)
 diff --git a/setup.py b/setup.py
-index be27531..53a471c 100644
+index 80ec79b..660bbd7 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -1464,7 +1464,7 @@ class PyBuildExt(build_ext):
+@@ -1492,7 +1492,7 @@ class PyBuildExt(build_ext):
          #
          # More information on Expat can be found at www.libexpat.org.
          #
@@ -86,5 +88,5 @@ index be27531..53a471c 100644
              define_macros = []
              expat_lib = ['expat']
 -- 
-2.7.4
+2.9.3
 
diff --git a/package/python3/0024-Add-an-option-to-disable-CJK-codecs.patch b/package/python3/0020-Add-an-option-to-disable-CJK-codecs.patch
similarity index 83%
rename from package/python3/0024-Add-an-option-to-disable-CJK-codecs.patch
rename to package/python3/0020-Add-an-option-to-disable-CJK-codecs.patch
index 62c8a6b..80c46a8 100644
--- a/package/python3/0024-Add-an-option-to-disable-CJK-codecs.patch
+++ b/package/python3/0020-Add-an-option-to-disable-CJK-codecs.patch
@@ -1,4 +1,4 @@
-From 26fb4f055203332db8a346ae80da542f721df01d Mon Sep 17 00:00:00 2001
+From 4c2965ff24ab8b7351222b210f01ac7db52f4dc7 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:49:55 +0100
 Subject: [PATCH] Add an option to disable CJK codecs
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index a7e9d16..e9ea63f 100644
+index a426b3a..d88ae47 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2993,6 +2993,12 @@ if test "$SQLITE3" = "no" ; then
+@@ -3098,6 +3098,12 @@ if test "$SQLITE3" = "no" ; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
  fi
  
@@ -26,5 +26,5 @@ index a7e9d16..e9ea63f 100644
  AC_ARG_ENABLE(tk,
  	AS_HELP_STRING([--disable-tk], [disable tk]),
 -- 
-2.7.4
+2.9.3
 
diff --git a/package/python3/0025-Add-an-option-to-disable-NIS.patch b/package/python3/0021-Add-an-option-to-disable-NIS.patch
similarity index 85%
rename from package/python3/0025-Add-an-option-to-disable-NIS.patch
rename to package/python3/0021-Add-an-option-to-disable-NIS.patch
index d7a7344..b5111cb 100644
--- a/package/python3/0025-Add-an-option-to-disable-NIS.patch
+++ b/package/python3/0021-Add-an-option-to-disable-NIS.patch
@@ -1,4 +1,4 @@
-From a2b911055f5b75e02d6a8853a9b21dfad277758e Mon Sep 17 00:00:00 2001
+From dd10e4ddda9fd4b8205169d223541ab0af506111 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:50:11 +0100
 Subject: [PATCH] Add an option to disable NIS
@@ -12,10 +12,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index e9ea63f..98d1332 100644
+index d88ae47..0099a4a 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2999,6 +2999,12 @@ AC_ARG_ENABLE(codecs-cjk,
+@@ -3104,6 +3104,12 @@ AC_ARG_ENABLE(codecs-cjk,
  		DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _codecs_kr _codecs_jp _codecs_cn _codecs_tw _codecs_hk _codecs_iso2022"
  	fi])
  
@@ -29,5 +29,5 @@ index e9ea63f..98d1332 100644
  AC_ARG_ENABLE(tk,
  	AS_HELP_STRING([--disable-tk], [disable tk]),
 -- 
-2.7.4
+2.9.3
 
diff --git a/package/python3/0026-Add-an-option-to-disable-unicodedata.patch b/package/python3/0022-Add-an-option-to-disable-unicodedata.patch
similarity index 83%
rename from package/python3/0026-Add-an-option-to-disable-unicodedata.patch
rename to package/python3/0022-Add-an-option-to-disable-unicodedata.patch
index f9ecf65..7ffcff2 100644
--- a/package/python3/0026-Add-an-option-to-disable-unicodedata.patch
+++ b/package/python3/0022-Add-an-option-to-disable-unicodedata.patch
@@ -1,4 +1,4 @@
-From 8f0bf1aac225c2a4465baeefc3e4538c27c497e7 Mon Sep 17 00:00:00 2001
+From 949887ee3dbbb274539309d3c42ac04fdd67f34f Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:50:27 +0100
 Subject: [PATCH] Add an option to disable unicodedata
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 98d1332..b1a1f39 100644
+index 0099a4a..9820526 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3005,6 +3005,12 @@ AC_ARG_ENABLE(nis,
+@@ -3110,6 +3110,12 @@ AC_ARG_ENABLE(nis,
      	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} nis"
    	  fi])
  
@@ -26,5 +26,5 @@ index 98d1332..b1a1f39 100644
  AC_ARG_ENABLE(tk,
  	AS_HELP_STRING([--disable-tk], [disable tk]),
 -- 
-2.7.4
+2.9.3
 
diff --git a/package/python3/0027-Add-an-option-to-disable-IDLE.patch b/package/python3/0023-Add-an-option-to-disable-IDLE.patch
similarity index 77%
rename from package/python3/0027-Add-an-option-to-disable-IDLE.patch
rename to package/python3/0023-Add-an-option-to-disable-IDLE.patch
index e8eaea9..99ae10b 100644
--- a/package/python3/0027-Add-an-option-to-disable-IDLE.patch
+++ b/package/python3/0023-Add-an-option-to-disable-IDLE.patch
@@ -1,12 +1,14 @@
-From 6187913d2d84a8f0df85781e32a23eb053365134 Mon Sep 17 00:00:00 2001
+From 49814176a19247a39c55feb8e0eb3656cd801118 Mon Sep 17 00:00:00 2001
 From: Maxime Ripard <maxime.ripard@free-electrons.com>
-Date: Wed, 23 Dec 2015 11:50:42 +0100
+Date: Wed, 22 Feb 2017 17:45:14 -0800
 Subject: [PATCH] Add an option to disable IDLE
 
 IDLE is an IDE embedded into python, written using Tk, so it doesn't make
 much sense to have it into our build.
 
 Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
+[ Andrey Smirnov: ported to Python 3.6 ]
+Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 ---
  Makefile.pre.in | 7 ++++++-
  configure.ac    | 6 ++++++
@@ -14,10 +16,10 @@ Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
  3 files changed, 15 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index fcb1ac4..0c26bcf 100644
+index a9bdbde..82b01c9 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1158,7 +1158,9 @@ bininstall: altbininstall
+@@ -1159,7 +1159,9 @@ bininstall: altbininstall
  	-rm -f $(DESTDIR)$(LIBPC)/python3.pc
  	(cd $(DESTDIR)$(LIBPC); $(LN) -s python-$(VERSION).pc python3.pc)
  	-rm -f $(DESTDIR)$(BINDIR)/idle3
@@ -27,7 +29,7 @@ index fcb1ac4..0c26bcf 100644
  	-rm -f $(DESTDIR)$(BINDIR)/pydoc3
  ifeq (@PYDOC@,yes)
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s pydoc$(VERSION) pydoc3)
-@@ -1205,7 +1207,6 @@ LIBSUBDIRS=	\
+@@ -1204,7 +1206,6 @@ LIBSUBDIRS=	site-packages \
  		html json http dbm xmlrpc \
  		logging csv wsgiref urllib \
  		ctypes ctypes/macholib \
@@ -35,7 +37,7 @@ index fcb1ac4..0c26bcf 100644
  		distutils distutils/command \
  		importlib \
  		turtledemo \
-@@ -1287,6 +1288,10 @@ ifeq (@EXPAT@,yes)
+@@ -1272,6 +1273,10 @@ ifeq (@EXPAT@,yes)
  LIBSUBDIRS += $(XMLLIBSUBDIRS)
  endif
  
@@ -43,14 +45,14 @@ index fcb1ac4..0c26bcf 100644
 +LIBSUBDIRS += idlelib idlelib/Icons
 +endif
 +
- ifeq (@TEST_MODULES@,yes)
- LIBSUBDIRS += $(TESTSUBDIRS)
- endif
+ ifeq (@LIB2TO3@,yes)
+ LIBSUBDIRS += lib2to3 lib2to3/fixes lib2to3/pgen2
+ TESTSUBDIRS += lib2to3/tests			\
 diff --git a/configure.ac b/configure.ac
-index b1a1f39..d1be997 100644
+index 9820526..72989a1 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3047,6 +3047,12 @@ AC_ARG_ENABLE(lib2to3,
+@@ -3152,6 +3152,12 @@ AC_ARG_ENABLE(lib2to3,
  	AS_HELP_STRING([--disable-lib2to3], [disable lib2to3]),
  	[ LIB2TO3="${enableval}" ], [ LIB2TO3=yes ])
  
@@ -64,15 +66,15 @@ index b1a1f39..d1be997 100644
  AH_TEMPLATE(ENABLE_IPV6, [Define if --enable-ipv6 is specified])
  AC_MSG_CHECKING([if --enable-ipv6 is specified])
 diff --git a/setup.py b/setup.py
-index 53a471c..b443987 100644
+index 660bbd7..1079eba 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -2254,11 +2254,13 @@ def main():
+@@ -2279,11 +2279,13 @@ def main():
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
  
 -    scripts = ['Tools/scripts/idle3', 'Lib/smtpd.py']
-+    scripts = ['Lib/smtpd.py']
++    scripts = [ 'Lib/smtpd.py']
      if not '--disable-pydoc' in sysconfig.get_config_var("CONFIG_ARGS"):
          scripts += [ 'Tools/scripts/pydoc3' ]
      if not '--disable-lib2to3' in sysconfig.get_config_var("CONFIG_ARGS"):
@@ -83,5 +85,5 @@ index 53a471c..b443987 100644
      setup(# PyPI Metadata (PEP 301)
            name = "Python",
 -- 
-2.7.4
+2.9.3
 
diff --git a/package/python3/0028-Add-an-option-to-disable-decimal.patch b/package/python3/0024-Add-an-option-to-disable-decimal.patch
similarity index 89%
rename from package/python3/0028-Add-an-option-to-disable-decimal.patch
rename to package/python3/0024-Add-an-option-to-disable-decimal.patch
index 5be1681..27a2421 100644
--- a/package/python3/0028-Add-an-option-to-disable-decimal.patch
+++ b/package/python3/0024-Add-an-option-to-disable-decimal.patch
@@ -1,4 +1,4 @@
-From 1c51f93b8244e3e3be4d125465255c5a056abe22 Mon Sep 17 00:00:00 2001
+From dc321780e26a9270f20b784f438a632bd952cbb3 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:51:31 +0100
 Subject: [PATCH] Add an option to disable decimal
@@ -15,10 +15,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  2 files changed, 13 insertions(+), 6 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index d1be997..3d08ab0 100644
+index 72989a1..71aea1d 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2706,13 +2706,20 @@ AC_SUBST(LIBFFI_INCLUDEDIR)
+@@ -2831,13 +2831,20 @@ AC_SUBST(LIBFFI_INCLUDEDIR)
  AC_MSG_RESULT($with_system_ffi)
  
  # Check for use of the system libmpdec library
@@ -45,10 +45,10 @@ index d1be997..3d08ab0 100644
  # Check for support for loadable sqlite extensions
  AC_MSG_CHECKING(for --enable-loadable-sqlite-extensions)
 diff --git a/setup.py b/setup.py
-index b443987..a1580a0 100644
+index 1079eba..c3a96c1 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -2021,7 +2021,7 @@ class PyBuildExt(build_ext):
+@@ -2055,7 +2055,7 @@ class PyBuildExt(build_ext):
      def _decimal_ext(self):
          extra_compile_args = []
          undef_macros = []
@@ -58,5 +58,5 @@ index b443987..a1580a0 100644
              libraries = [':libmpdec.so.2']
              sources = ['_decimal/_decimal.c']
 -- 
-2.7.4
+2.9.3
 
diff --git a/package/python3/0029-Add-an-option-to-disable-the-ossaudiodev-module.patch b/package/python3/0025-Add-an-option-to-disable-the-ossaudiodev-module.patch
similarity index 85%
rename from package/python3/0029-Add-an-option-to-disable-the-ossaudiodev-module.patch
rename to package/python3/0025-Add-an-option-to-disable-the-ossaudiodev-module.patch
index ee43664..f8eeed0 100644
--- a/package/python3/0029-Add-an-option-to-disable-the-ossaudiodev-module.patch
+++ b/package/python3/0025-Add-an-option-to-disable-the-ossaudiodev-module.patch
@@ -1,4 +1,4 @@
-From ed4bf13c66a3faa186781ca8ab2978a9bc8d5f39 Mon Sep 17 00:00:00 2001
+From 48f485cfdf79452308a0c6ac24a25c31bacbcbec Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:51:58 +0100
 Subject: [PATCH] Add an option to disable the ossaudiodev module
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 3d08ab0..4e2b88e 100644
+index 71aea1d..9a61018 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2721,6 +2721,12 @@ else
+@@ -2846,6 +2846,12 @@ else
  fi
  AC_SUBST(MPDEC)
  
@@ -26,5 +26,5 @@ index 3d08ab0..4e2b88e 100644
  AC_MSG_CHECKING(for --enable-loadable-sqlite-extensions)
  AC_ARG_ENABLE(loadable-sqlite-extensions,
 -- 
-2.7.4
+2.9.3
 
diff --git a/package/python3/0030-Support-PGEN_FOR_BUILD-and-FREEZE_IMPORTLIB_FOR_BUIL.patch b/package/python3/0026-Support-PGEN_FOR_BUILD-and-FREEZE_IMPORTLIB_FOR_BUIL.patch
similarity index 71%
rename from package/python3/0030-Support-PGEN_FOR_BUILD-and-FREEZE_IMPORTLIB_FOR_BUIL.patch
rename to package/python3/0026-Support-PGEN_FOR_BUILD-and-FREEZE_IMPORTLIB_FOR_BUIL.patch
index 2b7ec05..9de7621 100644
--- a/package/python3/0030-Support-PGEN_FOR_BUILD-and-FREEZE_IMPORTLIB_FOR_BUIL.patch
+++ b/package/python3/0026-Support-PGEN_FOR_BUILD-and-FREEZE_IMPORTLIB_FOR_BUIL.patch
@@ -1,16 +1,18 @@
-From e151b6863bd8f697f17b50eda2cecef57e433c3e Mon Sep 17 00:00:00 2001
+From 0fbfab21290eeca5b908745e5fb51d2ab2a50aef Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 23 Dec 2015 13:58:00 +0100
+Date: Wed, 22 Feb 2017 17:53:40 -0800
 Subject: [PATCH] Support PGEN_FOR_BUILD and FREEZE_IMPORTLIB_FOR_BUILD
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[ Andrey Smirnov: ported to Python 3.6 ]
+Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 ---
  Makefile.pre.in | 10 ++++++++++
  configure.ac    |  3 +++
  2 files changed, 13 insertions(+)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 0c26bcf..d1237eb 100644
+index 82b01c9..7c14a4e 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
 @@ -719,10 +719,15 @@ Programs/_testembed: Programs/_testembed.o $(LIBRARY) $(LDLIBRARY) $(PY3LIBRARY)
@@ -27,11 +29,11 @@ index 0c26bcf..d1237eb 100644
 +	cp $^ $@
 +endif
  
- Python/importlib_external.h: $(srcdir)/Lib/importlib/_bootstrap_external.py Programs/_freeze_importlib
- 	if test "$(cross_compiling)" != "yes"; then \
-@@ -811,8 +816,13 @@ $(GRAMMAR_C): $(GRAMMAR_H)
- 		mv $(GRAMMAR_C).tmp $(GRAMMAR_C); \
- 	fi
+ Python/importlib_external.h: @GENERATED_COMMENT@ $(srcdir)/Lib/importlib/_bootstrap_external.py Programs/_freeze_importlib Python/marshal.c
+ 	./Programs/_freeze_importlib \
+@@ -796,8 +801,13 @@ $(GRAMMAR_H): @GENERATED_COMMENT@ $(GRAMMAR_INPUT) $(PGEN)
+ $(GRAMMAR_C): @GENERATED_COMMENT@ $(GRAMMAR_H)
+ 	touch $(GRAMMAR_C)
  
 +ifeq (@PGEN_FOR_BUILD@,)
  $(PGEN): $(PGENOBJS)
@@ -44,12 +46,12 @@ index 0c26bcf..d1237eb 100644
  Parser/grammar.o:	$(srcdir)/Parser/grammar.c \
  				$(srcdir)/Include/token.h \
 diff --git a/configure.ac b/configure.ac
-index 4e2b88e..16a827c 100644
+index 9a61018..3a12788 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -80,6 +80,9 @@ else
- fi
+@@ -91,6 +91,9 @@ fi
  AC_SUBST(PYTHON_FOR_BUILD)
+ AC_SUBST(GENERATED_COMMENT)
  
 +AC_SUBST(PGEN_FOR_BUILD)
 +AC_SUBST(FREEZE_IMPORTLIB_FOR_BUILD)
@@ -58,5 +60,5 @@ index 4e2b88e..16a827c 100644
  dnl it does, we get path names containing '//' which is both ugly and
  dnl can cause trouble.
 -- 
-2.7.4
+2.9.3
 
diff --git a/package/python3/0031-Add-an-option-to-disable-openssl-support.patch b/package/python3/0027-Add-an-option-to-disable-openssl-support.patch
similarity index 79%
rename from package/python3/0031-Add-an-option-to-disable-openssl-support.patch
rename to package/python3/0027-Add-an-option-to-disable-openssl-support.patch
index 784320b..348e511 100644
--- a/package/python3/0031-Add-an-option-to-disable-openssl-support.patch
+++ b/package/python3/0027-Add-an-option-to-disable-openssl-support.patch
@@ -1,6 +1,6 @@
-From d903da1181cedb76d8191b33aea0519844f85b22 Mon Sep 17 00:00:00 2001
+From 275db73c38e9b2135c774c475826fa077f8835c4 Mon Sep 17 00:00:00 2001
 From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
-Date: Tue, 7 Mar 2017 23:25:12 +0100
+Date: Wed, 22 Feb 2017 17:55:59 -0800
 Subject: [PATCH] Add an option to disable openssl support.
 
 Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
@@ -9,10 +9,10 @@ Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 16a827c..65c0ce0 100644
+index 3a12788..af12c09 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3027,6 +3027,12 @@ AC_ARG_ENABLE(unicodedata,
+@@ -3132,6 +3132,12 @@ AC_ARG_ENABLE(unicodedata,
      	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} unicodedata"
    	  fi])
  
@@ -26,5 +26,5 @@ index 16a827c..65c0ce0 100644
  AC_ARG_ENABLE(tk,
  	AS_HELP_STRING([--disable-tk], [disable tk]),
 -- 
-2.7.4
+2.9.3
 
diff --git a/package/python3/0032-Add-an-option-to-disable-the-readline-module.patch b/package/python3/0028-Add-an-option-to-disable-the-readline-module.patch
similarity index 83%
rename from package/python3/0032-Add-an-option-to-disable-the-readline-module.patch
rename to package/python3/0028-Add-an-option-to-disable-the-readline-module.patch
index 4d205ca..0c50451 100644
--- a/package/python3/0032-Add-an-option-to-disable-the-readline-module.patch
+++ b/package/python3/0028-Add-an-option-to-disable-the-readline-module.patch
@@ -1,4 +1,4 @@
-From c01d039d96909a6f4df6fff5f6e7ffe7e3f1e7b2 Mon Sep 17 00:00:00 2001
+From 57e9ef788c27a112b79e489b375882f66f818b0a Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Tue, 7 Mar 2017 23:29:05 +0100
 Subject: [PATCH] Add an option to disable the readline module
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 65c0ce0..c274e13 100644
+index af12c09..64dadb4 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3033,6 +3033,12 @@ AC_ARG_ENABLE(openssl,
+@@ -3138,6 +3138,12 @@ AC_ARG_ENABLE(openssl,
  	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} ssl _ssl _hashlib"
  	  fi])
  
@@ -26,5 +26,5 @@ index 65c0ce0..c274e13 100644
  AC_ARG_ENABLE(tk,
  	AS_HELP_STRING([--disable-tk], [disable tk]),
 -- 
-2.7.4
+2.9.3
 
diff --git a/package/python3/0033-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch b/package/python3/0029-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
similarity index 88%
rename from package/python3/0033-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
rename to package/python3/0029-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
index a641a96..733b8db 100644
--- a/package/python3/0033-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
+++ b/package/python3/0029-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
@@ -1,4 +1,4 @@
-From 69a5a3b7a0307476772943da70162dfe716c674f Mon Sep 17 00:00:00 2001
+From 25c72356a587dbc3a08679c6713be02a18f7e646 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Tue, 7 Mar 2017 23:31:11 +0100
 Subject: [PATCH] Add options to disable zlib, bzip2 and xz modules
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 18 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index c274e13..fac9c57 100644
+index 64dadb4..92e9abe 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3039,6 +3039,24 @@ AC_ARG_ENABLE(readline,
+@@ -3144,6 +3144,24 @@ AC_ARG_ENABLE(readline,
  	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} readline"
  	  fi])
  
@@ -38,5 +38,5 @@ index c274e13..fac9c57 100644
  AC_ARG_ENABLE(tk,
  	AS_HELP_STRING([--disable-tk], [disable tk]),
 -- 
-2.7.4
+2.9.3
 
diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index f6f70a2..694b09b 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,4 +1,5 @@
-# From https://www.python.org/downloads/release/python-352/
-md5 8906efbacfcdc7c3c9198aeefafd159e Python-3.5.2.tar.xz
+# From https://www.python.org/downloads/release/python-361/
+md5 692b4fc3a2ba0d54d1495d4ead5b0b5c Python-3.6.1.tar.xz
 # Locally computed
-sha256 0010f56100b9b74259ebcd5d4b295a32324b58b517403a10d1a2aa7cb22bca40 Python-3.5.2.tar.xz
+sha256 a01810ddfcec216bcdb357a84bfaafdfaa0ca42bbdaa4cb7ff74f5a9961e4041 Python-3.6.1.tar.xz
+
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index c8f8e1b..fc4ad32 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON3_VERSION_MAJOR = 3.5
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).2
+PYTHON3_VERSION_MAJOR = 3.6
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).1
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = http://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python software foundation license v2, others
@@ -232,7 +232,7 @@ HOST_PYTHON3_POST_INSTALL_HOOKS += HOST_PYTHON3_INSTALL_SYMLINK
 endif
 
 # Provided to other packages
-PYTHON3_PATH = $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/sysconfigdata/:$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/
+PYTHON3_PATH = $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/:$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.9.3
