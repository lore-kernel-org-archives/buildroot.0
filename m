Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF4C3CD98DA
	for <buildroot@archiver.kernel.org>; Mon, 15 Jun 2026 11:13:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E9D76067D;
	Mon, 15 Jun 2026 11:13:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OMiLlN_2S0ld; Mon, 15 Jun 2026 11:13:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 697DB607FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781522003;
	bh=AT+phwlr/s4W1Q9isqQrJPT6kQpFQSxUXBAXRnulnIs=;
	h=From:To:CC:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KDDaOoC+n7koYtHO7GvciZ+C90IQ51yxyqz8V2f2QV+AWw3k70Ngu7tRlPcnHegYb
	 Kwx8IjW8wHAQp5DGIfyEGsOnbUwHl+MZMc8YPHBIjK4UeTYfSCVDyzaTvxhaKuGr0+
	 7dYGMjLqeKOeXr72BKhEIshGrGkQQ5e7EJ0TOjhK9XGcYsPw1lz/2R3Jzc4govjgMx
	 ZX7Kxo9TnO8dEsdpb3SEqQvBQuK5EkPI1ht/vHHE6NZaaHQFd7Kf9LVNXJEtsYapUj
	 JvOR2SOCoe6OgzBpjfzQJfiK/wp5lcJo2MjhOeUljhbK+g/xdvIBZ+OHS7dj/AijbS
	 z6CsOfLqG44xA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 697DB607FB;
	Mon, 15 Jun 2026 11:13:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 15977169
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 11:13:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 07EC482BE5
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 11:13:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MfL0OuJvwTwv for <buildroot@buildroot.org>;
 Mon, 15 Jun 2026 11:13:21 +0000 (UTC)
X-Greylist: delayed 430 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 15 Jun 2026 11:13:20 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9EF8882A0E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EF8882A0E
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.237;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.237])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9EF8882A0E
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 11:13:20 +0000 (UTC)
X-CSE-ConnectionGUID: k30LBbYHTciEGykQOO2hMg==
X-CSE-MsgGUID: Sl/xi9HDSmmi5zRBEMvU2w==
Received: from unknown (HELO opfedv1rlp0d.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 15 Jun 2026 13:06:08 +0200
Received: from unknown (HELO OPE16NORMBX506.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0d.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 13:06:07 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX506.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37;
 Mon, 15 Jun 2026 13:06:06 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Mon, 15 Jun 2026 13:06:05 +0200
X-CSE-ConnectionGUID: jZwHwDjCTbGqN3Fn5mefXg==
X-CSE-MsgGUID: xEaxbPrbTcq2Kq08gIAoIw==
X-IronPort-AV: E=Sophos;i="6.24,206,1774306800"; d="scan'208";a="442342643"
X-Amp-Result: SKIPPED(no attachment in message)
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>, Fiona Klute <fiona.klute@gmx.de>, Marcus Hoffmann
 <buildroot@bubu1.eu>
Date: Mon, 15 Jun 2026 13:06:05 +0200
Message-ID: <27c081656fb5af84e1919390565641af37485d91.1781521565.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.115.26.53]
X-ClientProxiedBy: OPE16NORMBX603.corporate.adroot.infra.ftgroup
 (10.115.26.31) To OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1781522001; x=1813058001;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BQVCowXbFd/pmPDG0JI7vR85z/Wz555ZAtfeFzwreXQ=;
 b=DqvyxRnwYnLwNhiXzMEkS2gXDGMeSWqND8eLIrii0LcSgju7KYoibLFx
 ne462CX1ySdzC8VgojjWFZwrZEH3QgXEHlm/oht8apoCsyKpieCmuHrUw
 HuuHKCnr5KTXgUoeJXWl+4ZR9aT15XKdS9NKX2QCEtEsRq/ZbnhJxVSfB
 JJOicEG5JSe1c2Q6cz19v6cWVNPOXCnM/Kh97u8bXBBOAnswtybiAFvHf
 5VAhoaeyc+x/4j9j8MlZoaIgf83sxJI7j9usWxpaX4isRaTIQY+TLIJnc
 DmMUe6TJpg1FqStf5XtTaqChoSeKxiWYHH5QzEfn6vxTBL8PXYLsNQhNS
 A==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=DqvyxRnw
Subject: [Buildroot] [PATCH] package/network-manager: drop initrd-related
 services when unneeded
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

Since NetworkManager 1.54, packaged since commit 24827ae398db
(package/network-manager: bump to 1.56.0), new services related to
running in an initrd are now installed, which prevents proper startup,
with systemd reporting that two units declare the same BusName.

When systemd is configured without initrd support, drop the
NetworkManager initrd-related services.

Fixes: 24827ae398db

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Fiona Klute <fiona.klute@gmx.de>
Cc: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/network-manager/network-manager.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 301c1ad43e..bf4f29c3cc 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -151,6 +151,12 @@ NETWORK_MANAGER_CONF_OPTS += \
 	-Dconfig_logging_backend_default=journal \
 	-Dsession_tracking=systemd \
 	-Dsuspend_resume=systemd
+ifneq ($(BR2_PACKAGE_SYSTEMD_INITRD),y)
+define NETWORK_MANAGER_CLEAN_INITRD
+	rm -f $(TARGET_DIR)/usr/lib/systemd/system/NetworkManager-*initrd.service
+endef
+NETWORK_MANAGER_POST_INSTALL_TARGET_HOOKS += NETWORK_MANAGER_CLEAN_INITRD
+endif
 else
 NETWORK_MANAGER_CONF_OPTS += \
 	-Dsystemd_journal=false \
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
