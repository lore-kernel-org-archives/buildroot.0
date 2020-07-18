From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 Jul 2020 22:18:36 +0200
Subject: [Buildroot] [PATCH buildroot-test] scripts/autobuild-run: properly
 delete output dir even with write-protected folders
Message-ID: <20200718201836.2408554-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We're already deleting the output directory before a new build with
"rm -rf" so that write protected files are removed as well, which
shutil.rmtree() doesn't do.

However "rm -rf" fails on write protected folders.

So instead, we do a recursive chmod +w, and then use shutil.rmtree()
since we are now sure that all folders and files will have write
permissions.

This solves an autobuild-run failure that occurs when the output
directory cannot be deleted due to write-protected directories. This
is happening with mender-artefact Go modules for example.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 scripts/autobuild-run | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index e475ea8..212e751 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -384,13 +384,14 @@ class Builder:
 
         # Create an empty output directory. We remove it first, in case a previous build was aborted.
         if os.path.exists(self.outputdir):
-            # shutil.rmtree doesn't remove write-protected files
-            subprocess.call(["rm", "-rf", self.outputdir])
+            subprocess.call(["chmod", "-R", "+w", self.outputdir])
+            shutil.rmtree(self.outputdir)
         os.mkdir(self.outputdir)
 
         # If it exists, remove the other output directory used for reproducibility testing
         if os.path.exists(self.outputdir_2):
-            subprocess.call(["rm", "-rf", self.outputdir_2])
+            subprocess.call(["chmod", "-R", "+w", self.outputdir_2])
+            shutil.rmtree(self.outputdir_2)
         with open(os.path.join(self.outputdir, "branch"), "w") as branchf:
             branchf.write(branch)
 
-- 
2.26.2
