Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF59CC7115D
	for <buildroot@archiver.kernel.org>; Fri, 20 Jun 2025 08:10:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B35FC60E34;
	Fri, 20 Jun 2025 08:10:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8zjIImnbfDJs; Fri, 20 Jun 2025 08:10:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C472660E71
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C472660E71;
	Fri, 20 Jun 2025 08:10:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C465016B
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 08:10:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B366940DB4
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 08:10:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aNEODAK2HthQ for <buildroot@buildroot.org>;
 Fri, 20 Jun 2025 08:10:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.236;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6EB0340DC5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6EB0340DC5
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.236])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6EB0340DC5
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 08:10:24 +0000 (UTC)
X-CSE-ConnectionGUID: KBoJBxORSuCSsGvQ5HXgmw==
X-CSE-MsgGUID: tbcbtwtfQxeMDYt7xMDc2A==
Received: from unknown (HELO opfedv1rlp0f.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2025 10:10:22 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0f.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Jun 2025 10:10:18 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Fri, 20 Jun 2025 10:10:17 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Fri, 20 Jun 2025 10:10:16 +0200
X-CSE-ConnectionGUID: MjO4fi2gQKWk2CEQlvJ3Bw==
X-CSE-MsgGUID: wnTMPhmnSJColcUekQ7otA==
X-IronPort-AV: E=Sophos;i="6.16,250,1744063200"; d="scan'208";a="299860631"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>, Christian Stewart <christian@aperture.us>
Date: Fri, 20 Jun 2025 10:10:11 +0200
Message-ID: <424c15b5c3a2341e06b32f5481d391542c9437f8.1750407006.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1750407006.git.yann.morin@orange.com>
References: <cover.1750407006.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.26.50]
X-ClientProxiedBy: OPE16NORMBX208.corporate.adroot.infra.ftgroup (10.115.27.9)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1750407025; x=1781943025;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2f0DR046xVAl5sagfPnmseTMnihPs7Iae+7w2F3Jkbg=;
 b=jogGc6QmQLt3ME84J+j+oSr8/ESjbQlzdnp2VhoUsty2bJfAbsYIqimI
 S3ovBdDx8gSiW/uIqieVBh+3mHotQQ6cEvmuH4+KYg9b0BVb3vzocVW1G
 3KVdRIurXKwYdlZB0sQMDveoULj1vky4X8QisgcJyT3fT+fwVH3L7ZolP
 DwIk6D6VbTrBggzxjTaI1BKS+JypkUD6P1ssDxJA9cbCSTsorDFyL6vZg
 OvZ/WZo9D2czLIT9J7+4N/PJAnziocl1zak8OKSjbQCqVbSiW5xahTdlS
 3ANHlAkH7K8ynb3V6+HEdNLOwEMHdJnazVfzey4hy/lThO/XB2Rxpaqhu
 w==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=jogGc6Qm
Subject: [Buildroot] [PATCH 4/4] package/pkg-golang: catch use of legacy
 FOO_INSTALL_BINS
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
Cc: Christian Stewart <christian@aperture.us>
---
 docs/manual/migrating.adoc | 5 +++++
 package/pkg-golang.mk      | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/docs/manual/migrating.adoc b/docs/manual/migrating.adoc
index 4e6225a987..6ecc992502 100644
--- a/docs/manual/migrating.adoc
+++ b/docs/manual/migrating.adoc
@@ -222,3 +222,8 @@ from +-cargo2+ to +-cargo4+.
 In 2025.08, starting with systemd version 257, systemd-networkd requires kernel
 5.4 or later. If you are still using a kernel older than 5.4, please update
 your kernel or use an alternative network manager.
+
+[[migrating-golang-packages]]
+In 2025.08, the +FOO_INSTALL_BINS+ variable for golang packages is no longer
+supported; the list of binaries to install is automatically derived from
+the +FOO_BULD_TARGETS+ variable.
diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index ff8d28aa7e..ffd50adecc 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -40,6 +40,12 @@ GO_BIN = $(HOST_DIR)/bin/go
 
 define inner-golang-package
 
+# Legacy
+ifneq ($$($(2)_INSTALL_BINS),)
+$$(error Package $(1) sets $(2)_INSTALL_BINS, which is no longer supported; \
+see the manual: https://buildroot.org/manual.html#migrating-golang-package )
+endif
+
 $(2)_BUILD_OPTS += \
 	-ldflags "$$($(2)_LDFLAGS)" \
 	-modcacherw \
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
