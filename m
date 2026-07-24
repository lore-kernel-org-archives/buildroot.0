Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C23C4453D
	for <buildroot@archiver.kernel.org>; Fri, 24 Jul 2026 04:26:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96DD760B18;
	Fri, 24 Jul 2026 04:26:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ev-ybIhPxhSX; Fri, 24 Jul 2026 04:26:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92092608D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784867198;
	bh=a7dR6UsySEPfhifgEpcmqhKSHO9VtUhpJUu0KYl7gr8=;
	h=From:To:CC:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MOhtFZQkaC6xCako3+GokRPOm4W75e5B00OplCoTu/eec0LqeCOvQLevNjUhRfH4M
	 pfUD0Ok+zTSlU6rg1G0Ui2Pft8SyPOQ14AH/2HSBGhzzHWA1OzAlMLLU7mmnk+SMuv
	 +tr9YoaZzahhD49mwurdzX5iqonmH6akSI3aAYWWuUPdoLtbeujF+D7UpxqlyJLj+z
	 fKBsTVtd/P82CvwKP+OaLgITp8+e6wG4AyEckTZCI4RJYPlmiXR9Pwo4o50v+tRr+o
	 EdtphNYKQ+b+XJqmIvhwoKoV+0B0HOeWs+FoeHlbK6kHKht1gBhgvipX99nQ4ElHdd
	 BwmlpNofCqaYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92092608D9;
	Fri, 24 Jul 2026 04:26:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9FF7E490
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 04:26:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 91753810EE
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 04:26:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oWT0DWenqVJC for <buildroot@buildroot.org>;
 Fri, 24 Jul 2026 04:26:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.122;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 10983810EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10983810EC
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.122])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 10983810EC
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 04:26:34 +0000 (UTC)
X-CSE-ConnectionGUID: UQXPzHR2THqaXGVUxdW2bQ==
X-CSE-MsgGUID: //NtQnURQqi1enTPCnBMMA==
Received: from unknown (HELO opfedv1rlp0a.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 24 Jul 2026 06:26:32 +0200
Received: from unknown (HELO OPE16NORMBX506.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0a.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2026 06:26:31 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX506.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43;
 Fri, 24 Jul 2026 06:26:30 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Fri, 24 Jul 2026 06:26:30 +0200
X-CSE-ConnectionGUID: +dcH5ExkT86GCawflixnVw==
X-CSE-MsgGUID: cCZ8KRGSRsC5c3xhxfQNgA==
X-IronPort-AV: E=Sophos;i="6.25,181,1779141600"; d="scan'208";a="454992085"
X-Amp-Result: SKIPPED(no attachment in message)
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>
Date: Fri, 24 Jul 2026 06:26:29 +0200
Message-ID: <23f5f721705e82a88212b4930d7876d4c1983ddf.1784867189.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.115.26.53]
X-ClientProxiedBy: OPE16NORMBX602.corporate.adroot.infra.ftgroup
 (10.115.26.30) To OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1784867195; x=1816403195;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=J4+Rl0iiaWngjf6C1v7Uu13pEHRRjt14fSfYBxwbSoA=;
 b=n+cuOk8VNRSEHiQ9F9KuoRjIKoJibH0jYhnGI2pXUF41Kb1eR1QyIt60
 oyzuhsN434sXevWbKqAklM+8a6rkoYTXiwlDYoTkJnkPC09z3qaLRcxcD
 +HK7Vc0E3NrvQPpGJ/JrxChQTmGKGmQvHUI6KVJaM7yezAM4wt8Gee0ue
 98IysR0/NL4XcJCSumkhHAgNG8rZfOZl4iCzHdGYROAd+qNvI80hhl3i9
 S+OhYyijwVJaEPxQg4dtu4mI5T7hrDZPfU7YvWr6uF+4gBbaKgAiIby/r
 Ff6BzKGa0f+H2h+8LLb8oIRT8Hgh8VMl4m+T7qfWyLd36c2HUAjtMe5ZR
 g==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=n+cuOk8V
Subject: [Buildroot] [PATCH] package/docker-credential-acr-env: needs NPTL
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

Fixes: https://autobuild.buildroot.org/results/525273d178d89ae8eef306d6ec662af368f20f73/

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
---
 package/docker-credential-acr-env/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/docker-credential-acr-env/Config.in b/package/docker-credential-acr-env/Config.in
index ddb101d52f..a4f7766fdd 100644
--- a/package/docker-credential-acr-env/Config.in
+++ b/package/docker-credential-acr-env/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_DOCKER_CREDENTIAL_ACR_ENV
 	bool "docker-credential-acr-env"
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL  # pthread_*_np()
 	help
 	  The ACR docker credential helper is an alternative to the
 	  existing file store based ACR helper [...] which relies
@@ -10,3 +11,7 @@ config BR2_PACKAGE_DOCKER_CREDENTIAL_ACR_ENV
 	  to push to Azure Container Registry.
 
 	  https://github.com/chrismellard/docker-credential-acr-env/
+
+comment "docker-credential-acr-env needs a toolcahin w/ NPTL"
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
