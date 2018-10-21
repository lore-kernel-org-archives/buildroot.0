From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 21 Oct 2018 11:03:03 +0100
Subject: [Buildroot] [PATCH 2/2] .gitlab-ci.yml: do runtime tests only on
 explicit trigger
In-Reply-To: <20181021100303.18431-1-arnout@mind.be>
References: <20181021100303.18431-1-arnout@mind.be>
Message-ID: <20181021100303.18431-2-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When the runtime tests were first introduced, they still ran pretty
quickly. Nowadays, however, there are a lot of runtime tests, and some
of them take a really long time. So running them on every push is
really too much.

Just like we do for the defconfigs, run them on explicit trigger only.

The explicit trigger is now done every week, but it can be increased
to e.g. twice or three times per week.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v2: properly regenerate .gitlab-ci.yml
---
 .gitlab-ci.yml    | 5 +++++
 .gitlab-ci.yml.in | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index d6a2319ba0..d5e91042f1 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -62,6 +62,11 @@ check-package:
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
index 38e24c8d01..db526c4b5a 100644
--- a/.gitlab-ci.yml.in
+++ b/.gitlab-ci.yml.in
@@ -62,6 +62,11 @@ check-package:
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
-- 
2.17.2
