From: Atharva Lele <itsatharva@gmail.com>
Date: Fri, 21 Jun 2019 14:17:28 +0530
Subject: [Buildroot] [PATCH 17/19] autobuild-run: define download directory
 as part of Builder class
In-Reply-To: <20190621084730.16411-1-itsatharva@gmail.com>
References: <20190621084730.16411-1-itsatharva@gmail.com>
Message-ID: <20190621084730.16411-17-itsatharva@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Atharva Lele <itsatharva@gmail.com>
---
 scripts/autobuild-run | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index a237dfd..f9e2414 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -293,6 +293,7 @@ class Builder:
         # frequently needed directories
         self.idir = "instance-%d" % self.instance
         self.srcdir = os.path.join(self.idir, "buildroot")
+        self.dldir = os.path.join(self.idir, "dl")
 
         if self.debug:
             self.log = sys.stdout
@@ -310,9 +311,8 @@ class Builder:
         log_write(self.log, "INFO: preparing a new build")
 
         # Create the download directory if it doesn't exist
-        dldir = os.path.join(self.idir, "dl")
-        if not os.path.exists(dldir):
-            os.mkdir(dldir)
+        if not os.path.exists(self.dldir):
+            os.mkdir(self.dldir)
 
         # recursively find files under root
         def find_files(root):
@@ -332,12 +332,12 @@ class Builder:
         # regularly re-download files to check that their upstream
         # location is still correct.
         for i in range(0, 5):
-            flist = list(find_files(dldir))
+            flist = list(find_files(self.dldir))
             if not flist:
                 break
             f = flist[randint(0, len(flist) - 1)]
             log_write(self.log, "INFO: removing %s from downloads" %
-                    os.path.relpath(f, dldir))
+                    os.path.relpath(f, self.dldir))
             os.remove(f)
 
         branch = get_branch()
@@ -457,14 +457,13 @@ class Builder:
         # path to the output directory here is not relative to the
         # Buildroot sources, but to the location of the autobuilder
         # script.
-        dldir = os.path.abspath(os.path.join(self.idir, "dl"))
         outputdir = os.path.abspath(os.path.join(self.idir, "output"))
         f = open(os.path.join(outputdir, "logfile"), "w+")
         log_write(self.log, "INFO: build started")
 
         cmd = ["nice", "-n", str(self.nice),
                 "make", "O=%s" % outputdir,
-                "-C", self.srcdir, "BR2_DL_DIR=%s" % dldir,
+                "-C", self.srcdir, "BR2_DL_DIR=%s" % self.dldir,
                 "BR2_JLEVEL=%s" % self.njobs] \
             + self.make_opts.split()
         sub = subprocess.Popen(cmd, stdout=f, stderr=f)
@@ -497,7 +496,7 @@ class Builder:
             return -1
 
         cmd = ["make", "O=%s" % outputdir, "-C", self.srcdir,
-                "BR2_DL_DIR=%s" % dldir, "legal-info"] \
+                "BR2_DL_DIR=%s" % self.dldir, "legal-info"] \
             + self.make_opts.split()
         ret = subprocess.call(cmd, stdout=f, stderr=f)
         if ret != 0:
-- 
2.20.1
