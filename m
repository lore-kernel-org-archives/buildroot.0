Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3BFBC3DA78
	for <buildroot@archiver.kernel.org>; Tue, 17 Jan 2023 09:35:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F23241811;
	Tue, 17 Jan 2023 09:35:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F23241811
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c97zLjMjCmWS; Tue, 17 Jan 2023 09:35:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A74841806;
	Tue, 17 Jan 2023 09:35:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A74841806
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BF1941BF2B1
 for <buildroot@lists.busybox.net>; Tue, 17 Jan 2023 09:34:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9BD8A417CB
 for <buildroot@lists.busybox.net>; Tue, 17 Jan 2023 09:34:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BD8A417CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dYiey4CcXLn1 for <buildroot@lists.busybox.net>;
 Tue, 17 Jan 2023 09:34:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70595417CE
 for <buildroot@buildroot.org>; Tue, 17 Jan 2023 09:34:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70595417CE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5EB6187C19; Tue, 17 Jan 2023 09:34:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 17 Jan 2023 10:26:11 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: a6a0b2c08fc08b634509c44f131807c4e675d21a
X-Git-Newrev: e18846284cafd8827872f02e9699102740988132
X-Patchwork-Hint: ignore
Message-Id: <20230117093419.5EB6187C19@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] fs/erofs: enable support
 for reproducible build
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

commit: https://git.buildroot.net/buildroot/commit/?id=e18846284cafd8827872f02e9699102740988132
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

By default, mkfs.erofs will use the current date to set some metadata
in the filesystem it generates, and will also use generate a random UUID
for that filesystem. This is not reproducible.

When BR2_REPRODUCIBLE is selected, set the filesystem timestamps to
$SOURCE_DATE_EPOCH, and the filesystem UUID to the nil uuid (as good
as any other arbitrary one).

Signed-off-by: Casey Reeves <casey@xogium.me>
[yann.morin.1998@free.fr:
  - one multi-line assignment, not two
  - slightly rephrase the commit log
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit ac5ecaf86809a999d68d851c2200705a8f10a7b0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 fs/erofs/erofs.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/erofs/erofs.mk b/fs/erofs/erofs.mk
index 0e9d4401a9..e43d74927b 100644
--- a/fs/erofs/erofs.mk
+++ b/fs/erofs/erofs.mk
@@ -10,6 +10,12 @@ ifeq ($(BR2_TARGET_ROOTFS_EROFS_LZ4HC),y)
 ROOTFS_EROFS_ARGS += -zlz4hc
 endif
 
+ifeq ($(BR2_REPRODUCIBLE),y)
+ROOTFS_EROFS_ARGS += \
+	-T $(SOURCE_DATE_EPOCH) \
+	-U 00000000-0000-0000-0000-000000000000
+endif
+
 ifneq ($(BR2_TARGET_ROOTFS_EROFS_PCLUSTERSIZE),0)
 ROOTFS_EROFS_ARGS += -C$(strip $(BR2_TARGET_ROOTFS_EROFS_PCLUSTERSIZE))
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
