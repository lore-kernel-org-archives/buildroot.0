From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Oct 2018 21:38:10 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] .gitlab-ci.yml: do
 runtime tests only on explicit trigger
Message-ID: <20181026193620.D2BB88258E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=067cdf70053d9102677f31571dd59b2670f9847e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

When the runtime tests were first introduced, they still ran pretty
quickly. Nowadays, however, there are a lot of runtime tests, and some
of them take a really long time. So running them on every push is
really too much.

Just like we do for the defconfigs, run them on explicit trigger only.

The explicit trigger is now done every week, but it can be increased
to e.g. twice or three times per week.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 96123c1c4f1ee45636a0b6d540d6dfc17889e622)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .gitlab-ci.yml    | 5 +++++
 .gitlab-ci.yml.in | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 271b938842..48def54004 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -51,6 +51,11 @@ check-package:
             - output/build/packages-file-list.txt
 
 .runtime_test: &runtime_test
+    # Running the runtime tests for every push is too much, so limit to
+    # explicit triggers through the API.
+    only:
+        - triggers
+        - tags
     # Keep build directories so the rootfs can be an artifact of the job. The
     # runner will clean up those files for us.
     # Multiply every emulator timeout by 10 to avoid sporadic failures in
diff --git a/.gitlab-ci.yml.in b/.gitlab-ci.yml.in
index c0e9563f2f..10de027ce1 100644
--- a/.gitlab-ci.yml.in
+++ b/.gitlab-ci.yml.in
@@ -51,6 +51,11 @@ check-package:
             - output/build/packages-file-list.txt
 
 .runtime_test: &runtime_test
+    # Running the runtime tests for every push is too much, so limit to
+    # explicit triggers through the API.
+    only:
+        - triggers
+        - tags
     # Keep build directories so the rootfs can be an artifact of the job. The
     # runner will clean up those files for us.
     # Multiply every emulator timeout by 10 to avoid sporadic failures in
