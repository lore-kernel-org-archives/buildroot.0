Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD3EC3DA78
	for <buildroot@archiver.kernel.org>; Tue, 17 Jan 2023 09:42:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25E9881F67;
	Tue, 17 Jan 2023 09:42:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25E9881F67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9cAxXhvYxa4F; Tue, 17 Jan 2023 09:42:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CE7E81EFE;
	Tue, 17 Jan 2023 09:42:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CE7E81EFE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 739C01BF2B1
 for <buildroot@lists.busybox.net>; Tue, 17 Jan 2023 09:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4657541769
 for <buildroot@lists.busybox.net>; Tue, 17 Jan 2023 09:40:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4657541769
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YjR1kGS1sd6p for <buildroot@lists.busybox.net>;
 Tue, 17 Jan 2023 09:40:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 46BEC41780
 for <buildroot@buildroot.org>; Tue, 17 Jan 2023 09:40:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46BEC41780
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3670B87C3D; Tue, 17 Jan 2023 09:40:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 17 Jan 2023 10:25:59 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 50952c56ef133730004c9a9af543ed1831ecbcb4
X-Git-Newrev: bcb39cdd583096d5f9ec576c1ec8a9930dacb85c
X-Patchwork-Hint: ignore
Message-Id: <20230117094050.3670B87C3D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] fs/erofs: enable support
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

commit: https://git.buildroot.net/buildroot/commit/?id=bcb39cdd583096d5f9ec576c1ec8a9930dacb85c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

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
