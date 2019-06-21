From: Atharva Lele <itsatharva@gmail.com>
Date: Fri, 21 Jun 2019 14:17:18 +0530
Subject: [Buildroot] [PATCH 07/19] autobuild-run: move niceness from kwargs
 to Builder class
In-Reply-To: <20190621084730.16411-1-itsatharva@gmail.com>
References: <20190621084730.16411-1-itsatharva@gmail.com>
Message-ID: <20190621084730.16411-7-itsatharva@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Atharva Lele <itsatharva@gmail.com>
---
 scripts/autobuild-run | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 20b453e..a435570 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -273,7 +273,7 @@ class SystemInfo:
 class Builder:
     def __init__(self, instance, njobs, sysinfo,
                  http_url, http_login, http_password,
-                 submitter):
+                 submitter, make_opts, nice):
         self.instance = instance
         self.njobs = njobs
         self.sysinfo = sysinfo
@@ -281,6 +281,8 @@ class Builder:
         self.http_login = http_login
         self.http_password = http_password
         self.submitter = submitter
+        self.make_opts = make_opts
+        self.nice = nice
 
     def prepare_build(self, **kwargs):
         """Prepare for the next build of the specified instance
@@ -448,7 +450,6 @@ class Builder:
 
         idir = "instance-%d" % self.instance
         log = kwargs['log']
-        nice = kwargs['nice']
 
         # We need the absolute path to use with O=, because the relative
         # path to the output directory here is not relative to the
@@ -460,11 +461,11 @@ class Builder:
         f = open(os.path.join(outputdir, "logfile"), "w+")
         log_write(log, "INFO: build started")
 
-        cmd = ["nice", "-n", str(nice),
+        cmd = ["nice", "-n", str(self.nice),
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
@@ -853,10 +854,9 @@ def main():
     for i in range(0, int(args['--ninstances'])):
         builder = Builder(i, args['--njobs'], sysinfo, args['--http-url'],
                           args['--http-login'], args['--http-password'],
-                          args['--submitter'])
+                          args['--submitter'], (args['--make-opts'] or ''),
+                          (args['--nice'] or 0))
         p = multiprocessing.Process(target=builder.run_instance, kwargs=dict(
-                make_opts = (args['--make-opts'] or ''),
-                nice = (args['--nice'] or 0),
                 toolchains_csv = args['--toolchains-csv'],
                 repo = args['--repo'],
                 upload = upload,
-- 
2.20.1
