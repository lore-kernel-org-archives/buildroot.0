From: Asaf Kahlon <asafka7@gmail.com>
Date: Tue, 25 Sep 2018 22:28:11 +0300
Subject: [Buildroot] [PATCH 1/1] python3: Downgrade to 3.6.6
In-Reply-To: <20180925180319.24576-1-aduskett@gmail.com>
References: <20180925180319.24576-1-aduskett@gmail.com>
Message-ID: <CALFsTFWZYhJtMqb+ksXtJ=1FPOOm-_ynP-vD_i71ttjBEdC=oA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I disagree with downgrading... Are we really sure the downgrade is needed?
Some patches I sent for python 3.7 packages have already applied (gunicorn,
paramiko etc), I sent a series of patches for pysnmp (
http://patchwork.ozlabs.org/project/buildroot/list/?series=67049), and I
saw you sent a first patch for django (
http://patchwork.ozlabs.org/patch/973261/). So I think we've made a nice
progress until now.
What would be left after that? I think the main packages are crossbar and
twisted. Both have a newer version to upgrade and both seem to have active
repository on github. Maybe it won't be so hard to fix those packages. I
think you should give it a shot before downgrading, but i'm willing to hear
other opinions too.

On Tue, Sep 25, 2018 at 9:03 PM Adam Duskett <aduskett@gmail.com> wrote:

> One of the significant changes with Python3.7 is the keyword "async" is now
> disallowed and throws an error during compiling or runtime. Unfortunately,
> this
> breaks several older packages, and the process to update and test each one
> would take a very long time.
>
> For now, downgrade to python 3.6.6 until there is a better solution to
> fixing
> this problem.
>
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  ...e-the-build-of-pyc-files-conditional.patch |  6 +--
>  ...taddrinfo-configure-test-when-cross-.patch |  2 +-
>  ...re-to-disable-the-build-of-certain-e.patch | 16 ++++----
>  ...y-header-paths-for-cross-compilation.patch |  2 +-
>  ...ook-in-usr-lib-termcap-for-libraries.patch |  2 +-
>  .../0006-Don-t-add-multiarch-paths.patch      |  2 +-
>  .../0007-Abort-on-failed-module-build.patch   |  2 +-
>  .../0008-Serial-ioctl-workaround.patch        |  2 +-
>  ...locale-and-set-to-default-when-addin.patch |  2 +-
>  ...Add-importlib-fix-for-PEP-3147-issue.patch |  6 +--
>  ...-disable-installation-of-test-module.patch | 21 +++++-----
>  .../0014-Add-an-option-to-disable-pydoc.patch | 14 +++----
>  ...015-Add-an-option-to-disable-lib2to3.patch | 16 ++++----
>  ...option-to-disable-the-sqlite3-module.patch | 10 ++---
>  ...d-an-option-to-disable-the-tk-module.patch |  8 ++--
>  ...-option-to-disable-the-curses-module.patch |  6 +--
>  .../0019-Add-an-option-to-disable-expat.patch |  8 ++--
>  ...-Add-an-option-to-disable-CJK-codecs.patch |  2 +-
>  .../0021-Add-an-option-to-disable-NIS.patch   |  2 +-
>  ...Add-an-option-to-disable-unicodedata.patch |  2 +-
>  .../0023-Add-an-option-to-disable-IDLE.patch  | 10 ++---
>  ...024-Add-an-option-to-disable-decimal.patch |  6 +--
>  ...on-to-disable-the-ossaudiodev-module.patch |  2 +-
>  ...an-option-to-disable-openssl-support.patch |  2 +-
>  ...ption-to-disable-the-readline-module.patch |  2 +-
>  ...to-disable-zlib-bzip2-and-xz-modules.patch |  2 +-
>  ...-Fix-cross-compiling-the-uuid-module.patch | 38 -------------------
>  ...fix-building-on-older-distributions.patch} |  0
>  ...Add-an-option-to-disable-uuid-module.patch | 33 ----------------
>  package/python3/Config.in                     | 10 -----
>  package/python3/python3.hash                  |  6 +--
>  package/python3/python3.mk                    | 19 +++++-----
>  32 files changed, 90 insertions(+), 171 deletions(-)
>  delete mode 100644
> package/python3/0030-Fix-cross-compiling-the-uuid-module.patch
>  rename package/python3/{0032-fix-building-on-older-distributions.patch =>
> 0030-fix-building-on-older-distributions.patch} (100%)
>  delete mode 100644
> package/python3/0031-Add-an-option-to-disable-uuid-module.patch
>
> diff --git
> a/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
> b/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
> index 406f873aac..a49ec2717f 100644
> --- a/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
> +++ b/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
> @@ -18,7 +18,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
>  index 82e830727e..b38bd79121 100644
>  --- a/Makefile.pre.in
>  +++ b/Makefile.pre.in
> -@@ -1385,6 +1385,7 @@ libinstall:      build_all
> $(srcdir)/Modules/xxmodule.c
> +@@ -1349,6 +1349,7 @@ libinstall:      build_all
> $(srcdir)/Modules/xxmodule.c
>                 $(INSTALL_DATA) $(srcdir)/Modules/xxmodule.c \
>                         $(DESTDIR)$(LIBDEST)/distutils/tests ; \
>         fi
> @@ -26,7 +26,7 @@ index 82e830727e..b38bd79121 100644
>         -PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
>                 $(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py
> \
>                 -d $(LIBDEST) -f \
> -@@ -1412,6 +1413,7 @@ libinstall:      build_all
> $(srcdir)/Modules/xxmodule.c
> +@@ -1376,6 +1377,7 @@ libinstall:      build_all
> $(srcdir)/Modules/xxmodule.c
>                 $(PYTHON_FOR_BUILD) -Wi -OO
> $(DESTDIR)$(LIBDEST)/compileall.py \
>                 -d $(LIBDEST)/site-packages -f \
>                 -x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
> @@ -38,7 +38,7 @@ diff --git a/configure.ac b/configure.ac
>  index 962006704f..a76b5444df 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -1107,6 +1107,12 @@ fi
> +@@ -1113,6 +1113,12 @@ fi
>
>   AC_MSG_CHECKING(LDLIBRARY)
>
> diff --git
> a/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
> b/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
> index 537e23cbfc..71f25e09dc 100644
> ---
> a/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
> +++
> b/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
> @@ -13,7 +13,7 @@ diff --git a/configure.ac b/configure.ac
>  index a76b5444df..5f87c4db5a 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -3985,7 +3985,7 @@ fi
> +@@ -3982,7 +3982,7 @@ fi
>
>   AC_MSG_RESULT($ac_cv_buggy_getaddrinfo)
>
> diff --git
> a/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch
> b/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch
> index 6e07b292e4..745935ff54 100644
> ---
> a/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch
> +++
> b/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch
> @@ -47,7 +47,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
>  index b38bd79121..4ce917ab8d 100644
>  --- a/Makefile.pre.in
>  +++ b/Makefile.pre.in
> -@@ -196,6 +196,8 @@ FILEMODE=  644
> +@@ -190,6 +190,8 @@ FILEMODE=  644
>   # configure script arguments
>   CONFIG_ARGS=  @CONFIG_ARGS@
>
> @@ -56,15 +56,15 @@ index b38bd79121..4ce917ab8d 100644
>
>   # Subdirectories with code
>   SRCDIRS=      @SRCDIRS@
> -@@ -609,6 +611,7 @@ sharedmods: $(BUILDPYTHON) pybuilddir.txt
> Modules/_math.o
> -       esac; \
> -       echo "$(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)'
> \
> -               _TCLTK_INCLUDES='$(TCLTK_INCLUDES)'
> _TCLTK_LIBS='$(TCLTK_LIBS)' \
> -+              DISABLED_EXTENSIONS="$(DISABLED_EXTENSIONS)" \
> +@@ -589,6 +591,7 @@ _TCLTK_INCLUDES='$(TCLTK_INCLUDES)'
> _TCLTK_LIBS='$(TCLTK_LIBS)' \
>                 $(PYTHON_FOR_BUILD) $(srcdir)/setup.py $$quiet build"; \
>         $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' \
>                 _TCLTK_INCLUDES='$(TCLTK_INCLUDES)'
> _TCLTK_LIBS='$(TCLTK_LIBS)' \
> -@@ -1508,7 +1511,8 @@ libainstall:     @DEF_MAKE_RULE@ python-config
> ++              DISABLED_EXTENSIONS="$(DISABLED_EXTENSIONS)" \
> +               $(PYTHON_FOR_BUILD) $(srcdir)/setup.py $$quiet build
> +
> +
> +@@ -1474,7 +1477,8 @@ libainstall:     @DEF_MAKE_RULE@ python-config
>   # Install the dynamically loadable modules
>   # This goes into $(exec_prefix)
>   sharedinstall: sharedmods
> @@ -78,7 +78,7 @@ diff --git a/configure.ac b/configure.ac
>  index 5f87c4db5a..d5ee2aedfb 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -2902,6 +2902,8 @@ LIBS="$withval $LIBS"
> +@@ -2853,6 +2853,8 @@ LIBS="$withval $LIBS"
>
>   PKG_PROG_PKG_CONFIG
>
> diff --git
> a/package/python3/0004-Adjust-library-header-paths-for-cross-compilation.patch
> b/package/python3/0004-Adjust-library-header-paths-for-cross-compilation.patch
> index 649ab20585..989943e473 100644
> ---
> a/package/python3/0004-Adjust-library-header-paths-for-cross-compilation.patch
> +++
> b/package/python3/0004-Adjust-library-header-paths-for-cross-compilation.patch
> @@ -61,7 +61,7 @@ index 2bcd1dd288..422c13fa4f 100644
>  +    BASE_EXEC_PREFIX = os.path.normpath(sys.base_exec_prefix)
>
>   # Path to the base directory of the project. On Windows the binary may
> - # live in project/PCbuild/win32 or project/PCbuild/amd64.
> + # live in project/PCBuild/win32 or project/PCBuild/amd64.
>  --
>  2.13.5
>
> diff --git
> a/package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch
> b/package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch
> index 1579415be7..e1f0311105 100644
> ---
> a/package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch
> +++
> b/package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch
> @@ -12,7 +12,7 @@ diff --git a/setup.py b/setup.py
>  index 86643ae8bf..cd00fbdbda 100644
>  --- a/setup.py
>  +++ b/setup.py
> -@@ -850,12 +850,9 @@ class PyBuildExt(build_ext):
> +@@ -816,12 +816,9 @@ class PyBuildExt(build_ext):
>                   pass # Issue 7384: Already linked against curses or
> tinfo.
>               elif curses_library:
>                   readline_libs.append(curses_library)
> diff --git a/package/python3/0006-Don-t-add-multiarch-paths.patch
> b/package/python3/0006-Don-t-add-multiarch-paths.patch
> index 71c064ad9c..59b53cb83e 100644
> --- a/package/python3/0006-Don-t-add-multiarch-paths.patch
> +++ b/package/python3/0006-Don-t-add-multiarch-paths.patch
> @@ -20,7 +20,7 @@ diff --git a/setup.py b/setup.py
>  index cd00fbdbda..c956fa08d1 100644
>  --- a/setup.py
>  +++ b/setup.py
> -@@ -547,10 +547,10 @@ class PyBuildExt(build_ext):
> +@@ -522,10 +522,10 @@ class PyBuildExt(build_ext):
>           if not cross_compiling:
>               add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
>               add_dir_to_list(self.compiler.include_dirs,
> '/usr/local/include')
> diff --git a/package/python3/0007-Abort-on-failed-module-build.patch
> b/package/python3/0007-Abort-on-failed-module-build.patch
> index f95889df68..32d46f9ffa 100644
> --- a/package/python3/0007-Abort-on-failed-module-build.patch
> +++ b/package/python3/0007-Abort-on-failed-module-build.patch
> @@ -17,7 +17,7 @@ diff --git a/setup.py b/setup.py
>  index c956fa08d1..b3add2be76 100644
>  --- a/setup.py
>  +++ b/setup.py
> -@@ -358,6 +358,7 @@ class PyBuildExt(build_ext):
> +@@ -337,6 +337,7 @@ class PyBuildExt(build_ext):
>               print("Failed to build these modules:")
>               print_three_column(failed)
>               print()
> diff --git a/package/python3/0008-Serial-ioctl-workaround.patch
> b/package/python3/0008-Serial-ioctl-workaround.patch
> index 39d40f025a..f303bd04db 100644
> --- a/package/python3/0008-Serial-ioctl-workaround.patch
> +++ b/package/python3/0008-Serial-ioctl-workaround.patch
> @@ -18,7 +18,7 @@ diff --git a/Modules/termios.c b/Modules/termios.c
>  index b78d33e688..58b0444565 100644
>  --- a/Modules/termios.c
>  +++ b/Modules/termios.c
> -@@ -15,7 +15,9 @@
> +@@ -9,7 +9,9 @@
>   #endif
>
>   #include <termios.h>
> diff --git
> a/package/python3/0011-Override-system-locale-and-set-to-default-when-addin.patch
> b/package/python3/0011-Override-system-locale-and-set-to-default-when-addin.patch
> index c5b301d434..5a01bbb9e0 100644
> ---
> a/package/python3/0011-Override-system-locale-and-set-to-default-when-addin.patch
> +++
> b/package/python3/0011-Override-system-locale-and-set-to-default-when-addin.patch
> @@ -23,7 +23,7 @@ diff --git a/setup.py b/setup.py
>  index b3add2be76..29bfd174d2 100644
>  --- a/setup.py
>  +++ b/setup.py
> -@@ -514,7 +514,7 @@ class PyBuildExt(build_ext):
> +@@ -482,7 +482,7 @@ class PyBuildExt(build_ext):
>           tmpfile = os.path.join(self.build_temp, 'gccpaths')
>           if not os.path.exists(self.build_temp):
>               os.makedirs(self.build_temp)
> diff --git
> a/package/python3/0012-Add-importlib-fix-for-PEP-3147-issue.patch
> b/package/python3/0012-Add-importlib-fix-for-PEP-3147-issue.patch
> index 5bc9bf498d..ed0ca26eb7 100644
> --- a/package/python3/0012-Add-importlib-fix-for-PEP-3147-issue.patch
> +++ b/package/python3/0012-Add-importlib-fix-for-PEP-3147-issue.patch
> @@ -28,7 +28,7 @@ diff --git a/Lib/importlib/_bootstrap_external.py
> b/Lib/importlib/_bootstrap_ext
>  index 9feec50842..3550013d58 100644
>  --- a/Lib/importlib/_bootstrap_external.py
>  +++ b/Lib/importlib/_bootstrap_external.py
> -@@ -283,8 +283,6 @@ def cache_from_source(path, debug_override=None, *,
> optimization=None):
> +@@ -275,8 +275,6 @@ def cache_from_source(path, debug_override=None, *,
> optimization=None):
>       a True value is the same as setting 'optimization' to the empty
> string
>       while a False value is equivalent to setting 'optimization' to '1'.
>
> @@ -37,7 +37,7 @@ index 9feec50842..3550013d58 100644
>       """
>       if debug_override is not None:
>           _warnings.warn('the debug_override parameter is deprecated; use '
> -@@ -296,10 +294,7 @@ def cache_from_source(path, debug_override=None, *,
> optimization=None):
> +@@ -288,10 +286,7 @@ def cache_from_source(path, debug_override=None, *,
> optimization=None):
>       path = _os.fspath(path)
>       head, tail = _path_split(path)
>       base, sep, rest = tail.rpartition('.')
> @@ -49,7 +49,7 @@ index 9feec50842..3550013d58 100644
>       if optimization is None:
>           if sys.flags.optimize == 0:
>               optimization = ''
> -@@ -310,40 +305,17 @@ def cache_from_source(path, debug_override=None, *,
> optimization=None):
> +@@ -302,40 +297,17 @@ def cache_from_source(path, debug_override=None, *,
> optimization=None):
>           if not optimization.isalnum():
>               raise ValueError('{!r} is not
> alphanumeric'.format(optimization))
>           almost_filename = '{}.{}{}'.format(almost_filename, _OPT,
> optimization)
> diff --git
> a/package/python3/0013-Add-an-option-to-disable-installation-of-test-module.patch
> b/package/python3/0013-Add-an-option-to-disable-installation-of-test-module.patch
> index 35aa73c36f..e5c96e1273 100644
> ---
> a/package/python3/0013-Add-an-option-to-disable-installation-of-test-module.patch
> +++
> b/package/python3/0013-Add-an-option-to-disable-installation-of-test-module.patch
> @@ -19,7 +19,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
>  index 4ce917ab8d..4110fff4ac 100644
>  --- a/Makefile.pre.in
>  +++ b/Makefile.pre.in
> -@@ -1251,8 +1251,28 @@ maninstall:     altmaninstall
> +@@ -1230,8 +1230,28 @@ maninstall:     altmaninstall
>
>   # Install the library
>   XMLLIBSUBDIRS=  xml xml/dom xml/etree xml/parsers xml/sax
> @@ -50,14 +50,10 @@ index 4ce917ab8d..4110fff4ac 100644
>                 test/audiodata \
>                 test/capath test/data \
>                 test/cjkencodings test/decimaltestdata test/xmltestdata \
> -diff --git a/Makefile.pre.in b/Makefile.pre.in
> -index 1ff2362..194dbfc 100644
> ---- a/Makefile.pre.in
> -+++ b/Makefile.pre.in
> -@@ -1326,26 +1326,24 @@ TESTSUBDIRS=   tkinter/test
> tkinter/test/test_tkinter \
> -               test/test_importlib/source \
> -               test/test_importlib/zipdata01 \
> -               test/test_importlib/zipdata02 \
> +@@ -1267,29 +1287,26 @@ LIBSUBDIRS=    tkinter tkinter/test
> tkinter/test/test_tkinter \
> +               test/test_importlib/namespace_pkgs/project3/parent/child \
> +
>  test/test_importlib/namespace_pkgs/module_and_namespace_package \
> +
>  test/test_importlib/namespace_pkgs/module_and_namespace_package/a_test \
>  -              asyncio \
>                 test/test_asyncio \
>  -              collections concurrent concurrent/futures encodings \
> @@ -76,10 +72,13 @@ index 1ff2362..194dbfc 100644
>  -              ctypes ctypes/test ctypes/macholib \
>  -              idlelib idlelib/Icons idlelib/idle_test \
>  -              distutils distutils/command distutils/tests
> $(XMLLIBSUBDIRS) \
> +-              importlib test/test_importlib test/test_importlib/builtin \
>  +              ctypes/test \
>  +              idlelib/idle_test \
>  +              distutils/tests \
>  +              test/test_importlib test/test_importlib/builtin \
> +               test/test_importlib/extension test/test_importlib/frozen \
> +               test/test_importlib/import_ test/test_importlib/source \
>                 test/test_tools test/test_warnings test/test_warnings/data
> \
>  -              turtledemo \
>  -              multiprocessing multiprocessing/dummy \
> @@ -99,8 +98,8 @@ diff --git a/configure.ac b/configure.ac
>  index d5ee2aedfb..f924937fe1 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -3162,6 +3162,11 @@ if test "$posix_threads" = "yes"; then
> -       AC_CHECK_FUNCS(pthread_getcpuclockid)
> +@@ -3155,6 +3155,11 @@ if test "$posix_threads" = "yes"; then
> +       AC_CHECK_FUNCS(pthread_atfork)
>   fi
>
>  +AC_SUBST(TEST_MODULES)
> diff --git a/package/python3/0014-Add-an-option-to-disable-pydoc.patch
> b/package/python3/0014-Add-an-option-to-disable-pydoc.patch
> index 8055009d6c..d07ed24219 100644
> --- a/package/python3/0014-Add-an-option-to-disable-pydoc.patch
> +++ b/package/python3/0014-Add-an-option-to-disable-pydoc.patch
> @@ -20,7 +20,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
>  index 4110fff4ac..badb2af35d 100644
>  --- a/Makefile.pre.in
>  +++ b/Makefile.pre.in
> -@@ -1221,7 +1221,9 @@ bininstall: altbininstall
> +@@ -1200,7 +1200,9 @@ bininstall: altbininstall
>         -rm -f $(DESTDIR)$(BINDIR)/idle3
>         (cd $(DESTDIR)$(BINDIR); $(LN) -s idle$(VERSION) idle3)
>         -rm -f $(DESTDIR)$(BINDIR)/pydoc3
> @@ -30,7 +30,7 @@ index 4110fff4ac..badb2af35d 100644
>         -rm -f $(DESTDIR)$(BINDIR)/2to3
>         (cd $(DESTDIR)$(BINDIR); $(LN) -s 2to3-$(VERSION) 2to3)
>         -rm -f $(DESTDIR)$(BINDIR)/pyvenv
> -@@ -1269,7 +1271,7 @@ LIBSUBDIRS=      tkinter site-packages \
> +@@ -1248,7 +1250,7 @@ LIBSUBDIRS=      tkinter site-packages \
>                 multiprocessing multiprocessing/dummy \
>                 unittest \
>                 venv venv/scripts venv/scripts/common venv/scripts/posix \
> @@ -39,7 +39,7 @@ index 4110fff4ac..badb2af35d 100644
>
>   TESTSUBDIRS=  tkinter/test tkinter/test/test_tkinter \
>                 tkinter/test/test_ttk test \
> -@@ -1344,6 +1346,10 @@ ifeq (@TEST_MODULES@,yes)
> +@@ -1307,6 +1309,10 @@ ifeq (@TEST_MODULES@,yes)
>   LIBSUBDIRS += $(TESTSUBDIRS)
>   endif
>
> @@ -54,8 +54,8 @@ diff --git a/configure.ac b/configure.ac
>  index f924937fe1..1621fa1611 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -3162,6 +3162,12 @@ if test "$posix_threads" = "yes"; then
> -       AC_CHECK_FUNCS(pthread_getcpuclockid)
> +@@ -3155,6 +3155,12 @@ if test "$posix_threads" = "yes"; then
> +       AC_CHECK_FUNCS(pthread_atfork)
>   fi
>
>  +AC_SUBST(PYDOC)
> @@ -71,7 +71,7 @@ diff --git a/setup.py b/setup.py
>  index 29bfd174d2..94dd337fef 100644
>  --- a/setup.py
>  +++ b/setup.py
> -@@ -2332,6 +2332,12 @@ def main():
> +@@ -2367,6 +2367,12 @@ def main():
>       # turn off warnings when deprecated modules are imported
>       import warnings
>       warnings.filterwarnings("ignore",category=DeprecationWarning)
> @@ -84,7 +84,7 @@ index 29bfd174d2..94dd337fef 100644
>       setup(# PyPI Metadata (PEP 301)
>             name = "Python",
>             version = sys.version.split()[0],
> -@@ -2356,8 +2362,7 @@ def main():
> +@@ -2391,8 +2397,7 @@ def main():
>             # If you change the scripts installed here, you also need to
>             # check the PyBuildScripts command above, and change the links
>             # created by the bininstall target in Makefile.pre.in
> diff --git a/package/python3/0015-Add-an-option-to-disable-lib2to3.patch
> b/package/python3/0015-Add-an-option-to-disable-lib2to3.patch
> index 3d3c5de3bf..0ad9a2c544 100644
> --- a/package/python3/0015-Add-an-option-to-disable-lib2to3.patch
> +++ b/package/python3/0015-Add-an-option-to-disable-lib2to3.patch
> @@ -20,7 +20,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
>  index badb2af35d..931cc3ed07 100644
>  --- a/Makefile.pre.in
>  +++ b/Makefile.pre.in
> -@@ -1225,7 +1225,9 @@ ifeq (@PYDOC@,yes)
> +@@ -1204,7 +1204,9 @@ ifeq (@PYDOC@,yes)
>         (cd $(DESTDIR)$(BINDIR); $(LN) -s pydoc$(VERSION) pydoc3)
>   endif
>         -rm -f $(DESTDIR)$(BINDIR)/2to3
> @@ -30,7 +30,7 @@ index badb2af35d..931cc3ed07 100644
>         -rm -f $(DESTDIR)$(BINDIR)/pyvenv
>         (cd $(DESTDIR)$(BINDIR); $(LN) -s pyvenv-$(VERSION) pyvenv)
>         if test "x$(LIPO_32BIT_FLAGS)" != "x" ; then \
> -@@ -1262,7 +1264,6 @@ LIBSUBDIRS=      tkinter site-packages \
> +@@ -1241,7 +1243,6 @@ LIBSUBDIRS=      tkinter site-packages \
>                 html json http dbm xmlrpc \
>                 sqlite3 \
>                 logging csv wsgiref urllib \
> @@ -38,7 +38,7 @@ index badb2af35d..931cc3ed07 100644
>                 ctypes ctypes/macholib \
>                 idlelib idlelib/Icons \
>                 distutils distutils/command $(XMLLIBSUBDIRS) \
> -@@ -1332,9 +1333,6 @@ TESTSUBDIRS=     tkinter/test
> tkinter/test/test_tkinter \
> +@@ -1293,9 +1294,6 @@ TESTSUBDIRS=     tkinter/test
> tkinter/test/test_tkinter \
>                 test/test_email test/test_email/data \
>                 test/test_json \
>                 sqlite3/test \
> @@ -48,7 +48,7 @@ index badb2af35d..931cc3ed07 100644
>                 ctypes/test \
>                 idlelib/idle_test \
>                 distutils/tests \
> -@@ -1342,6 +1340,14 @@ TESTSUBDIRS=    tkinter/test
> tkinter/test/test_tkinter \
> +@@ -1305,6 +1307,14 @@ TESTSUBDIRS=    tkinter/test
> tkinter/test/test_tkinter \
>                 test/test_tools test/test_warnings test/test_warnings/data
> \
>                 unittest/test unittest/test/testmock
>
> @@ -63,7 +63,7 @@ index badb2af35d..931cc3ed07 100644
>   ifeq (@TEST_MODULES@,yes)
>   LIBSUBDIRS += $(TESTSUBDIRS)
>   endif
> -@@ -1441,10 +1447,12 @@ ifeq (@PYC_BUILD@,yes)
> +@@ -1404,10 +1410,12 @@ ifeq (@PYC_BUILD@,yes)
>                 -d $(LIBDEST)/site-packages -f \
>                 -x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
>   endif
> @@ -75,12 +75,12 @@ index badb2af35d..931cc3ed07 100644
>  +endif
>
>   python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
> -       @ # Substitution happens here, as the completely-expanded BINDIR
> +       # Substitution happens here, as the completely-expanded BINDIR
>  diff --git a/configure.ac b/configure.ac
>  index 1621fa1611..13b2edf8b7 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -3174,6 +3174,12 @@ AC_ARG_ENABLE(test-modules,
> +@@ -3167,6 +3167,12 @@ AC_ARG_ENABLE(test-modules,
>         AS_HELP_STRING([--disable-test-modules], [disable test modules]),
>         [ TEST_MODULES="${enableval}" ], [ TEST_MODULES=yes ])
>
> @@ -97,7 +97,7 @@ diff --git a/setup.py b/setup.py
>  index 94dd337fef..76429e1326 100644
>  --- a/setup.py
>  +++ b/setup.py
> -@@ -2333,10 +2333,11 @@ def main():
> +@@ -2368,10 +2368,11 @@ def main():
>       import warnings
>       warnings.filterwarnings("ignore",category=DeprecationWarning)
>
> diff --git
> a/package/python3/0016-Add-option-to-disable-the-sqlite3-module.patch
> b/package/python3/0016-Add-option-to-disable-the-sqlite3-module.patch
> index e5192cc477..377d1301bd 100644
> --- a/package/python3/0016-Add-option-to-disable-the-sqlite3-module.patch
> +++ b/package/python3/0016-Add-option-to-disable-the-sqlite3-module.patch
> @@ -16,7 +16,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
>  index 931cc3ed07..a1ce0712cd 100644
>  --- a/Makefile.pre.in
>  +++ b/Makefile.pre.in
> -@@ -1262,7 +1262,6 @@ LIBSUBDIRS=      tkinter site-packages \
> +@@ -1241,7 +1241,6 @@ LIBSUBDIRS=      tkinter site-packages \
>                 email email/mime \
>                 ensurepip ensurepip/_bundled \
>                 html json http dbm xmlrpc \
> @@ -24,7 +24,7 @@ index 931cc3ed07..a1ce0712cd 100644
>                 logging csv wsgiref urllib \
>                 ctypes ctypes/macholib \
>                 idlelib idlelib/Icons \
> -@@ -1332,7 +1331,6 @@ TESTSUBDIRS=     tkinter/test
> tkinter/test/test_tkinter \
> +@@ -1293,7 +1293,6 @@ TESTSUBDIRS=     tkinter/test
> tkinter/test/test_tkinter \
>                 test/test_asyncio \
>                 test/test_email test/test_email/data \
>                 test/test_json \
> @@ -32,7 +32,7 @@ index 931cc3ed07..a1ce0712cd 100644
>                 ctypes/test \
>                 idlelib/idle_test \
>                 distutils/tests \
> -@@ -1348,6 +1346,11 @@ TESTSUBDIRS += lib2to3/tests                    \
> +@@ -1311,6 +1309,11 @@ TESTSUBDIRS += lib2to3/tests                    \
>         lib2to3/tests/data/fixers/myfixes
>   endif
>
> @@ -48,8 +48,8 @@ diff --git a/configure.ac b/configure.ac
>  index 13b2edf8b7..d7582cfea4 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -3162,6 +3162,15 @@ if test "$posix_threads" = "yes"; then
> -       AC_CHECK_FUNCS(pthread_getcpuclockid)
> +@@ -3155,6 +3155,15 @@ if test "$posix_threads" = "yes"; then
> +       AC_CHECK_FUNCS(pthread_atfork)
>   fi
>
>  +AC_SUBST(SQLITE3)
> diff --git
> a/package/python3/0017-Add-an-option-to-disable-the-tk-module.patch
> b/package/python3/0017-Add-an-option-to-disable-the-tk-module.patch
> index 96918f022d..e73e75c2a5 100644
> --- a/package/python3/0017-Add-an-option-to-disable-the-tk-module.patch
> +++ b/package/python3/0017-Add-an-option-to-disable-the-tk-module.patch
> @@ -16,7 +16,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
>  index a1ce0712cd..dc1e917cc3 100644
>  --- a/Makefile.pre.in
>  +++ b/Makefile.pre.in
> -@@ -1256,7 +1256,7 @@ maninstall:      altmaninstall
> +@@ -1235,7 +1235,7 @@ maninstall:      altmaninstall
>   # Install the library
>   XMLLIBSUBDIRS=  xml xml/dom xml/etree xml/parsers xml/sax
>
> @@ -25,7 +25,7 @@ index a1ce0712cd..dc1e917cc3 100644
>                 asyncio \
>                 collections concurrent concurrent/futures encodings \
>                 email email/mime \
> -@@ -1273,8 +1273,7 @@ LIBSUBDIRS=      tkinter site-packages \
> +@@ -1252,8 +1252,7 @@ LIBSUBDIRS=      tkinter site-packages \
>                 venv venv/scripts venv/scripts/common venv/scripts/posix \
>                 curses
>
> @@ -35,7 +35,7 @@ index a1ce0712cd..dc1e917cc3 100644
>                 test/audiodata \
>                 test/capath test/data \
>                 test/cjkencodings test/decimaltestdata test/xmltestdata \
> -@@ -1338,6 +1337,12 @@ TESTSUBDIRS=    tkinter/test
> tkinter/test/test_tkinter \
> +@@ -1301,6 +1300,12 @@ TESTSUBDIRS=    tkinter/test
> tkinter/test/test_tkinter \
>                 test/test_tools test/test_warnings test/test_warnings/data
> \
>                 unittest/test unittest/test/testmock
>
> @@ -52,7 +52,7 @@ diff --git a/configure.ac b/configure.ac
>  index d7582cfea4..6a56a5b0c1 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -3171,6 +3171,15 @@ if test "$SQLITE3" = "no" ; then
> +@@ -3164,6 +3164,15 @@ if test "$SQLITE3" = "no" ; then
>      DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
>   fi
>
> diff --git
> a/package/python3/0018-Add-an-option-to-disable-the-curses-module.patch
> b/package/python3/0018-Add-an-option-to-disable-the-curses-module.patch
> index 8205d2fe9d..e93b53ecb8 100644
> --- a/package/python3/0018-Add-an-option-to-disable-the-curses-module.patch
> +++ b/package/python3/0018-Add-an-option-to-disable-the-curses-module.patch
> @@ -16,7 +16,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
>  index dc1e917cc3..6a6bc082cd 100644
>  --- a/Makefile.pre.in
>  +++ b/Makefile.pre.in
> -@@ -1270,8 +1270,7 @@ LIBSUBDIRS=      site-packages \
> +@@ -1249,8 +1249,7 @@ LIBSUBDIRS=      site-packages \
>                 turtledemo \
>                 multiprocessing multiprocessing/dummy \
>                 unittest \
> @@ -26,7 +26,7 @@ index dc1e917cc3..6a6bc082cd 100644
>
>   TESTSUBDIRS=  test \
>                 test/audiodata \
> -@@ -1343,6 +1342,10 @@ TESTSUBDIRS += tkinter/test
> tkinter/test/test_tkinter \
> +@@ -1306,6 +1305,10 @@ TESTSUBDIRS += tkinter/test
> tkinter/test/test_tkinter \
>         tkinter/test/test_ttk
>   endif
>
> @@ -41,7 +41,7 @@ diff --git a/configure.ac b/configure.ac
>  index 6a56a5b0c1..5896b39ff9 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -3180,6 +3180,15 @@ if test "$TK" = "no"; then
> +@@ -3173,6 +3173,15 @@ if test "$TK" = "no"; then
>      DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _tkinter"
>   fi
>
> diff --git a/package/python3/0019-Add-an-option-to-disable-expat.patch
> b/package/python3/0019-Add-an-option-to-disable-expat.patch
> index 6057a7f713..6084589f38 100644
> --- a/package/python3/0019-Add-an-option-to-disable-expat.patch
> +++ b/package/python3/0019-Add-an-option-to-disable-expat.patch
> @@ -23,7 +23,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
>  index 6a6bc082cd..dc4b92b6fe 100644
>  --- a/Makefile.pre.in
>  +++ b/Makefile.pre.in
> -@@ -1265,7 +1265,7 @@ LIBSUBDIRS=      site-packages \
> +@@ -1244,7 +1244,7 @@ LIBSUBDIRS=      site-packages \
>                 logging csv wsgiref urllib \
>                 ctypes ctypes/macholib \
>                 idlelib idlelib/Icons \
> @@ -32,7 +32,7 @@ index 6a6bc082cd..dc4b92b6fe 100644
>                 importlib \
>                 turtledemo \
>                 multiprocessing multiprocessing/dummy \
> -@@ -1346,6 +1346,10 @@ ifeq (@CURSES@,yes)
> +@@ -1309,6 +1309,10 @@ ifeq (@CURSES@,yes)
>   LIBSUBDIRS += curses
>   endif
>
> @@ -47,7 +47,7 @@ diff --git a/configure.ac b/configure.ac
>  index 5896b39ff9..6f21482207 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -2905,13 +2905,21 @@ PKG_PROG_PKG_CONFIG
> +@@ -2856,13 +2856,21 @@ PKG_PROG_PKG_CONFIG
>   AC_SUBST(DISABLED_EXTENSIONS)
>
>   # Check for use of the system expat library
> @@ -78,7 +78,7 @@ diff --git a/setup.py b/setup.py
>  index 76429e1326..38aa5e605e 100644
>  --- a/setup.py
>  +++ b/setup.py
> -@@ -1485,7 +1485,7 @@ class PyBuildExt(build_ext):
> +@@ -1519,7 +1519,7 @@ class PyBuildExt(build_ext):
>           #
>           # More information on Expat can be found at www.libexpat.org.
>           #
> diff --git
> a/package/python3/0020-Add-an-option-to-disable-CJK-codecs.patch
> b/package/python3/0020-Add-an-option-to-disable-CJK-codecs.patch
> index 096278ca49..98d937f2dd 100644
> --- a/package/python3/0020-Add-an-option-to-disable-CJK-codecs.patch
> +++ b/package/python3/0020-Add-an-option-to-disable-CJK-codecs.patch
> @@ -12,7 +12,7 @@ diff --git a/configure.ac b/configure.ac
>  index 6f21482207..c7742faf41 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -3179,6 +3179,12 @@ if test "$SQLITE3" = "no" ; then
> +@@ -3172,6 +3172,12 @@ if test "$SQLITE3" = "no" ; then
>      DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
>   fi
>
> diff --git a/package/python3/0021-Add-an-option-to-disable-NIS.patch
> b/package/python3/0021-Add-an-option-to-disable-NIS.patch
> index ecddd46ec6..f39ef1c2e6 100644
> --- a/package/python3/0021-Add-an-option-to-disable-NIS.patch
> +++ b/package/python3/0021-Add-an-option-to-disable-NIS.patch
> @@ -15,7 +15,7 @@ diff --git a/configure.ac b/configure.ac
>  index c7742faf41..42a871bb09 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -3185,6 +3185,12 @@ AC_ARG_ENABLE(codecs-cjk,
> +@@ -3178,6 +3178,12 @@ AC_ARG_ENABLE(codecs-cjk,
>                 DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _codecs_kr
> _codecs_jp _codecs_cn _codecs_tw _codecs_hk _codecs_iso2022"
>         fi])
>
> diff --git
> a/package/python3/0022-Add-an-option-to-disable-unicodedata.patch
> b/package/python3/0022-Add-an-option-to-disable-unicodedata.patch
> index 8d2469215f..c390ad62c1 100644
> --- a/package/python3/0022-Add-an-option-to-disable-unicodedata.patch
> +++ b/package/python3/0022-Add-an-option-to-disable-unicodedata.patch
> @@ -12,7 +12,7 @@ diff --git a/configure.ac b/configure.ac
>  index 42a871bb09..1d610e132b 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -3191,6 +3191,12 @@ AC_ARG_ENABLE(nis,
> +@@ -3184,6 +3184,12 @@ AC_ARG_ENABLE(nis,
>              DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} nis"
>           fi])
>
> diff --git a/package/python3/0023-Add-an-option-to-disable-IDLE.patch
> b/package/python3/0023-Add-an-option-to-disable-IDLE.patch
> index 068ff2c1f3..ae5ec8a443 100644
> --- a/package/python3/0023-Add-an-option-to-disable-IDLE.patch
> +++ b/package/python3/0023-Add-an-option-to-disable-IDLE.patch
> @@ -19,7 +19,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
>  index dc4b92b6fe..3e43066d90 100644
>  --- a/Makefile.pre.in
>  +++ b/Makefile.pre.in
> -@@ -1219,7 +1219,9 @@ bininstall: altbininstall
> +@@ -1198,7 +1198,9 @@ bininstall: altbininstall
>         -rm -f $(DESTDIR)$(LIBPC)/python3.pc
>         (cd $(DESTDIR)$(LIBPC); $(LN) -s python-$(VERSION).pc python3.pc)
>         -rm -f $(DESTDIR)$(BINDIR)/idle3
> @@ -29,7 +29,7 @@ index dc4b92b6fe..3e43066d90 100644
>         -rm -f $(DESTDIR)$(BINDIR)/pydoc3
>   ifeq (@PYDOC@,yes)
>         (cd $(DESTDIR)$(BINDIR); $(LN) -s pydoc$(VERSION) pydoc3)
> -@@ -1264,7 +1266,6 @@ LIBSUBDIRS=      site-packages \
> +@@ -1243,7 +1246,6 @@ LIBSUBDIRS=      site-packages \
>                 html json http dbm xmlrpc \
>                 logging csv wsgiref urllib \
>                 ctypes ctypes/macholib \
> @@ -37,7 +37,7 @@ index dc4b92b6fe..3e43066d90 100644
>                 distutils distutils/command \
>                 importlib \
>                 turtledemo \
> -@@ -1350,6 +1351,10 @@ ifeq (@EXPAT@,yes)
> +@@ -1313,6 +1314,10 @@ ifeq (@EXPAT@,yes)
>   LIBSUBDIRS += $(XMLLIBSUBDIRS)
>   endif
>
> @@ -52,7 +52,7 @@ diff --git a/configure.ac b/configure.ac
>  index 1d610e132b..2699e7ceb1 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -3233,6 +3233,12 @@ AC_ARG_ENABLE(lib2to3,
> +@@ -3226,6 +3226,12 @@ AC_ARG_ENABLE(lib2to3,
>         AS_HELP_STRING([--disable-lib2to3], [disable lib2to3]),
>         [ LIB2TO3="${enableval}" ], [ LIB2TO3=yes ])
>
> @@ -69,7 +69,7 @@ diff --git a/setup.py b/setup.py
>  index 38aa5e605e..d642825c1e 100644
>  --- a/setup.py
>  +++ b/setup.py
> -@@ -2333,11 +2333,13 @@ def main():
> +@@ -2368,11 +2368,13 @@ def main():
>       import warnings
>       warnings.filterwarnings("ignore",category=DeprecationWarning)
>
> diff --git a/package/python3/0024-Add-an-option-to-disable-decimal.patch
> b/package/python3/0024-Add-an-option-to-disable-decimal.patch
> index 3dcaac9687..fce70134e8 100644
> --- a/package/python3/0024-Add-an-option-to-disable-decimal.patch
> +++ b/package/python3/0024-Add-an-option-to-disable-decimal.patch
> @@ -20,8 +20,8 @@ diff --git a/configure.ac b/configure.ac
>  index 2699e7ceb1..e2c3b6f25c 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -2956,13 +2956,20 @@ fi
> - AC_SUBST(LIBFFI_INCLUDEDIR)
> +@@ -2905,13 +2905,20 @@ AC_SUBST(LIBFFI_INCLUDEDIR)
> + AC_MSG_RESULT($with_system_ffi)
>
>   # Check for use of the system libmpdec library
>  -AC_MSG_CHECKING(for --with-system-libmpdec)
> @@ -50,7 +50,7 @@ diff --git a/setup.py b/setup.py
>  index d642825c1e..5b98255857 100644
>  --- a/setup.py
>  +++ b/setup.py
> -@@ -2010,7 +2010,7 @@ class PyBuildExt(build_ext):
> +@@ -2098,7 +2098,7 @@ class PyBuildExt(build_ext):
>       def _decimal_ext(self):
>           extra_compile_args = []
>           undef_macros = []
> diff --git
> a/package/python3/0025-Add-an-option-to-disable-the-ossaudiodev-module.patch
> b/package/python3/0025-Add-an-option-to-disable-the-ossaudiodev-module.patch
> index 83e1e3491a..34d8949299 100644
> ---
> a/package/python3/0025-Add-an-option-to-disable-the-ossaudiodev-module.patch
> +++
> b/package/python3/0025-Add-an-option-to-disable-the-ossaudiodev-module.patch
> @@ -12,7 +12,7 @@ diff --git a/configure.ac b/configure.ac
>  index e2c3b6f25c..8e3dded25e 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -2971,6 +2971,12 @@ else
> +@@ -2920,6 +2920,12 @@ else
>   fi
>   AC_SUBST(MPDEC)
>
> diff --git
> a/package/python3/0026-Add-an-option-to-disable-openssl-support.patch
> b/package/python3/0026-Add-an-option-to-disable-openssl-support.patch
> index ad4da1adaa..d03e418ae5 100644
> --- a/package/python3/0026-Add-an-option-to-disable-openssl-support.patch
> +++ b/package/python3/0026-Add-an-option-to-disable-openssl-support.patch
> @@ -12,7 +12,7 @@ diff --git a/configure.ac b/configure.ac
>  index 8e3dded25e..28bcdabd67 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -3210,6 +3210,12 @@ AC_ARG_ENABLE(unicodedata,
> +@@ -3203,6 +3203,12 @@ AC_ARG_ENABLE(unicodedata,
>              DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} unicodedata"
>           fi])
>
> diff --git
> a/package/python3/0027-Add-an-option-to-disable-the-readline-module.patch
> b/package/python3/0027-Add-an-option-to-disable-the-readline-module.patch
> index ec399a8d3c..03ba5a1658 100644
> ---
> a/package/python3/0027-Add-an-option-to-disable-the-readline-module.patch
> +++
> b/package/python3/0027-Add-an-option-to-disable-the-readline-module.patch
> @@ -12,7 +12,7 @@ diff --git a/configure.ac b/configure.ac
>  index 28bcdabd67..484f6ebaca 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -3216,6 +3216,12 @@ AC_ARG_ENABLE(openssl,
> +@@ -3209,6 +3209,12 @@ AC_ARG_ENABLE(openssl,
>              DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} ssl _ssl _hashlib"
>           fi])
>
> diff --git
> a/package/python3/0028-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
> b/package/python3/0028-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
> index 7753acf726..7532ac596f 100644
> ---
> a/package/python3/0028-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
> +++
> b/package/python3/0028-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
> @@ -12,7 +12,7 @@ diff --git a/configure.ac b/configure.ac
>  index 484f6ebaca..79538df0cf 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -3222,6 +3222,24 @@ AC_ARG_ENABLE(readline,
> +@@ -3215,6 +3215,24 @@ AC_ARG_ENABLE(readline,
>              DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} readline"
>           fi])
>
> diff --git
> a/package/python3/0030-Fix-cross-compiling-the-uuid-module.patch
> b/package/python3/0030-Fix-cross-compiling-the-uuid-module.patch
> deleted file mode 100644
> index 93df02f6a2..0000000000
> --- a/package/python3/0030-Fix-cross-compiling-the-uuid-module.patch
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -From ad4537a75c798341824ab18bd1dc622f8dc2bc3a Mon Sep 17 00:00:00 2001
> -From: Adam Duskett <aduskett@gmail.com>
> -Date: Fri, 20 Jul 2018 10:17:39 -0400
> -Subject: [PATCH] Fix cross compiling the uuid module
> -
> -Python 3.7 has a new _uuid module, however, the include directory
> -search path for uuid.h is hardcoded to /usr/include/uuid, which should
> -not be used when cross-compiling.
> -
> -To fix this, use the same solution as the one used by the NIS
> -detection: append "uuid" to each of the include directories in
> -"inc_dirs", instead of hardcoding /usr/include/uuid.
> -
> -Signed-off-by: Adam Duskett <aduskett@gmail.com>
> -[Thomas: drop STAGING_DIR based solution, use a solution similar to
> -the one used for the NIS detection.]
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ----
> - setup.py | 3 ++-
> - 1 file changed, 2 insertions(+), 1 deletion(-)
> -
> -diff --git a/setup.py b/setup.py
> -index 1a7085c5c4..f33d0b57b8 100644
> ---- a/setup.py
> -+++ b/setup.py
> -@@ -1627,7 +1627,8 @@ class PyBuildExt(build_ext):
> -             missing.append('_tkinter')
> -
> -         # Build the _uuid module if possible
> --        uuid_incs = find_file("uuid.h", inc_dirs, ["/usr/include/uuid"])
> -+        uuid_incs = find_file("uuid.h", inc_dirs,
> -+                              [os.path.join(inc_dir, 'uuid') for inc_dir
> in inc_dirs])
> -         if uuid_incs is not None:
> -             if self.compiler.find_library_file(lib_dirs, 'uuid'):
> -                 uuid_libs = ['uuid']
> ---
> -2.14.4
> -
> diff --git
> a/package/python3/0032-fix-building-on-older-distributions.patch
> b/package/python3/0030-fix-building-on-older-distributions.patch
> similarity index 100%
> rename from package/python3/0032-fix-building-on-older-distributions.patch
> rename to package/python3/0030-fix-building-on-older-distributions.patch
> diff --git
> a/package/python3/0031-Add-an-option-to-disable-uuid-module.patch
> b/package/python3/0031-Add-an-option-to-disable-uuid-module.patch
> deleted file mode 100644
> index c429c59a39..0000000000
> --- a/package/python3/0031-Add-an-option-to-disable-uuid-module.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From 1fe33c7bee9e6410f56c956ea19efd2f617176ae Mon Sep 17 00:00:00 2001
> -From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> -Date: Sat, 18 Aug 2018 10:54:56 +0200
> -Subject: [PATCH] Add an option to disable uuid module
> -
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ----
> - configure.ac | 9 +++++++++
> - 1 file changed, 9 insertions(+)
> -
> -diff --git a/configure.ac b/configure.ac
> -index b022460e73..505b7c9be0 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -3258,6 +3258,15 @@ if test "$CURSES" = "no"; then
> -    DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _curses _curses_panel"
> - fi
> -
> -+AC_SUBST(UUID)
> -+AC_ARG_ENABLE(uuid,
> -+      AS_HELP_STRING([--disable-uuid], [disable uuid]),
> -+      [ UUID="${enableval}" ], [ UUID=yes ])
> -+
> -+if test "$UUID" = "no"; then
> -+   DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _uuid"
> -+fi
> -+
> - AC_SUBST(PYDOC)
> -
> - AC_ARG_ENABLE(pydoc,
> ---
> -2.14.4
> -
> diff --git a/package/python3/Config.in b/package/python3/Config.in
> index 0701d56a6c..623fefe43d 100644
> --- a/package/python3/Config.in
> +++ b/package/python3/Config.in
> @@ -88,16 +88,6 @@ config BR2_PACKAGE_PYTHON3_UNICODEDATA
>           Unicode character database (used by stringprep module)
>           (large).
>
> -config BR2_PACKAGE_PYTHON3_UUID
> -       bool "uuid module"
> -       select BR2_PACKAGE_UTIL_LINUX
> -       select BR2_PACKAGE_UTIL_LINUX_LIBUUID
> -       help
> -         This module provides immutable UUID objects (the UUID class)
> -         and the functions uuid1(), uuid3(), uuid4(), uuid5() for
> -         generating version 1, 3, 4, and 5 UUIDs as specified in RFC
> -         4122.
> -
>  config BR2_PACKAGE_PYTHON3_SQLITE
>         bool "sqlite module"
>         select BR2_PACKAGE_SQLITE
> diff --git a/package/python3/python3.hash b/package/python3/python3.hash
> index 9138ad6b9c..ef09f259f4 100644
> --- a/package/python3/python3.hash
> +++ b/package/python3/python3.hash
> @@ -1,5 +1,5 @@
> -# From https://www.python.org/downloads/release/python-370/
> -md5            eb8c2a6b1447d50813c02714af4681f3 Python-3.7.0.tar.xz
> +# From https://www.python.org/downloads/release/python-366/
> +md5            c3f30a0aff425dda77d19e02f420d6ba Python-3.6.6.tar.xz
>  # Locally computed
> -sha256 0382996d1ee6aafe59763426cf0139ffebe36984474d0ec4126dd1c40a8b3549
> Python-3.7.0.tar.xz
> +sha256 d79bc15d456e73a3173a2938f18a17e5149c850ebdedf84a78067f501ee6e16f
> Python-3.6.6.tar.xz
>  sha256 b9a6d9320b8f2693e8d41e496ce56caadacaddcca9be2a64a61749278f425cf2
> LICENSE
> diff --git a/package/python3/python3.mk b/package/python3/python3.mk
> index 5e94e8e726..97290d9227 100644
> --- a/package/python3/python3.mk
> +++ b/package/python3/python3.mk
> @@ -4,13 +4,20 @@
>  #
>
>  ################################################################################
>
> -PYTHON3_VERSION_MAJOR = 3.7
> -PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).0
> +PYTHON3_VERSION_MAJOR = 3.6
> +PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).6
>  PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
>  PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
>  PYTHON3_LICENSE = Python-2.0, others
>  PYTHON3_LICENSE_FILES = LICENSE
>
> +# Python itself doesn't use libtool, but it includes the source code
> +# of libffi, which uses libtool. Unfortunately, it uses a beta version
> +# of libtool for which we don't have a matching patch. However, this
> +# is not a problem, because we don't use the libffi copy included in
> +# the Python sources, but instead use an external libffi library.
> +PYTHON3_LIBTOOL_PATCH = NO
> +
>  # This host Python is installed in $(HOST_DIR), as it is needed when
>  # cross-compiling third-party Python modules.
>
> @@ -40,7 +47,7 @@ HOST_PYTHON3_CONF_ENV += \
>
>  PYTHON3_DEPENDENCIES = host-python3 libffi
>
> -HOST_PYTHON3_DEPENDENCIES = host-expat host-zlib host-libffi
> +HOST_PYTHON3_DEPENDENCIES = host-expat host-zlib
>
>  PYTHON3_INSTALL_STAGING = YES
>
> @@ -94,12 +101,6 @@ ifneq ($(BR2_PACKAGE_PYTHON3_UNICODEDATA),y)
>  PYTHON3_CONF_OPTS += --disable-unicodedata
>  endif
>
> -ifeq ($(BR2_PACKAGE_PYTHON3_UUID),y)
> -PYTHON3_DEPENDENCIES += util-linux
> -else
> -PYTHON3_CONF_OPTS += --disable-uuid
> -endif
> -
>  ifeq ($(BR2_PACKAGE_PYTHON3_BZIP2),y)
>  PYTHON3_DEPENDENCIES += bzip2
>  else
> --
> 2.17.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180925/6659d24a/attachment.html>
