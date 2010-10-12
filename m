From: Maxime Ripard <ripard@archos.com>
Date: Tue, 12 Oct 2010 10:26:55 +0200
Subject: [Buildroot] [PATCH 3/4] python: Add needed extra patches.
In-Reply-To: <1286872016-12621-1-git-send-email-ripard@archos.com>
References: <1286872016-12621-1-git-send-email-ripard@archos.com>
Message-ID: <1286872016-12621-4-git-send-email-ripard@archos.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Maxime Ripard <ripard@archos.com>
---
 .../python-2.7-030-fix-long-long-format.patch      |   12 ++++++++
 .../python-2.7-040-bytecode-generation-fix.patch   |   30 ++++++++++++++++++++
 2 files changed, 42 insertions(+), 0 deletions(-)
 create mode 100644 package/python/python-2.7-030-fix-long-long-format.patch
 create mode 100644 package/python/python-2.7-040-bytecode-generation-fix.patch

diff --git a/package/python/python-2.7-030-fix-long-long-format.patch b/package/python/python-2.7-030-fix-long-long-format.patch
new file mode 100644
index 0000000..19f299f
--- /dev/null
+++ b/package/python/python-2.7-030-fix-long-long-format.patch
@@ -0,0 +1,12 @@
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
index 0000000..9c2ae63
--- /dev/null
+++ b/package/python/python-2.7-040-bytecode-generation-fix.patch
@@ -0,0 +1,30 @@
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
1.7.1


____________________________________________________________________________

This  email  and any  files  transmitted  with it are  confidential  and are
intended solely  for the use of the individual  or entity to which  they are
addressed.  Access to this e-mail by anyone else is unauthorised. If you are
not the  intended recipient,  any disclosure,  copying,  distribution or any
action taken or omitted to be taken in reliance on it, is prohibited. E-mail
messages are not necessarily secure.  Archos does not accept  responsibility
for any changes made to this message after it was sent.
