From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 13 Apr 2019 15:28:55 +0200
Subject: [Buildroot] [git commit] .gitlab-ci.yml: reorder jobs
Message-ID: <20190413133831.3C6BF83688@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7405d793e1436a1e2887f0c89f09cad146f239a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .gitlab-ci.yml    | 36 ++++++++++++++++++------------------
 .gitlab-ci.yml.in | 36 ++++++++++++++++++------------------
 2 files changed, 36 insertions(+), 36 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 87e4e13057..7d2dd50afa 100644
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
index b1ec671867..ad616437f3 100644
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
