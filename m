From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 22 Aug 2013 20:02:13 +0200
Subject: [Buildroot] [PATCH] apply-patches: run patch in batch mode
In-Reply-To: <5215C738.2070707@lucaceresoli.net>
References: <5215C738.2070707@lucaceresoli.net>
Message-ID: <1377194533-22501-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If the file to be patched is missing, then `patch' will interactively
ask for a file to be patched. This is annoying in e.g. the autobuilders
because they have to wait for a timeout instead of failing.

Giving the '-t' (batch mode) option to patch fixes this: it will skip the
missing file, and return a non-zero exit code. So the build cleanly
fails.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
---
I actually discovered this during my allyesconfig night build, where I
use make -k.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/scripts/apply-patches.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index 2995ea9..e9c6869 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -80,7 +80,7 @@ function apply_patch {
     echo ""
     echo "Applying $patch using ${type}: "
 	echo $patch >> ${builddir}/.applied_patches_list
-    ${uncomp} "${path}/$patch" | patch -g0 -p1 -E -d "${builddir}"
+    ${uncomp} "${path}/$patch" | patch -g0 -p1 -E -d "${builddir}" -t
     if [ $? != 0 ] ; then
         echo "Patch failed!  Please fix ${patch}!"
 	exit 1
-- 
1.8.4.rc3
