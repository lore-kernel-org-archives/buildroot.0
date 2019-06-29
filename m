From: Atharva Lele <itsatharva@gmail.com>
Date: Sat, 29 Jun 2019 10:32:06 +0530
Subject: [Buildroot] [PATCH 19/27] autobuild-run: define output directory as
 part of Builder class
In-Reply-To: <20190629050214.17852-1-itsatharva@gmail.com>
References: <20190629050214.17852-1-itsatharva@gmail.com>
Message-ID: <20190629050214.17852-19-itsatharva@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Absolute path for output dir is required when using outputdir with
system commands like make or tail. It was necessary because the
relative path would be relative to the autobuilder script rather
than the buildroot source directory.

It is OK to use absolute path even where it was not used before
since Python throws away the non-absolute components and uses
the absolute path for os.path.join() wherever it is used.

Signed-off-by: Atharva Lele <itsatharva@gmail.com>
---
 scripts/autobuild-run | 89 +++++++++++++++++++------------------------
 1 file changed, 40 insertions(+), 49 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index d0b31c2..a4a4961 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -294,6 +294,11 @@ class Builder:
         self.idir = "instance-%d" % self.instance
         self.srcdir = os.path.join(self.idir, "buildroot")
         self.dldir = os.path.join(self.idir, "dl")
+        # We need the absolute path to use with O=, because the relative
+        # path to the output directory here is not relative to the
+        # Buildroot sources, but to the location of the autobuilder
+        # script.
+        self.outputdir = os.path.abspath(os.path.join(self.idir, "output"))
 
         if self.debug:
             self.log = sys.stdout
@@ -365,19 +370,17 @@ class Builder:
             return -1
 
         # Create an empty output directory. We remove it first, in case a previous build was aborted.
-        outputdir = os.path.join(self.idir, "output")
-        if os.path.exists(outputdir):
+        if os.path.exists(self.outputdir):
             # shutil.rmtree doesn't remove write-protected files
-            subprocess.call(["rm", "-rf", outputdir])
-        os.mkdir(outputdir)
-        with open(os.path.join(outputdir, "branch"), "w") as branchf:
+            subprocess.call(["rm", "-rf", self.outputdir])
+        os.mkdir(self.outputdir)
+        with open(os.path.join(self.outputdir, "branch"), "w") as branchf:
             branchf.write(branch)
 
         return 0
 
     def gen_config(self):
         """Generate a new random configuration."""
-        outputdir = os.path.abspath(os.path.join(self.idir, "output"))
 
         log_write(self.log, "INFO: generate the configuration")
 
@@ -387,7 +390,7 @@ class Builder:
             devnull = open(os.devnull, "w")
 
         args = [os.path.join(self.srcdir, "utils/genrandconfig"),
-                "-o", outputdir, "-b", self.srcdir]
+                "-o", self.outputdir, "-b", self.srcdir]
 
         toolchains_csv = self.toolchains_csv
         if toolchains_csv:
@@ -399,9 +402,8 @@ class Builder:
         return ret
 
     def stop_on_build_hang(self, monitor_thread_hung_build_flag,
-                           monitor_thread_stop_flag, sub_proc,
-                           outputdir):
-        build_time_logfile = os.path.join(outputdir, "build/build-time.log")
+                           monitor_thread_stop_flag, sub_proc):
+        build_time_logfile = os.path.join(self.outputdir, "build/build-time.log")
         while True:
             if monitor_thread_stop_flag.is_set():
                 return
@@ -423,16 +425,15 @@ class Builder:
         installed, fallback to cmp
         """
 
-        outputdir = os.path.join(self.idir, "output")
-        reproducible_results = os.path.join(outputdir, "results", "reproducible_results")
+        reproducible_results = os.path.join(self.outputdir, "results", "reproducible_results")
         # Using only tar images for now
-        build_1_image = os.path.join(outputdir, "images-1", "rootfs.tar")
-        build_2_image = os.path.join(outputdir, "images", "rootfs.tar")
+        build_1_image = os.path.join(self.outputdir, "images-1", "rootfs.tar")
+        build_2_image = os.path.join(self.outputdir, "images", "rootfs.tar")
 
         with open(reproducible_results, 'w') as diff:
             if self.sysinfo.has("diffoscope"):
                 # Prefix to point diffoscope towards cross-tools
-                prefix = subprocess.check_output(["make", "O=%s" % outputdir, "-C", self.srcdir, "printvars", "VARS=TARGET_CROSS"])
+                prefix = subprocess.check_output(["make", "O=%s" % self.outputdir, "-C", self.srcdir, "printvars", "VARS=TARGET_CROSS"])
                 # Remove TARGET_CROSS= and \n from the string
                 prefix = prefix[13:-1]
                 log_write(self.log, "INFO: running diffoscope on images")
@@ -453,16 +454,11 @@ class Builder:
     def do_build(self):
         """Run the build itself"""
 
-        # We need the absolute path to use with O=, because the relative
-        # path to the output directory here is not relative to the
-        # Buildroot sources, but to the location of the autobuilder
-        # script.
-        outputdir = os.path.abspath(os.path.join(self.idir, "output"))
-        f = open(os.path.join(outputdir, "logfile"), "w+")
+        f = open(os.path.join(self.outputdir, "logfile"), "w+")
         log_write(self.log, "INFO: build started")
 
         cmd = ["nice", "-n", str(self.nice),
-               "make", "O=%s" % outputdir,
+               "make", "O=%s" % self.outputdir,
                "-C", self.srcdir, "BR2_DL_DIR=%s" % self.dldir,
                "BR2_JLEVEL=%s" % self.njobs] \
             + self.make_opts.split()
@@ -472,9 +468,8 @@ class Builder:
         monitor_thread_hung_build_flag = Event()
         monitor_thread_stop_flag = Event()
         build_monitor = Thread(target=self.stop_on_build_hang,
-                               args=(monitor_thread_hung_build_flag,
-                                     monitor_thread_stop_flag,
-                                     sub, outputdir))
+                            args=(monitor_thread_hung_build_flag,
+                                  monitor_thread_stop_flag, sub))
         build_monitor.daemon = True
         build_monitor.start()
 
@@ -495,7 +490,7 @@ class Builder:
             log_write(self.log, "INFO: build failed [%d]" % ret)
             return -1
 
-        cmd = ["make", "O=%s" % outputdir, "-C", self.srcdir,
+        cmd = ["make", "O=%s" % self.outputdir, "-C", self.srcdir,
                "BR2_DL_DIR=%s" % self.dldir, "legal-info"] \
             + self.make_opts.split()
         ret = subprocess.call(cmd, stdout=f, stderr=f)
@@ -512,8 +507,6 @@ class Builder:
         perform the actual build.
         """
 
-        outputdir = os.path.abspath(os.path.join(self.idir, "output"))
-
         # Start the first build
         log_write(self.log, "INFO: Reproducible Build Test, starting build 1")
         ret = self.do_build()
@@ -522,11 +515,11 @@ class Builder:
             return ret
 
         # First build has been built, move files and start build 2
-        os.rename(os.path.join(outputdir, "images"), os.path.join(outputdir, "images-1"))
+        os.rename(os.path.join(self.outputdir, "images"), os.path.join(self.outputdir, "images-1"))
 
         # Clean up build 1
-        f = open(os.path.join(outputdir, "logfile"), "w+")
-        subprocess.call(["make", "O=%s" % outputdir, "-C", self.srcdir, "clean"], stdout=f, stderr=f)
+        f = open(os.path.join(self.outputdir, "logfile"), "w+")
+        subprocess.call(["make", "O=%s" % self.outputdir, "-C", self.srcdir, "clean"], stdout=f, stderr=f)
 
         # Start the second build
         log_write(self.log, "INFO: Reproducible Build Test, starting build 2")
@@ -547,19 +540,18 @@ class Builder:
         are available) or stores them locally as tarballs.
         """
 
-        outputdir = os.path.abspath(os.path.join(self.idir, "output"))
-        resultdir = os.path.join(outputdir, "results")
+        resultdir = os.path.join(self.outputdir, "results")
 
-        shutil.copyfile(os.path.join(outputdir, ".config"),
+        shutil.copyfile(os.path.join(self.outputdir, ".config"),
                         os.path.join(resultdir, "config"))
-        shutil.copyfile(os.path.join(outputdir, "defconfig"),
+        shutil.copyfile(os.path.join(self.outputdir, "defconfig"),
                         os.path.join(resultdir, "defconfig"))
-        shutil.copyfile(os.path.join(outputdir, "branch"),
+        shutil.copyfile(os.path.join(self.outputdir, "branch"),
                         os.path.join(resultdir, "branch"))
 
         def copy_if_exists(directory, src, dst=None):
-            if os.path.exists(os.path.join(outputdir, directory, src)):
-                shutil.copyfile(os.path.join(outputdir, directory, src),
+            if os.path.exists(os.path.join(self.outputdir, directory, src)):
+                shutil.copyfile(os.path.join(self.outputdir, directory, src),
                                 os.path.join(resultdir, src if dst is None else dst))
 
         copy_if_exists("build", "build-time.log")
@@ -575,7 +567,7 @@ class Builder:
         # Return True if the result should be rejected, False otherwise
         def reject_results():
             lastlines = decode_bytes(subprocess.Popen(
-                ["tail", "-n", "3", os.path.join(outputdir, "logfile")],
+                ["tail", "-n", "3", os.path.join(self.outputdir, "logfile")],
                 stdout=subprocess.PIPE).communicate()[0]).splitlines()
 
             # Reject results where qemu-user refused to build
@@ -592,7 +584,7 @@ class Builder:
         def get_failure_reason():
             # Output is a tuple (package, version), or None.
             lastlines = decode_bytes(subprocess.Popen(
-                ["tail", "-n", "3", os.path.join(outputdir, "logfile")],
+                ["tail", "-n", "3", os.path.join(self.outputdir, "logfile")],
                 stdout=subprocess.PIPE).communicate()[0]).splitlines()
 
             regexp = re.compile(r'make: \*\*\* .*/(?:build|toolchain)/([^/]*)/')
@@ -609,14 +601,14 @@ class Builder:
 
             def extract_last_500_lines():
                 subprocess.call(["tail -500 %s > %s" % \
-                                (os.path.join(outputdir, "logfile"), resultfile)],
+                                (os.path.join(self.outputdir, "logfile"), resultfile)],
                                 shell=True)
 
             reason = get_failure_reason()
             if not reason:
                 extract_last_500_lines()
             else:
-                f = open(os.path.join(outputdir, "logfile"), 'r')
+                f = open(os.path.join(self.outputdir, "logfile"), 'r')
                 mf = mmap.mmap(f.fileno(), 0, access=mmap.ACCESS_READ)
                 mf.seek(0)
                 # Search for first action on the failed package
@@ -640,7 +632,7 @@ class Builder:
             if not reason:
                 return
 
-            srcroot = os.path.join(outputdir, "build", '-'.join(reason))
+            srcroot = os.path.join(self.outputdir, "build", '-'.join(reason))
             destroot = os.path.join(resultdir, '-'.join(reason))
             config_files = ('config.log', 'CMakeCache.txt', 'CMakeError.log',
                 'CMakeOutput.log')
@@ -671,7 +663,7 @@ class Builder:
         # Yes, shutil.make_archive() would be nice, but it doesn't exist
         # in Python 2.6.
         ret = subprocess.call(["tar", "cjf", "results.tar.bz2", "results"],
-                              cwd=outputdir, stdout=self.log, stderr=self.log)
+                              cwd=self.outputdir, stdout=self.log, stderr=self.log)
         if ret != 0:
             log_write(self.log, "ERROR: could not make results tarball")
             sys.exit(1)
@@ -683,7 +675,7 @@ class Builder:
             ret = subprocess.call(["curl", "-u",
                                    "%s:%s" % (self.http_login, self.http_password),
                                    "-H", "Expect:",
-                                   "-F", "uploadedfile=@%s" % os.path.join(outputdir, "results.tar.bz2"),
+                                   "-F", "uploadedfile=@%s" % os.path.join(self.outputdir, "results.tar.bz2"),
                                    "-F", "uploadsubmit=1",
                                    self.http_url],
                                    stdout=self.log, stderr=self.log)
@@ -693,10 +685,10 @@ class Builder:
                 log_write(self.log, "INFO: results were submitted successfully")
         else:
             # No http login/password, keep tarballs locally
-            with open(os.path.join(outputdir, "results.tar.bz2"), 'rb') as f:
+            with open(os.path.join(self.outputdir, "results.tar.bz2"), 'rb') as f:
                 sha1 = hashlib.sha1(f.read()).hexdigest()
             resultfilename = "instance-%d-%s.tar.bz2" % (self.instance, sha1)
-            os.rename(os.path.join(outputdir, "results.tar.bz2"), resultfilename)
+            os.rename(os.path.join(self.outputdir, "results.tar.bz2"), resultfilename)
             log_write(self.log, "INFO: results saved as %s" % resultfilename)
 
     def run_instance(self):
@@ -728,8 +720,7 @@ class Builder:
                 continue
 
             # Check if the build test is supposed to be a reproducible test
-            outputdir = os.path.abspath(os.path.join(self.idir, "output"))
-            with open(os.path.join(outputdir, ".config"), "r") as fconf:
+            with open(os.path.join(self.outputdir, ".config"), "r") as fconf:
                 reproducible = "BR2_REPRODUCIBLE=y\n" in fconf.read()
             if reproducible:
                 ret = self.do_reproducible_build()
-- 
2.20.1
