From: Atharva Lele <itsatharva@gmail.com>
Date: Tue, 13 Aug 2019 09:42:04 +0530
Subject: [Buildroot] [PATCH v3 1/3] autobuild-run: maintain consistency in
 diffoscope command
Message-ID: <20190813041206.20715-1-itsatharva@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since we are outputting to two file types, we can't just redirect stdout.
Instead, we use diffoscope's ability to output to a file to maintain
consistency in the command.

This patch also fixes a typo in the command. For text output,
it should be reproducibility_results_txt instead of
reproducibility_results_text.

Signed-off-by: Atharva Lele <itsatharva@gmail.com>
---
 scripts/autobuild-run | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index dbb497c..ead81a0 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -454,9 +454,9 @@ class Builder:
                 prefix = prefix[13:-1]
                 log_write(self.log, "INFO: running diffoscope on images")
                 subprocess.call(["diffoscope", build_1_image, build_2_image,
-                                 "--tool-prefix-binutils", prefix, "--json", "-",
-                                 "--text", reproducible_results_text, "--max-text-report-size", "40000"],
-                                stdout=diff, stderr=self.log)
+                                 "--tool-prefix-binutils", prefix, "--json", reproducible_results,
+                                 "--text", reproducible_results_txt, "--max-text-report-size", "40000"],
+                                stderr=self.log)
             else:
                 log_write(self.log, "INFO: diffoscope not installed, falling back to cmp")
                 subprocess.call(["cmp", "-b", build_1_image, build_2_image], stdout=diff, stderr=self.log)
-- 
2.22.0
