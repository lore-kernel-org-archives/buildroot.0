From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 20 Jan 2019 23:11:14 -0200
Subject: [Buildroot] [PATCH v3 4/5] .gitlab-ci.yml: prepare to reuse scripts
In-Reply-To: <20190121011115.19255-1-ricardo.martincoski@gmail.com>
References: <20190121011115.19255-1-ricardo.martincoski@gmail.com>
Message-ID: <20190121011115.19255-5-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use local variables to pass the name of the defconfig to build or
runtime test to run.
This change allows upcoming new jobs to reuse those scripts.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
Changes v2 -> v3:
  - new patch, trying to make the review/testing easier;

For test purposes I created a commit that makes all defconfigs and
runtime tests to echo the command that would be called instead of
actually calling it and then I asked Gitlab CI to run:
 - only the check-* jobs:
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/44072827
 - all defconfigs and all check-* jobs:
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/44072834
 - all runtime tests and all check-* jobs:
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/44072856
 - all jobs (using a tag):
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/44072869
---
 .gitlab-ci-template.yml | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/.gitlab-ci-template.yml b/.gitlab-ci-template.yml
index f1dfcbcecb..59f3af36eb 100644
--- a/.gitlab-ci-template.yml
+++ b/.gitlab-ci-template.yml
@@ -35,8 +35,8 @@ check-package:
 
 .defconfig_script:
     script:
-        - echo 'Configure Buildroot'
-        - make ${CI_JOB_NAME}
+        - echo "Configure Buildroot for ${DEFCONFIG_NAME}"
+        - make ${DEFCONFIG_NAME}
         - echo 'Build buildroot'
         - |
             make > >(tee build.log |grep '>>>') 2>&1 || {
@@ -53,6 +53,8 @@ check-package:
         - triggers
         - tags
         - /-defconfigs$/
+    before_script:
+        - DEFCONFIG_NAME=${CI_JOB_NAME}
     artifacts:
         when: always
         expire_in: 2 weeks
@@ -64,18 +66,25 @@ check-package:
             - output/build/packages-file-list.txt
             - output/build/*/.config
 
+.runtime_test_script:
+    # Keep build directories so the rootfs can be an artifact of the job. The
+    # runner will clean up those files for us.
+    # Multiply every emulator timeout by 10 to avoid sporadic failures in
+    # elastic runners.
+    script:
+        - echo "Starting runtime test ${TEST_CASE_NAME}"
+        - ./support/testing/run-tests -o test-output/ -d test-dl/ -k --timeout-multiplier 10 ${TEST_CASE_NAME}
+
 .runtime_test:
+    extends: .runtime_test_script
     # Running the runtime tests for every push is too much, so limit to
     # explicit triggers through the API.
     only:
         - triggers
         - tags
         - /-runtime-tests$/
-    # Keep build directories so the rootfs can be an artifact of the job. The
-    # runner will clean up those files for us.
-    # Multiply every emulator timeout by 10 to avoid sporadic failures in
-    # elastic runners.
-    script: ./support/testing/run-tests -o test-output/ -d test-dl/ -k --timeout-multiplier 10 ${CI_JOB_NAME}
+    before_script:
+        - TEST_CASE_NAME=${CI_JOB_NAME}
     artifacts:
         when: always
         expire_in: 2 weeks
-- 
2.17.1
