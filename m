From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 21 Sep 2020 23:08:41 +0200
Subject: [Buildroot] [PATCH 1/2] support/scripts: prioritize conditions for
 pipeline creation
In-Reply-To: <cover.1600722514.git.yann.morin.1998@free.fr>
References: <cover.1600722514.git.yann.morin.1998@free.fr>
Message-ID: <080dfb07851ab4a84287dede9e03c99b217e73fc.1600722514.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When multiple conditions match simultaneously, even though that should
not happen in practice, we want the more "important" one to win over
the less "important" ones. For example, a tag is more important than a
branch name or a trigger.

Currently, the latest condition to match takes precendence over any
previous one, while we want the exact opposite.

Fix that with proper fallbacks in else-blocks.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/scripts/generate-gitlab-ci-yml | 58 +++++++++++++-------------
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
-- 
2.20.1
