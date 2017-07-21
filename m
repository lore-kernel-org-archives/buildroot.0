From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 21 Jul 2017 03:06:21 +0200
Subject: [Buildroot] [PATCH v3 4/4] autobuild-run: adapt to genrandconfig
	with toolchains-csv option
In-Reply-To: <20170721010621.4877-1-arnout@mind.be>
References: <20170721010530.4747-1-arnout@mind.be>
 <20170721010621.4877-1-arnout@mind.be>
Message-ID: <20170721010621.4877-4-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The --toolchains-url option has been removed from genrandconfig, it has
been replaced with --toolchains-csv.

We don't actually need to pass this option if not set, so that the
in-tree default will be used. This makes sure that the autobuild-run
doesn't need to be updated if we change the location of the CSV file.

The -i option has been removed from genrandconfig, it has been replaced
with an explicit -o OUTPUTDIR and -b BUILDROOTDIR.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 scripts/autobuild-run | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 0f9d046..f1dade4 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -67,7 +67,7 @@ defaults = {
     '--nice': 0,
     '--pid-file': '/tmp/buildroot-autobuild.pid',
     '--http-url': 'http://autobuild.buildroot.org/submit/',
-    '--toolchains-url': 'http://autobuild.buildroot.org/toolchains/configs/toolchain-configs.csv',
+    '--toolchains-csv': 'support/config-fragments/autobuild/toolchain-configs.csv',
 }
 
 doc = """autobuild-run - run Buildroot autobuilder
@@ -102,7 +102,7 @@ Options:
   -c, --config CONFIG            path to configuration file
                                  Not set by default.
   -d, --debug                    Send log output to stdout instead of log file
-  --toolchains-url URL           URL of toolchain configuration file
+  --toolchains-csv CSVFILE       Toolchain configuration file
 
 Format of the configuration file:
 
@@ -314,10 +314,17 @@ def gen_config(**kwargs):
         devnull = log
     else:
         devnull = open(os.devnull, "w")
-    ret = subprocess.call([os.path.join(srcdir, "utils/genrandconfig"),
-                           "-o", outputdir, "-b", srcdir,
-                           "--toolchains-url", kwargs['toolchains_url']],
-                          stdout=devnull, stderr=log)
+
+    args = [os.path.join(srcdir, "utils/genrandconfig"),
+            "-o", outputdir, "-b", srcdir]
+
+    toolchains_csv = kwargs['toolchains_csv']
+    if toolchains_csv:
+        if not os.path.isabs(toolchains_csv):
+            toolchains_csv = os.path.join(srcdir, toolchains_csv)
+        args.extend(["--toolchains-csv", toolchains_csv])
+
+    ret = subprocess.call(args, stdout=devnull, stderr=log)
     return ret
 
 def do_build(**kwargs):
@@ -666,7 +673,7 @@ def main():
                 submitter = args['--submitter'],
                 make_opts = (args['--make-opts'] or ''),
                 nice = (args['--nice'] or 0),
-                toolchains_url = args['--toolchains-url'],
+                toolchains_csv = args['--toolchains-csv'],
                 upload = upload,
                 buildpid = buildpid,
                 debug = args['--debug']
-- 
2.13.2
