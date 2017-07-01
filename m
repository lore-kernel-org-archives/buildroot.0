From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 15:22:37 +0200
Subject: [Buildroot] [git commit] .gitlab-ci.yml: add check-DEVELOPERS test
Message-ID: <20170701131935.CC8F581E75@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d498aa4a344a2b6433826d956ce5e89a2a71c395
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This verifies that the DEVELOPERS file doesn't contain errors. It
just runs parse_developers from getdeveloperlib and errors out if
that produces any output.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .gitlab-ci.yml    | 6 ++++++
 .gitlab-ci.yml.in | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 1f2410e..43e963c 100644
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
index 0f9cbcb..0b6e634 100644
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
