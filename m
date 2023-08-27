Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D997C83F01
	for <buildroot@archiver.kernel.org>; Sun, 27 Aug 2023 08:10:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FF3C60F99;
	Sun, 27 Aug 2023 08:10:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FF3C60F99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u8vd4iXOObzv; Sun, 27 Aug 2023 08:10:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36B2160B49;
	Sun, 27 Aug 2023 08:10:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36B2160B49
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DBBCF1BF316
 for <buildroot@lists.busybox.net>; Sun, 27 Aug 2023 08:10:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C2A3A60B49
 for <buildroot@lists.busybox.net>; Sun, 27 Aug 2023 08:10:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2A3A60B49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1YBj8LiLEiGN for <buildroot@lists.busybox.net>;
 Sun, 27 Aug 2023 08:10:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B24A860AA7
 for <buildroot@buildroot.org>; Sun, 27 Aug 2023 08:10:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B24A860AA7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9EC4986428; Sun, 27 Aug 2023 08:10:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 27 Aug 2023 10:09:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5acaac7122945c7588cf2328d928e1d4fb6488dd
X-Git-Newrev: e0166ecba0109f7f6757415afa7e7a67b058d406
X-Patchwork-Hint: ignore
Message-Id: <20230827081047.9EC4986428@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/misc/gitlab-ci.yml.in: retry a job
 only if it failed due to a runner issue
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

commit: https://git.buildroot.net/buildroot/commit/?id=e0166ecba0109f7f6757415afa7e7a67b058d406
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Each time a new pipeline is triggered, some jobs may fail due to
temporary issue with a Gitlab runner (network, power supply, docker or
maintainance).

Most of the problems are "runner system failure" [1] and require to
retart each failed jobs manually by maintainers to complete the
pipeline with only real failures if any.

The "retry" keyword allows to configure how many times a job is retried
if it fails. "retry:when" allows to retry a failed job only on
specific failure types like "runner_system_failure".

While at it, retry a job if it failed due to a timeout failure (this
timeout means that the job was pending for more than 24h) [2].

Such timeout failures occur on pipelines testing each Buildroot's
defconfig since there is not enough gitlab runner available to build
all of them within 24h.

Retry only jobs that are more likely to wait for a runner
(generate-gitlab-ci-yml, runtime_test_base, defconfig_base and test_pkg).

[1] https://gitlab.com/buildroot.org/buildroot/-/jobs/4936949397 (runner system failure)
[2] https://gitlab.com/buildroot.org/buildroot/-/jobs/4936949530 (timeout failure or the job got stuck)

https://docs.gitlab.com/ee/ci/yaml/#retrywhen

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                |  5 +++++
 support/misc/gitlab-ci.yml.in | 15 +++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index ed17bb14b9..3d7719568f 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -10,6 +10,11 @@ stages:
 generate-gitlab-ci-yml:
   stage: generate-gitlab-ci
   script: ./support/scripts/generate-gitlab-ci-yml support/misc/gitlab-ci.yml.in > generated-gitlab-ci.yml
+  retry:
+    max: 2
+    when:
+      - runner_system_failure
+      - stuck_or_timeout_failure
   artifacts:
     when: always
     paths:
diff --git a/support/misc/gitlab-ci.yml.in b/support/misc/gitlab-ci.yml.in
index 446132846f..4d9acbc3d3 100644
--- a/support/misc/gitlab-ci.yml.in
+++ b/support/misc/gitlab-ci.yml.in
@@ -67,6 +67,11 @@ before_script:
                 tail -200 runtime-test.log
                 exit 1
             }
+    retry:
+        max: 2
+        when:
+            - runner_system_failure
+            - stuck_or_timeout_failure
     artifacts:
         when: always
         expire_in: 2 weeks
@@ -99,6 +104,11 @@ before_script:
         - TEST_CASE_NAME=${CI_JOB_NAME}
         - echo "Starting runtime test ${TEST_CASE_NAME}"
         - ./support/testing/run-tests -o test-output/ -d test-dl/ -k --timeout-multiplier 10 ${TEST_CASE_NAME}
+    retry:
+        max: 2
+        when:
+            - runner_system_failure
+            - stuck_or_timeout_failure
     artifacts:
         when: always
         expire_in: 2 weeks
@@ -119,6 +129,11 @@ before_script:
     needs:
         - pipeline: $PARENT_PIPELINE_ID
           job: generate-gitlab-ci-yml
+    retry:
+        max: 2
+        when:
+            - runner_system_failure
+            - stuck_or_timeout_failure
     artifacts:
         when: always
         expire_in: 2 weeks
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
