From: Matt Weber <Matthew.Weber@rockwellcollins.com>
Date: Thu, 21 Aug 2014 07:54:56 -0500
Subject: [Buildroot] [PATCH v2 1/1] autobuilder: branch support
Message-ID: <1408625696-42975-1-git-send-email-Matthew.Weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adds an option to specify a specific branch for the autobuilder
to execute against (Defaults to the master branch).

Signed-off-by: Matt Weber <Matthew.Weber@rockwellcollins.com>
---

Changes v1 -> v2
 - Fixed assignment of br_branch value to variable
   when reading config from file. (Suggested by Clayton S)


scripts/autobuild-run | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index dcb8dbd..9ebea30 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -171,6 +171,13 @@ def prepare_build(instance, log):
         log_write(log, "ERROR: could not pull Buildroot sources")
         return -1
 
+    # Update to a specific branch for regression test
+    abssrcdir = os.path.abspath(srcdir)
+    ret = subprocess.call(["git", "checkout", br_branch], cwd=srcdir, stdout=log, stderr=log)
+    if ret != 0:
+        log_write(log, "ERROR: could not checkout Buildroot branch [%s]" % br_branch)
+        return -1
+
     # Create an empty output directory. We remove it first, in case a previous build was aborted.
     outputdir = os.path.join(idir, "output")
     if os.path.exists(outputdir):
@@ -431,7 +438,7 @@ def send_results(instance, http_login, http_password, submitter, log, result):
 # This function implements the main per-instance loop, which prepares
 # the build, generate a configuration, runs the build, and submits the
 # results.
-def run_instance(instance, njobs, http_login, http_password, submitter):
+def run_instance(instance, njobs, http_login, http_password, submitter, br_branch):
     idir = "instance-%d" % instance
 
     # If it doesn't exist, create the instance directory
@@ -466,6 +473,7 @@ Format of the configuration file:
    http-login = <value>
    http-password = <value>
    submitter = <value>
+   br_branch = <value>
 """
 
     parser = argparse.ArgumentParser(description='Run Buildroot autobuilder',
@@ -479,6 +487,8 @@ Format of the configuration file:
                         help="Name/machine of submitter")
     parser.add_argument("--config", '-c', metavar="CONFIG",
                         help="Path to configuration file")
+    parser.add_argument("--br_branch", '-b', metavar="BR_BRANCH",
+                        help="Name of Buildroot branch to regression")
     args = parser.parse_args()
 
     ninstances = 1
@@ -486,6 +496,7 @@ Format of the configuration file:
     http_login = None
     http_password = None
     submitter = "N/A"
+    br_branch = "master"
 
     if args.config:
         if not os.path.exists(args.config):
@@ -505,6 +516,8 @@ Format of the configuration file:
             http_password = parser.get('main', 'http-password')
         if parser.has_option('main', 'submitter'):
             submitter = parser.get('main', 'submitter')
+        if parser.has_option('main', 'br_branch'):
+            br_branch = parser.get('main', 'br_branch')
 
     if args.njobs:
         njobs = int(args.njobs)
@@ -512,22 +525,25 @@ Format of the configuration file:
         ninstances = int(args.ninstances)
     if args.submitter:
         submitter = args.submitter
+    if args.br_branch:
+        br_branch = args.br_branch
 
-    return (ninstances, njobs, http_login, http_password, submitter)
+    return (ninstances, njobs, http_login, http_password, submitter, br_branch)
 
 if __name__ == '__main__':
     check_version()
     check_requirements()
-    (ninstances, njobs, http_login, http_password, submitter) = config_get()
+    (ninstances, njobs, http_login, http_password, submitter, br_branch) = config_get()
     if http_login is None or http_password is None:
         print "WARN: due to the lack of http login/password details, results will not be submitted"
         print "WARN: tarballs of results will be kept locally only"
+        print "NOTE: Testing branch --> %s" % br_branch
     def sigterm_handler(signum, frame):
         os.killpg(os.getpgid(os.getpid()), signal.SIGTERM)
         sys.exit(1)
     processes = []
     for i in range(0, ninstances):
-        p = Process(target=run_instance, args=(i, njobs, http_login, http_password, submitter))
+        p = Process(target=run_instance, args=(i, njobs, http_login, http_password, submitter, br_branch))
         p.start()
         processes.append(p)
     signal.signal(signal.SIGTERM, sigterm_handler)
-- 
1.9.1
