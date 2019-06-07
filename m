From: Atharva Lele <itsatharva@gmail.com>
Date: Fri,  7 Jun 2019 12:16:57 +0530
Subject: [Buildroot] [PATCH v2 3/3] autobuild-run: do reproducible builds
 tests if BR2_REPRODUCIBLE=y
In-Reply-To: <20190607064657.3571-1-itsatharva@gmail.com>
References: <20190607064657.3571-1-itsatharva@gmail.com>
Message-ID: <20190607064657.3571-3-itsatharva@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Atharva Lele <itsatharva@gmail.com>

---
Changes v1 -> v2:
  - add trailing newline character to BR2_REPRODUCIBLE=y (suggested by arnout)

Signed-off-by: Atharva Lele <itsatharva@gmail.com>
---
 scripts/autobuild-run | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index a4ddb5b..bdbb48b 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -731,7 +731,15 @@ def run_instance(**kwargs):
             log_write(kwargs['log'], "WARN: failed to generate configuration")
             continue
 
-        ret = do_build(**kwargs)
+        # Check if the build test is supposed to be a reproducible test
+        outputdir = os.path.abspath(os.path.join(idir, "output"))
+        with open(os.path.join(outputdir, ".config"), "r") as fconf:
+            if "BR2_REPRODUCIBLE=y\n" in fconf.read():
+                log_write(kwargs['log'], "INFO: Reproducible Build Test")
+                ret = do_reproducible_build(**kwargs)
+            else:
+                log_write(kwargs['log'], "INFO: Non Reproducible Build Test")
+                ret = do_build(**kwargs)
 
         send_results(ret, **kwargs)
 
-- 
2.20.1
