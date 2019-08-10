From: Atharva Lele <itsatharva@gmail.com>
Date: Sat, 10 Aug 2019 09:29:00 +0530
Subject: [Buildroot] [PATCH v2 3/5] autobuild-run: make diffoscope output a
 JSON-formatted file as well
In-Reply-To: <20190810035902.14047-1-itsatharva@gmail.com>
References: <20190810035902.14047-1-itsatharva@gmail.com>
Message-ID: <20190810035902.14047-3-itsatharva@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Normal diffoscope output is readable by humans but not really
convenient when working with it in code. JSON can be easily
read and extracted information from.

We still keep the normal text version because it's easy to parse by a human,
but we limit its size to 40KB.

Signed-off-by: Atharva Lele <itsatharva@gmail.com>
---
Changes v1 -> v2:
  - Save text output as well as JSON
---
 scripts/autobuild-run | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 69766b2..6adfa99 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -440,6 +440,7 @@ class Builder:
         """
 
         reproducible_results = os.path.join(self.outputdir, "results", "reproducible_results")
+        reproducible_results_text = os.path.join(self.outputdir, "results", "reproducible_results_text")
         # Using only tar images for now
         build_1_image = os.path.join(self.outputdir, "images", "rootfs.tar")
         build_2_image = os.path.join(self.outputdir_2, "images", "rootfs.tar")
@@ -453,7 +454,9 @@ class Builder:
                 prefix = prefix[13:-1]
                 log_write(self.log, "INFO: running diffoscope on images")
                 subprocess.call(["diffoscope", build_1_image, build_2_image,
-                                "--tool-prefix-binutils", prefix], stdout=diff, stderr=self.log)
+                                 "--tool-prefix-binutils", prefix, "--json", "-",
+                                 "--text", reproducible_results_text, "--max-text-report-size", "40000"],
+                                stdout=diff, stderr=self.log)
             else:
                 log_write(self.log, "INFO: diffoscope not installed, falling back to cmp")
                 subprocess.call(["cmp", "-b", build_1_image, build_2_image], stdout=diff, stderr=self.log)
-- 
2.22.0
