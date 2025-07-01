Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 155EEC8303A
	for <buildroot@archiver.kernel.org>; Tue,  1 Jul 2025 13:46:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDEED6151D;
	Tue,  1 Jul 2025 13:46:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tbTH5jGIbWuh; Tue,  1 Jul 2025 13:46:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42C4D6150A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42C4D6150A;
	Tue,  1 Jul 2025 13:46:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D0528179
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 13:46:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B725C41D05
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 13:46:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i_sxyMR1RO8H for <buildroot@buildroot.org>;
 Tue,  1 Jul 2025 13:46:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.123;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AC13940D31
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC13940D31
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.123])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AC13940D31
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 13:46:00 +0000 (UTC)
X-CSE-ConnectionGUID: 1HBmOcWxS96nGGJYWf0+xg==
X-CSE-MsgGUID: bBQ/J7gOScCy5LbLQCETTQ==
Received: from unknown (HELO opfedv1rlp0d.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 15:45:58 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0d.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 01 Jul 2025 15:45:58 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57;
 Tue, 1 Jul 2025 15:45:56 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Tue, 01 Jul 2025 15:45:55 +0200
X-CSE-ConnectionGUID: 6rpEasFGQNWuGXbUP+78BQ==
X-CSE-MsgGUID: tlv/SdhUT4Scpe/9NToovA==
X-IronPort-AV: E=Sophos;i="6.16,279,1744063200"; d="scan'208";a="308617487"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>, Christian Stewart <christian@aperture.us>
Date: Tue, 1 Jul 2025 15:45:51 +0200
Message-ID: <9bae67a128b0ad2744c28f3dbbd124dc28f5430d.1751377540.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1751377540.git.yann.morin@orange.com>
References: <cover.1751377540.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX407.corporate.adroot.infra.ftgroup
 (10.115.27.16) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1751377561; x=1782913561;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EbwlIbNABHamUgLsasvyEyuHQu1xuRmBm5I4Ko6zzes=;
 b=PXxRIDCCj5BPFF8ShuD6E5MkDMH4XAkKCrFpSuIGNfPB7UqbayKuW6Te
 DGx6ZxeuexHs6aV4eEWuNPvh05j9ldOHWOhL5t/TbP4Qq4YKhYENcMQEQ
 4yr3AL2iBGzGqJHCdBhTG75dga16o/Ihh3XVA9MTO202hyr+KQkTrPyPE
 H7lvPB521a2PIr+FH5OwuFytQbmmSSoNmK4wtcFzyJyjDVBeZ/zV4KcQy
 wl7RyX2QUvzaAfNL2E6ts4UOogHfu/w1qZfxJols8QNNdUUZaeB2fZLit
 0kwlO0Ny3rxHFmha36kai6024BET4jOxGz92Vw+IBlQ58t2W7YLaYcv0r
 A==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=PXxRIDCC
Subject: [Buildroot] [PATCH 3/4 v2] package/cni-plugin: simplify installation
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
