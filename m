Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F911C83038
	for <buildroot@archiver.kernel.org>; Tue,  1 Jul 2025 13:46:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D16061201;
	Tue,  1 Jul 2025 13:46:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DgghQW8Bi0i4; Tue,  1 Jul 2025 13:46:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 044E161527
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 044E161527;
	Tue,  1 Jul 2025 13:46:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A1933197
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 13:46:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F277C41D01
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 13:46:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iRx2zQCJ6zyJ for <buildroot@buildroot.org>;
 Tue,  1 Jul 2025 13:46:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.121;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3E68441C83
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E68441C83
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.121])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3E68441C83
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 13:45:59 +0000 (UTC)
X-CSE-ConnectionGUID: qtc55TpkQCqDMLNm0ux2dQ==
X-CSE-MsgGUID: fHDlCFizTyuUcFageLnxNw==
Received: from unknown (HELO opfedv1rlp0h.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 15:45:59 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0h.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 01 Jul 2025 15:45:59 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57;
 Tue, 1 Jul 2025 15:45:57 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Tue, 01 Jul 2025 15:45:57 +0200
X-CSE-ConnectionGUID: oF/up5o8QVi1NLGotg377A==
X-CSE-MsgGUID: fNi/VtyFR86W/Z8LOTE1zw==
X-IronPort-AV: E=Sophos;i="6.16,279,1744063200"; d="scan'208";a="304286229"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>, Christian Stewart <christian@aperture.us>
Date: Tue, 1 Jul 2025 15:45:52 +0200
Message-ID: <71793243b832c0c9f397911ce0bdf08e03f660b4.1751377540.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1751377540.git.yann.morin@orange.com>
References: <cover.1751377540.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX101.corporate.adroot.infra.ftgroup (10.115.26.2)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1751377560; x=1782913560;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2f0DR046xVAl5sagfPnmseTMnihPs7Iae+7w2F3Jkbg=;
 b=bb8/sVO8UsXcuv+MENFSSfmUJXtFsBd3DnSknEphA5G473BIVGYKsZwX
 499DBAkOtsl1maro9Dt1nj1z0F2cUk3C6Swuch8NaJxuzn4nU5KzurEl4
 8XY89KLaz05ZwIvyyiOyPOsFtBicerrv2slV/G1LWOpVmSal/pXKrvnJw
 Adj6xbACA5oxq80a/r75EMC3iUDSRDZoVCJ26AtbwlNP2o6b7aPQcuptG
 Q/uhORtgkbRU1oQQ9dm119w7ZqgJWUGjrXMrnXIkpqOEadfbX3dSTWTnF
 +OCnW2MHr0xsOvYg25krpev4t5F9XX3Del5nTftSJ2Rw/GD3NBvxNcNPf
 g==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=bb8/sVO8
Subject: [Buildroot] [PATCH 4/4 v2] package/pkg-golang: catch use of legacy
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
