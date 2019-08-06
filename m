From: Atharva Lele <itsatharva@gmail.com>
Date: Tue,  6 Aug 2019 23:42:47 +0530
Subject: [Buildroot] [PATCH 2/6] autobuild-run: make prepare_build() clean
 the output directory used for reproducibility testing
In-Reply-To: <20190806181251.21885-1-itsatharva@gmail.com>
References: <20190806181251.21885-1-itsatharva@gmail.com>
Message-ID: <20190806181251.21885-2-itsatharva@gmail.com>
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
index 45b7d2b..ab49dcb 100755
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
