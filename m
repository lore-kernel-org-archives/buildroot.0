From: Atharva Lele <itsatharva@gmail.com>
Date: Sun,  7 Jul 2019 10:58:11 +0530
Subject: [Buildroot] [PATCH v3 11/31] autobuild-run: move upload variable
 from kwargs to Builder class
In-Reply-To: <20190707052831.9469-1-itsatharva@gmail.com>
References: <20190707052831.9469-1-itsatharva@gmail.com>
Message-ID: <20190707052831.9469-11-itsatharva@gmail.com>
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
 scripts/autobuild-run | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index e64f6db..e217117 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -274,7 +274,7 @@ class Builder:
     def __init__(self, instance, njobs, sysinfo,
                  http_url, http_login, http_password,
                  submitter, make_opts, nice, toolchains_csv,
-                 repo):
+                 repo, upload):
         self.instance = instance
         self.njobs = njobs
         self.sysinfo = sysinfo
@@ -286,6 +286,7 @@ class Builder:
         self.nice = nice
         self.toolchains_csv = toolchains_csv
         self.repo = repo
+        self.upload = upload
 
     def prepare_build(self, **kwargs):
         """Prepare for the next build of the specified instance
@@ -686,7 +687,7 @@ class Builder:
             log_write(log, "ERROR: could not make results tarball")
             sys.exit(1)
 
-        if kwargs['upload']:
+        if self.upload:
             # Submit results. Yes, Python has some HTTP libraries, but
             # none of the ones that are part of the standard library can
             # upload a file without writing dozens of lines of code.
@@ -866,9 +867,9 @@ def main():
             make_opts = (args['--make-opts'] or ''),
             nice = (args['--nice'] or 0),
             toolchains_csv = args['--toolchains-csv'],
-            repo = args['--repo'])
+            repo = args['--repo'],
+            upload = upload)
         p = multiprocessing.Process(target=builder.run_instance, kwargs=dict(
-                upload = upload,
                 buildpid = buildpid,
                 debug = args['--debug']
             ))
-- 
2.22.0
