From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 20 Jan 2019 23:11:13 -0200
Subject: [Buildroot] [PATCH v3 3/5] .gitlab-ci.yml: reorder jobs
In-Reply-To: <20190121011115.19255-1-ricardo.martincoski@gmail.com>
References: <20190121011115.19255-1-ricardo.martincoski@gmail.com>
Message-ID: <20190121011115.19255-4-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to make the template of jobs easier to maintain, reorder the
keys in a more logical way:
Keep the docker image at the top.
Then all check-* jobs in the case-insensitive alphabetical order they
appear on Gitlab-CI pipeline results.
Then all keys related to defconfigs.
Finally all keys related to runtime tests.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
NOTE: I used .gitlab-ci.yml as prefix for the commit subject because it
seems to me it is "the area touched by the patch".
Please correct me if I misunderstood.

Changes v2 -> v3:
  - new patch, since I am already doing a lot of changes to this file;

For test purposes I created a commit that makes all defconfigs and
runtime tests to echo the command that would be called instead of
actually calling it and then I asked Gitlab CI to run:
 - only the check-* jobs:
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/44072644
 - all defconfigs and all check-* jobs:
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/44072658
 - all runtime tests and all check-* jobs:
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/44072673
 - all jobs (using a tag):
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/44072690
---
 .gitlab-ci-template.yml | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/.gitlab-ci-template.yml b/.gitlab-ci-template.yml
index 83b93d5aaa..f1dfcbcecb 100644
--- a/.gitlab-ci-template.yml
+++ b/.gitlab-ci-template.yml
@@ -5,24 +5,6 @@
 
 image: buildroot/base:20180318.1724
 
-.defconfig_script:
-    script:
-        - echo 'Configure Buildroot'
-        - make ${CI_JOB_NAME}
-        - echo 'Build buildroot'
-        - |
-            make > >(tee build.log |grep '>>>') 2>&1 || {
-                echo 'Failed build last output'
-                tail -200 build.log
-                exit 1
-            }
-
-check-gitlab-ci.yml:
-    script:
-        - mv .gitlab-ci.yml .gitlab-ci.yml.orig
-        - make .gitlab-ci.yml
-        - diff -u .gitlab-ci.yml.orig .gitlab-ci.yml
-
 check-DEVELOPERS:
     # get-developers should print just "No action specified"; if it prints
     # anything else, it's a parse error.
@@ -41,10 +23,28 @@ check-flake8:
     after_script:
         - wc -l files.processed
 
+check-gitlab-ci.yml:
+    script:
+        - mv .gitlab-ci.yml .gitlab-ci.yml.orig
+        - make .gitlab-ci.yml
+        - diff -u .gitlab-ci.yml.orig .gitlab-ci.yml
+
 check-package:
     script:
         - make check-package
 
+.defconfig_script:
+    script:
+        - echo 'Configure Buildroot'
+        - make ${CI_JOB_NAME}
+        - echo 'Build buildroot'
+        - |
+            make > >(tee build.log |grep '>>>') 2>&1 || {
+                echo 'Failed build last output'
+                tail -200 build.log
+                exit 1
+            }
+
 .defconfig:
     extends: .defconfig_script
     # Running the defconfigs for every push is too much, so limit to
-- 
2.17.1
