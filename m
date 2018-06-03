From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  3 Jun 2018 11:08:21 +0200
Subject: [Buildroot] [PATCH 4/5] support/testing: fix python syntax
In-Reply-To: <cover.1528016895.git.yann.morin.1998@free.fr>
References: <cover.1528016895.git.yann.morin.1998@free.fr>
Message-ID: <2ae621feecea77223421234eaef0de7032c841d1.1528016895.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix three issues with code style in our test infra:
  - 'print' is now a function,
  - exceptions need to be caught-assigned with the 'as' keyword,
  - old-style "%s"%() formatting is deprecated.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>

---
Changes v1 -> v2:
  - this was previously caught because of a spurious switch to
    python3-flake8, as noticed by Ricardo. We're now back to using
    python-flake8, so the rationale has changed. Still, we do want
    to fix those because it makes sense anyway.
---
 support/testing/infra/__init__.py |  6 +++---
 support/testing/infra/basetest.py |  4 ++--
 support/testing/run-tests         | 26 +++++++++++++-------------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/support/testing/infra/__init__.py b/support/testing/infra/__init__.py
index b03e891771..b0f28de450 100644
--- a/support/testing/infra/__init__.py
+++ b/support/testing/infra/__init__.py
@@ -34,17 +34,17 @@ def download(dldir, filename):
         os.makedirs(dldir)
 
     tmpfile = tempfile.mktemp(dir=dldir)
-    print "Downloading to {}".format(tmpfile)
+    print("Downloading to {0}".format(tmpfile))
 
     try:
         url_fh = urlopen(os.path.join(ARTIFACTS_URL, filename))
         with open(tmpfile, "w+") as tmpfile_fh:
             tmpfile_fh.write(url_fh.read())
-    except (HTTPError, URLError), err:
+    except (HTTPError, URLError) as err:
         os.unlink(tmpfile)
         raise err
 
-    print "Renaming from %s to %s" % (tmpfile, finalpath)
+    print("Renaming from {0} to {1}".format(tmpfile, finalpath))
     os.rename(tmpfile, finalpath)
     return finalpath
 
diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
index f3f13ad97f..82756afefd 100644
--- a/support/testing/infra/basetest.py
+++ b/support/testing/infra/basetest.py
@@ -46,8 +46,8 @@ class BRTest(unittest.TestCase):
         self.config += "\nBR2_JLEVEL={}\n".format(self.jlevel)
 
     def show_msg(self, msg):
-        print "{} {:40s} {}".format(datetime.datetime.now().strftime("%H:%M:%S"),
-                                    self.testname, msg)
+        print("{0} {1:40s} {2}".format(datetime.datetime.now().strftime("%H:%M:%S"),
+                                       self.testname, msg))
 
     def setUp(self):
         self.show_msg("Starting")
diff --git a/support/testing/run-tests b/support/testing/run-tests
index 270e78cff7..76dd15e9f0 100755
--- a/support/testing/run-tests
+++ b/support/testing/run-tests
@@ -41,7 +41,7 @@ def main():
         BRTest.logtofile = False
 
     if args.list:
-        print "List of tests"
+        print("List of tests")
         nose2.discover(argv=[script_path,
                              "-s", test_dir,
                              "-v",
@@ -52,16 +52,16 @@ def main():
     if args.download is None:
         args.download = os.getenv("BR2_DL_DIR")
         if args.download is None:
-            print "Missing download directory, please use -d/--download"
-            print ""
+            print("Missing download directory, please use -d/--download")
+            print("")
             parser.print_help()
             return 1
 
     BRTest.downloaddir = os.path.abspath(args.download)
 
     if args.output is None:
-        print "Missing output directory, please use -o/--output"
-        print ""
+        print("Missing output directory, please use -o/--output")
+        print("")
         parser.print_help()
         return 1
 
@@ -71,8 +71,8 @@ def main():
     BRTest.outputdir = os.path.abspath(args.output)
 
     if args.all is False and len(args.testname) == 0:
-        print "No test selected"
-        print ""
+        print("No test selected")
+        print("")
         parser.print_help()
         return 1
 
@@ -80,8 +80,8 @@ def main():
 
     if args.testcases != 1:
         if args.testcases < 1:
-            print "Invalid number of testcases to run simultaneously"
-            print ""
+            print("Invalid number of testcases to run simultaneously")
+            print("")
             parser.print_help()
             return 1
         # same default BR2_JLEVEL as package/Makefile.in
@@ -93,16 +93,16 @@ def main():
 
     if args.jlevel:
         if args.jlevel < 0:
-            print "Invalid BR2_JLEVEL to use for each testcase"
-            print ""
+            print("Invalid BR2_JLEVEL to use for each testcase")
+            print("")
             parser.print_help()
             return 1
         # the user can override the auto calculated value
         BRTest.jlevel = args.jlevel
 
     if args.timeout_multiplier < 1:
-        print "Invalid multiplier for timeout values"
-        print ""
+        print("Invalid multiplier for timeout values")
+        print("")
         parser.print_help()
         return 1
     BRTest.timeout_multiplier = args.timeout_multiplier
-- 
2.14.1
