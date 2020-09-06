From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  6 Sep 2020 22:12:29 +0200
Subject: [Buildroot] [PATCH 10/10] gitlab-ci: only check defconfigs for
 known branches
In-Reply-To: <cover.1599423132.git.yann.morin.1998@free.fr>
References: <cover.1599423132.git.yann.morin.1998@free.fr>
Message-ID: <c1ea91abce5dbf7068615b247ff77dd7f8ec8fbb.1599423132.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, the check of defconfigs is run for all branches, even those
that are pushed only to run runtime tests. This is very inconvenient.

In fact, we only want to check the defconfigs on standard branches, that
is master, next, and the maintenance branches.

This will also decrease drastically the number gitlab-ci minutes used
when one pushes their repo to gitlab.com, where the number of CI minutes
are now going to be pretty severely restricted.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 support/scripts/generate-gitlab-ci-yml | 29 ++++++++++++++------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
index f8b533f2c3..30222f1a04 100755
--- a/support/scripts/generate-gitlab-ci-yml
+++ b/support/scripts/generate-gitlab-ci-yml
@@ -42,37 +42,40 @@ gen_basics() {
 
 gen_defconfigs() {
     local -a defconfigs
-    local build_defconfigs cfg
+    local template cfg ext
 
     defconfigs=( $(cd configs; LC_ALL=C ls -1 *_defconfig) )
 
-    build_defconfigs=false
     if [ -n "${CI_COMMIT_TAG}" ]; then
         # For tags, create a pipeline.
-        build_defconfigs=true
+        template=base
     fi
     if [ -n "${CI_PIPELINE_TRIGGERED}" ]; then
         # For pipeline created by using a trigger token.
-        build_defconfigs=true
+        template=base
     fi
     case "${CI_COMMIT_REF_NAME}" in
+        # For master, next, and maintenance branches, only check the defconfigs
+        (master|next|????.??.x)
+            template=check
+            ext=_check
+        ;;
         # For the branch or tag name named *-defconfigs, create a pipeline.
         (*-defconfigs)
-            build_defconfigs=true
+            template=base
         ;;
         (*-*_defconfig)
             defconfigs=( "${CI_COMMIT_REF_NAME##*-}" )
-            build_defconfigs=true
+            template=base
         ;;
     esac
 
-    for cfg in "${defconfigs[@]}"; do
-        if ${build_defconfigs}; then
-            printf '%s: { extends: .defconfig_base }\n' "${cfg}"
-        else
-            printf '%s_check: { extends: .defconfig_check }\n' "${cfg}"
-        fi
-    done
+    if [ -n "${template}" ]; then
+        for cfg in "${defconfigs[@]}"; do
+            printf '%s%s: { extends: .defconfig_%s }\n' \
+                   "${cfg}" "${ext}" "${template}"
+        done
+    fi
 }
 
 gen_tests() {
-- 
2.20.1
