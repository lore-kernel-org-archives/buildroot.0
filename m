From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 22 Sep 2020 21:29:39 +0200
Subject: [Buildroot] [git commit] support/scripts: prioritize conditions for
 pipeline creation
Message-ID: <20200922192107.002CA8D697@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=245a64c3873a5061f6c75a2bc00b2b234701548f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When multiple conditions match simultaneously, even though that should
not happen in practice, we want the more "important" one to win over
the less "important" ones. For example, a tag is more important than a
branch name or a trigger.

Currently, the latest condition to match takes precendence over any
previous one, while we want the exact opposite.

Fix that with proper fallbacks in else-blocks.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/generate-gitlab-ci-yml | 58 +++++++++++++++++-----------------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
index e42943953c..faa52e85b2 100755
--- a/support/scripts/generate-gitlab-ci-yml
+++ b/support/scripts/generate-gitlab-ci-yml
@@ -49,26 +49,26 @@ gen_defconfigs() {
     if [ -n "${CI_COMMIT_TAG}" ]; then
         # For tags, create a pipeline.
         template=base
-    fi
-    if [ -n "${CI_PIPELINE_TRIGGERED}" ]; then
+    elif [ -n "${CI_PIPELINE_TRIGGERED}" ]; then
         # For pipeline created by using a trigger token.
         template=base
+    else
+        case "${CI_COMMIT_REF_NAME}" in
+            # For master, next, and maintenance branches, only check the defconfigs
+            (master|next|????.??.x)
+                template=check
+                ext=_check
+            ;;
+            # For the branch or tag name named *-defconfigs, create a pipeline.
+            (*-defconfigs)
+                template=base
+            ;;
+            (*-*_defconfig)
+                defconfigs=( "${CI_COMMIT_REF_NAME##*-}" )
+                template=base
+            ;;
+        esac
     fi
-    case "${CI_COMMIT_REF_NAME}" in
-        # For master, next, and maintenance branches, only check the defconfigs
-        (master|next|????.??.x)
-            template=check
-            ext=_check
-        ;;
-        # For the branch or tag name named *-defconfigs, create a pipeline.
-        (*-defconfigs)
-            template=base
-        ;;
-        (*-*_defconfig)
-            defconfigs=( "${CI_COMMIT_REF_NAME##*-}" )
-            template=base
-        ;;
-    esac
 
     if [ -n "${template}" ]; then
         for cfg in "${defconfigs[@]}"; do
@@ -91,21 +91,21 @@ gen_tests() {
     if [ -n "${CI_COMMIT_TAG}" ]; then
         # For tags, create a pipeline.
         run_tests=true
-    fi
-    if [ -n "${CI_PIPELINE_TRIGGERED}" ]; then
+    elif [ -n "${CI_PIPELINE_TRIGGERED}" ]; then
         # For pipeline created by using a trigger token.
         run_tests=true
+    else
+        case "${CI_COMMIT_REF_NAME}" in
+            # For the branch or tag name named *-runtime-tests, create a pipeline.
+            (*-runtime-tests)
+                run_tests=true
+            ;;
+            (*-tests.*)
+                tests=( "${CI_COMMIT_REF_NAME##*-}" )
+                run_tests=true
+            ;;
+        esac
     fi
-    case "${CI_COMMIT_REF_NAME}" in
-        # For the branch or tag name named *-runtime-tests, create a pipeline.
-        (*-runtime-tests)
-            run_tests=true
-        ;;
-        (*-tests.*)
-            tests=( "${CI_COMMIT_REF_NAME##*-}" )
-            run_tests=true
-        ;;
-    esac
 
     if ${run_tests}; then
         printf '%s: { extends: .runtime_test_base }\n' "${tests[@]}"
