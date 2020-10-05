From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  5 Oct 2020 22:48:25 +0200
Subject: [Buildroot] [PATCH] support/scripts: rework generation of pipelines
Message-ID: <20201005204825.196413-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, we handle three kinds of tests: basic, defconfig, and
runtime, and we treat them totally independently ones from the others.

Except for the basic tests that are ignored when defconfig or runtime
tests are explicitly requested.

The basic tests are also run systematically on all our reference
branches: master, next (when it exists), and the maintenance branches:
YYYY.MM.x.

Furthermore, we can see that the conditions to run each set of tests
are very similar, with only the explicit queries differing by name.

Rework the script so that the conditions are expressed only once, and
each set of tests is decided for each condition. This makes it easier
to decide what tests should run under what conditions.

Using GitLab-CI's schedules, with a variable expressing the actual test
to run, would seem the obvious choice to trigger the pipelines. However,
a schedule is configured for a specific branch, which means we would
need one schedule per branch we want to build per test cases we want to
run, *and* that we update those schedules when we add/remove branches
(e.g. when we open/close 'next', or a maintenance branch). This is not
very nice, as it requires some manual tweaking and twiddling on the web
I.

Instead, we resort to using triggers, that we be triggered from a
cronjob on some server. Using a cronjiob allows us to more easily manage
the branches we want to test and test cases we want to run, to more
easily spread the load over the week, etc...

Note: triggering a pipeline can be done with a simple curl invocation:

    $ curl -X POST \
        -F "token=${YOUR_TOKEN}" \
        -F "ref=${BRANCH_TO_TEST}" \
        -F "variables[BR_SCHEDULE_JOBS]=${TEST_TO_RUN}" \
        "https://gitlab.com/api/v4/projects/${YOU_PROJEXT_ID}/trigger/pipeline"

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/generate-gitlab-ci-yml | 135 ++++++++++++-------------
 1 file changed, 63 insertions(+), 72 deletions(-)

diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
index faa52e85b2..b4217c2455 100755
--- a/support/scripts/generate-gitlab-ci-yml
+++ b/support/scripts/generate-gitlab-ci-yml
@@ -6,9 +6,6 @@ main() {
     local template="${1}"
 
     preamble "${template}"
-
-    gen_basics
-    gen_defconfigs
     gen_tests
 }
 
@@ -24,91 +21,85 @@ preamble() {
 _EOF_
 }
 
-gen_basics() {
-    local tst
+gen_tests() {
+    local -a basics defconfigs runtimes
+    local do_basics do_defconfigs do_runtime
+    local defconfigs_ext cfg tst
 
-    # Skip basic tests when explicitly building defconfigs or runtime tests
-    case "${CI_COMMIT_REF_NAME}" in
-        (*-defconfigs)      return;;
-        (*-*_defconfig)     return;;
-        (*-runtime-tests)   return;;
-        (*-tests.*)         return;;
-    esac
-
-    for tst in DEVELOPERS flake8 package; do
-        printf 'check-%s: { extends: .check-%s_base }\n' "${tst}" "${tst}"
-    done
-}
-
-gen_defconfigs() {
-    local -a defconfigs
-    local template cfg ext
+    basics=( DEVELOPERS flake8 package )
 
     defconfigs=( $(cd configs; LC_ALL=C ls -1 *_defconfig) )
 
+    runtimes=( $(./support/testing/run-tests -l 2>&1 \
+                 | sed -r -e '/^test_run \((.*)\).*/!d; s//\1/' \
+                 | LC_ALL=C sort)
+             )
+
     if [ -n "${CI_COMMIT_TAG}" ]; then
-        # For tags, create a pipeline.
-        template=base
-    elif [ -n "${CI_PIPELINE_TRIGGERED}" ]; then
-        # For pipeline created by using a trigger token.
-        template=base
+        do_basics=true
+        do_defconfigs=base
+        do_runtime=true
+    elif [ "${CI_PIPELINE_SOURCE}" = "trigger" ]; then
+        case "${BR_SCHEDULE_JOBS}" in
+          (basic)
+            do_basics=true
+            do_defconfigs=check
+            defconfigs_ext=_check
+            ;;
+          (defconfig)
+            do_defconfigs=base
+            ;;
+          (runtime)
+            do_runtime=true
+            ;;
+        esac
     else
         case "${CI_COMMIT_REF_NAME}" in
-            # For master, next, and maintenance branches, only check the defconfigs
-            (master|next|????.??.x)
-                template=check
-                ext=_check
-            ;;
-            # For the branch or tag name named *-defconfigs, create a pipeline.
-            (*-defconfigs)
-                template=base
-            ;;
-            (*-*_defconfig)
-                defconfigs=( "${CI_COMMIT_REF_NAME##*-}" )
-                template=base
+          (*-basics)
+            do_basics=true
+            do_defconfigs=check
+            defconfigs_ext=_check
+            ;;
+          (*-defconfigs)
+            do_defconfigs=base
+            ;;
+          (*-*_defconfig)
+            defconfigs=( "${CI_COMMIT_REF_NAME##*-}" )
+            do_defconfigs=base
+            ;;
+          (*-runtime-tests)
+            do_runtime=true
+            ;;
+          (*-tests.*)
+            tests=( "${CI_COMMIT_REF_NAME##*-}" )
+            do_runtime=true
             ;;
         esac
     fi
 
-    if [ -n "${template}" ]; then
+    # If nothing else, at least do the basics to generate a valid pipeline
+    if [    -z "${do_defconfigs}" \
+         -a -z "${do_runtime}" \
+       ]
+    then
+        do_basics=true
+    fi
+
+    if ${do_basics:-false}; then
+        for tst in "${basics[@]}"; do
+            printf 'check-%s: { extends: .check-%s_base }\n' "${tst}" "${tst}"
+        done
+    fi
+
+    if [ -n "${do_defconfigs}" ]; then
         for cfg in "${defconfigs[@]}"; do
             printf '%s%s: { extends: .defconfig_%s }\n' \
-                   "${cfg}" "${ext}" "${template}"
+                   "${cfg}" "${defconfigs_ext}" "${do_defconfigs}"
         done
     fi
-}
 
-gen_tests() {
-    local -a tests
-    local run_tests tst
-
-    tests=( $(./support/testing/run-tests -l 2>&1 \
-              | sed -r -e '/^test_run \((.*)\).*/!d; s//\1/'\
-              | LC_ALL=C sort)
-          )
-
-    run_tests=false
-    if [ -n "${CI_COMMIT_TAG}" ]; then
-        # For tags, create a pipeline.
-        run_tests=true
-    elif [ -n "${CI_PIPELINE_TRIGGERED}" ]; then
-        # For pipeline created by using a trigger token.
-        run_tests=true
-    else
-        case "${CI_COMMIT_REF_NAME}" in
-            # For the branch or tag name named *-runtime-tests, create a pipeline.
-            (*-runtime-tests)
-                run_tests=true
-            ;;
-            (*-tests.*)
-                tests=( "${CI_COMMIT_REF_NAME##*-}" )
-                run_tests=true
-            ;;
-        esac
-    fi
-
-    if ${run_tests}; then
-        printf '%s: { extends: .runtime_test_base }\n' "${tests[@]}"
+    if ${do_runtime:-false}; then
+        printf '%s: { extends: .runtime_test_base }\n' "${runtimes[@]}"
     fi
 }
 
-- 
2.25.1
