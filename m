From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Jul 2020 18:13:45 +0200
Subject: [Buildroot] [git commit] gitlab-ci: check all defconfigs on every
 push
Message-ID: <20200727161031.8BBFB824EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2ed3b0a5862eeb2bb5e7c476b990e5c0d6939955
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The defconfig check has been introduced by the previous
patch before the building each defconfig but those builds
are done every week or more.

Checking if a defconfig is valid can be done on every
push in the repository since it take few seconds.

This would allow to detect as soon as possible a problem
in a defconfig and eventually avoid breaking the build
while build testing all defconfig.

Introduce a new job template ".defconfig_check" in
gitlab-ci.yml.in and modify the generate-gitlab-ci-yml
to create a job for each defconfig to run the test.

Although, we could have used only one job to do all
tests, using one job per defconfig allow to identify
easily in gitlab which defconfig is falling.

Tested:
https://gitlab.com/kubu93/buildroot/pipelines/138331069
https://gitlab.com/kubu93/buildroot/pipelines/171223758

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/misc/gitlab-ci.yml.in          | 13 +++++++++++++
 support/scripts/generate-gitlab-ci-yml |  2 +-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/support/misc/gitlab-ci.yml.in b/support/misc/gitlab-ci.yml.in
index 01592f7155..7218ea027e 100644
--- a/support/misc/gitlab-ci.yml.in
+++ b/support/misc/gitlab-ci.yml.in
@@ -34,6 +34,19 @@ check-package:
     script:
         - make check-package
 
+.defconfig_check:
+    script:
+        - echo "Configure Buildroot for ${DEFCONFIG_NAME}"
+        - make ${DEFCONFIG_NAME}
+        - support/scripts/check-dotconfig.py .config configs/${DEFCONFIG_NAME}
+    artifacts:
+        when: on_failure
+        expire_in: 2 weeks
+        paths:
+            - .config
+    before_script:
+        - DEFCONFIG_NAME=$(echo ${CI_JOB_NAME} | sed -e 's,_check$,,g')
+
 .defconfig_base:
     script:
         - echo "Configure Buildroot for ${DEFCONFIG_NAME}"
diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
index 262a7649b2..5cef1146e2 100755
--- a/support/scripts/generate-gitlab-ci-yml
+++ b/support/scripts/generate-gitlab-ci-yml
@@ -10,7 +10,7 @@ cat "${input}"
     cd configs
     LC_ALL=C ls -1 *_defconfig
 ) \
-    | sed 's/$/: { extends: .defconfig }/'
+    | sed -r -e 's/^(.+)$/\1: { extends: .defconfig }\n\1_check: { extends: .defconfig_check }/'
 
 ./support/testing/run-tests -l 2>&1 \
     | sed -r -e '/^test_run \((.*)\).*/!d; s//\1: { extends: .runtime_test }/' \
