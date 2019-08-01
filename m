From: Atharva Lele <itsatharva@gmail.com>
Date: Thu,  1 Aug 2019 08:16:25 +0530
Subject: [Buildroot] [PATCH v4 12/30] autobuild-run: move buildpid from
 kwargs to Builder class
In-Reply-To: <20190801024643.11024-1-itsatharva@gmail.com>
References: <20190801024643.11024-1-itsatharva@gmail.com>
Message-ID: <20190801024643.11024-13-itsatharva@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Atharva Lele <itsatharva@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Changes v1 -> v2:
  - Explicitly state class constructor argument
---
 scripts/autobuild-run | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index e217117..05de063 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -274,7 +274,7 @@ class Builder:
     def __init__(self, instance, njobs, sysinfo,
                  http_url, http_login, http_password,
                  submitter, make_opts, nice, toolchains_csv,
-                 repo, upload):
+                 repo, upload, buildpid):
         self.instance = instance
         self.njobs = njobs
         self.sysinfo = sysinfo
@@ -287,6 +287,7 @@ class Builder:
         self.toolchains_csv = toolchains_csv
         self.repo = repo
         self.upload = upload
+        self.buildpid = buildpid
 
     def prepare_build(self, **kwargs):
         """Prepare for the next build of the specified instance
@@ -482,9 +483,9 @@ class Builder:
         build_monitor.daemon = True
         build_monitor.start()
 
-        kwargs['buildpid'][self.instance] = sub.pid
+        self.buildpid[self.instance] = sub.pid
         ret = sub.wait()
-        kwargs['buildpid'][self.instance] = 0
+        self.buildpid[self.instance] = 0
 
         # If build failed, monitor thread would have exited at this point
         if monitor_thread_hung_build_flag.is_set():
@@ -868,9 +869,9 @@ def main():
             nice = (args['--nice'] or 0),
             toolchains_csv = args['--toolchains-csv'],
             repo = args['--repo'],
-            upload = upload)
+            upload = upload,
+            buildpid = buildpid)
         p = multiprocessing.Process(target=builder.run_instance, kwargs=dict(
-                buildpid = buildpid,
                 debug = args['--debug']
             ))
         p.start()
-- 
2.22.0
