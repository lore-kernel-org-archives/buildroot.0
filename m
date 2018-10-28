From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 28 Oct 2018 20:58:37 -0300
Subject: [Buildroot] [PATCH 1/3] .gitlab-ci.yml: add trigger per type of job
In-Reply-To: <20181028235839.22472-1-ricardo.martincoski@gmail.com>
References: <20181028235839.22472-1-ricardo.martincoski@gmail.com>
Message-ID: <20181028235839.22472-2-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently the user has 2 sets of jobs that can be triggered on a GitLab
pipeline.
 - to trigger all defconfigs, all runtime tests and all check-* jobs:
   $ git tag <name>
   $ git push gitlab <name>                     # currently 260 jobs
 - to trigger only the check-* jobs:
   $ git push gitlab HEAD:<name>                # currently   4 jobs

This is not much versatile, so the user ends up hand-editing the
.gitlab-ci.yml in order to trigger some subsets, even the common ones,
for instance all runtime tests.

Add 2 more subsets that can be triggered based on the name of the
branch pushed.
 - to trigger all defconfigs and all check-* jobs:
   $ git push gitlab HEAD:<name>-defconfigs     # currently 192 jobs
 - to trigger all runtime tests and all check-* jobs:
   $ git push gitlab HEAD:<name>-runtime-tests  # currently  72 jobs

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 .gitlab-ci.yml    | 2 ++
 .gitlab-ci.yml.in | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 8b9a1f175c..d84c283dbc 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -51,6 +51,7 @@ check-package:
     only:
         - triggers
         - tags
+        - /-defconfigs$/
     script: *defconfig_script
     artifacts:
         when: always
@@ -67,6 +68,7 @@ check-package:
     only:
         - triggers
         - tags
+        - /-runtime-tests$/
     # Keep build directories so the rootfs can be an artifact of the job. The
     # runner will clean up those files for us.
     # Multiply every emulator timeout by 10 to avoid sporadic failures in
diff --git a/.gitlab-ci.yml.in b/.gitlab-ci.yml.in
index db526c4b5a..ebca29ca1f 100644
--- a/.gitlab-ci.yml.in
+++ b/.gitlab-ci.yml.in
@@ -51,6 +51,7 @@ check-package:
     only:
         - triggers
         - tags
+        - /-defconfigs$/
     script: *defconfig_script
     artifacts:
         when: always
@@ -67,6 +68,7 @@ check-package:
     only:
         - triggers
         - tags
+        - /-runtime-tests$/
     # Keep build directories so the rootfs can be an artifact of the job. The
     # runner will clean up those files for us.
     # Multiply every emulator timeout by 10 to avoid sporadic failures in
-- 
2.17.1
