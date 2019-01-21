From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 20 Jan 2019 23:11:15 -0200
Subject: [Buildroot] [PATCH v3 5/5] .gitlab-ci.yml: add trigger per job
In-Reply-To: <20190121011115.19255-1-ricardo.martincoski@gmail.com>
References: <20190121011115.19255-1-ricardo.martincoski@gmail.com>
Message-ID: <20190121011115.19255-6-ricardo.martincoski@gmail.com>
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
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/44073033
 - all defconfigs and all check-* jobs:
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/44073047
 - all runtime tests and all check-* jobs:
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/44073089
 - all jobs (using a tag):
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/44073172

Using the entire series (without the test commit above) I also asked 20
random jobs:
$ for job in \
  $(grep '_defconfig:\|^tests' .gitlab-ci.yml | sed -e 's,:.*,,g' | shuf -n 20); do \
  git push gitlab HEAD:trigger-per-job-v3-$job ; \
  done
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/44073410
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/44073419
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/44073431
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/44073434
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/44073436
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/44073438
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/44073445
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/44073448
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/44073455
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/44073458
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/44073461
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/44073463
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/44073469
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/44073477
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/44073479
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/44073482
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/44073486
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/44073491
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/44073510
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/44073522
---
 .gitlab-ci-template.yml | 65 ++++++++++++++++++++++++++++-------------
 1 file changed, 44 insertions(+), 21 deletions(-)

diff --git a/.gitlab-ci-template.yml b/.gitlab-ci-template.yml
index 59f3af36eb..297372d965 100644
--- a/.gitlab-ci-template.yml
+++ b/.gitlab-ci-template.yml
@@ -5,7 +5,13 @@
 
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
@@ -13,6 +19,7 @@ check-DEVELOPERS:
         - "! utils/get-developers | grep -v 'No action specified'"
 
 check-flake8:
+    extends: .check_base
     before_script:
         # Help flake8 to find the Python files without .py extension.
         - find * -type f -name '*.py' > files.txt
@@ -24,16 +31,18 @@ check-flake8:
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
@@ -44,17 +53,6 @@ check-package:
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
@@ -66,7 +64,25 @@ check-package:
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
@@ -74,9 +90,16 @@ check-package:
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
@@ -85,10 +108,10 @@ check-package:
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
