From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 30 Jul 2017 01:49:45 -0300
Subject: [Buildroot] [RFC PATCH 3/4] .gitlab-ci.yml: use large timeouts for
	runtime tests
In-Reply-To: <20170730044946.11999-1-ricardo.martincoski@gmail.com>
References: <20170730044946.11999-1-ricardo.martincoski@gmail.com>
Message-ID: <20170730044946.11999-3-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Multiply the timeouts for emulator in the gitlab runners by 10 to avoid
sporadic failures in elastic runners.

Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
See also
http://lists.busybox.net/pipermail/buildroot/2017-July/199329.html
---
 .gitlab-ci.yml    | 4 +++-
 .gitlab-ci.yml.in | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index f9e5b1fa6b..b1a1cd31a4 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -49,7 +49,9 @@ check-DEVELOPERS:
 .runtime_test: &runtime_test
     # Keep build directories so the rootfs can be an artifact of the job. The
     # runner will clean up those files for us.
-    script: ./support/testing/run-tests -o test-output/ -d test-dl/ -k ${CI_BUILD_NAME}
+    # Multiply every emulator timeout by 10 to avoid sporadic failures in
+    # elastic runners.
+    script: ./support/testing/run-tests -o test-output/ -d test-dl/ -k -e 10 ${CI_BUILD_NAME}
     artifacts:
         when: always
         expire_in: 2 weeks
diff --git a/.gitlab-ci.yml.in b/.gitlab-ci.yml.in
index b8fce9ef96..9d3ddfec3c 100644
--- a/.gitlab-ci.yml.in
+++ b/.gitlab-ci.yml.in
@@ -49,7 +49,9 @@ check-DEVELOPERS:
 .runtime_test: &runtime_test
     # Keep build directories so the rootfs can be an artifact of the job. The
     # runner will clean up those files for us.
-    script: ./support/testing/run-tests -o test-output/ -d test-dl/ -k ${CI_BUILD_NAME}
+    # Multiply every emulator timeout by 10 to avoid sporadic failures in
+    # elastic runners.
+    script: ./support/testing/run-tests -o test-output/ -d test-dl/ -k -e 10 ${CI_BUILD_NAME}
     artifacts:
         when: always
         expire_in: 2 weeks
-- 
2.13.0
