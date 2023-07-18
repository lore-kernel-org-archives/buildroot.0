Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFCF7EB64DD
	for <buildroot@archiver.kernel.org>; Tue, 18 Jul 2023 21:04:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77FAB60A98;
	Tue, 18 Jul 2023 21:04:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77FAB60A98
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ks-Ucx7CCmuI; Tue, 18 Jul 2023 21:04:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A653060DF9;
	Tue, 18 Jul 2023 21:04:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A653060DF9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DFC621BF350
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 21:04:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 26B1740280
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 21:04:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 26B1740280
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iLm9OUN9Ok2l for <buildroot@lists.busybox.net>;
 Tue, 18 Jul 2023 21:04:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4A39140650
 for <buildroot@buildroot.org>; Tue, 18 Jul 2023 21:04:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A39140650
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 309E387417; Tue, 18 Jul 2023 21:04:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 18 Jul 2023 23:03:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5f5ecb551f6e9e99732588a01cc1fd2eb952b56f
X-Git-Newrev: 40fa607e5172159d9d54e6a6acc140d864240bc9
X-Patchwork-Hint: ignore
Message-Id: <20230718210433.309E387417@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/misc/gitlab-ci.yml.in: pass
 emulator builtin binaries as artifacts
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

commit: https://git.buildroot.net/buildroot/commit/?id=40fa607e5172159d9d54e6a6acc140d864240bc9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Notes: We can't use runtime_test_download job from the parent pipeline
(generate-gitlab-ci) since the artifacts archive size is limited to 5MB.
So introduce a new custom stage named "download" executed before "test"
stage. test-dl directory that contain downloaded files can be an
artifact of the job passed to all jobs of next stages.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4409032417

Runtime tested:
https://gitlab.com/kubu93/buildroot/-/pipelines/934319226

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/misc/gitlab-ci.yml.in          | 11 +++++++++++
 support/scripts/generate-gitlab-ci-yml |  1 +
 2 files changed, 12 insertions(+)

diff --git a/support/misc/gitlab-ci.yml.in b/support/misc/gitlab-ci.yml.in
index d8d6b3f410..446132846f 100644
--- a/support/misc/gitlab-ci.yml.in
+++ b/support/misc/gitlab-ci.yml.in
@@ -1,4 +1,5 @@
 stages:
+  - download
   - test
 
 before_script:
@@ -78,6 +79,16 @@ before_script:
             - output/build/*/.config
             - runtime-test.log
 
+.runtime_test_download:
+    stage: download
+    # Keep test-dl directory so the downloaded files can be an artifact of
+    # the job passed to all jobs of next stages.
+    script: ./support/testing/run-tests -d test-dl/ --prepare-only
+    artifacts:
+        when: always
+        paths:
+            - test-dl/
+
 .runtime_test_base:
     stage: test
     # Keep build directories so the rootfs can be an artifact of the job. The
diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
index ea4340f47c..2d922b9eb2 100755
--- a/support/scripts/generate-gitlab-ci-yml
+++ b/support/scripts/generate-gitlab-ci-yml
@@ -132,6 +132,7 @@ gen_tests() {
     fi
 
     if ${do_runtime:-false}; then
+        printf 'runtime_test_download: { extends: .runtime_test_download }\n'
         printf '%s: { extends: .runtime_test_base }\n' "${runtimes[@]}"
     fi
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
