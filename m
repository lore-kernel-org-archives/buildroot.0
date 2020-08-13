From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Aug 2020 11:44:11 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] gitlab-ci: convert
 only/except to rules
Message-ID: <20200813093901.1964386072@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=07a07db32f3600067a0b5b72d04afd23930f5d32
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

only/except keywords will be deprecated by upcoming gitlab release,
upstream recommend to use rules keyword instead [1][2][3][4][5].

This patch convert .gitlab-ci.yml to use rules, no functional
changes intended.

After this patch, we should still have the following behaviour
while pushing commit, tag, branches:

     - to trigger only the check-* jobs:
       $ git push gitlab HEAD:<name>

     - to trigger all defconfigs and all check-* jobs:
       $ git push gitlab HEAD:<name>-defconfigs

     - to trigger all runtime tests and all check-* jobs:
       $ git push gitlab HEAD:<name>-runtime-tests

     - to trigger one defconfig job:
       $ git push gitlab HEAD:<name>-<defconfig name>

     - to trigger one runtime job:
       $ git push gitlab HEAD:<name>-<test case name>

[1] https://gitlab.com/gitlab-org/gitlab/-/commit/7eaaa597e24bf24743bdd8f8d1d51ade83b3f6de
[2] https://about.gitlab.com/releases/2020/06/22/gitlab-13-1-released/#templates-to-simplify-initial-rules-keyword-configuration
[3] https://about.gitlab.com/releases/2020/05/22/gitlab-13-0-released/#auto-devops-and-secure-configuration-templates-are-changing-to-%60rules%60-instead-of-%60only/except%60
[4] https://gitlab.com/gitlab-org/gitlab/issues/27449
[5] https://gitlab.com/groups/gitlab-org/-/epics/2783
[6] https://buildroot.org/downloads/manual/manual.html#_using_the_run_tests_framework

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 35de2fdcf76e50004b150269b8ec03db7992acd8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .gitlab-ci.yml    | 38 +++++++++++++++++++++++---------------
 .gitlab-ci.yml.in | 38 +++++++++++++++++++++++---------------
 2 files changed, 46 insertions(+), 30 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index fa8e077a07..389592e3b7 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -7,9 +7,10 @@
 image: buildroot/base:20191027.2027
 
 .check_base:
-    except:
-        - /^.*-.*_defconfig$/
-        - /^.*-tests\..*$/
+    rules:
+        - if: '$CI_COMMIT_REF_NAME =~ /^.*-.*_defconfig$/ || $CI_COMMIT_REF_NAME =~ /^.*-tests\..*$/'
+          when: never
+        - when: always
 
 check-DEVELOPERS:
     extends: .check_base
@@ -76,17 +77,21 @@ check-package:
     extends: .defconfig_base
     # Running the defconfigs for every push is too much, so limit to
     # explicit triggers through the API.
-    only:
-        - triggers
-        - tags
-        - /-defconfigs$/
+    rules:
+        # For tags, create a pipeline.
+        - if: '$CI_COMMIT_TAG'
+        # For pipeline created by using a trigger token.
+        - if: '$CI_PIPELINE_TRIGGERED'
+        # For the branch or tag name named *-defconfigs, create a pipeline.
+        - if: '$CI_COMMIT_REF_NAME =~ /^.*-defconfigs$/'
     before_script:
         - DEFCONFIG_NAME=${CI_JOB_NAME}
 
 one-defconfig:
     extends: .defconfig_base
-    only:
-        - /^.*-.*_defconfig$/
+    rules:
+        # For the branch or tag name named *-*_defconfigs, create a pipeline.
+        - if: '$CI_COMMIT_REF_NAME =~ /^.*-.*_defconfig$/'
     before_script:
         - DEFCONFIG_NAME=$(echo ${CI_COMMIT_REF_NAME} | sed -e 's,^.*-,,g')
 
@@ -110,17 +115,20 @@ one-defconfig:
     extends: .runtime_test_base
     # Running the runtime tests for every push is too much, so limit to
     # explicit triggers through the API.
-    only:
-        - triggers
-        - tags
-        - /-runtime-tests$/
+    rules:
+        # For tags, create a pipeline.
+        - if: '$CI_COMMIT_TAG'
+        # For pipeline created by using a trigger token.
+        - if: '$CI_PIPELINE_TRIGGERED'
+        # For the branch or tag name named *-runtime-tests, create a pipeline.
+        - if: '$CI_COMMIT_REF_NAME =~ /^.*-runtime-tests$/'
     before_script:
         - TEST_CASE_NAME=${CI_JOB_NAME}
 
 one-runtime_test:
     extends: .runtime_test_base
-    only:
-        - /^.*-tests\..*$/
+    rules:
+        - if: '$CI_COMMIT_REF_NAME =~ /^.*-tests\..*$/'
     before_script:
         - TEST_CASE_NAME=$(echo ${CI_COMMIT_REF_NAME} | sed -e 's,^.*-,,g')
 aarch64_efi_defconfig: { extends: .defconfig }
diff --git a/.gitlab-ci.yml.in b/.gitlab-ci.yml.in
index 6b09730a65..1facd2a66f 100644
--- a/.gitlab-ci.yml.in
+++ b/.gitlab-ci.yml.in
@@ -7,9 +7,10 @@
 image: buildroot/base:20191027.2027
 
 .check_base:
-    except:
-        - /^.*-.*_defconfig$/
-        - /^.*-tests\..*$/
+    rules:
+        - if: '$CI_COMMIT_REF_NAME =~ /^.*-.*_defconfig$/ || $CI_COMMIT_REF_NAME =~ /^.*-tests\..*$/'
+          when: never
+        - when: always
 
 check-DEVELOPERS:
     extends: .check_base
@@ -76,17 +77,21 @@ check-package:
     extends: .defconfig_base
     # Running the defconfigs for every push is too much, so limit to
     # explicit triggers through the API.
-    only:
-        - triggers
-        - tags
-        - /-defconfigs$/
+    rules:
+        # For tags, create a pipeline.
+        - if: '$CI_COMMIT_TAG'
+        # For pipeline created by using a trigger token.
+        - if: '$CI_PIPELINE_TRIGGERED'
+        # For the branch or tag name named *-defconfigs, create a pipeline.
+        - if: '$CI_COMMIT_REF_NAME =~ /^.*-defconfigs$/'
     before_script:
         - DEFCONFIG_NAME=${CI_JOB_NAME}
 
 one-defconfig:
     extends: .defconfig_base
-    only:
-        - /^.*-.*_defconfig$/
+    rules:
+        # For the branch or tag name named *-*_defconfigs, create a pipeline.
+        - if: '$CI_COMMIT_REF_NAME =~ /^.*-.*_defconfig$/'
     before_script:
         - DEFCONFIG_NAME=$(echo ${CI_COMMIT_REF_NAME} | sed -e 's,^.*-,,g')
 
@@ -110,16 +115,19 @@ one-defconfig:
     extends: .runtime_test_base
     # Running the runtime tests for every push is too much, so limit to
     # explicit triggers through the API.
-    only:
-        - triggers
-        - tags
-        - /-runtime-tests$/
+    rules:
+        # For tags, create a pipeline.
+        - if: '$CI_COMMIT_TAG'
+        # For pipeline created by using a trigger token.
+        - if: '$CI_PIPELINE_TRIGGERED'
+        # For the branch or tag name named *-runtime-tests, create a pipeline.
+        - if: '$CI_COMMIT_REF_NAME =~ /^.*-runtime-tests$/'
     before_script:
         - TEST_CASE_NAME=${CI_JOB_NAME}
 
 one-runtime_test:
     extends: .runtime_test_base
-    only:
-        - /^.*-tests\..*$/
+    rules:
+        - if: '$CI_COMMIT_REF_NAME =~ /^.*-tests\..*$/'
     before_script:
         - TEST_CASE_NAME=$(echo ${CI_COMMIT_REF_NAME} | sed -e 's,^.*-,,g')
