From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 29 Sep 2014 09:54:43 -0500
Subject: [Buildroot] [PATCH v2] autobuilder: branch support
Message-ID: <1412002483-43566-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adds an option to specify a specific repository and branch
for the autobuilder to execute against (Defaults to the master
branch and mainline repository).

Signed-off-by: Matt Weber <Matthew.Weber@rockwellcollins.com>
---

The intention for adding this feature is to allow regressioning
of large patchsets prior to submitting to the mailing list.

Changes v1 -> v2:
 - Added option to configure buildroot repository path for
   cloning.  Suggested by Thomas P.

Conflicts:
	scripts/autobuild-run
---
 scripts/autobuild-run | 36 ++++++++++++++++++++++++++++++------
 1 file changed, 30 insertions(+), 6 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 7497001..ced3b71 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -182,10 +182,10 @@ def prepare_build(instance, log):
     # didn't exist already.
     srcdir = os.path.join(idir, "buildroot")
     if not os.path.exists(srcdir):
-        ret = subprocess.call(["git", "clone", "git://git.busybox.net/buildroot", srcdir],
+        ret = subprocess.call(["git", "clone", br_repo, srcdir],
                               stdout=log, stderr=log)
         if ret != 0:
-            log_write(log, "ERROR: could not clone Buildroot sources")
+            log_write(log, "ERROR: could not clone Buildroot sources [%s]" % br_repo)
             return -1
 
     # Update the Buildroot sources.
@@ -195,6 +195,13 @@ def prepare_build(instance, log):
         log_write(log, "ERROR: could not pull Buildroot sources")
         return -1
 
+    # Update to a specific branch for regression test (defaults to master)
+    abssrcdir = os.path.abspath(srcdir)
+    ret = subprocess.call(["git", "checkout", br_branch], cwd=srcdir, stdout=log, stderr=log)
+    if ret != 0:
+        log_write(log, "ERROR: could not checkout Buildroot branch [%s]" % br_branch)
+        return -1
+
     # Create an empty output directory. We remove it first, in case a previous build was aborted.
     outputdir = os.path.join(idir, "output")
     if os.path.exists(outputdir):
@@ -465,7 +472,7 @@ def send_results(instance, http_login, http_password, submitter, log, result):
 # This function implements the main per-instance loop, which prepares
 # the build, generate a configuration, runs the build, and submits the
 # results.
-def run_instance(instance, njobs, http_login, http_password, submitter, sysinfo):
+def run_instance(instance, njobs, http_login, http_password, submitter, sysinfo, br_branch, br_repo):
     idir = "instance-%d" % instance
 
     # If it doesn't exist, create the instance directory
@@ -500,6 +507,8 @@ Format of the configuration file:
    http-login = <value>
    http-password = <value>
    submitter = <value>
+   br_branch = <value>
+   br_repo = <value>
 """
 
     parser = argparse.ArgumentParser(description='Run Buildroot autobuilder',
@@ -513,6 +522,10 @@ Format of the configuration file:
                         help="Name/machine of submitter")
     parser.add_argument("--config", '-c', metavar="CONFIG",
                         help="Path to configuration file")
+    parser.add_argument("--br_branch", '-b', metavar="BR_BRANCH",
+                        help="Name of Buildroot branch to regression")
+    parser.add_argument("--br_repo", '-r', metavar="BR_REPO",
+                        help="Name of Buildroot repository to clone")
     args = parser.parse_args()
 
     ninstances = 1
@@ -520,6 +533,8 @@ Format of the configuration file:
     http_login = None
     http_password = None
     submitter = "N/A"
+    br_branch = "master"
+    br_repo = "git://git.busybox.net/buildroot"
 
     if args.config:
         if not os.path.exists(args.config):
@@ -539,6 +554,10 @@ Format of the configuration file:
             http_password = parser.get('main', 'http-password')
         if parser.has_option('main', 'submitter'):
             submitter = parser.get('main', 'submitter')
+        if parser.has_option('main', 'br_branch'):
+            br_branch = parser.get('main', 'br_branch')
+        if parser.has_option('main', 'br_repo'):
+            br_repo = parser.get('main', 'br_repo')
 
     if args.njobs:
         njobs = int(args.njobs)
@@ -546,23 +565,28 @@ Format of the configuration file:
         ninstances = int(args.ninstances)
     if args.submitter:
         submitter = args.submitter
+    if args.br_branch:
+        br_branch = args.br_branch
+    if args.br_repo:
+        br_repo = args.br_repo
 
-    return (ninstances, njobs, http_login, http_password, submitter)
+    return (ninstances, njobs, http_login, http_password, submitter, br_branch, br_repo)
 
 if __name__ == '__main__':
     check_version()
     sysinfo = SystemInfo()
-    (ninstances, njobs, http_login, http_password, submitter) = config_get()
+    (ninstances, njobs, http_login, http_password, submitter, br_branch, br_repo) = config_get()
     check_requirements(http_login, http_password)
     if http_login is None or http_password is None:
         print "WARN: due to the lack of http login/password details, results will not be submitted"
         print "WARN: tarballs of results will be kept locally only"
+        print "NOTE: Testing branch --> %s" % br_branch
     def sigterm_handler(signum, frame):
         os.killpg(os.getpgid(os.getpid()), signal.SIGTERM)
         sys.exit(1)
     processes = []
     for i in range(0, ninstances):
-        p = Process(target=run_instance, args=(i, njobs, http_login, http_password, submitter, sysinfo))
+        p = Process(target=run_instance, args=(i, njobs, http_login, http_password, submitter, sysinfo, br_branch, br_repo))
         p.start()
         processes.append(p)
     signal.signal(signal.SIGTERM, sigterm_handler)
-- 
1.9.1
