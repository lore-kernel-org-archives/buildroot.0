From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 31 Jul 2017 21:23:25 +0200
Subject: [Buildroot] [git commit] .gitlab-ci.yml: save rootfs as artifact
	for runtime tests
Message-ID: <20170731191917.87E1881E93@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=af6b5830ececa3a61afa70a35711654f0b2cc32a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Sometimes when a test fails in a gitlab pipeline the reason of the
failure cannot be determined using only the logfile.

Add the modified rootfs as an artifact of the job to improve
troubleshooting. To accomplish this, always use -k option from the test
infra, unconditionally add the resulting images to the artifacts, and
let the runner do the cleanup for us.

These artifacts can also be useful when a test fails locally but pass at
gitlab runners.

When the test does not generate a image, this message is displayed in
the runner log:
WARNING: test-output/*/images/*: no matching files

Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .gitlab-ci.yml    | 5 ++++-
 .gitlab-ci.yml.in | 5 ++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 42707ad..f9e5b1f 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -47,12 +47,15 @@ check-DEVELOPERS:
             - output/build/packages-file-list.txt
 
 .runtime_test: &runtime_test
-    script: ./support/testing/run-tests -o test-output/ -d test-dl/ ${CI_BUILD_NAME}
+    # Keep build directories so the rootfs can be an artifact of the job. The
+    # runner will clean up those files for us.
+    script: ./support/testing/run-tests -o test-output/ -d test-dl/ -k ${CI_BUILD_NAME}
     artifacts:
         when: always
         expire_in: 2 weeks
         paths:
             - test-output/*.log
+            - test-output/*/images/*
 acmesystems_aria_g25_128mb_defconfig: *defconfig
 acmesystems_aria_g25_256mb_defconfig: *defconfig
 acmesystems_arietta_g25_128mb_defconfig: *defconfig
diff --git a/.gitlab-ci.yml.in b/.gitlab-ci.yml.in
index 3088677..b8fce9e 100644
--- a/.gitlab-ci.yml.in
+++ b/.gitlab-ci.yml.in
@@ -47,9 +47,12 @@ check-DEVELOPERS:
             - output/build/packages-file-list.txt
 
 .runtime_test: &runtime_test
-    script: ./support/testing/run-tests -o test-output/ -d test-dl/ ${CI_BUILD_NAME}
+    # Keep build directories so the rootfs can be an artifact of the job. The
+    # runner will clean up those files for us.
+    script: ./support/testing/run-tests -o test-output/ -d test-dl/ -k ${CI_BUILD_NAME}
     artifacts:
         when: always
         expire_in: 2 weeks
         paths:
             - test-output/*.log
+            - test-output/*/images/*
