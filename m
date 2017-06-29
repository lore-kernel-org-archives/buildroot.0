From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Wed, 28 Jun 2017 23:45:48 -0300
Subject: [Buildroot] [PATCH 8/9] support/testing: run testcases in parallel
In-Reply-To: <20170629024549.30484-1-ricardo.martincoski@gmail.com>
References: <20170629024549.30484-1-ricardo.martincoski@gmail.com>
Message-ID: <20170629024549.30484-9-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Let the user to pass -t to set the number of testcases to run
simultaneously.

When -j is not specified, calculate it to split the available cores
between the simultaneous testcases.

Example of auto calculated -j for cpu_count 8:
  -t -j  total
   1  9  9
   2  4  8
   3  3  9
   4  2  8
 >=5  1  t

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 support/testing/conf/unittest.cfg |  1 -
 support/testing/run-tests         | 18 ++++++++++++++++++
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/support/testing/conf/unittest.cfg b/support/testing/conf/unittest.cfg
index 6eaa234fc9..4f516fb80a 100644
--- a/support/testing/conf/unittest.cfg
+++ b/support/testing/conf/unittest.cfg
@@ -2,5 +2,4 @@
 plugins = nose2.plugins.mp
 
 [multiprocess]
-processes = 1
 always-on = True
diff --git a/support/testing/run-tests b/support/testing/run-tests
index e560ec7720..0cb673c61f 100755
--- a/support/testing/run-tests
+++ b/support/testing/run-tests
@@ -3,6 +3,7 @@ import argparse
 import sys
 import os
 import nose2
+import multiprocessing
 
 from infra.basetest import BRTest
 
@@ -23,6 +24,8 @@ def main():
     parser.add_argument('-k', '--keep',
                         help='keep build directories',
                         action='store_true')
+    parser.add_argument('-t', '--testcases', type=int, default=1,
+                        help='number of testcases to run simultaneously')
     parser.add_argument('-j', '--jlevel', type=int,
                         help='BR2_JLEVEL to use for each testcase')
 
@@ -72,15 +75,30 @@ def main():
 
     BRTest.keepbuilds = args.keep
 
+    if args.testcases != 1:
+        if args.testcases < 1:
+            print "Invalid number of testcases to run simultaneously"
+            print ""
+            parser.print_help()
+            return 1
+        # same default BR2_JLEVEL as package/Makefile.in
+        br2_jlevel = 1 + multiprocessing.cpu_count()
+        each_testcase = br2_jlevel / args.testcases
+        if each_testcase < 1:
+            each_testcase = 1
+        BRTest.jlevel = each_testcase
+
     if args.jlevel:
         if args.jlevel < 0:
             print "Invalid BR2_JLEVEL to use for each testcase"
             print ""
             parser.print_help()
             return 1
+        # the user can override the auto calculated value
         BRTest.jlevel = args.jlevel
 
     nose2_args = ["-v",
+                  "-N", str(args.testcases),
                   "-s", "support/testing",
                   "-c", "support/testing/conf/unittest.cfg"]
 
-- 
2.11.0
