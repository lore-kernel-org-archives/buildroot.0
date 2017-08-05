From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri,  4 Aug 2017 23:05:20 -0300
Subject: [Buildroot] [PATCH v2 2/2] .gitlab-ci.yml: use large timeouts for
	runtime tests
In-Reply-To: <20170805020520.4925-1-ricardo.martincoski@gmail.com>
References: <20170805020520.4925-1-ricardo.martincoski@gmail.com>
Message-ID: <20170805020520.4925-2-ricardo.martincoski@gmail.com>
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
Changes v1 -> v2:
  - use --timeout-multiplier instead of -e, as it changed in v2 of the
    previous patch;

Sample pipeline using only gitlab runners:
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/10605884

PS: for this other sporadic error:
ERROR: Job failed: execution took longer than 1h0m0s seconds
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/28241402
see
https://docs.gitlab.com/ee/user/project/pipelines/settings.html#timeout
---
 .gitlab-ci.yml    | 4 +++-
 .gitlab-ci.yml.in | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 90efd81e50..19335d7bfd 100644
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
index b8fce9ef96..3abf7d5313 100644
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
-- 
2.13.0
