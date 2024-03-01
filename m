Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2954C5475B
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 19:00:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C36881455;
	Fri,  1 Mar 2024 19:00:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0BE8dL5rUNEN; Fri,  1 Mar 2024 19:00:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F0368207B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F0368207B;
	Fri,  1 Mar 2024 19:00:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D108E1BF354
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 19:00:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD16041E3A
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 19:00:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wG80PgvZYF5w for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 19:00:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19F6241E0B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 19F6241E0B
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 19:00:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 008E187F50; Fri,  1 Mar 2024 19:00:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 1 Mar 2024 19:55:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1d6d8c32464459be08eff941a0e3c350c7ec343c
X-Git-Newrev: dee6974d729da81f80d310df262436a6136164a0
X-Patchwork-Hint: ignore
Message-Id: <20240301190012.008E187F50@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/redis: disable -Werror
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

commit: https://git.buildroot.net/buildroot/commit/?id=dee6974d729da81f80d310df262436a6136164a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
