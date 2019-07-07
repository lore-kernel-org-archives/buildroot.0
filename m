From: Atharva Lele <itsatharva@gmail.com>
Date: Sun,  7 Jul 2019 10:58:08 +0530
Subject: [Buildroot] [PATCH v3 08/31] autobuild-run: move niceness from
 kwargs to Builder class
In-Reply-To: <20190707052831.9469-1-itsatharva@gmail.com>
References: <20190707052831.9469-1-itsatharva@gmail.com>
Message-ID: <20190707052831.9469-8-itsatharva@gmail.com>
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
  - Fix accidentally moving make_opts in the same patch
---
 scripts/autobuild-run | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index c2d137c..87d0bd8 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -273,7 +273,7 @@ class SystemInfo:
 class Builder:
     def __init__(self, instance, njobs, sysinfo,
                  http_url, http_login, http_password,
-                 submitter, make_opts):
+                 submitter, make_opts, nice):
         self.instance = instance
         self.njobs = njobs
         self.sysinfo = sysinfo
@@ -282,6 +282,7 @@ class Builder:
         self.http_password = http_password
         self.submitter = submitter
         self.make_opts = make_opts
+        self.nice = nice
 
     def prepare_build(self, **kwargs):
         """Prepare for the next build of the specified instance
@@ -449,7 +450,6 @@ class Builder:
 
         idir = "instance-%d" % self.instance
         log = kwargs['log']
-        nice = kwargs['nice']
 
         # We need the absolute path to use with O=, because the relative
         # path to the output directory here is not relative to the
@@ -461,7 +461,7 @@ class Builder:
         f = open(os.path.join(outputdir, "logfile"), "w+")
         log_write(log, "INFO: build started")
 
-        cmd = ["nice", "-n", str(nice),
+        cmd = ["nice", "-n", str(self.nice),
                "make", "O=%s" % outputdir,
                "-C", srcdir, "BR2_DL_DIR=%s" % dldir,
                "BR2_JLEVEL=%s" % self.njobs] \
@@ -860,9 +860,9 @@ def main():
             http_login = args['--http-login'],
             http_password = args['--http-password'],
             submitter = args['--submitter'],
-            make_opts = (args['--make-opts'] or ''))
+            make_opts = (args['--make-opts'] or ''),
+            nice = (args['--nice'] or 0))
         p = multiprocessing.Process(target=builder.run_instance, kwargs=dict(
-                nice = (args['--nice'] or 0),
                 toolchains_csv = args['--toolchains-csv'],
                 repo = args['--repo'],
                 upload = upload,
-- 
2.22.0
