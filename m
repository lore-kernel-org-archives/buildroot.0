From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Fri,  2 Feb 2018 14:28:27 -0600
Subject: [Buildroot] [PATCH] hung build: convert to monitor thread
Message-ID: <20180202202827.2291-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Check the build-time.log and monitor for modifications to
determine if the build has hung for at most #mins
before killing the build and reporting a timeout.

This allows infinite sized builds as we get to a lower
number of autobr fails.  Less failures means we start
to see false timeout failures when we hit the boundary
of the old MAX_DURATION ~8hrs.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

--
Change Log

v2 -> v3
 - Adjust hung timeout to 2hrs as minic, gst-ffmpeg and qt5webkit
   could go beyond 60mins on a minimal 2-4core machine while
   processing a single build step written

v1->v2
[Thomas P.
 - Use mtime vs reading file
 - Use datetime for hung delta check
 - Removed camel case
 - Added hung build event to sync hand-off back to main thread
---
 scripts/autobuild-run | 58 +++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 49 insertions(+), 9 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 2949417..04dffcb 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -143,6 +143,8 @@ import sys
 from time import localtime, strftime
 from distutils.version import StrictVersion
 import platform
+from threading import Thread, Event
+import datetime
 
 if sys.hexversion >= 0x3000000:
     import configparser
@@ -167,7 +169,12 @@ else:
     decode_bytes = _identity
     encode_str = _identity
 
-MAX_DURATION = 60 * 60 * 8
+# The following pkgs can be > 60mins of build time
+# gst-ffmpeg - http://autobuild.buildroot.net/results/5f7/5f7d1847ebd65f221bf18095decaa3383d24a89c/
+# qt5webkit  - http://autobuild.buildroot.net/results/195/195dc9ad4b21f6e7675bed277209ba2480337d54/
+# mimic      - http://autobuild.buildroot.net/results/ae6/ae66d86988d8c7c0ae19597fed9dee4fafd48f90/
+#
+HUNG_BUILD_TIMEOUT = 120 # mins
 VERSION = 1
 
 def log_write(logf, msg):
@@ -199,7 +206,7 @@ def get_branch():
     return branches[randint(0, len(branches) - 1)]
 
 class SystemInfo:
-    DEFAULT_NEEDED_PROGS = ["make", "git", "gcc", "timeout"]
+    DEFAULT_NEEDED_PROGS = ["make", "git", "gcc"]
     DEFAULT_OPTIONAL_PROGS = ["bzr", "java", "javac", "jar"]
 
     def __init__(self):
@@ -358,6 +365,24 @@ def gen_config(**kwargs):
     ret = subprocess.call(args, stdout=devnull, stderr=log)
     return ret
 
+def stop_on_build_hang(monitor_thread_hung_build_flag,
+                       monitor_thread_stop_flag,
+                       sub_proc, outputdir, log):
+    build_time_logfile = os.path.join(outputdir, "build/build-time.log")
+    while True:
+        if monitor_thread_stop_flag.is_set():
+            return
+        if os.path.exists(build_time_logfile):
+            mtime = datetime.datetime.fromtimestamp(os.stat(build_time_logfile).st_mtime)
+
+            if mtime < datetime.datetime.now() - datetime.timedelta(minutes=HUNG_BUILD_TIMEOUT):
+                if sub_proc.poll() is None:
+                    monitor_thread_hung_build_flag.set() # Used by do_build() to determine build hang
+                    log_write(log, "INFO: build hung")
+                    sub_proc.kill()
+                break
+        monitor_thread_stop_flag.wait(30)
+
 def do_build(**kwargs):
     """Run the build itself"""
 
@@ -375,25 +400,40 @@ def do_build(**kwargs):
     f = open(os.path.join(outputdir, "logfile"), "w+")
     log_write(log, "INFO: build started")
 
-    cmd = ["timeout", str(MAX_DURATION),
-            "nice", "-n", str(nice),
+    cmd = ["nice", "-n", str(nice),
             "make", "O=%s" % outputdir,
             "-C", srcdir, "BR2_DL_DIR=%s" % dldir,
             "BR2_JLEVEL=%s" % kwargs['njobs']] \
           + kwargs['make_opts'].split()
     sub = subprocess.Popen(cmd, stdout=f, stderr=f)
+
+    # Setup hung build monitoring thread
+    monitor_thread_hung_build_flag = Event()
+    monitor_thread_stop_flag = Event()
+    build_monitor = Thread(target=stop_on_build_hang,
+                           args=(monitor_thread_hung_build_flag,
+                                 monitor_thread_stop_flag,
+                                 sub, outputdir, log))
+    build_monitor.daemon = True
+    build_monitor.start()
+
     kwargs['buildpid'][kwargs['instance']] = sub.pid
     ret = sub.wait()
     kwargs['buildpid'][kwargs['instance']] = 0
 
-    # 124 is a special error code that indicates we have reached the
-    # timeout
-    if ret == 124:
-        log_write(log, "INFO: build timed out")
+    # If build failed, monitor thread would have exited@this point
+    if monitor_thread_hung_build_flag.is_set():
+        log_write(log, "INFO: build timed out [%d]" % ret)
         return -2
+    else:
+        # Stop monitor thread as this build didn't timeout
+        monitor_thread_stop_flag.set()
+    # Monitor thread should be exiting around this point
+
     if ret != 0:
-        log_write(log, "INFO: build failed")
+        log_write(log, "INFO: build failed [%d]" % ret)
         return -1
+
     cmd = ["make", "O=%s" % outputdir, "-C", srcdir,
             "BR2_DL_DIR=%s" % dldir, "legal-info"] \
           + kwargs['make_opts'].split()
-- 
2.14.2
