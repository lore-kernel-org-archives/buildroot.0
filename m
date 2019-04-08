From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon,  8 Apr 2019 00:22:55 -0300
Subject: [Buildroot] [PATCH v4 3/3] .gitlab-ci.yml: add trigger per job
In-Reply-To: <20190408032255.12841-1-ricardo.martincoski@gmail.com>
References: <20190408032255.12841-1-ricardo.martincoski@gmail.com>
Message-ID: <20190408032255.12841-4-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
for them.

While adding those new triggers, use the full name of the job as suffix.
This leads to large branch names:
$ git push gitlab HEAD:test1-tests.toolchain.test_external.TestExternalToolchainBuildrootuClibc
$ git push gitlab HEAD:test2-olimex_a20_olinuxino_lime_legacy_defconfig
But those branches are temporary, and this way the user don't need to
think much, just copy and paste the job name as suffix.

The hidden keys that now hold the commonalities between jobs does not
hold only a script anymore, so rename then from *_script to *_base.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
Changes v3 -> v4:
  - rebase after removing one patch from the series;

Changes v2 -> v3:
  - use a separate job to build one defconfig or run one runtime test
    (suggested by Arnout);
  - do not run check-* jobs when a single job (defconfig or runtime
    test) was requested (suggested by Thomas in reply to the cover
    letter of v1);

Changes v1 -> v2:
  - use shell-based implementation instead of complexes awk calls, it is
    simpler and easier to read (suggested by Thomas);
  - since now the value for 'only' is overridden by the script, add a
    note on .gitlab-ci.yml*;

For test purposes I created a commit that makes all defconfigs and
runtime tests to echo the command that would be called instead of
actually calling it and then I asked Gitlab CI to run:
 - only the check-* jobs:
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/55632370
 - all defconfigs and all check-* jobs:
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/55632439
 - all runtime tests and all check-* jobs:
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/55632468
 - all jobs (using a tag):
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/55632522

Using the entire series (without the test commit above) I also asked 20
random jobs:
$ for job in \
  $(grep '_defconfig:\|^tests' .gitlab-ci.yml | sed -e 's,:.*,,g' | shuf -n 20); do \
  git push gitlab HEAD:trigger-per-job-v4-$job ; \
  done
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/55632631
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/55632633
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/55632636
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/55632638
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/55632642
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/55632644
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/55632646
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/55632651
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/55632653
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/55632655
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/55632658
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/55632661
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/55632668
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/55632670
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/55632672
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/55632674
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/55632677
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/55632680
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/55632686
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/55632688
---
 .gitlab-ci.yml    | 65 ++++++++++++++++++++++++++++++++---------------
 .gitlab-ci.yml.in | 65 ++++++++++++++++++++++++++++++++---------------
 2 files changed, 88 insertions(+), 42 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 44fdb94f65..a38448e3df 100644
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
@@ -25,16 +32,18 @@ check-flake8:
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
         - echo "Configure Buildroot for ${DEFCONFIG_NAME}"
         - make ${DEFCONFIG_NAME}
@@ -45,17 +54,6 @@ check-package:
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
-    before_script:
-        - DEFCONFIG_NAME=${CI_JOB_NAME}
     artifacts:
         when: always
         expire_in: 2 weeks
@@ -67,7 +65,25 @@ check-package:
             - output/build/packages-file-list.txt
             - output/build/*/.config
 
-.runtime_test_script:
+.defconfig:
+    extends: .defconfig_base
+    # Running the defconfigs for every push is too much, so limit to
+    # explicit triggers through the API.
+    only:
+        - triggers
+        - tags
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
@@ -75,9 +91,16 @@ check-package:
     script:
         - echo "Starting runtime test ${TEST_CASE_NAME}"
         - ./support/testing/run-tests -o test-output/ -d test-dl/ -k --timeout-multiplier 10 ${TEST_CASE_NAME}
+    artifacts:
+        when: always
+        expire_in: 2 weeks
+        paths:
+            - test-output/*.log
+            - test-output/*/.config
+            - test-output/*/images/*
 
 .runtime_test:
-    extends: .runtime_test_script
+    extends: .runtime_test_base
     # Running the runtime tests for every push is too much, so limit to
     # explicit triggers through the API.
     only:
@@ -86,13 +109,13 @@ check-package:
         - /-runtime-tests$/
     before_script:
         - TEST_CASE_NAME=${CI_JOB_NAME}
-    artifacts:
-        when: always
-        expire_in: 2 weeks
-        paths:
-            - test-output/*.log
-            - test-output/*/.config
-            - test-output/*/images/*
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
index 0b4c65b258..b139144d6f 100644
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
@@ -25,16 +32,18 @@ check-flake8:
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
         - echo "Configure Buildroot for ${DEFCONFIG_NAME}"
         - make ${DEFCONFIG_NAME}
@@ -45,17 +54,6 @@ check-package:
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
-    before_script:
-        - DEFCONFIG_NAME=${CI_JOB_NAME}
     artifacts:
         when: always
         expire_in: 2 weeks
@@ -67,7 +65,25 @@ check-package:
             - output/build/packages-file-list.txt
             - output/build/*/.config
 
-.runtime_test_script:
+.defconfig:
+    extends: .defconfig_base
+    # Running the defconfigs for every push is too much, so limit to
+    # explicit triggers through the API.
+    only:
+        - triggers
+        - tags
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
@@ -75,9 +91,16 @@ check-package:
     script:
         - echo "Starting runtime test ${TEST_CASE_NAME}"
         - ./support/testing/run-tests -o test-output/ -d test-dl/ -k --timeout-multiplier 10 ${TEST_CASE_NAME}
+    artifacts:
+        when: always
+        expire_in: 2 weeks
+        paths:
+            - test-output/*.log
+            - test-output/*/.config
+            - test-output/*/images/*
 
 .runtime_test:
-    extends: .runtime_test_script
+    extends: .runtime_test_base
     # Running the runtime tests for every push is too much, so limit to
     # explicit triggers through the API.
     only:
@@ -86,10 +109,10 @@ check-package:
         - /-runtime-tests$/
     before_script:
         - TEST_CASE_NAME=${CI_JOB_NAME}
-    artifacts:
-        when: always
-        expire_in: 2 weeks
-        paths:
-            - test-output/*.log
-            - test-output/*/.config
-            - test-output/*/images/*
+
+one-runtime_test:
+    extends: .runtime_test_base
+    only:
+        - /^.*-tests\..*$/
+    before_script:
+        - TEST_CASE_NAME=$(echo ${CI_COMMIT_REF_NAME} | sed -e 's,^.*-,,g')
-- 
2.17.1
