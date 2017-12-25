From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 25 Dec 2017 11:41:43 -0600
Subject: [Buildroot] [PATCH] autobuilder: hung package monitor
Message-ID: <1514223703-5356-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The current autobuild script uses the timeout
application to manage a total duration of the
build.

This patchset updates the total duration to instead
follow the build-time.log and monitor for updates to
determine if a package has hung for at most #mins
before killing the build and reporting a timeout.

The new hung timeout is currently set to 60mins.

This allows infinite sized defconfigs as we get to a lower
number of autobr failures. With less failures, we start
to see false timeouts when we hit the MAX_DURATION(8hrs).

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 scripts/autobuild-run | 61 +++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 52 insertions(+), 9 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 2949417..2085da0 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -143,6 +143,8 @@ import sys
 from time import localtime, strftime
 from distutils.version import StrictVersion
 import platform
+from threading import Thread, Event
+import time
 
 if sys.hexversion >= 0x3000000:
     import configparser
@@ -167,7 +169,7 @@ else:
     decode_bytes = _identity
     encode_str = _identity
 
-MAX_DURATION = 60 * 60 * 8
+HUNG_BUILD_TIMEOUT = 60 # mins
 VERSION = 1
 
 def log_write(logf, msg):
@@ -199,7 +201,7 @@ def get_branch():
     return branches[randint(0, len(branches) - 1)]
 
 class SystemInfo:
-    DEFAULT_NEEDED_PROGS = ["make", "git", "gcc", "timeout"]
+    DEFAULT_NEEDED_PROGS = ["make", "git", "gcc"]
     DEFAULT_OPTIONAL_PROGS = ["bzr", "java", "javac", "jar"]
 
     def __init__(self):
@@ -358,6 +360,35 @@ def gen_config(**kwargs):
     ret = subprocess.call(args, stdout=devnull, stderr=log)
     return ret
 
+def stop_on_build_hang(build_done_flag, sub_proc, outputdir, log):
+    secBetweenCheck = 30
+    maxNumOfChecks = (HUNG_BUILD_TIMEOUT * 60) / secBetweenCheck
+    hungTimeout = maxNumOfChecks
+    build_time_logfile = os.path.join(outputdir, "build/build-time.log")
+    while True:
+        if build_done_flag.is_set():
+            log_write(log, "DEBUG: monitor thread stopped early")
+            return
+        if os.path.exists(build_time_logfile):
+            time_logfile_h = open(build_time_logfile, "r")
+            break
+        build_done_flag.wait(10)
+
+    while not build_done_flag.is_set():
+        line = time_logfile_h.readlines()
+        if not line:
+            hungTimeout -= 1
+        else:
+            hungTimeout = maxNumOfChecks
+        if hungTimeout < 0:
+            if sub_proc.poll() is None:
+                log_write(log, "DEBUG: killing process hung for %dmin" % HUNG_BUILD_TIMEOUT)
+                sub_proc.kill()
+            break
+        build_done_flag.wait(secBetweenCheck)
+    log_write(log, "DEBUG: monitor thread stopped")
+    time_logfile_h.close()
+
 def do_build(**kwargs):
     """Run the build itself"""
 
@@ -375,25 +406,37 @@ def do_build(**kwargs):
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
+    build_done_flag = Event()
+    build_monitor = Thread(target=stop_on_build_hang,
+                           args=(build_done_flag, sub, outputdir, log))
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
+    if not build_monitor.isAlive():
+        log_write(log, "INFO: build timed out [%d]" % ret)
         return -2
+    else:
+        # Stop monitor thread as this build didn't timeout
+        build_done_flag.set()
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
1.9.1
