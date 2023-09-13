Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8318EEE0207
	for <buildroot@archiver.kernel.org>; Wed, 13 Sep 2023 19:31:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E7DB83312;
	Wed, 13 Sep 2023 19:31:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E7DB83312
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PJMW1sQBIhJb; Wed, 13 Sep 2023 19:31:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7547D8330B;
	Wed, 13 Sep 2023 19:31:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7547D8330B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C1B281BF283
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 19:30:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 760B160AD6
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 19:30:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 760B160AD6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V4Emy4xTm6fV for <buildroot@lists.busybox.net>;
 Wed, 13 Sep 2023 19:30:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8892061089
 for <buildroot@buildroot.org>; Wed, 13 Sep 2023 19:30:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8892061089
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 76D0386E72; Wed, 13 Sep 2023 19:30:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 13 Sep 2023 21:28:10 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 36f536a027b87fb7f903630268c83217f101d1ec
X-Git-Newrev: 005bb5430d0b14e3161b5c136e35f4e2ddc8d5c3
X-Patchwork-Hint: ignore
Message-Id: <20230913193023.76D0386E72@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x]
 support/misc/gitlab-ci.yml.in: retry a job only if it failed due to a
 runner issue
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=005bb5430d0b14e3161b5c136e35f4e2ddc8d5c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

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
(cherry picked from commit e0166ecba0109f7f6757415afa7e7a67b058d406)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
index cbb6e555ce..bc8d63992b 100644
--- a/support/misc/gitlab-ci.yml.in
+++ b/support/misc/gitlab-ci.yml.in
@@ -56,6 +56,11 @@ before_script:
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
@@ -77,6 +82,11 @@ before_script:
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
@@ -97,6 +107,11 @@ before_script:
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
