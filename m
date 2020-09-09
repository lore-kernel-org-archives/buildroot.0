From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 9 Sep 2020 09:25:56 +0200
Subject: [Buildroot] [git commit] gitlab-ci: move before-script before script
Message-ID: <20200909073014.42E6D88EE4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=05d755961513698c412cb485397c2c94914a4283
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/misc/gitlab-ci.yml.in | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/support/misc/gitlab-ci.yml.in b/support/misc/gitlab-ci.yml.in
index c4a37464f6..fcfff5c6aa 100644
--- a/support/misc/gitlab-ci.yml.in
+++ b/support/misc/gitlab-ci.yml.in
@@ -14,6 +14,8 @@
         - make check-package
 
 .defconfig_check:
+    before_script:
+        - DEFCONFIG_NAME=$(echo ${CI_JOB_NAME} | sed -e 's,_check$,,g')
     script:
         - echo "Configure Buildroot for ${DEFCONFIG_NAME}"
         - make ${DEFCONFIG_NAME}
@@ -23,10 +25,10 @@
         expire_in: 2 weeks
         paths:
             - .config
-    before_script:
-        - DEFCONFIG_NAME=$(echo ${CI_JOB_NAME} | sed -e 's,_check$,,g')
 
 .defconfig_base:
+    before_script:
+        - DEFCONFIG_NAME=${CI_JOB_NAME}
     script:
         - echo "Configure Buildroot for ${DEFCONFIG_NAME}"
         - make ${DEFCONFIG_NAME}
@@ -55,10 +57,10 @@
             - output/build/packages-file-list.txt
             - output/build/*/.config
             - runtime-test.log
-    before_script:
-        - DEFCONFIG_NAME=${CI_JOB_NAME}
 
 .runtime_test_base:
+    before_script:
+        - TEST_CASE_NAME=${CI_JOB_NAME}
     # Keep build directories so the rootfs can be an artifact of the job. The
     # runner will clean up those files for us.
     # Multiply every emulator timeout by 10 to avoid sporadic failures in
@@ -73,6 +75,4 @@
             - test-output/*.log
             - test-output/*/.config
             - test-output/*/images/*
-    before_script:
-        - TEST_CASE_NAME=${CI_JOB_NAME}
 
