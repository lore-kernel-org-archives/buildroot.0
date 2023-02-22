Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC77C636D6
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 16:36:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C4A641717;
	Wed, 22 Feb 2023 16:36:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C4A641717
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ntX0og_ysga5; Wed, 22 Feb 2023 16:36:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C05394171B;
	Wed, 22 Feb 2023 16:36:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C05394171B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 773D01BF847
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 16:35:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 51CB440BE0
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 16:35:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51CB440BE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7dLs5yp1LlfJ for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 16:35:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 83A87416ED
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 16:35:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83A87416ED
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 72F80867CA; Wed, 22 Feb 2023 16:35:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 17:22:28 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: b4027a4dddd92ab8b65c30733241a0a5751d3530
X-Git-Newrev: 45f5c85ee5eae562467b84a88b067fc57232952f
X-Patchwork-Hint: ignore
Message-Id: <20230222163531.72F80867CA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/postgresql: work
 around gcc bug 43744
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

commit: https://git.buildroot.net/buildroot/commit/?id=45f5c85ee5eae562467b84a88b067fc57232952f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Package postgresql suffers from gcc bug 43744 other than 85180, so let's
work around disabling compiler optimization for this gcc bug too.

Fixes:
http://autobuild.buildroot.net/results/cf272cdc5be2faf4070de3d235ec7a0f7190867a

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3def0679e3a424983354346eb517bbaa07b905df)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/postgresql/postgresql.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 502860bc99..549a47f42e 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -101,7 +101,7 @@ endif
 
 POSTGRESQL_CFLAGS = $(TARGET_CFLAGS)
 
-ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
+ifneq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_43744)$(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),)
 POSTGRESQL_CFLAGS += -O0
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
