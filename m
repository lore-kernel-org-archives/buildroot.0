Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F21C25B78
	for <buildroot@archiver.kernel.org>; Tue,  4 Jun 2024 14:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1A2C81ED6;
	Tue,  4 Jun 2024 14:40:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jIyiAa20mG3q; Tue,  4 Jun 2024 14:40:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 775AE81EF2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 775AE81EF2;
	Tue,  4 Jun 2024 14:40:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4A5221BF86C
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 14:40:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3741440386
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 14:40:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MMNv7-_d2c9i for <buildroot@lists.busybox.net>;
 Tue,  4 Jun 2024 14:40:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E869405FA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E869405FA
 for <buildroot@buildroot.org>; Tue,  4 Jun 2024 14:40:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 02E0186BC2; Tue,  4 Jun 2024 14:40:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 4 Jun 2024 16:28:16 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 4816c095d834ba352f59a18bb13e2e5755262018
X-Git-Newrev: 2fcec25f6a82e3be4d0cfa947daca2174c89d01a
X-Patchwork-Hint: ignore
Message-Id: <20240604144020.02E0186BC2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/docker-compose:
 bump version
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

commit: https://git.buildroot.net/buildroot/commit/?id=2fcec25f6a82e3be4d0cfa947daca2174c89d01a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

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
(cherry picked from commit 1b189f54918b366a604a50686d5560e510beb531)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
