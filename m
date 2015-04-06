From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  6 Apr 2015 23:02:49 +0200
Subject: [Buildroot] [buildroot-test] [PATCH] autbuild-run: fix legal-info
Message-ID: <1428354169-25215-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, running legal-info is broken, as it only runs a plain 'make',
which does not do much...

Fix that by explicitly pass 'legal-info' as the make target. Also, we
need to specify the download dir, to avoid using the default one (which
does not exist) or a user-defined one (in the environment).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 scripts/autobuild-run | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 409570d..0e12080 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -560,7 +560,10 @@ def do_build(**kwargs):
     if ret != 0:
         log_write(log, "INFO: build failed")
         return -1
-    ret = subprocess.call(["make", "O=%s" % outputdir, "-C", srcdir], stdout=f, stderr=f)
+    cmd = ["make", "O=%s" % outputdir, "-C", srcdir,
+            "BR2_DL_DIR=%s" % dldir, "legal-info"] \
+          + kwargs['make_opts'].split()
+    ret = subprocess.call(cmd, stdout=f, stderr=f)
     if ret != 0:
         log_write(log, "INFO: build failed during legal-info")
         return -1
-- 
1.9.1
