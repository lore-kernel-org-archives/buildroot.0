Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD3DC4451B
	for <buildroot@archiver.kernel.org>; Mon, 20 Jul 2026 05:42:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8741F80BB3;
	Mon, 20 Jul 2026 05:42:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YCnOj2Fo-rl1; Mon, 20 Jul 2026 05:42:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62B0E80BA8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784526147;
	bh=HejWJ0oF5nmDLeCHwzudhQtclw/DlBLaVSxLU8jmi7g=;
	h=From:To:CC:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Jr+6cMJPCA4ymP536J7HVv1K8QNlUJtldwEOj9dLcErvS8tUNkRC4zo8pFENr/B9S
	 y5+yCSMgi2UP/RZ9V/B2Km0R1z1qZAIKnu7by18ZSFGVR+y8NyCc8cbmUUZjBghvje
	 Iyc83TKwryIMzIUDXBnyulBl6gPIPSvNWwpJR1bz2stFVstCTRYyqRcT+0wQM3/W2H
	 tj30WccjdzYvcdzSQFHYdgDo4DEWufXZYnnl7aPZw/BP27YVJaOT3Ki3Q/HmFQIO9j
	 OocU/2VxLTv7rsTHDaFSpfoPuNnupQUS5Si1JMWsJ/f6Ww3qQwI25ObS/Cf1qGfCPr
	 yuxYwHBCzyNcg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62B0E80BA8;
	Mon, 20 Jul 2026 05:42:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D4FFE1F6
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 05:42:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA9A7400EC
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 05:42:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zl2OiK3pkULl for <buildroot@buildroot.org>;
 Mon, 20 Jul 2026 05:42:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.123;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4C81A40094
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C81A40094
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.123])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4C81A40094
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 05:42:23 +0000 (UTC)
X-CSE-ConnectionGUID: 0IgBlpk+QzCB602XWC5wmQ==
X-CSE-MsgGUID: TbawByV9SO6V7xz2gDqzeA==
Received: from unknown (HELO opfedv3rlp0a.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 20 Jul 2026 07:42:21 +0200
Received: from unknown (HELO OPE16NORMBX506.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0a.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 07:42:21 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX506.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43;
 Mon, 20 Jul 2026 07:42:19 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Mon, 20 Jul 2026 07:42:19 +0200
X-CSE-ConnectionGUID: BRocPQLHRlqgGEKzeY3lJg==
X-CSE-MsgGUID: K15YezBSQL67v4RlFB287g==
X-IronPort-AV: E=Sophos;i="6.25,174,1779141600"; d="scan'208";a="447716966"
X-Amp-Result: SKIPPED(no attachment in message)
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>
Date: Mon, 20 Jul 2026 07:42:19 +0200
Message-ID: <918f048da1962f22f91b05a79e7943797a33729e.1784526139.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX604.corporate.adroot.infra.ftgroup
 (10.115.26.32) To OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1784526144; x=1816062144;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pYblrjR5agak1G7fAa3Czth9gmSjYIN/AiAlG3IZJHQ=;
 b=SNBkZZO3JG0oVFU/ibX2K/tzFF0Sm1JvLU9UAKIjb+KFmJc5w3ZD2Yzp
 PJhxUFXVnC1Mb1LbT9lhz8RfP661/uMavzvqQJbXICYS7IkWHl6c54LTL
 7vEI7gepXuQST2Kzpb5YG78mIXUkmCuEUsUEuptuf8dK01k1SvQr3EDHv
 8YK5gWCzTYjhxfV3k3InPVWGzqKf5Q0d21k18EmPMHPJrPGBz9CDNrgX8
 TtrL0kZ2Gv4SrbRnslVEom6kVJNHKV0F521012oZZrTKgN8Cwvxfcdu7h
 /uyw1NaiFQRtZQ7Q1n4u1/n3CA1hLwk9R9Cm4SPua0JqRKwhkL8vvjgVI
 A==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=SNBkZZO3
Subject: [Buildroot] [PATCH] package/amazon-ecr-credential-helper: needs NPTL
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

amazon-ecr-credential-helper calls pthread_getattr_np() which is only
available with NPTL; i.e. always available with glibc (where it
originates from, since 2.2.3), always available with musl (which has
had it since 0.9.10 in 2013), and only available when uClibc has NPTL
(since 1.0.0 in 2015).

Fixes: https://autobuild.buildroot.org/results/4e6e13f1161485b412d4601cb8972a1524ddd2d6/

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
---
 package/amazon-ecr-credential-helper/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/amazon-ecr-credential-helper/Config.in b/package/amazon-ecr-credential-helper/Config.in
index 93bfb51e4a..2efda5cd49 100644
--- a/package/amazon-ecr-credential-helper/Config.in
+++ b/package/amazon-ecr-credential-helper/Config.in
@@ -1,9 +1,14 @@
 config BR2_PACKAGE_AMAZON_ECR_CREDENTIAL_HELPER
 	bool "amazon-ecr-credential-helper"
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL  # pthread_*_np()
 	help
 	  The Amazon ECR Docker Credential Helper is a credential
 	  helper for the Docker daemon that makes it easier to use
 	  Amazon Elastic Container Registry.
 
 	  https://github.com/awslabs/amazon-ecr-credential-helper
+
+comment "amazon-ecr-credential-helper needs a toolchain w/ NPTL"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
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
