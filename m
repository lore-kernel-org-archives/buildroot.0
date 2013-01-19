From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 19 Jan 2013 15:53:56 +0100
Subject: [Buildroot] [PATCH 2/3] python3: Port python2 patches to reduce
 the interpreter size
In-Reply-To: <1358517974-30956-2-git-send-email-maxime.ripard@free-electrons.com>
References: <1358517974-30956-1-git-send-email-maxime.ripard@free-electrons.com>
 <1358517974-30956-2-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <CAHXCMMLxr2ttXFzRfJECxRdJitBbAjM4mXyt2SpzTJV5RMQLwA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Maxime, all,

2013/1/18 Maxime Ripard <maxime.ripard@free-electrons.com>:
> Some of the python2 patches were left behind when doing the python3
> package. This was because the python build system can now autodetect
> what packages can be built in the system.
>
> However, some of these patches are actually useful to reduce drastically
> the size of the interpreter.
>
> This patch ports the relevant patches to the python3 package, and adds a
> new patch to remove the idle3 IDE as well from the interpreter.
>
> Fixes #5696
>
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> ---
>  package/python3/Config.in                          |   11 ++
>  .../python3-3.3-012-disable-extensions.patch       |   98 +++++++++++++++++
>  .../python3-3.3-100-optional-test-modules.patch    |  112 ++++++++++++++++++++
>  .../python3/python3-3.3-101-optional-pydoc.patch   |   91 ++++++++++++++++
>  .../python3/python3-3.3-102-optional-2to3.patch    |   98 +++++++++++++++++
>  .../python3/python3-3.3-103-optional-sqlite.patch  |   64 +++++++++++
>  package/python3/python3-3.3-104-optional-tk.patch  |   69 ++++++++++++
>  .../python3/python3-3.3-105-optional-curses.patch  |   54 ++++++++++
>  .../python3/python3-3.3-106-optional-expat.patch   |   85 +++++++++++++++
>  .../python3-3.3-107-optional-codecs-cjk.patch      |   25 +++++
>  package/python3/python3-3.3-108-optional-nis.patch |   28 +++++
>  .../python3-3.3-109-optional-unicodedata.patch     |   25 +++++
>  .../python3/python3-3.3-110-optional-idle.patch    |   76 +++++++++++++
>  package/python3/python3.mk                         |   25 +++--
>  14 files changed, 852 insertions(+), 9 deletions(-)
>  create mode 100644 package/python3/python3-3.3-012-disable-extensions.patch
>  create mode 100644 package/python3/python3-3.3-100-optional-test-modules.patch
>  create mode 100644 package/python3/python3-3.3-101-optional-pydoc.patch
>  create mode 100644 package/python3/python3-3.3-102-optional-2to3.patch
>  create mode 100644 package/python3/python3-3.3-103-optional-sqlite.patch
>  create mode 100644 package/python3/python3-3.3-104-optional-tk.patch
>  create mode 100644 package/python3/python3-3.3-105-optional-curses.patch
>  create mode 100644 package/python3/python3-3.3-106-optional-expat.patch
>  create mode 100644 package/python3/python3-3.3-107-optional-codecs-cjk.patch
>  create mode 100644 package/python3/python3-3.3-108-optional-nis.patch
>  create mode 100644 package/python3/python3-3.3-109-optional-unicodedata.patch
>  create mode 100644 package/python3/python3-3.3-110-optional-idle.patch
>
[...]
> diff --git a/package/python3/python3-3.3-100-optional-test-modules.patch b/package/python3/python3-3.3-100-optional-test-modules.patch
> new file mode 100644
> index 0000000..bfe7be2
> --- /dev/null
> +++ b/package/python3/python3-3.3-100-optional-test-modules.patch
> @@ -0,0 +1,112 @@
> +Add an option to disable installation of test modules
> +
> +The Python standard distribution comes with many test modules, that
> +are not necessarly useful on embedded targets.
> +
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> +
> +---
> +
> +Add an option to disable installation of test modules
> +
> +The Python standard distribution comes with many test modules, that
> +are not necessarly useful on embedded targets.
> +
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> +
> +---
ahem... duplicated commit message no needed ;-)

[...]
> diff --git a/package/python3/python3-3.3-102-optional-2to3.patch b/package/python3/python3-3.3-102-optional-2to3.patch
> new file mode 100644
> index 0000000..b47619b
> --- /dev/null
> +++ b/package/python3/python3-3.3-102-optional-2to3.patch
> @@ -0,0 +1,98 @@
> +Add an option to disable lib2to3
> +
> +lib2to3 is a library to convert Python 2.x code to Python 3.x. As
> +such, it is probably not very useful on embedded system targets.
> +
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> +
> +---
> + Makefile.pre.in |   16 ++++++++++++----
> + configure.ac    |    6 ++++++
> + setup.py        |    5 +++--
> + 3 files changed, 21 insertions(+), 6 deletions(-)
> +
> +Index: cpython/Makefile.pre.in
> +===================================================================
> +--- cpython.orig/Makefile.pre.in
> ++++ cpython/Makefile.pre.in
> +@@ -953,7 +953,9 @@
> +       (cd $(DESTDIR)$(BINDIR); $(LN) -s pydoc$(VERSION) pydoc3)
> + endif
> +       -rm -f $(DESTDIR)$(BINDIR)/2to3
> ++ifeq (@LIB2TO3@,yes)
> +       (cd $(DESTDIR)$(BINDIR); $(LN) -s 2to3-$(VERSION) 2to3)
> ++endif
> +       -rm -f $(DESTDIR)$(BINDIR)/pyvenv
> +       (cd $(DESTDIR)$(BINDIR); $(LN) -s pyvenv-$(VERSION) pyvenv)
> +
> +@@ -982,7 +984,6 @@
> +               html json http dbm xmlrpc \
> +               sqlite3 \
> +               logging csv wsgiref urllib \
> +-              lib2to3 lib2to3/fixes lib2to3/pgen2 \
> +               ctypes ctypes/macholib idlelib idlelib/Icons \
> +               distutils distutils/command $(XMLLIBSUBDIRS) \
> +               importlib \
> +@@ -1022,9 +1023,6 @@
> +               test/test_email test/test_email/data \
> +               test/json_tests \
> +               sqlite3/test \
> +-              lib2to3/tests \
> +-              lib2to3/tests/data lib2to3/tests/data/fixers \
> +-              lib2to3/tests/data/fixers/myfixes \
> +               ctypes/test \
> +               distutils/tests \
> +               test/test_importlib test/test_importlib/builtin \
> +@@ -1037,6 +1035,16 @@
> + LIBSUBDIRS += pydoc_data
> + endif
> +
> ++ifeq (@LIB2TO3@,yes)
> ++LIBSUBDIRS += lib2to3 lib2to3/fixes lib2to3/pgen2
> ++ifeq (@TEST_MODULES@,yes)
> ++LIBSUBDIRS +=         lib2to3/tests                           \
> ++              lib2to3/tests/data                      \
> ++              lib2to3/tests/data/fixers               \
> ++              lib2to3/tests/data/fixers/myfixes
> ++endif
> ++endif
> ++
> + libinstall:   build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
> +       @for i in $(SCRIPTDIR) $(LIBDEST); \
> +       do \

This little patch:
http://code.bulix.org/77k6za-82864
prevents from building some 2to3 stuff when disabled:

-- snip --
PYTHONPATH=/home/samuel/data/workspace/src/buildroot/output/qemu_arm_versatile/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/python3.3
 CROSS_COMPILING=yes
	_python_cross_host=arm-buildroot-linux-uclibcgnueabi
		_python_sysroot="" 		_python_srcdir="." 		_python_prefix="/usr"
		_python_exec_prefix="/usr" \
	/home/samuel/data/workspace/src/buildroot/output/qemu_arm_versatile/build/host-python3-3.3.0/python
-Wi /home/samuel/data/workspace/src/buildroot/output/qemu_arm_versatile/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/python3.3/compileall.py
\
	-d /usr/lib/python3.3/site-packages -f \
	-x badsyntax /home/samuel/data/workspace/src/buildroot/output/qemu_arm_versatile/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/python3.3/site-packages
Listing '/home/samuel/data/workspace/src/buildroot/output/qemu_arm_versatile/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/python3.3/site-packages'...
PYTHONPATH=/home/samuel/data/workspace/src/buildroot/output/qemu_arm_versatile/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/python3.3
CROSS_COMPILING=yes
	_python_cross_host=arm-buildroot-linux-uclibcgnueabi
		_python_sysroot="" 		_python_srcdir="." 		_python_prefix="/usr"
		_python_exec_prefix="/usr" \
	/home/samuel/data/workspace/src/buildroot/output/qemu_arm_versatile/build/host-python3-3.3.0/python
-m lib2to3.pgen2.driver
/home/samuel/data/workspace/src/buildroot/output/qemu_arm_versatile/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/python3.3/lib2to3/Grammar.txt
Generating grammar tables from
/home/samuel/data/workspace/src/buildroot/output/qemu_arm_versatile/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/python3.3/lib2to3/Grammar.txt
Traceback (most recent call last):
  File "/home/samuel/data/workspace/src/buildroot/output/qemu_arm_versatile/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/python3.3/runpy.py",
line 160, in _run_module_as_main
    "__main__", fname, loader, pkg_name)
  File "/home/samuel/data/workspace/src/buildroot/output/qemu_arm_versatile/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/python3.3/runpy.py",
line 73, in _run_code
    exec(code, run_globals)
  File "/home/samuel/data/workspace/src/buildroot/output/qemu_arm_versatile/build/host-python3-3.3.0/Lib/lib2to3/pgen2/driver.py",
line 157, in <module>
    sys.exit(int(not main()))
  File "/home/samuel/data/workspace/src/buildroot/output/qemu_arm_versatile/build/host-python3-3.3.0/Lib/lib2to3/pgen2/driver.py",
line 153, in main
    load_grammar(gt, save=True, force=True)
  File "/home/samuel/data/workspace/src/buildroot/output/qemu_arm_versatile/build/host-python3-3.3.0/Lib/lib2to3/pgen2/driver.py",
line 121, in load_grammar
    g = pgen.generate_grammar(gt)
  File "/home/samuel/data/workspace/src/buildroot/output/qemu_arm_versatile/build/host-python3-3.3.0/Lib/lib2to3/pgen2/pgen.py",
line 385, in generate_grammar
    p = ParserGenerator(filename)
  File "/home/samuel/data/workspace/src/buildroot/output/qemu_arm_versatile/build/host-python3-3.3.0/Lib/lib2to3/pgen2/pgen.py",
line 15, in __init__
    stream = open(filename)
FileNotFoundError: [Errno 2] No such file or directory:
'/home/samuel/data/workspace/src/buildroot/output/qemu_arm_versatile/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/python3.3/lib2to3/Grammar.txt'
make[1]: [libinstall] Error 1 (ignored)
PYTHONPATH=/home/samuel/data/workspace/src/buildroot/output/qemu_arm_versatile/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/python3.3
CROSS_COMPILING=yes
	_python_cross_host=arm-buildroot-linux-uclibcgnueabi
		_python_sysroot="" 		_python_srcdir="." 		_python_prefix="/usr"
		_python_exec_prefix="/usr" \
	/home/samuel/data/workspace/src/buildroot/output/qemu_arm_versatile/build/host-python3-3.3.0/python
-m lib2to3.pgen2.driver
/home/samuel/data/workspace/src/buildroot/output/qemu_arm_versatile/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/python3.3/lib2to3/PatternGrammar.txt
Generating grammar tables from
/home/samuel/data/workspace/src/buildroot/output/qemu_arm_versatile/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/python3.3/lib2to3/PatternGrammar.txt
Traceback (most recent call last):
  File "/home/samuel/data/workspace/src/buildroot/output/qemu_arm_versatile/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/python3.3/runpy.py",
line 160, in _run_module_as_main
    "__main__", fname, loader, pkg_name)
  File "/home/samuel/data/workspace/src/buildroot/output/qemu_arm_versatile/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/python3.3/runpy.py",
line 73, in _run_code
    exec(code, run_globals)
  File "/home/samuel/data/workspace/src/buildroot/output/qemu_arm_versatile/build/host-python3-3.3.0/Lib/lib2to3/pgen2/driver.py",
line 157, in <module>
    sys.exit(int(not main()))
  File "/home/samuel/data/workspace/src/buildroot/output/qemu_arm_versatile/build/host-python3-3.3.0/Lib/lib2to3/pgen2/driver.py",
line 153, in main
    load_grammar(gt, save=True, force=True)
  File "/home/samuel/data/workspace/src/buildroot/output/qemu_arm_versatile/build/host-python3-3.3.0/Lib/lib2to3/pgen2/driver.py",
line 121, in load_grammar
    g = pgen.generate_grammar(gt)
  File "/home/samuel/data/workspace/src/buildroot/output/qemu_arm_versatile/build/host-python3-3.3.0/Lib/lib2to3/pgen2/pgen.py",
line 385, in generate_grammar
    p = ParserGenerator(filename)
  File "/home/samuel/data/workspace/src/buildroot/output/qemu_arm_versatile/build/host-python3-3.3.0/Lib/lib2to3/pgen2/pgen.py",
line 15, in __init__
    stream = open(filename)
FileNotFoundError: [Errno 2] No such file or directory:
'/home/samuel/data/workspace/src/buildroot/output/qemu_arm_versatile/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/python3.3/lib2to3/PatternGrammar.txt'
make[1]: [libinstall] Error 1 (ignored)
make[1]: Leaving directory
`/home/samuel/data/workspace/src/buildroot/output/qemu_arm_versatile/build/python3-3.3.0'
-- snip --


[...]
> diff --git a/package/python3/python3-3.3-110-optional-idle.patch b/package/python3/python3-3.3-110-optional-idle.patch
> new file mode 100644
> index 0000000..7489653
> --- /dev/null
> +++ b/package/python3/python3-3.3-110-optional-idle.patch
> @@ -0,0 +1,76 @@
> +---
> + Makefile.pre.in |    8 +++++++-
> + configure.ac    |    6 ++++++
> + setup.py        |    4 +++-
> + 3 files changed, 16 insertions(+), 2 deletions(-)
> +
No commit message nor sob line here. :-(


BTW, here is a build log: http://code.bulix.org/8rjnsp-82865, in which
the _decimal module fails to be built.

See near the end of the log, it seems the build script of python3 for
the target does some mix up between the host and the target build
config of the package :-/

It also fails if this python patch series is not applied.


Regards,

-- 
Samuel
