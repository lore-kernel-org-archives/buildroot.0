Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 139BDFD8FC3
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 15:54:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE2FD40D42;
	Thu, 26 Feb 2026 15:54:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DrOQ9mM0ztaF; Thu, 26 Feb 2026 15:54:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE5D840D16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772121255;
	bh=QlpSmlHMRpt9kjtTIlBISKkWK44TJ2Gu3lksG3TIUdg=;
	h=From:To:CC:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NWXl7Gn6olVVSfSmleCW1mRFyc/451Vu8NJ58EpF+jeH0R/fTQe4lV74BLXyIpIZJ
	 vsxRnmorseM4y9q0fXieoWCz5SVByYwmgRmxpDBg6Xe2AoCQKxiUJ1wSwH3zIeOFGa
	 MWQyUtWXPdje1tSKoG+eMVbyi4pBsYG1LBy/bcaY0Dhsby2RFYU5hBIg3kJCo9gvFZ
	 amf+VU4Re7foxyBOUKwOoAFtgeroo57u0uBSqDoh1faR/UBNFIlL8VtWVjWX4HDAao
	 +U3OJwnO6xQkVbbXEr2peis8G5tUeM2d3bHvXHk0d2fErnZf6oe/jyxKr8iVq0H4Ra
	 IwCe6Z/My0Uug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE5D840D16;
	Thu, 26 Feb 2026 15:54:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 35D7C204
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 15:54:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 32BEA847B3
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 15:54:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9efihXUYmlEm for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 15:54:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.238;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9864784791
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9864784791
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.238])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9864784791
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 15:54:11 +0000 (UTC)
X-CSE-ConnectionGUID: baGGGgVuQJSTI9HKsRe5TQ==
X-CSE-MsgGUID: zcJVe2kHSfWS407wbaPn+g==
Received: from unknown (HELO opfedv1rlp0d.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 26 Feb 2026 16:54:09 +0100
Received: from unknown (HELO OPE16NORMBX503.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0d.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 16:54:07 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX503.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37;
 Thu, 26 Feb 2026 16:54:05 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Thu, 26 Feb 2026 16:54:05 +0100
X-CSE-ConnectionGUID: dJ3pqW4jRNmtRCRHPwMW2A==
X-CSE-MsgGUID: iCy+ThBOQHKOcIApCloeLA==
X-IronPort-AV: E=Sophos;i="6.21,202,1763420400"; d="scan'208";a="400664508"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>, Danomi Manchego <danomimanchego123@gmail.com>
Date: Thu, 26 Feb 2026 16:53:55 +0100
Message-ID: <a33619032457c51111252d6406e1104e39fc8bf2.1772121240.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1772121240.git.yann.morin@orange.com>
References: <cover.1772121240.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX501.corporate.adroot.infra.ftgroup
 (10.115.26.25) To OPE16NORMBX503.corporate.adroot.infra.ftgroup
 (10.115.26.27)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1772121252; x=1803657252;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9VZ1muuUGUrqWYYKOREsIoNQHOFszdsP3wu0Hdbh9V8=;
 b=JQ6NBV1KtwBlQPz8o8UXntXpHmVjJQXqa6NtBPbWe7TNxTtrpHDCuMTi
 aE3Du+QKHYP61WWwoYTitvycIZSS0XeGmiREBg/Jllb6iHegN951rjODl
 GIX4cXJrTrdDVEoJYUWRtV3LKckN8q64tmm0DNsub0v/TBRiMy+ApaHzM
 fE5jzKRiARjFD+wy2MAXE/CnV5mR0ttIZOErOtYLGTyKec28j2Ls3DY3j
 mmRP/9tc3TfELb+f/ZBA0BwZ/3j7u3rVnnM4yZuUZbRlX3bL9J88mwl1Y
 +iA8DgDlGm27LMsBr3xY90hDtOdOqljg7c6Leu9+3alhR5eGvpK8+se6/
 Q==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=JQ6NBV1K
Subject: [Buildroot] [PATCH 01/11 v3] package/cjson: add host variant
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
