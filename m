Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2373AC2BD09
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 14:24:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5364B40EB6;
	Tue,  9 Jul 2024 14:24:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0en_gtbALVIJ; Tue,  9 Jul 2024 14:24:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A973640EB9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A973640EB9;
	Tue,  9 Jul 2024 14:24:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8761A1BF27A
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 14:24:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7386040EAE
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 14:24:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XbxSIz4L8aRo for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 14:24:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.122;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0A68F40106
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A68F40106
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.122])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0A68F40106
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 14:24:05 +0000 (UTC)
Received: from unknown (HELO opfedv1rlp0g.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 16:24:05 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0g.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Jul 2024 16:24:06 +0200
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 16:24:04 +0200
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Tue, 09 Jul 2024 16:24:03 +0200
X-IronPort-AV: E=Sophos;i="6.09,195,1716242400"; d="scan'208";a="164598507"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Tue, 9 Jul 2024 16:23:58 +0200
Message-ID: <effa0ba6eca22dff2ee5ea73487beca485df6979.1720535037.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720535037.git.yann.morin@orange.com>
References: <cover.1720535037.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX406.corporate.adroot.infra.ftgroup
 (10.115.27.15) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1720535046; x=1752071046;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=68zV3hb+T6PWCRFKdAhtfX9fd5edkY1TuNCvPO4Rr7E=;
 b=AdcIv6qE2rikS8O5QRIp/FHKJKRg/XB91DyWOkkMcpOxm/rUqwiSvde9
 ip84wH+AOYK5450+8/583JPqy3G9i3y5nvXlWtL8NXKqSuOhm92R6tG6Y
 p+T4yzjbPypbUSsQnjg3a7Dp5gaO11gzpOlVReVMHg7cCXlKe8ig3JvL0
 3Uxm6EQ5kS+j0DAOqhkGCHaw8zQjYu1+FeyO+j3nNADciHEnK3QV1x/tQ
 rhBwj/aHV9Ygtia7q4Q33eEzpat9zP+mSpllLjhjSYsNrEV23GkUOwY78
 GdrZQIxjUy2GaL9PHGfm2z2f8WxRcRZl4dxfETLR/25btiB54MZSvgClu
 Q==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=AdcIv6qE
Subject: [Buildroot] [PATCH 2/5] package/gpsd: fix comment about wchar
 requirement
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
Cc: Bernd Kuhls <bernd@kuhls.net>, yann.morin@orange.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

The comment does not follow the coding style, so update it appropriately.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Bernd Kuhls <bernd@kuhls.net>
---
 package/gpsd/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
index 8c28c05efd..44615f4e43 100644
--- a/package/gpsd/Config.in
+++ b/package/gpsd/Config.in
@@ -84,7 +84,7 @@ config BR2_PACKAGE_GPSD_PYTHON
 	  Python libraries and tools for the gpsd service daemon
 	  including gpsfake test harness.
 
-comment "GPSD python support not available with toolchain w/o wide characters support"
+comment "python support needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
 
 comment "Protocols"
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
