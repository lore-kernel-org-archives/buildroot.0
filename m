From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 9 Apr 2017 22:51:22 +0200
Subject: [Buildroot] [PATCH/autobuild 2/8] autobuild-run: add '-d,
	--debug' option
In-Reply-To: <20170409205128.11560-1-arnout@mind.be>
References: <20170409205128.11560-1-arnout@mind.be>
Message-ID: <20170409205128.11560-2-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

While changing and debugging the autobuild-run script, it is convenient
to be able to see the log directly on stdout rather than opening the
log file. So provide an option for this.

The option is called '--debug' with the idea that other debugging
features added later can reuse the same option.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 scripts/autobuild-run | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 64da088..2f0463d 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -101,6 +101,7 @@ Options:
                                  Defaults to %(--pid-file)s.
   -c, --config CONFIG            path to configuration file
                                  Not set by default.
+  -d, --debug                    Send log output to stdout instead of log file
   --toolchains-url URL           URL of toolchain configuration file
 
 Format of the configuration file:
@@ -800,7 +801,10 @@ def run_instance(**kwargs):
     if not os.path.exists(idir):
         os.mkdir(idir)
 
-    kwargs['log'] = open(os.path.join(idir, "instance.log"), "a+")
+    if kwargs['debug']:
+        kwargs['log'] = sys.stdout
+    else:
+        kwargs['log'] = open(os.path.join(idir, "instance.log"), "a+")
     log_write(kwargs['log'], "INFO: instance started")
 
     while True:
@@ -926,7 +930,8 @@ def main():
                 nice = (args['--nice'] or 0),
                 toolchains_url = args['--toolchains-url'],
                 upload = upload,
-                buildpid = buildpid
+                buildpid = buildpid,
+                debug = args['--debug']
             ))
         p.start()
         processes.append(p)
-- 
2.11.0
