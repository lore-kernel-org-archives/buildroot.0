From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 21 Jul 2017 03:06:19 +0200
Subject: [Buildroot] [PATCH v3 2/4] autobuild-run: adapt to genrandconfig
	without log_write
In-Reply-To: <20170721010621.4877-1-arnout@mind.be>
References: <20170721010530.4747-1-arnout@mind.be>
 <20170721010621.4877-1-arnout@mind.be>
Message-ID: <20170721010621.4877-2-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We now should catch the stderr output from genrandconfig and discard
stdout. However, for debugging, stdout is still useful, so keep that
if the -d option is given.

Also log an explicit message when genrandconfig failed. genrandconfig
itself should already have printed some error message, but:
- it's possible that it didn't, for some reason;
- it's missing a timestamp.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 scripts/autobuild-run | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 879c9c3..85d82d8 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -307,10 +307,16 @@ def gen_config(**kwargs):
     log = kwargs['log']
     srcdir = os.path.join(idir, "buildroot")
 
+    log_write(log, "INFO: generate the configuration")
+
+    if kwargs['debug']:
+        devnull = log
+    else:
+        devnull = open(os.devnull, "w")
     ret = subprocess.call([os.path.join(srcdir, "utils/genrandconfig"),
                            "-i", str(kwargs['instance']),
                            "--toolchains-url", kwargs['toolchains_url']],
-                          stdout=log, stderr=log)
+                          stdout=devnull, stderr=log)
     return ret
 
 def do_build(**kwargs):
@@ -546,6 +552,7 @@ def run_instance(**kwargs):
 
         ret = gen_config(**kwargs)
         if ret != 0:
+            log_write(kwargs['log'], "WARN: failed to generate configuration")
             continue
 
         ret = do_build(**kwargs)
-- 
2.13.2
