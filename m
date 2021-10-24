Return-Path: <SRS0=WrHH=PM=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0677C433F5
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 14:12:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 827A360E98
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 14:12:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 827A360E98
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CAED80F38;
	Sun, 24 Oct 2021 14:12:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ipSf5r8D4iSX; Sun, 24 Oct 2021 14:12:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC10380F30;
	Sun, 24 Oct 2021 14:12:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 729451BF47D
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 14:12:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6FC5E80F30
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 14:12:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BtMsaZ15JY63 for <buildroot@lists.busybox.net>;
 Sun, 24 Oct 2021 14:12:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B82F480F2D
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 14:12:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 08D3B8861A; Sun, 24 Oct 2021 14:09:37 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 24 Oct 2021 16:12:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 86b77153b23fcf6b2bcb19a552cbe302c89a6171
X-Git-Newrev: b3b4e270d15cf846cfef80421932b5f5892f2374
X-Patchwork-Hint: ignore
Message-Id: <20211024140937.08D3B8861A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] .gitlab-ci.yml: use the Docker image from
 gitlab registry
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

commit: https://git.buildroot.net/buildroot/commit/?id=b3b4e270d15cf846cfef80421932b5f5892f2374
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

From [1]:
"In November 2020, Docker introduced rate limits on pull requests from
Docker Hub [2]. If your GitLab CI/CD configuration uses an image from
Docker Hub, each time a job runs, it may count as a pull request."

Since then, some jobs in our gitlab-ci fail when this rate limits is
reached [3].

To avoid this rate limit, move our Docker image from dockerhub to the
registry provided by gitlab. Keeping the image from dockerhub would be
possible by using dependency proxy [4] but the gitlab registry is good
enough.

Tested on gitlab:
https://gitlab.com/kubu93/buildroot/-/jobs/1694863584

[1] https://docs.gitlab.com/ee/user/packages/container_registry/index.html
[2] https://docs.docker.com/docker-hub/download-rate-limit/
[3] https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590417
[4] https://docs.gitlab.com/ee/user/packages/dependency_proxy

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 150b8eac1a..dc45744a81 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -1,7 +1,7 @@
 # Configuration for Gitlab-CI.
 # Builds appear on https://gitlab.com/buildroot.org/buildroot/pipelines
 
-image: buildroot/base:20210922.2200
+image: $CI_REGISTRY/buildroot.org/buildroot/base:20210922.2200
 
 stages:
   - generate-gitlab-ci
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
