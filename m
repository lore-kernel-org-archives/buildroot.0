From: Atharva Lele <itsatharva@gmail.com>
Date: Thu,  1 Aug 2019 08:16:26 +0530
Subject: [Buildroot] [PATCH v4 13/30] autobuild-run: move debug from kwargs
 to Builder class
In-Reply-To: <20190801024643.11024-1-itsatharva@gmail.com>
References: <20190801024643.11024-1-itsatharva@gmail.com>
Message-ID: <20190801024643.11024-14-itsatharva@gmail.com>
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
 scripts/autobuild-run | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 05de063..923652c 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -274,7 +274,7 @@ class Builder:
     def __init__(self, instance, njobs, sysinfo,
                  http_url, http_login, http_password,
                  submitter, make_opts, nice, toolchains_csv,
-                 repo, upload, buildpid):
+                 repo, upload, buildpid, debug):
         self.instance = instance
         self.njobs = njobs
         self.sysinfo = sysinfo
@@ -288,6 +288,7 @@ class Builder:
         self.repo = repo
         self.upload = upload
         self.buildpid = buildpid
+        self.debug = debug
 
     def prepare_build(self, **kwargs):
         """Prepare for the next build of the specified instance
@@ -378,7 +379,7 @@ class Builder:
 
         log_write(log, "INFO: generate the configuration")
 
-        if kwargs['debug']:
+        if self.debug:
             devnull = log
         else:
             devnull = open(os.devnull, "w")
@@ -724,7 +725,7 @@ class Builder:
         if not os.path.exists(idir):
             os.mkdir(idir)
 
-        if kwargs['debug']:
+        if self.debug:
             kwargs['log'] = sys.stdout
         else:
             kwargs['log'] = open(os.path.join(idir, "instance.log"), "a+")
@@ -870,10 +871,9 @@ def main():
             toolchains_csv = args['--toolchains-csv'],
             repo = args['--repo'],
             upload = upload,
-            buildpid = buildpid)
-        p = multiprocessing.Process(target=builder.run_instance, kwargs=dict(
-                debug = args['--debug']
-            ))
+            buildpid = buildpid,
+            debug = args['--debug'])
+        p = multiprocessing.Process(target=builder.run_instance)
         p.start()
         processes.append(p)
 
-- 
2.22.0
