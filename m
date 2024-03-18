Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E33C54E58
	for <buildroot@archiver.kernel.org>; Mon, 18 Mar 2024 13:33:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 516B440AB5;
	Mon, 18 Mar 2024 13:33:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QiSDXQCtCXXw; Mon, 18 Mar 2024 13:33:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE47240A53
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DE47240A53;
	Mon, 18 Mar 2024 13:33:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4021A1BF363
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 13:32:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99B9840608
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 13:32:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MLFtRpAZSRCr for <buildroot@lists.busybox.net>;
 Mon, 18 Mar 2024 13:32:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CDEC3408A5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CDEC3408A5
 for <buildroot@buildroot.org>; Mon, 18 Mar 2024 13:32:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BC50E82ADD; Mon, 18 Mar 2024 13:32:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 18 Mar 2024 14:30:36 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 50ae04570bff48734154104f79f3a8ddda8bf3fd
X-Git-Newrev: e7249d3e2df43d0ad1141e48a6fb3547a29ddc39
X-Patchwork-Hint: ignore
Message-Id: <20240318133246.BC50E82ADD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/redis: disable
 -Werror
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

commit: https://git.buildroot.net/buildroot/commit/?id=e7249d3e2df43d0ad1141e48a6fb3547a29ddc39
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Disable -Werror to avoid the following build failure raised since bump
to version 7.2.1 in commit d49f53f8aaf0bff9c8d04c16485c844fef2832d0 and
https://github.com/redis/redis/commit/8e138ba44fc3eb676c0f31faac19d1acc6a4c7ed:

In function 'hi_sdsll2str',
    inlined from 'hi_sdsfromlonglong' at sds.c:500:15:
sds.c:457:12: error: writing 1 byte into a region of size 0 [-Werror=stringop-overflow=]
  457 |         *s = *p;
      |         ~~~^~~~

Fixes: d49f53f8aaf0bff9c8d04c16485c844fef2832d0
 - http://autobuild.buildroot.org/results/fdc9f940b348430cb4da8efecc5cc047b21df281
 - http://autobuild.buildroot.org/results/e5747674d52b065203a0442f7cab13e8be5f426b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit dee6974d729da81f80d310df262436a6136164a0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/redis/redis.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 09a3b9448b..2680b11b74 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -30,7 +30,7 @@ endif
 # https://github.com/antirez/redis/pull/609).  We set PREFIX
 # instead.
 REDIS_BUILDOPTS = $(TARGET_CONFIGURE_OPTS) \
-	PREFIX=$(TARGET_DIR)/usr MALLOC=libc
+	PREFIX=$(TARGET_DIR)/usr MALLOC=libc WARNINGS=
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 REDIS_DEPENDENCIES += systemd
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
