From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  6 Sep 2020 22:12:20 +0200
Subject: [Buildroot] [PATCH 01/10] gitlab-ci: introduce main() in generating
 script
In-Reply-To: <cover.1599423132.git.yann.morin.1998@free.fr>
References: <cover.1599423132.git.yann.morin.1998@free.fr>
Message-ID: <3d0d3e130163e34e050edcc9899e2f32fe21a4d2.1599423132.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This script is currently very crude, but we're going to extend it, at
which point it will be nicer to have functions, local variables, et al.

Introduce a main() in preparation of those future evolutions.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
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
-- 
2.20.1
