From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 9 Sep 2020 09:25:52 +0200
Subject: [Buildroot] [git commit] gitlab-ci: handle the basic tests in script
Message-ID: <20200909073014.3888B80E3F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6bc09ae38fa428cbf4e14d4211e677323660a0c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Note that those tests were so far ignored only when requesting a single
defconfig build, or a single runtime test build; everything else
was trigerring thoses tests.

However, it feels more natural that they are also ignored when all
defconfigs build. or all runtime tests, are explictly requested.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/misc/gitlab-ci.yml.in          | 15 +++------------
 support/scripts/generate-gitlab-ci-yml | 21 +++++++++++++++++++--
 2 files changed, 22 insertions(+), 14 deletions(-)

diff --git a/support/misc/gitlab-ci.yml.in b/support/misc/gitlab-ci.yml.in
index 0f93d272be..c4a37464f6 100644
--- a/support/misc/gitlab-ci.yml.in
+++ b/support/misc/gitlab-ci.yml.in
@@ -1,24 +1,15 @@
-.check_base:
-    rules:
-        - if: '$CI_COMMIT_REF_NAME =~ /^.*-.*_defconfig$/ || $CI_COMMIT_REF_NAME =~ /^.*-tests\..*$/'
-          when: never
-        - when: always
-
-check-DEVELOPERS:
-    extends: .check_base
+.check-DEVELOPERS_base:
     # get-developers should print just "No action specified"; if it prints
     # anything else, it's a parse error.
     # The initial ! is removed by YAML so we need to quote it.
     script:
         - "! utils/get-developers | grep -v 'No action specified'"
 
-check-flake8:
-    extends: .check_base
+.check-flake8_base:
     script:
         - make check-flake8
 
-check-package:
-    extends: .check_base
+.check-package_base:
     script:
         - make check-package
 
diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
index 25fecf3715..263d0c6d43 100755
--- a/support/scripts/generate-gitlab-ci-yml
+++ b/support/scripts/generate-gitlab-ci-yml
@@ -7,6 +7,7 @@ main() {
 
     preamble "${template}"
 
+    gen_basics
     gen_defconfigs
     gen_tests
 }
@@ -23,6 +24,22 @@ preamble() {
 _EOF_
 }
 
+gen_basics() {
+    local tst
+
+    # Skip basic tests when explicitly building defconfigs or runtime tests
+    case "${CI_COMMIT_REF_NAME}" in
+        (*-defconfigs)      return;;
+        (*-*_defconfig)     return;;
+        (*-runtime-tests)   return;;
+        (*-tests.*)         return;;
+    esac
+
+    for tst in DEVELOPERS flake8 package; do
+        printf 'check-%s: { extends: .check-%s_base }\n' "${tst}" "${tst}"
+    done
+}
+
 gen_defconfigs() {
     local -a defconfigs
     local build_defconfigs cfg
@@ -51,7 +68,7 @@ gen_defconfigs() {
 
     for cfg in "${defconfigs[@]}"; do
         if ${build_defconfigs}; then
-            printf '%s: { extends: .defconfig }\n' "${cfg}"
+            printf '%s: { extends: .defconfig_base }\n' "${cfg}"
         else
             printf '%s_check: { extends: .defconfig_check }\n' "${cfg}"
         fi
@@ -88,7 +105,7 @@ gen_tests() {
     esac
 
     if ${run_tests}; then
-        printf '%s: { extends: .runtime_test }\n' "${tests[@]}"
+        printf '%s: { extends: .runtime_test_base }\n' "${tests[@]}"
     fi
 }
 
