From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 1 May 2019 15:42:45 +0200
Subject: [Buildroot] [git commit] .gitlab-ci.yml: add trigger per job
Message-ID: <20190501134617.756C583D7E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=12904c03a7ccbf0c04c5b1f7e3302916c6f37f50
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Triggering a single defconfig or runtime test job can be handy:
 - when adding or changing a defconfig;
 - when adding or changing a runtime test case;
 - when fixing some bug on a use case tested by a runtime test case.

Currently there are 3 subsets of jobs that can easily be triggered by
pushing a temporary branch with specific suffix:
 - to trigger only the check-* jobs:
   $ git push gitlab HEAD:<name>                   # currently   4 jobs
 - to trigger all defconfigs and all check-* jobs:
   $ git push gitlab HEAD:<name>-defconfigs        # currently 197 jobs
 - to trigger all runtime tests and all check-* jobs:
   $ git push gitlab HEAD:<name>-runtime-tests     # currently 118 jobs

When the user wants to trigger a single defconfig or runtime test job,
hand-editing the .gitlab-ci.yml and creating a temporary commit are
currently needed.

Add 2 more subsets that can be triggered based on the name of the
branch pushed.
 - to trigger one defconfig job:
   $ git push gitlab HEAD:<name>-<defconfig name>  # currently   1 jobs
 - to trigger one runtime job:
   $ git push gitlab HEAD:<name>-<test case name>  # currently   1 jobs

The check-* jobs are fast, so there is no need to add a per job trigger
for them. Also, they are anyway triggered with every push already.

While adding those new triggers, use the full name of the job as suffix.
This leads to large branch names:
$ git push gitlab HEAD:test1-tests.toolchain.test_external.TestExternalToolchainBuildrootuClibc
$ git push gitlab HEAD:test2-olimex_a20_olinuxino_lime_legacy_defconfig
But those branches are temporary, and this way the user doesn't need to
think much, just copy and paste the job name as suffix.

The hidden keys that now hold the commonalities between jobs does not
hold only a script anymore, so rename then from *_script to *_base.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[Arnout: squash two patches]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .gitlab-ci.yml    | 64 +++++++++++++++++++++++++++++++++++++++++--------------
 .gitlab-ci.yml.in | 64 +++++++++++++++++++++++++++++++++++++++++--------------
 2 files changed, 96 insertions(+), 32 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index e9869be784..558676709f 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -6,7 +6,13 @@
 
 image: buildroot/base:20180318.1724
 
+.check_base:
+    except:
+        - /^.*-.*_defconfig$/
+        - /^.*-tests\..*$/
+
 check-DEVELOPERS:
+    extends: .check_base
     # get-developers should print just "No action specified"; if it prints
     # anything else, it's a parse error.
     # The initial ! is removed by YAML so we need to quote it.
@@ -14,6 +20,7 @@ check-DEVELOPERS:
         - "! utils/get-developers | grep -v 'No action specified'"
 
 check-flake8:
+    extends: .check_base
     before_script:
         # Help flake8 to find the Python files without .py extension.
         - find * -type f -name '*.py' > files.txt
@@ -25,19 +32,21 @@ check-flake8:
         - wc -l files.processed
 
 check-gitlab-ci.yml:
+    extends: .check_base
     script:
         - mv .gitlab-ci.yml .gitlab-ci.yml.orig
         - make .gitlab-ci.yml
         - diff -u .gitlab-ci.yml.orig .gitlab-ci.yml
 
 check-package:
+    extends: .check_base
     script:
         - make check-package
 
-.defconfig_script:
+.defconfig_base:
     script:
-        - echo 'Configure Buildroot'
-        - make ${CI_JOB_NAME}
+        - echo "Configure Buildroot for ${DEFCONFIG_NAME}"
+        - make ${DEFCONFIG_NAME}
         - echo 'Build buildroot'
         - |
             make > >(tee build.log |grep '>>>') 2>&1 || {
@@ -45,15 +54,6 @@ check-package:
                 tail -200 build.log
                 exit 1
             }
-
-.defconfig:
-    extends: .defconfig_script
-    # Running the defconfigs for every push is too much, so limit to
-    # explicit triggers through the API.
-    only:
-        - triggers
-        - tags
-        - /-defconfigs$/
     artifacts:
         when: always
         expire_in: 2 weeks
@@ -65,18 +65,32 @@ check-package:
             - output/build/packages-file-list.txt
             - output/build/*/.config
 
-.runtime_test:
-    # Running the runtime tests for every push is too much, so limit to
+.defconfig:
+    extends: .defconfig_base
+    # Running the defconfigs for every push is too much, so limit to
     # explicit triggers through the API.
     only:
         - triggers
         - tags
-        - /-runtime-tests$/
+        - /-defconfigs$/
+    before_script:
+        - DEFCONFIG_NAME=${CI_JOB_NAME}
+
+one-defconfig:
+    extends: .defconfig_base
+    only:
+        - /^.*-.*_defconfig$/
+    before_script:
+        - DEFCONFIG_NAME=$(echo ${CI_COMMIT_REF_NAME} | sed -e 's,^.*-,,g')
+
+.runtime_test_base:
     # Keep build directories so the rootfs can be an artifact of the job. The
     # runner will clean up those files for us.
     # Multiply every emulator timeout by 10 to avoid sporadic failures in
     # elastic runners.
-    script: ./support/testing/run-tests -o test-output/ -d test-dl/ -k --timeout-multiplier 10 ${CI_JOB_NAME}
+    script:
+        - echo "Starting runtime test ${TEST_CASE_NAME}"
+        - ./support/testing/run-tests -o test-output/ -d test-dl/ -k --timeout-multiplier 10 ${TEST_CASE_NAME}
     artifacts:
         when: always
         expire_in: 2 weeks
@@ -84,6 +98,24 @@ check-package:
             - test-output/*.log
             - test-output/*/.config
             - test-output/*/images/*
+
+.runtime_test:
+    extends: .runtime_test_base
+    # Running the runtime tests for every push is too much, so limit to
+    # explicit triggers through the API.
+    only:
+        - triggers
+        - tags
+        - /-runtime-tests$/
+    before_script:
+        - TEST_CASE_NAME=${CI_JOB_NAME}
+
+one-runtime_test:
+    extends: .runtime_test_base
+    only:
+        - /^.*-tests\..*$/
+    before_script:
+        - TEST_CASE_NAME=$(echo ${CI_COMMIT_REF_NAME} | sed -e 's,^.*-,,g')
 aarch64_efi_defconfig: { extends: .defconfig }
 acmesystems_aria_g25_128mb_defconfig: { extends: .defconfig }
 acmesystems_aria_g25_256mb_defconfig: { extends: .defconfig }
diff --git a/.gitlab-ci.yml.in b/.gitlab-ci.yml.in
index ad616437f3..33cb665d98 100644
--- a/.gitlab-ci.yml.in
+++ b/.gitlab-ci.yml.in
@@ -6,7 +6,13 @@
 
 image: buildroot/base:20180318.1724
 
+.check_base:
+    except:
+        - /^.*-.*_defconfig$/
+        - /^.*-tests\..*$/
+
 check-DEVELOPERS:
+    extends: .check_base
     # get-developers should print just "No action specified"; if it prints
     # anything else, it's a parse error.
     # The initial ! is removed by YAML so we need to quote it.
@@ -14,6 +20,7 @@ check-DEVELOPERS:
         - "! utils/get-developers | grep -v 'No action specified'"
 
 check-flake8:
+    extends: .check_base
     before_script:
         # Help flake8 to find the Python files without .py extension.
         - find * -type f -name '*.py' > files.txt
@@ -25,19 +32,21 @@ check-flake8:
         - wc -l files.processed
 
 check-gitlab-ci.yml:
+    extends: .check_base
     script:
         - mv .gitlab-ci.yml .gitlab-ci.yml.orig
         - make .gitlab-ci.yml
         - diff -u .gitlab-ci.yml.orig .gitlab-ci.yml
 
 check-package:
+    extends: .check_base
     script:
         - make check-package
 
-.defconfig_script:
+.defconfig_base:
     script:
-        - echo 'Configure Buildroot'
-        - make ${CI_JOB_NAME}
+        - echo "Configure Buildroot for ${DEFCONFIG_NAME}"
+        - make ${DEFCONFIG_NAME}
         - echo 'Build buildroot'
         - |
             make > >(tee build.log |grep '>>>') 2>&1 || {
@@ -45,15 +54,6 @@ check-package:
                 tail -200 build.log
                 exit 1
             }
-
-.defconfig:
-    extends: .defconfig_script
-    # Running the defconfigs for every push is too much, so limit to
-    # explicit triggers through the API.
-    only:
-        - triggers
-        - tags
-        - /-defconfigs$/
     artifacts:
         when: always
         expire_in: 2 weeks
@@ -65,18 +65,32 @@ check-package:
             - output/build/packages-file-list.txt
             - output/build/*/.config
 
-.runtime_test:
-    # Running the runtime tests for every push is too much, so limit to
+.defconfig:
+    extends: .defconfig_base
+    # Running the defconfigs for every push is too much, so limit to
     # explicit triggers through the API.
     only:
         - triggers
         - tags
-        - /-runtime-tests$/
+        - /-defconfigs$/
+    before_script:
+        - DEFCONFIG_NAME=${CI_JOB_NAME}
+
+one-defconfig:
+    extends: .defconfig_base
+    only:
+        - /^.*-.*_defconfig$/
+    before_script:
+        - DEFCONFIG_NAME=$(echo ${CI_COMMIT_REF_NAME} | sed -e 's,^.*-,,g')
+
+.runtime_test_base:
     # Keep build directories so the rootfs can be an artifact of the job. The
     # runner will clean up those files for us.
     # Multiply every emulator timeout by 10 to avoid sporadic failures in
     # elastic runners.
-    script: ./support/testing/run-tests -o test-output/ -d test-dl/ -k --timeout-multiplier 10 ${CI_JOB_NAME}
+    script:
+        - echo "Starting runtime test ${TEST_CASE_NAME}"
+        - ./support/testing/run-tests -o test-output/ -d test-dl/ -k --timeout-multiplier 10 ${TEST_CASE_NAME}
     artifacts:
         when: always
         expire_in: 2 weeks
@@ -84,3 +98,21 @@ check-package:
             - test-output/*.log
             - test-output/*/.config
             - test-output/*/images/*
+
+.runtime_test:
+    extends: .runtime_test_base
+    # Running the runtime tests for every push is too much, so limit to
+    # explicit triggers through the API.
+    only:
+        - triggers
+        - tags
+        - /-runtime-tests$/
+    before_script:
+        - TEST_CASE_NAME=${CI_JOB_NAME}
+
+one-runtime_test:
+    extends: .runtime_test_base
+    only:
+        - /^.*-tests\..*$/
+    before_script:
+        - TEST_CASE_NAME=$(echo ${CI_COMMIT_REF_NAME} | sed -e 's,^.*-,,g')
