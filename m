From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 31 Mar 2019 19:48:23 +0200
Subject: [Buildroot] [PATCH 1/2] [AUTOBUILD] autobuild-run: add helper
 function to copy-if-exists
In-Reply-To: <cover.1554054435.git.yann.morin.1998@free.fr>
References: <cover.1554054435.git.yann.morin.1998@free.fr>
Message-ID: <7b95efec2ae63191a2062525e9e12e4d74009639.1554054435.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 scripts/autobuild-run | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 3d2e99a..b65d8fb 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -478,12 +478,14 @@ def send_results(result, **kwargs):
                     os.path.join(resultdir, "defconfig"))
     shutil.copyfile(os.path.join(outputdir, "branch"),
                     os.path.join(resultdir, "branch"))
-    if os.path.exists(os.path.join(outputdir, "build", "build-time.log")):
-        shutil.copyfile(os.path.join(outputdir, "build", "build-time.log"),
-                        os.path.join(resultdir, "build-time.log"))
-    if os.path.exists(os.path.join(outputdir, "legal-info", "manifest.csv")):
-        shutil.copyfile(os.path.join(outputdir, "legal-info", "manifest.csv"),
-                        os.path.join(resultdir, "licenses-manifest.csv"))
+
+    def copy_if_exists(dir, src, dst=None):
+        if os.path.exists(os.path.join(outputdir, d, src)):
+            shutil.copyfile(os.path.join(outputdir, d, src),
+                            os.path.join(resultdir, src if dst is None else dst))
+
+    copy_if_exists("build", "build-time.log")
+    copy_if_exists("legal-info", "manifest.csv", "licenses-manifest.csv")
 
     subprocess.call(["git log -n 1 --pretty=format:%%H > %s" % \
                      os.path.join(resultdir, "gitid")],
-- 
2.14.1
