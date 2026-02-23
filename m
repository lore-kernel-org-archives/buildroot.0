Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8088EEA4FC4
	for <buildroot@archiver.kernel.org>; Mon, 23 Feb 2026 14:17:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E260940A33;
	Mon, 23 Feb 2026 14:17:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F_j1uYvYDNeM; Mon, 23 Feb 2026 14:17:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4F7F40A08
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771856274;
	bh=QlpSmlHMRpt9kjtTIlBISKkWK44TJ2Gu3lksG3TIUdg=;
	h=From:To:CC:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W9zayLM04s2erg2xmcMMH43xHpRhBnR3Yj8YkphadOnBMKfDUnpP61isSA4t0f77H
	 nf3m0WyzxoQBb/oXGeantV67xuJHdPPKDFHB8D2IbsTEd4QQkVyHD92hITRiohKOJ4
	 LGf/CvGQcUP2OzNIaZ6johJBv4/OZcIVuz6R4WVviVOfR2aaV+p1tIbuJTeKsivVbJ
	 HFm6ChW9b97q9DMROw/aNM+5YJUEvsNHf4mLOdh4V2weamboKAnfGKszf9jNZ8OjDK
	 R1r3TeHHC1+QI7G36Swm73T2YcTfrcuowE364QvIOTY6Wxqvo+Ook+j260g/obPgoQ
	 cihIoaXSJ79LQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4F7F40A08;
	Mon, 23 Feb 2026 14:17:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D2301CE
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 14:17:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0DF1A842A6
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 14:17:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nh4Ur6LZzWhf for <buildroot@buildroot.org>;
 Mon, 23 Feb 2026 14:17:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.239;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 11AA7842A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11AA7842A8
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.239])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 11AA7842A8
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 14:17:51 +0000 (UTC)
X-CSE-ConnectionGUID: 9UwZrMkjR9+lDpWZeHJuOw==
X-CSE-MsgGUID: os/lEW/cSiie41HcQqs8qg==
Received: from unknown (HELO opfedv3rlp0g.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 23 Feb 2026 15:17:51 +0100
Received: from unknown (HELO OPE16NORMBX503.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0g.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 15:17:51 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX503.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37;
 Mon, 23 Feb 2026 15:17:49 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Mon, 23 Feb 2026 15:17:48 +0100
X-CSE-ConnectionGUID: jV9iU14ZSe2OZhYARwESMw==
X-CSE-MsgGUID: xlBGv3acTPm9iH8fs9BAtQ==
X-IronPort-AV: E=Sophos;i="6.21,306,1763420400"; d="scan'208";a="395647810"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>, Danomi Manchego <danomimanchego123@gmail.com>
Date: Mon, 23 Feb 2026 15:17:41 +0100
Message-ID: <a875d6c5352f154cb601d498d68db0f211bbbfdc.1771856260.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1771856259.git.yann.morin@orange.com>
References: <cover.1771856259.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.26.51]
X-ClientProxiedBy: OPE16NORMBX504.corporate.adroot.infra.ftgroup
 (10.115.26.28) To OPE16NORMBX503.corporate.adroot.infra.ftgroup
 (10.115.26.27)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1771856272; x=1803392272;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9VZ1muuUGUrqWYYKOREsIoNQHOFszdsP3wu0Hdbh9V8=;
 b=sBQWcp+29r2T1IMvsQfT2Bp/N9kguRcbzATgWs6OJoS8FjOsOK3Gs2Qy
 Y+dCuwJextK6NPhQrJ9h9Gt1azEouu/cOB42suGWaaXD4BU9UI1kMWh7n
 gxhVUFjfcGDnZSGpB8MMTZ1kncn59yUD9nzNuFUnS5sGvO2D05LdYwMwM
 Kva0n4BrckOR8wNMMdYSx36E3sOGDQIcww2f6qSFw/rseDx+V4Ac9ajaC
 AS/0adiyDngbJUgjm4WaPcwlhwPBYBEEgvEGnHluTis0AIhS5QKecRUd8
 9K8cA9eRmonXNnDXnPQ1644O+RFzYLY/3LgluSr1493pU4CW5c2fI3ATa
 w==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=sBQWcp+2
Subject: [Buildroot] [PATCH 1/8 v2] package/cjson: add host variant
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
Cc: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/cjson/cjson.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index cb4525d1a4..fb43994aed 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -31,4 +31,11 @@ else
 CJSON_CONF_OPTS += -DENABLE_CJSON_UTILS=OFF
 endif
 
+HOST_CJSON_CONF_OPTS = \
+	-DENABLE_CJSON_TEST=OFF \
+	-DENABLE_CUSTOM_COMPILER_FLAGS=OFF \
+	-DBUILD_SHARED_AND_STATIC_LIBS=OFF \
+	-DENABLE_CJSON_UTILS=OFF
+
 $(eval $(cmake-package))
+$(eval $(host-cmake-package))
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
