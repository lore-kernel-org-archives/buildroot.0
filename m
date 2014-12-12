From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 12 Dec 2014 21:04:55 +0100
Subject: [Buildroot] [PATCH v5 10/11] autobuild-run: kill all children on
	SIGTERM
In-Reply-To: <1418414696-32584-1-git-send-email-patrickdepinguin@gmail.com>
References: <1418414696-32584-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <1418414696-32584-11-git-send-email-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

The autobuild-run spawns the main build process through the timeout
command. To handle its job correctly, this command creates all children
in its own process group, different from the process group of
autobuild-run itself.
Thus, when autobuild-run is killed and the signal handler kills the
entire process group, the build processes run through timeout remain
alive.

To handle this, record the PIDs of the timeout processes in an array
shared between the main autobuild-run process and its instances. The
signal handler will iterate over all active processes in this array, and
kill them explicitly.

If a new timeout process would be started after the signal handler was
invoked but before the entire process tree is killed, this process could
remain alive too. To prevent this from occurring, the signal handler now
starts with terminating all instances.

Lastly, the signal handler would be called for all instances, which is
not intended, so prevent that by uninstalling the signal handler as a
first step of the handler itself.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
 scripts/autobuild-run | 39 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 36 insertions(+), 3 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 237d443..3c448bd 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -97,9 +97,10 @@ import urllib2
 import csv
 from random import randint
 import subprocess
-from multiprocessing import Process
+import multiprocessing
 import signal
 import os
+import errno
 import shutil
 from time import localtime, strftime
 import sys
@@ -444,11 +445,16 @@ def do_build(**kwargs):
     srcdir = os.path.join(idir, "buildroot")
     f = open(os.path.join(outputdir, "logfile"), "w+")
     log_write(log, "INFO: build started")
+
     cmd = ["timeout", str(MAX_DURATION), "make", "O=%s" % outputdir,
             "-C", srcdir, "BR2_DL_DIR=%s" % dldir,
             "BR2_JLEVEL=%s" % kwargs['njobs']] \
           + kwargs['make_opts'].split()
-    ret = subprocess.call(cmd, stdout=f, stderr=f)
+    sub = subprocess.Popen(cmd, stdout=f, stderr=f)
+    kwargs['buildpid'][kwargs['instance']] = sub.pid
+    ret = sub.wait()
+    kwargs['buildpid'][kwargs['instance']] = 0
+
     # 124 is a special error code that indicates we have reached the
     # timeout
     if ret == 124:
@@ -692,8 +698,32 @@ def main():
         print "WARN: tarballs of results will be kept locally only"
 
     def sigterm_handler(signum, frame):
+        """Kill all children"""
+
+        # uninstall signal handler to prevent being called for all subprocesses
+        signal.signal(signal.SIGTERM, signal.SIG_DFL)
+
+        # stop all instances to prevent new children to be spawned
+        for p in processes:
+            p.terminate()
+
+        # kill build processes started with timeout (that puts its children
+        # explicitly in a separate process group)
+        for pid in buildpid:
+            if pid == 0:
+                continue
+            try:
+                os.kill(pid, signal.SIGTERM)
+            except OSError as e:
+                if e.errno != errno.ESRCH: # No such process, ignore
+                    raise
+
+        # kill any remaining children in our process group
         os.killpg(os.getpgid(os.getpid()), signal.SIGTERM)
+
         sys.exit(1)
+
+    buildpid = multiprocessing.Array('i', int(args['--ninstances']))
     processes = []
     for i in range(0, int(args['--ninstances'])):
         p = Process(target=run_instance, kwargs=dict(
@@ -704,11 +734,14 @@ def main():
                 http_password = args['--http-password'],
                 submitter = args['--submitter'],
                 make_opts = args['--make-opts'],
-                upload = upload
+                upload = upload,
+                buildpid = buildpid
             ))
         p.start()
         processes.append(p)
+
     signal.signal(signal.SIGTERM, sigterm_handler)
+
     for p in processes:
         p.join()
 
-- 
1.8.5.1
