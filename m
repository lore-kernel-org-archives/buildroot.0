From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 20 Oct 2014 21:39:23 +0200
Subject: [Buildroot] [PATCHv3 buildroot-test 4/9] autobuild-run: use
	**kwargs to avoid explicit parameter passthroughs
In-Reply-To: <1413833968-11808-1-git-send-email-patrickdepinguin@gmail.com>
References: <1413833968-11808-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <1413833968-11808-5-git-send-email-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

The current version of autobuild-run has some extensive explicit
parameter passing, for example:

- fixup_config needs sysinfo, passed via gen_config, in turn via
  run_instance, in turn via main.
- send_results needs username/password settings, passed via
  run_instance, in turn via main.

Everytime a leaf function needs an extra parameter (for example coming
from the arguments or config file), the entire call chain needs to be
adapted to pass along that parameter.

This patch introduces the **kwargs dictionary principle, that allows
implicit parameter passing. A function can accept this dictionary and
extract parameters from it by name. The dictionary can be passed as a
whole to a child function, without explicitly enumerating which entries
in the dictionary are needed in the child.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
 scripts/autobuild-run | 73 ++++++++++++++++++++++++++++++---------------------
 1 file changed, 43 insertions(+), 30 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 7ce0715..d500824 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -189,7 +189,7 @@ def get_toolchain_configs():
         configs.append(config)
     return configs
 
-def prepare_build(instance, log):
+def prepare_build(**kwargs):
     """Prepare for the next build of the specified instance
 
     This function prepares the build by making sure all the needed
@@ -197,7 +197,8 @@ def prepare_build(instance, log):
     code, and cleaning up remaining stuff from previous builds.
     """
 
-    idir = "instance-%d" % instance
+    idir = "instance-%d" % kwargs['instance']
+    log = kwargs['log']
 
     log_write(log, "INFO: preparing a new build")
 
@@ -246,7 +247,7 @@ def prepare_build(instance, log):
 
     return 0
 
-def fixup_config(instance, sysinfo):
+def fixup_config(**kwargs):
     """Finalize the configuration and reject any problematic combinations
 
     This function returns 'True' when the configuration has been
@@ -255,9 +256,10 @@ def fixup_config(instance, sysinfo):
     generated).
     """
 
-    idir = "instance-%d" % instance
-    outputdir = os.path.join(idir, "output")
+    idir = "instance-%d" % kwargs['instance']
+    sysinfo = kwargs['sysinfo']
 
+    outputdir = os.path.join(idir, "output")
     with open(os.path.join(outputdir, ".config")) as configf:
         configlines = configf.readlines()
 
@@ -341,7 +343,7 @@ def fixup_config(instance, sysinfo):
 
     return True
 
-def gen_config(instance, log, sysinfo):
+def gen_config(**kwargs):
     """Generate a new random configuration
 
     This function generates the configuration, by choosing a random
@@ -349,7 +351,9 @@ def gen_config(instance, log, sysinfo):
     packages.
     """
 
-    idir = "instance-%d" % instance
+    idir = "instance-%d" % kwargs['instance']
+    log = kwargs['log']
+
     dldir = os.path.join(idir, "dl")
     # We need the absolute path to use with O=, because the relative
     # path to the output directory here is not relative to the
@@ -400,7 +404,7 @@ def gen_config(instance, log, sysinfo):
         if ret != 0:
             log_write(log, "ERROR: cannot generate random configuration")
             return -1
-        if fixup_config(instance, sysinfo):
+        if fixup_config(**kwargs):
             break
 
     ret = subprocess.call(["yes '' 2>/dev/null| make O=%s -C %s oldconfig" % \
@@ -417,10 +421,12 @@ def gen_config(instance, log, sysinfo):
 
     return 0
 
-def do_build(instance, njobs, log, make_opts):
+def do_build(**kwargs):
     """Run the build itself"""
 
-    idir = "instance-%d" % instance
+    idir = "instance-%d" % kwargs['instance']
+    log = kwargs['log']
+
     # We need the absolute path to use with O=, because the relative
     # path to the output directory here is not relative to the
     # Buildroot sources, but to the location of the autobuilder
@@ -431,8 +437,9 @@ def do_build(instance, njobs, log, make_opts):
     f = open(os.path.join(outputdir, "logfile"), "w+")
     log_write(log, "INFO: build started")
     cmd = ["timeout", str(MAX_DURATION), "make", "O=%s" % outputdir,
-            "-C", srcdir, "BR2_DL_DIR=%s" % dldir, "BR2_JLEVEL=%s" % njobs] \
-          + make_opts.split()
+            "-C", srcdir, "BR2_DL_DIR=%s" % dldir,
+            "BR2_JLEVEL=%s" % kwargs['njobs']] \
+          + kwargs['make_opts'].split()
     ret = subprocess.call(cmd, stdout=f, stderr=f)
     # 124 is a special error code that indicates we have reached the
     # timeout
@@ -449,7 +456,7 @@ def do_build(instance, njobs, log, make_opts):
     log_write(log, "INFO: build successful")
     return 0
 
-def send_results(instance, http_login, http_password, submitter, log, result):
+def send_results(result, **kwargs):
     """Prepare and store/send tarball with results
 
     This function prepares the tarball with the results, and either
@@ -457,7 +464,9 @@ def send_results(instance, http_login, http_password, submitter, log, result):
     are available) or stores them locally as tarballs.
     """
 
-    idir = "instance-%d" % instance
+    idir = "instance-%d" % kwargs['instance']
+    log = kwargs['log']
+
     outputdir = os.path.abspath(os.path.join(idir, "output"))
     srcdir = os.path.join(idir, "buildroot")
     resultdir = os.path.join(outputdir, "results")
@@ -492,7 +501,7 @@ def send_results(instance, http_login, http_password, submitter, log, result):
     resultf.close()
 
     with open(os.path.join(resultdir, "submitter"), "w+") as submitterf:
-        submitterf.write(submitter)
+        submitterf.write(kwargs['submitter'])
 
     # Yes, shutil.make_archive() would be nice, but it doesn't exist
     # in Python 2.6.
@@ -502,11 +511,12 @@ def send_results(instance, http_login, http_password, submitter, log, result):
         log_write(log, "ERROR: could not make results tarball")
         sys.exit(1)
 
-    if http_login and http_password:
+    if kwargs['http_login'] and kwargs['http_password']:
         # Submit results. Yes, Python has some HTTP libraries, but
         # none of the ones that are part of the standard library can
         # upload a file without writing dozens of lines of code.
-        ret = subprocess.call(["curl", "-u", "%s:%s" % (http_login, http_password),
+        ret = subprocess.call(["curl", "-u",
+                               "%s:%s" % (kwargs['http_login'], kwargs['http_password']),
                                "-H", "Expect:",
                                "-F", "uploadedfile=@%s" % os.path.join(outputdir, "results.tar.bz2"),
                                "-F", "uploadsubmit=1",
@@ -520,39 +530,40 @@ def send_results(instance, http_login, http_password, submitter, log, result):
         # No http login/password, keep tarballs locally
         with open(os.path.join(outputdir, "results.tar.bz2"), 'rb') as f:
             sha1 = hashlib.sha1(f.read()).hexdigest()
-        resultfilename = "instance-%d-%s.tar.bz2" % (instance, sha1)
+        resultfilename = "instance-%d-%s.tar.bz2" % (kwargs['instance'], sha1)
         os.rename(os.path.join(outputdir, "results.tar.bz2"), resultfilename)
         log_write(log, "INFO: results saved as %s" % resultfilename)
 
-def run_instance(instance, njobs, http_login, http_password, submitter,
-                 make_opts, sysinfo):
+def run_instance(**kwargs):
     """Main per-instance loop
 
     Prepare the build, generate a configuration, run the build, and submit the
     results.
     """
 
-    idir = "instance-%d" % instance
+    idir = "instance-%d" % kwargs['instance']
 
     # If it doesn't exist, create the instance directory
     if not os.path.exists(idir):
         os.mkdir(idir)
 
-    instance_log = open(os.path.join(idir, "instance.log"), "a+")
-    log_write(instance_log, "INFO: instance started")
+    kwargs['log'] = open(os.path.join(idir, "instance.log"), "a+")
+    log_write(kwargs['log'], "INFO: instance started")
+
     while True:
         check_version()
 
-        ret = prepare_build(instance, instance_log)
+        ret = prepare_build(**kwargs)
         if ret != 0:
             continue
 
-        ret = gen_config(instance, instance_log, sysinfo)
+        ret = gen_config(**kwargs)
         if ret != 0:
             continue
 
-        ret = do_build(instance, njobs, instance_log, make_opts)
-        send_results(instance, http_login, http_password, submitter, instance_log, ret)
+        ret = do_build(**kwargs)
+
+        send_results(ret, **kwargs)
 
 # args / config file merging inspired by:
 # https://github.com/docopt/docopt/blob/master/examples/config_file_example.py
@@ -604,9 +615,11 @@ def main():
         sys.exit(1)
     processes = []
     for i in range(0, int(args['--ninstances'])):
-        p = Process(target=run_instance, args=(i, int(args['--njobs']),
-                args['--http-login'], args['--http-password'],
-                args['--submitter'], args['--make-opts'], sysinfo))
+        p = Process(target=run_instance, kwargs={
+            'instance': i, 'njobs': args['--njobs'], 'sysinfo': sysinfo,
+            'http_login': args['--http-login'],
+            'http_password': args['--http-password'],
+            'submitter': args['--submitter'], 'make_opts': args['--make-opts']})
         p.start()
         processes.append(p)
     signal.signal(signal.SIGTERM, sigterm_handler)
-- 
1.8.5.1
