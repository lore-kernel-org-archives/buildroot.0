Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A7DC71155
	for <buildroot@archiver.kernel.org>; Fri, 20 Jun 2025 08:10:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B76D140AEC;
	Fri, 20 Jun 2025 08:10:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IvumuBIPJVu7; Fri, 20 Jun 2025 08:10:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE0A040DB3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE0A040DB3;
	Fri, 20 Jun 2025 08:10:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1EA0916B
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 08:10:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 003418083D
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 08:10:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aZDv_oz_f2_O for <buildroot@buildroot.org>;
 Fri, 20 Jun 2025 08:10:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.238;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E2FA380898
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2FA380898
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.238])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E2FA380898
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 08:10:18 +0000 (UTC)
X-CSE-ConnectionGUID: vEP2lfX5QZeb00fUYtAqeA==
X-CSE-MsgGUID: N6OJyQcgTyC5PDyC8rJOnQ==
Received: from unknown (HELO opfedv1rlp0g.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2025 10:10:17 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0g.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Jun 2025 10:10:17 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Fri, 20 Jun 2025 10:10:15 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Fri, 20 Jun 2025 10:10:15 +0200
X-CSE-ConnectionGUID: aUozJdO7SW2zjobmd8/FFg==
X-CSE-MsgGUID: tBLsOP71RUCHko/MaCk/Og==
X-IronPort-AV: E=Sophos;i="6.16,250,1744063200"; d="scan'208";a="300126368"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>, Christian Stewart <christian@aperture.us>
Date: Fri, 20 Jun 2025 10:10:10 +0200
Message-ID: <b2fc2042e4900b3078f319592a27e8d1c6295c65.1750407006.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1750407006.git.yann.morin@orange.com>
References: <cover.1750407006.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.26.52]
X-ClientProxiedBy: OPE16NORMBX404.corporate.adroot.infra.ftgroup
 (10.115.26.17) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1750407019; x=1781943019;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EbwlIbNABHamUgLsasvyEyuHQu1xuRmBm5I4Ko6zzes=;
 b=Z1eRwUhXEjFjds+qeqCed8hc2ywkda6C9qs2gPd+f3W64qzponBRSGrN
 99cem5fS/gNXo7Kn1aNpwpW6rVJ4VPMwpoAdUbCDokvIFyqrQvRxARmhk
 pTCBDHrCDReWhmnfxvVN+pSVng5s2b9MvPZ7OoIjHKC31X/7LZap5gBY/
 agO4s+8mRq4tKOuTH3UyXEWDL+ssTf50V+52EgfTJGGSKrYthWniH+qwL
 IK+Mo0ZRykYtaShKcWAEkhe5Lo4XK7IjL+awlEnVVHsnM5rsSJRqwip5J
 KjfQzF/5/+n/gjr9IW6YiOEMYeunQca06q9Z66SVAQ+rfKyZZE9JcbHnd
 Q==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=Z1eRwUhX
Subject: [Buildroot] [PATCH 3/4] package/cni-plugin: simplify installation
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

In all theory, we could iterate over CNI_PLUGINS_INSTALL_BINS, which
already contains the basenames $(notdir) of the binaries to install,
but *_INSTALL_BINS is now an internal implementation detail, and
can't be guaranteed to be stable.

Hence, iterate over the list of targets, and somewhat duplicate the
install commands from the infra, using make's $(notdir) rather than
calling to the shell's to call basename.

Note: we need to stop setting _INSTALL_BINS, as a following commit will
check that it is not explicitly set, and fail otherwise.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Christian Stewart <christian@aperture.us>
---
 package/cni-plugins/cni-plugins.mk | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/cni-plugins/cni-plugins.mk b/package/cni-plugins/cni-plugins.mk
index bccc1674aa..9a9ecf103b 100644
--- a/package/cni-plugins/cni-plugins.mk
+++ b/package/cni-plugins/cni-plugins.mk
@@ -27,7 +27,6 @@ CNI_PLUGINS_BUILD_TARGETS = \
 	plugins/meta/portmap \
 	plugins/meta/tuning \
 	plugins/meta/vrf
-CNI_PLUGINS_INSTALL_BINS = $(CNI_PLUGINS_BUILD_TARGETS)
 
 ifeq ($(BR2_PACKAGE_LIBAPPARMOR),y)
 CNI_PLUGINS_DEPENDENCIES += libapparmor
@@ -46,9 +45,9 @@ endif
 
 define CNI_PLUGINS_INSTALL_TARGET_CMDS
 	$(INSTALL) -d -m 0755 $(TARGET_DIR)/opt/cni/bin
-	$(foreach d,$(CNI_PLUGINS_INSTALL_BINS),\
-		$(INSTALL) -D -m 0755 $(@D)/bin/$$(basename $(d)) \
-			$(TARGET_DIR)/opt/cni/bin
+	$(foreach d,$(CNI_PLUGINS_BUILD_TARGETS),\
+		$(INSTALL) -D -m 0755 $(@D)/bin/$(notdir $(d)) \
+			$(TARGET_DIR)/opt/cni/bin/$(notdir $(d))
 	)
 endef
 
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
