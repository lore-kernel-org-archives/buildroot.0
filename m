From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon,  8 Apr 2019 00:22:53 -0300
Subject: [Buildroot] [PATCH v4 1/3] .gitlab-ci.yml: reorder jobs
In-Reply-To: <20190408032255.12841-1-ricardo.martincoski@gmail.com>
References: <20190408032255.12841-1-ricardo.martincoski@gmail.com>
Message-ID: <20190408032255.12841-2-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to make the file easier to maintain, reorder the keys in a more
logical way:
Keep the docker image at the top.
Then all check-* jobs in the case-insensitive alphabetical order they
appear on Gitlab-CI pipeline results.
Then all keys related to defconfigs.
Finally all keys related to runtime tests.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
Changes v3 -> v4:
  - rebase after removing one patch from the series;

Changes v2 -> v3:
  - new patch, since I am already doing a lot of changes to this file;

For test purposes I created a commit that makes all defconfigs and
runtime tests to echo the command that would be called instead of
actually calling it and then I asked Gitlab CI to run:
 - only the check-* jobs: (total 4)
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/55630581
 - all defconfigs and all check-* jobs: (total 199)
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/55630594
 - all runtime tests and all check-* jobs: (total 145)
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/55630611
 - all jobs (using a tag): (total 340)
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/55630646
---
 .gitlab-ci.yml    | 36 ++++++++++++++++++------------------
 .gitlab-ci.yml.in | 36 ++++++++++++++++++------------------
 2 files changed, 36 insertions(+), 36 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 572868a557..58166364ad 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -6,24 +6,6 @@
 
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
@@ -42,10 +24,28 @@ check-flake8:
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
diff --git a/.gitlab-ci.yml.in b/.gitlab-ci.yml.in
index a506840892..f519338d63 100644
--- a/.gitlab-ci.yml.in
+++ b/.gitlab-ci.yml.in
@@ -6,24 +6,6 @@
 
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
@@ -42,10 +24,28 @@ check-flake8:
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
