From: Atharva Lele <itsatharva@gmail.com>
Date: Tue,  6 Aug 2019 23:42:48 +0530
Subject: [Buildroot] [PATCH 3/6] autobuild-run: fix cross tools prefix for
 diffoscope
In-Reply-To: <20190806181251.21885-1-itsatharva@gmail.com>
References: <20190806181251.21885-1-itsatharva@gmail.com>
Message-ID: <20190806181251.21885-3-itsatharva@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Make outputs "make: entering directory" when called from a different
directory which is unnecessary and yields a wrong prefix. Adding this
argument supresses unnecessary output and yields the right prefix.

Before and after: https://gitlab.com/snippets/1877119

Signed-off-by: Atharva Lele <itsatharva@gmail.com>
---
 scripts/autobuild-run | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index ab49dcb..69766b2 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -447,7 +447,8 @@ class Builder:
         with open(reproducible_results, 'w') as diff:
             if self.sysinfo.has("diffoscope"):
                 # Prefix to point diffoscope towards cross-tools
-                prefix = subprocess.check_output(["make", "O=%s" % self.outputdir, "-C", self.srcdir, "printvars", "VARS=TARGET_CROSS"])
+                prefix = subprocess.check_output(["make", "--no-print-directory", "O=%s" % self.outputdir,
+                                                  "-C", self.srcdir, "printvars", "VARS=TARGET_CROSS"])
                 # Remove TARGET_CROSS= and \n from the string
                 prefix = prefix[13:-1]
                 log_write(self.log, "INFO: running diffoscope on images")
-- 
2.22.0
