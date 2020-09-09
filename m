From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 9 Sep 2020 09:24:16 +0200
Subject: [Buildroot] [git commit] gitlab-ci: introduce main() in generating
 script
Message-ID: <20200909073013.D643288F3F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f70a0e9d9117b52cda825bfe735681fd91217692
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This script is currently very crude, but we're going to extend it, at
which point it will be nicer to have functions, local variables, et al.

Introduce a main() in preparation of those future evolutions.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/scripts/generate-gitlab-ci-yml | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
index 5cef1146e2..51f7de21dd 100755
--- a/support/scripts/generate-gitlab-ci-yml
+++ b/support/scripts/generate-gitlab-ci-yml
@@ -2,16 +2,20 @@
 set -e
 set -o pipefail
 
-input="${1}"
+main() {
+    local template="${1}"
 
-cat "${input}"
+    cat "${template}"
 
-(
-    cd configs
-    LC_ALL=C ls -1 *_defconfig
-) \
+    (
+        cd configs
+        LC_ALL=C ls -1 *_defconfig
+    ) \
     | sed -r -e 's/^(.+)$/\1: { extends: .defconfig }\n\1_check: { extends: .defconfig_check }/'
 
-./support/testing/run-tests -l 2>&1 \
+    ./support/testing/run-tests -l 2>&1 \
     | sed -r -e '/^test_run \((.*)\).*/!d; s//\1: { extends: .runtime_test }/' \
     | LC_ALL=C sort
+}
+
+main "${@}"
