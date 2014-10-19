From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 19 Oct 2014 21:30:02 +0200
Subject: [Buildroot] [PATCHv2 buildroot-test 06/11] autobuild-run: add
	option --make-opts for custom Buildroot options
In-Reply-To: <1413747007-24990-1-git-send-email-patrickdepinguin@gmail.com>
References: <1413747007-24990-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <1413747007-24990-7-git-send-email-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

In some environments, the Buildroot configuration may need minor
tweaking. For example, in corporate environments behind a firewall,
version control commands like git, svn, ... may actually need wrappers.
Such wrappers could be configured using the corresponding BR2_<CMD>
configuration options.

Since these tweaks are very environment-specific, they should not be
part of the configuration file itself. Otherwise, other people trying to
reproduce the build in another environment will see builds failing due
to other reasons, for example the wrapper not being found.

This commit provides a new configuration option 'make-opts', passable as
argument or in the config file, that accepts a string of make options to
pass to the Buildroot make command. For example:
    --make-opts="BR2_GIT=git-wrapper BR2_svn=svn-wrapper"

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
v2: rebase after reordering

 scripts/autobuild-run | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 061ae31..40bcaa0 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -72,6 +72,9 @@ Options:
                                  reasons it is recommended to define this in the
                                  config file instead, with user-read permissions
                                  only)
+  --make-opts OPTSTRING          string of extra options to pass to Buildroot
+                                 make, such as specific command wrappers
+                                 [default: ]
   -c, --config CONFIG            path to configuration file
 
 Format of the configuration file:
@@ -406,7 +409,7 @@ def gen_config(instance, log, sysinfo):
 
     return 0
 
-def do_build(instance, njobs, log):
+def do_build(instance, njobs, log, make_opts):
     """Run the build itself"""
 
     idir = "instance-%d" % instance
@@ -419,8 +422,10 @@ def do_build(instance, njobs, log):
     srcdir = os.path.join(idir, "buildroot")
     f = open(os.path.join(outputdir, "logfile"), "w+")
     log_write(log, "INFO: build started")
-    ret = subprocess.call(["timeout", str(MAX_DURATION), "make", "O=%s" % outputdir, "-C", srcdir,
-                           "BR2_DL_DIR=%s" % dldir, "BR2_JLEVEL=%s" % njobs], stdout=f, stderr=f)
+    cmd = ["timeout", str(MAX_DURATION), "make", "O=%s" % outputdir,
+            "-C", srcdir, "BR2_DL_DIR=%s" % dldir, "BR2_JLEVEL=%s" % njobs] \
+          + make_opts.split()
+    ret = subprocess.call(cmd, stdout=f, stderr=f)
     # 124 is a special error code that indicates we have reached the
     # timeout
     if ret == 124:
@@ -511,7 +516,8 @@ def send_results(instance, http_login, http_password, submitter, log, result):
         os.rename(os.path.join(outputdir, "results.tar.bz2"), resultfilename)
         log_write(log, "INFO: results saved as %s" % resultfilename)
 
-def run_instance(instance, njobs, http_login, http_password, submitter, sysinfo):
+def run_instance(instance, njobs, http_login, http_password, submitter,
+                 make_opts, sysinfo):
     """Main per-instance loop
 
     Prepare the build, generate a configuration, run the build, and submit the
@@ -537,7 +543,7 @@ def run_instance(instance, njobs, http_login, http_password, submitter, sysinfo)
         if ret != 0:
             continue
 
-        ret = do_build(instance, njobs, instance_log)
+        ret = do_build(instance, njobs, instance_log, make_opts)
         send_results(instance, http_login, http_password, submitter, instance_log, ret)
 
 # args / config file merging inspired by:
@@ -597,7 +603,7 @@ def main():
     for i in range(0, int(args['--ninstances'])):
         p = Process(target=run_instance, args=(i, int(args['--njobs']),
                 args['--http-login'], args['--http-password'],
-                args['--submitter'], sysinfo))
+                args['--submitter'], args['--make-opts'], sysinfo))
         p.start()
         processes.append(p)
     signal.signal(signal.SIGTERM, sigterm_handler)
-- 
1.8.5.1
