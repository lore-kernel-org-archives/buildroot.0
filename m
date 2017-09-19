From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 19 Sep 2017 22:51:25 +0200
Subject: [Buildroot] [git commit] support/scripts/apply-patches.sh: do not
	apply patches with renames
Message-ID: <20170919204918.A0D2C80FB2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=85f11d08c387c200dbb59a8559f2ba62376689bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patches with renames apply properly with patch >= 2.7, but not with
older patch versions. Since "git format-patch" by default generates
patches with renames, Buildroot developers often don't realize that
their patches will not apply properly on build machines that have
patch < 2.7. In order to prevent such a situation from happening
again, this commit adds some logic in apply-patches.sh to refuse
applying patches that contain renames.

Note that just searching for '^rename' is not sufficient, since the
patch commit message may contain the words "rename from" or "rename to"
as well. Therefore, the grep expression is made as accurate as possible,
checking both.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[Arnout: spaces instead of tabs (suggested by Yann);
 extend commit message.]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/scripts/apply-patches.sh | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index 7ccb39d..66fef26 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -113,6 +113,11 @@ function apply_patch {
         echo "  to be applied  : ${path}/${patch}"
         exit 1
     fi
+    if grep -q "^rename from" ${path}/${patch} && \
+       grep -q "^rename to" ${path}/${patch} ; then
+        echo "Error: patch contains some renames, not supported by old patch versions"
+        exit 1
+    fi
     echo "${path}/${patch}" >> ${builddir}/.applied_patches_list
     ${uncomp} "${path}/$patch" | patch -g0 -p1 -E -d "${builddir}" -t -N $silent
     if [ $? != 0 ] ; then
