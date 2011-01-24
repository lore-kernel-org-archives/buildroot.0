From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Jan 2011 12:01:31 +0100
Subject: [Buildroot] [PATCH 03/10] python: Add the needed patches to compile
	python2.7 in buildroot.
In-Reply-To: <cover.1295866866.git.thomas.petazzoni@free-electrons.com>
References: <cover.1295866866.git.thomas.petazzoni@free-electrons.com>
Message-ID: <9ca400919b81d19ef5e80e869a4d59b031611156.1295866866.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Maxime Ripard <maxime.ripard@anandra.org>

Signed-off-by: Maxime Ripard <ripard@archos.com>
---
 .../python-2.7-030-fix-long-long-format.patch      |   19 ++++++++++
 .../python-2.7-040-bytecode-generation-fix.patch   |   38 ++++++++++++++++++++
 2 files changed, 57 insertions(+), 0 deletions(-)
 create mode 100644 package/python/python-2.7-030-fix-long-long-format.patch
 create mode 100644 package/python/python-2.7-040-bytecode-generation-fix.patch

diff --git a/package/python/python-2.7-030-fix-long-long-format.patch b/package/python/python-2.7-030-fix-long-long-format.patch
new file mode 100644
index 0000000..5b9dddd
--- /dev/null
+++ b/package/python/python-2.7-030-fix-long-long-format.patch
@@ -0,0 +1,19 @@
+Python's configure assume than when cross-compiling the target has no
+support for long long int. This assumption breaks compilation later in the
+process. Since gcc handles long long support, we can change the value to
+assume that there is such support.
+
+Patch by Maxime Ripard <ripard@archos.com>
+
+diff -rduNp Python-2.7.orig/configure Python-2.7/configure
+--- Python-2.7.orig/configure	2010-09-30 12:05:54.000000000 +0200
++++ Python-2.7/configure	2010-09-30 12:12:30.000000000 +0200
+@@ -13517,7 +13517,7 @@ $as_echo_n "checking for %lld and %llu p
+   $as_echo_n "(cached) " >&6
+ else
+   if test "$cross_compiling" = yes; then :
+-  ac_cv_have_long_long_format=no
++  ac_cv_have_long_long_format=yes
+ else
+   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+ /* end confdefs.h.  */
diff --git a/package/python/python-2.7-040-bytecode-generation-fix.patch b/package/python/python-2.7-040-bytecode-generation-fix.patch
new file mode 100644
index 0000000..0984c48
--- /dev/null
+++ b/package/python/python-2.7-040-bytecode-generation-fix.patch
@@ -0,0 +1,38 @@
+The compileall script is used to compile to python bytecode all the modules.
+However, it relies on the struct package that is not built for the host
+python, thus crashing at execution when compiling the target python.
+When compiling, the removed code block is never executed, so we can safely
+remove it, removing in the same time the dependency on struct.
+
+Patch by Maxime Ripard <ripard@archos.com>
+
+Index: Python-2.7/Lib/compileall.py
+===================================================================
+--- Python-2.7.orig/Lib/compileall.py	(r??vision 84276)
++++ Python-2.7/Lib/compileall.py	(copie de travail)
+@@ -14,7 +14,6 @@
+ import os
+ import sys
+ import py_compile
+-import struct
+ import imp
+ 
+ __all__ = ["compile_dir","compile_file","compile_path"]
+@@ -83,17 +82,6 @@
+     if os.path.isfile(fullname):
+         head, tail = name[:-3], name[-3:]
+         if tail == '.py':
+-            if not force:
+-                try:
+-                    mtime = int(os.stat(fullname).st_mtime)
+-                    expect = struct.pack('<4sl', imp.get_magic(), mtime)
+-                    cfile = fullname + (__debug__ and 'c' or 'o')
+-                    with open(cfile, 'rb') as chandle:
+-                        actual = chandle.read(8)
+-                    if expect == actual:
+-                        return success
+-                except IOError:
+-                    pass
+             if not quiet:
+                 print 'Compiling', fullname, '...'
+             try:
-- 
1.7.0.4
