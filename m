From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 9 Sep 2020 09:25:49 +0200
Subject: [Buildroot] [git commit] gitlab-ci: handle single defconfig in
 script
Message-ID: <20200909073014.24BBB80E3F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=386f2c620bcc02b05cbbf365ddc3777a6f34f8ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/misc/gitlab-ci.yml.in          | 11 -----------
 support/scripts/generate-gitlab-ci-yml |  8 +++++++-
 2 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/support/misc/gitlab-ci.yml.in b/support/misc/gitlab-ci.yml.in
index c6c4d35a0c..8a94b872f3 100644
--- a/support/misc/gitlab-ci.yml.in
+++ b/support/misc/gitlab-ci.yml.in
@@ -64,20 +64,9 @@ check-package:
             - output/build/packages-file-list.txt
             - output/build/*/.config
             - runtime-test.log
-
-.defconfig:
-    extends: .defconfig_base
     before_script:
         - DEFCONFIG_NAME=${CI_JOB_NAME}
 
-one-defconfig:
-    extends: .defconfig_base
-    rules:
-        # For the branch or tag name named *-*_defconfigs, create a pipeline.
-        - if: '$CI_COMMIT_REF_NAME =~ /^.*-.*_defconfig$/'
-    before_script:
-        - DEFCONFIG_NAME=$(echo ${CI_COMMIT_REF_NAME} | sed -e 's,^.*-,,g')
-
 .runtime_test_base:
     # Keep build directories so the rootfs can be an artifact of the job. The
     # runner will clean up those files for us.
diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
index 21963b2975..39e0fc7283 100755
--- a/support/scripts/generate-gitlab-ci-yml
+++ b/support/scripts/generate-gitlab-ci-yml
@@ -40,7 +40,13 @@ gen_defconfigs() {
     fi
     case "${CI_COMMIT_REF_NAME}" in
         # For the branch or tag name named *-defconfigs, create a pipeline.
-        (*-defconfigs) build_defconfigs=true;;
+        (*-defconfigs)
+            build_defconfigs=true
+        ;;
+        (*-*_defconfig)
+            defconfigs=( "${CI_COMMIT_REF_NAME##*-}" )
+            build_defconfigs=true
+        ;;
     esac
 
     for cfg in "${defconfigs[@]}"; do
