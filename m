From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Apr 2019 15:51:47 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/python3: security
 bump version to 3.7.3
Message-ID: <20190424134924.8B13E814AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0012baabfc79e84396e4afab088e07a44e22b4ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Also remove upstream patch 0033.

Fixes the following security issues:

- bpo-36216: Changes urlsplit() to raise ValueError when the URL contains
  characters that decompose under IDNA encoding (NFKC-normalization) into
  characters that affect how the URL is parsed.

- bpo-35746: [CVE-2019-5010] Fix a NULL pointer deref in ssl module.  The
  cert parser did not handle CRL distribution points with empty DP or URI
  correctly.  A malicious or buggy certificate can result into segfault.
  Vulnerability (TALOS-2018-0758) reported by Colin Read and Nicolas Edet of
  Cisco.

- bpo-35121: Don???t send cookies of domain A without Domain attribute to
  domain B when domain A is a suffix match of domain B while using a
  cookiejar with http.cookiejar.DefaultCookiePolicy policy.  Patch by
  Karthikeyan Singaravelan.

For more details, see the changelog:
https://docs.python.org/3.7/whatsnew/changelog.html#python-3-7-3-final

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6afc83b60f0a1d129c2ea691e7d298303eaa9dda)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...1-Make-the-build-of-pyc-files-conditional.patch |   4 +-
 ...gy_getaddrinfo-configure-test-when-cross-.patch |   2 +-
 ...ructure-to-disable-the-build-of-certain-e.patch |  10 +-
 ...ibrary-header-paths-for-cross-compilation.patch |   2 +-
 ...n-t-look-in-usr-lib-termcap-for-libraries.patch |   2 +-
 .../python3/0006-Don-t-add-multiarch-paths.patch   |   2 +-
 .../0007-Abort-on-failed-module-build.patch        |   2 +-
 ...stem-locale-and-set-to-default-when-addin.patch |   2 +-
 ...on-to-disable-installation-of-test-module.patch |   6 +-
 .../0014-Add-an-option-to-disable-pydoc.patch      |  12 +-
 .../0015-Add-an-option-to-disable-lib2to3.patch    |  14 +--
 ...-Add-option-to-disable-the-sqlite3-module.patch |   8 +-
 ...17-Add-an-option-to-disable-the-tk-module.patch |   8 +-
 ...dd-an-option-to-disable-the-curses-module.patch |   6 +-
 .../0019-Add-an-option-to-disable-expat.patch      |   8 +-
 .../0020-Add-an-option-to-disable-CJK-codecs.patch |   2 +-
 .../0021-Add-an-option-to-disable-NIS.patch        |   2 +-
 ...0022-Add-an-option-to-disable-unicodedata.patch |   2 +-
 .../0023-Add-an-option-to-disable-IDLE.patch       |  10 +-
 .../0024-Add-an-option-to-disable-decimal.patch    |   4 +-
 ...-option-to-disable-the-ossaudiodev-module.patch |   2 +-
 ...-Add-an-option-to-disable-openssl-support.patch |   2 +-
 ...-an-option-to-disable-the-readline-module.patch |   2 +-
 ...ions-to-disable-zlib-bzip2-and-xz-modules.patch |   2 +-
 .../0030-Fix-cross-compiling-the-uuid-module.patch |   2 +-
 ...0031-Add-an-option-to-disable-uuid-module.patch |   2 +-
 ...ix-segfault-in-ssl-s-cert-parser-GH-11569.patch | 121 ---------------------
 package/python3/python3.hash                       |   6 +-
 package/python3/python3.mk                         |   2 +-
 29 files changed, 64 insertions(+), 185 deletions(-)

diff --git a/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch b/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
index 406f873aac..f6fa3d7554 100644
--- a/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
+++ b/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
@@ -18,7 +18,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index 82e830727e..b38bd79121 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1385,6 +1385,7 @@ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
+@@ -1393,6 +1393,7 @@ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
  		$(INSTALL_DATA) $(srcdir)/Modules/xxmodule.c \
  			$(DESTDIR)$(LIBDEST)/distutils/tests ; \
  	fi
@@ -26,7 +26,7 @@ index 82e830727e..b38bd79121 100644
  	-PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
  		$(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py \
  		-d $(LIBDEST) -f \
-@@ -1412,6 +1413,7 @@ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
+@@ -1420,6 +1421,7 @@ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
  		$(PYTHON_FOR_BUILD) -Wi -OO $(DESTDIR)$(LIBDEST)/compileall.py \
  		-d $(LIBDEST)/site-packages -f \
  		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
diff --git a/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch b/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
index 537e23cbfc..36b5af0338 100644
--- a/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
+++ b/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
@@ -13,7 +13,7 @@ diff --git a/configure.ac b/configure.ac
 index a76b5444df..5f87c4db5a 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3985,7 +3985,7 @@ fi
+@@ -4056,7 +4056,7 @@ fi
  
  AC_MSG_RESULT($ac_cv_buggy_getaddrinfo)
  
diff --git a/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch b/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch
index 6e07b292e4..647f3251d7 100644
--- a/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch
+++ b/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch
@@ -47,7 +47,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index b38bd79121..4ce917ab8d 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -196,6 +196,8 @@ FILEMODE=	644
+@@ -204,6 +204,8 @@ FILEMODE=	644
  # configure script arguments
  CONFIG_ARGS=	@CONFIG_ARGS@
  
@@ -56,7 +56,7 @@ index b38bd79121..4ce917ab8d 100644
  
  # Subdirectories with code
  SRCDIRS= 	@SRCDIRS@
-@@ -609,6 +611,7 @@ sharedmods: $(BUILDPYTHON) pybuilddir.txt Modules/_math.o
+@@ -617,6 +619,7 @@ sharedmods: $(BUILDPYTHON) pybuilddir.txt Modules/_math.o
  	esac; \
  	echo "$(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' \
  		_TCLTK_INCLUDES='$(TCLTK_INCLUDES)' _TCLTK_LIBS='$(TCLTK_LIBS)' \
@@ -64,7 +64,7 @@ index b38bd79121..4ce917ab8d 100644
  		$(PYTHON_FOR_BUILD) $(srcdir)/setup.py $$quiet build"; \
  	$(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' \
  		_TCLTK_INCLUDES='$(TCLTK_INCLUDES)' _TCLTK_LIBS='$(TCLTK_LIBS)' \
-@@ -1508,7 +1511,8 @@ libainstall:	@DEF_MAKE_RULE@ python-config
+@@ -1526,7 +1529,8 @@ libainstall:	@DEF_MAKE_RULE@ python-config
  # Install the dynamically loadable modules
  # This goes into $(exec_prefix)
  sharedinstall: sharedmods
@@ -78,7 +78,7 @@ diff --git a/configure.ac b/configure.ac
 index 5f87c4db5a..d5ee2aedfb 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2902,6 +2902,8 @@ LIBS="$withval $LIBS"
+@@ -2966,6 +2966,8 @@ LIBS="$withval $LIBS"
  
  PKG_PROG_PKG_CONFIG
  
@@ -91,7 +91,7 @@ diff --git a/setup.py b/setup.py
 index fe477974bd..86643ae8bf 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -43,7 +43,11 @@ host_platform = get_platform()
+@@ -48,7 +48,11 @@ host_platform = get_platform()
  COMPILED_WITH_PYDEBUG = ('--with-pydebug' in sysconfig.get_config_var("CONFIG_ARGS"))
  
  # This global variable is used to hold the list of modules to be disabled.
diff --git a/package/python3/0004-Adjust-library-header-paths-for-cross-compilation.patch b/package/python3/0004-Adjust-library-header-paths-for-cross-compilation.patch
index 649ab20585..b3a0e53289 100644
--- a/package/python3/0004-Adjust-library-header-paths-for-cross-compilation.patch
+++ b/package/python3/0004-Adjust-library-header-paths-for-cross-compilation.patch
@@ -24,7 +24,7 @@ diff --git a/Lib/distutils/command/build_ext.py b/Lib/distutils/command/build_ex
 index 74de782d8a..d0c847b365 100644
 --- a/Lib/distutils/command/build_ext.py
 +++ b/Lib/distutils/command/build_ext.py
-@@ -233,7 +233,10 @@ class build_ext(Command):
+@@ -234,7 +234,10 @@ class build_ext(Command):
          if (sysconfig.get_config_var('Py_ENABLE_SHARED')):
              if not sysconfig.python_build:
                  # building third party extensions
diff --git a/package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch b/package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch
index 1579415be7..d8c5b0faf8 100644
--- a/package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch
+++ b/package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch
@@ -12,7 +12,7 @@ diff --git a/setup.py b/setup.py
 index 86643ae8bf..cd00fbdbda 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -850,12 +850,9 @@ class PyBuildExt(build_ext):
+@@ -855,12 +855,9 @@ class PyBuildExt(build_ext):
                  pass # Issue 7384: Already linked against curses or tinfo.
              elif curses_library:
                  readline_libs.append(curses_library)
diff --git a/package/python3/0006-Don-t-add-multiarch-paths.patch b/package/python3/0006-Don-t-add-multiarch-paths.patch
index 71c064ad9c..e55640d413 100644
--- a/package/python3/0006-Don-t-add-multiarch-paths.patch
+++ b/package/python3/0006-Don-t-add-multiarch-paths.patch
@@ -20,7 +20,7 @@ diff --git a/setup.py b/setup.py
 index cd00fbdbda..c956fa08d1 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -547,10 +547,10 @@ class PyBuildExt(build_ext):
+@@ -552,10 +552,10 @@ class PyBuildExt(build_ext):
          if not cross_compiling:
              add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
              add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
diff --git a/package/python3/0007-Abort-on-failed-module-build.patch b/package/python3/0007-Abort-on-failed-module-build.patch
index f95889df68..a7071e199d 100644
--- a/package/python3/0007-Abort-on-failed-module-build.patch
+++ b/package/python3/0007-Abort-on-failed-module-build.patch
@@ -17,7 +17,7 @@ diff --git a/setup.py b/setup.py
 index c956fa08d1..b3add2be76 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -358,6 +358,7 @@ class PyBuildExt(build_ext):
+@@ -363,6 +363,7 @@ class PyBuildExt(build_ext):
              print("Failed to build these modules:")
              print_three_column(failed)
              print()
diff --git a/package/python3/0011-Override-system-locale-and-set-to-default-when-addin.patch b/package/python3/0011-Override-system-locale-and-set-to-default-when-addin.patch
index c5b301d434..5c645201ee 100644
--- a/package/python3/0011-Override-system-locale-and-set-to-default-when-addin.patch
+++ b/package/python3/0011-Override-system-locale-and-set-to-default-when-addin.patch
@@ -23,7 +23,7 @@ diff --git a/setup.py b/setup.py
 index b3add2be76..29bfd174d2 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -514,7 +514,7 @@ class PyBuildExt(build_ext):
+@@ -519,7 +519,7 @@ class PyBuildExt(build_ext):
          tmpfile = os.path.join(self.build_temp, 'gccpaths')
          if not os.path.exists(self.build_temp):
              os.makedirs(self.build_temp)
diff --git a/package/python3/0013-Add-an-option-to-disable-installation-of-test-module.patch b/package/python3/0013-Add-an-option-to-disable-installation-of-test-module.patch
index 35aa73c36f..8180880e1c 100644
--- a/package/python3/0013-Add-an-option-to-disable-installation-of-test-module.patch
+++ b/package/python3/0013-Add-an-option-to-disable-installation-of-test-module.patch
@@ -19,7 +19,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index 4ce917ab8d..4110fff4ac 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1251,8 +1251,28 @@ maninstall:	altmaninstall
+@@ -1259,8 +1259,28 @@ maninstall:	altmaninstall
  
  # Install the library
  XMLLIBSUBDIRS=  xml xml/dom xml/etree xml/parsers xml/sax
@@ -54,7 +54,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index 1ff2362..194dbfc 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1326,26 +1326,24 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
+@@ -1334,26 +1334,24 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
  		test/test_importlib/source \
  		test/test_importlib/zipdata01 \
  		test/test_importlib/zipdata02 \
@@ -99,7 +99,7 @@ diff --git a/configure.ac b/configure.ac
 index d5ee2aedfb..f924937fe1 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3162,6 +3162,11 @@ if test "$posix_threads" = "yes"; then
+@@ -3226,6 +3226,11 @@ if test "$posix_threads" = "yes"; then
        AC_CHECK_FUNCS(pthread_getcpuclockid)
  fi
  
diff --git a/package/python3/0014-Add-an-option-to-disable-pydoc.patch b/package/python3/0014-Add-an-option-to-disable-pydoc.patch
index 8055009d6c..6f6e265c75 100644
--- a/package/python3/0014-Add-an-option-to-disable-pydoc.patch
+++ b/package/python3/0014-Add-an-option-to-disable-pydoc.patch
@@ -20,7 +20,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index 4110fff4ac..badb2af35d 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1221,7 +1221,9 @@ bininstall: altbininstall
+@@ -1229,7 +1229,9 @@ bininstall: altbininstall
  	-rm -f $(DESTDIR)$(BINDIR)/idle3
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s idle$(VERSION) idle3)
  	-rm -f $(DESTDIR)$(BINDIR)/pydoc3
@@ -30,7 +30,7 @@ index 4110fff4ac..badb2af35d 100644
  	-rm -f $(DESTDIR)$(BINDIR)/2to3
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s 2to3-$(VERSION) 2to3)
  	-rm -f $(DESTDIR)$(BINDIR)/pyvenv
-@@ -1269,7 +1271,7 @@ LIBSUBDIRS=	tkinter site-packages \
+@@ -1277,7 +1279,7 @@ LIBSUBDIRS=	tkinter site-packages \
  		multiprocessing multiprocessing/dummy \
  		unittest \
  		venv venv/scripts venv/scripts/common venv/scripts/posix \
@@ -39,7 +39,7 @@ index 4110fff4ac..badb2af35d 100644
  
  TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
  		tkinter/test/test_ttk test \
-@@ -1344,6 +1346,10 @@ ifeq (@TEST_MODULES@,yes)
+@@ -1352,6 +1354,10 @@ ifeq (@TEST_MODULES@,yes)
  LIBSUBDIRS += $(TESTSUBDIRS)
  endif
  
@@ -54,7 +54,7 @@ diff --git a/configure.ac b/configure.ac
 index f924937fe1..1621fa1611 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3162,6 +3162,12 @@ if test "$posix_threads" = "yes"; then
+@@ -3226,6 +3226,12 @@ if test "$posix_threads" = "yes"; then
        AC_CHECK_FUNCS(pthread_getcpuclockid)
  fi
  
@@ -71,7 +71,7 @@ diff --git a/setup.py b/setup.py
 index 29bfd174d2..94dd337fef 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -2332,6 +2332,12 @@ def main():
+@@ -2337,6 +2337,12 @@ def main():
      # turn off warnings when deprecated modules are imported
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
@@ -84,7 +84,7 @@ index 29bfd174d2..94dd337fef 100644
      setup(# PyPI Metadata (PEP 301)
            name = "Python",
            version = sys.version.split()[0],
-@@ -2356,8 +2362,7 @@ def main():
+@@ -2361,8 +2367,7 @@ def main():
            # If you change the scripts installed here, you also need to
            # check the PyBuildScripts command above, and change the links
            # created by the bininstall target in Makefile.pre.in
diff --git a/package/python3/0015-Add-an-option-to-disable-lib2to3.patch b/package/python3/0015-Add-an-option-to-disable-lib2to3.patch
index 3d3c5de3bf..d2ce91775b 100644
--- a/package/python3/0015-Add-an-option-to-disable-lib2to3.patch
+++ b/package/python3/0015-Add-an-option-to-disable-lib2to3.patch
@@ -20,7 +20,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index badb2af35d..931cc3ed07 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1225,7 +1225,9 @@ ifeq (@PYDOC@,yes)
+@@ -1233,7 +1233,9 @@ ifeq (@PYDOC@,yes)
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s pydoc$(VERSION) pydoc3)
  endif
  	-rm -f $(DESTDIR)$(BINDIR)/2to3
@@ -30,7 +30,7 @@ index badb2af35d..931cc3ed07 100644
  	-rm -f $(DESTDIR)$(BINDIR)/pyvenv
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s pyvenv-$(VERSION) pyvenv)
  	if test "x$(LIPO_32BIT_FLAGS)" != "x" ; then \
-@@ -1262,7 +1264,6 @@ LIBSUBDIRS=	tkinter site-packages \
+@@ -1270,7 +1272,6 @@ LIBSUBDIRS=	tkinter site-packages \
  		html json http dbm xmlrpc \
  		sqlite3 \
  		logging csv wsgiref urllib \
@@ -38,7 +38,7 @@ index badb2af35d..931cc3ed07 100644
  		ctypes ctypes/macholib \
  		idlelib idlelib/Icons \
  		distutils distutils/command $(XMLLIBSUBDIRS) \
-@@ -1332,9 +1333,6 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
+@@ -1340,9 +1341,6 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
  		test/test_email test/test_email/data \
  		test/test_json \
  		sqlite3/test \
@@ -48,7 +48,7 @@ index badb2af35d..931cc3ed07 100644
  		ctypes/test \
  		idlelib/idle_test \
  		distutils/tests \
-@@ -1342,6 +1340,14 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
+@@ -1350,6 +1348,14 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
  		test/test_tools test/test_warnings test/test_warnings/data \
  		unittest/test unittest/test/testmock
  
@@ -63,7 +63,7 @@ index badb2af35d..931cc3ed07 100644
  ifeq (@TEST_MODULES@,yes)
  LIBSUBDIRS += $(TESTSUBDIRS)
  endif
-@@ -1441,10 +1447,12 @@ ifeq (@PYC_BUILD@,yes)
+@@ -1449,10 +1455,12 @@ ifeq (@PYC_BUILD@,yes)
  		-d $(LIBDEST)/site-packages -f \
  		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
  endif
@@ -80,7 +80,7 @@ diff --git a/configure.ac b/configure.ac
 index 1621fa1611..13b2edf8b7 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3174,6 +3174,12 @@ AC_ARG_ENABLE(test-modules,
+@@ -3238,6 +3238,12 @@ AC_ARG_ENABLE(test-modules,
  	AS_HELP_STRING([--disable-test-modules], [disable test modules]),
  	[ TEST_MODULES="${enableval}" ], [ TEST_MODULES=yes ])
  
@@ -97,7 +97,7 @@ diff --git a/setup.py b/setup.py
 index 94dd337fef..76429e1326 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -2333,10 +2333,11 @@ def main():
+@@ -2338,10 +2338,11 @@ def main():
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
  
diff --git a/package/python3/0016-Add-option-to-disable-the-sqlite3-module.patch b/package/python3/0016-Add-option-to-disable-the-sqlite3-module.patch
index e5192cc477..134a7ef8b8 100644
--- a/package/python3/0016-Add-option-to-disable-the-sqlite3-module.patch
+++ b/package/python3/0016-Add-option-to-disable-the-sqlite3-module.patch
@@ -16,7 +16,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index 931cc3ed07..a1ce0712cd 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1262,7 +1262,6 @@ LIBSUBDIRS=	tkinter site-packages \
+@@ -1270,7 +1270,6 @@ LIBSUBDIRS=	tkinter site-packages \
  		email email/mime \
  		ensurepip ensurepip/_bundled \
  		html json http dbm xmlrpc \
@@ -24,7 +24,7 @@ index 931cc3ed07..a1ce0712cd 100644
  		logging csv wsgiref urllib \
  		ctypes ctypes/macholib \
  		idlelib idlelib/Icons \
-@@ -1332,7 +1331,6 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
+@@ -1340,7 +1339,6 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
  		test/test_asyncio \
  		test/test_email test/test_email/data \
  		test/test_json \
@@ -32,7 +32,7 @@ index 931cc3ed07..a1ce0712cd 100644
  		ctypes/test \
  		idlelib/idle_test \
  		distutils/tests \
-@@ -1348,6 +1346,11 @@ TESTSUBDIRS += lib2to3/tests			\
+@@ -1356,6 +1354,11 @@ TESTSUBDIRS += lib2to3/tests			\
  	lib2to3/tests/data/fixers/myfixes
  endif
  
@@ -48,7 +48,7 @@ diff --git a/configure.ac b/configure.ac
 index 13b2edf8b7..d7582cfea4 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3162,6 +3162,15 @@ if test "$posix_threads" = "yes"; then
+@@ -3226,6 +3226,15 @@ if test "$posix_threads" = "yes"; then
        AC_CHECK_FUNCS(pthread_getcpuclockid)
  fi
  
diff --git a/package/python3/0017-Add-an-option-to-disable-the-tk-module.patch b/package/python3/0017-Add-an-option-to-disable-the-tk-module.patch
index 96918f022d..57d45a22f8 100644
--- a/package/python3/0017-Add-an-option-to-disable-the-tk-module.patch
+++ b/package/python3/0017-Add-an-option-to-disable-the-tk-module.patch
@@ -16,7 +16,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index a1ce0712cd..dc1e917cc3 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1256,7 +1256,7 @@ maninstall:	altmaninstall
+@@ -1264,7 +1264,7 @@ maninstall:	altmaninstall
  # Install the library
  XMLLIBSUBDIRS=  xml xml/dom xml/etree xml/parsers xml/sax
  
@@ -25,7 +25,7 @@ index a1ce0712cd..dc1e917cc3 100644
  		asyncio \
  		collections concurrent concurrent/futures encodings \
  		email email/mime \
-@@ -1273,8 +1273,7 @@ LIBSUBDIRS=	tkinter site-packages \
+@@ -1281,8 +1281,7 @@ LIBSUBDIRS=	tkinter site-packages \
  		venv venv/scripts venv/scripts/common venv/scripts/posix \
  		curses
  
@@ -35,7 +35,7 @@ index a1ce0712cd..dc1e917cc3 100644
  		test/audiodata \
  		test/capath test/data \
  		test/cjkencodings test/decimaltestdata test/xmltestdata \
-@@ -1338,6 +1337,12 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
+@@ -1346,6 +1345,12 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
  		test/test_tools test/test_warnings test/test_warnings/data \
  		unittest/test unittest/test/testmock
  
@@ -52,7 +52,7 @@ diff --git a/configure.ac b/configure.ac
 index d7582cfea4..6a56a5b0c1 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3171,6 +3171,15 @@ if test "$SQLITE3" = "no" ; then
+@@ -3235,6 +3235,15 @@ if test "$SQLITE3" = "no" ; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
  fi
  
diff --git a/package/python3/0018-Add-an-option-to-disable-the-curses-module.patch b/package/python3/0018-Add-an-option-to-disable-the-curses-module.patch
index 8205d2fe9d..767ded5a77 100644
--- a/package/python3/0018-Add-an-option-to-disable-the-curses-module.patch
+++ b/package/python3/0018-Add-an-option-to-disable-the-curses-module.patch
@@ -16,7 +16,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index dc1e917cc3..6a6bc082cd 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1270,8 +1270,7 @@ LIBSUBDIRS=	site-packages \
+@@ -1278,8 +1278,7 @@ LIBSUBDIRS=	site-packages \
  		turtledemo \
  		multiprocessing multiprocessing/dummy \
  		unittest \
@@ -26,7 +26,7 @@ index dc1e917cc3..6a6bc082cd 100644
  
  TESTSUBDIRS=	test \
  		test/audiodata \
-@@ -1343,6 +1342,10 @@ TESTSUBDIRS += tkinter/test tkinter/test/test_tkinter \
+@@ -1351,6 +1350,10 @@ TESTSUBDIRS += tkinter/test tkinter/test/test_tkinter \
  	tkinter/test/test_ttk
  endif
  
@@ -41,7 +41,7 @@ diff --git a/configure.ac b/configure.ac
 index 6a56a5b0c1..5896b39ff9 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3180,6 +3180,15 @@ if test "$TK" = "no"; then
+@@ -3244,6 +3244,15 @@ if test "$TK" = "no"; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _tkinter"
  fi
  
diff --git a/package/python3/0019-Add-an-option-to-disable-expat.patch b/package/python3/0019-Add-an-option-to-disable-expat.patch
index 6057a7f713..6667eaf61d 100644
--- a/package/python3/0019-Add-an-option-to-disable-expat.patch
+++ b/package/python3/0019-Add-an-option-to-disable-expat.patch
@@ -23,7 +23,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index 6a6bc082cd..dc4b92b6fe 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1265,7 +1265,7 @@ LIBSUBDIRS=	site-packages \
+@@ -1273,7 +1273,7 @@ LIBSUBDIRS=	site-packages \
  		logging csv wsgiref urllib \
  		ctypes ctypes/macholib \
  		idlelib idlelib/Icons \
@@ -32,7 +32,7 @@ index 6a6bc082cd..dc4b92b6fe 100644
  		importlib \
  		turtledemo \
  		multiprocessing multiprocessing/dummy \
-@@ -1346,6 +1346,10 @@ ifeq (@CURSES@,yes)
+@@ -1354,6 +1354,10 @@ ifeq (@CURSES@,yes)
  LIBSUBDIRS += curses
  endif
  
@@ -47,7 +47,7 @@ diff --git a/configure.ac b/configure.ac
 index 5896b39ff9..6f21482207 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2905,13 +2905,21 @@ PKG_PROG_PKG_CONFIG
+@@ -2969,13 +2969,21 @@ PKG_PROG_PKG_CONFIG
  AC_SUBST(DISABLED_EXTENSIONS)
  
  # Check for use of the system expat library
@@ -78,7 +78,7 @@ diff --git a/setup.py b/setup.py
 index 76429e1326..38aa5e605e 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -1485,7 +1485,7 @@ class PyBuildExt(build_ext):
+@@ -1490,7 +1490,7 @@ class PyBuildExt(build_ext):
          #
          # More information on Expat can be found at www.libexpat.org.
          #
diff --git a/package/python3/0020-Add-an-option-to-disable-CJK-codecs.patch b/package/python3/0020-Add-an-option-to-disable-CJK-codecs.patch
index 096278ca49..ee81e0bcfa 100644
--- a/package/python3/0020-Add-an-option-to-disable-CJK-codecs.patch
+++ b/package/python3/0020-Add-an-option-to-disable-CJK-codecs.patch
@@ -12,7 +12,7 @@ diff --git a/configure.ac b/configure.ac
 index 6f21482207..c7742faf41 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3179,6 +3179,12 @@ if test "$SQLITE3" = "no" ; then
+@@ -3243,6 +3243,12 @@ if test "$SQLITE3" = "no" ; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
  fi
  
diff --git a/package/python3/0021-Add-an-option-to-disable-NIS.patch b/package/python3/0021-Add-an-option-to-disable-NIS.patch
index ecddd46ec6..d38f858be8 100644
--- a/package/python3/0021-Add-an-option-to-disable-NIS.patch
+++ b/package/python3/0021-Add-an-option-to-disable-NIS.patch
@@ -15,7 +15,7 @@ diff --git a/configure.ac b/configure.ac
 index c7742faf41..42a871bb09 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3185,6 +3185,12 @@ AC_ARG_ENABLE(codecs-cjk,
+@@ -3249,6 +3249,12 @@ AC_ARG_ENABLE(codecs-cjk,
  		DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _codecs_kr _codecs_jp _codecs_cn _codecs_tw _codecs_hk _codecs_iso2022"
  	fi])
  
diff --git a/package/python3/0022-Add-an-option-to-disable-unicodedata.patch b/package/python3/0022-Add-an-option-to-disable-unicodedata.patch
index 8d2469215f..17e9861e0f 100644
--- a/package/python3/0022-Add-an-option-to-disable-unicodedata.patch
+++ b/package/python3/0022-Add-an-option-to-disable-unicodedata.patch
@@ -12,7 +12,7 @@ diff --git a/configure.ac b/configure.ac
 index 42a871bb09..1d610e132b 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3191,6 +3191,12 @@ AC_ARG_ENABLE(nis,
+@@ -3255,6 +3255,12 @@ AC_ARG_ENABLE(nis,
      	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} nis"
    	  fi])
  
diff --git a/package/python3/0023-Add-an-option-to-disable-IDLE.patch b/package/python3/0023-Add-an-option-to-disable-IDLE.patch
index 068ff2c1f3..98607c5e1c 100644
--- a/package/python3/0023-Add-an-option-to-disable-IDLE.patch
+++ b/package/python3/0023-Add-an-option-to-disable-IDLE.patch
@@ -19,7 +19,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index dc4b92b6fe..3e43066d90 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1219,7 +1219,9 @@ bininstall: altbininstall
+@@ -1227,7 +1227,9 @@ bininstall: altbininstall
  	-rm -f $(DESTDIR)$(LIBPC)/python3.pc
  	(cd $(DESTDIR)$(LIBPC); $(LN) -s python-$(VERSION).pc python3.pc)
  	-rm -f $(DESTDIR)$(BINDIR)/idle3
@@ -29,7 +29,7 @@ index dc4b92b6fe..3e43066d90 100644
  	-rm -f $(DESTDIR)$(BINDIR)/pydoc3
  ifeq (@PYDOC@,yes)
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s pydoc$(VERSION) pydoc3)
-@@ -1264,7 +1266,6 @@ LIBSUBDIRS=	site-packages \
+@@ -1272,7 +1274,6 @@ LIBSUBDIRS=	site-packages \
  		html json http dbm xmlrpc \
  		logging csv wsgiref urllib \
  		ctypes ctypes/macholib \
@@ -37,7 +37,7 @@ index dc4b92b6fe..3e43066d90 100644
  		distutils distutils/command \
  		importlib \
  		turtledemo \
-@@ -1350,6 +1351,10 @@ ifeq (@EXPAT@,yes)
+@@ -1358,6 +1359,10 @@ ifeq (@EXPAT@,yes)
  LIBSUBDIRS += $(XMLLIBSUBDIRS)
  endif
  
@@ -52,7 +52,7 @@ diff --git a/configure.ac b/configure.ac
 index 1d610e132b..2699e7ceb1 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3233,6 +3233,12 @@ AC_ARG_ENABLE(lib2to3,
+@@ -3297,6 +3297,12 @@ AC_ARG_ENABLE(lib2to3,
  	AS_HELP_STRING([--disable-lib2to3], [disable lib2to3]),
  	[ LIB2TO3="${enableval}" ], [ LIB2TO3=yes ])
  
@@ -69,7 +69,7 @@ diff --git a/setup.py b/setup.py
 index 38aa5e605e..d642825c1e 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -2333,11 +2333,13 @@ def main():
+@@ -2338,11 +2338,13 @@ def main():
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
  
diff --git a/package/python3/0024-Add-an-option-to-disable-decimal.patch b/package/python3/0024-Add-an-option-to-disable-decimal.patch
index 3dcaac9687..31ffbc6b38 100644
--- a/package/python3/0024-Add-an-option-to-disable-decimal.patch
+++ b/package/python3/0024-Add-an-option-to-disable-decimal.patch
@@ -20,7 +20,7 @@ diff --git a/configure.ac b/configure.ac
 index 2699e7ceb1..e2c3b6f25c 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2956,13 +2956,20 @@ fi
+@@ -3020,13 +3020,20 @@ fi
  AC_SUBST(LIBFFI_INCLUDEDIR)
  
  # Check for use of the system libmpdec library
@@ -50,7 +50,7 @@ diff --git a/setup.py b/setup.py
 index d642825c1e..5b98255857 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -2010,7 +2010,7 @@ class PyBuildExt(build_ext):
+@@ -2015,7 +2015,7 @@ class PyBuildExt(build_ext):
      def _decimal_ext(self):
          extra_compile_args = []
          undef_macros = []
diff --git a/package/python3/0025-Add-an-option-to-disable-the-ossaudiodev-module.patch b/package/python3/0025-Add-an-option-to-disable-the-ossaudiodev-module.patch
index 83e1e3491a..b7b195a15f 100644
--- a/package/python3/0025-Add-an-option-to-disable-the-ossaudiodev-module.patch
+++ b/package/python3/0025-Add-an-option-to-disable-the-ossaudiodev-module.patch
@@ -12,7 +12,7 @@ diff --git a/configure.ac b/configure.ac
 index e2c3b6f25c..8e3dded25e 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2971,6 +2971,12 @@ else
+@@ -3035,6 +3035,12 @@ else
  fi
  AC_SUBST(MPDEC)
  
diff --git a/package/python3/0026-Add-an-option-to-disable-openssl-support.patch b/package/python3/0026-Add-an-option-to-disable-openssl-support.patch
index ad4da1adaa..2d569e92dc 100644
--- a/package/python3/0026-Add-an-option-to-disable-openssl-support.patch
+++ b/package/python3/0026-Add-an-option-to-disable-openssl-support.patch
@@ -12,7 +12,7 @@ diff --git a/configure.ac b/configure.ac
 index 8e3dded25e..28bcdabd67 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3210,6 +3210,12 @@ AC_ARG_ENABLE(unicodedata,
+@@ -3274,6 +3274,12 @@ AC_ARG_ENABLE(unicodedata,
      	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} unicodedata"
    	  fi])
  
diff --git a/package/python3/0027-Add-an-option-to-disable-the-readline-module.patch b/package/python3/0027-Add-an-option-to-disable-the-readline-module.patch
index ec399a8d3c..1a28dd8274 100644
--- a/package/python3/0027-Add-an-option-to-disable-the-readline-module.patch
+++ b/package/python3/0027-Add-an-option-to-disable-the-readline-module.patch
@@ -12,7 +12,7 @@ diff --git a/configure.ac b/configure.ac
 index 28bcdabd67..484f6ebaca 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3216,6 +3216,12 @@ AC_ARG_ENABLE(openssl,
+@@ -3280,6 +3280,12 @@ AC_ARG_ENABLE(openssl,
  	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} ssl _ssl _hashlib"
  	  fi])
  
diff --git a/package/python3/0028-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch b/package/python3/0028-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
index 7753acf726..4bf60fd6c7 100644
--- a/package/python3/0028-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
+++ b/package/python3/0028-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
@@ -12,7 +12,7 @@ diff --git a/configure.ac b/configure.ac
 index 484f6ebaca..79538df0cf 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3222,6 +3222,24 @@ AC_ARG_ENABLE(readline,
+@@ -3286,6 +3286,24 @@ AC_ARG_ENABLE(readline,
  	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} readline"
  	  fi])
  
diff --git a/package/python3/0030-Fix-cross-compiling-the-uuid-module.patch b/package/python3/0030-Fix-cross-compiling-the-uuid-module.patch
index 93df02f6a2..8b4dca912c 100644
--- a/package/python3/0030-Fix-cross-compiling-the-uuid-module.patch
+++ b/package/python3/0030-Fix-cross-compiling-the-uuid-module.patch
@@ -23,7 +23,7 @@ diff --git a/setup.py b/setup.py
 index 1a7085c5c4..f33d0b57b8 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -1627,7 +1627,8 @@ class PyBuildExt(build_ext):
+@@ -1632,7 +1632,8 @@ class PyBuildExt(build_ext):
              missing.append('_tkinter')
  
          # Build the _uuid module if possible
diff --git a/package/python3/0031-Add-an-option-to-disable-uuid-module.patch b/package/python3/0031-Add-an-option-to-disable-uuid-module.patch
index c429c59a39..1c674b5446 100644
--- a/package/python3/0031-Add-an-option-to-disable-uuid-module.patch
+++ b/package/python3/0031-Add-an-option-to-disable-uuid-module.patch
@@ -12,7 +12,7 @@ diff --git a/configure.ac b/configure.ac
 index b022460e73..505b7c9be0 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3258,6 +3258,15 @@ if test "$CURSES" = "no"; then
+@@ -3322,6 +3322,15 @@ if test "$CURSES" = "no"; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _curses _curses_panel"
  fi
  
diff --git a/package/python3/0033-bpo-35746-Fix-segfault-in-ssl-s-cert-parser-GH-11569.patch b/package/python3/0033-bpo-35746-Fix-segfault-in-ssl-s-cert-parser-GH-11569.patch
deleted file mode 100644
index c29ab7efaa..0000000000
--- a/package/python3/0033-bpo-35746-Fix-segfault-in-ssl-s-cert-parser-GH-11569.patch
+++ /dev/null
@@ -1,121 +0,0 @@
-From be5de958e9052e322b0087c6dba81cdad0c3e031 Mon Sep 17 00:00:00 2001
-From: "Miss Islington (bot)"
- <31488909+miss-islington@users.noreply.github.com>
-Date: Tue, 15 Jan 2019 15:03:36 -0800
-Subject: [PATCH] bpo-35746: Fix segfault in ssl's cert parser (GH-11569)
-
-Fix a NULL pointer deref in ssl module. The cert parser did not handle CRL
-distribution points with empty DP or URI correctly. A malicious or buggy
-certificate can result into segfault.
-
-Signed-off-by: Christian Heimes <christian@python.org>
-
-https://bugs.python.org/issue35746
-(cherry picked from commit a37f52436f9aa4b9292878b72f3ff1480e2606c3)
-
-Co-authored-by: Christian Heimes <christian@python.org>
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- Lib/test/talos-2019-0758.pem                       | 22 ++++++++++++++++++++++
- Lib/test/test_ssl.py                               | 22 ++++++++++++++++++++++
- .../2019-01-15-18-16-05.bpo-35746.nMSd0j.rst       |  3 +++
- Modules/_ssl.c                                     |  4 ++++
- 4 files changed, 51 insertions(+)
- create mode 100644 Lib/test/talos-2019-0758.pem
- create mode 100644 Misc/NEWS.d/next/Security/2019-01-15-18-16-05.bpo-35746.nMSd0j.rst
-
-diff --git a/Lib/test/talos-2019-0758.pem b/Lib/test/talos-2019-0758.pem
-new file mode 100644
-index 0000000000..13b95a77fd
---- /dev/null
-+++ b/Lib/test/talos-2019-0758.pem
-@@ -0,0 +1,22 @@
-+-----BEGIN CERTIFICATE-----
-+MIIDqDCCApKgAwIBAgIBAjALBgkqhkiG9w0BAQswHzELMAkGA1UEBhMCVUsxEDAO
-+BgNVBAMTB2NvZHktY2EwHhcNMTgwNjE4MTgwMDU4WhcNMjgwNjE0MTgwMDU4WjA7
-+MQswCQYDVQQGEwJVSzEsMCoGA1UEAxMjY29kZW5vbWljb24tdm0tMi50ZXN0Lmxh
-+bC5jaXNjby5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC63fGB
-+J80A9Av1GB0bptslKRIUtJm8EeEu34HkDWbL6AJY0P8WfDtlXjlPaLqFa6sqH6ES
-+V48prSm1ZUbDSVL8R6BYVYpOlK8/48xk4pGTgRzv69gf5SGtQLwHy8UPBKgjSZoD
-+5a5k5wJXGswhKFFNqyyxqCvWmMnJWxXTt2XDCiWc4g4YAWi4O4+6SeeHVAV9rV7C
-+1wxqjzKovVe2uZOHjKEzJbbIU6JBPb6TRfMdRdYOw98n1VXDcKVgdX2DuuqjCzHP
-+WhU4Tw050M9NaK3eXp4Mh69VuiKoBGOLSOcS8reqHIU46Reg0hqeL8LIL6OhFHIF
-+j7HR6V1X6F+BfRS/AgMBAAGjgdYwgdMwCQYDVR0TBAIwADAdBgNVHQ4EFgQUOktp
-+HQjxDXXUg8prleY9jeLKeQ4wTwYDVR0jBEgwRoAUx6zgPygZ0ZErF9sPC4+5e2Io
-+UU+hI6QhMB8xCzAJBgNVBAYTAlVLMRAwDgYDVQQDEwdjb2R5LWNhggkA1QEAuwb7
-+2s0wCQYDVR0SBAIwADAuBgNVHREEJzAlgiNjb2Rlbm9taWNvbi12bS0yLnRlc3Qu
-+bGFsLmNpc2NvLmNvbTAOBgNVHQ8BAf8EBAMCBaAwCwYDVR0fBAQwAjAAMAsGCSqG
-+SIb3DQEBCwOCAQEAvqantx2yBlM11RoFiCfi+AfSblXPdrIrHvccepV4pYc/yO6p
-+t1f2dxHQb8rWH3i6cWag/EgIZx+HJQvo0rgPY1BFJsX1WnYf1/znZpkUBGbVmlJr
-+t/dW1gSkNS6sPsM0Q+7HPgEv8CPDNK5eo7vU2seE0iWOkxSyVUuiCEY9ZVGaLVit
-+p0C78nZ35Pdv4I+1cosmHl28+es1WI22rrnmdBpH8J1eY6WvUw2xuZHLeNVN0TzV
-+Q3qq53AaCWuLOD1AjESWuUCxMZTK9DPS4JKXTK8RLyDeqOvJGjsSWp3kL0y3GaQ+
-+10T1rfkKJub2+m9A9duin1fn6tHc2wSvB7m3DA==
-+-----END CERTIFICATE-----
-diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.py
-index f1b9565c8d..b6794ce3a8 100644
---- a/Lib/test/test_ssl.py
-+++ b/Lib/test/test_ssl.py
-@@ -116,6 +116,7 @@ NONEXISTINGCERT = data_file("XXXnonexisting.pem")
- BADKEY = data_file("badkey.pem")
- NOKIACERT = data_file("nokia.pem")
- NULLBYTECERT = data_file("nullbytecert.pem")
-+TALOS_INVALID_CRLDP = data_file("talos-2019-0758.pem")
- 
- DHFILE = data_file("ffdh3072.pem")
- BYTES_DHFILE = os.fsencode(DHFILE)
-@@ -365,6 +366,27 @@ class BasicSocketTests(unittest.TestCase):
-         self.assertEqual(p['crlDistributionPoints'],
-                          ('http://SVRIntl-G3-crl.verisign.com/SVRIntlG3.crl',))
- 
-+    def test_parse_cert_CVE_2019_5010(self):
-+        p = ssl._ssl._test_decode_cert(TALOS_INVALID_CRLDP)
-+        if support.verbose:
-+            sys.stdout.write("\n" + pprint.pformat(p) + "\n")
-+        self.assertEqual(
-+            p,
-+            {
-+                'issuer': (
-+                    (('countryName', 'UK'),), (('commonName', 'cody-ca'),)),
-+                'notAfter': 'Jun 14 18:00:58 2028 GMT',
-+                'notBefore': 'Jun 18 18:00:58 2018 GMT',
-+                'serialNumber': '02',
-+                'subject': ((('countryName', 'UK'),),
-+                            (('commonName',
-+                              'codenomicon-vm-2.test.lal.cisco.com'),)),
-+                'subjectAltName': (
-+                    ('DNS', 'codenomicon-vm-2.test.lal.cisco.com'),),
-+                'version': 3
-+            }
-+        )
-+
-     def test_parse_cert_CVE_2013_4238(self):
-         p = ssl._ssl._test_decode_cert(NULLBYTECERT)
-         if support.verbose:
-diff --git a/Misc/NEWS.d/next/Security/2019-01-15-18-16-05.bpo-35746.nMSd0j.rst b/Misc/NEWS.d/next/Security/2019-01-15-18-16-05.bpo-35746.nMSd0j.rst
-new file mode 100644
-index 0000000000..dffe347eec
---- /dev/null
-+++ b/Misc/NEWS.d/next/Security/2019-01-15-18-16-05.bpo-35746.nMSd0j.rst
-@@ -0,0 +1,3 @@
-+[CVE-2019-5010] Fix a NULL pointer deref in ssl module. The cert parser did
-+not handle CRL distribution points with empty DP or URI correctly. A
-+malicious or buggy certificate can result into segfault.
-diff --git a/Modules/_ssl.c b/Modules/_ssl.c
-index 9894ad821d..9baec8a9bc 100644
---- a/Modules/_ssl.c
-+++ b/Modules/_ssl.c
-@@ -1516,6 +1516,10 @@ _get_crl_dp(X509 *certificate) {
-         STACK_OF(GENERAL_NAME) *gns;
- 
-         dp = sk_DIST_POINT_value(dps, i);
-+        if (dp->distpoint == NULL) {
-+            /* Ignore empty DP value, CVE-2019-5010 */
-+            continue;
-+        }
-         gns = dp->distpoint->name.fullname;
- 
-         for (j=0; j < sk_GENERAL_NAME_num(gns); j++) {
--- 
-2.11.0
-
diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 5a525130db..9a7904c1d5 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,5 @@
-# From https://www.python.org/downloads/release/python-372/
-md5		df6ec36011808205beda239c72f947cb Python-3.7.2.tar.xz
+# From https://www.python.org/downloads/release/python-373/
+md5		93df27aec0cd18d6d42173e601ffbbfd Python-3.7.3.tar.xz
 # Locally computed
-sha256 d83fe8ce51b1bb48bbcf0550fd265b9a75cdfdfa93f916f9e700aef8444bf1bb Python-3.7.2.tar.xz
+sha256 da60b54064d4cfcd9c26576f6df2690e62085123826cff2e667e72a91952d318 Python-3.7.3.tar.xz
 sha256 b9a6d9320b8f2693e8d41e496ce56caadacaddcca9be2a64a61749278f425cf2 LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index ef2c4857d8..2211cfed81 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.7
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).2
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).3
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
