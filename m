Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ABD5EA813E
	for <buildroot@archiver.kernel.org>; Tue, 10 Feb 2026 16:16:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C029060B43;
	Tue, 10 Feb 2026 16:16:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G3RB3vHKfXLQ; Tue, 10 Feb 2026 16:16:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1D1C60C23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770740177;
	bh=Jzg90lpqb67Yy1OU+bMUXIc8Fl9TeH1Og5ep7m2stoY=;
	h=From:To:CC:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OyXTLNnhakMtY+FdkapdVuAkznQmyOyJ73SboSSSFDAJYYVVlsbRmFAO1P5SRHSSg
	 SCkTaEfD2MC2QGG8o1q8f9fgR1pnM2KAaD1qASlYUqWi9V+Dm4gGdhdDG6dELH+5B1
	 g3ndENWHhORA9g04NcJ1X5lQ+onrTvVWsNM6uv+wyroN4gEI+S+iGKkrrm5g4RiDer
	 5TFNP1oXvltjm6f4TjbFD5pFLLnjSrReprOO4nX9jUhU/YNSCzWIX8VIM3Gpqz4ry/
	 ygpDISj8OHlZfpVtbpw/LZXP3oCA9bshPZkqhxCMfijeIhZLobt8sjJ3qJ/edNF0Ut
	 koSGOEe07lgmg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1D1C60C23;
	Tue, 10 Feb 2026 16:16:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B5F59F2
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 16:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A70424070D
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 16:16:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id raU44ST1-dtM for <buildroot@buildroot.org>;
 Tue, 10 Feb 2026 16:16:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.124;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EEC9240593
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EEC9240593
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EEC9240593
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 16:16:13 +0000 (UTC)
X-CSE-ConnectionGUID: jIfnkyw/TK+eiWsYJnCYJg==
X-CSE-MsgGUID: ult994PQSXmrwzGfvNWjMQ==
Received: from unknown (HELO opfedv3rlp0e.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 10 Feb 2026 17:16:12 +0100
Received: from unknown (HELO OPE16NORMBX608.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0e.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 17:16:12 +0100
Received: from OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] by
 OPE16NORMBX608.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Tue, 10 Feb 2026 17:16:12 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61;
 Tue, 10 Feb 2026 17:16:10 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Tue, 10 Feb 2026 17:16:10 +0100
X-CSE-ConnectionGUID: IHVXq4s/SR27cQFNcoxPzg==
X-CSE-MsgGUID: kVOebaTnRvmYTWyFFgi/3g==
X-IronPort-AV: E=Sophos;i="6.21,283,1763420400"; d="scan'208";a="391129953"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>
Date: Tue, 10 Feb 2026 17:16:09 +0100
Message-ID: <5d305bac33be19c373e64be58be905819db3dbf4.1770740165.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1770740165.git.yann.morin@orange.com>
References: <cover.1770740165.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX608.corporate.adroot.infra.ftgroup
 (10.115.27.32) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1770740174; x=1802276174;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I/ADEqpaGLJWKk4mLJ26VwgF6ONyOnia6GicGVs/Wf0=;
 b=o4V/Q7lMbruxIiM9Vp6rHhSSXPr862M/GvvniPFMF0LqxcIZtHlLCbaC
 C9dsxODxCaRPnzCxwEMegtu2NPFSMqM8Who2mSskV71PoyM0zM5ns+VFR
 tYZH7J2NY5JsU1tfw/xbUd2yIcvElDEq2yuW/7TtCMaGcAHxfRuYvOfv7
 UEPBWl+wwCrpz9HWvAO84GZQUyLHP3EiFYw/VbZaN6LpPs38Ap0oI0WCJ
 8V+k5QHvRNw5F+T+QxwA0sAtDMS3BV1SIy+PlYODqo0lZ7MuUMuHSyqkv
 9Fm3uqKQe1RVrrlZYQRMjyXIqQ/oL8y4stcW5r813l2LND3gUWFgj1tOv
 A==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=o4V/Q7lM
Subject: [Buildroot] [PATCH 1/2] package/cjson: add host variant
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
