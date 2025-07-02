Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C631C77B7C
	for <buildroot@archiver.kernel.org>; Wed,  2 Jul 2025 13:07:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E88960AEA;
	Wed,  2 Jul 2025 13:07:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qNB9yXocYecx; Wed,  2 Jul 2025 13:07:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A68676088E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A68676088E;
	Wed,  2 Jul 2025 13:07:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D9B3196
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 13:07:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F7DC8446D
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 13:07:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p4XKh9tmMfm1 for <buildroot@buildroot.org>;
 Wed,  2 Jul 2025 13:07:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.122;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D0D688440A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0D688440A
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.122])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D0D688440A
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 13:07:26 +0000 (UTC)
X-CSE-ConnectionGUID: Kd591zMsRACb0EPd+xmalw==
X-CSE-MsgGUID: Yvke0qICRJmUgGSkpawgRw==
Received: from unknown (HELO opfedv1rlp0a.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 15:07:24 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0a.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 Jul 2025 15:07:24 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57;
 Wed, 2 Jul 2025 15:07:22 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Wed, 02 Jul 2025 15:07:22 +0200
X-CSE-ConnectionGUID: Pr3yPPPgQhmk2czDuXlIGg==
X-CSE-MsgGUID: ntFCVAZtSU6Ex2nY+Nf3Hw==
X-IronPort-AV: E=Sophos;i="6.16,281,1744063200"; d="scan'208";a="308928237"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>, Christian Stewart <christian@aperture.us>
Date: Wed, 2 Jul 2025 15:07:21 +0200
Message-ID: <d2b4cb336fca811329c1042f7b71e8fe9e146415.1751461630.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1751461630.git.yann.morin@orange.com>
References: <cover.1751461630.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX107.corporate.adroot.infra.ftgroup (10.115.27.4)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1751461647; x=1782997647;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Q/SUDvt39BwNmmtTfboGVYF8so3hDnRILsmbiuGVZYI=;
 b=oRM7u1qTPH7jVcC0YZr7G7y4l2bszLzIXZAQif65vHiE6SP3pPmP1bXr
 Zf6p8umJZ5KoVhro5vAu/eZFLefojHHeMov9sXxafVmyz6RbL7mLIZosy
 CtH4zFq1PWRiJDArmu1XGTyUJA3aImaehiWxstOHLMr/z9oAzPKEXXBoI
 7TJ2xUT6ahQUtxAotQoQ5B39HZjby7uMWPbHjsFxsSjreg/Wr8owtF7Ps
 ke5gppLOJENORfB0aEsV6UxEH+fuZwKZ4pXASaSHEO394DRg3XPUp7ga0
 XVvqh9xNE19Z98hoanFL3KYqGt8ksBiaGrKvJdMwc2QBWiXbGdm8cBDm2
 A==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=oRM7u1qT
Subject: [Buildroot] [PATCH 1/2] package/cni-plugins: enable sbr
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

From: "Yann E. MORIN" <yann.morin@orange.com>

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Christian Stewart <christian@aperture.us>
---
 package/cni-plugins/cni-plugins.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cni-plugins/cni-plugins.mk b/package/cni-plugins/cni-plugins.mk
index bccc1674aa..6d6260fa7c 100644
--- a/package/cni-plugins/cni-plugins.mk
+++ b/package/cni-plugins/cni-plugins.mk
@@ -25,6 +25,7 @@ CNI_PLUGINS_BUILD_TARGETS = \
 	plugins/meta/bandwidth \
 	plugins/meta/firewall \
 	plugins/meta/portmap \
+	plugins/meta/sbr \
 	plugins/meta/tuning \
 	plugins/meta/vrf
 CNI_PLUGINS_INSTALL_BINS = $(CNI_PLUGINS_BUILD_TARGETS)
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
