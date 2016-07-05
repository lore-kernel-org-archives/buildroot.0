From: Romain Naour <romain.naour@gmail.com>
Date: Tue,  5 Jul 2016 13:02:09 +0200
Subject: [Buildroot] [PATCH] apply-patches: catch unexpected failure
Message-ID: <1467716529-30183-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As reported by S?bastien Szymanski [1], the apply-patches script
doesn't stop if a tar command can't extract an archive.

Use "set -e" to exit immediately if a command return an error.

[1] http://patchwork.ozlabs.org/patch/626196

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
---
 support/scripts/apply-patches.sh | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index 694302d..11fa5bf 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -31,6 +31,9 @@
 # applied. The list of the patches applied is stored in '.applied_patches_list'
 # file in the build directory.
 
+# We want to catch any unexpected failure, and exit immediately.
+set -e
+
 silent=
 if [ "$1" = "-s" ] ; then
     # add option to be used by the patch tool
-- 
2.5.5
