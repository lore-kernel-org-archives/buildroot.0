From: Peter Seiderer <ps.report@gmx.net>
Date: Fri,  8 Aug 2014 23:53:00 +0200
Subject: [Buildroot] [PATCH] evemu: bump to version 2.0.0
Message-ID: <1407534780-28234-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Delete python3 porting related patches (already upstream)
Update other patches to apply cleanly.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/evemu/evemu-0001-SYN_MAX.patch             |  26 ++--
 ...002-configure.ac-add-disable-tests-option.patch |   8 +-
 ...names-use-input.h-from-sysroot-instead-of.patch |   8 +-
 ...-event-names-fix-for-python3-print-syntax.patch | 162 ---------------------
 ...ure.ac-add-disable-python-bindings-option.patch |   8 +-
 ...-fixes-the-syntax-for-raising-exceptions-.patch |  27 ----
 ...u-0007-python-fix-device-open-for-python3.patch |  35 -----
 package/evemu/evemu.mk                             |   2 +-
 8 files changed, 26 insertions(+), 250 deletions(-)
 delete mode 100644 package/evemu/evemu-0004-make-event-names-fix-for-python3-print-syntax.patch
 delete mode 100644 package/evemu/evemu-0006-Description-fixes-the-syntax-for-raising-exceptions-.patch
 delete mode 100644 package/evemu/evemu-0007-python-fix-device-open-for-python3.patch

diff --git a/package/evemu/evemu-0001-SYN_MAX.patch b/package/evemu/evemu-0001-SYN_MAX.patch
index 049bdc0..b128794 100644
--- a/package/evemu/evemu-0001-SYN_MAX.patch
+++ b/package/evemu/evemu-0001-SYN_MAX.patch
@@ -6,20 +6,20 @@ defined, otherwise the build breaks.
 
 Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 ---
- src/make-event-names.py |    2 ++
+ src/make-event-names.py | 2 ++
  1 file changed, 2 insertions(+)
 
-Index: evemu-1.2.0/src/make-event-names.py
-===================================================================
---- evemu-1.2.0.orig/src/make-event-names.py
-+++ evemu-1.2.0/src/make-event-names.py
-@@ -91,7 +91,9 @@
- 	print "#ifndef EVENT_NAMES_H"
- 	print "#define EVENT_NAMES_H"
- 	print ""
-+	print "#ifndef SYN_MAX"
- 	print "#define SYN_MAX 3 /* linux/input.h doesn't define that */"
-+	print "#endif"
- 	print ""
+diff --git a/src/make-event-names.py b/src/make-event-names.py
+index bc77f2c..2d0924d 100755
+--- a/src/make-event-names.py
++++ b/src/make-event-names.py
+@@ -92,7 +92,9 @@ def print_mapping_table(bits):
+ 	print("#ifndef EVENT_NAMES_H")
+ 	print("#define EVENT_NAMES_H")
+ 	print("")
++	print("#ifndef SYN_MAX")
+ 	print("#define SYN_MAX 3 /* linux/input.h doesn't define that */")
++	print("#endif")
+ 	print("")
  
  	for prefix in prefixes:
diff --git a/package/evemu/evemu-0002-configure.ac-add-disable-tests-option.patch b/package/evemu/evemu-0002-configure.ac-add-disable-tests-option.patch
index cbc025d..c470c44 100644
--- a/package/evemu/evemu-0002-configure.ac-add-disable-tests-option.patch
+++ b/package/evemu/evemu-0002-configure.ac-add-disable-tests-option.patch
@@ -1,4 +1,4 @@
-From 077722193e4e59e76591abbaddac9d22068be4e6 Mon Sep 17 00:00:00 2001
+From 628835a5addbe3dbf49fbd221b3785518c7b26ac Mon Sep 17 00:00:00 2001
 From: Peter Seiderer <ps.report@gmx.net>
 Date: Sun, 27 Apr 2014 13:14:51 +0200
 Subject: [PATCH] configure.ac: add '--disable-tests' option
@@ -20,10 +20,10 @@ index 7b68f3d..a83b35f 100644
  pkgconfigdir = $(libdir)/pkgconfig
  pkgconfig_DATA = evemu.pc
 diff --git a/configure.ac b/configure.ac
-index ec21a6e..4e0c3b8 100644
+index 239811c..c7e16b3 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -43,6 +43,15 @@ if test "x$XMLTO" = "x" || test "x$ASCIIDOC" = "x"; then
+@@ -45,6 +45,15 @@ if test "x$XMLTO" = "x" || test "x$ASCIIDOC" = "x"; then
  	AC_MSG_WARN([xmlto or asciidoc not found - cannot create man pages without it])
  fi
  
@@ -37,7 +37,7 @@ index ec21a6e..4e0c3b8 100644
 +AC_SUBST([SUBDIR_TESTS])
 +
  AC_SUBST(AM_CFLAGS,
-          "-Wall -Wextra -pedantic")
+          "-Wall -Wextra")
  
 -- 
 1.8.1.4
diff --git a/package/evemu/evemu-0003-make-event-names-use-input.h-from-sysroot-instead-of.patch b/package/evemu/evemu-0003-make-event-names-use-input.h-from-sysroot-instead-of.patch
index e8a1f55..5ac3e74 100644
--- a/package/evemu/evemu-0003-make-event-names-use-input.h-from-sysroot-instead-of.patch
+++ b/package/evemu/evemu-0003-make-event-names-use-input.h-from-sysroot-instead-of.patch
@@ -1,4 +1,4 @@
-From d2c08aafcae8a0af3cb5a6ae873bbcbd567eae95 Mon Sep 17 00:00:00 2001
+From 6e0a0631d97b17a82f6ce1996bcb49ee2dbe1544 Mon Sep 17 00:00:00 2001
 From: Peter Seiderer <ps.report@gmx.net>
 Date: Fri, 25 Apr 2014 22:30:06 +0200
 Subject: [PATCH] make-event-names: use input.h from sysroot (instead of host
@@ -10,13 +10,13 @@ Signed-off-by: Peter Seiderer <ps.report@gmx.net>
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/src/make-event-names.py b/src/make-event-names.py
-index 2092cfd..5bbc669 100755
+index 2d0924d..945d473 100755
 --- a/src/make-event-names.py
 +++ b/src/make-event-names.py
-@@ -7,8 +7,10 @@
+@@ -10,8 +10,10 @@ from __future__ import print_function
+ import argparse
  import re
  import sys
- import argparse
 +import os
  
 -SOURCE_FILE = "/usr/include/linux/input.h"
diff --git a/package/evemu/evemu-0004-make-event-names-fix-for-python3-print-syntax.patch b/package/evemu/evemu-0004-make-event-names-fix-for-python3-print-syntax.patch
deleted file mode 100644
index 156d374..0000000
--- a/package/evemu/evemu-0004-make-event-names-fix-for-python3-print-syntax.patch
+++ /dev/null
@@ -1,162 +0,0 @@
-From da078b9ae22c86279a48ab9888a7b4a6eeadecda Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Sat, 26 Apr 2014 22:32:46 +0200
-Subject: [PATCH] make-event-names: fix for python3 print syntax
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- src/make-event-names.py | 98 ++++++++++++++++++++++++-------------------------
- 1 file changed, 49 insertions(+), 49 deletions(-)
-
-diff --git a/src/make-event-names.py b/src/make-event-names.py
-index 849d577..1c32bc8 100755
---- a/src/make-event-names.py
-+++ b/src/make-event-names.py
-@@ -44,59 +44,59 @@ blacklist = [
- def print_bits(bits, prefix):
- 	if  not hasattr(bits, prefix):
- 		return
--	print "static const char * const %s_map[%s_MAX + 1] = {" % (prefix, prefix.upper())
--	print "	[0 ... %s_MAX] = NULL," % prefix.upper()
-+	print ("static const char * const %s_map[%s_MAX + 1] = {" % (prefix, prefix.upper()))
-+	print ("	[0 ... %s_MAX] = NULL," % prefix.upper())
- 	for val, name in getattr(bits, prefix).items():
--		print "	[%s] = \"%s\"," % (name, name)
--	print "};"
--	print ""
-+		print ("	[%s] = \"%s\"," % (name, name))
-+	print ("};")
-+	print ("")
- 
- def print_python_bits(bits, prefix):
- 	if  not hasattr(bits, prefix):
- 		return
- 
--	print "%s_map = {" % (prefix)
-+	print ("%s_map = {" % (prefix))
- 	for val, name in getattr(bits, prefix).items():
--		print "	%d : \"%s\"," % (val, name)
--	print "}"
--	print "for k, v in %s_map.items():" % (prefix)
--	print "	%s_map[v] = k" % (prefix)
--	print ""
-+		print ("	%d : \"%s\"," % (val, name))
-+	print ("}")
-+	print ("for k, v in %s_map.items():" % (prefix))
-+	print ("	%s_map[v] = k" % (prefix))
-+	print ("")
- 
- def print_map(bits):
--	print "static const char * const * const map[EV_MAX + 1] = {"
--	print "	[0 ... EV_MAX] = NULL,"
-+	print ("static const char * const * const map[EV_MAX + 1] = {")
-+	print ("	[0 ... EV_MAX] = NULL,")
- 
- 	for prefix in prefixes:
- 		if prefix == "BTN_" or prefix == "EV_" or prefix == "INPUT_PROP_":
- 			continue
--		print "	[EV_%s] = %s_map," % (prefix[:-1], prefix[:-1].lower())
-+		print ("	[EV_%s] = %s_map," % (prefix[:-1], prefix[:-1].lower()))
- 
--	print "};"
--	print ""
-+	print ("};")
-+	print ("")
- 
- def print_python_map(bits):
--	print "map = {"
-+	print ("map = {")
- 
- 	for val, name in getattr(bits, "ev").items():
- 		name = name[3:]
- 		if name == "REP" or name == "PWR"  or name == "FF_STATUS"  or name == "MAX":
- 			continue
--		print "	%d : %s_map," % (val, name.lower())
-+		print ("	%d : %s_map," % (val, name.lower()))
- 
--	print "}"
--	print ""
-+	print ("}")
-+	print ("")
- 
- def print_mapping_table(bits):
--	print "/* THIS FILE IS GENERATED, DO NOT EDIT */"
--	print ""
--	print "#ifndef EVENT_NAMES_H"
--	print "#define EVENT_NAMES_H"
--	print ""
--	print "#ifndef SYN_MAX"
--	print "#define SYN_MAX 3 /* linux/input.h doesn't define that */"
--	print "#endif"
--	print ""
-+	print ("/* THIS FILE IS GENERATED, DO NOT EDIT */")
-+	print ("")
-+	print ("#ifndef EVENT_NAMES_H")
-+	print ("#define EVENT_NAMES_H")
-+	print ("")
-+	print ("#ifndef SYN_MAX")
-+	print ("#define SYN_MAX 3 /* linux/input.h doesn't define that */")
-+	print ("#endif")
-+	print ("")
- 
- 	for prefix in prefixes:
- 		if prefix == "BTN_":
-@@ -105,19 +105,19 @@ def print_mapping_table(bits):
- 
- 	print_map(bits)
- 
--	print "static const char * event_get_type_name(int type) {"
--	print "	return ev_map[type];"
--	print " }"
--	print ""
--	print "static const char * event_get_code_name(int type, int code) {"
--	print "	return map[type] ? map[type][code] : NULL;"
--	print "}"
--	print ""
--	print "#endif /* EVENT_NAMES_H */"
-+	print ("static const char * event_get_type_name(int type) {")
-+	print ("	return ev_map[type];")
-+	print (" }")
-+	print ("")
-+	print ("static const char * event_get_code_name(int type, int code) {")
-+	print ("	return map[type] ? map[type][code] : NULL;")
-+	print ("}")
-+	print ("")
-+	print ("#endif /* EVENT_NAMES_H */")
- 
- def print_python_mapping_table(bits):
--	print "# THIS FILE IS GENERATED, DO NOT EDIT"
--	print ""
-+	print ("# THIS FILE IS GENERATED, DO NOT EDIT")
-+	print ("")
- 
- 	for prefix in prefixes:
- 		if prefix == "BTN_":
-@@ -126,15 +126,15 @@ def print_python_mapping_table(bits):
- 
- 	print_python_map(bits)
- 
--	print "def event_get_type_name(type):"
--	print "	return ev_map[type]"
--	print ""
--	print ""
--	print "def event_get_code_name(type, code):"
--	print "	if map.has_key(type) and map[type].has_key(code):"
--	print "		return map[type][code]"
--	print "	return 'UNKNOWN'"
--	print ""
-+	print ("def event_get_type_name(type):")
-+	print ("	return ev_map[type]")
-+	print ("")
-+	print ("")
-+	print ("def event_get_code_name(type, code):")
-+	print ("	if map.has_key(type) and map[type].has_key(code):")
-+	print ("		return map[type][code]")
-+	print ("	return 'UNKNOWN'")
-+	print ("")
- 
- def parse_define(bits, line):
- 	m = re.match(r"^#define\s+(\w+)\s+(\w+)", line)
--- 
-1.8.1.4
-
diff --git a/package/evemu/evemu-0005-configure.ac-add-disable-python-bindings-option.patch b/package/evemu/evemu-0005-configure.ac-add-disable-python-bindings-option.patch
index f174c62..177d018 100644
--- a/package/evemu/evemu-0005-configure.ac-add-disable-python-bindings-option.patch
+++ b/package/evemu/evemu-0005-configure.ac-add-disable-python-bindings-option.patch
@@ -1,4 +1,4 @@
-From 3169736eab530cdbd5d123e7df10f51c44090e0b Mon Sep 17 00:00:00 2001
+From 4618fb3b788715c754872df5fed7bce0186f5089 Mon Sep 17 00:00:00 2001
 From: Peter Seiderer <ps.report@gmx.net>
 Date: Sun, 27 Apr 2014 13:23:41 +0200
 Subject: [PATCH] configure.ac: add '--disable-python-bindings' option
@@ -20,10 +20,10 @@ index a83b35f..fb87c76 100644
  pkgconfigdir = $(libdir)/pkgconfig
  pkgconfig_DATA = evemu.pc
 diff --git a/configure.ac b/configure.ac
-index 4e0c3b8..ab1b553 100644
+index c7e16b3..72c5fdf 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -52,6 +52,17 @@ AS_IF([test "x$enable_tests" != "xno"], [
+@@ -54,6 +54,17 @@ AS_IF([test "x$enable_tests" != "xno"], [
  
  AC_SUBST([SUBDIR_TESTS])
  
@@ -39,7 +39,7 @@ index 4e0c3b8..ab1b553 100644
 +
 +
  AC_SUBST(AM_CFLAGS,
-          "-Wall -Wextra -pedantic")
+          "-Wall -Wextra")
  
 -- 
 1.8.1.4
diff --git a/package/evemu/evemu-0006-Description-fixes-the-syntax-for-raising-exceptions-.patch b/package/evemu/evemu-0006-Description-fixes-the-syntax-for-raising-exceptions-.patch
deleted file mode 100644
index cf3da8b..0000000
--- a/package/evemu/evemu-0006-Description-fixes-the-syntax-for-raising-exceptions-.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Description: fixes the syntax for raising exceptions to be Python2 and Python3
- acceptable.
-Author: Stephen M. Webb
-Bug-Debian: http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=706155
-
---- a/python/evemu/base.py
-+++ b/python/evemu/base.py
-@@ -19,15 +19,15 @@
-     def _call0(self, api_call, *parameters):
-         result = api_call(*parameters)
-         if result == 0 and self.get_c_errno() != 0:
--            raise exception.ExecutionError, "%s: %s" % (
--                api_call.__name__, self.get_c_error())
-+            raise exception.ExecutionError("%s: %s" % (
-+                api_call.__name__, self.get_c_error()))
-         return result
- 
-     def _call(self, api_call, *parameters):
-         result = api_call(*parameters)
-         if result < 0 and self.get_c_errno() != 0:
--            raise exception.ExecutionError, "%s: %s" % (
--                api_call.__name__, self.get_c_error())
-+            raise exception.ExecutionError("%s: %s" % (
-+                api_call.__name__, self.get_c_error()))
-         return result
- 
-     def get_c_errno(self):
diff --git a/package/evemu/evemu-0007-python-fix-device-open-for-python3.patch b/package/evemu/evemu-0007-python-fix-device-open-for-python3.patch
deleted file mode 100644
index ec989d2..0000000
--- a/package/evemu/evemu-0007-python-fix-device-open-for-python3.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From f192db7848962a1616e243bb60e705da6c6f3412 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Sun, 27 Apr 2014 01:16:16 +0200
-Subject: [PATCH] python: fix device open for python3
-
-- use 'rb' instead of 'r+b', fixes:
-
->>> import evemu
->>> evemu.Device('/dev/input/event0')
-Traceback (most recent call last):
-  File "<stdin>", line 1, in <module>
-  File "/usr/lib/python3.4/site-packages/evemu/__init__.py", line 50, in __init__
-io.UnsupportedOperation: File or stream is not seekable.
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- python/evemu/__init__.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/python/evemu/__init__.py b/python/evemu/__init__.py
-index abdbf7e..aa73871 100644
---- a/python/evemu/__init__.py
-+++ b/python/evemu/__init__.py
-@@ -47,7 +47,7 @@ class Device(object):
-         """
- 
-         if type(f).__name__ == 'str':
--            self._file = open(f, 'r+b')
-+            self._file = open(f, 'rb')
-         elif type(f).__name__ == 'file':
-             self._file = f
-         else:
--- 
-1.8.1.4
-
diff --git a/package/evemu/evemu.mk b/package/evemu/evemu.mk
index 9f7f4af..5f9f447 100644
--- a/package/evemu/evemu.mk
+++ b/package/evemu/evemu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EVEMU_VERSION = 1.2.0
+EVEMU_VERSION = 2.0.0
 EVEMU_SITE = http://cgit.freedesktop.org/evemu/snapshot
 EVEMU_LICENSE = LGPLv3 (library), GPLv3 (tools)
 EVEMU_LICENSE_FILES = COPYING COPYING.GPL3
-- 
1.8.1.4
