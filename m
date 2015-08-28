From: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Date: Fri, 28 Aug 2015 16:58:41 +0200
Subject: [Buildroot] [PATCH 1/1] python3: add patch to fix PEP 3147 issue
	with automake built packages
Message-ID: <1440773921-769-1-git-send-email-cvubrugier@fastmail.fm>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Packages built with automake use a `py-compile` helper to byte-compile
Python source files. This script uses the "py_compile" module from the
standard library. In turn, the compile() function in the "py_compile"
module invokes the cache_from_source() function provided by importlib.

This patch changes cache_from_source() and source_from_cache() in
importlib to get rid of the "__pycache__" directory.

This fixes the following import error in kmod when the module is built
for Python 3:

  >>> from kmod import Kmod
  Traceback (most recent call last):
    File "<stdin>", line 1, in <module>
  ImportError: cannot import name 'Kmod'

Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
---
 package/python3/020-importlib-no-pep3147.patch | 72 ++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 package/python3/020-importlib-no-pep3147.patch

diff --git a/package/python3/020-importlib-no-pep3147.patch b/package/python3/020-importlib-no-pep3147.patch
new file mode 100644
index 0000000..3e797d3
--- /dev/null
+++ b/package/python3/020-importlib-no-pep3147.patch
@@ -0,0 +1,72 @@
+Add importlib fix for PEP 3147 issue
+
+Python 3 follows PEP 3147 and stores byte-compiled files in a per
+interpreter "__pycache__" directory. The drawback of PEP 3147 is that
+it requires the .py file to be installed. That's why Buildroot
+disables PEP 3147 to accommodate tiny embedded systems.
+
+Buildroot contains patches to disable PEP 3147 in setuptools and
+distutils but packages built with automake use a `py-compile` helper
+to byte-compile Python source files. This script uses the "py_compile"
+module from the standard library. In turn, the compile() function in
+the "py_compile" module invokes the cache_from_source() function
+provided by importlib.
+
+This patch changes cache_from_source() and source_from_cache() in
+importlib to get rid of the "__pycache__" directory.
+
+  http://www.gnu.org/software/automake/manual/html_node/Python.html
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
-- 
2.5.0
