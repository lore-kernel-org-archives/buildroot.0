From: Atharva Lele <itsatharva@gmail.com>
Date: Mon,  3 Jun 2019 14:48:07 +0530
Subject: [Buildroot] [PATCH 2/3] autobuild-run: initial implementation of
 do_reproducible_build()
In-Reply-To: <20190603091808.2928-1-itsatharva@gmail.com>
References: <20190603091808.2928-1-itsatharva@gmail.com>
Message-ID: <20190603091808.2928-2-itsatharva@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This new function will call do_build() twice to produce two builds
and then check their reproducibility

Signed-off-by: Atharva Lele <itsatharva@gmail.com>
---
 scripts/autobuild-run | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 9f8aabb..329803a 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -455,6 +455,44 @@ def do_build(**kwargs):
     log_write(log, "INFO: build successful")
     return 0
 
+def do_reproducible_build(**kwargs):
+    """Run the builds for reproducibility testing
+
+    Build twice with the same configuration. Calls do_build() to
+    perform the actual build.
+    """
+
+    idir = "instance-%d" % kwargs['instance']
+    outputdir = os.path.join(idir, "output")
+    f = open(os.path.join(outputdir, "logfile"), "w+")
+    log = kwargs['log']
+    
+    # Start the first build
+    log_write(log, "INFO: Reproducible Build Test, starting build 1")
+    ret = do_build(**kwargs)
+    if ret != 0:
+        log_write(log, "INFO: build 1 failed, skipping build 2")
+        return ret
+    
+    # First build has been built, move files and start build 2
+    os.rename(os.path.join(outputdir, "images"), os.path.join(outputdir, "images-1"))
+
+    # Clean up build 1
+    cmd = ["make", "O=%s" % outputdir, "clean"] \
+          + kwargs['make_opts'].split()
+    subprocess.call(cmd, stdout=f, stderr=f)
+
+    # Start the second build
+    log_write(log, "INFO: Reproducible Build Test, starting build 2")
+    ret = do_build(**kwargs)
+    if ret != 0:
+        log_write(log, "INFO: build 2 failed")
+        return ret
+
+    # Assuming both have built successfully
+    ret = check_reproducibility()
+    return ret
+
 def send_results(result, **kwargs):
     """Prepare and store/send tarball with results
 
-- 
2.20.1
