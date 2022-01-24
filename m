Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A56C433F5
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 10:42:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 893A460E28;
	Mon, 24 Jan 2022 10:42:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id In_IK9ps19H4; Mon, 24 Jan 2022 10:42:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD88D60E34;
	Mon, 24 Jan 2022 10:42:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BA5BB1BF97D
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 10:42:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A914C40168
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 10:42:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=studio-punkt.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YdyaK89fp5rg for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 10:42:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from studio-punkt.com (studio-punkt.com [37.221.193.131])
 by smtp4.osuosl.org (Postfix) with ESMTP id 08C5740167
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 10:41:59 +0000 (UTC)
Received: from localhost.localdomain (pd9e2b73d.dip0.t-ipconnect.de
 [217.226.183.61])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by studio-punkt.com (Postfix) with ESMTPSA id 3C176120EE6;
 Mon, 24 Jan 2022 11:41:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=studio-punkt.com;
 s=dkim; t=1643020919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+SCbtFcalM4ez/9ctezv1QL8RVYvMT5rqkS+FragyxY=;
 b=EFhtw9JSJJfikJ+Cu7rtP3ffdbKC2oWN0gzIpegOtBga6IHQfniRZuRJe10Ak1MCIWSxEX
 id8A1sjH1wjpiKbHnElgzMphq++GGpXghcmbcTTe3reUtd55TRcJsy94bDYWFkU5cB1c9F
 vH1X05h20G3sXKn161PqnPHq2Q1iKIk=
To: buildroot@buildroot.org
Date: Mon, 24 Jan 2022 11:41:16 +0100
Message-Id: <20220124104116.12902-2-evgeni@studio-punkt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220124104116.12902-1-evgeni@studio-punkt.com>
References: <20220124104116.12902-1-evgeni@studio-punkt.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] fs: fix /tmp and /run clean-up in POSIX
 shells
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
From: Evgeni Dobrev via buildroot <buildroot@buildroot.org>
Reply-To: Evgeni Dobrev <evgeni@studio-punkt.com>
Cc: Evgeni Dobrev <evgeni@studio-punkt.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In POSIX sh, ^ in place of ! in glob bracket expressions
is undefined.

Signed-off-by: Evgeni Dobrev <evgeni@studio-punkt.com>
---
 fs/common.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/common.mk b/fs/common.mk
index 45beb5ae7b..64a94d9ad8 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -186,7 +186,7 @@ $$(BINARIES_DIR)/$$(ROOTFS_$(2)_FINAL_IMAGE_NAME): $$(ROOTFS_$(2)_DEPENDENCIES)
 
 	$$(foreach hook,$$(ROOTFS_$(2)_PRE_GEN_HOOKS),\
 		$$(call PRINTF,$$($$(hook))) >> $$(FAKEROOT_SCRIPT)$$(sep))
-	echo "rm -rf $$(TARGET_DIR)/run/* $$(TARGET_DIR)/run/.[^.]* $$(TARGET_DIR)/tmp/* $$(TARGET_DIR)/tmp/.[^.]*" >> $$(FAKEROOT_SCRIPT)
+	echo "rm -rf $$(TARGET_DIR)/run/* $$(TARGET_DIR)/run/.[!.]* $$(TARGET_DIR)/tmp/* $$(TARGET_DIR)/tmp/.[!.]*" >> $$(FAKEROOT_SCRIPT)
 	$$(call PRINTF,$$(ROOTFS_REPRODUCIBLE)) >> $$(FAKEROOT_SCRIPT)
 	$$(call PRINTF,$$(ROOTFS_SELINUX)) >> $$(FAKEROOT_SCRIPT)
 	$$(call PRINTF,$$(ROOTFS_$(2)_CMD)) >> $$(FAKEROOT_SCRIPT)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
