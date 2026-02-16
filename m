Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 475F4E7BD80
	for <buildroot@archiver.kernel.org>; Mon, 16 Feb 2026 09:54:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDC0960B49;
	Mon, 16 Feb 2026 09:54:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N3Zqhmfgs_WF; Mon, 16 Feb 2026 09:54:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6C8560840
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771235658;
	bh=6Ohl1dVUiq+54NO4hkH228QD6q5J9wjsc9h1B4mqKzc=;
	h=From:To:CC:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dyXsGMDTsPxU42uJiIAmEWCaTIXxKMGa3TA+GmX9Eq5gqXO357Uh1L3KFNdIumfbY
	 q4KDdSS52YXpry2ilhxzYvJXXGy6uBitK4WJ/iRmm5STf5uRaWbO11ZyJEaifNtdHg
	 KhZHJ9Ug5vEGLICS7cXtVnmYSiCYYQwd88rp+Hi96Xgr6fR3Xo7XULYYEt3/EhzIEb
	 y4wOro/OEl09xBSL/1hri5ngFFP1NFqofdUcRd/7QhJYZVH/+zA6BHrqzrxwc2upnG
	 6c2ozFUJOECR8P00asAh6HAG+Qol20yDIJlvXJekhHwg7H0fNKqlmMmRPCoVt60SbE
	 KjbQJKPMYjUAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6C8560840;
	Mon, 16 Feb 2026 09:54:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A05F235B
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 09:54:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 81E3640C05
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 09:54:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Obdn2HTo797w for <buildroot@buildroot.org>;
 Mon, 16 Feb 2026 09:54:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.124;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 82E2E40B2E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82E2E40B2E
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 82E2E40B2E
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 09:54:15 +0000 (UTC)
X-CSE-ConnectionGUID: qR0dklUrRfKWZ6e1QCl0HA==
X-CSE-MsgGUID: L91b9QKQRz2kWUYHXHy2Jg==
Received: from unknown (HELO opfedv3rlp0f.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 16 Feb 2026 10:54:13 +0100
Received: from unknown (HELO OPE16NORMBX503.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0f.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 10:54:13 +0100
Received: from OPE16NORMBX301.corporate.adroot.infra.ftgroup [x.x.x.x] by
 OPE16NORMBX503.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.37; Mon, 16 Feb 2026 10:54:12 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX301.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61;
 Mon, 16 Feb 2026 10:54:10 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Mon, 16 Feb 2026 10:54:10 +0100
X-CSE-ConnectionGUID: UViz+YXpTW2q3VVSctRhgw==
X-CSE-MsgGUID: sQimPv3pSF26li3PTpru6A==
X-IronPort-AV: E=Sophos;i="6.21,202,1763420400"; d="scan'208";a="392898671"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>
Date: Mon, 16 Feb 2026 10:54:10 +0100
Message-ID: <731645eba72ecb0cba41a28b5faa257c3db0c2bc.1771235650.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.115.26.51]
X-ClientProxiedBy: OPE16NORMBX604.corporate.adroot.infra.ftgroup
 (10.115.26.32) To OPE16NORMBX301.corporate.adroot.infra.ftgroup
 (10.115.26.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1771235656; x=1802771656;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=F5F+Eihk+RyBFk0TBJUynBaKjyk8n3VtcHADAfYSvCg=;
 b=Ia+Rgc5mUOL3FmHE6NT3zJeeWw3V+DwFwEhVxo++CkgY26XEDZG+b/Ki
 iwrzP79Ny2xJLufEuNHXro9I3N73NSfIaV0dfbUEnSnfGAoLZg9D3eTkN
 OZf4U7ADVFF22LZiAMKx2Dy3yQMYHDA6wpzo3Z+t+eNulht9m0EaZXFu9
 gubn0aFuQU0tYOp6kzBlOwFQeeMtHsXZU1ZxWDEiEfwUwTCBtTHygEcyz
 QCMk+urcJSp3U2l2V7yN33S8HMilkK7zGZXfv7vtz/fk8DEsdkGdAyVFG
 GqnvPNF14jI3z3kuswSFbepOGl0jgnXnUmWqEOMWda7cqYEfdVSrBS0NW
 A==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=Ia+Rgc5m
Subject: [Buildroot] [PATCH] package/skopeo: bump to 1.22.0
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

Release notes:
https://github.com/containers/skopeo/releases/tag/v1.22.0

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
---
 package/skopeo/skopeo.hash | 2 +-
 package/skopeo/skopeo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/skopeo/skopeo.hash b/package/skopeo/skopeo.hash
index 4a1bcfa0f1..72b5b07801 100644
--- a/package/skopeo/skopeo.hash
+++ b/package/skopeo/skopeo.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f76eeddf697a3cc7a872e3077ab4d0fdbebe9f3c6171462e3e9feb84368b3fac  skopeo-1.21.0-go2.tar.gz
+sha256  dc9aa749973b10d3c2672d2839e61bac75cf32d5e5106463420b83653c9df3ff  skopeo-1.22.0-go2.tar.gz
 sha256  716a8b80635c394681e652823e1e42e411ad2d254e1f202403422d74f4b0b106  LICENSE
diff --git a/package/skopeo/skopeo.mk b/package/skopeo/skopeo.mk
index d534a04813..2dcad871df 100644
--- a/package/skopeo/skopeo.mk
+++ b/package/skopeo/skopeo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SKOPEO_VERSION = 1.21.0
+SKOPEO_VERSION = 1.22.0
 SKOPEO_SITE = $(call github,containers,skopeo,v$(SKOPEO_VERSION))
 
 SKOPEO_LICENSE = Apache-2.0
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
