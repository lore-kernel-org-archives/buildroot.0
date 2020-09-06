From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  6 Sep 2020 22:12:22 +0200
Subject: [Buildroot] [PATCH 03/10] gitlab-ci: handle the defconfig build
 conditions in script
In-Reply-To: <cover.1599423132.git.yann.morin.1998@free.fr>
References: <cover.1599423132.git.yann.morin.1998@free.fr>
Message-ID: <1f090850bcbbad6d3d8482949f54cebc9a129346.1599423132.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Note that we do not propagate the existing comment, because it is
partially wrong; instead we just keep the per-condition comments.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 support/misc/gitlab-ci.yml.in          |  9 -------
 support/scripts/generate-gitlab-ci-yml | 34 ++++++++++++++++++++++----
 2 files changed, 29 insertions(+), 14 deletions(-)

diff --git a/support/misc/gitlab-ci.yml.in b/support/misc/gitlab-ci.yml.in
index f00c764aaf..7f2ae32725 100644
--- a/support/misc/gitlab-ci.yml.in
+++ b/support/misc/gitlab-ci.yml.in
@@ -67,15 +67,6 @@ check-package:
 
 .defconfig:
     extends: .defconfig_base
-    # Running the defconfigs for every push is too much, so limit to
-    # explicit triggers through the API.
-    rules:
-        # For tags, create a pipeline.
-        - if: '$CI_COMMIT_TAG'
-        # For pipeline created by using a trigger token.
-        - if: '$CI_PIPELINE_TRIGGERED'
-        # For the branch or tag name named *-defconfigs, create a pipeline.
-        - if: '$CI_COMMIT_REF_NAME =~ /^.*-defconfigs$/'
     before_script:
         - DEFCONFIG_NAME=${CI_JOB_NAME}
 
diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
index b076b01d05..ed56a516a7 100755
--- a/support/scripts/generate-gitlab-ci-yml
+++ b/support/scripts/generate-gitlab-ci-yml
@@ -7,11 +7,7 @@ main() {
 
     preamble "${template}"
 
-    (
-        cd configs
-        LC_ALL=C ls -1 *_defconfig
-    ) \
-    | sed -r -e 's/^(.+)$/\1: { extends: .defconfig }\n\1_check: { extends: .defconfig_check }/'
+    gen_defconfigs
 
     ./support/testing/run-tests -l 2>&1 \
     | sed -r -e '/^test_run \((.*)\).*/!d; s//\1: { extends: .runtime_test }/' \
@@ -30,4 +26,32 @@ preamble() {
 _EOF_
 }
 
+gen_defconfigs() {
+    local -a defconfigs
+    local build_defconfigs cfg
+
+    defconfigs=( $(cd configs; LC_ALL=C ls -1 *_defconfig) )
+
+    build_defconfigs=false
+    if [ -n "${CI_COMMIT_TAG}" ]; then
+        # For tags, create a pipeline.
+        build_defconfigs=true
+    fi
+    if [ -n "${CI_PIPELINE_TRIGGERED}" ]; then
+        # For pipeline created by using a trigger token.
+        build_defconfigs=true
+    fi
+    case "${CI_COMMIT_REF_NAME}" in
+        # For the branch or tag name named *-defconfigs, create a pipeline.
+        (*-defconfigs) build_defconfigs=true;;
+    esac
+
+    for cfg in "${defconfigs[@]}"; do
+        printf '%s_check: { extends: .defconfig_check }\n' "${cfg}"
+        if ${build_defconfigs}; then
+            printf '%s: { extends: .defconfig }\n' "${cfg}"
+        fi
+    done
+}
+
 main "${@}"
-- 
2.20.1
