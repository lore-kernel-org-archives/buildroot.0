Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B994BC433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 23:10:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A74F40236;
	Sat, 11 Dec 2021 23:10:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P2hsxNV-lo9w; Sat, 11 Dec 2021 23:10:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B05840291;
	Sat, 11 Dec 2021 23:10:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 02CA51BF297
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 23:06:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4717404C2
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 23:06:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id amkx3ikOyHyo for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 23:06:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BC5A5404BB
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 23:06:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5580882ABC; Sat, 11 Dec 2021 23:01:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 11 Dec 2021 23:58:43 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: c574f15e19c7afaf9451c832470afc53d541fab0
X-Git-Newrev: ae09da4d043aaaf7bac075da716b8ab09a230da8
X-Patchwork-Hint: ignore
Message-Id: <20211211230119.5580882ABC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] .gitlab-ci.yml: use the
 Docker image from gitlab registry
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

commit: https://git.buildroot.net/buildroot/commit/?id=ae09da4d043aaaf7bac075da716b8ab09a230da8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

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
(cherry picked from commit b3b4e270d15cf846cfef80421932b5f5892f2374)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .gitlab-ci.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 61194d4a54..af86c58f92 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -1,7 +1,7 @@
 # Configuration for Gitlab-CI.
 # Builds appear on https://gitlab.com/buildroot.org/buildroot/pipelines
 
-image: buildroot/base:20211120.1925
+image: $CI_REGISTRY/buildroot.org/buildroot/base:20211120.1925
 
 stages:
   - generate-gitlab-ci
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
