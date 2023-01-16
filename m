Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 613EAC54EBE
	for <buildroot@archiver.kernel.org>; Mon, 16 Jan 2023 08:34:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 059D5404F4;
	Mon, 16 Jan 2023 08:34:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 059D5404F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SKffuM-NYtNl; Mon, 16 Jan 2023 08:34:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 051D3404CA;
	Mon, 16 Jan 2023 08:34:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 051D3404CA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 06BD11BF2B6
 for <buildroot@lists.busybox.net>; Mon, 16 Jan 2023 08:34:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE669404CA
 for <buildroot@lists.busybox.net>; Mon, 16 Jan 2023 08:34:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE669404CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZbRgCs8Ux27O for <buildroot@lists.busybox.net>;
 Mon, 16 Jan 2023 08:34:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE5A3404BF
Received: from mail.xogium.me (mail.xogium.me [107.167.81.91])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE5A3404BF
 for <buildroot@buildroot.org>; Mon, 16 Jan 2023 08:33:59 +0000 (UTC)
Received: from ganimede.. (2a02-8428-324d-2201-5ccf-c338-3098-6959.rev.sfr.net
 [IPv6:2a02:8428:324d:2201:5ccf:c338:3098:6959])
 by mail.xogium.me (Postfix) with ESMTPSA id 89772F4075E;
 Mon, 16 Jan 2023 03:33:58 -0500 (EST)
From: Casey Reeves <casey@xogium.me>
To: buildroot@buildroot.org
Date: Mon, 16 Jan 2023 09:33:52 +0100
Message-Id: <20230116083352.160100-1-casey@xogium.me>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=xogium.me; s=xogium-mail; t=1673858039;
 bh=n2cpHKNYBdIsyQoI7ZbyY7tLzcM8SprWXOxkR9AshjY=;
 h=From:To:Cc:Subject:Date;
 b=MZRjkahLiHT6xoUHxP8tKbQhzcMYA1905Fa+lFbsiCoDOWplJtiDiby8h2nFs81oL
 s14Y4ycBu0WCwqTMQ33+YUOrgZ6JCxxH/+GEgwmmUimoDep7Os2j5eDy2KLwUTznQf
 wtxDcr/Iul8TKT9nBFwCTtstCAnpgINBa6pJyqvWeFgwhPpytM6Prx5WY9M6pccwgT
 0mFuGj4AFU1JIS6rmoQDDiH/E2Dlnl/ZzTzF5hHoYDQc4wmwCGeTuDjABheF7ZALgr
 bJ8vgGUb+mADnRuo2w/kbZDW0U/fyPj/v9yIvveReUSw2Reg5UCmb228JzyNbaPECr
 Xi0QfHjMReMjw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=xogium.me header.i=@xogium.me
 header.a=rsa-sha256 header.s=xogium-mail header.b=MZRjkahL
Subject: [Buildroot] [PATCH] fs/erofs: enable support for reproducible build
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
Cc: Casey Reeves <casey@xogium.me>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When BR2_REPRODUCIBLE is selected, this sets the filesystem timestamps
to $SOURCE_DATE_EPOCH.

It also sets the filesystem UUID to the nil uuid, to ensure a random one
isn't picked during generation.

Signed-off-by: Casey Reeves <casey@xogium.me>
---
 fs/erofs/erofs.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/erofs/erofs.mk b/fs/erofs/erofs.mk
index 0e9d4401a9..5567cd43ef 100644
--- a/fs/erofs/erofs.mk
+++ b/fs/erofs/erofs.mk
@@ -10,6 +10,11 @@ ifeq ($(BR2_TARGET_ROOTFS_EROFS_LZ4HC),y)
 ROOTFS_EROFS_ARGS += -zlz4hc
 endif
 
+ifeq ($(BR2_REPRODUCIBLE),y)
+ROOTFS_EROFS_ARGS += -T $(SOURCE_DATE_EPOCH)
+ROOTFS_EROFS_ARGS += -U 00000000-0000-0000-0000-000000000000
+endif
+
 ifneq ($(BR2_TARGET_ROOTFS_EROFS_PCLUSTERSIZE),0)
 ROOTFS_EROFS_ARGS += -C$(strip $(BR2_TARGET_ROOTFS_EROFS_PCLUSTERSIZE))
 endif
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
