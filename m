Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5157DC61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F404770112;
	Tue, 21 Feb 2023 01:44:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F404770112
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I8Hf05RqNIo4; Tue, 21 Feb 2023 01:44:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F261700D9;
	Tue, 21 Feb 2023 01:44:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F261700D9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E495A1BF2B1
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:04:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 168CC6FFFC
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 168CC6FFFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mfCBXeWy3wef for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 157806FBE4
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 157806FBE4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 13F4A828C8; Mon, 20 Feb 2023 20:52:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 7 Feb 2023 22:55:49 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9a095643b4dd34eb7acb69662aa64fa945f4b542
X-Git-Newrev: e92bb8f1c9523227413500380df16bfc64053fad
X-Patchwork-Hint: ignore
Message-Id: <20230220205254.13F4A828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] gitlab-ci: don't use
 before_script in job templates
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e92bb8f1c9523227413500380df16bfc64053fad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

When gitlab prepares a job to run, it checks out the repository with a
non-root user, and spawns a container that runs as root, with some UID
mapping that makes the files be owned by root in the
container. However, our pipelines run as a nont-root user.

Commit bde165f7ad (.gitlab-ci.yml: update Docker image to use) updated
the docker image that is used to run in our pipelines.

That new image includes a git version that is stricter about the
ownership of the git tree it is acting in: git aborts in error when the
user running it does not own the repository.

We use `git ls-tree` quite a lot in our check-{flake8,package,symbols}
rules, so they all fail (in various ways).

To fix this, we either need to fix the ownership or tell git to ignore
the situation. In either case, we'll need to run a scriptlet before all
our jobs.

Gitlab-ci allows to provide a global before_script, that is inherited by
all jobs. However, some of our jobs already declare a before_script, and
that would shadow the global before_script.

There is no technical reason to do our before_script separately from
the actual script, so we move the code from the before_scripts to the
corresponding scripts.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/misc/gitlab-ci.yml.in | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/support/misc/gitlab-ci.yml.in b/support/misc/gitlab-ci.yml.in
index 0ccf36665e..9c1faf0d5f 100644
--- a/support/misc/gitlab-ci.yml.in
+++ b/support/misc/gitlab-ci.yml.in
@@ -23,9 +23,8 @@
         - utils/check-symbols
 
 .defconfig_check:
-    before_script:
-        - DEFCONFIG_NAME=$(echo ${CI_JOB_NAME} | sed -e 's,_check$,,g')
     script:
+        - DEFCONFIG_NAME=$(echo ${CI_JOB_NAME} | sed -e 's,_check$,,g')
         - echo "Configure Buildroot for ${DEFCONFIG_NAME}"
         - make ${DEFCONFIG_NAME}
         - support/scripts/check-dotconfig.py .config configs/${DEFCONFIG_NAME}
@@ -44,10 +43,9 @@
       }
 
 .defconfig_base:
-    before_script:
+    script:
         - DEFCONFIG_NAME=${CI_JOB_NAME}
         - OUTPUT_DIR=output
-    script:
         - echo "Configure Buildroot for ${DEFCONFIG_NAME}"
         - make ${DEFCONFIG_NAME}
         - ./support/scripts/check-dotconfig.py .config ./configs/${DEFCONFIG_NAME}
@@ -72,13 +70,12 @@
             - runtime-test.log
 
 .runtime_test_base:
-    before_script:
-        - TEST_CASE_NAME=${CI_JOB_NAME}
     # Keep build directories so the rootfs can be an artifact of the job. The
     # runner will clean up those files for us.
     # Multiply every emulator timeout by 10 to avoid sporadic failures in
     # elastic runners.
     script:
+        - TEST_CASE_NAME=${CI_JOB_NAME}
         - echo "Starting runtime test ${TEST_CASE_NAME}"
         - ./support/testing/run-tests -o test-output/ -d test-dl/ -k --timeout-multiplier 10 ${TEST_CASE_NAME}
     artifacts:
@@ -91,9 +88,8 @@
 
 .test_pkg:
     stage: build
-    before_script:
-        - OUTPUT_DIR=${CI_JOB_NAME}
     script:
+        - OUTPUT_DIR=${CI_JOB_NAME}
         - echo "Configure Buildroot for ${OUTPUT_DIR}"
         - make O=${OUTPUT_DIR} syncconfig
         - make O=${OUTPUT_DIR} savedefconfig
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
