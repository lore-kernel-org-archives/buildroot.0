From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 8 Mar 2017 09:39:26 +0100
Subject: [Buildroot] [PATCH 1/2] scripts/pycompile: Accomodate latest
 Python 3 codebase
In-Reply-To: <20170308000450.6e2b4e93@free-electrons.com>
References: <20170306224852.30968-1-andrew.smirnov@gmail.com>
 <20170308000450.6e2b4e93@free-electrons.com>
Message-ID: <CAGm1_kt3kC0uhdAdJG4PzbuT8CZtQ9XA50=XWbHwSAajogdhrQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi ??????, all,

On Wed, Mar 8, 2017 at 12:04 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Mon,  6 Mar 2017 14:48:51 -0800, Andrey Smirnov wrote:
>> As of the version 3.6.0 compile_dir() call will treat its 'quiet'
>> argument as a full blown integer rather than a boolean value and perform
>> integer comparison operations such as '<' or '>='.
>>
>> To account for that convert ReportProblem type to be a true derivative
>> of built-in int() and override all of int's rich comparison operators in
>> order to be able to "sniff" for PyCompileError in all possible use-cases
>>
>> The integer value ReportProblem pretends to be is determined by class
>> variable VALUE which is set to 1.
>>
>> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
>> ---
>>  support/scripts/pycompile.py | 47 +++++++++++++++++++++++++++++++++++++-------
>>  1 file changed, 40 insertions(+), 7 deletions(-)
>
> Yegor, could you review this patch from Andrey, since you originally
> wrote the pycompile.py logic? Also adding Samuel Martin in Cc.

the patch looks good to me though I'm rather new to decorators concept.
I've tested it with Python 3.5 and python-jinja2 and everything worked as
expected, hence my

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Tested-by: Yegor Yefremov <yegorslists@googlemail.com>

Below my nit-picking (typos, PEP8 etc.):

diff --git a/support/scripts/pycompile.py b/support/scripts/pycompile.py
index 1c28431c7..9f7eb9fd9 100644
--- a/support/scripts/pycompile.py
+++ b/support/scripts/pycompile.py
@@ -1,11 +1,11 @@
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
@@ -17,9 +17,9 @@ def check_for_errors(comparison):
     otherwise perform comparison as expected.
     '''
     def operator(self, other):
-        type, value, traceback = sys.exc_info()
-        if type is not None and issubclass(type,
-                                           py_compile.PyCompileError):
+        exc_type, value, traceback = sys.exc_info()
+        if exc_type is not None and issubclass(exc_type,
+                                               py_compile.PyCompileError):
             print("Cannot compile %s" % value.file)
             raise value

@@ -28,9 +28,9 @@ def check_for_errors(comparison):
     return operator

 class ReportProblem(int):
-    '''Class that pretends to be an int() object but iplements all of its
-    comparisong operators such that it'd detect being called in
-    PyCompileError hadnling context and abort execution
+    '''Class that pretends to be an int() object but implements all of its
+    comparison operators such that it'd detect being called in
+    PyCompileError handling context and abort execution
     '''
     VALUE = 1

Yegor
