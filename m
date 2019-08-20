From: Atharva Lele <itsatharva@gmail.com>
Date: Tue, 20 Aug 2019 20:22:30 +0530
Subject: [Buildroot] [PATCH v4 4/5] autobuild-run: move with open to
 appropriate place in check_reproducibility()
In-Reply-To: <20190820145231.15507-1-itsatharva@gmail.com>
References: <20190820145231.15507-1-itsatharva@gmail.com>
Message-ID: <20190820145231.15507-4-itsatharva@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since we switched to using diffoscope's ability to write to a file, having a
with open() does not make sense while running the command. Instead, move it to
the else condition where it can be used by cmp.

Signed-off-by: Atharva Lele <itsatharva@gmail.com>
---
 scripts/autobuild-run | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 876feb2..c25413b 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -446,19 +446,19 @@ class Builder:
         build_1_image = os.path.join(self.outputdir, "images", "rootfs.tar")
         build_2_image = os.path.join(self.outputdir_2, "images", "rootfs.tar")
 
-        with open(reproducible_results, 'w') as diff:
-            if self.sysinfo.has("diffoscope"):
-                # Prefix to point diffoscope towards cross-tools
-                prefix = subprocess.check_output(["make", "--no-print-directory", "O=%s" % self.outputdir,
-                                                  "-C", self.srcdir, "printvars", "VARS=TARGET_CROSS"])
-                # Remove TARGET_CROSS= and \n from the string
-                prefix = prefix[13:-1]
-                log_write(self.log, "INFO: running diffoscope on images")
-                subprocess.call(["diffoscope", build_1_image, build_2_image,
-                                 "--tool-prefix-binutils", prefix, "--json", reproducible_results,
-                                 "--text", reproducible_results_txt, "--max-text-report-size", "40000"],
-                                stderr=self.log)
-            else:
+        if self.sysinfo.has("diffoscope"):
+            # Prefix to point diffoscope towards cross-tools
+            prefix = subprocess.check_output(["make", "--no-print-directory", "O=%s" % self.outputdir,
+                                              "-C", self.srcdir, "printvars", "VARS=TARGET_CROSS"])
+            # Remove TARGET_CROSS= and \n from the string
+            prefix = prefix[13:-1]
+            log_write(self.log, "INFO: running diffoscope on images")
+            subprocess.call(["diffoscope", build_1_image, build_2_image,
+                             "--tool-prefix-binutils", prefix, "--json", reproducible_results,
+                             "--text", reproducible_results_txt, "--max-text-report-size", "40000"],
+                            stderr=self.log)
+        else:
+            with open(reproducible_results_txt, 'w') as diff:
                 log_write(self.log, "INFO: diffoscope not installed, falling back to cmp")
                 subprocess.call(["cmp", "-b", build_1_image, build_2_image], stdout=diff, stderr=self.log)
 
-- 
2.22.0
