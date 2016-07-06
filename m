From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Jul 2016 14:47:30 +0200
Subject: [Buildroot] [git commit] support/apply-patches: re-instate set -e
Message-ID: <20160706124747.410BA82259@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d5ae67b4f4b4256a392997f81c9668c6809aab3b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As reported by S??bastien Szymanski [1], the apply-patches script
doesn't stop if a tar command can't extract an archive.

Use "set -e" to exit immediately if a command return an error.

Be sure to ignore any expected error: when we check if a patch to be
applied has the same basename as an already applied patch, the grep
would fail when no such patch was already applied. We should not fail
in this case.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: S??bastien Szymanski <sebastien.szymanski@armadeus.com>
Cc: Romain Naour <romain.naour@openwide.fr>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Tested-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/apply-patches.sh | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index 694302d..7ccb39d 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -31,6 +31,8 @@
 # applied. The list of the patches applied is stored in '.applied_patches_list'
 # file in the build directory.
 
+set -e
+
 silent=
 if [ "$1" = "-s" ] ; then
     # add option to be used by the patch tool
@@ -103,7 +105,7 @@ function apply_patch {
         echo "Error: missing patch file ${path}/$patch"
         exit 1
     fi
-    existing="$(grep -E "/${patch}\$" ${builddir}/.applied_patches_list)"
+    existing="$(grep -E "/${patch}\$" ${builddir}/.applied_patches_list || true)"
     if [ -n "${existing}" ]; then
         echo "Error: duplicate filename '${patch}'"
         echo "Conflicting files are:"
