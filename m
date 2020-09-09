From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 9 Sep 2020 09:26:00 +0200
Subject: [Buildroot] [git commit] gitlab-ci: only check defconfigs for known
 branches
Message-ID: <20200909073014.58E7280E3F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8fb49636d62d80ea80b7754620e10e6528ea93a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/scripts/generate-gitlab-ci-yml | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
index 263d0c6d43..e42943953c 100755
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
