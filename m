From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Jul 2019 23:39:38 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/python3: security
 bump to version 3.7.4
Message-ID: <20190731213807.684A8889A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9e12fb0ebef18fd456d4f314586cace5d0dda091
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes the following security issues:

- bpo-37463: ssl.match_hostname() no longer accepts IPv4 addresses with
  additional text after the address and only quad-dotted notation without
  trailing whitespaces.  Some inet_aton() implementations ignore whitespace
  and all data after whitespace, e.g.  ???127.0.0.1 whatever???.

- bpo-35907: CVE-2019-9948: Avoid file reading by disallowing local-file://
  and local_file:// URL schemes in URLopener().open() and
  URLopener().retrieve() of urllib.request.

- bpo-30458: Address CVE-2019-9740 by disallowing URL paths with embedded
  whitespace or control characters through into the underlying http client
  request.  Such potentially malicious header injection URLs now cause an
  http.client.InvalidURL exception to be raised.

- bpo-33529: Prevent fold function used in email header encoding from
  entering infinite loop when there are too many non-ASCII characters in a
  header.

- bpo-35755: shutil.which() now uses os.confstr("CS_PATH") if available and
  if the PATH environment variable is not set.  Remove also the current
  directory from posixpath.defpath.  On Unix, shutil.which() and the
  subprocess module no longer search the executable in the current directory
  if the PATH environment variable is not set.

Also remove the following upstreamed patches:
  - 0033-bpo-36742-Fixes-handling-of-pre-normalization-charac.patch
  - 0034-bpo-36742-Corrects-fix-to-handle-decomposition-in-us.patch

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
[Peter: mention security fixes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

(cherry picked from commit 906ed044aadd687ef269e0cd9629eb69f259d35f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...1-Make-the-build-of-pyc-files-conditional.patch |  4 +-
 ...ructure-to-disable-the-build-of-certain-e.patch |  6 +-
 ...n-t-look-in-usr-lib-termcap-for-libraries.patch |  2 +-
 .../python3/0006-Don-t-add-multiarch-paths.patch   |  2 +-
 .../0007-Abort-on-failed-module-build.patch        |  2 +-
 ...-config.sh.in-ensure-sed-invocations-only.patch |  2 +-
 ...stem-locale-and-set-to-default-when-addin.patch |  2 +-
 ...on-to-disable-installation-of-test-module.patch |  4 +-
 .../0014-Add-an-option-to-disable-pydoc.patch      | 10 ++--
 .../0015-Add-an-option-to-disable-lib2to3.patch    | 12 ++--
 ...-Add-option-to-disable-the-sqlite3-module.patch |  6 +-
 ...17-Add-an-option-to-disable-the-tk-module.patch |  6 +-
 ...dd-an-option-to-disable-the-curses-module.patch |  4 +-
 .../0019-Add-an-option-to-disable-expat.patch      |  6 +-
 .../0023-Add-an-option-to-disable-IDLE.patch       |  8 +--
 .../0024-Add-an-option-to-disable-decimal.patch    |  2 +-
 ...29-python-config.sh-don-t-reassign-prefix.patch |  2 +-
 .../0030-Fix-cross-compiling-the-uuid-module.patch |  2 +-
 ...ixes-handling-of-pre-normalization-charac.patch | 70 ----------------------
 ...orrects-fix-to-handle-decomposition-in-us.patch | 58 ------------------
 package/python3/python3.hash                       |  6 +-
 package/python3/python3.mk                         |  2 +-
 22 files changed, 45 insertions(+), 173 deletions(-)

diff --git a/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch b/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
index f6fa3d7554..84bb881aa5 100644
--- a/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
+++ b/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
@@ -18,7 +18,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index 82e830727e..b38bd79121 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1393,6 +1393,7 @@ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
+@@ -1395,6 +1395,7 @@ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
  		$(INSTALL_DATA) $(srcdir)/Modules/xxmodule.c \
  			$(DESTDIR)$(LIBDEST)/distutils/tests ; \
  	fi
@@ -26,7 +26,7 @@ index 82e830727e..b38bd79121 100644
  	-PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
  		$(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py \
  		-d $(LIBDEST) -f \
-@@ -1420,6 +1421,7 @@ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
+@@ -1422,6 +1423,7 @@ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
  		$(PYTHON_FOR_BUILD) -Wi -OO $(DESTDIR)$(LIBDEST)/compileall.py \
  		-d $(LIBDEST)/site-packages -f \
  		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
diff --git a/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch b/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch
index 647f3251d7..5068862105 100644
--- a/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch
+++ b/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch
@@ -47,7 +47,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index b38bd79121..4ce917ab8d 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -204,6 +204,8 @@ FILEMODE=	644
+@@ -206,6 +206,8 @@ FILEMODE=	644
  # configure script arguments
  CONFIG_ARGS=	@CONFIG_ARGS@
  
@@ -56,7 +56,7 @@ index b38bd79121..4ce917ab8d 100644
  
  # Subdirectories with code
  SRCDIRS= 	@SRCDIRS@
-@@ -617,6 +619,7 @@ sharedmods: $(BUILDPYTHON) pybuilddir.txt Modules/_math.o
+@@ -619,6 +621,7 @@ sharedmods: $(BUILDPYTHON) pybuilddir.txt Modules/_math.o
  	esac; \
  	echo "$(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' \
  		_TCLTK_INCLUDES='$(TCLTK_INCLUDES)' _TCLTK_LIBS='$(TCLTK_LIBS)' \
@@ -64,7 +64,7 @@ index b38bd79121..4ce917ab8d 100644
  		$(PYTHON_FOR_BUILD) $(srcdir)/setup.py $$quiet build"; \
  	$(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' \
  		_TCLTK_INCLUDES='$(TCLTK_INCLUDES)' _TCLTK_LIBS='$(TCLTK_LIBS)' \
-@@ -1526,7 +1529,8 @@ libainstall:	@DEF_MAKE_RULE@ python-config
+@@ -1528,7 +1531,8 @@ libainstall:	@DEF_MAKE_RULE@ python-config
  # Install the dynamically loadable modules
  # This goes into $(exec_prefix)
  sharedinstall: sharedmods
diff --git a/package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch b/package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch
index d8c5b0faf8..8dd54f8b3b 100644
--- a/package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch
+++ b/package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch
@@ -12,7 +12,7 @@ diff --git a/setup.py b/setup.py
 index 86643ae8bf..cd00fbdbda 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -855,12 +855,9 @@ class PyBuildExt(build_ext):
+@@ -894,12 +894,9 @@ class PyBuildExt(build_ext):
                  pass # Issue 7384: Already linked against curses or tinfo.
              elif curses_library:
                  readline_libs.append(curses_library)
diff --git a/package/python3/0006-Don-t-add-multiarch-paths.patch b/package/python3/0006-Don-t-add-multiarch-paths.patch
index e55640d413..a6ba6a8578 100644
--- a/package/python3/0006-Don-t-add-multiarch-paths.patch
+++ b/package/python3/0006-Don-t-add-multiarch-paths.patch
@@ -20,7 +20,7 @@ diff --git a/setup.py b/setup.py
 index cd00fbdbda..c956fa08d1 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -552,10 +552,10 @@ class PyBuildExt(build_ext):
+@@ -591,10 +591,10 @@ class PyBuildExt(build_ext):
          if not cross_compiling:
              add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
              add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
diff --git a/package/python3/0007-Abort-on-failed-module-build.patch b/package/python3/0007-Abort-on-failed-module-build.patch
index a7071e199d..e8de7a5414 100644
--- a/package/python3/0007-Abort-on-failed-module-build.patch
+++ b/package/python3/0007-Abort-on-failed-module-build.patch
@@ -17,7 +17,7 @@ diff --git a/setup.py b/setup.py
 index c956fa08d1..b3add2be76 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -363,6 +363,7 @@ class PyBuildExt(build_ext):
+@@ -402,6 +402,7 @@ class PyBuildExt(build_ext):
              print("Failed to build these modules:")
              print_three_column(failed)
              print()
diff --git a/package/python3/0010-Misc-python-config.sh.in-ensure-sed-invocations-only.patch b/package/python3/0010-Misc-python-config.sh.in-ensure-sed-invocations-only.patch
index 68cba34978..31f237e22f 100644
--- a/package/python3/0010-Misc-python-config.sh.in-ensure-sed-invocations-only.patch
+++ b/package/python3/0010-Misc-python-config.sh.in-ensure-sed-invocations-only.patch
@@ -53,7 +53,7 @@ index d1d3275..9e259c0 100644
  VERSION="@VERSION@"
  LIBM="@LIBM@"
  LIBC="@LIBC@"
-@@ -49,7 +50,7 @@ OPT="@OPT@"
+@@ -48,7 +49,7 @@ OPT="@OPT@"
  PY_ENABLE_SHARED="@PY_ENABLE_SHARED@"
  LDVERSION="@LDVERSION@"
  LIBDEST=${prefix_real}/lib/python${VERSION}
diff --git a/package/python3/0011-Override-system-locale-and-set-to-default-when-addin.patch b/package/python3/0011-Override-system-locale-and-set-to-default-when-addin.patch
index 5c645201ee..2444c4da34 100644
--- a/package/python3/0011-Override-system-locale-and-set-to-default-when-addin.patch
+++ b/package/python3/0011-Override-system-locale-and-set-to-default-when-addin.patch
@@ -23,7 +23,7 @@ diff --git a/setup.py b/setup.py
 index b3add2be76..29bfd174d2 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -519,7 +519,7 @@ class PyBuildExt(build_ext):
+@@ -558,7 +558,7 @@ class PyBuildExt(build_ext):
          tmpfile = os.path.join(self.build_temp, 'gccpaths')
          if not os.path.exists(self.build_temp):
              os.makedirs(self.build_temp)
diff --git a/package/python3/0013-Add-an-option-to-disable-installation-of-test-module.patch b/package/python3/0013-Add-an-option-to-disable-installation-of-test-module.patch
index 8180880e1c..355e62f50d 100644
--- a/package/python3/0013-Add-an-option-to-disable-installation-of-test-module.patch
+++ b/package/python3/0013-Add-an-option-to-disable-installation-of-test-module.patch
@@ -19,7 +19,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index 4ce917ab8d..4110fff4ac 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1259,8 +1259,28 @@ maninstall:	altmaninstall
+@@ -1261,8 +1261,28 @@ maninstall:	altmaninstall
  
  # Install the library
  XMLLIBSUBDIRS=  xml xml/dom xml/etree xml/parsers xml/sax
@@ -54,7 +54,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index 1ff2362..194dbfc 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1334,26 +1334,24 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
+@@ -1336,26 +1336,24 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
  		test/test_importlib/source \
  		test/test_importlib/zipdata01 \
  		test/test_importlib/zipdata02 \
diff --git a/package/python3/0014-Add-an-option-to-disable-pydoc.patch b/package/python3/0014-Add-an-option-to-disable-pydoc.patch
index 6f6e265c75..bccd9facf5 100644
--- a/package/python3/0014-Add-an-option-to-disable-pydoc.patch
+++ b/package/python3/0014-Add-an-option-to-disable-pydoc.patch
@@ -20,7 +20,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index 4110fff4ac..badb2af35d 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1229,7 +1229,9 @@ bininstall: altbininstall
+@@ -1231,7 +1231,9 @@ bininstall: altbininstall
  	-rm -f $(DESTDIR)$(BINDIR)/idle3
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s idle$(VERSION) idle3)
  	-rm -f $(DESTDIR)$(BINDIR)/pydoc3
@@ -30,7 +30,7 @@ index 4110fff4ac..badb2af35d 100644
  	-rm -f $(DESTDIR)$(BINDIR)/2to3
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s 2to3-$(VERSION) 2to3)
  	-rm -f $(DESTDIR)$(BINDIR)/pyvenv
-@@ -1277,7 +1279,7 @@ LIBSUBDIRS=	tkinter site-packages \
+@@ -1279,7 +1281,7 @@ LIBSUBDIRS=	tkinter site-packages \
  		multiprocessing multiprocessing/dummy \
  		unittest \
  		venv venv/scripts venv/scripts/common venv/scripts/posix \
@@ -39,7 +39,7 @@ index 4110fff4ac..badb2af35d 100644
  
  TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
  		tkinter/test/test_ttk test \
-@@ -1352,6 +1354,10 @@ ifeq (@TEST_MODULES@,yes)
+@@ -1354,6 +1356,10 @@ ifeq (@TEST_MODULES@,yes)
  LIBSUBDIRS += $(TESTSUBDIRS)
  endif
  
@@ -71,7 +71,7 @@ diff --git a/setup.py b/setup.py
 index 29bfd174d2..94dd337fef 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -2337,6 +2337,12 @@ def main():
+@@ -2376,6 +2376,12 @@ def main():
      # turn off warnings when deprecated modules are imported
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
@@ -84,7 +84,7 @@ index 29bfd174d2..94dd337fef 100644
      setup(# PyPI Metadata (PEP 301)
            name = "Python",
            version = sys.version.split()[0],
-@@ -2361,8 +2367,7 @@ def main():
+@@ -2400,8 +2406,7 @@ def main():
            # If you change the scripts installed here, you also need to
            # check the PyBuildScripts command above, and change the links
            # created by the bininstall target in Makefile.pre.in
diff --git a/package/python3/0015-Add-an-option-to-disable-lib2to3.patch b/package/python3/0015-Add-an-option-to-disable-lib2to3.patch
index d2ce91775b..fade361fab 100644
--- a/package/python3/0015-Add-an-option-to-disable-lib2to3.patch
+++ b/package/python3/0015-Add-an-option-to-disable-lib2to3.patch
@@ -20,7 +20,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index badb2af35d..931cc3ed07 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1233,7 +1233,9 @@ ifeq (@PYDOC@,yes)
+@@ -1235,7 +1235,9 @@ ifeq (@PYDOC@,yes)
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s pydoc$(VERSION) pydoc3)
  endif
  	-rm -f $(DESTDIR)$(BINDIR)/2to3
@@ -30,7 +30,7 @@ index badb2af35d..931cc3ed07 100644
  	-rm -f $(DESTDIR)$(BINDIR)/pyvenv
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s pyvenv-$(VERSION) pyvenv)
  	if test "x$(LIPO_32BIT_FLAGS)" != "x" ; then \
-@@ -1270,7 +1272,6 @@ LIBSUBDIRS=	tkinter site-packages \
+@@ -1272,7 +1274,6 @@ LIBSUBDIRS=	tkinter site-packages \
  		html json http dbm xmlrpc \
  		sqlite3 \
  		logging csv wsgiref urllib \
@@ -38,7 +38,7 @@ index badb2af35d..931cc3ed07 100644
  		ctypes ctypes/macholib \
  		idlelib idlelib/Icons \
  		distutils distutils/command $(XMLLIBSUBDIRS) \
-@@ -1340,9 +1341,6 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
+@@ -1342,9 +1343,6 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
  		test/test_email test/test_email/data \
  		test/test_json \
  		sqlite3/test \
@@ -48,7 +48,7 @@ index badb2af35d..931cc3ed07 100644
  		ctypes/test \
  		idlelib/idle_test \
  		distutils/tests \
-@@ -1350,6 +1348,14 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
+@@ -1352,6 +1350,14 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
  		test/test_tools test/test_warnings test/test_warnings/data \
  		unittest/test unittest/test/testmock
  
@@ -63,7 +63,7 @@ index badb2af35d..931cc3ed07 100644
  ifeq (@TEST_MODULES@,yes)
  LIBSUBDIRS += $(TESTSUBDIRS)
  endif
-@@ -1449,10 +1455,12 @@ ifeq (@PYC_BUILD@,yes)
+@@ -1451,10 +1457,12 @@ ifeq (@PYC_BUILD@,yes)
  		-d $(LIBDEST)/site-packages -f \
  		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
  endif
@@ -97,7 +97,7 @@ diff --git a/setup.py b/setup.py
 index 94dd337fef..76429e1326 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -2338,10 +2338,11 @@ def main():
+@@ -2377,10 +2377,11 @@ def main():
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
  
diff --git a/package/python3/0016-Add-option-to-disable-the-sqlite3-module.patch b/package/python3/0016-Add-option-to-disable-the-sqlite3-module.patch
index 134a7ef8b8..ed5e4cb29e 100644
--- a/package/python3/0016-Add-option-to-disable-the-sqlite3-module.patch
+++ b/package/python3/0016-Add-option-to-disable-the-sqlite3-module.patch
@@ -16,7 +16,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index 931cc3ed07..a1ce0712cd 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1270,7 +1270,6 @@ LIBSUBDIRS=	tkinter site-packages \
+@@ -1272,7 +1272,6 @@ LIBSUBDIRS=	tkinter site-packages \
  		email email/mime \
  		ensurepip ensurepip/_bundled \
  		html json http dbm xmlrpc \
@@ -24,7 +24,7 @@ index 931cc3ed07..a1ce0712cd 100644
  		logging csv wsgiref urllib \
  		ctypes ctypes/macholib \
  		idlelib idlelib/Icons \
-@@ -1340,7 +1339,6 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
+@@ -1342,7 +1341,6 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
  		test/test_asyncio \
  		test/test_email test/test_email/data \
  		test/test_json \
@@ -32,7 +32,7 @@ index 931cc3ed07..a1ce0712cd 100644
  		ctypes/test \
  		idlelib/idle_test \
  		distutils/tests \
-@@ -1356,6 +1354,11 @@ TESTSUBDIRS += lib2to3/tests			\
+@@ -1358,6 +1356,11 @@ TESTSUBDIRS += lib2to3/tests			\
  	lib2to3/tests/data/fixers/myfixes
  endif
  
diff --git a/package/python3/0017-Add-an-option-to-disable-the-tk-module.patch b/package/python3/0017-Add-an-option-to-disable-the-tk-module.patch
index 57d45a22f8..347057e099 100644
--- a/package/python3/0017-Add-an-option-to-disable-the-tk-module.patch
+++ b/package/python3/0017-Add-an-option-to-disable-the-tk-module.patch
@@ -16,7 +16,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index a1ce0712cd..dc1e917cc3 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1264,7 +1264,7 @@ maninstall:	altmaninstall
+@@ -1266,7 +1266,7 @@ maninstall:	altmaninstall
  # Install the library
  XMLLIBSUBDIRS=  xml xml/dom xml/etree xml/parsers xml/sax
  
@@ -25,7 +25,7 @@ index a1ce0712cd..dc1e917cc3 100644
  		asyncio \
  		collections concurrent concurrent/futures encodings \
  		email email/mime \
-@@ -1281,8 +1281,7 @@ LIBSUBDIRS=	tkinter site-packages \
+@@ -1283,8 +1283,7 @@ LIBSUBDIRS=	tkinter site-packages \
  		venv venv/scripts venv/scripts/common venv/scripts/posix \
  		curses
  
@@ -35,7 +35,7 @@ index a1ce0712cd..dc1e917cc3 100644
  		test/audiodata \
  		test/capath test/data \
  		test/cjkencodings test/decimaltestdata test/xmltestdata \
-@@ -1346,6 +1345,12 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
+@@ -1348,6 +1347,12 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
  		test/test_tools test/test_warnings test/test_warnings/data \
  		unittest/test unittest/test/testmock
  
diff --git a/package/python3/0018-Add-an-option-to-disable-the-curses-module.patch b/package/python3/0018-Add-an-option-to-disable-the-curses-module.patch
index 767ded5a77..847f558269 100644
--- a/package/python3/0018-Add-an-option-to-disable-the-curses-module.patch
+++ b/package/python3/0018-Add-an-option-to-disable-the-curses-module.patch
@@ -16,7 +16,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index dc1e917cc3..6a6bc082cd 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1278,8 +1278,7 @@ LIBSUBDIRS=	site-packages \
+@@ -1280,8 +1280,7 @@ LIBSUBDIRS=	site-packages \
  		turtledemo \
  		multiprocessing multiprocessing/dummy \
  		unittest \
@@ -26,7 +26,7 @@ index dc1e917cc3..6a6bc082cd 100644
  
  TESTSUBDIRS=	test \
  		test/audiodata \
-@@ -1351,6 +1350,10 @@ TESTSUBDIRS += tkinter/test tkinter/test/test_tkinter \
+@@ -1353,6 +1352,10 @@ TESTSUBDIRS += tkinter/test tkinter/test/test_tkinter \
  	tkinter/test/test_ttk
  endif
  
diff --git a/package/python3/0019-Add-an-option-to-disable-expat.patch b/package/python3/0019-Add-an-option-to-disable-expat.patch
index 6667eaf61d..8855858ece 100644
--- a/package/python3/0019-Add-an-option-to-disable-expat.patch
+++ b/package/python3/0019-Add-an-option-to-disable-expat.patch
@@ -23,7 +23,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index 6a6bc082cd..dc4b92b6fe 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1273,7 +1273,7 @@ LIBSUBDIRS=	site-packages \
+@@ -1275,7 +1275,7 @@ LIBSUBDIRS=	site-packages \
  		logging csv wsgiref urllib \
  		ctypes ctypes/macholib \
  		idlelib idlelib/Icons \
@@ -32,7 +32,7 @@ index 6a6bc082cd..dc4b92b6fe 100644
  		importlib \
  		turtledemo \
  		multiprocessing multiprocessing/dummy \
-@@ -1354,6 +1354,10 @@ ifeq (@CURSES@,yes)
+@@ -1356,6 +1356,10 @@ ifeq (@CURSES@,yes)
  LIBSUBDIRS += curses
  endif
  
@@ -78,7 +78,7 @@ diff --git a/setup.py b/setup.py
 index 76429e1326..38aa5e605e 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -1490,7 +1490,7 @@ class PyBuildExt(build_ext):
+@@ -1529,7 +1529,7 @@ class PyBuildExt(build_ext):
          #
          # More information on Expat can be found at www.libexpat.org.
          #
diff --git a/package/python3/0023-Add-an-option-to-disable-IDLE.patch b/package/python3/0023-Add-an-option-to-disable-IDLE.patch
index 98607c5e1c..4cec314065 100644
--- a/package/python3/0023-Add-an-option-to-disable-IDLE.patch
+++ b/package/python3/0023-Add-an-option-to-disable-IDLE.patch
@@ -19,7 +19,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index dc4b92b6fe..3e43066d90 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1227,7 +1227,9 @@ bininstall: altbininstall
+@@ -1229,7 +1229,9 @@ bininstall: altbininstall
  	-rm -f $(DESTDIR)$(LIBPC)/python3.pc
  	(cd $(DESTDIR)$(LIBPC); $(LN) -s python-$(VERSION).pc python3.pc)
  	-rm -f $(DESTDIR)$(BINDIR)/idle3
@@ -29,7 +29,7 @@ index dc4b92b6fe..3e43066d90 100644
  	-rm -f $(DESTDIR)$(BINDIR)/pydoc3
  ifeq (@PYDOC@,yes)
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s pydoc$(VERSION) pydoc3)
-@@ -1272,7 +1274,6 @@ LIBSUBDIRS=	site-packages \
+@@ -1274,7 +1276,6 @@ LIBSUBDIRS=	site-packages \
  		html json http dbm xmlrpc \
  		logging csv wsgiref urllib \
  		ctypes ctypes/macholib \
@@ -37,7 +37,7 @@ index dc4b92b6fe..3e43066d90 100644
  		distutils distutils/command \
  		importlib \
  		turtledemo \
-@@ -1358,6 +1359,10 @@ ifeq (@EXPAT@,yes)
+@@ -1360,6 +1361,10 @@ ifeq (@EXPAT@,yes)
  LIBSUBDIRS += $(XMLLIBSUBDIRS)
  endif
  
@@ -69,7 +69,7 @@ diff --git a/setup.py b/setup.py
 index 38aa5e605e..d642825c1e 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -2338,11 +2338,13 @@ def main():
+@@ -2377,11 +2377,13 @@ def main():
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
  
diff --git a/package/python3/0024-Add-an-option-to-disable-decimal.patch b/package/python3/0024-Add-an-option-to-disable-decimal.patch
index 31ffbc6b38..5e02f0e218 100644
--- a/package/python3/0024-Add-an-option-to-disable-decimal.patch
+++ b/package/python3/0024-Add-an-option-to-disable-decimal.patch
@@ -50,7 +50,7 @@ diff --git a/setup.py b/setup.py
 index d642825c1e..5b98255857 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -2015,7 +2015,7 @@ class PyBuildExt(build_ext):
+@@ -2054,7 +2054,7 @@ class PyBuildExt(build_ext):
      def _decimal_ext(self):
          extra_compile_args = []
          undef_macros = []
diff --git a/package/python3/0029-python-config.sh-don-t-reassign-prefix.patch b/package/python3/0029-python-config.sh-don-t-reassign-prefix.patch
index 2e45bee15a..0edaebdb65 100644
--- a/package/python3/0029-python-config.sh-don-t-reassign-prefix.patch
+++ b/package/python3/0029-python-config.sh-don-t-reassign-prefix.patch
@@ -39,7 +39,7 @@ index 9e259c0..8b249d9 100644
  exec_prefix=$(echo "$exec_prefix_build" | sed "s#^$exec_prefix_build#$prefix_real#")
  exec_prefix_real=${prefix_real}
  includedir=$(echo "@includedir@" | sed "s#^$prefix_build#$prefix_real#")
-@@ -49,7 +49,7 @@ LINKFORSHARED="@LINKFORSHARED@"
+@@ -48,7 +48,7 @@ LINKFORSHARED="@LINKFORSHARED@"
  OPT="@OPT@"
  PY_ENABLE_SHARED="@PY_ENABLE_SHARED@"
  LDVERSION="@LDVERSION@"
diff --git a/package/python3/0030-Fix-cross-compiling-the-uuid-module.patch b/package/python3/0030-Fix-cross-compiling-the-uuid-module.patch
index 8b4dca912c..a2dcdb1b08 100644
--- a/package/python3/0030-Fix-cross-compiling-the-uuid-module.patch
+++ b/package/python3/0030-Fix-cross-compiling-the-uuid-module.patch
@@ -23,7 +23,7 @@ diff --git a/setup.py b/setup.py
 index 1a7085c5c4..f33d0b57b8 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -1632,7 +1632,8 @@ class PyBuildExt(build_ext):
+@@ -1671,7 +1671,8 @@ class PyBuildExt(build_ext):
              missing.append('_tkinter')
  
          # Build the _uuid module if possible
diff --git a/package/python3/0033-bpo-36742-Fixes-handling-of-pre-normalization-charac.patch b/package/python3/0033-bpo-36742-Fixes-handling-of-pre-normalization-charac.patch
deleted file mode 100644
index 38f8ed625b..0000000000
--- a/package/python3/0033-bpo-36742-Fixes-handling-of-pre-normalization-charac.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From 4d723e76e1ad17e9e7d5e828e59bb47e76f2174b Mon Sep 17 00:00:00 2001
-From: "Miss Islington (bot)"
- <31488909+miss-islington@users.noreply.github.com>
-Date: Tue, 30 Apr 2019 05:21:02 -0700
-Subject: [PATCH] bpo-36742: Fixes handling of pre-normalization characters in
- urlsplit() (GH-13017)
-
-(cherry picked from commit d537ab0ff9767ef024f26246899728f0116b1ec3)
-
-Co-authored-by: Steve Dower <steve.dower@python.org>
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- Lib/test/test_urlparse.py                                     |  6 ++++++
- Lib/urllib/parse.py                                           | 11 +++++++----
- .../next/Security/2019-04-29-15-34-59.bpo-36742.QCUY0i.rst    |  1 +
- 3 files changed, 14 insertions(+), 4 deletions(-)
- create mode 100644 Misc/NEWS.d/next/Security/2019-04-29-15-34-59.bpo-36742.QCUY0i.rst
-
-diff --git a/Lib/test/test_urlparse.py b/Lib/test/test_urlparse.py
-index e6638aee22..c262354494 100644
---- a/Lib/test/test_urlparse.py
-+++ b/Lib/test/test_urlparse.py
-@@ -1001,6 +1001,12 @@ class UrlParseTestCase(unittest.TestCase):
-         self.assertIn('\u2100', denorm_chars)
-         self.assertIn('\uFF03', denorm_chars)
- 
-+        # bpo-36742: Verify port separators are ignored when they
-+        # existed prior to decomposition
-+        urllib.parse.urlsplit('http://\u30d5\u309a:80')
-+        with self.assertRaises(ValueError):
-+            urllib.parse.urlsplit('http://\u30d5\u309a\ufe1380')
-+
-         for scheme in ["http", "https", "ftp"]:
-             for c in denorm_chars:
-                 url = "{}://netloc{}false.netloc/path".format(scheme, c)
-diff --git a/Lib/urllib/parse.py b/Lib/urllib/parse.py
-index 1eec26e0f1..f5b3487ea9 100644
---- a/Lib/urllib/parse.py
-+++ b/Lib/urllib/parse.py
-@@ -397,13 +397,16 @@ def _checknetloc(netloc):
-     # looking for characters like \u2100 that expand to 'a/c'
-     # IDNA uses NFKC equivalence, so normalize for this check
-     import unicodedata
--    netloc2 = unicodedata.normalize('NFKC', netloc)
--    if netloc == netloc2:
-+    n = netloc.rpartition('@')[2] # ignore anything to the left of '@'
-+    n = n.replace(':', '')        # ignore characters already included
-+    n = n.replace('#', '')        # but not the surrounding text
-+    n = n.replace('?', '')
-+    netloc2 = unicodedata.normalize('NFKC', n)
-+    if n == netloc2:
-         return
--    _, _, netloc = netloc.rpartition('@') # anything to the left of '@' is okay
-     for c in '/?#@:':
-         if c in netloc2:
--            raise ValueError("netloc '" + netloc2 + "' contains invalid " +
-+            raise ValueError("netloc '" + netloc + "' contains invalid " +
-                              "characters under NFKC normalization")
- 
- def urlsplit(url, scheme='', allow_fragments=True):
-diff --git a/Misc/NEWS.d/next/Security/2019-04-29-15-34-59.bpo-36742.QCUY0i.rst b/Misc/NEWS.d/next/Security/2019-04-29-15-34-59.bpo-36742.QCUY0i.rst
-new file mode 100644
-index 0000000000..d729ed2f3c
---- /dev/null
-+++ b/Misc/NEWS.d/next/Security/2019-04-29-15-34-59.bpo-36742.QCUY0i.rst
-@@ -0,0 +1 @@
-+Fixes mishandling of pre-normalization characters in urlsplit().
--- 
-2.11.0
-
diff --git a/package/python3/0034-bpo-36742-Corrects-fix-to-handle-decomposition-in-us.patch b/package/python3/0034-bpo-36742-Corrects-fix-to-handle-decomposition-in-us.patch
deleted file mode 100644
index 653d4116c9..0000000000
--- a/package/python3/0034-bpo-36742-Corrects-fix-to-handle-decomposition-in-us.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 250b62acc59921d399f0db47db3b462cd6037e09 Mon Sep 17 00:00:00 2001
-From: "Miss Islington (bot)"
- <31488909+miss-islington@users.noreply.github.com>
-Date: Tue, 4 Jun 2019 09:15:13 -0700
-Subject: [PATCH] bpo-36742: Corrects fix to handle decomposition in usernames
- (GH-13812)
-
-(cherry picked from commit 8d0ef0b5edeae52960c7ed05ae8a12388324f87e)
-
-Co-authored-by: Steve Dower <steve.dower@python.org>
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- Lib/test/test_urlparse.py | 11 ++++++-----
- Lib/urllib/parse.py       |  6 +++---
- 2 files changed, 9 insertions(+), 8 deletions(-)
-
-diff --git a/Lib/test/test_urlparse.py b/Lib/test/test_urlparse.py
-index c262354494..68f633ca3a 100644
---- a/Lib/test/test_urlparse.py
-+++ b/Lib/test/test_urlparse.py
-@@ -1008,11 +1008,12 @@ class UrlParseTestCase(unittest.TestCase):
-             urllib.parse.urlsplit('http://\u30d5\u309a\ufe1380')
- 
-         for scheme in ["http", "https", "ftp"]:
--            for c in denorm_chars:
--                url = "{}://netloc{}false.netloc/path".format(scheme, c)
--                with self.subTest(url=url, char='{:04X}'.format(ord(c))):
--                    with self.assertRaises(ValueError):
--                        urllib.parse.urlsplit(url)
-+            for netloc in ["netloc{}false.netloc", "n{}user at netloc"]:
-+                for c in denorm_chars:
-+                    url = "{}://{}/path".format(scheme, netloc.format(c))
-+                    with self.subTest(url=url, char='{:04X}'.format(ord(c))):
-+                        with self.assertRaises(ValueError):
-+                            urllib.parse.urlsplit(url)
- 
- class Utility_Tests(unittest.TestCase):
-     """Testcase to test the various utility functions in the urllib."""
-diff --git a/Lib/urllib/parse.py b/Lib/urllib/parse.py
-index f5b3487ea9..4c8e77fe39 100644
---- a/Lib/urllib/parse.py
-+++ b/Lib/urllib/parse.py
-@@ -397,9 +397,9 @@ def _checknetloc(netloc):
-     # looking for characters like \u2100 that expand to 'a/c'
-     # IDNA uses NFKC equivalence, so normalize for this check
-     import unicodedata
--    n = netloc.rpartition('@')[2] # ignore anything to the left of '@'
--    n = n.replace(':', '')        # ignore characters already included
--    n = n.replace('#', '')        # but not the surrounding text
-+    n = netloc.replace('@', '')   # ignore characters already included
-+    n = n.replace(':', '')        # but not the surrounding text
-+    n = n.replace('#', '')
-     n = n.replace('?', '')
-     netloc2 = unicodedata.normalize('NFKC', n)
-     if n == netloc2:
--- 
-2.11.0
-
diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index d5209c23cc..4a82e1dd9c 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,5 @@
-# From https://www.python.org/downloads/release/python-373/
-md5		93df27aec0cd18d6d42173e601ffbbfd Python-3.7.3.tar.xz
+# From https://www.python.org/downloads/release/python-374/
+md5		d33e4aae66097051c2eca45ee3604803 Python-3.7.4.tar.xz
 # Locally computed
-sha256 da60b54064d4cfcd9c26576f6df2690e62085123826cff2e667e72a91952d318 Python-3.7.3.tar.xz
+sha256 fb799134b868199930b75f26678f18932214042639cd52b16da7fd134cd9b13f Python-3.7.4.tar.xz
 sha256 a77d71d6be6f9032e6b6e5d2cf6da68f9eeab9036edfbc043633c8979cd5e82c LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index ca834059fb..decae1b721 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.7
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).3
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).4
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
