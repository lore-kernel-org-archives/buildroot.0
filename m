Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87668EB64DD
	for <buildroot@archiver.kernel.org>; Tue, 18 Jul 2023 21:05:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4692E61026;
	Tue, 18 Jul 2023 21:05:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4692E61026
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OBPobL7ECTzX; Tue, 18 Jul 2023 21:05:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40F856103F;
	Tue, 18 Jul 2023 21:05:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40F856103F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E2F231BF350
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 21:04:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C49D40650
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 21:04:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C49D40650
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0Jdh_LHMYgA1 for <buildroot@lists.busybox.net>;
 Tue, 18 Jul 2023 21:04:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B11440621
 for <buildroot@buildroot.org>; Tue, 18 Jul 2023 21:04:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B11440621
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 26CE487416; Tue, 18 Jul 2023 21:04:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 18 Jul 2023 23:03:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 873306199e55a9cfd5bd64c8ad9b526cf25a1466
X-Git-Newrev: 5f5ecb551f6e9e99732588a01cc1fd2eb952b56f
X-Patchwork-Hint: ignore
Message-Id: <20230718210433.26CE487416@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/misc/gitlab-ci.yml.in: add stage
 explicitely to each jobs
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

commit: https://git.buildroot.net/buildroot/commit/?id=5f5ecb551f6e9e99732588a01cc1fd2eb952b56f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

"stages" is curently not defined in the .gitlab-ci.yml file,
so the default pipeline stages are:

    .pre
    build
    test
    deploy
    .post

Since any jobs specify a stage, all jobs are assigned the "test"
stage [1]. All other stages defined by default are not used in the
gitlab-ci pipeline, they remain hidden.

In order to introduce a new custom stage, add the "test" stage
explicitely.

[1] https://docs.gitlab.com/ee/ci/yaml/#stages

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/misc/gitlab-ci.yml.in | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/support/misc/gitlab-ci.yml.in b/support/misc/gitlab-ci.yml.in
index cbb6e555ce..d8d6b3f410 100644
--- a/support/misc/gitlab-ci.yml.in
+++ b/support/misc/gitlab-ci.yml.in
@@ -1,27 +1,36 @@
+stages:
+  - test
+
 before_script:
   - git config --global --add safe.directory ${CI_PROJECT_DIR}
 
 .check-check-package_base:
+    stage: test
     script:
         - python3 -m pytest -v utils/checkpackagelib/
 
 .check-check-symbol_base:
+    stage: test
     script:
         - python3 -m pytest -v utils/checksymbolslib/
 
 .check-DEVELOPERS_base:
+    stage: test
     script:
         - utils/get-developers -v
 
 .check-package_base:
+    stage: test
     script:
         - make check-package
 
 .check-symbol_base:
+    stage: test
     script:
         - utils/check-symbols
 
 .defconfig_check:
+    stage: test
     script:
         - DEFCONFIG_NAME=$(echo ${CI_JOB_NAME} | sed -e 's,_check$,,g')
         - echo "Configure Buildroot for ${DEFCONFIG_NAME}"
@@ -42,6 +51,7 @@ before_script:
       }
 
 .defconfig_base:
+    stage: test
     script:
         - DEFCONFIG_NAME=${CI_JOB_NAME}
         - OUTPUT_DIR=output
@@ -69,6 +79,7 @@ before_script:
             - runtime-test.log
 
 .runtime_test_base:
+    stage: test
     # Keep build directories so the rootfs can be an artifact of the job. The
     # runner will clean up those files for us.
     # Multiply every emulator timeout by 10 to avoid sporadic failures in
@@ -86,7 +97,7 @@ before_script:
             - test-output/*/images/*
 
 .test_pkg:
-    stage: build
+    stage: test
     script:
         - OUTPUT_DIR=${CI_JOB_NAME}
         - echo "Configure Buildroot for ${OUTPUT_DIR}"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
