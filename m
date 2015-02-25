From: =?UTF-8?q?Andr=C3=A9=20Erdmann?= <dywi@mailerd.de>
Date: Wed, 25 Feb 2015 22:17:29 +0100
Subject: [Buildroot] [PATCH 12/13] autobuild-run: encapsulate subprocess
	calls
In-Reply-To: <1424899050-24932-1-git-send-email-dywi@mailerd.de>
References: <1424899050-24932-1-git-send-email-dywi@mailerd.de>
Message-ID: <1424899050-24932-13-git-send-email-dywi@mailerd.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Preparation step for passing LANG to worker (sub-)processes,

* always set stdout and stderr to devnull if not specified otherwise
* also default stdin to devnull, makes the "yes"-pipe in "make oldconfig"
  commands redundant

Signed-off-by: Andr? Erdmann <dywi@mailerd.de>
---
 scripts/autobuild-run | 87 +++++++++++++++++++++++++++------------------------
 1 file changed, 46 insertions(+), 41 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 9c78cc5..7980879 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -117,6 +117,7 @@ class SystemInfo:
         self.needed_progs = list(self.__class__.DEFAULT_NEEDED_PROGS)
         self.optional_progs = list(self.__class__.DEFAULT_OPTIONAL_PROGS)
         self.progs = {}
+        self.devnull = open(os.devnull, "w")
 
     def find_prog(self, name, flags=os.X_OK, env=os.environ):
         if not name or name[0] == os.sep: raise ValueError(name)
@@ -148,10 +149,8 @@ class SystemInfo:
         have_it = self.find_prog(prog)
         # java[c] needs special care
         if have_it and prog in ('java', 'javac'):
-            with open(os.devnull, "w") as devnull:
-                if subprocess.call("%s -version | grep gcj" % prog, shell=True,
-                                   stdout=devnull, stderr=devnull) != 1:
-                    have_it = False
+            if self.run_cmd("%s -version | grep gcj" % prog, shell=True) != 1:
+                have_it = False
         # --
         self.progs[prog] = have_it
         return have_it
@@ -172,6 +171,16 @@ class SystemInfo:
 
         return not missing_requirements
 
+    def run_cmd(self, cmdv, **kwargs):
+        kwargs.setdefault('stdin', self.devnull)
+        kwargs.setdefault('stdout', self.devnull)
+        kwargs.setdefault('stderr', self.devnull)
+        return subprocess.call(cmdv, **kwargs)
+
+    def run_cmd_write_to(self, outstream, cmdv, **kwargs):
+        kwargs.update(stdout=outstream, stderr=outstream)
+        return self.run_cmd(cmdv, **kwargs)
+
 
 def get_toolchain_configs():
     """Fetch and return the possible toolchain configurations
@@ -206,7 +215,7 @@ def get_toolchain_configs():
         configs.append(config)
     return configs
 
-def prepare_build(instance, log):
+def prepare_build(instance, log, sysinfo):
     """Prepare for the next build of the specified instance
 
     This function prepares the build by making sure all the needed
@@ -239,15 +248,15 @@ def prepare_build(instance, log):
     # didn't exist already.
     srcdir = os.path.join(idir, "buildroot")
     if not os.path.exists(srcdir):
-        ret = subprocess.call(["git", "clone", "git://git.busybox.net/buildroot", srcdir],
-                              stdout=log, stderr=log)
+        ret = sysinfo.run_cmd_write_to(
+            log, ["git", "clone", "git://git.busybox.net/buildroot", srcdir])
         if ret != 0:
             log_write(log, "ERROR: could not clone Buildroot sources")
             return -1
 
     # Update the Buildroot sources.
     abssrcdir = os.path.abspath(srcdir)
-    ret = subprocess.call(["git", "pull"], cwd=abssrcdir, stdout=log, stderr=log)
+    ret = sysinfo.run_cmd_write_to(log, ["git", "pull"], cwd=abssrcdir)
     if ret != 0:
         log_write(log, "ERROR: could not pull Buildroot sources")
         return -1
@@ -256,7 +265,7 @@ def prepare_build(instance, log):
     outputdir = os.path.join(idir, "output")
     if os.path.exists(outputdir):
         # shutil.rmtree doesn't remove write-protected files
-        subprocess.call(["rm", "-rf", outputdir])
+        sysinfo.run_cmd(["rm", "-rf", outputdir])
     os.mkdir(outputdir)
 
     return 0
@@ -422,10 +431,7 @@ def gen_config(instance, log, sysinfo):
     with open(os.path.join(outputdir, ".config"), "w+") as configf:
         configf.writelines(configlines)
 
-    devnull = open(os.devnull, "w")
-
-    ret = subprocess.call(["yes '' 2>/dev/null| make O=%s -C %s oldconfig" % \
-                           (outputdir, srcdir)], shell=True, stdout=devnull, stderr=devnull)
+    ret = sysinfo.run_cmd(["make", "O=%s" % outputdir, "-C", srcdir, "oldconfig"])
     if ret != 0:
         log_write(log, "ERROR: cannot oldconfig")
         return -1
@@ -433,30 +439,27 @@ def gen_config(instance, log, sysinfo):
     # Now, generate the random selection of packages, and fixup
     # things if needed.
     while True:
-        ret = subprocess.call(["make", "O=%s" % outputdir, "-C", srcdir,
-                               "KCONFIG_PROBABILITY=%d" % randint(1,30), "randpackageconfig"],
-                              stdout=devnull, stderr=devnull)
+        ret = sysinfo.run_cmd(["make", "O=%s" % outputdir, "-C", srcdir,
+                               "KCONFIG_PROBABILITY=%d" % randint(1,30), "randpackageconfig"])
         if ret != 0:
             log_write(log, "ERROR: cannot generate random configuration")
             return -1
         if fixup_config(instance, sysinfo):
             break
 
-    ret = subprocess.call(["yes '' 2>/dev/null| make O=%s -C %s oldconfig" % \
-                           (outputdir, srcdir)], shell=True, stdout=devnull, stderr=devnull)
+    ret = sysinfo.run_cmd(["make", "O=%s" % outputdir, "-C", srcdir, "oldconfig"])
     if ret != 0:
         log_write(log, "ERROR: cannot oldconfig")
         return -1
 
-    ret = subprocess.call(["make", "O=%s" % outputdir, "-C", srcdir, "savedefconfig"],
-                          stdout=devnull, stderr=devnull)
+    ret = sysinfo.run_cmd(["make", "O=%s" % outputdir, "-C", srcdir, "savedefconfig"])
     if ret != 0:
         log_write(log, "ERROR: cannot savedefconfig")
         return -1
 
     return 0
 
-def do_build(instance, njobs, log):
+def do_build(instance, njobs, log, sysinfo):
     """Run the build itself"""
 
     idir = "instance-%d" % instance
@@ -469,8 +472,9 @@ def do_build(instance, njobs, log):
     srcdir = os.path.join(idir, "buildroot")
     f = open(os.path.join(outputdir, "logfile"), "w+")
     log_write(log, "INFO: build started")
-    ret = subprocess.call(["timeout", str(MAX_DURATION), "make", "O=%s" % outputdir, "-C", srcdir,
-                           "BR2_DL_DIR=%s" % dldir, "BR2_JLEVEL=%s" % njobs], stdout=f, stderr=f)
+    ret = sysinfo.run_cmd_write_to(
+        f, ["timeout", str(MAX_DURATION), "make", "O=%s" % outputdir,
+            "-C", srcdir, "BR2_DL_DIR=%s" % dldir, "BR2_JLEVEL=%s" % njobs])
     # 124 is a special error code that indicates we have reached the
     # timeout
     if ret == 124:
@@ -479,14 +483,14 @@ def do_build(instance, njobs, log):
     if ret != 0:
         log_write(log, "INFO: build failed")
         return -1
-    ret = subprocess.call(["make", "O=%s" % outputdir, "-C", srcdir], stdout=f, stderr=f)
+    ret = sysinfo.run_cmd_write_to(f, ["make", "O=%s" % outputdir, "-C", srcdir])
     if ret != 0:
         log_write(log, "INFO: build failed during legal-info")
         return -1
     log_write(log, "INFO: build successful")
     return 0
 
-def send_results(instance, http_login, http_password, submitter, log, result):
+def send_results(instance, http_login, http_password, submitter, log, result, sysinfo):
     """Prepare and store/send tarball with results
 
     This function prepares the tarball with the results, and either
@@ -512,12 +516,12 @@ def send_results(instance, http_login, http_password, submitter, log, result):
         shutil.copyfile(os.path.join(outputdir, "legal-info", "manifest.csv"),
                         os.path.join(resultdir, "licenses-manifest.csv"))
 
-    subprocess.call(["git log master -n 1 --pretty=format:%%H > %s" % \
+    sysinfo.run_cmd(["git log master -n 1 --pretty=format:%%H > %s" % \
                      os.path.join(resultdir, "gitid")],
-                    shell=True, cwd=srcdir)
-    subprocess.call(["tail -500 %s > %s" % \
-                     (os.path.join(outputdir, "logfile"), os.path.join(resultdir, "build-end.log"))],
-                    shell=True)
+                    shell=True, cwd=srcdir, stderr=None)
+    sysinfo.run_cmd(["tail -500 %s > %s" % (os.path.join(outputdir, "logfile"),
+                     os.path.join(resultdir, "build-end.log"))],
+                    shell=True, stderr=None)
 
     resultf = open(os.path.join(resultdir, "status"), "w+")
     if result == 0:
@@ -533,8 +537,8 @@ def send_results(instance, http_login, http_password, submitter, log, result):
 
     # Yes, shutil.make_archive() would be nice, but it doesn't exist
     # in Python 2.6.
-    ret = subprocess.call(["tar", "cjf", "results.tar.bz2", "results"],
-                          cwd=outputdir, stdout=log, stderr=log)
+    ret = sysinfo.run_cmd_write_to(
+        log, ["tar", "cjf", "results.tar.bz2", "results"], cwd=outputdir)
     if ret != 0:
         log_write(log, "ERROR: could not make results tarball")
         sys.exit(1)
@@ -543,12 +547,13 @@ def send_results(instance, http_login, http_password, submitter, log, result):
         # Submit results. Yes, Python has some HTTP libraries, but
         # none of the ones that are part of the standard library can
         # upload a file without writing dozens of lines of code.
-        ret = subprocess.call(["curl", "-u", "%s:%s" % (http_login, http_password),
-                               "-H", "Expect:",
-                               "-F", "uploadedfile=@%s" % os.path.join(outputdir, "results.tar.bz2"),
-                               "-F", "uploadsubmit=1",
-                               "http://autobuild.buildroot.org/submit/"],
-                              stdout=log, stderr=log)
+        ret = sysinfo.run_cmd_write_to(
+            log,
+            ["curl", "-u", "%s:%s" % (http_login, http_password),
+             "-H", "Expect:",
+             "-F", "uploadedfile=@%s" % os.path.join(outputdir, "results.tar.bz2"),
+             "-F", "uploadsubmit=1",
+             "http://autobuild.buildroot.org/submit/"])
         if ret != 0:
             log_write(log, "INFO: results could not be submitted, %d" % ret)
         else:
@@ -579,7 +584,7 @@ def run_instance(instance, njobs, http_login, http_password, submitter, sysinfo)
     while True:
         check_version()
 
-        ret = prepare_build(instance, instance_log)
+        ret = prepare_build(instance, instance_log, sysinfo)
         if ret != 0:
             continue
 
@@ -587,8 +592,8 @@ def run_instance(instance, njobs, http_login, http_password, submitter, sysinfo)
         if ret != 0:
             continue
 
-        ret = do_build(instance, njobs, instance_log)
-        send_results(instance, http_login, http_password, submitter, instance_log, ret)
+        ret = do_build(instance, njobs, instance_log, sysinfo)
+        send_results(instance, http_login, http_password, submitter, instance_log, ret, sysinfo)
 
 def config_get():
     """Get configuration parameters, either from the command line or the config file"""
-- 
2.3.0
