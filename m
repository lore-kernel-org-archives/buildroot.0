Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8DBBC5CFC1
	for <buildroot@archiver.kernel.org>; Mon, 17 Aug 2026 06:30:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AFCA80E52;
	Mon, 17 Aug 2026 06:30:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PQBq5QpR4Tf8; Mon, 17 Aug 2026 06:30:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64FE180E4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786948216;
	bh=uJD+3LGSX7gSY1DmXQoiANP60HFZsYrPqXDF8TkKp6E=;
	h=From:To:CC:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SmgrwmmcCQa6EvP8FfURDkm5V5X7jxkwvVKqMD826IK/8WY8N3Mih4RVUWaE0o2+S
	 MxzGq43xGFoTMRvZ/EtYwU+gIxnkICxAvMOATGuylE4zEST6pLcU6jcK9kVfPpLKTX
	 1FJHGAfoI5Lzlyan58PYW4prlnuAtfu7F3WdVHTOT3xsLuLB5k2oyF65iUUe+9a/jE
	 6tUrJej70UEZu7XhyfPwWKQEzhEiT1g7xQ92iwFBbHOOklzg/vHg/yMNDVKByJIUCm
	 oWZ8GaCU3KipdRGgPeeJnRqcMp0Z2Z9iLumaS5ptCE/Nv9zltpV8nlM8MjE/RHdn1J
	 z/AFxQBgNQVJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64FE180E4D;
	Mon, 17 Aug 2026 06:30:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E6AC123F
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 06:30:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC88C80E4C
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 06:30:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fidPfgmqe4um for <buildroot@buildroot.org>;
 Mon, 17 Aug 2026 06:30:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.123;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5026980E4B
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=orange.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5026980E4B
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=P+fswpIT
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.123])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5026980E4B
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 06:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1786948213; x=1818484213;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eD4YJ6vFUBN+yTCgo2XD+YnkGqaS4EEnaCxHnrUnkqA=;
 b=P+fswpITSrimI7TB/Cqnq8E/V093nvVsDV68UvtMZivVJgO85h71ODvG
 PIqoZdBCYvI6smiOUq8a4Jhvojz+43qxf2vQsqJpA5OS9rlVZ2lCAhHyq
 LtxlFirL9X4Noz4O+lRb02cWdj8+e9OvBH/f40sMOvjgzn4cg+M+6eLBE
 mPTenAc+eEFPIVwGGmufAg9c81tjYj13+DMtgnnzQs7aEv4MMqj+L3Hbh
 hALd8HOn1IAoKzJrPrQxiFlVCqSqq1eXHVCShMqkun31hweZf6+STenQa
 AE+JH+XDrPjadsLJiILv/PU/sWtjf9ijXdKjTZ5Ts6nHHZp5k1vxYDYW2 g==;
X-CSE-ConnectionGUID: uKNub+EBTL69gu1jh5+8fw==
X-CSE-MsgGUID: 9J1aFRfdTrihskZIadqIRw==
Received: from unknown (HELO opfedv1rlp0g.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 17 Aug 2026 08:30:09 +0200
Received: from unknown (HELO OPE16NORMBX506.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0g.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 08:30:09 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX506.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45;
 Mon, 17 Aug 2026 08:30:07 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Mon, 17 Aug 2026 08:30:07 +0200
X-CSE-ConnectionGUID: chi8c/5BRcOQtqxFVAvT9w==
X-CSE-MsgGUID: 123xxF+GR86l2kZDK2B6AA==
X-IronPort-AV: E=Sophos;i="6.25,228,1779141600"; d="scan'208";a="461816536"
X-Amp-Result: SKIPPED(no attachment in message)
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>, Christian Stewart <christian@aperture.us>, Thomas
 Perale <thomas.perale@mind.be>
Date: Mon, 17 Aug 2026 08:30:07 +0200
Message-ID: <552622897e269a9cbd28f3a4b08f4c45cab46124.1786948207.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Originating-IP: [10.115.26.51]
X-ClientProxiedBy: OPE16NORMBX502.corporate.adroot.infra.ftgroup
 (10.115.26.26) To OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26)
Subject: [Buildroot] [PATCH 1/1] package/go: decrease debug level for CGO
 linking
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

Workaround an upstream issue that arises when packages are build with
gdb -g3 debug level:
    https://github.com/golang/go/issues/77436

This has been fixed upstream, but is not released yet, so add a comment
stating when to remove the workaround.

Fixes:
    https://autobuild.buildroot.org/results/97cd9c2586a0cc2a16cdb2a75dae1836feb5ffc3/
    (and probably a lot more...)

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Christian Stewart <christian@aperture.us>
Cc: Thomas Perale <thomas.perale@mind.be>
---
 package/go/go.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/go/go.mk b/package/go/go.mk
index a64d7538f8..265d3aa880 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,6 +4,9 @@
 #
 ################################################################################
 
+# When bumping this to 1.27 (or beyond), remove the workaround for
+# upstream issue https://github.com/golang/go/issues/77436, below
+# (i.e. revert the commit adding these lines).
 GO_VERSION = 1.26.5
 
 HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
@@ -75,11 +78,14 @@ HOST_GO_TARGET_ENV = \
 	$(if $(GO_GOARM),GOARM=$(GO_GOARM)) \
 	CC="$(TARGET_CC)" \
 	CXX="$(TARGET_CXX)" \
-	CGO_CFLAGS="$(TARGET_CFLAGS)" \
-	CGO_CXXFLAGS="$(TARGET_CXXFLAGS)" \
 	CGO_LDFLAGS="$(TARGET_LDFLAGS)" \
 	GOTOOLDIR="$(HOST_GO_TOOLDIR)"
 
+# Workaround for https://github.com/golang/go/issues/77436
+HOST_GO_TARGET_ENV += \
+	CGO_CFLAGS="$(subst -g3,-g2,$(TARGET_CFLAGS))" \
+	CGO_CXXFLAGS="$(subst -g3,-g2,$(TARGET_CXXFLAGS))"
+
 # Allow packages to use cgo support if it is available for the target. They
 # will need the toolchain for cgo support; for convenence, include that
 # dependency here.
-- 
2.43.0

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
