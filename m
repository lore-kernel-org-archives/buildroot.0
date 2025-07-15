Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 440C7C83F17
	for <buildroot@archiver.kernel.org>; Tue, 15 Jul 2025 04:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D79438232B;
	Tue, 15 Jul 2025 04:49:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SLM80erOeFA4; Tue, 15 Jul 2025 04:49:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9B9C821AB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9B9C821AB;
	Tue, 15 Jul 2025 04:49:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B5D3DCA
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 04:49:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 59ED94005B
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 04:49:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KwthMvrc3k_E for <buildroot@buildroot.org>;
 Tue, 15 Jul 2025 04:49:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.236;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 27A1040806
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27A1040806
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.236])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 27A1040806
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 04:49:46 +0000 (UTC)
X-CSE-ConnectionGUID: R/9aPivrTCmK923QbGwykg==
X-CSE-MsgGUID: I7z78e7OTpKwUVvjCRmjXw==
Received: from unknown (HELO opfedv1rlp0h.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 06:49:44 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0h.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 15 Jul 2025 06:49:44 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57;
 Tue, 15 Jul 2025 06:49:42 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Tue, 15 Jul 2025 06:49:47 +0200
X-CSE-ConnectionGUID: 5ie+6w2VTBGNF7m/S32HIA==
X-CSE-MsgGUID: BdFWqbZPRFeVdSs3dvGlnw==
X-IronPort-AV: E=Sophos;i="6.16,312,1744063200"; d="scan'208";a="309239815"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>, Julien Olivain <ju.o@free.fr>
Date: Tue, 15 Jul 2025 06:49:47 +0200
Message-ID: <725a89cbad59708b94cac3eddb422dc5a0d305dc.1752554987.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.115.26.52]
X-ClientProxiedBy: OPE16NORMBX202.corporate.adroot.infra.ftgroup (10.115.26.7)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1752554987; x=1784090987;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=H3qPHyHQZoKc9ut319ZxO8ei82antXCSC+XOeacpbdI=;
 b=BnlCrFcVKmtFvwZljCpyqWi7hr/tfPRkf9BMJlbN5/l9IzlL6dft1oC1
 unSjxwVYHSAOya6d+ukBDwrTh186LtDMvkLOUVKjlypd8nEY6rwFpzkfo
 IafGFKhat3K+NO+wtScjWtyHTlvpb3lA1sN/mLSNjEHg33vDGMZsgucKa
 LO6T6uFgZq8u5T/v6nBpb7hjKMURZrjtBkXIHVpyphK57MYPSD1azpfje
 DpOLjirPWsOEb7ZRNgwTPGimOuoFUZqdyQjOaxON8goZ6JdzSHerW/XJl
 djCl0wk7NDBHE4qHSJnwgC5PtpbV0ZcuB0ktkwtRVfXly6p/ixVIZ652J
 Q==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=BnlCrFcV
Subject: [Buildroot] [PATCH] package/passt: needs headers >= 5.0
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

Upstream passt only documents runtime dependencies; and they advertise
being able to run on kernel 3.8 or later. However, they do not document
the build dependencies.

As reported by Julien, since 2024_12_11.09478d5, upstream requires
kernel headers >= 5.0, as they make use of linux/vhost_types.h, only
introduced in 5.0.

Add a dependency to kernel headers, and propagate it to podman's passt
backend.

Reported-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin@orange.com>

---
Changes v1 -> v2:
  - only hide the passt backend, not the whole of podman  (Julien)
---
 package/passt/Config.in  | 4 ++++
 package/podman/Config.in | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/package/passt/Config.in b/package/passt/Config.in
index a2d2f4f1fe..a93a088670 100644
--- a/package/passt/Config.in
+++ b/package/passt/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PASST
 	bool "passt"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
 	help
 	  passt: Plug A Simple Socket Transport
 	  pasta: Pack A Subtle Tap Abstraction
@@ -17,3 +18,6 @@ config BR2_PACKAGE_PASST
 	  hence not requiring any capabilities or privileges.
 
 	  https://passt.top/passt/about/
+
+comment "passt needs a toolchain w/ headers >= 5.0"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
diff --git a/package/podman/Config.in b/package/podman/Config.in
index 6bfd477f38..a6554a3ddc 100644
--- a/package/podman/Config.in
+++ b/package/podman/Config.in
@@ -72,8 +72,12 @@ choice
 
 config BR2_PACKAGE_PODMAN_NET_PASST
 	bool "passt/pasta"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0  # passt
 	select BR2_PACKAGE_PASST  # runtime
 
+comment "passt/pasta backend needs a toolchain w/ headers >= 5.0"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
+
 config BR2_PACKAGE_PODMAN_NET_SLIRP4NETNS
 	bool "slirp4netns"
 	select BR2_PACKAGE_SLIRP4NETNS  # runtime
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
