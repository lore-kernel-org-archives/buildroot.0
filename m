From: Atharva Lele <itsatharva@gmail.com>
Date: Fri, 21 Jun 2019 14:17:25 +0530
Subject: [Buildroot] [PATCH 14/19] autobuild-run: move log variable to
 Builder class
In-Reply-To: <20190621084730.16411-1-itsatharva@gmail.com>
References: <20190621084730.16411-1-itsatharva@gmail.com>
Message-ID: <20190621084730.16411-14-itsatharva@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Atharva Lele <itsatharva@gmail.com>
---
 scripts/autobuild-run | 94 ++++++++++++++++++++-----------------------
 1 file changed, 43 insertions(+), 51 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index e69020c..ff8ef0a 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -293,6 +293,11 @@ class Builder:
         # frequently needed directories
         self.idir = "instance-%d" % self.instance
 
+        if self.debug:
+            self.log = sys.stdout
+        else:
+            self.log = open(os.path.join(self.idir, "instance.log"), "a+")
+
     def prepare_build(self, **kwargs):
         """Prepare for the next build of the specified instance
 
@@ -301,9 +306,7 @@ class Builder:
         code, and cleaning up remaining stuff from previous builds.
         """
 
-        log = kwargs['log']
-
-        log_write(log, "INFO: preparing a new build")
+        log_write(self.log, "INFO: preparing a new build")
 
         # Create the download directory if it doesn't exist
         dldir = os.path.join(self.idir, "dl")
@@ -332,33 +335,33 @@ class Builder:
             if not flist:
                 break
             f = flist[randint(0, len(flist) - 1)]
-            log_write(log, "INFO: removing %s from downloads" %
+            log_write(self.log, "INFO: removing %s from downloads" %
                     os.path.relpath(f, dldir))
             os.remove(f)
 
         branch = get_branch()
-        log_write(log, "INFO: testing branch '%s'" % branch)
+        log_write(self.log, "INFO: testing branch '%s'" % branch)
 
         # Clone Buildroot. This only happens if the source directory
         # didn't exist already.
         srcdir = os.path.join(self.idir, "buildroot")
         if not os.path.exists(srcdir):
             ret = subprocess.call(["git", "clone", self.repo, srcdir],
-                                stdout=log, stderr=log)
+                                stdout=self.log, stderr=self.log)
             if ret != 0:
-                log_write(log, "ERROR: could not clone Buildroot sources")
+                log_write(self.log, "ERROR: could not clone Buildroot sources")
                 return -1
 
         # Update the Buildroot sources.
         abssrcdir = os.path.abspath(srcdir)
-        ret = subprocess.call(["git", "fetch", "origin"], cwd=abssrcdir, stdout=log, stderr=log)
+        ret = subprocess.call(["git", "fetch", "origin"], cwd=abssrcdir, stdout=self.log, stderr=self.log)
         if ret != 0:
-            log_write(log, "ERROR: could not fetch Buildroot sources")
+            log_write(self.log, "ERROR: could not fetch Buildroot sources")
             return -1
 
-        ret = subprocess.call(["git", "checkout", "--detach", "origin/%s" % branch], cwd=abssrcdir, stdout=log, stderr=log)
+        ret = subprocess.call(["git", "checkout", "--detach", "origin/%s" % branch], cwd=abssrcdir, stdout=self.log, stderr=self.log)
         if ret != 0:
-            log_write(log, "ERROR: could not check out Buildroot sources")
+            log_write(self.log, "ERROR: could not check out Buildroot sources")
             return -1
 
         # Create an empty output directory. We remove it first, in case a previous build was aborted.
@@ -374,14 +377,13 @@ class Builder:
 
     def gen_config(self, **kwargs):
         """Generate a new random configuration."""
-        log = kwargs['log']
         outputdir = os.path.abspath(os.path.join(self.idir, "output"))
         srcdir = os.path.join(self.idir, "buildroot")
 
-        log_write(log, "INFO: generate the configuration")
+        log_write(self.log, "INFO: generate the configuration")
 
         if self.debug:
-            devnull = log
+            devnull = self.log
         else:
             devnull = open(os.devnull, "w")
 
@@ -394,12 +396,12 @@ class Builder:
                 toolchains_csv = os.path.join(srcdir, toolchains_csv)
             args.extend(["--toolchains-csv", toolchains_csv])
 
-        ret = subprocess.call(args, stdout=devnull, stderr=log)
+        ret = subprocess.call(args, stdout=devnull, stderr=self.log)
         return ret
 
     def stop_on_build_hang(self, monitor_thread_hung_build_flag,
                         monitor_thread_stop_flag,
-                        sub_proc, outputdir, log):
+                        sub_proc, outputdir):
         build_time_logfile = os.path.join(outputdir, "build/build-time.log")
         while True:
             if monitor_thread_stop_flag.is_set():
@@ -410,7 +412,7 @@ class Builder:
                 if mtime < datetime.datetime.now() - datetime.timedelta(minutes=HUNG_BUILD_TIMEOUT):
                     if sub_proc.poll() is None:
                         monitor_thread_hung_build_flag.set() # Used by do_build() to determine build hang
-                        log_write(log, "INFO: build hung")
+                        log_write(self.log, "INFO: build hung")
                         sub_proc.kill()
                     break
             monitor_thread_stop_flag.wait(30)
@@ -422,7 +424,6 @@ class Builder:
         installed, fallback to cmp
         """
 
-        log = kwargs['log']
         outputdir = os.path.join(self.idir, "output")
         srcdir = os.path.join(self.idir, "buildroot")
         reproducible_results = os.path.join(outputdir, "results", "reproducible_results")
@@ -436,26 +437,24 @@ class Builder:
                 prefix = subprocess.check_output(["make", "O=%s" % outputdir, "-C", srcdir, "printvars", "VARS=TARGET_CROSS"])
                 # Remove TARGET_CROSS= and \n from the string
                 prefix = prefix[13:-1]
-                log_write(log, "INFO: running diffoscope on images")
+                log_write(self.log, "INFO: running diffoscope on images")
                 subprocess.call(["diffoscope", build_1_image, build_2_image,
-                                    "--tool-prefix-binutils", prefix], stdout=diff, stderr=log)
+                                    "--tool-prefix-binutils", prefix], stdout=diff, stderr=self.log)
             else:
-                log_write(log, "INFO: diffoscope not installed, falling back to cmp")
-                subprocess.call(["cmp", "-b", build_1_image, build_2_image], stdout=diff, stderr=log)
+                log_write(self.log, "INFO: diffoscope not installed, falling back to cmp")
+                subprocess.call(["cmp", "-b", build_1_image, build_2_image], stdout=diff, stderr=self.log)
 
         if os.stat(reproducible_results).st_size > 0:
-            log_write(log, "INFO: Build is non-reproducible.")
+            log_write(self.log, "INFO: Build is non-reproducible.")
             return -1
 
         # rootfs images match byte-for-byte -> reproducible image
-        log_write(log, "INFO: Build is reproducible!")
+        log_write(self.log, "INFO: Build is reproducible!")
         return 0
 
     def do_build(self, **kwargs):
         """Run the build itself"""
 
-        log = kwargs['log']
-
         # We need the absolute path to use with O=, because the relative
         # path to the output directory here is not relative to the
         # Buildroot sources, but to the location of the autobuilder
@@ -464,7 +463,7 @@ class Builder:
         outputdir = os.path.abspath(os.path.join(self.idir, "output"))
         srcdir = os.path.join(self.idir, "buildroot")
         f = open(os.path.join(outputdir, "logfile"), "w+")
-        log_write(log, "INFO: build started")
+        log_write(self.log, "INFO: build started")
 
         cmd = ["nice", "-n", str(self.nice),
                 "make", "O=%s" % outputdir,
@@ -479,7 +478,7 @@ class Builder:
         build_monitor = Thread(target=self.stop_on_build_hang,
                             args=(monitor_thread_hung_build_flag,
                                     monitor_thread_stop_flag,
-                                    sub, outputdir, log))
+                                    sub, outputdir))
         build_monitor.daemon = True
         build_monitor.start()
 
@@ -489,7 +488,7 @@ class Builder:
 
         # If build failed, monitor thread would have exited at this point
         if monitor_thread_hung_build_flag.is_set():
-            log_write(log, "INFO: build timed out [%d]" % ret)
+            log_write(self.log, "INFO: build timed out [%d]" % ret)
             return -2
         else:
             # Stop monitor thread as this build didn't timeout
@@ -497,7 +496,7 @@ class Builder:
         # Monitor thread should be exiting around this point
 
         if ret != 0:
-            log_write(log, "INFO: build failed [%d]" % ret)
+            log_write(self.log, "INFO: build failed [%d]" % ret)
             return -1
 
         cmd = ["make", "O=%s" % outputdir, "-C", srcdir,
@@ -505,9 +504,9 @@ class Builder:
             + self.make_opts.split()
         ret = subprocess.call(cmd, stdout=f, stderr=f)
         if ret != 0:
-            log_write(log, "INFO: build failed during legal-info")
+            log_write(self.log, "INFO: build failed during legal-info")
             return -1
-        log_write(log, "INFO: build successful")
+        log_write(self.log, "INFO: build successful")
         return 0
 
     def do_reproducible_build(self, **kwargs):
@@ -519,13 +518,12 @@ class Builder:
 
         outputdir = os.path.abspath(os.path.join(self.idir, "output"))
         srcdir = os.path.join(self.idir, "buildroot")
-        log = kwargs['log']
 
         # Start the first build
-        log_write(log, "INFO: Reproducible Build Test, starting build 1")
+        log_write(self.log, "INFO: Reproducible Build Test, starting build 1")
         ret = self.do_build(**kwargs)
         if ret != 0:
-            log_write(log, "INFO: build 1 failed, skipping build 2")
+            log_write(self.log, "INFO: build 1 failed, skipping build 2")
             return ret
 
         # First build has been built, move files and start build 2
@@ -536,10 +534,10 @@ class Builder:
         subprocess.call(["make", "O=%s" % outputdir, "-C", srcdir, "clean"], stdout=f, stderr=f)
 
         # Start the second build
-        log_write(log, "INFO: Reproducible Build Test, starting build 2")
+        log_write(self.log, "INFO: Reproducible Build Test, starting build 2")
         ret = self.do_build(**kwargs)
         if ret != 0:
-            log_write(log, "INFO: build 2 failed")
+            log_write(self.log, "INFO: build 2 failed")
             return ret
 
         # Assuming both have built successfully
@@ -554,8 +552,6 @@ class Builder:
         are available) or stores them locally as tarballs.
         """
 
-        log = kwargs['log']
-
         outputdir = os.path.abspath(os.path.join(self.idir, "output"))
         srcdir = os.path.join(self.idir, "buildroot")
         resultdir = os.path.join(outputdir, "results")
@@ -681,9 +677,9 @@ class Builder:
         # Yes, shutil.make_archive() would be nice, but it doesn't exist
         # in Python 2.6.
         ret = subprocess.call(["tar", "cjf", "results.tar.bz2", "results"],
-                            cwd=outputdir, stdout=log, stderr=log)
+                            cwd=outputdir, stdout=self.log, stderr=self.log)
         if ret != 0:
-            log_write(log, "ERROR: could not make results tarball")
+            log_write(self.log, "ERROR: could not make results tarball")
             sys.exit(1)
 
         if self.upload:
@@ -696,18 +692,18 @@ class Builder:
                                 "-F", "uploadedfile=@%s" % os.path.join(outputdir, "results.tar.bz2"),
                                 "-F", "uploadsubmit=1",
                                 self.http_url],
-                                stdout=log, stderr=log)
+                                stdout=self.log, stderr=self.log)
             if ret != 0:
-                log_write(log, "INFO: results could not be submitted, %d" % ret)
+                log_write(self.log, "INFO: results could not be submitted, %d" % ret)
             else:
-                log_write(log, "INFO: results were submitted successfully")
+                log_write(self.log, "INFO: results were submitted successfully")
         else:
             # No http login/password, keep tarballs locally
             with open(os.path.join(outputdir, "results.tar.bz2"), 'rb') as f:
                 sha1 = hashlib.sha1(f.read()).hexdigest()
             resultfilename = "instance-%d-%s.tar.bz2" % (self.instance, sha1)
             os.rename(os.path.join(outputdir, "results.tar.bz2"), resultfilename)
-            log_write(log, "INFO: results saved as %s" % resultfilename)
+            log_write(self.log, "INFO: results saved as %s" % resultfilename)
 
     def run_instance(self, **kwargs):
         """Main per-instance loop
@@ -720,11 +716,7 @@ class Builder:
         if not os.path.exists(self.idir):
             os.mkdir(self.idir)
 
-        if self.debug:
-            kwargs['log'] = sys.stdout
-        else:
-            kwargs['log'] = open(os.path.join(self.idir, "instance.log"), "a+")
-        log_write(kwargs['log'], "INFO: instance started")
+        log_write(self.log, "INFO: instance started")
 
         while True:
             check_version()
@@ -738,7 +730,7 @@ class Builder:
 
             ret = self.gen_config(**kwargs)
             if ret != 0:
-                log_write(kwargs['log'], "WARN: failed to generate configuration")
+                log_write(self.log, "WARN: failed to generate configuration")
                 continue
 
             # Check if the build test is supposed to be a reproducible test
-- 
2.20.1
