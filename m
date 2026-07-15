Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A55E8C44508
	for <buildroot@archiver.kernel.org>; Wed, 15 Jul 2026 07:31:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81C2E4057B;
	Wed, 15 Jul 2026 07:31:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mcn8umT_THol; Wed, 15 Jul 2026 07:31:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E20554054B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784100686;
	bh=pBeUKSR8vyS1310E4u38YHKwJt7FbaGQqnZs+bGdP/k=;
	h=From:To:CC:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LdQEW6pVXrP8/X+iCn75dicAXND3hJGcfolCtySe6K9hjn6FtKhEV4zg5RjfGYC+f
	 wAw1oD0xug1xlRiz8hjTJV4RZcmH9F5gd+MbEIgSCFWoufNWUPUoy9qgNkt6rTd6Af
	 GMNl06Y+cEAbR6GazSZIM6yi8GkA5JVsZfFgZfjRwOSZl+S1cQDqndK3+FLam81q8b
	 rkkTkl4F7+c2ZveCSmi03ahJjwG5J/pCd7ag616xIQ+Phh0j8L6GY3Fhhs8eattOpc
	 cdKyxt6cK1/yu+OXWJeUO63aYKMny5dnY89+gPpuf+q2r6Hdp/fcgFeefQosUYYfoU
	 6P5VN1qESXEfQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E20554054B;
	Wed, 15 Jul 2026 07:31:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B6C28203
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 07:31:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D09840055
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 07:31:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pzc4dA5w0_QF for <buildroot@buildroot.org>;
 Wed, 15 Jul 2026 07:31:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.124;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8D95A4004C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D95A4004C
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8D95A4004C
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 07:31:23 +0000 (UTC)
X-CSE-ConnectionGUID: 9FXXjCUjRN2GIjuJcrqF+Q==
X-CSE-MsgGUID: pXIUrM6xRjSp1wkosBvrAw==
Received: from unknown (HELO opfedv3rlp0e.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 15 Jul 2026 09:31:20 +0200
Received: from unknown (HELO OPE16NORMBX506.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0e.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 09:31:20 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX506.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43;
 Wed, 15 Jul 2026 09:31:19 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Wed, 15 Jul 2026 09:31:18 +0200
X-CSE-ConnectionGUID: x5QsGHVeREmabuOpvPEG3Q==
X-CSE-MsgGUID: sxOwckHSQ8WT6ca2IVqzYA==
X-IronPort-AV: E=Sophos;i="6.25,165,1779141600"; d="scan'208";a="446533532"
X-Amp-Result: SKIPPED(no attachment in message)
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>
Date: Wed, 15 Jul 2026 09:31:18 +0200
Message-ID: <7d8b63ec3a6f67c7935cfbda74cadcb5864d8cbe.1784100678.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.115.26.51]
X-ClientProxiedBy: OPE16NORMBX606.corporate.adroot.infra.ftgroup
 (10.115.27.30) To OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1784100683; x=1815636683;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=o9Rh6xNAjmECfTjeCTPXk0RW/+q7z3A+3/wxdM9JlCw=;
 b=Q5eM+blI9UZzbEHFBjP6JmGjYiXyyz/AN3D/ELPyy8a0AzaB7adP+IDe
 eu/n4PvwoUjl8YFKO9r6H7Zo0WBANZYTENQCVEwIJ0YJ4cMNLPbNkuAPP
 n1eorUpXfeQ9VeOO1S24hOTB2vE33lcUBKt1DC3y/1p2M5iceaLgYLh3I
 ng5PgYq1DU0keVE35m48OgVaK4ZsrA95MFS0MhrIhTMsnW4thgBIurtsX
 jeb8Fd1UfYha8WAUp7TOu2RJ3cRs5jRvqQOjkUlm7kNWRbo3yLJqhLWAn
 dbkNuq0R5BJ5yFUIY8Ncc+1K9gyAdk/Us8OY3OgRonfRwZwAm+Cnxt1ny
 Q==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=Q5eM+blI
Subject: [Buildroot] [PATCH] DEVELOPERS: add Yann E. MORIN (Orange) for
 docker credential helpers
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
 DEVELOPERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1601e6b408..42418d01a2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3489,6 +3489,9 @@ F:	package/tpm2-pkcs11/
 
 N:	Yann E. MORIN <yann.morin@orange.com>
 F:	.editorconfig
+F:	package/amazon-ecr-credential-helper/
+F:	package/docker-credential-acr-env/
+F:	package/docker-credential-gcr/
 F:	package/gpsd/
 F:	package/mosquitto/
 F:	package/python-humanfriendly/
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
