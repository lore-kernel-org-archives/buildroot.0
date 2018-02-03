From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Feb 2018 08:26:16 +0100
Subject: [Buildroot] [git commit] python3: bump to 2.6.4
Message-ID: <20180203072712.C881F839F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=233202597d9411399aeaded2f9a7cd14f2e29833
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also update necessary patches.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...1-Make-the-build-of-pyc-files-conditional.patch |  6 ++--
 ...ructure-to-disable-the-build-of-certain-e.patch |  6 ++--
 ...n-t-look-in-usr-lib-termcap-for-libraries.patch |  4 ++-
 .../python3/0006-Don-t-add-multiarch-paths.patch   |  4 ++-
 .../0007-Abort-on-failed-module-build.patch        |  4 ++-
 ...-config.sh.in-ensure-sed-invocations-only.patch | 39 +++++++++++++---------
 ...stem-locale-and-set-to-default-when-addin.patch |  4 ++-
 ...on-to-disable-installation-of-test-module.patch |  6 ++--
 .../0014-Add-an-option-to-disable-pydoc.patch      | 12 ++++---
 .../0015-Add-an-option-to-disable-lib2to3.patch    | 14 ++++----
 ...-Add-option-to-disable-the-sqlite3-module.patch |  8 +++--
 ...17-Add-an-option-to-disable-the-tk-module.patch |  8 +++--
 ...dd-an-option-to-disable-the-curses-module.patch |  6 ++--
 .../0019-Add-an-option-to-disable-expat.patch      | 10 +++---
 .../0023-Add-an-option-to-disable-IDLE.patch       | 10 +++---
 .../0024-Add-an-option-to-disable-decimal.patch    |  4 ++-
 ...29-python-config.sh-don-t-reassign-prefix.patch | 24 +++++++------
 package/python3/python3.hash                       |  6 ++--
 package/python3/python3.mk                         |  2 +-
 19 files changed, 109 insertions(+), 68 deletions(-)

diff --git a/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch b/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
index 4a8e4e8296..f85450c7c2 100644
--- a/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
+++ b/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
@@ -9,6 +9,8 @@ the compilation of pyc.
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 [ Andrey Smrinov: ported to Python 3.6 ]
 Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
+[aduskett at gmail.com: Update for python 3.6.4]
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
 ---
  Makefile.pre.in | 2 ++
  configure.ac    | 6 ++++++
@@ -18,7 +20,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index 82e830727e..b38bd79121 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1311,6 +1311,7 @@ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
+@@ -1345,6 +1345,7 @@ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
  		$(INSTALL_DATA) $(srcdir)/Modules/xxmodule.c \
  			$(DESTDIR)$(LIBDEST)/distutils/tests ; \
  	fi
@@ -26,7 +28,7 @@ index 82e830727e..b38bd79121 100644
  	-PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
  		$(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py \
  		-d $(LIBDEST) -f \
-@@ -1338,6 +1339,7 @@ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
+@@ -1372,6 +1373,7 @@ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
  		$(PYTHON_FOR_BUILD) -Wi -OO $(DESTDIR)$(LIBDEST)/compileall.py \
  		-d $(LIBDEST)/site-packages -f \
  		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
diff --git a/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch b/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch
index 76555d290f..4a409ac89f 100644
--- a/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch
+++ b/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch
@@ -37,6 +37,8 @@ then extended by Thomas Petazzoni
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 [ Andrey Smirnov: ported to Python 3.6 ]
 Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
+[aduskett at gmail.com: Update for python 3.6.4]
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
 ---
  Makefile.pre.in | 6 +++++-
  configure.ac    | 2 ++
@@ -56,7 +58,7 @@ index b38bd79121..4ce917ab8d 100644
  
  # Subdirectories with code
  SRCDIRS= 	@SRCDIRS@
-@@ -575,6 +577,7 @@ sharedmods: $(BUILDPYTHON) pybuilddir.txt Modules/_math.o
+@@ -586,6 +588,7 @@ sharedmods: $(BUILDPYTHON) pybuilddir.txt Modules/_math.o
  	esac; \
  	$(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' \
  		_TCLTK_INCLUDES='$(TCLTK_INCLUDES)' _TCLTK_LIBS='$(TCLTK_LIBS)' \
@@ -64,7 +66,7 @@ index b38bd79121..4ce917ab8d 100644
  		$(PYTHON_FOR_BUILD) $(srcdir)/setup.py $$quiet build
  
  
-@@ -1436,7 +1439,8 @@ libainstall:	@DEF_MAKE_RULE@ python-config
+@@ -1470,7 +1473,8 @@ libainstall:	@DEF_MAKE_RULE@ python-config
  # Install the dynamically loadable modules
  # This goes into $(exec_prefix)
  sharedinstall: sharedmods
diff --git a/package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch b/package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch
index 250d6ec538..1e29f22bb8 100644
--- a/package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch
+++ b/package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch
@@ -4,6 +4,8 @@ Date: Wed, 23 Dec 2015 11:36:00 +0100
 Subject: [PATCH] Don't look in /usr/lib/termcap for libraries
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[aduskett at gmail.com: Update for python 3.6.4]
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
 ---
  setup.py | 5 +----
  1 file changed, 1 insertion(+), 4 deletions(-)
@@ -12,7 +14,7 @@ diff --git a/setup.py b/setup.py
 index 86643ae8bf..cd00fbdbda 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -786,12 +786,9 @@ class PyBuildExt(build_ext):
+@@ -816,12 +816,9 @@ class PyBuildExt(build_ext):
                  pass # Issue 7384: Already linked against curses or tinfo.
              elif curses_library:
                  readline_libs.append(curses_library)
diff --git a/package/python3/0006-Don-t-add-multiarch-paths.patch b/package/python3/0006-Don-t-add-multiarch-paths.patch
index 220c54cde8..4ff2a75bee 100644
--- a/package/python3/0006-Don-t-add-multiarch-paths.patch
+++ b/package/python3/0006-Don-t-add-multiarch-paths.patch
@@ -12,6 +12,8 @@ cross-compiling.
 Investigation done by David <buildroot-2014@inbox.com>.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[aduskett at gmail.com: Update for python 3.6.4]
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
 ---
  setup.py | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -20,7 +22,7 @@ diff --git a/setup.py b/setup.py
 index cd00fbdbda..c956fa08d1 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -497,10 +497,10 @@ class PyBuildExt(build_ext):
+@@ -522,10 +522,10 @@ class PyBuildExt(build_ext):
          if not cross_compiling:
              add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
              add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
diff --git a/package/python3/0007-Abort-on-failed-module-build.patch b/package/python3/0007-Abort-on-failed-module-build.patch
index a44d6b3ec3..3da6604ced 100644
--- a/package/python3/0007-Abort-on-failed-module-build.patch
+++ b/package/python3/0007-Abort-on-failed-module-build.patch
@@ -9,6 +9,8 @@ nice behavior, so this patch changes setup.py to abort with an error,
 so that the build issue is clearly noticeable.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[aduskett at gmail.com: Update for python 3.6.4]
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
 ---
  setup.py | 1 +
  1 file changed, 1 insertion(+)
@@ -17,7 +19,7 @@ diff --git a/setup.py b/setup.py
 index c956fa08d1..b3add2be76 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -312,6 +312,7 @@ class PyBuildExt(build_ext):
+@@ -337,6 +337,7 @@ class PyBuildExt(build_ext):
              print("Failed to build these modules:")
              print_three_column(failed)
              print()
diff --git a/package/python3/0010-Misc-python-config.sh.in-ensure-sed-invocations-only.patch b/package/python3/0010-Misc-python-config.sh.in-ensure-sed-invocations-only.patch
index 786e958751..44d9fe2d2e 100644
--- a/package/python3/0010-Misc-python-config.sh.in-ensure-sed-invocations-only.patch
+++ b/package/python3/0010-Misc-python-config.sh.in-ensure-sed-invocations-only.patch
@@ -20,41 +20,50 @@ ensuring we only match the beginning of the string.
 Submitted upstream: http://bugs.python.org/issue22907
 
 Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+[aduskett at gmail.com: Update for python 3.6.4]
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
 ---
- Misc/python-config.sh.in | 12 ++++++------
- 1 file changed, 6 insertions(+), 6 deletions(-)
+ Misc/python-config.sh.in | 13 +++++++------
+ 1 file changed, 7 insertions(+), 6 deletions(-)
 
 diff --git a/Misc/python-config.sh.in b/Misc/python-config.sh.in
-index 30c6927871..f905a7132f 100644
+index d1d3275..9e259c0 100644
 --- a/Misc/python-config.sh.in
 +++ b/Misc/python-config.sh.in
-@@ -29,12 +29,12 @@ prefix_real=$(installed_prefix "$0")
+@@ -24,18 +24,19 @@ installed_prefix ()
+     echo $RESULT
+ }
+ 
++prefix_build="@prefix@"
+ prefix_real=$(installed_prefix "$0")
  
  # Use sed to fix paths from their built-to locations to their installed-to
- # locations.
--prefix=$(echo "$prefix_build" | sed "s#$prefix_build#$prefix_real#")
+ # locations. Keep prefix & exec_prefix using their original values in case
+ # they are referenced in other configure variables, to prevent double
+ # substitution, issue #22140.
+-prefix="@prefix@"
+-exec_prefix="@exec_prefix@"
 +prefix=$(echo "$prefix_build" | sed "s#^$prefix_build#$prefix_real#")
- exec_prefix_build="@exec_prefix@"
--exec_prefix=$(echo "$exec_prefix_build" | sed "s#$exec_prefix_build#$prefix_real#")
--includedir=$(echo "@includedir@" | sed "s#$prefix_build#$prefix_real#")
--libdir=$(echo "@libdir@" | sed "s#$prefix_build#$prefix_real#")
--CFLAGS=$(echo "@CFLAGS@" | sed "s#$prefix_build#$prefix_real#")
 +exec_prefix=$(echo "$exec_prefix_build" | sed "s#^$exec_prefix_build#$prefix_real#")
+ exec_prefix_real=${prefix_real}
+-includedir=$(echo "@includedir@" | sed "s#$prefix#$prefix_real#")
+-libdir=$(echo "@libdir@" | sed "s#$prefix#$prefix_real#")
+-CFLAGS=$(echo "@CFLAGS@" | sed "s#$prefix#$prefix_real#")
 +includedir=$(echo "@includedir@" | sed "s#^$prefix_build#$prefix_real#")
 +libdir=$(echo "@libdir@" | sed "s#^$prefix_build#$prefix_real#")
 +CFLAGS=$(echo "@CFLAGS@" | sed "s#^$prefix_build#$prefix_real#")
  VERSION="@VERSION@"
  LIBM="@LIBM@"
  LIBC="@LIBC@"
-@@ -48,7 +48,7 @@ OPT="@OPT@"
+@@ -49,7 +50,7 @@ OPT="@OPT@"
  PY_ENABLE_SHARED="@PY_ENABLE_SHARED@"
  LDVERSION="@LDVERSION@"
- LIBDEST=${prefix}/lib/python${VERSION}
--LIBPL=$(echo "@LIBPL@" | sed "s#$prefix_build#$prefix_real#")
+ LIBDEST=${prefix_real}/lib/python${VERSION}
+-LIBPL=$(echo "@LIBPL@" | sed "s#$prefix#$prefix_real#")
 +LIBPL=$(echo "@LIBPL@" | sed "s#^$prefix_build#$prefix_real#")
  SO="@EXT_SUFFIX@"
  PYTHONFRAMEWORK="@PYTHONFRAMEWORK@"
  INCDIR="-I$includedir/python${VERSION}${ABIFLAGS}"
 -- 
-2.13.5
+2.14.3
 
diff --git a/package/python3/0011-Override-system-locale-and-set-to-default-when-addin.patch b/package/python3/0011-Override-system-locale-and-set-to-default-when-addin.patch
index 1c1484011f..6f2e4ae854 100644
--- a/package/python3/0011-Override-system-locale-and-set-to-default-when-addin.patch
+++ b/package/python3/0011-Override-system-locale-and-set-to-default-when-addin.patch
@@ -15,6 +15,8 @@ any system library (eg. libz, libssl, etc.)
 
 Signed-off-by: Samuel Cabrero <samuelcabrero@gmail.com>
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[aduskett at gmail.com: Update for python 3.6.4]
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
 ---
  setup.py | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -23,7 +25,7 @@ diff --git a/setup.py b/setup.py
 index b3add2be76..29bfd174d2 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -457,7 +457,7 @@ class PyBuildExt(build_ext):
+@@ -482,7 +482,7 @@ class PyBuildExt(build_ext):
          tmpfile = os.path.join(self.build_temp, 'gccpaths')
          if not os.path.exists(self.build_temp):
              os.makedirs(self.build_temp)
diff --git a/package/python3/0013-Add-an-option-to-disable-installation-of-test-module.patch b/package/python3/0013-Add-an-option-to-disable-installation-of-test-module.patch
index fc27eda115..7f48dcbbe3 100644
--- a/package/python3/0013-Add-an-option-to-disable-installation-of-test-module.patch
+++ b/package/python3/0013-Add-an-option-to-disable-installation-of-test-module.patch
@@ -10,6 +10,8 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 [ Andrey Smirnov: ported to Python 3.6 ]
 Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
+[aduskett at gmail.com: Update for python 3.6.4]
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
 ---
  Makefile.pre.in | 55 ++++++++++++++++++++++++++++++++++++-------------------
  configure.ac    |  5 +++++
@@ -19,7 +21,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index 4ce917ab8d..4110fff4ac 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1194,8 +1194,28 @@ maninstall:	altmaninstall
+@@ -1226,8 +1226,28 @@ maninstall:	altmaninstall
  
  # Install the library
  XMLLIBSUBDIRS=  xml xml/dom xml/etree xml/parsers xml/sax
@@ -50,7 +52,7 @@ index 4ce917ab8d..4110fff4ac 100644
  		test/audiodata \
  		test/capath test/data \
  		test/cjkencodings test/decimaltestdata test/xmltestdata \
-@@ -1229,29 +1249,26 @@ LIBSUBDIRS=	tkinter tkinter/test tkinter/test/test_tkinter \
+@@ -1263,29 +1283,26 @@ LIBSUBDIRS=	tkinter tkinter/test tkinter/test/test_tkinter \
  		test/test_importlib/namespace_pkgs/project3/parent/child \
                  test/test_importlib/namespace_pkgs/module_and_namespace_package \
                  test/test_importlib/namespace_pkgs/module_and_namespace_package/a_test \
diff --git a/package/python3/0014-Add-an-option-to-disable-pydoc.patch b/package/python3/0014-Add-an-option-to-disable-pydoc.patch
index fc565cfe10..36d4cf2172 100644
--- a/package/python3/0014-Add-an-option-to-disable-pydoc.patch
+++ b/package/python3/0014-Add-an-option-to-disable-pydoc.patch
@@ -10,6 +10,8 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 [ Andrey Smirnov: ported to Python 3.6 ]
 Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
+[aduskett at gmail.com: Update for python 3.6.4]
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
 ---
  Makefile.pre.in | 8 +++++++-
  configure.ac    | 6 ++++++
@@ -20,7 +22,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index 4110fff4ac..badb2af35d 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1164,7 +1164,9 @@ bininstall: altbininstall
+@@ -1196,7 +1196,9 @@ bininstall: altbininstall
  	-rm -f $(DESTDIR)$(BINDIR)/idle3
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s idle$(VERSION) idle3)
  	-rm -f $(DESTDIR)$(BINDIR)/pydoc3
@@ -30,7 +32,7 @@ index 4110fff4ac..badb2af35d 100644
  	-rm -f $(DESTDIR)$(BINDIR)/2to3
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s 2to3-$(VERSION) 2to3)
  	-rm -f $(DESTDIR)$(BINDIR)/pyvenv
-@@ -1212,7 +1214,7 @@ LIBSUBDIRS=	tkinter site-packages \
+@@ -1244,7 +1246,7 @@ LIBSUBDIRS=	tkinter site-packages \
  		multiprocessing multiprocessing/dummy \
  		unittest \
  		venv venv/scripts venv/scripts/common venv/scripts/posix \
@@ -39,7 +41,7 @@ index 4110fff4ac..badb2af35d 100644
  
  TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
  		tkinter/test/test_ttk test \
-@@ -1269,6 +1271,10 @@ ifeq (@TEST_MODULES@,yes)
+@@ -1303,6 +1305,10 @@ ifeq (@TEST_MODULES@,yes)
  LIBSUBDIRS += $(TESTSUBDIRS)
  endif
  
@@ -71,7 +73,7 @@ diff --git a/setup.py b/setup.py
 index 29bfd174d2..94dd337fef 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -2281,6 +2281,12 @@ def main():
+@@ -2323,6 +2323,12 @@ def main():
      # turn off warnings when deprecated modules are imported
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
@@ -84,7 +86,7 @@ index 29bfd174d2..94dd337fef 100644
      setup(# PyPI Metadata (PEP 301)
            name = "Python",
            version = sys.version.split()[0],
-@@ -2305,8 +2311,7 @@ def main():
+@@ -2347,8 +2353,7 @@ def main():
            # If you change the scripts installed here, you also need to
            # check the PyBuildScripts command above, and change the links
            # created by the bininstall target in Makefile.pre.in
diff --git a/package/python3/0015-Add-an-option-to-disable-lib2to3.patch b/package/python3/0015-Add-an-option-to-disable-lib2to3.patch
index e6a39383e5..703c066a26 100644
--- a/package/python3/0015-Add-an-option-to-disable-lib2to3.patch
+++ b/package/python3/0015-Add-an-option-to-disable-lib2to3.patch
@@ -10,6 +10,8 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 [ Andrey Smirnov: ported to Python 3.6 ]
 Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
+[aduskett at gmail.com: Update for python 3.6.4]
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
 ---
  Makefile.pre.in | 16 ++++++++++++----
  configure.ac    |  6 ++++++
@@ -20,7 +22,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index badb2af35d..931cc3ed07 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1168,7 +1168,9 @@ ifeq (@PYDOC@,yes)
+@@ -1200,7 +1200,9 @@ ifeq (@PYDOC@,yes)
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s pydoc$(VERSION) pydoc3)
  endif
  	-rm -f $(DESTDIR)$(BINDIR)/2to3
@@ -30,7 +32,7 @@ index badb2af35d..931cc3ed07 100644
  	-rm -f $(DESTDIR)$(BINDIR)/pyvenv
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s pyvenv-$(VERSION) pyvenv)
  	if test "x$(LIPO_32BIT_FLAGS)" != "x" ; then \
-@@ -1205,7 +1207,6 @@ LIBSUBDIRS=	tkinter site-packages \
+@@ -1237,7 +1239,6 @@ LIBSUBDIRS=	tkinter site-packages \
  		html json http dbm xmlrpc \
  		sqlite3 \
  		logging csv wsgiref urllib \
@@ -38,7 +40,7 @@ index badb2af35d..931cc3ed07 100644
  		ctypes ctypes/macholib \
  		idlelib idlelib/Icons \
  		distutils distutils/command $(XMLLIBSUBDIRS) \
-@@ -1255,9 +1256,6 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
+@@ -1289,9 +1290,6 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
  		test/test_email test/test_email/data \
  		test/test_json \
  		sqlite3/test \
@@ -48,7 +50,7 @@ index badb2af35d..931cc3ed07 100644
  		ctypes/test \
  		idlelib/idle_test \
  		distutils/tests \
-@@ -1267,6 +1265,14 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
+@@ -1301,6 +1303,14 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
  		test/test_tools test/test_warnings test/test_warnings/data \
  		unittest/test unittest/test/testmock
  
@@ -63,7 +65,7 @@ index badb2af35d..931cc3ed07 100644
  ifeq (@TEST_MODULES@,yes)
  LIBSUBDIRS += $(TESTSUBDIRS)
  endif
-@@ -1366,10 +1372,12 @@ ifeq (@PYC_BUILD@,yes)
+@@ -1400,10 +1406,12 @@ ifeq (@PYC_BUILD@,yes)
  		-d $(LIBDEST)/site-packages -f \
  		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
  endif
@@ -97,7 +99,7 @@ diff --git a/setup.py b/setup.py
 index 94dd337fef..76429e1326 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -2282,10 +2282,11 @@ def main():
+@@ -2324,10 +2324,11 @@ def main():
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
  
diff --git a/package/python3/0016-Add-option-to-disable-the-sqlite3-module.patch b/package/python3/0016-Add-option-to-disable-the-sqlite3-module.patch
index 675e8282be..2c998f2ca0 100644
--- a/package/python3/0016-Add-option-to-disable-the-sqlite3-module.patch
+++ b/package/python3/0016-Add-option-to-disable-the-sqlite3-module.patch
@@ -7,6 +7,8 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 [ Andrey Smirnov: ported to Python 3.6 ]
 Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
+[aduskett at gmail.com: Update for python 3.6.4]
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
 ---
  Makefile.pre.in | 7 +++++--
  configure.ac    | 9 +++++++++
@@ -16,7 +18,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index 931cc3ed07..a1ce0712cd 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1205,7 +1205,6 @@ LIBSUBDIRS=	tkinter site-packages \
+@@ -1237,7 +1237,6 @@ LIBSUBDIRS=	tkinter site-packages \
  		email email/mime \
  		ensurepip ensurepip/_bundled \
  		html json http dbm xmlrpc \
@@ -24,7 +26,7 @@ index 931cc3ed07..a1ce0712cd 100644
  		logging csv wsgiref urllib \
  		ctypes ctypes/macholib \
  		idlelib idlelib/Icons \
-@@ -1255,7 +1254,6 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
+@@ -1289,7 +1289,6 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
  		test/test_asyncio \
  		test/test_email test/test_email/data \
  		test/test_json \
@@ -32,7 +34,7 @@ index 931cc3ed07..a1ce0712cd 100644
  		ctypes/test \
  		idlelib/idle_test \
  		distutils/tests \
-@@ -1273,6 +1271,11 @@ TESTSUBDIRS += lib2to3/tests			\
+@@ -1307,6 +1305,11 @@ TESTSUBDIRS += lib2to3/tests			\
  	lib2to3/tests/data/fixers/myfixes
  endif
  
diff --git a/package/python3/0017-Add-an-option-to-disable-the-tk-module.patch b/package/python3/0017-Add-an-option-to-disable-the-tk-module.patch
index 56196416a2..24f408cbb9 100644
--- a/package/python3/0017-Add-an-option-to-disable-the-tk-module.patch
+++ b/package/python3/0017-Add-an-option-to-disable-the-tk-module.patch
@@ -7,6 +7,8 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 [ Andrey Smirnov: ported to Python 3.6 ]
 Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
+[aduskett at gmail.com: Update for python 3.6.4]
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
 ---
  Makefile.pre.in | 11 ++++++++---
  configure.ac    |  9 +++++++++
@@ -16,7 +18,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index a1ce0712cd..dc1e917cc3 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1199,7 +1199,7 @@ maninstall:	altmaninstall
+@@ -1231,7 +1231,7 @@ maninstall:	altmaninstall
  # Install the library
  XMLLIBSUBDIRS=  xml xml/dom xml/etree xml/parsers xml/sax
  
@@ -25,7 +27,7 @@ index a1ce0712cd..dc1e917cc3 100644
  		asyncio \
  		collections concurrent concurrent/futures encodings \
  		email email/mime \
-@@ -1216,8 +1216,7 @@ LIBSUBDIRS=	tkinter site-packages \
+@@ -1248,8 +1248,7 @@ LIBSUBDIRS=	tkinter site-packages \
  		venv venv/scripts venv/scripts/common venv/scripts/posix \
  		curses
  
@@ -35,7 +37,7 @@ index a1ce0712cd..dc1e917cc3 100644
  		test/audiodata \
  		test/capath test/data \
  		test/cjkencodings test/decimaltestdata test/xmltestdata \
-@@ -1263,6 +1262,12 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
+@@ -1297,6 +1296,12 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
  		test/test_tools test/test_warnings test/test_warnings/data \
  		unittest/test unittest/test/testmock
  
diff --git a/package/python3/0018-Add-an-option-to-disable-the-curses-module.patch b/package/python3/0018-Add-an-option-to-disable-the-curses-module.patch
index b68369c16c..273399e4d5 100644
--- a/package/python3/0018-Add-an-option-to-disable-the-curses-module.patch
+++ b/package/python3/0018-Add-an-option-to-disable-the-curses-module.patch
@@ -7,6 +7,8 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 [ Andrey Smirnov: ported to Python 3.6 ]
 Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
+[aduskett at gmail.com: Update for python 3.6.4]
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
 ---
  Makefile.pre.in | 7 +++++--
  configure.ac    | 9 +++++++++
@@ -16,7 +18,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index dc1e917cc3..6a6bc082cd 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1213,8 +1213,7 @@ LIBSUBDIRS=	site-packages \
+@@ -1245,8 +1245,7 @@ LIBSUBDIRS=	site-packages \
  		turtledemo \
  		multiprocessing multiprocessing/dummy \
  		unittest \
@@ -26,7 +28,7 @@ index dc1e917cc3..6a6bc082cd 100644
  
  TESTSUBDIRS=	test \
  		test/audiodata \
-@@ -1268,6 +1267,10 @@ TESTSUBDIRS += tkinter/test tkinter/test/test_tkinter \
+@@ -1302,6 +1301,10 @@ TESTSUBDIRS += tkinter/test tkinter/test/test_tkinter \
  	tkinter/test/test_ttk
  endif
  
diff --git a/package/python3/0019-Add-an-option-to-disable-expat.patch b/package/python3/0019-Add-an-option-to-disable-expat.patch
index 0ec0b21555..6361c1f450 100644
--- a/package/python3/0019-Add-an-option-to-disable-expat.patch
+++ b/package/python3/0019-Add-an-option-to-disable-expat.patch
@@ -13,6 +13,8 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 [ Andrey Smirnov: ported to Python 3.6 ]
 Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
+[aduskett at gmail.com: Update for python 3.6.4]
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
 ---
  Makefile.pre.in |  6 +++++-
  configure.ac    | 18 +++++++++++++-----
@@ -23,7 +25,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index 6a6bc082cd..dc4b92b6fe 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1208,7 +1208,7 @@ LIBSUBDIRS=	site-packages \
+@@ -1240,7 +1240,7 @@ LIBSUBDIRS=	site-packages \
  		logging csv wsgiref urllib \
  		ctypes ctypes/macholib \
  		idlelib idlelib/Icons \
@@ -32,7 +34,7 @@ index 6a6bc082cd..dc4b92b6fe 100644
  		importlib \
  		turtledemo \
  		multiprocessing multiprocessing/dummy \
-@@ -1271,6 +1271,10 @@ ifeq (@CURSES@,yes)
+@@ -1305,6 +1305,10 @@ ifeq (@CURSES@,yes)
  LIBSUBDIRS += curses
  endif
  
@@ -78,7 +80,7 @@ diff --git a/setup.py b/setup.py
 index 76429e1326..38aa5e605e 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -1495,7 +1495,7 @@ class PyBuildExt(build_ext):
+@@ -1525,7 +1525,7 @@ class PyBuildExt(build_ext):
          #
          # More information on Expat can be found at www.libexpat.org.
          #
@@ -86,7 +88,7 @@ index 76429e1326..38aa5e605e 100644
 +        if '--with-expat=system' in sysconfig.get_config_var("CONFIG_ARGS"):
              expat_inc = []
              define_macros = []
-             expat_lib = ['expat']
+             extra_compile_args = []
 -- 
 2.13.5
 
diff --git a/package/python3/0023-Add-an-option-to-disable-IDLE.patch b/package/python3/0023-Add-an-option-to-disable-IDLE.patch
index da77c44899..a1913d54de 100644
--- a/package/python3/0023-Add-an-option-to-disable-IDLE.patch
+++ b/package/python3/0023-Add-an-option-to-disable-IDLE.patch
@@ -9,6 +9,8 @@ much sense to have it into our build.
 Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
 [ Andrey Smirnov: ported to Python 3.6 ]
 Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
+[aduskett at gmail.com: Update for python 3.6.4]
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
 ---
  Makefile.pre.in | 7 ++++++-
  configure.ac    | 6 ++++++
@@ -19,7 +21,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index dc4b92b6fe..3e43066d90 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1162,7 +1162,9 @@ bininstall: altbininstall
+@@ -1194,7 +1194,9 @@ bininstall: altbininstall
  	-rm -f $(DESTDIR)$(LIBPC)/python3.pc
  	(cd $(DESTDIR)$(LIBPC); $(LN) -s python-$(VERSION).pc python3.pc)
  	-rm -f $(DESTDIR)$(BINDIR)/idle3
@@ -29,7 +31,7 @@ index dc4b92b6fe..3e43066d90 100644
  	-rm -f $(DESTDIR)$(BINDIR)/pydoc3
  ifeq (@PYDOC@,yes)
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s pydoc$(VERSION) pydoc3)
-@@ -1207,7 +1209,6 @@ LIBSUBDIRS=	site-packages \
+@@ -1239,7 +1241,6 @@ LIBSUBDIRS=	site-packages \
  		html json http dbm xmlrpc \
  		logging csv wsgiref urllib \
  		ctypes ctypes/macholib \
@@ -37,7 +39,7 @@ index dc4b92b6fe..3e43066d90 100644
  		distutils distutils/command \
  		importlib \
  		turtledemo \
-@@ -1275,6 +1276,10 @@ ifeq (@EXPAT@,yes)
+@@ -1309,6 +1310,10 @@ ifeq (@EXPAT@,yes)
  LIBSUBDIRS += $(XMLLIBSUBDIRS)
  endif
  
@@ -69,7 +71,7 @@ diff --git a/setup.py b/setup.py
 index 38aa5e605e..d642825c1e 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -2282,11 +2282,13 @@ def main():
+@@ -2324,11 +2324,13 @@ def main():
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
  
diff --git a/package/python3/0024-Add-an-option-to-disable-decimal.patch b/package/python3/0024-Add-an-option-to-disable-decimal.patch
index 76ef508409..d11c26206c 100644
--- a/package/python3/0024-Add-an-option-to-disable-decimal.patch
+++ b/package/python3/0024-Add-an-option-to-disable-decimal.patch
@@ -9,6 +9,8 @@ Python whether we want to use the system libmpdec (already installed),
 the libmpdec builtin the Python sources, or no libmpdec at all.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[aduskett at gmail.com: Update for python 3.6.4]
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
 ---
  configure.ac | 17 ++++++++++++-----
  setup.py     |  2 +-
@@ -48,7 +50,7 @@ diff --git a/setup.py b/setup.py
 index d642825c1e..5b98255857 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -2058,7 +2058,7 @@ class PyBuildExt(build_ext):
+@@ -2100,7 +2100,7 @@ class PyBuildExt(build_ext):
      def _decimal_ext(self):
          extra_compile_args = []
          undef_macros = []
diff --git a/package/python3/0029-python-config.sh-don-t-reassign-prefix.patch b/package/python3/0029-python-config.sh-don-t-reassign-prefix.patch
index 49137f27ea..cb6f59bfae 100644
--- a/package/python3/0029-python-config.sh-don-t-reassign-prefix.patch
+++ b/package/python3/0029-python-config.sh-don-t-reassign-prefix.patch
@@ -22,32 +22,34 @@ Fixes failures like the following:
 dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/758858efa97b6273c1b470513f5492258a6d8853
 
 Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
+[aduskett at gmail.com: Update for python 3.6.4]
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
 ---
- Misc/python-config.sh.in | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
+ Misc/python-config.sh.in | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/Misc/python-config.sh.in b/Misc/python-config.sh.in
-index f905a71..e06be0f 100644
+index 9e259c0..8b249d9 100644
 --- a/Misc/python-config.sh.in
 +++ b/Misc/python-config.sh.in
-@@ -29,7 +29,7 @@ prefix_real=$(installed_prefix "$0")
- 
- # Use sed to fix paths from their built-to locations to their installed-to
- # locations.
+@@ -31,7 +31,7 @@ prefix_real=$(installed_prefix "$0")
+ # locations. Keep prefix & exec_prefix using their original values in case
+ # they are referenced in other configure variables, to prevent double
+ # substitution, issue #22140.
 -prefix=$(echo "$prefix_build" | sed "s#^$prefix_build#$prefix_real#")
 +prefix=$prefix_build
- exec_prefix_build="@exec_prefix@"
  exec_prefix=$(echo "$exec_prefix_build" | sed "s#^$exec_prefix_build#$prefix_real#")
+ exec_prefix_real=${prefix_real}
  includedir=$(echo "@includedir@" | sed "s#^$prefix_build#$prefix_real#")
-@@ -47,7 +46,7 @@ LINKFORSHARED="@LINKFORSHARED@"
+@@ -49,7 +49,7 @@ LINKFORSHARED="@LINKFORSHARED@"
  OPT="@OPT@"
  PY_ENABLE_SHARED="@PY_ENABLE_SHARED@"
  LDVERSION="@LDVERSION@"
--LIBDEST=${prefix}/lib/python${VERSION}
+-LIBDEST=${prefix_real}/lib/python${VERSION}
 +LIBDEST=$( echo "${prefix}/lib/python${VERSION}" | sed "s#^$prefix_build#$prefix_real#")
  LIBPL=$(echo "@LIBPL@" | sed "s#^$prefix_build#$prefix_real#")
  SO="@EXT_SUFFIX@"
  PYTHONFRAMEWORK="@PYTHONFRAMEWORK@"
 -- 
-1.8.3.1
+2.14.3
 
diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 33adb188fb..b51ccfdbd1 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,4 +1,4 @@
-# From https://www.python.org/downloads/release/python-363/
-md5 b9c2c36c33fb89bda1fefd37ad5af9be Python-3.6.3.tar.xz
+# From https://www.python.org/downloads/release/python-364/
+md5		1325134dd525b4a2c3272a1a0214dd54	Python-3.6.4.tar.xz
 # Locally computed
-sha256 cda7d967c9a4bfa52337cdf551bcc5cff026b6ac50a8834e568ce4a794ca81da Python-3.6.3.tar.xz
+sha256 159b932bf56aeaa76fd66e7420522d8c8853d486b8567c459b84fe2ed13bcaba Python-3.6.4.tar.xz
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 6e61108661..8a7e36afb8 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.6
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).3
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).4
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
