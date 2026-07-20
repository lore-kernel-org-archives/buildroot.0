Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8033C44515
	for <buildroot@archiver.kernel.org>; Mon, 20 Jul 2026 05:42:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E54A80BA8;
	Mon, 20 Jul 2026 05:42:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N0LUowecCnoG; Mon, 20 Jul 2026 05:42:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 680CC80BAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784526178;
	bh=oKqZjgIf/3m4V8bn9ey69KOOqAMKfCG4CLnQ92EimRQ=;
	h=From:To:CC:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=L8mvom75/CrSqxNm4bv/VvV+lIzMd0hOSt/UfLGBcpJs9fkumyp/UXOF8ToyjOCio
	 7dqa0iJQw7Z+HrseMj108u/ZJ9oRKnA6QapAyue9YF01mprTo6FzsvzF8sA8xqQtnK
	 09iEz9H88GdNuv8TTjfOcSHOTS7R1SitCN9xaKLUZ7IKzvh5Ks/Hhb9C2hch8DOyYo
	 Vx1CIrx+wBgBbhS9iSUbiUqabEHtAwgXL8nLPKLYGen9xOFi8j26s5mgGEetuKxFXG
	 Pw4lGB0WkIXDEcLqbNRjV7nVufSj/faJY3bQ8kfqI5nqmTG/PdEmUQKSmiE2ceqj2q
	 UcY+mRTriWjyg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 680CC80BAD;
	Mon, 20 Jul 2026 05:42:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E53D81F6
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 05:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D71766066F
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 05:42:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bGOvHNaNj9TN for <buildroot@buildroot.org>;
 Mon, 20 Jul 2026 05:42:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.239;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 86BD760644
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86BD760644
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.239])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 86BD760644
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 05:42:55 +0000 (UTC)
X-CSE-ConnectionGUID: Exd1baB8QtCsWsKQAIfweA==
X-CSE-MsgGUID: 4A5aNErdSKmn6X6v12JY0g==
Received: from unknown (HELO opfedv3rlp0h.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 20 Jul 2026 07:42:52 +0200
Received: from unknown (HELO OPE16NORMBX506.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0h.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 07:42:52 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX506.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43;
 Mon, 20 Jul 2026 07:42:50 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Mon, 20 Jul 2026 07:42:50 +0200
X-CSE-ConnectionGUID: vsHklyu1Tnu01Rkg7MYvww==
X-CSE-MsgGUID: 1urkwM6lS5iSG99elw0S6g==
X-IronPort-AV: E=Sophos;i="6.25,174,1779141600"; d="scan'208";a="447865241"
X-Amp-Result: SKIPPED(no attachment in message)
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>
Date: Mon, 20 Jul 2026 07:42:50 +0200
Message-ID: <81e1623bc37fdedb5cd3e4b9268fa03b45af65a6.1784526170.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.115.26.51]
X-ClientProxiedBy: ope16normbx505.corporate.adroot.infra.ftgroup
 (10.115.27.25) To OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1784526176; x=1816062176;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SkO/gtiCtV3D+td16232r20tomYmABR7ObJfNdKTDfc=;
 b=WnVBuPO2s78RwRwxK4h9CE/8rhBLmZ9ZaV8QtuQxev87bG8yPZUBmQ4x
 hH4LBETPtXtdUdvMHVXa4MD1CTb/Zqh3YMYi5RynN32uF08GKo/LkxNuW
 yOlLXSqplK8xcelCnCCKJijixU9+ybTy8qQQF6Wv1b3Zjaf9WIDgz3zpI
 xO9hLxecUruejtDO4g5p/c2LK6PS6WNbGmUDjcQdkO3xHLHY9mrbZLElJ
 1xfUYSy02pEaS17T+PfkHGqJN25942zLI7YVc/eoU2Z+p7et3s6pNJddA
 pJTt3vJEWuBp/+5FVGpANOsmRoLkU02IBiqXHjFMg7eQ84Xg/er1lfBOF
 g==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=WnVBuPO2
Subject: [Buildroot] [PATCH] package/docker-credential-gcr: needs NPTL
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

docker-credential-gcr calls pthread_getattr_np() which is only available
with NPTL; i.e. always available with glibc (where it originates from,
since 2.2.3), always available with musl (which has had it since 0.9.10
in 2013), and only available when uClibc has NPTL (since 1.0.0 in 2015).

Fixes: https://autobuild.buildroot.org/results/3ed18da254082b7823b49be4578274792bb7380e/

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
---
 package/docker-credential-gcr/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/docker-credential-gcr/Config.in b/package/docker-credential-gcr/Config.in
index 1b24ff0e59..6845d5e198 100644
--- a/package/docker-credential-gcr/Config.in
+++ b/package/docker-credential-gcr/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_DOCKER_CREDENTIAL_GCR
 	bool "docker-credential-gcr"
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL  # pthread_*_np()
 	help
 	  docker-credential-gcr is Google Container Registry's
 	  standalone, gcloud SDK-independent Docker credential
@@ -9,3 +10,7 @@ config BR2_PACKAGE_DOCKER_CREDENTIAL_GCR
 	  eu.gcr.io, etc.).
 
 	  https://github.com/GoogleCloudPlatform/docker-credential-gcr/
+
+comment "docker-credential-gcr needs a toolchain w/ NPTL"
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
