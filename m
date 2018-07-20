From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 20 Jul 2018 12:10:21 -0400
Subject: [Buildroot] [PATCH v2 1/1] Python3: Bump to 3.7.0
Message-ID: <20180720161021.20030-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Other changes include:
  - Refreshing all necessary patches for 3.7.0

  - Add a hash for the license file.

  - Python no longer has it's own internal libffi, as such, host-libffi is now
    required to build host-python3, and is added as a dependency.

  - A new core module "uuid" is now is added in the Config.in file, and relies
    on util-linux's uuid library.

  - Also, a new patch: 0030-Fix-cross-compiling-the-uuid-module.patch is
    required to fix compiling the uuid module, because the include directory
    search path for uuid.h is hardcoded to /usr/include/uuid, which causes an
    "unsafe for cross-compilation" error during compiling if the host pc has
    uuid headers installed.

    To fix this error, a new variable called uuid_inc_dirs with the original
    path of "/usr/include/uuid" is added to setup.py, then if the environment
    variable STAGING_DIR exists, the STAGING_DIR path is added to the
    beginning of the uuid_inc_dirs variable.

Tested on CentOS6 and Fedora28, All test results passed:
             br-arm-full [1/6]: OK
  br-arm-cortex-a9-glibc [2/6]: OK
   br-arm-cortex-m4-full [3/6]: SKIPPED
          br-x86-64-musl [4/6]: OK
      br-arm-full-static [5/6]: SKIPPED
armv5-ctng-linux-gnueabi [6/6]: OK
6 builds, 2 skipped, 0 build failed, 0 legal-info failed

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
Changes v1 -> v2:
  - Fixed patch name.
  - Removed unnecessary SOB lines in some of the updated patches.

 ...e-the-build-of-pyc-files-conditional.patch |  6 +--
 ...taddrinfo-configure-test-when-cross-.patch |  2 +-
 ...re-to-disable-the-build-of-certain-e.patch | 18 +++++----
 ...y-header-paths-for-cross-compilation.patch |  4 +-
 ...ook-in-usr-lib-termcap-for-libraries.patch |  2 +-
 .../0006-Don-t-add-multiarch-paths.patch      |  2 +-
 .../0007-Abort-on-failed-module-build.patch   |  2 +-
 .../0008-Serial-ioctl-workaround.patch        |  2 +-
 ...ig.sh.in-ensure-sed-invocations-only.patch | 39 ++++++++++++-------
 ...locale-and-set-to-default-when-addin.patch |  2 +-
 ...Add-importlib-fix-for-PEP-3147-issue.patch |  6 +--
 ...-disable-installation-of-test-module.patch | 23 ++++++-----
 .../0014-Add-an-option-to-disable-pydoc.patch | 16 ++++----
 ...015-Add-an-option-to-disable-lib2to3.patch | 18 +++++----
 ...option-to-disable-the-sqlite3-module.patch | 12 +++---
 ...d-an-option-to-disable-the-tk-module.patch |  8 ++--
 ...-option-to-disable-the-curses-module.patch |  6 +--
 .../0019-Add-an-option-to-disable-expat.patch | 12 +++---
 ...-Add-an-option-to-disable-CJK-codecs.patch |  2 +-
 .../0021-Add-an-option-to-disable-NIS.patch   |  2 +-
 ...Add-an-option-to-disable-unicodedata.patch |  2 +-
 .../0023-Add-an-option-to-disable-IDLE.patch  | 10 ++---
 ...024-Add-an-option-to-disable-decimal.patch |  8 ++--
 ...on-to-disable-the-ossaudiodev-module.patch |  2 +-
 ...an-option-to-disable-openssl-support.patch |  2 +-
 ...ption-to-disable-the-readline-module.patch |  2 +-
 ...to-disable-zlib-bzip2-and-xz-modules.patch |  2 +-
 ...thon-config.sh-don-t-reassign-prefix.patch | 24 ++++++------
 ...-Fix-cross-compiling-the-uuid-module.patch | 38 ++++++++++++++++++
 package/python3/Config.in                     | 10 +++++
 package/python3/python3.hash                  |  7 ++--
 package/python3/python3.mk                    | 10 +++--
 32 files changed, 191 insertions(+), 110 deletions(-)
 create mode 100644 package/python3/0030-Fix-cross-compiling-the-uuid-module.patch

diff --git a/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch b/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
index 4a8e4e8296..406f873aac 100644
--- a/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
+++ b/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
@@ -18,7 +18,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index 82e830727e..b38bd79121 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1311,6 +1311,7 @@ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
+@@ -1385,6 +1385,7 @@ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
  		$(INSTALL_DATA) $(srcdir)/Modules/xxmodule.c \
  			$(DESTDIR)$(LIBDEST)/distutils/tests ; \
  	fi
@@ -26,7 +26,7 @@ index 82e830727e..b38bd79121 100644
  	-PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
  		$(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py \
  		-d $(LIBDEST) -f \
-@@ -1338,6 +1339,7 @@ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
+@@ -1412,6 +1413,7 @@ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
  		$(PYTHON_FOR_BUILD) -Wi -OO $(DESTDIR)$(LIBDEST)/compileall.py \
  		-d $(LIBDEST)/site-packages -f \
  		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
@@ -38,7 +38,7 @@ diff --git a/configure.ac b/configure.ac
 index 962006704f..a76b5444df 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1113,6 +1113,12 @@ fi
+@@ -1107,6 +1107,12 @@ fi
  
  AC_MSG_CHECKING(LDLIBRARY)
  
diff --git a/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch b/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
index e997f47693..537e23cbfc 100644
--- a/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
+++ b/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
@@ -13,7 +13,7 @@ diff --git a/configure.ac b/configure.ac
 index a76b5444df..5f87c4db5a 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3939,7 +3939,7 @@ fi
+@@ -3985,7 +3985,7 @@ fi
  
  AC_MSG_RESULT($ac_cv_buggy_getaddrinfo)
  
diff --git a/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch b/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch
index 76555d290f..24b565a776 100644
--- a/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch
+++ b/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch
@@ -37,6 +37,8 @@ then extended by Thomas Petazzoni
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 [ Andrey Smirnov: ported to Python 3.6 ]
 Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
+[aduskett at gmail.com: Update for python 3.7.0]
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
 ---
  Makefile.pre.in | 6 +++++-
  configure.ac    | 2 ++
@@ -47,7 +49,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index b38bd79121..4ce917ab8d 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -190,6 +190,8 @@ FILEMODE=	644
+@@ -196,6 +196,8 @@ FILEMODE=	644
  # configure script arguments
  CONFIG_ARGS=	@CONFIG_ARGS@
  
@@ -56,15 +58,15 @@ index b38bd79121..4ce917ab8d 100644
  
  # Subdirectories with code
  SRCDIRS= 	@SRCDIRS@
-@@ -575,6 +577,7 @@ sharedmods: $(BUILDPYTHON) pybuilddir.txt Modules/_math.o
+@@ -609,6 +611,7 @@ sharedmods: $(BUILDPYTHON) pybuilddir.txt Modules/_math.o
  	esac; \
- 	$(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' \
+ 	echo "$(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' \
  		_TCLTK_INCLUDES='$(TCLTK_INCLUDES)' _TCLTK_LIBS='$(TCLTK_LIBS)' \
 +		DISABLED_EXTENSIONS="$(DISABLED_EXTENSIONS)" \
- 		$(PYTHON_FOR_BUILD) $(srcdir)/setup.py $$quiet build
- 
- 
-@@ -1436,7 +1439,8 @@ libainstall:	@DEF_MAKE_RULE@ python-config
+ 		$(PYTHON_FOR_BUILD) $(srcdir)/setup.py $$quiet build"; \
+ 	$(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' \
+ 		_TCLTK_INCLUDES='$(TCLTK_INCLUDES)' _TCLTK_LIBS='$(TCLTK_LIBS)' \
+@@ -1508,7 +1511,8 @@ libainstall:	@DEF_MAKE_RULE@ python-config
  # Install the dynamically loadable modules
  # This goes into $(exec_prefix)
  sharedinstall: sharedmods
@@ -78,7 +80,7 @@ diff --git a/configure.ac b/configure.ac
 index 5f87c4db5a..d5ee2aedfb 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2810,6 +2810,8 @@ LIBS="$withval $LIBS"
+@@ -2902,6 +2902,8 @@ LIBS="$withval $LIBS"
  
  PKG_PROG_PKG_CONFIG
  
diff --git a/package/python3/0004-Adjust-library-header-paths-for-cross-compilation.patch b/package/python3/0004-Adjust-library-header-paths-for-cross-compilation.patch
index 989943e473..ac00260b7d 100644
--- a/package/python3/0004-Adjust-library-header-paths-for-cross-compilation.patch
+++ b/package/python3/0004-Adjust-library-header-paths-for-cross-compilation.patch
@@ -15,6 +15,8 @@ values, and get correct header/library paths when cross-compiling
 third-party Python modules.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[aduskett at gmail.com: Update for python 3.7.0]
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
 ---
  Lib/distutils/command/build_ext.py |  5 ++++-
  Lib/distutils/sysconfig.py         | 15 +++++++++++----
@@ -61,7 +63,7 @@ index 2bcd1dd288..422c13fa4f 100644
 +    BASE_EXEC_PREFIX = os.path.normpath(sys.base_exec_prefix)
  
  # Path to the base directory of the project. On Windows the binary may
- # live in project/PCBuild/win32 or project/PCBuild/amd64.
+ # live in project/PCbuild/win32 or project/PCbuild/amd64.
 -- 
 2.13.5
 
diff --git a/package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch b/package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch
index 250d6ec538..1579415be7 100644
--- a/package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch
+++ b/package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch
@@ -12,7 +12,7 @@ diff --git a/setup.py b/setup.py
 index 86643ae8bf..cd00fbdbda 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -786,12 +786,9 @@ class PyBuildExt(build_ext):
+@@ -850,12 +850,9 @@ class PyBuildExt(build_ext):
                  pass # Issue 7384: Already linked against curses or tinfo.
              elif curses_library:
                  readline_libs.append(curses_library)
diff --git a/package/python3/0006-Don-t-add-multiarch-paths.patch b/package/python3/0006-Don-t-add-multiarch-paths.patch
index 220c54cde8..71c064ad9c 100644
--- a/package/python3/0006-Don-t-add-multiarch-paths.patch
+++ b/package/python3/0006-Don-t-add-multiarch-paths.patch
@@ -20,7 +20,7 @@ diff --git a/setup.py b/setup.py
 index cd00fbdbda..c956fa08d1 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -497,10 +497,10 @@ class PyBuildExt(build_ext):
+@@ -547,10 +547,10 @@ class PyBuildExt(build_ext):
          if not cross_compiling:
              add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
              add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
diff --git a/package/python3/0007-Abort-on-failed-module-build.patch b/package/python3/0007-Abort-on-failed-module-build.patch
index a44d6b3ec3..f95889df68 100644
--- a/package/python3/0007-Abort-on-failed-module-build.patch
+++ b/package/python3/0007-Abort-on-failed-module-build.patch
@@ -17,7 +17,7 @@ diff --git a/setup.py b/setup.py
 index c956fa08d1..b3add2be76 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -312,6 +312,7 @@ class PyBuildExt(build_ext):
+@@ -358,6 +358,7 @@ class PyBuildExt(build_ext):
              print("Failed to build these modules:")
              print_three_column(failed)
              print()
diff --git a/package/python3/0008-Serial-ioctl-workaround.patch b/package/python3/0008-Serial-ioctl-workaround.patch
index f303bd04db..39d40f025a 100644
--- a/package/python3/0008-Serial-ioctl-workaround.patch
+++ b/package/python3/0008-Serial-ioctl-workaround.patch
@@ -18,7 +18,7 @@ diff --git a/Modules/termios.c b/Modules/termios.c
 index b78d33e688..58b0444565 100644
 --- a/Modules/termios.c
 +++ b/Modules/termios.c
-@@ -9,7 +9,9 @@
+@@ -15,7 +15,9 @@
  #endif
  
  #include <termios.h>
diff --git a/package/python3/0010-Misc-python-config.sh.in-ensure-sed-invocations-only.patch b/package/python3/0010-Misc-python-config.sh.in-ensure-sed-invocations-only.patch
index 786e958751..531091f746 100644
--- a/package/python3/0010-Misc-python-config.sh.in-ensure-sed-invocations-only.patch
+++ b/package/python3/0010-Misc-python-config.sh.in-ensure-sed-invocations-only.patch
@@ -20,41 +20,50 @@ ensuring we only match the beginning of the string.
 Submitted upstream: http://bugs.python.org/issue22907
 
 Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+[aduskett at gmail.com: Update for python 3.7.0]
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
index 1c1484011f..c5b301d434 100644
--- a/package/python3/0011-Override-system-locale-and-set-to-default-when-addin.patch
+++ b/package/python3/0011-Override-system-locale-and-set-to-default-when-addin.patch
@@ -23,7 +23,7 @@ diff --git a/setup.py b/setup.py
 index b3add2be76..29bfd174d2 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -457,7 +457,7 @@ class PyBuildExt(build_ext):
+@@ -514,7 +514,7 @@ class PyBuildExt(build_ext):
          tmpfile = os.path.join(self.build_temp, 'gccpaths')
          if not os.path.exists(self.build_temp):
              os.makedirs(self.build_temp)
diff --git a/package/python3/0012-Add-importlib-fix-for-PEP-3147-issue.patch b/package/python3/0012-Add-importlib-fix-for-PEP-3147-issue.patch
index ed0ca26eb7..5bc9bf498d 100644
--- a/package/python3/0012-Add-importlib-fix-for-PEP-3147-issue.patch
+++ b/package/python3/0012-Add-importlib-fix-for-PEP-3147-issue.patch
@@ -28,7 +28,7 @@ diff --git a/Lib/importlib/_bootstrap_external.py b/Lib/importlib/_bootstrap_ext
 index 9feec50842..3550013d58 100644
 --- a/Lib/importlib/_bootstrap_external.py
 +++ b/Lib/importlib/_bootstrap_external.py
-@@ -275,8 +275,6 @@ def cache_from_source(path, debug_override=None, *, optimization=None):
+@@ -283,8 +283,6 @@ def cache_from_source(path, debug_override=None, *, optimization=None):
      a True value is the same as setting 'optimization' to the empty string
      while a False value is equivalent to setting 'optimization' to '1'.
  
@@ -37,7 +37,7 @@ index 9feec50842..3550013d58 100644
      """
      if debug_override is not None:
          _warnings.warn('the debug_override parameter is deprecated; use '
-@@ -288,10 +286,7 @@ def cache_from_source(path, debug_override=None, *, optimization=None):
+@@ -296,10 +294,7 @@ def cache_from_source(path, debug_override=None, *, optimization=None):
      path = _os.fspath(path)
      head, tail = _path_split(path)
      base, sep, rest = tail.rpartition('.')
@@ -49,7 +49,7 @@ index 9feec50842..3550013d58 100644
      if optimization is None:
          if sys.flags.optimize == 0:
              optimization = ''
-@@ -302,40 +297,17 @@ def cache_from_source(path, debug_override=None, *, optimization=None):
+@@ -310,40 +305,17 @@ def cache_from_source(path, debug_override=None, *, optimization=None):
          if not optimization.isalnum():
              raise ValueError('{!r} is not alphanumeric'.format(optimization))
          almost_filename = '{}.{}{}'.format(almost_filename, _OPT, optimization)
diff --git a/package/python3/0013-Add-an-option-to-disable-installation-of-test-module.patch b/package/python3/0013-Add-an-option-to-disable-installation-of-test-module.patch
index fc27eda115..abe1c75dae 100644
--- a/package/python3/0013-Add-an-option-to-disable-installation-of-test-module.patch
+++ b/package/python3/0013-Add-an-option-to-disable-installation-of-test-module.patch
@@ -10,6 +10,8 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 [ Andrey Smirnov: ported to Python 3.6 ]
 Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
+[aduskett at gmail.com: Update for python 3.7.0]
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
 ---
  Makefile.pre.in | 55 ++++++++++++++++++++++++++++++++++++-------------------
  configure.ac    |  5 +++++
@@ -19,7 +21,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index 4ce917ab8d..4110fff4ac 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1194,8 +1194,28 @@ maninstall:	altmaninstall
+@@ -1251,8 +1251,28 @@ maninstall:	altmaninstall
  
  # Install the library
  XMLLIBSUBDIRS=  xml xml/dom xml/etree xml/parsers xml/sax
@@ -50,10 +52,14 @@ index 4ce917ab8d..4110fff4ac 100644
  		test/audiodata \
  		test/capath test/data \
  		test/cjkencodings test/decimaltestdata test/xmltestdata \
-@@ -1229,29 +1249,26 @@ LIBSUBDIRS=	tkinter tkinter/test tkinter/test/test_tkinter \
- 		test/test_importlib/namespace_pkgs/project3/parent/child \
-                 test/test_importlib/namespace_pkgs/module_and_namespace_package \
-                 test/test_importlib/namespace_pkgs/module_and_namespace_package/a_test \
+diff --git a/Makefile.pre.in b/Makefile.pre.in
+index 1ff2362..194dbfc 100644
+--- a/Makefile.pre.in
++++ b/Makefile.pre.in
+@@ -1326,26 +1326,24 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
+ 		test/test_importlib/source \
+ 		test/test_importlib/zipdata01 \
+ 		test/test_importlib/zipdata02 \
 -		asyncio \
  		test/test_asyncio \
 -		collections concurrent concurrent/futures encodings \
@@ -72,13 +78,10 @@ index 4ce917ab8d..4110fff4ac 100644
 -		ctypes ctypes/test ctypes/macholib \
 -		idlelib idlelib/Icons idlelib/idle_test \
 -		distutils distutils/command distutils/tests $(XMLLIBSUBDIRS) \
--		importlib test/test_importlib test/test_importlib/builtin \
 +		ctypes/test \
 +		idlelib/idle_test \
 +		distutils/tests \
 +		test/test_importlib test/test_importlib/builtin \
- 		test/test_importlib/extension test/test_importlib/frozen \
- 		test/test_importlib/import_ test/test_importlib/source \
  		test/test_tools test/test_warnings test/test_warnings/data \
 -		turtledemo \
 -		multiprocessing multiprocessing/dummy \
@@ -98,8 +101,8 @@ diff --git a/configure.ac b/configure.ac
 index d5ee2aedfb..f924937fe1 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3112,6 +3112,11 @@ if test "$posix_threads" = "yes"; then
-       AC_CHECK_FUNCS(pthread_atfork)
+@@ -3162,6 +3162,11 @@ if test "$posix_threads" = "yes"; then
+       AC_CHECK_FUNCS(pthread_getcpuclockid)
  fi
  
 +AC_SUBST(TEST_MODULES)
diff --git a/package/python3/0014-Add-an-option-to-disable-pydoc.patch b/package/python3/0014-Add-an-option-to-disable-pydoc.patch
index fc565cfe10..bcd9f403fc 100644
--- a/package/python3/0014-Add-an-option-to-disable-pydoc.patch
+++ b/package/python3/0014-Add-an-option-to-disable-pydoc.patch
@@ -10,6 +10,8 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 [ Andrey Smirnov: ported to Python 3.6 ]
 Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
+[aduskett at gmail.com: Update for python 3.7.0]
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
 ---
  Makefile.pre.in | 8 +++++++-
  configure.ac    | 6 ++++++
@@ -20,7 +22,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index 4110fff4ac..badb2af35d 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1164,7 +1164,9 @@ bininstall: altbininstall
+@@ -1221,7 +1221,9 @@ bininstall: altbininstall
  	-rm -f $(DESTDIR)$(BINDIR)/idle3
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s idle$(VERSION) idle3)
  	-rm -f $(DESTDIR)$(BINDIR)/pydoc3
@@ -30,7 +32,7 @@ index 4110fff4ac..badb2af35d 100644
  	-rm -f $(DESTDIR)$(BINDIR)/2to3
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s 2to3-$(VERSION) 2to3)
  	-rm -f $(DESTDIR)$(BINDIR)/pyvenv
-@@ -1212,7 +1214,7 @@ LIBSUBDIRS=	tkinter site-packages \
+@@ -1269,7 +1271,7 @@ LIBSUBDIRS=	tkinter site-packages \
  		multiprocessing multiprocessing/dummy \
  		unittest \
  		venv venv/scripts venv/scripts/common venv/scripts/posix \
@@ -39,7 +41,7 @@ index 4110fff4ac..badb2af35d 100644
  
  TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
  		tkinter/test/test_ttk test \
-@@ -1269,6 +1271,10 @@ ifeq (@TEST_MODULES@,yes)
+@@ -1344,6 +1346,10 @@ ifeq (@TEST_MODULES@,yes)
  LIBSUBDIRS += $(TESTSUBDIRS)
  endif
  
@@ -54,8 +56,8 @@ diff --git a/configure.ac b/configure.ac
 index f924937fe1..1621fa1611 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3112,6 +3112,12 @@ if test "$posix_threads" = "yes"; then
-       AC_CHECK_FUNCS(pthread_atfork)
+@@ -3162,6 +3162,12 @@ if test "$posix_threads" = "yes"; then
+       AC_CHECK_FUNCS(pthread_getcpuclockid)
  fi
  
 +AC_SUBST(PYDOC)
@@ -71,7 +73,7 @@ diff --git a/setup.py b/setup.py
 index 29bfd174d2..94dd337fef 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -2281,6 +2281,12 @@ def main():
+@@ -2332,6 +2332,12 @@ def main():
      # turn off warnings when deprecated modules are imported
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
@@ -84,7 +86,7 @@ index 29bfd174d2..94dd337fef 100644
      setup(# PyPI Metadata (PEP 301)
            name = "Python",
            version = sys.version.split()[0],
-@@ -2305,8 +2311,7 @@ def main():
+@@ -2356,8 +2362,7 @@ def main():
            # If you change the scripts installed here, you also need to
            # check the PyBuildScripts command above, and change the links
            # created by the bininstall target in Makefile.pre.in
diff --git a/package/python3/0015-Add-an-option-to-disable-lib2to3.patch b/package/python3/0015-Add-an-option-to-disable-lib2to3.patch
index e6a39383e5..a649b570d1 100644
--- a/package/python3/0015-Add-an-option-to-disable-lib2to3.patch
+++ b/package/python3/0015-Add-an-option-to-disable-lib2to3.patch
@@ -10,6 +10,8 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 [ Andrey Smirnov: ported to Python 3.6 ]
 Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
+[aduskett at gmail.com: Update for python 3.7.0]
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
 ---
  Makefile.pre.in | 16 ++++++++++++----
  configure.ac    |  6 ++++++
@@ -20,7 +22,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index badb2af35d..931cc3ed07 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1168,7 +1168,9 @@ ifeq (@PYDOC@,yes)
+@@ -1225,7 +1225,9 @@ ifeq (@PYDOC@,yes)
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s pydoc$(VERSION) pydoc3)
  endif
  	-rm -f $(DESTDIR)$(BINDIR)/2to3
@@ -30,7 +32,7 @@ index badb2af35d..931cc3ed07 100644
  	-rm -f $(DESTDIR)$(BINDIR)/pyvenv
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s pyvenv-$(VERSION) pyvenv)
  	if test "x$(LIPO_32BIT_FLAGS)" != "x" ; then \
-@@ -1205,7 +1207,6 @@ LIBSUBDIRS=	tkinter site-packages \
+@@ -1262,7 +1264,6 @@ LIBSUBDIRS=	tkinter site-packages \
  		html json http dbm xmlrpc \
  		sqlite3 \
  		logging csv wsgiref urllib \
@@ -38,7 +40,7 @@ index badb2af35d..931cc3ed07 100644
  		ctypes ctypes/macholib \
  		idlelib idlelib/Icons \
  		distutils distutils/command $(XMLLIBSUBDIRS) \
-@@ -1255,9 +1256,6 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
+@@ -1332,9 +1333,6 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
  		test/test_email test/test_email/data \
  		test/test_json \
  		sqlite3/test \
@@ -48,7 +50,7 @@ index badb2af35d..931cc3ed07 100644
  		ctypes/test \
  		idlelib/idle_test \
  		distutils/tests \
-@@ -1267,6 +1265,14 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
+@@ -1342,6 +1340,14 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
  		test/test_tools test/test_warnings test/test_warnings/data \
  		unittest/test unittest/test/testmock
  
@@ -63,7 +65,7 @@ index badb2af35d..931cc3ed07 100644
  ifeq (@TEST_MODULES@,yes)
  LIBSUBDIRS += $(TESTSUBDIRS)
  endif
-@@ -1366,10 +1372,12 @@ ifeq (@PYC_BUILD@,yes)
+@@ -1441,10 +1447,12 @@ ifeq (@PYC_BUILD@,yes)
  		-d $(LIBDEST)/site-packages -f \
  		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
  endif
@@ -75,12 +77,12 @@ index badb2af35d..931cc3ed07 100644
 +endif
  
  python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
- 	# Substitution happens here, as the completely-expanded BINDIR
+ 	@ # Substitution happens here, as the completely-expanded BINDIR
 diff --git a/configure.ac b/configure.ac
 index 1621fa1611..13b2edf8b7 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3124,6 +3124,12 @@ AC_ARG_ENABLE(test-modules,
+@@ -3174,6 +3174,12 @@ AC_ARG_ENABLE(test-modules,
  	AS_HELP_STRING([--disable-test-modules], [disable test modules]),
  	[ TEST_MODULES="${enableval}" ], [ TEST_MODULES=yes ])
  
@@ -97,7 +99,7 @@ diff --git a/setup.py b/setup.py
 index 94dd337fef..76429e1326 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -2282,10 +2282,11 @@ def main():
+@@ -2333,10 +2333,11 @@ def main():
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
  
diff --git a/package/python3/0016-Add-option-to-disable-the-sqlite3-module.patch b/package/python3/0016-Add-option-to-disable-the-sqlite3-module.patch
index 675e8282be..f6b6b6fc9c 100644
--- a/package/python3/0016-Add-option-to-disable-the-sqlite3-module.patch
+++ b/package/python3/0016-Add-option-to-disable-the-sqlite3-module.patch
@@ -7,6 +7,8 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 [ Andrey Smirnov: ported to Python 3.6 ]
 Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
+[aduskett at gmail.com: Update for python 3.7.0]
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
 ---
  Makefile.pre.in | 7 +++++--
  configure.ac    | 9 +++++++++
@@ -16,7 +18,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index 931cc3ed07..a1ce0712cd 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1205,7 +1205,6 @@ LIBSUBDIRS=	tkinter site-packages \
+@@ -1262,7 +1262,6 @@ LIBSUBDIRS=	tkinter site-packages \
  		email email/mime \
  		ensurepip ensurepip/_bundled \
  		html json http dbm xmlrpc \
@@ -24,7 +26,7 @@ index 931cc3ed07..a1ce0712cd 100644
  		logging csv wsgiref urllib \
  		ctypes ctypes/macholib \
  		idlelib idlelib/Icons \
-@@ -1255,7 +1254,6 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
+@@ -1332,7 +1331,6 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
  		test/test_asyncio \
  		test/test_email test/test_email/data \
  		test/test_json \
@@ -32,7 +34,7 @@ index 931cc3ed07..a1ce0712cd 100644
  		ctypes/test \
  		idlelib/idle_test \
  		distutils/tests \
-@@ -1273,6 +1271,11 @@ TESTSUBDIRS += lib2to3/tests			\
+@@ -1348,6 +1346,11 @@ TESTSUBDIRS += lib2to3/tests			\
  	lib2to3/tests/data/fixers/myfixes
  endif
  
@@ -48,8 +50,8 @@ diff --git a/configure.ac b/configure.ac
 index 13b2edf8b7..d7582cfea4 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3112,6 +3112,15 @@ if test "$posix_threads" = "yes"; then
-       AC_CHECK_FUNCS(pthread_atfork)
+@@ -3162,6 +3162,15 @@ if test "$posix_threads" = "yes"; then
+       AC_CHECK_FUNCS(pthread_getcpuclockid)
  fi
  
 +AC_SUBST(SQLITE3)
diff --git a/package/python3/0017-Add-an-option-to-disable-the-tk-module.patch b/package/python3/0017-Add-an-option-to-disable-the-tk-module.patch
index 56196416a2..96918f022d 100644
--- a/package/python3/0017-Add-an-option-to-disable-the-tk-module.patch
+++ b/package/python3/0017-Add-an-option-to-disable-the-tk-module.patch
@@ -16,7 +16,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index a1ce0712cd..dc1e917cc3 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1199,7 +1199,7 @@ maninstall:	altmaninstall
+@@ -1256,7 +1256,7 @@ maninstall:	altmaninstall
  # Install the library
  XMLLIBSUBDIRS=  xml xml/dom xml/etree xml/parsers xml/sax
  
@@ -25,7 +25,7 @@ index a1ce0712cd..dc1e917cc3 100644
  		asyncio \
  		collections concurrent concurrent/futures encodings \
  		email email/mime \
-@@ -1216,8 +1216,7 @@ LIBSUBDIRS=	tkinter site-packages \
+@@ -1273,8 +1273,7 @@ LIBSUBDIRS=	tkinter site-packages \
  		venv venv/scripts venv/scripts/common venv/scripts/posix \
  		curses
  
@@ -35,7 +35,7 @@ index a1ce0712cd..dc1e917cc3 100644
  		test/audiodata \
  		test/capath test/data \
  		test/cjkencodings test/decimaltestdata test/xmltestdata \
-@@ -1263,6 +1262,12 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
+@@ -1338,6 +1337,12 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
  		test/test_tools test/test_warnings test/test_warnings/data \
  		unittest/test unittest/test/testmock
  
@@ -52,7 +52,7 @@ diff --git a/configure.ac b/configure.ac
 index d7582cfea4..6a56a5b0c1 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3121,6 +3121,15 @@ if test "$SQLITE3" = "no" ; then
+@@ -3171,6 +3171,15 @@ if test "$SQLITE3" = "no" ; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
  fi
  
diff --git a/package/python3/0018-Add-an-option-to-disable-the-curses-module.patch b/package/python3/0018-Add-an-option-to-disable-the-curses-module.patch
index b68369c16c..8205d2fe9d 100644
--- a/package/python3/0018-Add-an-option-to-disable-the-curses-module.patch
+++ b/package/python3/0018-Add-an-option-to-disable-the-curses-module.patch
@@ -16,7 +16,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index dc1e917cc3..6a6bc082cd 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1213,8 +1213,7 @@ LIBSUBDIRS=	site-packages \
+@@ -1270,8 +1270,7 @@ LIBSUBDIRS=	site-packages \
  		turtledemo \
  		multiprocessing multiprocessing/dummy \
  		unittest \
@@ -26,7 +26,7 @@ index dc1e917cc3..6a6bc082cd 100644
  
  TESTSUBDIRS=	test \
  		test/audiodata \
-@@ -1268,6 +1267,10 @@ TESTSUBDIRS += tkinter/test tkinter/test/test_tkinter \
+@@ -1343,6 +1342,10 @@ TESTSUBDIRS += tkinter/test tkinter/test/test_tkinter \
  	tkinter/test/test_ttk
  endif
  
@@ -41,7 +41,7 @@ diff --git a/configure.ac b/configure.ac
 index 6a56a5b0c1..5896b39ff9 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3130,6 +3130,15 @@ if test "$TK" = "no"; then
+@@ -3180,6 +3180,15 @@ if test "$TK" = "no"; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _tkinter"
  fi
  
diff --git a/package/python3/0019-Add-an-option-to-disable-expat.patch b/package/python3/0019-Add-an-option-to-disable-expat.patch
index 0ec0b21555..be609eac6d 100644
--- a/package/python3/0019-Add-an-option-to-disable-expat.patch
+++ b/package/python3/0019-Add-an-option-to-disable-expat.patch
@@ -13,6 +13,8 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 [ Andrey Smirnov: ported to Python 3.6 ]
 Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
+[aduskett at gmail.com: Update for python 3.7.0]
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
 ---
  Makefile.pre.in |  6 +++++-
  configure.ac    | 18 +++++++++++++-----
@@ -23,7 +25,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index 6a6bc082cd..dc4b92b6fe 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1208,7 +1208,7 @@ LIBSUBDIRS=	site-packages \
+@@ -1265,7 +1265,7 @@ LIBSUBDIRS=	site-packages \
  		logging csv wsgiref urllib \
  		ctypes ctypes/macholib \
  		idlelib idlelib/Icons \
@@ -32,7 +34,7 @@ index 6a6bc082cd..dc4b92b6fe 100644
  		importlib \
  		turtledemo \
  		multiprocessing multiprocessing/dummy \
-@@ -1271,6 +1271,10 @@ ifeq (@CURSES@,yes)
+@@ -1346,6 +1346,10 @@ ifeq (@CURSES@,yes)
  LIBSUBDIRS += curses
  endif
  
@@ -47,7 +49,7 @@ diff --git a/configure.ac b/configure.ac
 index 5896b39ff9..6f21482207 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2813,13 +2813,21 @@ PKG_PROG_PKG_CONFIG
+@@ -2905,13 +2905,21 @@ PKG_PROG_PKG_CONFIG
  AC_SUBST(DISABLED_EXTENSIONS)
  
  # Check for use of the system expat library
@@ -78,7 +80,7 @@ diff --git a/setup.py b/setup.py
 index 76429e1326..38aa5e605e 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -1495,7 +1495,7 @@ class PyBuildExt(build_ext):
+@@ -1485,7 +1485,7 @@ class PyBuildExt(build_ext):
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
 
diff --git a/package/python3/0020-Add-an-option-to-disable-CJK-codecs.patch b/package/python3/0020-Add-an-option-to-disable-CJK-codecs.patch
index 6b316d8eba..096278ca49 100644
--- a/package/python3/0020-Add-an-option-to-disable-CJK-codecs.patch
+++ b/package/python3/0020-Add-an-option-to-disable-CJK-codecs.patch
@@ -12,7 +12,7 @@ diff --git a/configure.ac b/configure.ac
 index 6f21482207..c7742faf41 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3129,6 +3129,12 @@ if test "$SQLITE3" = "no" ; then
+@@ -3179,6 +3179,12 @@ if test "$SQLITE3" = "no" ; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
  fi
  
diff --git a/package/python3/0021-Add-an-option-to-disable-NIS.patch b/package/python3/0021-Add-an-option-to-disable-NIS.patch
index f49b23f5c8..ecddd46ec6 100644
--- a/package/python3/0021-Add-an-option-to-disable-NIS.patch
+++ b/package/python3/0021-Add-an-option-to-disable-NIS.patch
@@ -15,7 +15,7 @@ diff --git a/configure.ac b/configure.ac
 index c7742faf41..42a871bb09 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3135,6 +3135,12 @@ AC_ARG_ENABLE(codecs-cjk,
+@@ -3185,6 +3185,12 @@ AC_ARG_ENABLE(codecs-cjk,
  		DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _codecs_kr _codecs_jp _codecs_cn _codecs_tw _codecs_hk _codecs_iso2022"
  	fi])
  
diff --git a/package/python3/0022-Add-an-option-to-disable-unicodedata.patch b/package/python3/0022-Add-an-option-to-disable-unicodedata.patch
index 9c207be680..8d2469215f 100644
--- a/package/python3/0022-Add-an-option-to-disable-unicodedata.patch
+++ b/package/python3/0022-Add-an-option-to-disable-unicodedata.patch
@@ -12,7 +12,7 @@ diff --git a/configure.ac b/configure.ac
 index 42a871bb09..1d610e132b 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3141,6 +3141,12 @@ AC_ARG_ENABLE(nis,
+@@ -3191,6 +3191,12 @@ AC_ARG_ENABLE(nis,
      	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} nis"
    	  fi])
  
diff --git a/package/python3/0023-Add-an-option-to-disable-IDLE.patch b/package/python3/0023-Add-an-option-to-disable-IDLE.patch
index da77c44899..068ff2c1f3 100644
--- a/package/python3/0023-Add-an-option-to-disable-IDLE.patch
+++ b/package/python3/0023-Add-an-option-to-disable-IDLE.patch
@@ -19,7 +19,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index dc4b92b6fe..3e43066d90 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1162,7 +1162,9 @@ bininstall: altbininstall
+@@ -1219,7 +1219,9 @@ bininstall: altbininstall
  	-rm -f $(DESTDIR)$(LIBPC)/python3.pc
  	(cd $(DESTDIR)$(LIBPC); $(LN) -s python-$(VERSION).pc python3.pc)
  	-rm -f $(DESTDIR)$(BINDIR)/idle3
@@ -29,7 +29,7 @@ index dc4b92b6fe..3e43066d90 100644
  	-rm -f $(DESTDIR)$(BINDIR)/pydoc3
  ifeq (@PYDOC@,yes)
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s pydoc$(VERSION) pydoc3)
-@@ -1207,7 +1209,6 @@ LIBSUBDIRS=	site-packages \
+@@ -1264,7 +1266,6 @@ LIBSUBDIRS=	site-packages \
  		html json http dbm xmlrpc \
  		logging csv wsgiref urllib \
  		ctypes ctypes/macholib \
@@ -37,7 +37,7 @@ index dc4b92b6fe..3e43066d90 100644
  		distutils distutils/command \
  		importlib \
  		turtledemo \
-@@ -1275,6 +1276,10 @@ ifeq (@EXPAT@,yes)
+@@ -1350,6 +1351,10 @@ ifeq (@EXPAT@,yes)
  LIBSUBDIRS += $(XMLLIBSUBDIRS)
  endif
  
@@ -52,7 +52,7 @@ diff --git a/configure.ac b/configure.ac
 index 1d610e132b..2699e7ceb1 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3183,6 +3183,12 @@ AC_ARG_ENABLE(lib2to3,
+@@ -3233,6 +3233,12 @@ AC_ARG_ENABLE(lib2to3,
  	AS_HELP_STRING([--disable-lib2to3], [disable lib2to3]),
  	[ LIB2TO3="${enableval}" ], [ LIB2TO3=yes ])
  
@@ -69,7 +69,7 @@ diff --git a/setup.py b/setup.py
 index 38aa5e605e..d642825c1e 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -2282,11 +2282,13 @@ def main():
+@@ -2333,11 +2333,13 @@ def main():
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
  
diff --git a/package/python3/0024-Add-an-option-to-disable-decimal.patch b/package/python3/0024-Add-an-option-to-disable-decimal.patch
index 76ef508409..3dcaac9687 100644
--- a/package/python3/0024-Add-an-option-to-disable-decimal.patch
+++ b/package/python3/0024-Add-an-option-to-disable-decimal.patch
@@ -9,6 +9,8 @@ Python whether we want to use the system libmpdec (already installed),
 the libmpdec builtin the Python sources, or no libmpdec at all.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[aduskett at gmail.com: Update for python 3.7.0]
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
 ---
  configure.ac | 17 ++++++++++++-----
  setup.py     |  2 +-
@@ -18,8 +20,8 @@ diff --git a/configure.ac b/configure.ac
 index 2699e7ceb1..e2c3b6f25c 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2862,13 +2862,20 @@ AC_SUBST(LIBFFI_INCLUDEDIR)
- AC_MSG_RESULT($with_system_ffi)
+@@ -2956,13 +2956,20 @@ fi
+ AC_SUBST(LIBFFI_INCLUDEDIR)
  
  # Check for use of the system libmpdec library
 -AC_MSG_CHECKING(for --with-system-libmpdec)
@@ -48,7 +50,7 @@ diff --git a/setup.py b/setup.py
 index d642825c1e..5b98255857 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -2058,7 +2058,7 @@ class PyBuildExt(build_ext):
+@@ -2010,7 +2010,7 @@ class PyBuildExt(build_ext):
      def _decimal_ext(self):
          extra_compile_args = []
          undef_macros = []
diff --git a/package/python3/0025-Add-an-option-to-disable-the-ossaudiodev-module.patch b/package/python3/0025-Add-an-option-to-disable-the-ossaudiodev-module.patch
index 418936cf0d..83e1e3491a 100644
--- a/package/python3/0025-Add-an-option-to-disable-the-ossaudiodev-module.patch
+++ b/package/python3/0025-Add-an-option-to-disable-the-ossaudiodev-module.patch
@@ -12,7 +12,7 @@ diff --git a/configure.ac b/configure.ac
 index e2c3b6f25c..8e3dded25e 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2877,6 +2877,12 @@ else
+@@ -2971,6 +2971,12 @@ else
  fi
  AC_SUBST(MPDEC)
  
diff --git a/package/python3/0026-Add-an-option-to-disable-openssl-support.patch b/package/python3/0026-Add-an-option-to-disable-openssl-support.patch
index 065e50620d..ad4da1adaa 100644
--- a/package/python3/0026-Add-an-option-to-disable-openssl-support.patch
+++ b/package/python3/0026-Add-an-option-to-disable-openssl-support.patch
@@ -12,7 +12,7 @@ diff --git a/configure.ac b/configure.ac
 index 8e3dded25e..28bcdabd67 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3160,6 +3160,12 @@ AC_ARG_ENABLE(unicodedata,
+@@ -3210,6 +3210,12 @@ AC_ARG_ENABLE(unicodedata,
      	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} unicodedata"
    	  fi])
  
diff --git a/package/python3/0027-Add-an-option-to-disable-the-readline-module.patch b/package/python3/0027-Add-an-option-to-disable-the-readline-module.patch
index eb1967534d..ec399a8d3c 100644
--- a/package/python3/0027-Add-an-option-to-disable-the-readline-module.patch
+++ b/package/python3/0027-Add-an-option-to-disable-the-readline-module.patch
@@ -12,7 +12,7 @@ diff --git a/configure.ac b/configure.ac
 index 28bcdabd67..484f6ebaca 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3166,6 +3166,12 @@ AC_ARG_ENABLE(openssl,
+@@ -3216,6 +3216,12 @@ AC_ARG_ENABLE(openssl,
  	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} ssl _ssl _hashlib"
  	  fi])
  
diff --git a/package/python3/0028-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch b/package/python3/0028-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
index 39330ace62..7753acf726 100644
--- a/package/python3/0028-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
+++ b/package/python3/0028-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
@@ -12,7 +12,7 @@ diff --git a/configure.ac b/configure.ac
 index 484f6ebaca..79538df0cf 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3172,6 +3172,24 @@ AC_ARG_ENABLE(readline,
+@@ -3222,6 +3222,24 @@ AC_ARG_ENABLE(readline,
  	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} readline"
  	  fi])
  
diff --git a/package/python3/0029-python-config.sh-don-t-reassign-prefix.patch b/package/python3/0029-python-config.sh-don-t-reassign-prefix.patch
index 49137f27ea..33458e5be8 100644
--- a/package/python3/0029-python-config.sh-don-t-reassign-prefix.patch
+++ b/package/python3/0029-python-config.sh-don-t-reassign-prefix.patch
@@ -22,32 +22,34 @@ Fixes failures like the following:
 dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/758858efa97b6273c1b470513f5492258a6d8853
 
 Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
+[aduskett at gmail.com: Update for python 3.7.0]
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
 
diff --git a/package/python3/0030-Fix-cross-compiling-the-uuid-module.patch b/package/python3/0030-Fix-cross-compiling-the-uuid-module.patch
new file mode 100644
index 0000000000..406d5f3bb9
--- /dev/null
+++ b/package/python3/0030-Fix-cross-compiling-the-uuid-module.patch
@@ -0,0 +1,38 @@
+From 2e1ee7c65f8ad8ced796cfc5377e93e865e52edf Mon Sep 17 00:00:00 2001
+From: Adam Duskett <aduskett@gmail.com>
+Date: Fri, 20 Jul 2018 10:17:39 -0400
+Subject: [PATCH] Fix cross compiling the uuid module
+
+Python 3.7 has a new _uuid module, however, the include directory search path
+for uuid.h is hardcoded to /usr/include/uuid, which causes an unsafe for
+cross-compilation error during compiling if the host pc has uuid headers
+installed.
+
+To fix this, create a new variable called uuid_inc_dirs with the original path
+of "/usr/include/uuid", then if the environment variable STAGING_DIR exists,
+add the STAGING_DIR to the beginning of the uuid_inc_dirs variable
+
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ setup.py | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index 1a7085c..bc73174 100644
+--- a/setup.py
++++ b/setup.py
+@@ -1627,7 +1627,10 @@ class PyBuildExt(build_ext):
+             missing.append('_tkinter')
+ 
+         # Build the _uuid module if possible
+-        uuid_incs = find_file("uuid.h", inc_dirs, ["/usr/include/uuid"])
++        uuid_inc_dirs = "/usr/include/uuid"
++        if "STAGING_DIR" in os.environ:
++            uuid_inc_dirs = os.environ["STAGING_DIR"] + uuid_inc_dirs
++        uuid_incs = find_file("uuid.h", inc_dirs, [uuid_inc_dirs])
+         if uuid_incs is not None:
+             if self.compiler.find_library_file(lib_dirs, 'uuid'):
+                 uuid_libs = ['uuid']
+-- 
+2.17.1
+
diff --git a/package/python3/Config.in b/package/python3/Config.in
index 623fefe43d..0701d56a6c 100644
--- a/package/python3/Config.in
+++ b/package/python3/Config.in
@@ -88,6 +88,16 @@ config BR2_PACKAGE_PYTHON3_UNICODEDATA
 	  Unicode character database (used by stringprep module)
 	  (large).
 
+config BR2_PACKAGE_PYTHON3_UUID
+	bool "uuid module"
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	help
+	  This module provides immutable UUID objects (the UUID class)
+	  and the functions uuid1(), uuid3(), uuid4(), uuid5() for
+	  generating version 1, 3, 4, and 5 UUIDs as specified in RFC
+	  4122.
+
 config BR2_PACKAGE_PYTHON3_SQLITE
 	bool "sqlite module"
 	select BR2_PACKAGE_SQLITE
diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 33adb188fb..9138ad6b9c 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,4 +1,5 @@
-# From https://www.python.org/downloads/release/python-363/
-md5 b9c2c36c33fb89bda1fefd37ad5af9be Python-3.6.3.tar.xz
+# From https://www.python.org/downloads/release/python-370/
+md5		eb8c2a6b1447d50813c02714af4681f3 Python-3.7.0.tar.xz
 # Locally computed
-sha256 cda7d967c9a4bfa52337cdf551bcc5cff026b6ac50a8834e568ce4a794ca81da Python-3.6.3.tar.xz
+sha256 0382996d1ee6aafe59763426cf0139ffebe36984474d0ec4126dd1c40a8b3549 Python-3.7.0.tar.xz
+sha256 b9a6d9320b8f2693e8d41e496ce56caadacaddcca9be2a64a61749278f425cf2 LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 6e61108661..26545e271a 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON3_VERSION_MAJOR = 3.6
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).3
+PYTHON3_VERSION_MAJOR = 3.7
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).0
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
@@ -47,7 +47,7 @@ HOST_PYTHON3_CONF_ENV += \
 
 PYTHON3_DEPENDENCIES = host-python3 libffi
 
-HOST_PYTHON3_DEPENDENCIES = host-expat host-zlib
+HOST_PYTHON3_DEPENDENCIES = host-expat host-zlib host-libffi
 
 PYTHON3_INSTALL_STAGING = YES
 
@@ -101,6 +101,10 @@ ifneq ($(BR2_PACKAGE_PYTHON3_UNICODEDATA),y)
 PYTHON3_CONF_OPTS += --disable-unicodedata
 endif
 
+ifeq ($(BR2_PACKAGE_PYTHON3_UUID),y)
+PYTHON3_DEPENDENCIES += util-linux
+endif
+
 ifeq ($(BR2_PACKAGE_PYTHON3_BZIP2),y)
 PYTHON3_DEPENDENCIES += bzip2
 else
-- 
2.17.1
