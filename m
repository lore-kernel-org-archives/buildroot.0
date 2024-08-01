Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E563FC49EA1
	for <buildroot@archiver.kernel.org>; Thu,  1 Aug 2024 08:46:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B11AD81EC6;
	Thu,  1 Aug 2024 08:46:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RYtpoIFi2LvY; Thu,  1 Aug 2024 08:46:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61A1C81EC0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61A1C81EC0;
	Thu,  1 Aug 2024 08:46:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 655111BF3C5
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 08:46:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5039160F04
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 08:46:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xNGzr-8B1q7s for <buildroot@lists.busybox.net>;
 Thu,  1 Aug 2024 08:46:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.239;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DBC7960B59
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBC7960B59
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.239])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DBC7960B59
 for <buildroot@buildroot.org>; Thu,  1 Aug 2024 08:46:02 +0000 (UTC)
Received: from unknown (HELO opfedv3rlp0a.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 10:46:00 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0a.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 01 Aug 2024 10:46:00 +0200
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 10:45:58 +0200
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Thu, 01 Aug 2024 10:45:58 +0200
X-IronPort-AV: E=Sophos;i="6.09,254,1716242400"; d="scan'208";a="181887713"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Thu, 1 Aug 2024 10:45:49 +0200
Message-ID: <3032bdfc4a3844fce34cead9b19cfb65e5f416c6.1722501946.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722501946.git.yann.morin@orange.com>
References: <cover.1722501946.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.26.53]
X-ClientProxiedBy: OPE16NORMBX204.corporate.adroot.infra.ftgroup (10.115.26.9)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1722501963; x=1754037963;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+/7ZmMOv871gVst2Tfd8IzgrSizoGguxwJBP6sKok9k=;
 b=naypi/QVJfPX4VYjxF+jyTkkdtgp0+G00zjdMGb2AtHqxHEC2BN9vJDI
 t3vMhD3vjcD+yvp4XhaUCXZKnHU8EWsEjRFf0V656LYhdQXZy3GeR4epb
 L73ci4FNLkWG/FGyfjTYHfMFDeMvtTfTWQtquZkl1Tjs0FYlPnyWeY1YY
 WFTqF42J73skoABfyfLn+XuhNl0m0NuECJt46vLdUlS/IHY0bs3R5xgQZ
 S8Ygfiw65hh6MOX7wPVjF4JEey/yFfGEzVxArDSHtq5TsssdfbDpmTJkQ
 kLGr/SZBbODFOOg5Q07knLdR895H0uQxI/SF5cY8DkMlWBRBzqO1VHLBS
 Q==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=naypi/QV
Subject: [Buildroot] [PATCH 5/7] package/runc: needs CGO linking for host
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
Cc: yann.morin@orange.com, Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

The target variant depends on CGO linking, so propagate it to the host
variant as well.

Fixes: http://autobuild.buildroot.org/results/30b/30b81b6f84613296b9e1f162e5ddd7f25b89ba23/

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Christian Stewart <christian@aperture.us>
---
 package/runc/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/runc/Config.in.host b/package/runc/Config.in.host
index 78193cb499..96b05d0a1f 100644
--- a/package/runc/Config.in.host
+++ b/package/runc/Config.in.host
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_HOST_RUNC
 	bool "host runc"
 	depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_HOST_CGO_LINKING_SUPPORTS
 	select BR2_PACKAGE_HOST_GO
 	help
 	  runC is a CLI tool for spawning and running containers
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
