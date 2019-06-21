From: Atharva Lele <itsatharva@gmail.com>
Date: Fri, 21 Jun 2019 14:17:21 +0530
Subject: [Buildroot] [PATCH 10/19] autobuild-run: move upload variable from
 kwargs to Builder class
In-Reply-To: <20190621084730.16411-1-itsatharva@gmail.com>
References: <20190621084730.16411-1-itsatharva@gmail.com>
Message-ID: <20190621084730.16411-10-itsatharva@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Atharva Lele <itsatharva@gmail.com>
---
 scripts/autobuild-run | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index a883ca8..7695211 100755
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
@@ -859,9 +860,8 @@ def main():
                           args['--http-login'], args['--http-password'],
                           args['--submitter'], (args['--make-opts'] or ''),
                           (args['--nice'] or 0), args['--toolchains-csv'],
-                          args['--repo'])
+                          args['--repo'], upload)
         p = multiprocessing.Process(target=builder.run_instance, kwargs=dict(
-                upload = upload,
                 buildpid = buildpid,
                 debug = args['--debug']
             ))
-- 
2.20.1
