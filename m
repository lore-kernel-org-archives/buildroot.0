From: Atharva Lele <itsatharva@gmail.com>
Date: Sat, 29 Jun 2019 10:31:54 +0530
Subject: [Buildroot] [PATCH 07/27] autobuild-run: move make_opts from kwargs
 to Builder class
In-Reply-To: <20190629050214.17852-1-itsatharva@gmail.com>
References: <20190629050214.17852-1-itsatharva@gmail.com>
Message-ID: <20190629050214.17852-7-itsatharva@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Atharva Lele <itsatharva@gmail.com>
---
Changes v1 -> v2:
  - New patch, split accidental squash of niceness move and make_opts move
---
 scripts/autobuild-run | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index e695275..8f06547 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -273,7 +273,7 @@ class SystemInfo:
 class Builder:
     def __init__(self, instance, njobs, sysinfo,
                  http_url, http_login, http_password,
-                 submitter):
+                 submitter, make_opts):
         self.instance = instance
         self.njobs = njobs
         self.sysinfo = sysinfo
@@ -281,6 +281,7 @@ class Builder:
         self.http_login = http_login
         self.http_password = http_password
         self.submitter = submitter
+        self.make_opts = make_opts
 
     def prepare_build(self, **kwargs):
         """Prepare for the next build of the specified instance
@@ -464,7 +465,7 @@ class Builder:
                "make", "O=%s" % outputdir,
                "-C", srcdir, "BR2_DL_DIR=%s" % dldir,
                "BR2_JLEVEL=%s" % self.njobs] \
-            + kwargs['make_opts'].split()
+            + self.make_opts.split()
         sub = subprocess.Popen(cmd, stdout=f, stderr=f)
 
         # Setup hung build monitoring thread
@@ -496,7 +497,7 @@ class Builder:
 
         cmd = ["make", "O=%s" % outputdir, "-C", srcdir,
                "BR2_DL_DIR=%s" % dldir, "legal-info"] \
-            + kwargs['make_opts'].split()
+            + self.make_opts.split()
         ret = subprocess.call(cmd, stdout=f, stderr=f)
         if ret != 0:
             log_write(log, "INFO: build failed during legal-info")
@@ -858,9 +859,9 @@ def main():
             http_url = args['--http-url'],
             http_login = args['--http-login'],
             http_password = args['--http-password'],
-            submitter = args['--submitter'])
+            submitter = args['--submitter'],
+            make_opts = (args['--make-opts'] or ''))
         p = multiprocessing.Process(target=builder.run_instance, kwargs=dict(
-                make_opts = (args['--make-opts'] or ''),
                 nice = (args['--nice'] or 0),
                 toolchains_csv = args['--toolchains-csv'],
                 repo = args['--repo'],
-- 
2.20.1
