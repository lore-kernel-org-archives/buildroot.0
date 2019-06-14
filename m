From: Atharva Lele <itsatharva@gmail.com>
Date: Fri, 14 Jun 2019 16:25:39 +0530
Subject: [Buildroot] [PATCH v4 4/4] autobuild-run: do reproducible builds
 tests if BR2_REPRODUCIBLE=y
In-Reply-To: <20190614105539.16301-1-itsatharva@gmail.com>
References: <20190614105539.16301-1-itsatharva@gmail.com>
Message-ID: <20190614105539.16301-4-itsatharva@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Atharva Lele <itsatharva@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
Changes v3 -> v4:
  - Fix indentation level for if-else, otherwise file still remains open
    for the duration of the build.

Changes v2 -> v3:
  - use reproducible flag so that .config is not kept open for the entire
    build duration. (suggested by arnout)
  - remove reduntant logging (suggested by arnout)

Changes v1 -> v2:
  - add trailing newline character to BR2_REPRODUCIBLE=y (suggested by arnout)
---
 scripts/autobuild-run | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index b641694..6426c9e 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -727,7 +727,14 @@ def run_instance(**kwargs):
             log_write(kwargs['log'], "WARN: failed to generate configuration")
             continue
 
-        ret = do_build(**kwargs)
+        # Check if the build test is supposed to be a reproducible test
+        outputdir = os.path.abspath(os.path.join(idir, "output"))
+        with open(os.path.join(outputdir, ".config"), "r") as fconf:
+            reproducible = "BR2_REPRODUCIBLE=y\n" in fconf.read()
+        if reproducible:
+            ret = do_reproducible_build(**kwargs)
+        else:
+            ret = do_build(**kwargs)
 
         send_results(ret, **kwargs)
 
-- 
2.20.1
