Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A2B8C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:50:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1549161050
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:50:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1549161050
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF5F660641;
	Tue,  3 Aug 2021 23:50:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3n0eIauIkUBD; Tue,  3 Aug 2021 23:50:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 991E760A35;
	Tue,  3 Aug 2021 23:50:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4DDD81BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:17:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5939B40F53
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SRdqh3xFwOPb for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2758F40ED2
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 7BA9987059; Tue,  3 Aug 2021 21:10:09 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 19 Jul 2021 22:34:21 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 42bbabdda2d0c1604c8bd4d2a407561121436617
X-Git-Newrev: 90dfc0a59660020c21fdb5567e45d4edf3e66660
X-Patchwork-Hint: ignore
Message-Id: <20210803211009.7BA9987059@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] fs/erofs: add big pcluster
 support
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=90dfc0a59660020c21fdb5567e45d4edf3e66660
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This enables EROFS big pcluster images for buildroot.

Signed-off-by: Gao Xiang <hsiangkao@aol.com>
[yann.morin.1998@free.fr: must be a multiple of 4KiB]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 fs/erofs/Config.in | 10 ++++++++++
 fs/erofs/erofs.mk  |  4 ++++
 2 files changed, 14 insertions(+)

diff --git a/fs/erofs/Config.in b/fs/erofs/Config.in
index d7360edeab..e112572688 100644
--- a/fs/erofs/Config.in
+++ b/fs/erofs/Config.in
@@ -11,4 +11,14 @@ config BR2_TARGET_ROOTFS_EROFS_LZ4HC
 	help
 	  Use lz4 high-compression to compress data in the filesystem.
 
+config BR2_TARGET_ROOTFS_EROFS_PCLUSTERSIZE
+	int "pcluster size"
+	default 0
+	help
+	  Specify the maximum size of physical cluster in bytes, as a
+	  multiple of 4KiB, for the big pcluster feature in order to
+	  get much better compression ratios (thus better sequential
+	  read performance for common storage devices), which has been
+	  introduced since Linux 5.13.
+
 endif # BR2_TARGET_ROOTFS_EROFS
diff --git a/fs/erofs/erofs.mk b/fs/erofs/erofs.mk
index 58559d4833..0e9d4401a9 100644
--- a/fs/erofs/erofs.mk
+++ b/fs/erofs/erofs.mk
@@ -10,6 +10,10 @@ ifeq ($(BR2_TARGET_ROOTFS_EROFS_LZ4HC),y)
 ROOTFS_EROFS_ARGS += -zlz4hc
 endif
 
+ifneq ($(BR2_TARGET_ROOTFS_EROFS_PCLUSTERSIZE),0)
+ROOTFS_EROFS_ARGS += -C$(strip $(BR2_TARGET_ROOTFS_EROFS_PCLUSTERSIZE))
+endif
+
 define ROOTFS_EROFS_CMD
 	$(HOST_DIR)/bin/mkfs.erofs $(ROOTFS_EROFS_ARGS) $@ $(TARGET_DIR)
 endef
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
