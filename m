Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC39C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 344AA61056;
	Tue, 21 Feb 2023 00:59:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 344AA61056
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dCaQrNtcOK7P; Tue, 21 Feb 2023 00:59:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E1DE610BE;
	Tue, 21 Feb 2023 00:59:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E1DE610BE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 24EB71BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:01:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48249610BB
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48249610BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QPExJSAnDeEL for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7AB766FB94
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7AB766FB94
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 72D978648F; Mon, 20 Feb 2023 20:52:36 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 16 Jan 2023 21:45:15 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 162f656884185662d85e5366871284adca87a465
X-Git-Newrev: ac5ecaf86809a999d68d851c2200705a8f10a7b0
X-Patchwork-Hint: ignore
Message-Id: <20230220205236.72D978648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] fs/erofs: enable support for
 reproducible build
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

commit: https://git.buildroot.net/buildroot/commit/?id=ac5ecaf86809a999d68d851c2200705a8f10a7b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

By default, mkfs.erofs will sue the current date to set some metadata
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
