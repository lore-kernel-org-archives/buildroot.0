From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 12 Nov 2014 20:58:33 +0100
Subject: [Buildroot] [PATCH v4 5/9] autobuild-run: check-requirements does
	not need to know the login details
In-Reply-To: <1415822317-22500-1-git-send-email-patrickdepinguin@gmail.com>
References: <1415822317-22500-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <1415822317-22500-6-git-send-email-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

check-requirements simply has to know if the results have to be sent, so
it can check on some extra requirements. The username and password are
irrelevant here.
This commit introduces a boolean variable upload to hide these details.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
 scripts/autobuild-run | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 8312bfb..3f5b4cf 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -120,12 +120,12 @@ def check_version():
         print "ERROR: script version too old, please upgrade."
         sys.exit(1)
 
-def check_requirements(http_login, http_password):
+def check_requirements(upload=False):
     devnull = open(os.devnull, "w")
     needed_progs = ["make", "git", "gcc", "timeout"]
     missing_requirements = False
 
-    if http_login and http_password:
+    if upload:
         needed_progs.append("curl")
 
     for prog in needed_progs:
@@ -517,7 +517,7 @@ def send_results(result, **kwargs):
         log_write(log, "ERROR: could not make results tarball")
         sys.exit(1)
 
-    if kwargs['http_login'] and kwargs['http_password']:
+    if kwargs['upload']:
         # Submit results. Yes, Python has some HTTP libraries, but
         # none of the ones that are part of the standard library can
         # upload a file without writing dozens of lines of code.
@@ -612,10 +612,15 @@ def main():
         # merge config/args, priority given to config
         args = merge(ini_config, args)
 
-    check_requirements(args['--http-login'], args['--http-password'])
-    if args['--http-login'] is None or args['--http-password'] is None:
+    # http_login/password could theoretically be allowed as empty, so check
+    # explicitly on None.
+    upload = (args['--http-login'] is not None) \
+                and (args['--http-password'] is not None)
+    check_requirements(upload)
+    if not upload:
         print "WARN: due to the lack of http login/password details, results will not be submitted"
         print "WARN: tarballs of results will be kept locally only"
+
     def sigterm_handler(signum, frame):
         os.killpg(os.getpgid(os.getpid()), signal.SIGTERM)
         sys.exit(1)
@@ -625,7 +630,8 @@ def main():
             'instance': i, 'njobs': args['--njobs'], 'sysinfo': sysinfo,
             'http_login': args['--http-login'],
             'http_password': args['--http-password'],
-            'submitter': args['--submitter'], 'make_opts': args['--make-opts']})
+            'submitter': args['--submitter'], 'make_opts': args['--make-opts'],
+            'upload': upload})
         p.start()
         processes.append(p)
     signal.signal(signal.SIGTERM, sigterm_handler)
-- 
1.8.5.1
