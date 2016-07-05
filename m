From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 17:36:57 +0200
Subject: [Buildroot] [git commit] apply-patches: catch unexpected failure
Message-ID: <20160705153702.3200882229@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9cf1ad6cdb37c5be5772121896f4b13ec42c2b0d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As reported by S??bastien Szymanski [1], the apply-patches script
doesn't stop if a tar command can't extract an archive.

Use "set -e" to exit immediately if a command return an error.

[1] http://patchwork.ozlabs.org/patch/626196

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: S??bastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
