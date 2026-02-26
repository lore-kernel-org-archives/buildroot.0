Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4FD3FD8FD1
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 15:54:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB95F8478B;
	Thu, 26 Feb 2026 15:54:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tQ4_nnW2QJBW; Thu, 26 Feb 2026 15:54:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBC8C847B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772121270;
	bh=gpwZHGx9HqjY3SwSEQoA1cT1M60neclKZ7gCR/oTlVY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=IuVfMTUyP/LJJIAPJJF/Zpc6hT6jX4IdVWth1aVSvWlJwo6fKObIiexbaSs+AdaOS
	 SBOpme31qNRorlgIt0sPosVRDJrk5DmGCWZYaUOlivG4iBgHeACsfxKrSP8z64rr9z
	 777PGikvb8pr4xJ3IvZbg9WqcmJYK/6Xw46KQ959r4bjMyFAcAWRJm5c9VqCvKylD7
	 7Y6XTvufULHsIyjmhKvGVtVx4WzUw6IJz7tOT/ocl9hPDNV7zmFWuRz9F4/4twxx+M
	 M7Tuun2j01OKE0mB39jWOfYBUKmf4pVt9ThALmq9QTtc+xFr09aIb36IAIRyEQrpgz
	 hOxBnaQhKjivw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBC8C847B3;
	Thu, 26 Feb 2026 15:54:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 686D0204
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 15:54:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E8464220B
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 15:54:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fyf3wnoTD3Wc for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 15:54:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.122;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4838E42204
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4838E42204
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.122])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4838E42204
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 15:54:26 +0000 (UTC)
X-CSE-ConnectionGUID: FpZPSCXsSyKHrMwT8SFz5A==
X-CSE-MsgGUID: pLhJJAZpSzWCp9EEpW1Hhw==
Received: from unknown (HELO opfedv1rlp0d.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 26 Feb 2026 16:54:24 +0100
Received: from unknown (HELO OPE16NORMBX503.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0d.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 16:54:24 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX503.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37;
 Thu, 26 Feb 2026 16:54:22 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Thu, 26 Feb 2026 16:54:21 +0100
X-CSE-ConnectionGUID: 9pq61oymR/6ozmL6hojIgA==
X-CSE-MsgGUID: jlD2w8DYQOqCAQAAZDxknQ==
X-IronPort-AV: E=Sophos;i="6.21,202,1763420400"; d="scan'208";a="400664627"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Thu, 26 Feb 2026 16:54:03 +0100
Message-ID: <44dd8b03ac9a5e40994b1a59284293de00f3abf8.1772121240.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1772121240.git.yann.morin@orange.com>
References: <cover.1772121240.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX605.corporate.adroot.infra.ftgroup
 (10.115.27.29) To OPE16NORMBX503.corporate.adroot.infra.ftgroup
 (10.115.26.27)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1772121267; x=1803657267;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xWrqp/MRpX6XQZB6cugBG+Bx7TckhIC5PfX44ZwXcpc=;
 b=VdyFPkNcZqAkY/LRAPW3lfCmR81YCKvNbJ5g/RoUOD5suF0l9w9Chc5N
 3fPp/9RzAfpIlVaND7SK52LRxET8MVzK9xw9QFrqMMNbLokwbwOXczk56
 RCPpeSuk86EOxIMBZIvPWo35MuHErTbjzreNtf/gaX2yNVV9bKZbXT5bP
 vYOl0gbPtllbGri0mEW/7gOiWjnN7m3R+H6ubJV6IfKLp+x1R+5ybQ1Gm
 WJeHSHqMVotKXcSAv41C4rF2YvflSk/OaLhwedchFsTw0JRhBau9HE4Fo
 0Bnhbz9EWpToIWuHHdRm8NpVu9Zaxqh6ovcxdC3FpKLYfodjSYwd8vR9+
 Q==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=VdyFPkNc
Subject: [Buildroot] [PATCH 09/11 v3] package/mosquitto: add option to
 enable bridge support
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
Cc: yann.morin@orange.com, Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Titouan Christophe <titouan.christophe@mind.be>
---
 package/mosquitto/Config.in    | 6 ++++++
 package/mosquitto/mosquitto.mk | 3 ++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/mosquitto/Config.in b/package/mosquitto/Config.in
index 02a30c03e5..477e88a2be 100644
--- a/package/mosquitto/Config.in
+++ b/package/mosquitto/Config.in
@@ -88,6 +88,12 @@ config BR2_PACKAGE_MOSQUITTO_BROKER_HTTP_API
 	  Add support for simple webserver as a listener to serve
 	  some of the HTTP API.
 
+config BR2_PACKAGE_MOSQUITTO_BROKER_BRIDGE
+	bool "bridge support"
+	default y  # legacy
+	help
+	  Include bridge support for connecting to other brokers
+
 config BR2_PACKAGE_MOSQUITTO_BROKER_PLUGIN_STATIC_PASSWD
 	bool "static password file plugin"
 	default y
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index 246dcb8227..a8ea33fca5 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -92,7 +92,8 @@ MOSQUITTO_CONF_OPTS += \
 	-DWITH_PLUGIN_SPARKPLUG_AWARE=OFF \
 	-DWITH_PLUGIN_PASSWORD_FILE=$(if $(BR2_PACKAGE_MOSQUITTO_BROKER_PLUGIN_STATIC_PASSWD),ON,OFF) \
 	-DWITH_PLUGIN_ACL_FILE=$(if $(BR2_PACKAGE_MOSQUITTO_BROKER_PLUGIN_STATIC_ACL),ON,OFF) \
-	-DWITH_PLUGIN_DYNAMIC_SECURITY=$(if $(BR2_PACKAGE_MOSQUITTO_BROKER_DYNAMIC_SECURITY_PLUGIN),ON,OFF)
+	-DWITH_PLUGIN_DYNAMIC_SECURITY=$(if $(BR2_PACKAGE_MOSQUITTO_BROKER_DYNAMIC_SECURITY_PLUGIN),ON,OFF) \
+	-DINC_BRIDGE_SUPPORT=$(if $(BR2_PACKAGE_MOSQUITTO_BROKER_BRIDGE),ON,OFF)
 
 ifeq ($(BR2_PACKAGE_MOSQUITTO_BROKER_HTTP_API),y)
 MOSQUITTO_DEPENDENCIES += libmicrohttpd
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
