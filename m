From: Atharva Lele <itsatharva@gmail.com>
Date: Fri, 21 Jun 2019 14:17:23 +0530
Subject: [Buildroot] [PATCH 12/19] autobuild-run: move debug from kwargs to
 Builder class
In-Reply-To: <20190621084730.16411-1-itsatharva@gmail.com>
References: <20190621084730.16411-1-itsatharva@gmail.com>
Message-ID: <20190621084730.16411-12-itsatharva@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Atharva Lele <itsatharva@gmail.com>
---
 scripts/autobuild-run | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 7c3e891..0db2995 100755
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
@@ -861,10 +862,8 @@ def main():
                           args['--http-login'], args['--http-password'],
                           args['--submitter'], (args['--make-opts'] or ''),
                           (args['--nice'] or 0), args['--toolchains-csv'],
-                          args['--repo'], upload, buildpid)
-        p = multiprocessing.Process(target=builder.run_instance, kwargs=dict(
-                debug = args['--debug']
-            ))
+                          args['--repo'], upload, buildpid, args['--debug'])
+        p = multiprocessing.Process(target=builder.run_instance)
         p.start()
         processes.append(p)
 
-- 
2.20.1
