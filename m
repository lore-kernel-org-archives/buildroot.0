From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Wed, 28 Jun 2017 23:45:47 -0300
Subject: [Buildroot] [PATCH 7/9] support/testing: allow to set BR2_JLEVEL
In-Reply-To: <20170629024549.30484-1-ricardo.martincoski@gmail.com>
References: <20170629024549.30484-1-ricardo.martincoski@gmail.com>
Message-ID: <20170629024549.30484-8-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Let the user to override the default BR2_JLEVEL used for each testcase.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 support/testing/infra/basetest.py |  6 +++++-
 support/testing/run-tests         | 10 ++++++++++
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
index 557baa215c..d75458a02c 100644
--- a/support/testing/infra/basetest.py
+++ b/support/testing/infra/basetest.py
@@ -34,6 +34,7 @@ class BRTest(unittest.TestCase):
     outputdir = None
     logtofile = True
     keepbuilds = False
+    jlevel = None
 
     def show_msg(self, msg):
         print "{} {:40s} {}".format(datetime.datetime.now().strftime("%H:%M:%S"),
@@ -43,7 +44,10 @@ class BRTest(unittest.TestCase):
         self.builddir = os.path.join(self.__class__.outputdir, self.testname)
         self.emulator = None
         self.show_msg("Starting")
-        self.b = Builder(self.__class__.config, self.builddir, self.logtofile)
+        config = self.__class__.config
+        if self.jlevel:
+            config += "BR2_JLEVEL={}\n".format(self.jlevel)
+        self.b = Builder(config, self.builddir, self.logtofile)
 
         if not self.keepbuilds:
             self.b.delete()
diff --git a/support/testing/run-tests b/support/testing/run-tests
index 07dad0d8b9..e560ec7720 100755
--- a/support/testing/run-tests
+++ b/support/testing/run-tests
@@ -23,6 +23,8 @@ def main():
     parser.add_argument('-k', '--keep',
                         help='keep build directories',
                         action='store_true')
+    parser.add_argument('-j', '--jlevel', type=int,
+                        help='BR2_JLEVEL to use for each testcase')
 
     args = parser.parse_args()
 
@@ -70,6 +72,14 @@ def main():
 
     BRTest.keepbuilds = args.keep
 
+    if args.jlevel:
+        if args.jlevel < 0:
+            print "Invalid BR2_JLEVEL to use for each testcase"
+            print ""
+            parser.print_help()
+            return 1
+        BRTest.jlevel = args.jlevel
+
     nose2_args = ["-v",
                   "-s", "support/testing",
                   "-c", "support/testing/conf/unittest.cfg"]
-- 
2.11.0
