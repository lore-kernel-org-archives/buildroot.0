From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 10 Aug 2017 10:08:55 +0200
Subject: [Buildroot] [git commit] .gitlab-ci.yml: use large timeouts for
	runtime tests
Message-ID: <20170810090958.3F4248016A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3cc7bd2db97a7f2cdd3e30dce5cb5ed0b52801d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Multiply the timeouts for emulator in the gitlab runners by 10 to avoid
sporadic failures in elastic runners.

Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .gitlab-ci.yml    | 4 +++-
 .gitlab-ci.yml.in | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 90efd81..19335d7 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -49,7 +49,9 @@ check-DEVELOPERS:
 .runtime_test: &runtime_test
     # Keep build directories so the rootfs can be an artifact of the job. The
     # runner will clean up those files for us.
-    script: ./support/testing/run-tests -o test-output/ -d test-dl/ -k ${CI_BUILD_NAME}
+    # Multiply every emulator timeout by 10 to avoid sporadic failures in
+    # elastic runners.
+    script: ./support/testing/run-tests -o test-output/ -d test-dl/ -k --timeout-multiplier 10 ${CI_BUILD_NAME}
     artifacts:
         when: always
         expire_in: 2 weeks
diff --git a/.gitlab-ci.yml.in b/.gitlab-ci.yml.in
index b8fce9e..3abf7d5 100644
--- a/.gitlab-ci.yml.in
+++ b/.gitlab-ci.yml.in
@@ -49,7 +49,9 @@ check-DEVELOPERS:
 .runtime_test: &runtime_test
     # Keep build directories so the rootfs can be an artifact of the job. The
     # runner will clean up those files for us.
-    script: ./support/testing/run-tests -o test-output/ -d test-dl/ -k ${CI_BUILD_NAME}
+    # Multiply every emulator timeout by 10 to avoid sporadic failures in
+    # elastic runners.
+    script: ./support/testing/run-tests -o test-output/ -d test-dl/ -k --timeout-multiplier 10 ${CI_BUILD_NAME}
     artifacts:
         when: always
         expire_in: 2 weeks
