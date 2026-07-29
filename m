Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B7BC53200
	for <buildroot@archiver.kernel.org>; Wed, 29 Jul 2026 09:01:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 490EE40923;
	Wed, 29 Jul 2026 09:01:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N3TiWQf3j4Ev; Wed, 29 Jul 2026 09:01:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6782B4089A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785315710;
	bh=6iXZ4K76Zo8iGLMJOyUwkD3v/LlYG/Bgah9YmPX4M6c=;
	h=From:To:CC:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rj6CExbDPU0+iP40irQc2iOIW9W4XKC2vM3HDmTFM8drIe50aT28xMJr5Yb+MaoB0
	 H9loIqJXR6qOqgT9aI8NKok4m7tQy8ayf3lbFTmyShU13TZ3VZvy+sfsTRXvGwM9BM
	 jHZxXOoe6M2XgJ4kw4qTryLMJnX87cD0L/oC8CevRnafl630ul4xFBHU5pqdjq81FV
	 ttQ+6SWS9ycXGhYGYvM6kNBQNug/MiibYHrKcHJdFBQGyalQceRiYpBkcGsQmePkuL
	 Usqhz2k6U41R/m72amsXYgxFSbm53az1AfrLgORzelJ4eT/oXLXNmRm5STmterYtiA
	 F7FRdoRDq6b0g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6782B4089A;
	Wed, 29 Jul 2026 09:01:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 085D245B
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 09:01:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2E0F80FA9
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 09:01:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jkU-Ry408tol for <buildroot@buildroot.org>;
 Wed, 29 Jul 2026 09:01:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.238;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8988380FDD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8988380FDD
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.238])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8988380FDD
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 09:01:46 +0000 (UTC)
X-CSE-ConnectionGUID: wCSvWtaTRXqrFrjafpgTIQ==
X-CSE-MsgGUID: zQtXnR2fS82rsclRb6nrqA==
Received: from unknown (HELO opfedv1rlp0g.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 29 Jul 2026 11:01:43 +0200
Received: from unknown (HELO OPE16NORMBX506.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0g.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 11:01:43 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX506.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45;
 Wed, 29 Jul 2026 11:01:41 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Wed, 29 Jul 2026 11:01:41 +0200
X-CSE-ConnectionGUID: bg9gv9kyTTuwVGJjoUNt7g==
X-CSE-MsgGUID: SVTDq4AuR7aK7z7erWS7YA==
X-IronPort-AV: E=Sophos;i="6.25,192,1779141600"; d="scan'208";a="455569317"
X-Amp-Result: SKIPPED(no attachment in message)
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>
Date: Wed, 29 Jul 2026 11:01:39 +0200
Message-ID: <a011c7746d80417cc4b282c03f595a13bd92f489.1785315694.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1785315694.git.yann.morin@orange.com>
References: <cover.1785315694.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.26.53]
X-ClientProxiedBy: OPE16NORMBX606.corporate.adroot.infra.ftgroup
 (10.115.27.30) To OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1785315706; x=1816851706;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bI3zc1OvaoF7muiaYhFmUdXkTZX3932OuEJI6JxAeV4=;
 b=IU5r3y3qvKNceSmdqVjhrh2okOd7+Csa++6cghuBvJo7GWIO9hOBFYme
 Khdo878h9jm7NMdahonRG8aukqVaNM0j4Kuoh0OVG7ET6vclo1aNMmFTP
 RUGNJfB4COQrSsrR8Ttn2DZOUQYZ5VbrELLxWZQ02ex5Dd2LV273bW8iz
 8kfPdCEccjMBq1iegKTIqALc1XhahtZyN/m3IrQbzS/OpvUbSM+2zw47i
 45v8EC67Z5GzWq6lv1vKASrdrvOPR0fKicYu/i6VR+E/q4I24dTVrYVpn
 XEAtIfLMxz1o+6fNHirHr3AHI+o/n7S5ECcFusPZYYzqxv1SKaeBWoS+w
 w==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=IU5r3y3q
Subject: [Buildroot] [PATCH 2/2] package/amazon-ecr-credential-helper: bump
 to 0.12.0
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

Changelog: https://github.com/awslabs/amazon-ecr-credential-helper/blob/v0.12.0/CHANGELOG.md

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
---
 .../amazon-ecr-credential-helper.hash                           | 2 +-
 .../amazon-ecr-credential-helper.mk                             | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.hash b/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.hash
index 250ba6d4ff..04668d6478 100644
--- a/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.hash
+++ b/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.hash
@@ -1,3 +1,3 @@
 # Localy computed
-sha256  4114241888385d3794ca639f40bb7805f31eb295559950dd940aeeb6b74792f8  amazon-ecr-credential-helper-v0.10.1-git4-go2.tar.gz
+sha256  dbb977df026de70fbe3389d9fc6756286859ca4a76a76ebb8c17108b0cec6752  amazon-ecr-credential-helper-v0.12.0-git4-go2.tar.gz
 sha256  ce65129252f145d6dd627bc354ccc28ba07c6cd27a8d278b7dcfde3ed6976a5a  LICENSE
diff --git a/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.mk b/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.mk
index 5ac416912c..570cc16b0c 100644
--- a/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.mk
+++ b/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AMAZON_ECR_CREDENTIAL_HELPER_VERSION = v0.10.1
+AMAZON_ECR_CREDENTIAL_HELPER_VERSION = v0.12.0
 AMAZON_ECR_CREDENTIAL_HELPER_SITE = https://github.com/awslabs/amazon-ecr-credential-helper
 AMAZON_ECR_CREDENTIAL_HELPER_SITE_METHOD = git
 
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
