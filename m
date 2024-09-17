Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B6BC35FEA
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 07:05:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7095D40D97;
	Tue, 17 Sep 2024 07:05:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sp5MpqkszRLG; Tue, 17 Sep 2024 07:05:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36B2441805
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36B2441805;
	Tue, 17 Sep 2024 07:05:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 441A71BF29A
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 07:05:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3359341805
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 07:05:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nmj1Ez41XhaX for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 07:05:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.121;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A55EB40D97
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A55EB40D97
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.121])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A55EB40D97
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 07:05:38 +0000 (UTC)
Received: from unknown (HELO opfedv1rlp0h.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 09:05:36 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0h.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 17 Sep 2024 09:05:35 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Tue, 17 Sep 2024 09:05:34 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Tue, 17 Sep 2024 09:05:33 +0200
X-IronPort-AV: E=Sophos;i="6.10,234,1719871200"; d="scan'208";a="191942612"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Tue, 17 Sep 2024 09:05:33 +0200
Message-ID: <cf517426f7868af6c3e80e5016ac23759bf75290.1726556733.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1726556740; x=1758092740;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mRNu6UMsTPYYF9E09Eg8BV2r9Kel69Gto9hzwV8Y8Ig=;
 b=kHWxSZO1yLvUjdZHtU279rGTkuktJVNbIIwesHI+FeMjyjI5IL+k267m
 ijatdB2uQs2C8YDxCSuZ4NLEAOgX3lRcDTxuYWZbeLdUmOn7tfXbVwUwK
 4u0AzGPrClzhvCXWPF9ATgswySuicEBGgwf20WC5g3IsM8CbVQUPm++8D
 QZkC9S364bBToc0mBndGBI8Vm7hX1H4BZqzqtPOz1IMZdr7/foCrU+aKy
 iq9wjZjcvwfgNUO+gbCjpcZzfkGFx5sGyFXU/HO1ZkfW0MYU8VtB5UngC
 GwPyTp9mziqlzV+NzNZ4YlM8QYN0GDzRinase7HI3Bd8n7QH/B45X0ReZ
 g==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=kHWxSZO1
Subject: [Buildroot] [PATCH] package/go: ensure there is a host-go provider,
 take 2
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
Cc: yann.morin@orange.com, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

Commit 7b2a164b7460 (package/go/go-bin: new host-go provider) broke the
case for prompt-less, host-only go packages, as the main host-go symbol
would not be selected.

This very same use-case was initially broken when the first go-src
provider was introduced with fa2536ec9401 (package/go: make host package
a virtual package), and subsequently fixed in 99a5d51c6e9f (package/go:
ensure there is a host-go provider), so 7b2a164b7460 is causing a
regression of a fixed regression.

Fix that the very same way it was originally fixed.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Perale <thomas.perale@mind.be>
---
 package/go/Config.in.host | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index 30260b573b..7e354b3298 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -78,13 +78,13 @@ config BR2_PACKAGE_HOST_GO_BIN
 
 endchoice
 
+endif
+
 config BR2_PACKAGE_PROVIDES_HOST_GO
 	string
-	# Default to host-go-src
+	# Default to host-go-bin unless src explicitly requested
 	default "host-go-src" if BR2_PACKAGE_HOST_GO_SRC
-	default "host-go-bin" if BR2_PACKAGE_HOST_GO_BIN
-
-endif
+	default "host-go-bin"
 
 source "package/go/go-bin/Config.in.host"
 source "package/go/go-bootstrap-stage1/Config.in.host"
-- 
2.34.1

____________________________________________________________________________________________________________
Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
