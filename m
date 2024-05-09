Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAAC9C10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 20:46:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A04BC6131B;
	Thu,  9 May 2024 20:46:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BVbUtpLM9kMQ; Thu,  9 May 2024 20:46:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B74A361312
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B74A361312;
	Thu,  9 May 2024 20:46:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2F6E21BF98E
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:46:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C5D0612F4
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:46:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 50XBrq_oaxnj for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 20:46:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06931612DC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 06931612DC
 for <buildroot@buildroot.org>; Thu,  9 May 2024 20:46:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F165386A98; Thu,  9 May 2024 20:46:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 22:44:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0bab157dc835c1b304b0ba8773111914e9949447
X-Git-Newrev: 1b189f54918b366a604a50686d5560e510beb531
X-Patchwork-Hint: ignore
Message-Id: <20240509204627.F165386A98@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/docker-compose: bump version
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1b189f54918b366a604a50686d5560e510beb531
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The current version of docker-compose is un-vendorable, because the
dependencies it referenmces (directly or indirectly) are not available:

go: github.com/docker/compose/v2/cmd/compose imports
        github.com/moby/buildkit/util/progress/progressui:
        github.com/crazy-max/buildkit@v0.7.1-0.20240130133234-d9aa289bd124:
        invalid version: unknown revision d9aa289bd124

And indeed, that commit does not exist in that repository. The v0.7.1
tag does exist, but there is not commit that matches the short hash
d9aa289bd124, or even the whole version string. Sigh...

There is no way anyone can vendor the version we currently package, and
all they and us can hope for is that we never lose s.b.o ever.

Bump the version. That one can be vendored. Well, at least it can
_still_ be vendored _now_...

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/docker-compose/docker-compose.hash | 2 +-
 package/docker-compose/docker-compose.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-compose/docker-compose.hash b/package/docker-compose/docker-compose.hash
index ca3d08cf63..d55e35eb16 100644
--- a/package/docker-compose/docker-compose.hash
+++ b/package/docker-compose/docker-compose.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  931bfcc34eb43106be07787372bb853d4cd82830a5785f3049c5192ab0e4ac35  docker-compose-2.24.7.tar.gz
+sha256  105328838a48dad4a305903c5ae98b928e8a4ea3546e1711690e9eef7e0232be  docker-compose-2.26.1.tar.gz
 sha256  58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  LICENSE
diff --git a/package/docker-compose/docker-compose.mk b/package/docker-compose/docker-compose.mk
index 5417ba2d4f..66a88ac7e7 100644
--- a/package/docker-compose/docker-compose.mk
+++ b/package/docker-compose/docker-compose.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_COMPOSE_VERSION = 2.24.7
+DOCKER_COMPOSE_VERSION = 2.26.1
 DOCKER_COMPOSE_SITE = $(call github,docker,compose,v$(DOCKER_COMPOSE_VERSION))
 DOCKER_COMPOSE_LICENSE = Apache-2.0
 DOCKER_COMPOSE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
