Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F2CCD4842
	for <buildroot@archiver.kernel.org>; Wed, 12 Nov 2025 20:32:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54DB340B9C;
	Wed, 12 Nov 2025 20:32:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lvjp3Sa1J7zz; Wed, 12 Nov 2025 20:32:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7AC6F40B70
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7AC6F40B70;
	Wed, 12 Nov 2025 20:32:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 83A8C158
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 20:32:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A73C8233E
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 20:32:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RuV_gAETS3hE for <buildroot@buildroot.org>;
 Wed, 12 Nov 2025 20:32:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5CD728233A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CD728233A
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5CD728233A
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 20:32:42 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1686824405; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 12 Nov 2025 20:32:40 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1vJHWB-0007Cz-1D;
 Wed, 12 Nov 2025 21:32:39 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org,
	"Yann E . MORIN" <yann.morin.1998@free.fr>
Date: Wed, 12 Nov 2025 21:32:26 +0100
Message-Id: <20251112203227.27573-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Rymmet6Pf0WCmvk9yFJC9YUf5SZio/7x+wDqaSftZ26BdT8fvIze52R5CayHXD/4QKWBJkpLwhXJboVyLb6mqA3X/OYOZ0M+EnXMnpk8FowUvVOomxKyIpkvr1BsPODJYiAgntGEL2beKlJQjmZ4g2pASs5RQxuXLQGPDYGDRMiSRAIZplluk0lmdgGiROuQrDISXR2jk/Ei5vQamkYSNpXFX4XulSmVJMOWGd0Yvenoyi61YM3qYbM+TzQOfCUK9We2UGbO7zBfZIydi2O8Z1VhpFe76NIT1FDZhninbx3lroX+os9y9s7nNM13T3S3FTHqlQ0z8A1mPDq9MnWK5Q==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=Er3u+t73lKl1kvseT5dWEOup9j3hqGbqDHls1Pc+FlA=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=Rymmet6P
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] docs/manual: fix typo in merged-bin details
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 6b53649bfa ("docs/manual: add merged-bin details to customize
rootfs") added a small typo, fix that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/customize-rootfs.adoc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/customize-rootfs.adoc b/docs/manual/customize-rootfs.adoc
index 5d8bcba778..4d03d04617 100644
--- a/docs/manual/customize-rootfs.adoc
+++ b/docs/manual/customize-rootfs.adoc
@@ -31,7 +31,7 @@ When +BR2_ROOTFS_MERGED_USR+ is enabled, then the overlay must not
 Additionally, when +BR2_ROOTFS_MERGED_BIN+ is enabled, then the overlay
   must not contain the '/usr/sbin' directory, as Buildroot will create
   it as a symbolic link to '/usr/bin'. In such a situation, should the
-  overlay have any program, they should be placed in '/usr/bin'.
+  overlay have any programs, they should be placed in '/usr/bin'.
 +
 As shown in xref:customize-dir-structure[], the recommended path for
   this overlay is +board/<company>/<boardname>/rootfs-overlay+.
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
