From: James Knight <james.knight@rockwellcollins.com>
Date: Thu, 29 Sep 2016 10:57:00 -0400
Subject: [Buildroot] [RCF 1/2] support: enforce '--binary' when applying
	patches
Message-ID: <20160929145701.27116-1-james.knight@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following commit enforces the patch operation to "disable the
heuristic for transforming CRLF line endings into LF line endings" [1].
This is to help packages, which source files have been generated on non-
POSIX systems, to apply compatible non-POSIX generated patches. The
addition of this option should have no effect on existing patches [2].

[1]: http://git.savannah.gnu.org/cgit/patch.git/tree/patch.man#n306
[2]: https://www.gnu.org/software/diffutils/manual/html_node/Binary.html

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
---
 support/scripts/apply-patches.sh | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index 7ccb39d..a71a51a 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -114,7 +114,8 @@ function apply_patch {
         exit 1
     fi
     echo "${path}/${patch}" >> ${builddir}/.applied_patches_list
-    ${uncomp} "${path}/$patch" | patch -g0 -p1 -E -d "${builddir}" -t -N $silent
+    ${uncomp} "${path}/$patch" | \
+            patch --binary -g0 -p1 -E -d "${builddir}" -t -N $silent
     if [ $? != 0 ] ; then
         echo "Patch failed!  Please fix ${patch}!"
         exit 1
-- 
2.8.4.windows.1
