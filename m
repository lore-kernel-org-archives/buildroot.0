From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 Oct 2020 19:36:43 +0200
Subject: [Buildroot] [git commit] package/python3: bump to version 3.9.0
Message-ID: <20201014172557.69B508F6E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f26ce577605e843ebf0f5583242ee9ff3cd08ac3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Minimal rebase of patches on 3.9.0.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...stem-locale-and-set-to-default-when-addin.patch | 14 ++++++-----
 ...on-to-disable-installation-of-test-module.patch | 29 +++++++++++++---------
 .../0014-Add-an-option-to-disable-pydoc.patch      | 28 ++++++++++-----------
 ...dd-an-option-to-disable-the-curses-module.patch | 26 +++++++++----------
 .../0019-Add-an-option-to-disable-expat.patch      | 20 +++++++--------
 .../0024-Add-an-option-to-disable-decimal.patch    | 16 ++++++------
 package/python3/python3.hash                       |  6 ++---
 package/python3/python3.mk                         |  4 +--
 8 files changed, 75 insertions(+), 68 deletions(-)

diff --git a/package/python3/0011-Override-system-locale-and-set-to-default-when-addin.patch b/package/python3/0011-Override-system-locale-and-set-to-default-when-addin.patch
index 1a40b74d21..57f1bb5a2f 100644
--- a/package/python3/0011-Override-system-locale-and-set-to-default-when-addin.patch
+++ b/package/python3/0011-Override-system-locale-and-set-to-default-when-addin.patch
@@ -1,4 +1,4 @@
-From a9affe1f3f98342b682848c9b3f862ee194ff625 Mon Sep 17 00:00:00 2001
+From e4ae670e3489544a49dabd1618c32fe73504a7ba Mon Sep 17 00:00:00 2001
 From: Samuel Cabrero <samuelcabrero@gmail.com>
 Date: Wed, 23 Dec 2015 11:45:48 +0100
 Subject: [PATCH] Override system locale and set to default when adding gcc
@@ -15,23 +15,25 @@ any system library (eg. libz, libssl, etc.)
 
 Signed-off-by: Samuel Cabrero <samuelcabrero@gmail.com>
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[james.hilliard1 at gmail.com: adapt to python 3.9]
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
 ---
  setup.py | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/setup.py b/setup.py
-index 8fda3b4d47..bb7eb44213 100644
+index d3f0e663f2..926c16f58f 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -600,7 +600,7 @@ class PyBuildExt(build_ext):
+@@ -695,7 +695,7 @@ class PyBuildExt(build_ext):
          tmpfile = os.path.join(self.build_temp, 'ccpaths')
          if not os.path.exists(self.build_temp):
              os.makedirs(self.build_temp)
--        ret = os.system('%s -E -v - </dev/null 2>%s 1>/dev/null' % (cc, tmpfile))
-+        ret = os.system('LC_ALL=C %s -E -v - </dev/null 2>%s 1>/dev/null' % (cc, tmpfile))
+-        ret = run_command('%s -E -v - </dev/null 2>%s 1>/dev/null' % (cc, tmpfile))
++        ret = run_command('LC_ALL=C %s -E -v - </dev/null 2>%s 1>/dev/null' % (cc, tmpfile))
          is_gcc = False
          is_clang = False
          in_incdirs = False
 -- 
-2.20.1
+2.25.1
 
diff --git a/package/python3/0013-Add-an-option-to-disable-installation-of-test-module.patch b/package/python3/0013-Add-an-option-to-disable-installation-of-test-module.patch
index 675c2c1abf..b3380fd53f 100644
--- a/package/python3/0013-Add-an-option-to-disable-installation-of-test-module.patch
+++ b/package/python3/0013-Add-an-option-to-disable-installation-of-test-module.patch
@@ -1,4 +1,4 @@
-From 5ee3e5ad62919c431b1f7b5ff91ddf606582df0e Mon Sep 17 00:00:00 2001
+From 0337342d413d13f437fd089de91faee70a8bf3f9 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:01:18 -0800
 Subject: [PATCH] Add an option to disable installation of test modules
@@ -10,16 +10,18 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 [ Andrey Smirnov: ported to Python 3.6 ]
 Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
+[james.hilliard1 at gmail.com: adapt to python 3.9]
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
 ---
- Makefile.pre.in | 54 ++++++++++++++++++++++++++++++++-----------------
+ Makefile.pre.in | 56 ++++++++++++++++++++++++++++++++-----------------
  configure.ac    |  5 +++++
- 2 files changed, 41 insertions(+), 18 deletions(-)
+ 2 files changed, 42 insertions(+), 19 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index e8a6bd5c03..3abee36f49 100644
+index 7c3dde8dd4..204f293d53 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1317,8 +1317,28 @@ maninstall:	altmaninstall
+@@ -1385,8 +1385,29 @@ maninstall:	altmaninstall
  
  # Install the library
  XMLLIBSUBDIRS=  xml xml/dom xml/etree xml/parsers xml/sax
@@ -43,16 +45,17 @@ index e8a6bd5c03..3abee36f49 100644
 +		multiprocessing multiprocessing/dummy \
 +		unittest \
 +		venv venv/scripts venv/scripts/common venv/scripts/posix \
-+		curses pydoc_data
++		curses pydoc_data \
++		zoneinfo
 +
 +TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
 +		tkinter/test/test_ttk test \
  		test/audiodata \
  		test/capath test/data \
  		test/cjkencodings test/decimaltestdata \
-@@ -1376,26 +1396,24 @@ LIBSUBDIRS=	tkinter tkinter/test tkinter/test/test_tkinter \
- 		test/test_importlib/zipdata01 \
+@@ -1446,28 +1467,25 @@ LIBSUBDIRS=	tkinter tkinter/test tkinter/test/test_tkinter \
  		test/test_importlib/zipdata02 \
+ 		test/test_zoneinfo test/test_zoneinfo/data \
  		test/ziptestdata \
 -		asyncio \
  		test/test_asyncio \
@@ -75,13 +78,15 @@ index e8a6bd5c03..3abee36f49 100644
 +		ctypes/test \
 +		idlelib/idle_test \
 +		distutils/tests \
+ 		test/test_peg_generator \
 +		test/test_importlib test/test_importlib/builtin \
  		test/test_tools test/test_warnings test/test_warnings/data \
 -		turtledemo \
 -		multiprocessing multiprocessing/dummy \
 -		unittest unittest/test unittest/test/testmock \
 -		venv venv/scripts venv/scripts/common venv/scripts/posix \
--		curses pydoc_data
+-		curses pydoc_data \
+-		zoneinfo
 +		unittest/test unittest/test/testmock
 +
 +ifeq (@TEST_MODULES@,yes)
@@ -92,10 +97,10 @@ index e8a6bd5c03..3abee36f49 100644
  	@for i in $(SCRIPTDIR) $(LIBDEST); \
  	do \
 diff --git a/configure.ac b/configure.ac
-index 7872b4dfee..b820d18c7c 100644
+index 73d66167de..92e28d02ee 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3234,6 +3234,11 @@ if test "$posix_threads" = "yes"; then
+@@ -3329,6 +3329,11 @@ if test "$posix_threads" = "yes"; then
        AC_CHECK_FUNCS(pthread_getcpuclockid)
  fi
  
@@ -108,5 +113,5 @@ index 7872b4dfee..b820d18c7c 100644
  # Check for enable-ipv6
  AH_TEMPLATE(ENABLE_IPV6, [Define if --enable-ipv6 is specified])
 -- 
-2.20.1
+2.25.1
 
diff --git a/package/python3/0014-Add-an-option-to-disable-pydoc.patch b/package/python3/0014-Add-an-option-to-disable-pydoc.patch
index a3436e31bf..abb86ea07b 100644
--- a/package/python3/0014-Add-an-option-to-disable-pydoc.patch
+++ b/package/python3/0014-Add-an-option-to-disable-pydoc.patch
@@ -1,4 +1,4 @@
-From 13a8be57e79f2657c75391bfa524dc1ba4993b02 Mon Sep 17 00:00:00 2001
+From a65e5d3caf8e076d531191164c23c6240461f675 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:07:56 -0800
 Subject: [PATCH] Add an option to disable pydoc
@@ -17,10 +17,10 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
  3 files changed, 20 insertions(+), 3 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 3abee36f49..6fa0549a56 100644
+index 204f293d53..63e3df0470 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1289,7 +1289,9 @@ bininstall: altbininstall
+@@ -1357,7 +1357,9 @@ bininstall: altbininstall
  	-rm -f $(DESTDIR)$(BINDIR)/idle3
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s idle$(VERSION) idle3)
  	-rm -f $(DESTDIR)$(BINDIR)/pydoc3
@@ -30,16 +30,16 @@ index 3abee36f49..6fa0549a56 100644
  	-rm -f $(DESTDIR)$(BINDIR)/2to3
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s 2to3-$(VERSION) 2to3)
  	if test "x$(LIPO_32BIT_FLAGS)" != "x" ; then \
-@@ -1335,7 +1337,7 @@ LIBSUBDIRS=	tkinter site-packages \
+@@ -1403,7 +1405,7 @@ LIBSUBDIRS=	tkinter site-packages \
  		multiprocessing multiprocessing/dummy \
  		unittest \
  		venv venv/scripts venv/scripts/common venv/scripts/posix \
--		curses pydoc_data
-+		curses
+-		curses pydoc_data \
++		curses \
+ 		zoneinfo
  
  TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
- 		tkinter/test/test_ttk test \
-@@ -1414,6 +1416,10 @@ ifeq (@TEST_MODULES@,yes)
+@@ -1486,6 +1488,10 @@ ifeq (@TEST_MODULES@,yes)
  LIBSUBDIRS += $(TESTSUBDIRS)
  endif
  
@@ -51,10 +51,10 @@ index 3abee36f49..6fa0549a56 100644
  	@for i in $(SCRIPTDIR) $(LIBDEST); \
  	do \
 diff --git a/configure.ac b/configure.ac
-index b820d18c7c..f53cc86d89 100644
+index 92e28d02ee..174ed85a7c 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3234,6 +3234,12 @@ if test "$posix_threads" = "yes"; then
+@@ -3329,6 +3329,12 @@ if test "$posix_threads" = "yes"; then
        AC_CHECK_FUNCS(pthread_getcpuclockid)
  fi
  
@@ -68,10 +68,10 @@ index b820d18c7c..f53cc86d89 100644
  
  AC_ARG_ENABLE(test-modules,
 diff --git a/setup.py b/setup.py
-index bb7eb44213..748c269960 100644
+index 926c16f58f..1fc5fac90c 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -2401,6 +2401,12 @@ def main():
+@@ -2586,6 +2586,12 @@ def main():
      # turn off warnings when deprecated modules are imported
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
@@ -84,7 +84,7 @@ index bb7eb44213..748c269960 100644
      setup(# PyPI Metadata (PEP 301)
            name = "Python",
            version = sys.version.split()[0],
-@@ -2425,8 +2431,7 @@ def main():
+@@ -2610,8 +2616,7 @@ def main():
            # If you change the scripts installed here, you also need to
            # check the PyBuildScripts command above, and change the links
            # created by the bininstall target in Makefile.pre.in
@@ -95,5 +95,5 @@ index bb7eb44213..748c269960 100644
  
  # --install-platlib
 -- 
-2.20.1
+2.25.1
 
diff --git a/package/python3/0018-Add-an-option-to-disable-the-curses-module.patch b/package/python3/0018-Add-an-option-to-disable-the-curses-module.patch
index 0628669b93..d51267bbf0 100644
--- a/package/python3/0018-Add-an-option-to-disable-the-curses-module.patch
+++ b/package/python3/0018-Add-an-option-to-disable-the-curses-module.patch
@@ -1,4 +1,4 @@
-From 332373ca25f2dbe5473330666ec49143506a4dc0 Mon Sep 17 00:00:00 2001
+From 962deb43f5f340a8472d432ae8e6d61186f9040e Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:31:51 -0800
 Subject: [PATCH] Add an option to disable the curses module
@@ -8,25 +8,23 @@ Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 [ Andrey Smirnov: ported to Python 3.6 ]
 Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 ---
- Makefile.pre.in | 7 +++++--
+ Makefile.pre.in | 5 ++++-
  configure.ac    | 9 +++++++++
- 2 files changed, 14 insertions(+), 2 deletions(-)
+ 2 files changed, 13 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 5d78419fd4..660c292765 100644
+index dc84384680..2a82f3308f 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1336,8 +1336,7 @@ LIBSUBDIRS=	site-packages \
- 		turtledemo \
+@@ -1405,7 +1405,6 @@ LIBSUBDIRS=	site-packages \
  		multiprocessing multiprocessing/dummy \
  		unittest \
--		venv venv/scripts venv/scripts/common venv/scripts/posix \
--		curses
-+		venv venv/scripts venv/scripts/common venv/scripts/posix
+ 		venv venv/scripts venv/scripts/common venv/scripts/posix \
+-		curses \
+ 		zoneinfo
  
  TESTSUBDIRS=	test \
- 		test/audiodata \
-@@ -1413,6 +1412,10 @@ TESTSUBDIRS += tkinter/test tkinter/test/test_tkinter \
+@@ -1485,6 +1484,10 @@ TESTSUBDIRS += tkinter/test tkinter/test/test_tkinter \
  	tkinter/test/test_ttk
  endif
  
@@ -38,10 +36,10 @@ index 5d78419fd4..660c292765 100644
  LIBSUBDIRS += lib2to3 lib2to3/fixes lib2to3/pgen2
  TESTSUBDIRS += lib2to3/tests			\
 diff --git a/configure.ac b/configure.ac
-index b5922451cc..ea422a86a9 100644
+index 4c72dae960..acd98381a3 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3252,6 +3252,15 @@ if test "$TK" = "no"; then
+@@ -3347,6 +3347,15 @@ if test "$TK" = "no"; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _tkinter"
  fi
  
@@ -58,5 +56,5 @@ index b5922451cc..ea422a86a9 100644
  
  AC_ARG_ENABLE(pydoc,
 -- 
-2.20.1
+2.25.1
 
diff --git a/package/python3/0019-Add-an-option-to-disable-expat.patch b/package/python3/0019-Add-an-option-to-disable-expat.patch
index e31f3e105e..af6e1ebcc1 100644
--- a/package/python3/0019-Add-an-option-to-disable-expat.patch
+++ b/package/python3/0019-Add-an-option-to-disable-expat.patch
@@ -1,4 +1,4 @@
-From d88f2d3430bbbe285ae3de5fbc1bde34da7f0478 Mon Sep 17 00:00:00 2001
+From 7e0e7dc25f50acd6922493ae620ee5cbf107a79a Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:40:45 -0800
 Subject: [PATCH] Add an option to disable expat
@@ -20,10 +20,10 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
  3 files changed, 19 insertions(+), 7 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 660c292765..f49abf8395 100644
+index 2a82f3308f..e678c8817e 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1331,7 +1331,7 @@ LIBSUBDIRS=	site-packages \
+@@ -1399,7 +1399,7 @@ LIBSUBDIRS=	site-packages \
  		logging csv wsgiref urllib \
  		ctypes ctypes/macholib \
  		idlelib idlelib/Icons \
@@ -32,7 +32,7 @@ index 660c292765..f49abf8395 100644
  		importlib \
  		turtledemo \
  		multiprocessing multiprocessing/dummy \
-@@ -1416,6 +1416,10 @@ ifeq (@CURSES@,yes)
+@@ -1488,6 +1488,10 @@ ifeq (@CURSES@,yes)
  LIBSUBDIRS += curses
  endif
  
@@ -44,16 +44,16 @@ index 660c292765..f49abf8395 100644
  LIBSUBDIRS += lib2to3 lib2to3/fixes lib2to3/pgen2
  TESTSUBDIRS += lib2to3/tests			\
 diff --git a/configure.ac b/configure.ac
-index ea422a86a9..3c1e2c088d 100644
+index acd98381a3..9ef0ecd42f 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2961,13 +2961,21 @@ PKG_PROG_PKG_CONFIG
+@@ -3055,13 +3055,21 @@ PKG_PROG_PKG_CONFIG
  AC_SUBST(DISABLED_EXTENSIONS)
  
  # Check for use of the system expat library
 -AC_MSG_CHECKING(for --with-system-expat)
 -AC_ARG_WITH(system_expat,
--            AS_HELP_STRING([--with-system-expat], [build pyexpat module using an installed expat library]),
+-            AS_HELP_STRING([--with-system-expat], [build pyexpat module using an installed expat library, see Doc/library/pyexpat.rst (default is no)]),
 +AC_MSG_CHECKING(for --with-expat)
 +AC_ARG_WITH(expat,
 +            AS_HELP_STRING([--with-expat], [select which expat version to use: system, builtin, none]),
@@ -75,10 +75,10 @@ index ea422a86a9..3c1e2c088d 100644
  # Check for use of the system libffi library
  AC_MSG_CHECKING(for --with-system-ffi)
 diff --git a/setup.py b/setup.py
-index 1669797cad..d2727c0da5 100644
+index 4063d7ffa5..211a160f29 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -1576,7 +1576,7 @@ class PyBuildExt(build_ext):
+@@ -1681,7 +1681,7 @@ class PyBuildExt(build_ext):
          #
          # More information on Expat can be found at www.libexpat.org.
          #
@@ -88,5 +88,5 @@ index 1669797cad..d2727c0da5 100644
              define_macros = []
              extra_compile_args = []
 -- 
-2.20.1
+2.25.1
 
diff --git a/package/python3/0024-Add-an-option-to-disable-decimal.patch b/package/python3/0024-Add-an-option-to-disable-decimal.patch
index 5906f9d385..438b76b91f 100644
--- a/package/python3/0024-Add-an-option-to-disable-decimal.patch
+++ b/package/python3/0024-Add-an-option-to-disable-decimal.patch
@@ -1,4 +1,4 @@
-From c82efeabd2f9b89ff2ecd5261eceeeb3af022ae8 Mon Sep 17 00:00:00 2001
+From d5fe81cbd51da2a84ed89d1e4c80d921d4efce26 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:51:31 +0100
 Subject: [PATCH] Add an option to disable decimal
@@ -11,22 +11,24 @@ the libmpdec builtin the Python sources, or no libmpdec at all.
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 [aduskett at gmail.com: Update for python 3.7.0]
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
+[james.hilliard1 at gmail.com: adapt to python 3.9]
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
 ---
  configure.ac | 17 ++++++++++++-----
  setup.py     |  2 +-
  2 files changed, 13 insertions(+), 6 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 8c9706582e..e6255babb6 100644
+index 7bd4623ccd..e513ef6a20 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3012,13 +3012,20 @@ fi
+@@ -3106,13 +3106,20 @@ fi
  AC_SUBST(LIBFFI_INCLUDEDIR)
  
  # Check for use of the system libmpdec library
 -AC_MSG_CHECKING(for --with-system-libmpdec)
 -AC_ARG_WITH(system_libmpdec,
--            AS_HELP_STRING([--with-system-libmpdec], [build _decimal module using an installed libmpdec library]),
+-            AS_HELP_STRING([--with-system-libmpdec], [build _decimal module using an installed libmpdec library, see Doc/library/decimal.rst (default is no)]),
 +AC_MSG_CHECKING(for --with-libmpdec)
 +AC_ARG_WITH(libmpdec,
 +            AS_HELP_STRING([--with-libmpdec], [select which libmpdec version to use: system, builtin, none]),
@@ -47,10 +49,10 @@ index 8c9706582e..e6255babb6 100644
  # Check whether _decimal should use a coroutine-local or thread-local context
  AC_MSG_CHECKING(for --with-decimal-contextvar)
 diff --git a/setup.py b/setup.py
-index 9f09b3d985..a7f2e23d87 100644
+index c4ee989ba3..3d0c74bb7f 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -2076,7 +2076,7 @@ class PyBuildExt(build_ext):
+@@ -2221,7 +2221,7 @@ class PyBuildExt(build_ext):
          # Stefan Krah's _decimal module
          extra_compile_args = []
          undef_macros = []
@@ -60,5 +62,5 @@ index 9f09b3d985..a7f2e23d87 100644
              libraries = [':libmpdec.so.2']
              sources = ['_decimal/_decimal.c']
 -- 
-2.20.1
+2.25.1
 
diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 4c03293dd1..3de1e8353a 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,5 @@
-# From https://www.python.org/downloads/release/python-386/
-md5  69e73c49eeb1a853cefd26d18c9d069d  Python-3.8.6.tar.xz
+# From https://www.python.org/downloads/release/python-390/
+md5  6ebfe157f6e88d9eabfbaf3fa92129f6  Python-3.9.0.tar.xz
 # Locally computed
-sha256  a9e0b79d27aa056eb9cce8d63a427b5f9bab1465dee3f942dcfdb25a82f4ab8a  Python-3.8.6.tar.xz
+sha256  9c73e63c99855709b9be0b3cc9e5b072cb60f37311e8c4e50f15576a0bf82854  Python-3.9.0.tar.xz
 sha256  1dceef1677a39befa8bf0285ab2db441ba117520bb2de839547ace006a17750d  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index af1e5e50d9..d4e08e91d5 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON3_VERSION_MAJOR = 3.8
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).6
+PYTHON3_VERSION_MAJOR = 3.9
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).0
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
