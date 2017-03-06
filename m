From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Mon,  6 Mar 2017 14:48:51 -0800
Subject: [Buildroot] [PATCH 1/2] scripts/pycompile: Accomodate latest Python
	3 codebase
Message-ID: <20170306224852.30968-1-andrew.smirnov@gmail.com>
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
order to be able to "sniff" for PyCompileError in all possible use-cases

The integer value ReportProblem pretends to be is determined by class
variable VALUE which is set to 1.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 support/scripts/pycompile.py | 47 +++++++++++++++++++++++++++++++++++++-------
 1 file changed, 40 insertions(+), 7 deletions(-)

diff --git a/support/scripts/pycompile.py b/support/scripts/pycompile.py
index fde711a..1c28431 100644
--- a/support/scripts/pycompile.py
+++ b/support/scripts/pycompile.py
@@ -11,14 +11,47 @@ import sys
 import py_compile
 import compileall
 
-class ReportProblem:
-    def __nonzero__(self):
+def check_for_errors(comparison):
+    '''Wrap comparison operator with code checking for PyCompileError.
+    If PyCompileError was raised, re-raise it again to abort execution,
+    otherwise perform comparison as expected.
+    '''
+    def operator(self, other):
         type, value, traceback = sys.exc_info()
-        if type is not None and issubclass(type, py_compile.PyCompileError):
-            print("Cannot compile %s" %value.file)
+        if type is not None and issubclass(type,
+                                           py_compile.PyCompileError):
+            print("Cannot compile %s" % value.file)
             raise value
-        return 1
 
-report_problem = ReportProblem()
+        return comparison(self, other)
 
-compileall.compile_dir(sys.argv[1], quiet=report_problem)
+    return operator
+
+class ReportProblem(int):
+    '''Class that pretends to be an int() object but iplements all of its
+    comparisong operators such that it'd detect being called in
+    PyCompileError hadnling context and abort execution
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
