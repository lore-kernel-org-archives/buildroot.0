From: Atharva Lele <itsatharva@gmail.com>
Date: Tue, 20 Aug 2019 20:22:27 +0530
Subject: [Buildroot] [PATCH v4 1/5] autobuild-run: check if
 reproducibile_results exists before checking its size
Message-ID: <20190820145231.15507-1-itsatharva@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This was causing some reproducible configs to crash autobuild script since it
tried to check the size of a file that did not exist.

Signed-off-by: Atharva Lele <itsatharva@gmail.com>
---
 scripts/autobuild-run | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index ead81a0..99b57dd 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -461,7 +461,7 @@ class Builder:
                 log_write(self.log, "INFO: diffoscope not installed, falling back to cmp")
                 subprocess.call(["cmp", "-b", build_1_image, build_2_image], stdout=diff, stderr=self.log)
 
-        if os.stat(reproducible_results).st_size > 0:
+        if os.path.exists(reproducible_results) and os.stat(reproducible_results).st_size > 0:
             log_write(self.log, "INFO: Build is non-reproducible.")
             return -1
 
-- 
2.22.0
