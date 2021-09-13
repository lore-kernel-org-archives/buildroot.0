Return-Path: <SRS0=n+Pr=OD=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B10A2C433EF
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 21:05:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77C2E610CE
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 21:05:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 77C2E610CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49B164030B;
	Mon, 13 Sep 2021 21:05:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tpsaTqAVUd3u; Mon, 13 Sep 2021 21:05:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE38840297;
	Mon, 13 Sep 2021 21:05:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2D3F51BF322
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 21:04:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7452B40297
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 21:04:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X1fkUounQUI2 for <buildroot@lists.busybox.net>;
 Mon, 13 Sep 2021 21:04:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 42F784030B
 for <buildroot@buildroot.org>; Mon, 13 Sep 2021 21:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1631567054;
 bh=s2z+Yrs7gr/fVo547hLlZ771fQ2XelsJ4kxIKF2MZ+c=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=du5z0IOC5BWEIZShUtLOD5ySffpjNjOMwWa1+SWDMbmO+dp3hXJHwkzTaA5fRdto8
 PGrK4e7tzoQ3oHrfeSAFelGvZ5RlYnaK+LgDqKrcjBCKLhBS+wXPLdy3tEvA7mfprJ
 MBNwOGeiJvzRW3E51FEzNWHXk1PtY9OnF7EGhQ0A=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.240]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MZktZ-1mSNYX0jBP-00Wq3K for <buildroot@buildroot.org>; Mon, 13 Sep 2021
 23:04:14 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Mon, 13 Sep 2021 23:04:09 +0200
Message-Id: <20210913210412.24042-11-ps.report@gmx.net>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210913210412.24042-1-ps.report@gmx.net>
References: <20210913210412.24042-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:TcfkDJEMCj0KNEmNR9evqnRgP0VS+sXJqa/2aT9P6jUoiGcf4Am
 567/x6c6O4PlqezaTPo7zP8XyJqQR5GnttpGU92ArE8VxNQSx3GqhJz4Ya3pao8wSdNCsDp
 5aIP5va/3ndUdCKr4OC6WJZ0PAxMPXY2yu/8V2yyhcawSpu47ES7hak1zWp9LcCGAZ1Lfgy
 X21txokFI1jJ2ikY//JKg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7LUIBTTmLHE=:MUj69w0u/Nhg5P2dXOp7mS
 aucjFtpAqmBNAshFvI4KclxQ4wu9KrFHgTGHfK9t7aJ0Lzk8ZGnNenfp4hfdPV6DSpgTJHj3K
 Q11VBWv5FZ6GRGTgmhsZxUrWUqPB+aUIxiGHfbG6sSWrLae7kS5oL1JrJS1X4H18k1mXI297X
 RH0Yp42kBEHSdkPW3Uh3Q3ITqLWPT3mfpzZjut0lfiX8qMA0kH0KHidjmWwj8Z41apep7y9Ql
 lXrimNcKVy7j7feMusxppe7CjR4ZrnVvI1gJaAqsBvAr9VvIRh2LPLFtJJUJS3TZqKx5BFUkJ
 EW6Rw+c/robB+mHxzPGdaxwLRlafS3DZc/5MntjR9iaP1OhD9F1h6TZwZAKXc+DkaZ0Q4PTzI
 dktAPuKg5P9qI5wUbf52Mf5/FRkZWrwWsNHlesXIWx4hSG+vgCiNcAmYuulyxUFSt9Sg4h61/
 MbBfNvDUAre+7G3JPJLBogMN3nugRsh75HBJAmO4mcCN5utxOBlDSprffbmfLepMqCJT+y0Z0
 PjIdEn79OUyHwAuHThkmqhFOSzmV03AyVj7nWnOJK5oTiaSR0JVK1hK2TRQp5qMqwIv79dH/s
 N5RjJVr+qEyojakfqDRfXarX4KEvCA8znRX4crPV+PVup+45T6wqKY6LC796dkAgfsxZiRV2P
 XD8bHscbXzk5l2jhoagoZqdc7ywxvwXTKxUUrDEJ5KMXIKvAxmBwW7CMfzPsnx2VxIXKJgPPX
 e51pE8XKd1Y/wtpSj/DSmFVs9Y/5J3tlD82VIw6qnyLCpTlKu05mqjOXW9wNXox2gulRA5oLK
 E/auekTxXyKCzYavXskPk7NEnASasm5ROPG3bpL4p3PBH6S9otRuuQHB0xxympZjSJfQo8TFl
 X2ukUdqUXbzUFABZtfmpOyibYXEQ3XDjWbJ0pgGkxvfCOp+mRDiAdII8Bjx9xDZ3HmgX07w2g
 uOj9/SHVkcQm842lusiv81w3dKjCbUCleLxP8znR5PNSZic3hluAzdVysukylT7DX1RbDzZur
 hijlBK3ETX4ntmMVmx6vUQ/G4l90hOfISHGZZKZi5RLQ8B7VeVA0K8VPH2MhdxtKM4oZXGI0i
 XdkX3VZyF8AMlI=
Subject: [Buildroot] [PATCH v1 10/13] package/gstreamer1-editing-services:
 bump version to 1.18.5
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 .../gstreamer1-editing-services.hash                          | 4 ++--
 .../gstreamer1-editing-services.mk                            | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
index 1795171ee2..daaf729c70 100644
--- a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
+++ b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
@@ -1,5 +1,5 @@
-# From https://gstreamer.freedesktop.org/src/gstreamer-editing-services/gst-editing-services-1.18.4.tar.xz.sha256sum
-sha256  4687b870a7de18aebf50f45ff572ad9e0138020e3479e02a6f056a0c4c7a1d04  gst-editing-services-1.18.4.tar.xz
+# From https://gstreamer.freedesktop.org/src/gstreamer-editing-services/gst-editing-services-1.18.5.tar.xz.sha256sum
+sha256  8af4a8394d051f3e18280686db49a6efaccc95c0c59a17f0f564e32000590df5  gst-editing-services-1.18.5.tar.xz
 
 # Hashes for license files:
 sha256  f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a  COPYING
diff --git a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
index e7f626ef7a..d3de79c5f6 100644
--- a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
+++ b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSTREAMER1_EDITING_SERVICES_VERSION = 1.18.4
+GSTREAMER1_EDITING_SERVICES_VERSION = 1.18.5
 GSTREAMER1_EDITING_SERVICES_SOURCE = gst-editing-services-$(GSTREAMER1_EDITING_SERVICES_VERSION).tar.xz
 GSTREAMER1_EDITING_SERVICES_SITE = https://gstreamer.freedesktop.org/src/gstreamer-editing-services
 GSTREAMER1_EDITING_SERVICES_LICENSE = LGPL-2.0+
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
