From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 10 Apr 2017 23:59:59 +0200
Subject: [Buildroot] [PATCH/autobuild v2 3/7] autobuild-run: use
	'olddefconfig' instead of 'oldconfig'
In-Reply-To: <20170410220003.30421-1-arnout@mind.be>
References: <20170410220003.30421-1-arnout@mind.be>
Message-ID: <20170410220003.30421-3-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Back in the days that autobuild-run was created, we didn't have an
olddefconfig target so we had to pipe yes into oldconfig instead.
Nowadays, however, we can use the olddefconfig target.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v2: Also use 'olddefconfig' for the second call to 'oldconfig'
---
 scripts/autobuild-run | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 2f0463d..521b2c9 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -558,8 +558,8 @@ def gen_config(**kwargs):
 
     devnull = open(os.devnull, "w")
 
-    ret = subprocess.call(["yes '' 2>/dev/null| make O=%s -C %s oldconfig" % \
-                           (outputdir, srcdir)], shell=True, stdout=devnull, stderr=devnull)
+    ret = subprocess.call(["make", "O=%s" % outputdir, "-C", srcdir, "olddefconfig"],
+                          stdout=devnull, stderr=devnull)
     if ret != 0:
         log_write(log, "ERROR: cannot oldconfig")
         return -1
@@ -586,8 +586,8 @@ def gen_config(**kwargs):
         if fixup_config(**kwargs):
             break
 
-    ret = subprocess.call(["yes '' 2>/dev/null| make O=%s -C %s oldconfig" % \
-                           (outputdir, srcdir)], shell=True, stdout=devnull, stderr=devnull)
+    ret = subprocess.call(["make", "O=%s" % outputdir, "-C", srcdir, "olddefconfig"],
+                          stdout=devnull, stderr=devnull)
     if ret != 0:
         log_write(log, "ERROR: cannot oldconfig")
         return -1
-- 
2.11.0
