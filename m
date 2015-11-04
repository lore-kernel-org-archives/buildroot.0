From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Nov 2015 22:55:28 +0100
Subject: [Buildroot] [git commit] python3: add patch to fix PEP 3147 issue
	with automake built packages
Message-ID: <20151104215535.461697FCA5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b58685355943d2c34606432d978d9efc6027f564
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Packages built with automake use a `py-compile` helper to byte-compile
Python source files. This script uses the "py_compile" module from the
standard library. In turn, the compile() function in the "py_compile"
module invokes the cache_from_source() function provided by importlib.

This commit adds a new patch named "020-importlib-no-pep3147.patch"
that changes cache_from_source() and source_from_cache() in importlib
to get rid of the "__pycache__" directory.

This commit fixes the following import error in kmod when the module
is built for Python 3:

  >>> from kmod import Kmod
  Traceback (most recent call last):
    File "<stdin>", line 1, in <module>
  ImportError: cannot import name 'Kmod'

Moreover, this commit removes two patches that are no longer necessary
since modifying cache_from_source() and source_from_cache() disables
PEP 3147 for the standard library and distutils / setuptools.

 * 004-old-stdlib-cache.patch
 * 016-distutils-no-pep3147.patch

Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python3/004-old-stdlib-cache.patch     |   78 ------------------------
 package/python3/005-pyc-pyo-conditional.patch  |    8 +-
 package/python3/016-distutils-no-pep3147.patch |   36 -----------
 package/python3/020-importlib-no-pep3147.patch |   69 +++++++++++++++++++++
 4 files changed, 73 insertions(+), 118 deletions(-)

diff --git a/package/python3/004-old-stdlib-cache.patch b/package/python3/004-old-stdlib-cache.patch
deleted file mode 100644
index 9ed7e59..0000000
--- a/package/python3/004-old-stdlib-cache.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-python3: Fix pyc-only related runtime exceptions
-
-Python3 changes the pyc lookup strategy, ignoring the
-__pycache__ directory if the .py file is missing. Change
-install location to enable use of .pyc without their parent .py
-
-See http://www.python.org/dev/peps/pep-3147
-
-Signed-off-by: Daniel Nelson <daniel@sigpwr.com>
-
-Index: b/configure.ac
-===================================================================
---- a/configure.ac
-+++ b/configure.ac
-@@ -352,6 +352,23 @@
- AC_SUBST(FRAMEWORKUNIXTOOLSPREFIX)
- AC_SUBST(FRAMEWORKINSTALLAPPSPREFIX)
- 
-+STDLIB_CACHE_FLAGS=
-+AC_MSG_CHECKING(for --enable-old-stdlib-cache)
-+AC_ARG_ENABLE(old-stdlib-cache,
-+    AS_HELP_STRING([--enable-old-stdlib-cache], [enable pre-pep3147 stdlib cache]),
-+[
-+    if test "$enableval" = "yes"
-+    then
-+        STDLIB_CACHE_FLAGS="-b"
-+    else
-+        STDLIB_CACHE_FLAGS="" 
-+    fi
-+],
-+[
-+    STDLIB_CACHE_FLAGS="" 
-+])
-+AC_SUBST(STDLIB_CACHE_FLAGS)
-+
- ##AC_ARG_WITH(dyld,
- ##            AS_HELP_STRING([--with-dyld],
- ##                           [Use (OpenStep|Rhapsody) dynamic linker]))
-Index: b/Makefile.pre.in
-===================================================================
---- a/Makefile.pre.in
-+++ b/Makefile.pre.in
-@@ -162,6 +162,9 @@
- # Options to enable prebinding (for fast startup prior to Mac OS X 10.3)
- OTHER_LIBTOOL_OPT=@OTHER_LIBTOOL_OPT@
- 
-+# Option to enable old-style precompiled stdlib
-+STDLIB_CACHE_FLAGS=@STDLIB_CACHE_FLAGS@
-+
- # Environment to run shared python without installed libraries
- RUNSHARED=       @RUNSHARED@
- 
-@@ -1247,21 +1250,21 @@
- 	fi
- 	-PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
- 		$(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py \
--		-d $(LIBDEST) -f \
-+		-d $(LIBDEST) -f $(STDLIB_CACHE_FLAGS) \
- 		-x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data' \
- 		$(DESTDIR)$(LIBDEST)
- 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
- 		$(PYTHON_FOR_BUILD) -Wi -O $(DESTDIR)$(LIBDEST)/compileall.py \
--		-d $(LIBDEST) -f \
-+		-d $(LIBDEST) -f $(STDLIB_CACHE_FLAGS) \
- 		-x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data' \
- 		$(DESTDIR)$(LIBDEST)
- 	-PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
- 		$(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py \
--		-d $(LIBDEST)/site-packages -f \
-+		-d $(LIBDEST)/site-packages -f $(STDLIB_CACHE_FLAGS) \
- 		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
- 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
- 		$(PYTHON_FOR_BUILD) -Wi -O $(DESTDIR)$(LIBDEST)/compileall.py \
--		-d $(LIBDEST)/site-packages -f \
-+		-d $(LIBDEST)/site-packages -f $(STDLIB_CACHE_FLAGS) \
- 		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
- 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
- 		$(PYTHON_FOR_BUILD) -m lib2to3.pgen2.driver $(DESTDIR)$(LIBDEST)/lib2to3/Grammar.txt
diff --git a/package/python3/005-pyc-pyo-conditional.patch b/package/python3/005-pyc-pyo-conditional.patch
index c3b159d..0d60ff6 100644
--- a/package/python3/005-pyc-pyo-conditional.patch
+++ b/package/python3/005-pyc-pyo-conditional.patch
@@ -9,27 +9,27 @@ Index: b/Makefile.pre.in
 +ifeq (@PYC_BUILD@,yes)
  	-PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
  		$(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py \
- 		-d $(LIBDEST) -f $(STDLIB_CACHE_FLAGS) \
+ 		-d $(LIBDEST) -f \
  		-x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data' \
  		$(DESTDIR)$(LIBDEST)
 +endif
 +ifeq (@PYO_BUILD@,yes)
  	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
  		$(PYTHON_FOR_BUILD) -Wi -O $(DESTDIR)$(LIBDEST)/compileall.py \
- 		-d $(LIBDEST) -f $(STDLIB_CACHE_FLAGS) \
+ 		-d $(LIBDEST) -f \
  		-x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data' \
  		$(DESTDIR)$(LIBDEST)
 +endif
 +ifeq (@PYC_BUILD@,yes)
  	-PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
  		$(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py \
- 		-d $(LIBDEST)/site-packages -f $(STDLIB_CACHE_FLAGS) \
+ 		-d $(LIBDEST)/site-packages -f \
  		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
 +endif
 +ifeq (@PYO_BUILD@,yes)
  	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
  		$(PYTHON_FOR_BUILD) -Wi -O $(DESTDIR)$(LIBDEST)/compileall.py \
- 		-d $(LIBDEST)/site-packages -f $(STDLIB_CACHE_FLAGS) \
+ 		-d $(LIBDEST)/site-packages -f \
  		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
 +endif
  	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
diff --git a/package/python3/016-distutils-no-pep3147.patch b/package/python3/016-distutils-no-pep3147.patch
deleted file mode 100644
index 0fdfeb2..0000000
--- a/package/python3/016-distutils-no-pep3147.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Add distutils fix for PEP 3147 issue
-
-Python 3 has a new standard for installing .pyc file, called PEP
-3147. Unfortunately, this standard requires both the .py and .pyc
-files to be installed for a Python module to be found. This is quite
-annoying on space-constrained embedded systems, since the .py file is
-technically not required for execution.
-
-For the Python standard library, our Python 3 package already contains
-a patch named python3-004-old-stdlib-cache.patch, which allows to
-disable the PEP 3147 installation.
-
-But that lives the distutils/setuptools package an unsolved
-problem. This patch therefore adds a new patch to Python, which makes
-distutils package use the traditional installation path when byte
-compiling, rather than the PEP 3147 installation path. Since
-setuptools relies on distutils internally, it also fixes setuptools
-based packages.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/Lib/distutils/util.py
-===================================================================
---- a/Lib/distutils/util.py
-+++ b/Lib/distutils/util.py
-@@ -437,7 +437,9 @@
-             # Terminology from the py_compile module:
-             #   cfile - byte-compiled file
-             #   dfile - purported source filename (same as 'file' by default)
--            if optimize >= 0:
-+            if "_python_sysroot" in os.environ:
-+                cfile = file + (__debug__ and "c" or "o")
-+            elif optimize >= 0:
-                 cfile = importlib.util.cache_from_source(
-                     file, debug_override=not optimize)
-             else:
diff --git a/package/python3/020-importlib-no-pep3147.patch b/package/python3/020-importlib-no-pep3147.patch
new file mode 100644
index 0000000..779b5e2
--- /dev/null
+++ b/package/python3/020-importlib-no-pep3147.patch
@@ -0,0 +1,69 @@
+Add importlib fix for PEP 3147 issue
+
+Python 3 has a new standard for installing .pyc file, called PEP
+3147. Unfortunately, this standard requires both the .py and .pyc
+files to be installed for a Python module to be found. This is quite
+annoying on space-constrained embedded systems, since the .py file is
+technically not required for execution.
+
+This patch changes cache_from_source() and source_from_cache() in
+importlib to get rid of the "__pycache__" directory.
+This effectively disables PEP 3147 for:
+
+* The python standard library
+* Packages built with distutils or setuptools
+* Packages built with automake that use the `py-compile` helper
+
+Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
+
+diff -purN a/Lib/importlib/_bootstrap.py b/Lib/importlib/_bootstrap.py
+--- a/Lib/importlib/_bootstrap.py	2015-02-25 12:27:44.000000000 +0100
++++ b/Lib/importlib/_bootstrap.py	2015-08-27 17:33:26.167191059 +0200
+@@ -444,8 +444,6 @@ def cache_from_source(path, debug_overri
+     If debug_override is not None, then it must be a boolean and is used in
+     place of sys.flags.optimize.
+ 
+-    If sys.implementation.cache_tag is None then NotImplementedError is raised.
+-
+     """
+     debug = not sys.flags.optimize if debug_override is None else debug_override
+     if debug:
+@@ -454,33 +452,19 @@ def cache_from_source(path, debug_overri
+         suffixes = OPTIMIZED_BYTECODE_SUFFIXES
+     head, tail = _path_split(path)
+     base, sep, rest = tail.rpartition('.')
+-    tag = sys.implementation.cache_tag
+-    if tag is None:
+-        raise NotImplementedError('sys.implementation.cache_tag is None')
+-    filename = ''.join([(base if base else rest), sep, tag, suffixes[0]])
+-    return _path_join(head, _PYCACHE, filename)
++    filename = ''.join([(base if base else rest), suffixes[0]])
++    return _path_join(head, filename)
+ 
+ 
+ def source_from_cache(path):
+     """Given the path to a .pyc./.pyo file, return the path to its .py file.
+ 
+     The .pyc/.pyo file does not need to exist; this simply returns the path to
+-    the .py file calculated to correspond to the .pyc/.pyo file.  If path does
+-    not conform to PEP 3147 format, ValueError will be raised. If
+-    sys.implementation.cache_tag is None then NotImplementedError is raised.
++    the .py file calculated to correspond to the .pyc/.pyo file.
+ 
+     """
+-    if sys.implementation.cache_tag is None:
+-        raise NotImplementedError('sys.implementation.cache_tag is None')
+-    head, pycache_filename = _path_split(path)
+-    head, pycache = _path_split(head)
+-    if pycache != _PYCACHE:
+-        raise ValueError('{} not bottom-level directory in '
+-                         '{!r}'.format(_PYCACHE, path))
+-    if pycache_filename.count('.') != 2:
+-        raise ValueError('expected only 2 dots in '
+-                         '{!r}'.format(pycache_filename))
+-    base_filename = pycache_filename.partition('.')[0]
++    head, filename = _path_split(path)
++    base_filename = filename.partition('.')[0]
+     return _path_join(head, base_filename + SOURCE_SUFFIXES[0])
+ 
+ 
