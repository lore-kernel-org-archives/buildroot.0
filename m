From: Atharva Lele <itsatharva@gmail.com>
Date: Tue, 11 Jun 2019 18:02:34 +0530
Subject: [Buildroot] [PATCH] autobuild-run: move creation of result
 directory to run_instance()
Message-ID: <20190611123234.11385-1-itsatharva@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We need the result directory to be present when the check_reproducibility()
function (implemented in the next patch) executes. As of now the results
directory is created in the send_results() function which executes after
check_reproducibility() will.

Signed-off-by: Atharva Lele <itsatharva@gmail.com>
---
 scripts/autobuild-run | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index ef2f2a5..190a254 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -470,8 +470,6 @@ def send_results(result, **kwargs):
     srcdir = os.path.join(idir, "buildroot")
     resultdir = os.path.join(outputdir, "results")
 
-    os.mkdir(resultdir)
-
     shutil.copyfile(os.path.join(outputdir, ".config"),
                     os.path.join(resultdir, "config"))
     shutil.copyfile(os.path.join(outputdir, "defconfig"),
@@ -647,6 +645,9 @@ def run_instance(**kwargs):
         if ret != 0:
             continue
 
+        resultdir = os.path.join(idir, "output", "results")
+        os.mkdir(resultdir)
+
         ret = gen_config(**kwargs)
         if ret != 0:
             log_write(kwargs['log'], "WARN: failed to generate configuration")
-- 
2.20.1
