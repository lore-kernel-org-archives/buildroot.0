Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9631DC54F51
	for <buildroot@archiver.kernel.org>; Wed, 29 Jul 2026 09:01:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A07DE60836;
	Wed, 29 Jul 2026 09:01:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xl05Ep05Gy91; Wed, 29 Jul 2026 09:01:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8FB260AE7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785315707;
	bh=QD3BBAWCNIy/q0Skkd5mCiMAuz4g9qLN6c6gDfWsyTM=;
	h=From:To:CC:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZjOQdw5t3ZQDipkn4s+ehuytsgNpIIB9mx1xMhebu1L4uzS126TE1bWO7eWjK+tCA
	 eX78Uq8Rud1myqHcfFkQt3EyJOlYGh4ctoa+4v+cqsmuWfMN1g1G1f4TxjWmqYerdI
	 f7WfqHDmGsnIY4X3p5nQAJGMlCThLsb4I48Gr1TUCH/botLA4W7jwaDg2abWqAPZmg
	 kWfNVX/6nJctkBVVSg0uDb/9AR9a5eoOuWBZSwpOryRxr0MuFwA7Hkz/ahoskiuCPS
	 pxEmbuWT/lbzx531mONqJH1BWrTMWU5R5ul7JPP1A7c+q074EDKHPB7qjKMvkHTiUZ
	 1Jts5IVdQtcXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8FB260AE7;
	Wed, 29 Jul 2026 09:01:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id ED8613B0
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 09:01:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D3C5580FFD
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 09:01:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bd_m24GAt-KM for <buildroot@buildroot.org>;
 Wed, 29 Jul 2026 09:01:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.238;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6EECD80FA9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6EECD80FA9
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.238])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6EECD80FA9
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 09:01:45 +0000 (UTC)
X-CSE-ConnectionGUID: kICdfE82Rb6H7ppx68Qbvw==
X-CSE-MsgGUID: qiD00l28QBaxryJxAyWnXQ==
Received: from unknown (HELO opfedv1rlp0g.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 29 Jul 2026 11:01:41 +0200
Received: from unknown (HELO OPE16NORMBX506.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0g.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 11:01:41 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX506.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45;
 Wed, 29 Jul 2026 11:01:40 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Wed, 29 Jul 2026 11:01:39 +0200
X-CSE-ConnectionGUID: vfpHFYK1RUmmDyBoNgXW1w==
X-CSE-MsgGUID: 3XaHrsxLQ9GEo/ibfe8M7A==
X-IronPort-AV: E=Sophos;i="6.25,192,1779141600"; d="scan'208";a="455569277"
X-Amp-Result: SKIPPED(no attachment in message)
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>
Date: Wed, 29 Jul 2026 11:01:38 +0200
Message-ID: <908af995a945a17aeb8612058a0b67e97e13231b.1785315694.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1785315694.git.yann.morin@orange.com>
References: <cover.1785315694.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.26.53]
X-ClientProxiedBy: OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26) To OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1785315705; x=1816851705;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ydK1pJRomTrGxsd46mZKqwznvSThVF8Gs1qLWnnmuYA=;
 b=m3TaCuQOIhBHUPH7Q9KC0j4G2eb+GuHDaSNwq6qN/JjelppldLGY7pRG
 44u2GqfMADYwnIy02Yix8YviOh/OtAeRoU1Twm2IWG+1mTGpsTZWN7rCA
 FXIIj6Unnv7a29wNfaSrKeTF6hkZx9cWhcAeCo86oC9HNKGCE0Q9WA29m
 MgpP5cCfY7eHecDV1P8ARyTe07k1DhgHPb7Z9L0PQAy2f90iOAaWEO+jf
 VDtiLr2pf5XKTaMLuDT64XYkZAaM6xGkK0BtFl8Dl+2l6rorvrbVwohSO
 HWrBi/k56qIUiUeqW4lwes22RqHDLxiMbUgBSOUZ/VaGFBnyXiPTvuCmS
 w==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=m3TaCuQO
Subject: [Buildroot] [PATCH 1/2] package/docker-credential-gcr: bump to
 2.1.32
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

Changelog: https://github.com/GoogleCloudPlatform/docker-credential-gcr/compare/v2.1.30...v2.1.32

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
---
 package/docker-credential-gcr/docker-credential-gcr.hash | 2 +-
 package/docker-credential-gcr/docker-credential-gcr.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-credential-gcr/docker-credential-gcr.hash b/package/docker-credential-gcr/docker-credential-gcr.hash
index 469e8d6b17..1269e239ad 100644
--- a/package/docker-credential-gcr/docker-credential-gcr.hash
+++ b/package/docker-credential-gcr/docker-credential-gcr.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a327753270232cb7f112b98328d5b56ae2da095ad74399b769aa5dad4393c8ae  docker-credential-gcr-v2.1.30-git4-go2.tar.gz
+sha256  7dcb5b75650a49e181afdbd735d09f3289cb62d5b30cb6e3f681e64cf804cbf9  docker-credential-gcr-v2.1.32-git4-go2.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/docker-credential-gcr/docker-credential-gcr.mk b/package/docker-credential-gcr/docker-credential-gcr.mk
index f889eb56c9..7419a47d4a 100644
--- a/package/docker-credential-gcr/docker-credential-gcr.mk
+++ b/package/docker-credential-gcr/docker-credential-gcr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CREDENTIAL_GCR_VERSION = v2.1.30
+DOCKER_CREDENTIAL_GCR_VERSION = v2.1.32
 DOCKER_CREDENTIAL_GCR_SITE = https://github.com/GoogleCloudPlatform/docker-credential-gcr
 DOCKER_CREDENTIAL_GCR_SITE_METHOD = git
 
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
