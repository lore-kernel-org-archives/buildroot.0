From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Tue, 14 Mar 2017 16:42:27 -0700
Subject: [Buildroot] [PATCH v2 1/2] scripts/pycompile: Accomodate latest
	Python 3 codebase
Message-ID: <20170314234228.3744-1-andrew.smirnov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As of the version 3.6.0 compile_dir() call will treat its 'quiet'
argument as a full blown integer rather than a boolean value and perform
integer comparison operations such as '<' or '>='.

To account for that convert ReportProblem type to be a true derivative
of built-in int() and override all of int's rich comparison operators in
order to be able to "sinff" for PyCompileError in all possible use-cases

The integer value ReportProblem pretends to be is teremined by class
variable VALUE which is set to 1.

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Tested-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---

Chagnes since v1 (see [1]):

	- Incorporated Yegor's nits
	- Collected Reviewed-by and Tested-by

[1] http://lists.busybox.net/pipermail/buildroot/2017-March/186160.html

 support/scripts/pycompile.py | 59 ++++++++++++++++++++++++++++++++++----------
 1 file changed, 46 insertions(+), 13 deletions(-)

diff --git a/support/scripts/pycompile.py b/support/scripts/pycompile.py
index fde711a..9f7eb9f 100644
--- a/support/scripts/pycompile.py
+++ b/support/scripts/pycompile.py
@@ -1,24 +1,57 @@
 #!/usr/bin/env python
 
-# Wrapper for python2 and python3 around compileall to raise exception
-# when a python byte code generation failed.
-#
-# Inspired from:
-#   http://stackoverflow.com/questions/615632/how-to-detect-errors-from-compileall-compile-dir
+'''Wrapper for python2 and python3 around compileall to raise exception
+when a python byte code generation failed.
 
+Inspired from:
+   http://stackoverflow.com/questions/615632/how-to-detect-errors-from-compileall-compile-dir
+'''
 from __future__ import print_function
 import sys
 import py_compile
 import compileall
 
-class ReportProblem:
-    def __nonzero__(self):
-        type, value, traceback = sys.exc_info()
-        if type is not None and issubclass(type, py_compile.PyCompileError):
-            print("Cannot compile %s" %value.file)
+def check_for_errors(comparison):
+    '''Wrap comparison operator with code checking for PyCompileError.
+    If PyCompileError was raised, re-raise it again to abort execution,
+    otherwise perform comparison as expected.
+    '''
+    def operator(self, other):
+        exc_type, value, traceback = sys.exc_info()
+        if exc_type is not None and issubclass(exc_type,
+                                               py_compile.PyCompileError):
+            print("Cannot compile %s" % value.file)
             raise value
-        return 1
 
-report_problem = ReportProblem()
+        return comparison(self, other)
 
-compileall.compile_dir(sys.argv[1], quiet=report_problem)
+    return operator
+
+class ReportProblem(int):
+    '''Class that pretends to be an int() object but implements all of its
+    comparison operators such that it'd detect being called in
+    PyCompileError handling context and abort execution
+    '''
+    VALUE = 1
+
+    def __new__(cls, *args, **kwargs):
+        return int.__new__(cls, ReportProblem.VALUE, **kwargs)
+
+    @check_for_errors
+    def __lt__(self, other):
+        return ReportProblem.VALUE < other
+
+    @check_for_errors
+    def __eq__(self, other):
+        return ReportProblem.VALUE == other
+
+    def __ge__(self, other):
+        return not self < other
+
+    def __gt__(self, other):
+        return not self < other and not self == other
+
+    def __ne__(self, other):
+        return not self == other
+
+compileall.compile_dir(sys.argv[1], quiet=ReportProblem())
-- 
2.9.3
