From: Atharva Lele <itsatharva@gmail.com>
Date: Fri, 21 Jun 2019 14:17:22 +0530
Subject: [Buildroot] [PATCH 11/19] autobuild-run: move buildpid from kwargs
 to Builder class
In-Reply-To: <20190621084730.16411-1-itsatharva@gmail.com>
References: <20190621084730.16411-1-itsatharva@gmail.com>
Message-ID: <20190621084730.16411-11-itsatharva@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Atharva Lele <itsatharva@gmail.com>
---
 scripts/autobuild-run | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 7695211..7c3e891 100755
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
@@ -860,9 +861,8 @@ def main():
                           args['--http-login'], args['--http-password'],
                           args['--submitter'], (args['--make-opts'] or ''),
                           (args['--nice'] or 0), args['--toolchains-csv'],
-                          args['--repo'], upload)
+                          args['--repo'], upload, buildpid)
         p = multiprocessing.Process(target=builder.run_instance, kwargs=dict(
-                buildpid = buildpid,
                 debug = args['--debug']
             ))
         p.start()
-- 
2.20.1
