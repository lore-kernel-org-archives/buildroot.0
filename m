From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 30 Jun 2017 18:42:53 +0200
Subject: [Buildroot] [PATCH] .gitlab-ci.yml: add check-DEVELOPERS test
Message-ID: <20170630164253.19859-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This verifies that the DEVELOPERS file doesn't contain errors. It
just runs parse_developers from getdeveloperlib and errors out if
that produces any output.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .gitlab-ci.yml    | 6 ++++++
 .gitlab-ci.yml.in | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 1f2410e862..43e963c51d 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -34,6 +34,12 @@ check-gitlab-ci.yml:
         - make .gitlab-ci.yml
         - diff -u .gitlab-ci.yml.orig .gitlab-ci.yml
 
+check-DEVELOPERS:
+    script:
+        - PYTHONPATH=$PWD/support/scripts
+                python -c 'from getdeveloperlib import parse_developers; parse_developers()' |
+                grep . && exit 1
+
 .defconfig: &defconfig
     # Running the defconfigs for every push is too much, so limit to
     # explicit triggers through the API.
diff --git a/.gitlab-ci.yml.in b/.gitlab-ci.yml.in
index 0f9cbcba33..0b6e634a4b 100644
--- a/.gitlab-ci.yml.in
+++ b/.gitlab-ci.yml.in
@@ -34,6 +34,12 @@ check-gitlab-ci.yml:
         - make .gitlab-ci.yml
         - diff -u .gitlab-ci.yml.orig .gitlab-ci.yml
 
+check-DEVELOPERS:
+    script:
+        - PYTHONPATH=$PWD/support/scripts
+                python -c 'from getdeveloperlib import parse_developers; parse_developers()' |
+                grep . && exit 1
+
 .defconfig: &defconfig
     # Running the defconfigs for every push is too much, so limit to
     # explicit triggers through the API.
-- 
2.13.1
