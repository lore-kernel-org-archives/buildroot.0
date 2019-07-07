From: Atharva Lele <itsatharva@gmail.com>
Date: Sun,  7 Jul 2019 10:58:21 +0530
Subject: [Buildroot] [PATCH v3 21/31] autobuild-run: move check_version() to
 Builder class
In-Reply-To: <20190707052831.9469-1-itsatharva@gmail.com>
References: <20190707052831.9469-1-itsatharva@gmail.com>
Message-ID: <20190707052831.9469-21-itsatharva@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upcoming patch from Thomas needs check_version() to
use http_url. As that is inside Builder class and check_version()
is only used inside Builder class, move it inside the class.

Also remove the redundant call to check_version() from main().
We already call check_version() in run_instance(). Also the fact
that we cannot call check_version() in main() since the builder
class object is not defined at that point.

Signed-off-by: Atharva Lele <itsatharva@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Changes v1 -> v2:
  - New patch
---
 scripts/autobuild-run | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 8a0bec7..391c1dc 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -178,13 +178,6 @@ def log_write(logf, msg):
     logf.write("[%s] %s\n" % (strftime("%a, %d %b %Y %H:%M:%S", localtime()), msg))
     logf.flush()
 
-def check_version():
-    with urlopen_closing('http://autobuild.buildroot.org/version') as r:
-        version = int(decode_bytes(r.readline()).strip())
-    if version > VERSION:
-        print("ERROR: script version too old, please upgrade.")
-        sys.exit(1)
-
 def get_branch():
     """Returns the branch that should be built. It fetches a CSV file from
     autobuild.buildroot.org that provides the list of branches to test
@@ -306,6 +299,13 @@ class Builder:
         else:
             self.log = open(os.path.join(self.idir, "instance.log"), "a+")
 
+    def check_version(self):
+        with urlopen_closing('http://autobuild.buildroot.org/version') as r:
+            version = int(decode_bytes(r.readline()).strip())
+        if version > VERSION:
+            print("ERROR: script version too old, please upgrade.")
+            sys.exit(1)
+
     def prepare_build(self):
         """Prepare for the next build of the specified instance
 
@@ -706,7 +706,7 @@ class Builder:
         log_write(self.log, "INFO: instance started")
 
         while True:
-            check_version()
+            self.check_version()
 
             ret = self.prepare_build()
             if ret != 0:
@@ -765,7 +765,6 @@ def main():
     # showing error messages in another language.
     os.environ['LC_ALL'] = 'C'
 
-    check_version()
     sysinfo = SystemInfo()
 
     args = docopt.docopt(doc, version=VERSION)
-- 
2.22.0
