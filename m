From: Atharva Lele <itsatharva@gmail.com>
Date: Sat, 10 Aug 2019 09:28:59 +0530
Subject: [Buildroot] [PATCH v2 2/5] autobuild-run: make prepare_build()
 clean the output directory used for reproducibility testing
In-Reply-To: <20190810035902.14047-1-itsatharva@gmail.com>
References: <20190810035902.14047-1-itsatharva@gmail.com>
Message-ID: <20190810035902.14047-2-itsatharva@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The previous patch introduced a new output directory for the second build in a
reproducibile build test. This patch will make sure that it is cleaned before
the subsequent build process begins.

Signed-off-by: Atharva Lele <itsatharva@gmail.com>
---
 scripts/autobuild-run | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 21eb47a..69766b2 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -383,6 +383,10 @@ class Builder:
             # shutil.rmtree doesn't remove write-protected files
             subprocess.call(["rm", "-rf", self.outputdir])
         os.mkdir(self.outputdir)
+
+        # If it exists, remove the other output directory used for reproducibility testing
+        if os.path.exists(self.outputdir_2):
+            subprocess.call(["rm", "-rf", self.outputdir_2])
         with open(os.path.join(self.outputdir, "branch"), "w") as branchf:
             branchf.write(branch)
 
-- 
2.22.0
