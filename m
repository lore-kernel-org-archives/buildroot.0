From: =?UTF-8?q?Andr=C3=A9=20Erdmann?= <dywi@mailerd.de>
Date: Sun, 26 Apr 2015 23:47:50 +0200
Subject: [Buildroot] [PATCH v3 1/4] autobuild-run: encapsulate subprocess
	calls
In-Reply-To: <1430084873-19977-1-git-send-email-dywi@mailerd.de>
References: <1430084873-19977-1-git-send-email-dywi@mailerd.de>
Message-ID: <1430084873-19977-2-git-send-email-dywi@mailerd.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Preparation step for passing LANG to worker (sub-)processes,
allows to redirect stdin/stdout/stderr, which all default to devnull now
unless specified otherwise.
This makes the "yes"-pipe in "make oldconfig" redundant.

Signed-off-by: Andr? Erdmann <dywi@mailerd.de>
---
 scripts/autobuild-run | 130 ++++++++++++++++++++++++++++++++++++--------------
 1 file changed, 93 insertions(+), 37 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 0e12080..b7d552c 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -172,6 +172,7 @@ class SystemInfo:
         self.needed_progs = list(self.__class__.DEFAULT_NEEDED_PROGS)
         self.optional_progs = list(self.__class__.DEFAULT_OPTIONAL_PROGS)
         self.progs = {}
+        self.devnull = open(os.devnull, "w")
 
     def find_prog(self, name, flags=os.X_OK, env=os.environ):
         if not name or name[0] == os.sep: raise ValueError(name)
@@ -203,10 +204,8 @@ class SystemInfo:
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
@@ -231,6 +230,65 @@ class SystemInfo:
 
         return not missing_requirements
 
+    def popen(self, cmdv, **kwargs):
+        """subprocess.Popen() wrapper that redirects stdin, stdout and
+        stderr to /dev/null unless specified otherwise (via kwargs).
+
+        Returns: subprocess.Popen object
+
+        arguments:
+        * cmdv     -- command (usually a list, tuple or str)
+        * **kwargs -- additional keyword arguments that will be passed to
+                      subprocess.Popen()
+        """
+        kwargs.setdefault('stdin', self.devnull)
+        kwargs.setdefault('stdout', self.devnull)
+        kwargs.setdefault('stderr', self.devnull)
+        return subprocess.Popen(cmdv, **kwargs)
+
+    def run_cmd(self, cmdv, **kwargs):
+        """Runs a command and blocks until it terminates.
+        stdin, stdout and stderr get redirected to /dev/null by default,
+        see SystemInfo.popen() for details.
+
+        Returns: exit code of the command
+
+        arguments: see SystemInfo.popen()
+        """
+        proc = self.popen(cmdv, **kwargs)
+        proc.communicate()
+        return proc.poll()
+
+    def run_cmd_write_to(self, outstream, cmdv, **kwargs):
+        """Similar to SystemInfo.run_cmd(),
+        but redirects stdout and stderr to the given output stream.
+
+        Returns: exit code of the command
+
+        Note:
+          run_cmd_write_to(log, cmd) and run_cmd(cmd, stdout=log, stderr=log)
+          are interchangeable.
+
+        arguments:
+        * outstream -- default output stream for stdout/stderr
+        * cmdv      -- command, see SystemInfo.popen()
+        * **kwargs  -- see SystemInfo.popen()
+        """
+        kwargs.update(stdout=outstream, stderr=outstream)
+        return self.run_cmd(cmdv, **kwargs)
+
+    def run_cmd_get_stdout(self, cmdv, **kwargs):
+        """Similar to SystemInfo.run_cmd(), but captures stdout.
+
+        Returns: 2-tuple (exit code of the command, decoded stdout or None)
+
+        arguments: see SystemInfo.popen()
+        """
+        proc = self.popen(cmdv, stdout=subprocess.PIPE, **kwargs)
+        stdout_data, _ = proc.communicate()
+        return (proc.poll(), decode_bytes(stdout_data) if stdout_data else None)
+
+
 def get_toolchain_configs():
     """Fetch and return the possible toolchain configurations
 
@@ -274,6 +332,7 @@ def prepare_build(**kwargs):
 
     idir = "instance-%d" % kwargs['instance']
     log = kwargs['log']
+    sysinfo = kwargs['sysinfo']
 
     log_write(log, "INFO: preparing a new build")
 
@@ -298,15 +357,15 @@ def prepare_build(**kwargs):
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
+    ret = sysinfo.run_cmd_write_to(log, ["git", "pull"],  cwd=abssrcdir)
     if ret != 0:
         log_write(log, "ERROR: could not pull Buildroot sources")
         return -1
@@ -315,7 +374,7 @@ def prepare_build(**kwargs):
     outputdir = os.path.join(idir, "output")
     if os.path.exists(outputdir):
         # shutil.rmtree doesn't remove write-protected files
-        subprocess.call(["rm", "-rf", outputdir])
+        sysinfo.run_cmd(["rm", "-rf", outputdir])
     os.mkdir(outputdir)
 
     return 0
@@ -459,6 +518,7 @@ def gen_config(**kwargs):
 
     idir = "instance-%d" % kwargs['instance']
     log = kwargs['log']
+    sysinfo = kwargs['sysinfo']
 
     # We need the absolute path to use with O=, because the relative
     # path to the output directory here is not relative to the
@@ -493,10 +553,7 @@ def gen_config(**kwargs):
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
@@ -504,23 +561,20 @@ def gen_config(**kwargs):
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
         if fixup_config(**kwargs):
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
@@ -532,6 +586,7 @@ def do_build(**kwargs):
 
     idir = "instance-%d" % kwargs['instance']
     log = kwargs['log']
+    sysinfo = kwargs['sysinfo']
 
     # We need the absolute path to use with O=, because the relative
     # path to the output directory here is not relative to the
@@ -547,7 +602,7 @@ def do_build(**kwargs):
             "-C", srcdir, "BR2_DL_DIR=%s" % dldir,
             "BR2_JLEVEL=%s" % kwargs['njobs']] \
           + kwargs['make_opts'].split()
-    sub = subprocess.Popen(cmd, stdout=f, stderr=f)
+    sub = sysinfo.popen(cmd, stdout=f, stderr=f)
     kwargs['buildpid'][kwargs['instance']] = sub.pid
     ret = sub.wait()
     kwargs['buildpid'][kwargs['instance']] = 0
@@ -563,7 +618,7 @@ def do_build(**kwargs):
     cmd = ["make", "O=%s" % outputdir, "-C", srcdir,
             "BR2_DL_DIR=%s" % dldir, "legal-info"] \
           + kwargs['make_opts'].split()
-    ret = subprocess.call(cmd, stdout=f, stderr=f)
+    ret = sysinfo.run_cmd_write_to(f, cmd)
     if ret != 0:
         log_write(log, "INFO: build failed during legal-info")
         return -1
@@ -580,6 +635,7 @@ def send_results(result, **kwargs):
 
     idir = "instance-%d" % kwargs['instance']
     log = kwargs['log']
+    sysinfo = kwargs['sysinfo']
 
     outputdir = os.path.abspath(os.path.join(idir, "output"))
     srcdir = os.path.join(idir, "buildroot")
@@ -598,15 +654,14 @@ def send_results(result, **kwargs):
         shutil.copyfile(os.path.join(outputdir, "legal-info", "manifest.csv"),
                         os.path.join(resultdir, "licenses-manifest.csv"))
 
-    subprocess.call(["git log master -n 1 --pretty=format:%%H > %s" % \
+    sysinfo.run_cmd(["git log master -n 1 --pretty=format:%%H > %s" % \
                      os.path.join(resultdir, "gitid")],
-                    shell=True, cwd=srcdir)
+                    shell=True, cwd=srcdir, stderr=None)
 
     def get_failure_reason():
         # Output is a tuple (package, version), or None.
-        lastlines = decode_bytes(subprocess.Popen(
-            ["tail", "-n", "3", os.path.join(outputdir, "logfile")],
-            stdout=subprocess.PIPE).communicate()[0]).splitlines()
+        lastlines = sysinfo.run_cmd_get_stdout(
+            ["tail", "-n", "3", os.path.join(outputdir, "logfile")])[1].splitlines()
 
         regexp = re.compile(r'make: \*\*\* .*/(?:build|toolchain)/([^/]*)/')
         for line in lastlines:
@@ -621,9 +676,9 @@ def send_results(result, **kwargs):
         """Save the last part of the build log, starting from the failed package"""
 
         def extract_last_500_lines():
-            subprocess.call(["tail -500 %s > %s" % \
+            sysinfo.run_cmd(["tail -500 %s > %s" % \
                              (os.path.join(outputdir, "logfile"), resultfile)],
-                            shell=True)
+                            shell=True, stderr=None)
 
         reason = get_failure_reason()
         if not reason:
@@ -680,8 +735,8 @@ def send_results(result, **kwargs):
 
     # Yes, shutil.make_archive() would be nice, but it doesn't exist
     # in Python 2.6.
-    ret = subprocess.call(["tar", "cjf", "results.tar.bz2", "results"],
-                          cwd=outputdir, stdout=log, stderr=log)
+    ret = sysinfo.run_cmd_write_to(
+        log, ["tar", "cjf", "results.tar.bz2", "results"], cwd=outputdir)
     if ret != 0:
         log_write(log, "ERROR: could not make results tarball")
         sys.exit(1)
@@ -690,13 +745,14 @@ def send_results(result, **kwargs):
         # Submit results. Yes, Python has some HTTP libraries, but
         # none of the ones that are part of the standard library can
         # upload a file without writing dozens of lines of code.
-        ret = subprocess.call(["curl", "-u",
-                               "%s:%s" % (kwargs['http_login'], kwargs['http_password']),
-                               "-H", "Expect:",
-                               "-F", "uploadedfile=@%s" % os.path.join(outputdir, "results.tar.bz2"),
-                               "-F", "uploadsubmit=1",
-                               "http://autobuild.buildroot.org/submit/"],
-                              stdout=log, stderr=log)
+        ret = sysinfo.run_cmd_write_to(
+            log,
+            ["curl", "-u",
+             "%s:%s" % (kwargs['http_login'], kwargs['http_password']),
+             "-H", "Expect:",
+             "-F", "uploadedfile=@%s" % os.path.join(outputdir, "results.tar.bz2"),
+             "-F", "uploadsubmit=1",
+             "http://autobuild.buildroot.org/submit/"])
         if ret != 0:
             log_write(log, "INFO: results could not be submitted, %d" % ret)
         else:
-- 
2.3.6
