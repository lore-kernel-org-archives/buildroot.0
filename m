Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D21C5DF86
	for <buildroot@archiver.kernel.org>; Thu, 20 Aug 2026 08:19:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9DDD405A9;
	Thu, 20 Aug 2026 08:19:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oIp3yRv_MeKd; Thu, 20 Aug 2026 08:19:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787213994;
	bh=tuw3/s91OJXY4ZNPcMlUMRVJnFWqiDP0kfrsijtzwsc=;
	h=From:To:CC:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bd5Joql1B/uOO6BTHaJkCjaGSS1GkWpA/t7ZTJ61CefKtvwgl99qXJidH2wyAh86/
	 ssKjdcIKS1RnW0EzmHT1Ru4YaJ4BJMwwIuh0Du3x9K5WWPSsCD2YjeYlaKd1Cxxzg+
	 Wcj4rBwkDoCGywfK88ooQNBvdGJGmfwOVy3btendlpHAtxlzLjuykrHsTU7kSA6wxM
	 lK4PsRPFHUnJjnVpb29UZcRBOLEh9oHMo+q3e0vhzuEmhECrxIHpLnZ+4skZCPlU1E
	 YkhGkT1++Q5d03Y6uzIIaJFuRNwD5G9qJ0ljAjUs0pJciYXRagSDRhCMC6E104Lin3
	 HXtR+yNRQoxKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06698405AB;
	Thu, 20 Aug 2026 08:19:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D7221395
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 08:19:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2EFFD80C09
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 08:19:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mV36rZC2d6tx for <buildroot@buildroot.org>;
 Thu, 20 Aug 2026 08:19:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.236;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=orange.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=gy9rog0u
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.236])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DD5D480B28
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 08:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1787213992; x=1818749992;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tyRsFrIMJL9v0b6FZDiUFLJMuDg2JJ7vrpAkopaJp0Q=;
 b=gy9rog0uPm2Armbb1uPKGWkRy5yPl50DCwfQDIWdLwHzKXNfZxDaaN3r
 DF9S2ykthtYa517np3QL2aAmk8WrRo65JP9hbwqJjHmaEhRgVItrti/G0
 2ovhyr/AwL2qj0UwIYsO3iU1pqfNKTf9BzA+1v9KdP+GzlwaV4vBv4cKs
 OBE8QA7vyfyMdCqacQraqOvdBTTyzOw9ZU7kQVfQKQQ1rqw7h+dqDY/DY
 65Rp+Rly6MtBir/5sd+0txuHQWcA+ZQewJmecI5BVhQS6kB8UP+p4tr05
 ybd2XtWEV05jZChMdtC0Qw6xgOJUZjFAZYne5+cIqttXFP5bR5GLuOzSR A==;
X-CSE-ConnectionGUID: bMIU2x8hS02AiHNCyIGGoQ==
X-CSE-MsgGUID: vDpaWYfqTXKw3WVInrG0nw==
Received: from unknown (HELO opfedv1rlp0f.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 20 Aug 2026 10:19:49 +0200
Received: from unknown (HELO OPE16NORMBX506.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0f.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 10:19:48 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX506.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45;
 Thu, 20 Aug 2026 10:19:47 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Thu, 20 Aug 2026 10:19:49 +0200
X-CSE-ConnectionGUID: qUm7pkCwT1uAbJ2Y8YAusQ==
X-CSE-MsgGUID: /kLf6jTsTA+z7UvLmVfvOw==
X-IronPort-AV: E=Sophos;i="6.25,232,1779141600"; d="scan'208";a="462874495"
X-Amp-Result: SKIPPED(no attachment in message)
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>
Date: Thu, 20 Aug 2026 10:19:47 +0200
Message-ID: <2c4716290a8321f1f228f1727f90184dde5d877d.1787213987.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <bf210af2584f4d87783ac68fbe94236a5cffd65f.1787213987.git.yann.morin@orange.com>
References: <bf210af2584f4d87783ac68fbe94236a5cffd65f.1787213987.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.26.53]
X-ClientProxiedBy: OPE16NORMBX607.corporate.adroot.infra.ftgroup
 (10.115.27.31) To OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26)
Subject: [Buildroot] [PATCH 2/2] DEVELOPERS: add Yann E. MORIN (work) for
 distribution-registry
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
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 98c9ee55d3..f4e296abc2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3517,6 +3517,7 @@ F:	package/tpm2-pkcs11/
 N:	Yann E. MORIN <yann.morin@orange.com>
 F:	.editorconfig
 F:	package/amazon-ecr-credential-helper/
+F:	package/distribution-registry/
 F:	package/docker-credential-acr-env/
 F:	package/docker-credential-gcr/
 F:	package/gpsd/
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
