Return-Path: <SRS0=/juA=P6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FDFDC433FE
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 08:25:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A81A860EE0
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 08:25:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A81A860EE0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79D0A81A46;
	Thu, 11 Nov 2021 08:25:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gN9GA7QuGy3v; Thu, 11 Nov 2021 08:25:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D06CB81A81;
	Thu, 11 Nov 2021 08:25:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9DF451BF282
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 08:25:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99F4D4043B
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 08:25:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2tFsXk2XrhW9 for <buildroot@lists.busybox.net>;
 Thu, 11 Nov 2021 08:25:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB5B940389
 for <buildroot@buildroot.org>; Thu, 11 Nov 2021 08:25:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id BFAA48B886; Thu, 11 Nov 2021 08:21:38 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 11 Nov 2021 09:24:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 51f30f47cd04efe494c8da37077bea860d3fbe14
X-Git-Newrev: 8ea6eead60091587e51c38df5d2b6c0f5652a0c6
X-Patchwork-Hint: ignore
Message-Id: <20211111082138.BFAA48B886@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts: don't build board
 defconfigs with Gitlab's pipelines trigged on tag
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

commit: https://git.buildroot.net/buildroot/commit/?id=8ea6eead60091587e51c38df5d2b6c0f5652a0c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently when a tag is added to the Buildroot git tree, the gitlab-ci
create a pipeline with several hundred of jobs (~750) to build all
defconfigs and execute the Buildroot testsuite.

However, there is only a limited number of gitlab-ci runner (9 runners)
and some jobs reach the timeout limit (24h) while waiting for a runner
[1]. Indeed, the Buildroot project doesn't use the Gitlab's shared
runners.

In addition to the pipeline created when a new tag is added to the
git repository, two pipelines are created each weeks to execute the
Buildroot testsuite (on monday [2]) and build all defconfigs (on
Thursday [3]).

At some point there are too many jobs waiting in gitlab due board
defconfigs builds. Indded a board defconfig requires a lot of time
(~30min) compared to other jobs in order to build a toolchain and a
kernel linux along with a basic rootfs. There is currently 262
defconfigs.

This is even worse when several pipelines are trigged at the same
time (new git tag and scheduled pipeline trigger).

In order to reduce the number of long jobs, don't build board
defconfigs with pipelines trigged on tag, keeping only the runtime
tests and the Qemu's defconfigs.

[1] https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966541
[2] https://gitlab.com/buildroot.org/buildroot/-/pipelines/404035190
[3] https://gitlab.com/buildroot.org/buildroot/-/pipelines/401685550

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/scripts/generate-gitlab-ci-yml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
index 7d09279bbd..8aaa456b03 100755
--- a/support/scripts/generate-gitlab-ci-yml
+++ b/support/scripts/generate-gitlab-ci-yml
@@ -36,6 +36,9 @@ gen_tests() {
              )
 
     if [ -n "${CI_COMMIT_TAG}" ]; then
+        # When a tag is added to the Buildroot git tree, we want
+        # to run the runtime tests and only test Qemu defconfigs.
+        defconfigs=( $(cd configs; LC_ALL=C ls -1 qemu_*_defconfig) )
         do_basics=true
         do_defconfigs=base
         do_runtime=true
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
