From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 9 Sep 2020 09:25:51 +0200
Subject: [Buildroot] [git commit] gitlab-ci: handle single runtime test in
 script
Message-ID: <20200909073014.2D91688F3F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0b7873bc827759709ec2aea53ab8c355d8b4e1ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/misc/gitlab-ci.yml.in          | 9 ---------
 support/scripts/generate-gitlab-ci-yml | 8 +++++++-
 2 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/support/misc/gitlab-ci.yml.in b/support/misc/gitlab-ci.yml.in
index 8a94b872f3..0f93d272be 100644
--- a/support/misc/gitlab-ci.yml.in
+++ b/support/misc/gitlab-ci.yml.in
@@ -82,15 +82,6 @@ check-package:
             - test-output/*.log
             - test-output/*/.config
             - test-output/*/images/*
-
-.runtime_test:
-    extends: .runtime_test_base
     before_script:
         - TEST_CASE_NAME=${CI_JOB_NAME}
 
-one-runtime_test:
-    extends: .runtime_test_base
-    rules:
-        - if: '$CI_COMMIT_REF_NAME =~ /^.*-tests\..*$/'
-    before_script:
-        - TEST_CASE_NAME=$(echo ${CI_COMMIT_REF_NAME} | sed -e 's,^.*-,,g')
diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
index 39e0fc7283..25fecf3715 100755
--- a/support/scripts/generate-gitlab-ci-yml
+++ b/support/scripts/generate-gitlab-ci-yml
@@ -78,7 +78,13 @@ gen_tests() {
     fi
     case "${CI_COMMIT_REF_NAME}" in
         # For the branch or tag name named *-runtime-tests, create a pipeline.
-        (*-runtime-tests) run_tests=true;;
+        (*-runtime-tests)
+            run_tests=true
+        ;;
+        (*-tests.*)
+            tests=( "${CI_COMMIT_REF_NAME##*-}" )
+            run_tests=true
+        ;;
     esac
 
     if ${run_tests}; then
