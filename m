From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 20 Oct 2014 21:39:24 +0200
Subject: [Buildroot] [PATCHv3 buildroot-test 5/9] autobuild-run:
	check-requirements does not need to know the login details
In-Reply-To: <1413833968-11808-1-git-send-email-patrickdepinguin@gmail.com>
References: <1413833968-11808-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <1413833968-11808-6-git-send-email-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

check-requirements simply has to know if the results have to be sent, so
it can check on some extra requirements. The username and password are
irrelevant here.
This commit introduces a boolean variable do_send_results to hide these
details.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
 scripts/autobuild-run | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index d500824..e2d2eb5 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -120,12 +120,12 @@ def check_version():
         print "ERROR: script version too old, please upgrade."
         sys.exit(1)
 
-def check_requirements(http_login, http_password):
+def check_requirements(do_send_results=False):
     devnull = open(os.devnull, "w")
     needed_progs = ["make", "git", "gcc", "timeout"]
     missing_requirements = False
 
-    if http_login and http_password:
+    if do_send_results:
         needed_progs.append("curl")
 
     for prog in needed_progs:
@@ -511,7 +511,7 @@ def send_results(result, **kwargs):
         log_write(log, "ERROR: could not make results tarball")
         sys.exit(1)
 
-    if kwargs['http_login'] and kwargs['http_password']:
+    if kwargs['do_send_results']:
         # Submit results. Yes, Python has some HTTP libraries, but
         # none of the ones that are part of the standard library can
         # upload a file without writing dozens of lines of code.
@@ -606,10 +606,15 @@ def main():
         # merge config/args, priority given to config
         args = merge(ini_config, args)
 
-    check_requirements(args['--http-login'], args['--http-password'])
-    if args['--http-login'] is None or args['--http-password'] is None:
+    # http_login/password could theoretically be allowed as empty, so check
+    # explicitly on None.
+    do_send_results = (args['--http-login'] is not None) \
+                        and (args['--http-password'] is not None)
+    check_requirements(do_send_results)
+    if not do_send_results:
         print "WARN: due to the lack of http login/password details, results will not be submitted"
         print "WARN: tarballs of results will be kept locally only"
+
     def sigterm_handler(signum, frame):
         os.killpg(os.getpgid(os.getpid()), signal.SIGTERM)
         sys.exit(1)
@@ -619,7 +624,8 @@ def main():
             'instance': i, 'njobs': args['--njobs'], 'sysinfo': sysinfo,
             'http_login': args['--http-login'],
             'http_password': args['--http-password'],
-            'submitter': args['--submitter'], 'make_opts': args['--make-opts']})
+            'submitter': args['--submitter'], 'make_opts': args['--make-opts'],
+            'do_send_results': do_send_results})
         p.start()
         processes.append(p)
     signal.signal(signal.SIGTERM, sigterm_handler)
-- 
1.8.5.1
