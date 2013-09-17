From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 17 Sep 2013 15:45:53 -0300
Subject: [Buildroot] [PATCH] apply-patches.sh: avoid reversed/already
	applied patches
Message-ID: <1379443553-12452-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable reversed/already applied patches fallout from commit
5871b791995ebe295db7dca608afe3f293ce8953
Reverse patches are bad, they may unfix things with version bumps and
just sneak under the radar with pure batch mode.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 support/scripts/apply-patches.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index 1ebaea9..ff72b45 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -84,7 +84,7 @@ function apply_patch {
 	exit 1
     fi
     echo $patch >> ${builddir}/.applied_patches_list
-    ${uncomp} "${path}/$patch" | patch -g0 -p1 -E -d "${builddir}" -t
+    ${uncomp} "${path}/$patch" | patch -g0 -p1 -E -d "${builddir}" -t -N
     if [ $? != 0 ] ; then
         echo "Patch failed!  Please fix ${patch}!"
 	exit 1
-- 
1.8.1.5
