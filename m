From: Atharva Lele <itsatharva@gmail.com>
Date: Fri, 21 Jun 2019 14:17:20 +0530
Subject: [Buildroot] [PATCH 09/19] autobuild-run: move repo from kwargs to
 Builder class
In-Reply-To: <20190621084730.16411-1-itsatharva@gmail.com>
References: <20190621084730.16411-1-itsatharva@gmail.com>
Message-ID: <20190621084730.16411-9-itsatharva@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Atharva Lele <itsatharva@gmail.com>
---
 scripts/autobuild-run | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index f737b27..a883ca8 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -273,7 +273,8 @@ class SystemInfo:
 class Builder:
     def __init__(self, instance, njobs, sysinfo,
                  http_url, http_login, http_password,
-                 submitter, make_opts, nice, toolchains_csv):
+                 submitter, make_opts, nice, toolchains_csv,
+                 repo):
         self.instance = instance
         self.njobs = njobs
         self.sysinfo = sysinfo
@@ -284,6 +285,7 @@ class Builder:
         self.make_opts = make_opts
         self.nice = nice
         self.toolchains_csv = toolchains_csv
+        self.repo = repo
 
     def prepare_build(self, **kwargs):
         """Prepare for the next build of the specified instance
@@ -336,7 +338,7 @@ class Builder:
         # didn't exist already.
         srcdir = os.path.join(idir, "buildroot")
         if not os.path.exists(srcdir):
-            ret = subprocess.call(["git", "clone", kwargs['repo'], srcdir],
+            ret = subprocess.call(["git", "clone", self.repo, srcdir],
                                 stdout=log, stderr=log)
             if ret != 0:
                 log_write(log, "ERROR: could not clone Buildroot sources")
@@ -856,9 +858,9 @@ def main():
         builder = Builder(i, args['--njobs'], sysinfo, args['--http-url'],
                           args['--http-login'], args['--http-password'],
                           args['--submitter'], (args['--make-opts'] or ''),
-                          (args['--nice'] or 0), args['--toolchains-csv'])
+                          (args['--nice'] or 0), args['--toolchains-csv'],
+                          args['--repo'])
         p = multiprocessing.Process(target=builder.run_instance, kwargs=dict(
-                repo = args['--repo'],
                 upload = upload,
                 buildpid = buildpid,
                 debug = args['--debug']
-- 
2.20.1
