Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 133A1E77188
	for <buildroot@archiver.kernel.org>; Thu,  2 Jan 2025 07:29:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87B85406C9;
	Thu,  2 Jan 2025 07:29:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0qJIEtd40sgG; Thu,  2 Jan 2025 07:29:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0C65406C5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0C65406C5;
	Thu,  2 Jan 2025 07:29:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F0BCAE0F
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 07:29:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BC47E405B9
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 07:29:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RogGnc3aqSDT for <buildroot@buildroot.org>;
 Thu,  2 Jan 2025 07:29:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.123;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4F1AA4058B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F1AA4058B
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.123])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4F1AA4058B
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 07:29:13 +0000 (UTC)
X-CSE-ConnectionGUID: I/N+O7vXTJW0LqIJIh44Ew==
X-CSE-MsgGUID: CZP5ZW8KTaCOdDdFQbGWVw==
Received: from unknown (HELO opfedv1rlp0f.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2025 08:29:12 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0f.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 Jan 2025 08:29:11 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Thu, 2 Jan 2025 08:29:10 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Thu, 02 Jan 2025 08:29:09 +0100
X-CSE-ConnectionGUID: om6jT84ASH2Qx2/3qPQltw==
X-CSE-MsgGUID: baFMTEXWRx2ftKQyVrUJWA==
X-IronPort-AV: E=Sophos;i="6.12,284,1728943200"; d="scan'208";a="234323611"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>, Julien Olivain <ju.o@free.fr>
Date: Thu, 2 Jan 2025 08:29:09 +0100
Message-ID: <4b86d26a5cb2a78995974e86fc69b4ac1fe3d351.1735802949.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX106.corporate.adroot.infra.ftgroup (10.115.27.3)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1735802955; x=1767338955;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=e0ixZ1IzmpIdact7+naoI8JBrMTgLMF4wVQo/U/VokE=;
 b=s/szXbtz/BkeOEvcXC+YkYhOm5onjNbic0UzXbItA2m/YZiQU8MIPpAN
 WHa2vlknMDJ2ov3A14m9Edot9zARj37UaWiZP+KKTS8pebrFaqeQs9udu
 OAeDwF33hWqdNzbnKfXkthA6MRjZYjdUryrvxD+4tcsPrbhC/0huJqXiV
 kDNjoLWX0PExjEUaEPrJI6iEEF9z9ueKF+Meu55WOH7Mg0KLAXT9ofIYR
 CpX/CymGUvJv2ncyKScxmF95LOfBEzJhUDgrRCrYN4RzSmMs/WCj+l64p
 z0LlVK6Q/aRuc7KSRI1zbrv+8gJp6RdE8AOCITNnp3RyE0msP2Md0MK+g
 Q==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=s/szXbtz
Subject: [Buildroot] [PATCH] package/usbip: add missing kernel options
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

usbip needs USBIP_CORE, which needs network support (NET), and both
basic USB support (USB_SUPPORT) and host-side USB support (USB).
Both NET and USB are usually enabled, so they got missed when adding
usbip in f05f2c1ad717 (package/usbip: new package).

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Julien Olivain <ju.o@free.fr>
---
 package/usbip/usbip.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/usbip/usbip.mk b/package/usbip/usbip.mk
index 77dd341f9b..b4475c8d89 100644
--- a/package/usbip/usbip.mk
+++ b/package/usbip/usbip.mk
@@ -32,7 +32,9 @@ USBIP_AUTORECONF = YES
 USBIP_CONFIGURE_OPTS = --without-tcp-wrappers
 
 define USBIP_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_USB_SUPPORT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_USB)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_USBIP_CORE)
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
