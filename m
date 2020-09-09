From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 9 Sep 2020 09:24:17 +0200
Subject: [Buildroot] [git commit] gitlab-ci: share the image version with
 the child
Message-ID: <20200909073013.DDE9580E3F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bef67390949dd6ba5cbfd658371c5df81bb5758c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, the image name and version are duplicated in the main
pipeline and the generated, child pipeline.

This is a condition for a future gaffe, so let's use the image from the
main pipeline when generating the child one.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/misc/gitlab-ci.yml.in          |  5 -----
 support/scripts/generate-gitlab-ci-yml | 14 +++++++++++++-
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/support/misc/gitlab-ci.yml.in b/support/misc/gitlab-ci.yml.in
index 0d058bdd91..f00c764aaf 100644
--- a/support/misc/gitlab-ci.yml.in
+++ b/support/misc/gitlab-ci.yml.in
@@ -1,8 +1,3 @@
-# Configuration for Gitlab-CI.
-# Builds appear on https://gitlab.com/buildroot.org/buildroot/pipelines
-
-image: buildroot/base:20200814.2228
-
 .check_base:
     rules:
         - if: '$CI_COMMIT_REF_NAME =~ /^.*-.*_defconfig$/ || $CI_COMMIT_REF_NAME =~ /^.*-tests\..*$/'
diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
index 51f7de21dd..b076b01d05 100755
--- a/support/scripts/generate-gitlab-ci-yml
+++ b/support/scripts/generate-gitlab-ci-yml
@@ -5,7 +5,7 @@ set -o pipefail
 main() {
     local template="${1}"
 
-    cat "${template}"
+    preamble "${template}"
 
     (
         cd configs
@@ -18,4 +18,16 @@ main() {
     | LC_ALL=C sort
 }
 
+preamble() {
+    local template="${1}"
+
+    cat - "${template}" <<-_EOF_
+	# This file is generated; do not edit!
+	# Builds appear on https://gitlab.com/buildroot.org/buildroot/pipelines
+
+	image: ${CI_JOB_IMAGE}
+
+_EOF_
+}
+
 main "${@}"
