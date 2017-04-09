From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 9 Apr 2017 22:51:24 +0200
Subject: [Buildroot] [PATCH/autobuild 4/8] autobuild-run: remove redundant
	'make oldconfig'
In-Reply-To: <20170409205128.11560-1-arnout@mind.be>
References: <20170409205128.11560-1-arnout@mind.be>
Message-ID: <20170409205128.11560-4-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After running 'make randpackageconfig', and additional 'make oldconfig'
is done. However, this is redundant, since randpackageconfig already
does an olddefconfig.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 scripts/autobuild-run | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 42276db..1df1ce0 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -586,12 +586,6 @@ def gen_config(**kwargs):
         if fixup_config(**kwargs):
             break
 
-    ret = subprocess.call(["yes '' 2>/dev/null| make O=%s -C %s oldconfig" % \
-                           (outputdir, srcdir)], shell=True, stdout=devnull, stderr=devnull)
-    if ret != 0:
-        log_write(log, "ERROR: cannot oldconfig")
-        return -1
-
     ret = subprocess.call(["make", "O=%s" % outputdir, "-C", srcdir, "savedefconfig"],
                           stdout=devnull, stderr=devnull)
     if ret != 0:
-- 
2.11.0
