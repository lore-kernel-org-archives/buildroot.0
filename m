From: Atharva Lele <itsatharva@gmail.com>
Date: Thu,  1 Aug 2019 08:16:40 +0530
Subject: [Buildroot] [PATCH v4 27/30] autobuild-run: modify do_build() to
 accept outputdir as argument
In-Reply-To: <20190801024643.11024-1-itsatharva@gmail.com>
References: <20190801024643.11024-1-itsatharva@gmail.com>
Message-ID: <20190801024643.11024-28-itsatharva@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pass outputdir to do_build() so in future patches we can pass
different output directories to increase variance in case of
reproducibility testing.

Signed-off-by: Atharva Lele <itsatharva@gmail.com>
---
Changes v3:
  - New patch
---
 scripts/autobuild-run | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 09dd520..7c05234 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -454,14 +454,14 @@ class Builder:
         log_write(self.log, "INFO: Build is reproducible!")
         return 0
 
-    def do_build(self):
+    def do_build(self, outputdir):
         """Run the build itself"""
 
-        f = open(os.path.join(self.outputdir, "logfile"), "w+")
+        f = open(os.path.join(outputdir, "logfile"), "w+")
         log_write(self.log, "INFO: build started")
 
         cmd = ["nice", "-n", str(self.nice),
-               "make", "O=%s" % self.outputdir,
+               "make", "O=%s" % outputdir,
                "-C", self.srcdir, "BR2_DL_DIR=%s" % self.dldir,
                "BR2_JLEVEL=%s" % self.njobs] \
             + self.make_opts.split()
@@ -473,7 +473,7 @@ class Builder:
         build_monitor = Thread(target=self.stop_on_build_hang,
                                args=(monitor_thread_hung_build_flag,
                                      monitor_thread_stop_flag,
-                                     sub, self.outputdir))
+                                     sub, outputdir))
         build_monitor.daemon = True
         build_monitor.start()
 
@@ -494,7 +494,7 @@ class Builder:
             log_write(self.log, "INFO: build failed [%d]" % ret)
             return -1
 
-        cmd = ["make", "O=%s" % self.outputdir, "-C", self.srcdir,
+        cmd = ["make", "O=%s" % outputdir, "-C", self.srcdir,
                "BR2_DL_DIR=%s" % self.dldir, "legal-info"] \
             + self.make_opts.split()
         ret = subprocess.call(cmd, stdout=f, stderr=f)
@@ -513,7 +513,7 @@ class Builder:
 
         # Start the first build
         log_write(self.log, "INFO: Reproducible Build Test, starting build 1")
-        ret = self.do_build()
+        ret = self.do_build(self.outputdir)
         if ret != 0:
             log_write(self.log, "INFO: build 1 failed, skipping build 2")
             return ret
@@ -527,7 +527,7 @@ class Builder:
 
         # Start the second build
         log_write(self.log, "INFO: Reproducible Build Test, starting build 2")
-        ret = self.do_build()
+        ret = self.do_build(self.outputdir)
         if ret != 0:
             log_write(self.log, "INFO: build 2 failed")
             return ret
-- 
2.22.0
