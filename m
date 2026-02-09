Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24DD1EF0713
	for <buildroot@archiver.kernel.org>; Mon,  9 Feb 2026 06:43:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8B3B81EBD;
	Mon,  9 Feb 2026 06:43:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cJvYhmZ-75Sj; Mon,  9 Feb 2026 06:43:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C72A8177C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770619400;
	bh=uZXSuJc76M7KyN8IyOBUux69OlcGk3Hdr5GR8ZuXsYk=;
	h=From:To:CC:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LKXUbGJqj55G2ol3jlgEKWukPsJhC/VNKjIFO3eaq9lxYSBMNxokZoC6bnYduxxCz
	 R0a7nwqmZSbHQ/Qr2sj+hZDz+/nDWcNn3mI55xVoDmzmisZUFygJBGFhaf4CmqTaYZ
	 nkWQVWKwjZWZK8j2o2Ykzo+ST9xjsGPPbu44AsDoUKAAzAKWeAMsgaJRyWPZdd72+t
	 GSFOJADwP8EkZS6ju4YPRhgEdvD9TTmxlPn+qc9fcFqnEyiETJeYOK6wj2dr34P6iR
	 E/VOo/lBxTjG6U0AFB2fY3cCvcsGAahANtJY7iYnEzMuTrgR44s38ugbHUz6bw4o52
	 pfhILriAUFHsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C72A8177C;
	Mon,  9 Feb 2026 06:43:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D16B1A9
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 06:43:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6ADB4407E9
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 06:43:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wil_SYMwn1gN for <buildroot@buildroot.org>;
 Mon,  9 Feb 2026 06:43:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.122;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 96DBB407E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96DBB407E3
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.122])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 96DBB407E3
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 06:43:17 +0000 (UTC)
X-CSE-ConnectionGUID: xXlRNfE2SE6lbapIaj1tSA==
X-CSE-MsgGUID: NSbKiDApRg2o5YnQruUOqA==
Received: from unknown (HELO opfedv3rlp0g.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 09 Feb 2026 07:43:14 +0100
Received: from unknown (HELO OPE16NORMBX508.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0g.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 07:43:14 +0100
Received: from OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] by
 OPE16NORMBX508.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Mon, 9 Feb 2026 07:43:13 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61;
 Mon, 9 Feb 2026 07:43:12 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Mon, 09 Feb 2026 07:43:12 +0100
X-CSE-ConnectionGUID: vIa7+X08QUaOTi5lLCFk4Q==
X-CSE-MsgGUID: gfdn5JlfQYGKLpVA+NzPIQ==
X-IronPort-AV: E=Sophos;i="6.21,281,1763420400"; d="scan'208";a="390190562"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>
Date: Mon, 9 Feb 2026 07:43:12 +0100
Message-ID: <b4ed96753ffed1bd3aa7cd3149c94f448bfbc582.1770619392.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.115.26.53]
X-ClientProxiedBy: ope16normbx505.corporate.adroot.infra.ftgroup
 (10.115.27.25) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1770619398; x=1802155398;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pflCr4FH3UwPSng9tQw+mKWfvqg2nuFKNKNCpYhXCmQ=;
 b=L9FpiCR3/2GZzYhnEiaxKNgeNruUJJIj/CgyumLp++b5byIeQwNsQhZp
 dNTbMgQ2j/BWlc4K1EWr2+AhgJwxw/ofRn4UaLWu97aY5HRCZdEmFbQg6
 pNIz33vuslOAmFKiGJVJSlGIuzFHDXFszN47MQKRA7nATjA+7wrSQwj6t
 I3ABJC8UzkIIA0ZT2ZqVTNBFZVPR1gXQEKAQJrWzZqvaQbY6VEyvd8pK2
 bO2fwfmv2JbPZtaG0XbJlFDbZ0MU8532e6r+q4UTwiFKkAc/g+C/epbtT
 uat3HtkLPjT8lvg2K6SGFCQGc+nOxDJc+cyW2JuLGJ0KIf77SMKkz2d0i
 Q==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=L9FpiCR3
Subject: [Buildroot] [PATCH] package/skopeo: bump to 1.21.0
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
 package/skopeo/skopeo.hash | 2 +-
 package/skopeo/skopeo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/skopeo/skopeo.hash b/package/skopeo/skopeo.hash
index 02cb76d6f1..4a1bcfa0f1 100644
--- a/package/skopeo/skopeo.hash
+++ b/package/skopeo/skopeo.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  0c19fe51b2cd8d1bd5e38c03b97421e318fc08153bdf5ef2f816a29889eacdef  skopeo-1.20.0-go2.tar.gz
+sha256  f76eeddf697a3cc7a872e3077ab4d0fdbebe9f3c6171462e3e9feb84368b3fac  skopeo-1.21.0-go2.tar.gz
 sha256  716a8b80635c394681e652823e1e42e411ad2d254e1f202403422d74f4b0b106  LICENSE
diff --git a/package/skopeo/skopeo.mk b/package/skopeo/skopeo.mk
index a8587f06b8..d534a04813 100644
--- a/package/skopeo/skopeo.mk
+++ b/package/skopeo/skopeo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SKOPEO_VERSION = 1.20.0
+SKOPEO_VERSION = 1.21.0
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
