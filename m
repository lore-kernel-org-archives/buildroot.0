Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B2ACFD8FCE
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 15:54:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF1FC41F3F;
	Thu, 26 Feb 2026 15:54:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yQOpNY3e-2OY; Thu, 26 Feb 2026 15:54:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D23D742206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772121271;
	bh=g63maSh+ZdG5xMd6l/GJRAaVdP0/JCeCZE7l/DKhj20=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ZDQRQ8R01DPiuHvlnmpgPfERUa2fwl/z6dW4YIUmULAOdA2iZY9R0Cfe4VOe2lDCx
	 j92jJWiciDjdcSTGXhMFZRPSs+BiVaYy5Vdxd6jsXH/CjaREzfs2q8SADV51ZeVCbl
	 c5iYBsX4Waw+YSw7MIB6ReEEfXHmI8NtcBhUvOxk1i9PAsMoZ9FTJYGCS50AmvggWX
	 wiyzq72Nusls536j5G+7x0Y2vj6ycCSrYp545JLpmVfdWZ7snH6Pbiya2LzKNn4Xi5
	 3Rh/VDFLcmFgyx4oEx0jvHSSxXfai3zAOBd2vu56aadN90ivglV2MTzZEmqM6jDrWZ
	 Jft4kCUfZsfcg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D23D742206;
	Thu, 26 Feb 2026 15:54:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BDB3524E
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 15:54:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A3BDF6165E
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 15:54:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cX7Ah3ZC4YLc for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 15:54:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.239;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4F2D06167F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F2D06167F
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.239])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4F2D06167F
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 15:54:27 +0000 (UTC)
X-CSE-ConnectionGUID: EyJrNq0sSv2IY8EYJ65wVw==
X-CSE-MsgGUID: f6mx1l/yRom0qgflp2j9pA==
Received: from unknown (HELO opfedv1rlp0g.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 26 Feb 2026 16:54:26 +0100
Received: from unknown (HELO OPE16NORMBX503.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0g.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 16:54:26 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX503.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37;
 Thu, 26 Feb 2026 16:54:24 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Thu, 26 Feb 2026 16:54:24 +0100
X-CSE-ConnectionGUID: ejFr38epQvCQDG3knqu8UQ==
X-CSE-MsgGUID: fEA0WBTjSL274hmi+fEpGw==
X-IronPort-AV: E=Sophos;i="6.21,312,1763420400"; d="scan'208";a="396999573"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Thu, 26 Feb 2026 16:54:04 +0100
Message-ID: <8bfb807e7584647e71e4c8d1616c50adb78c90af.1772121240.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1772121240.git.yann.morin@orange.com>
References: <cover.1772121240.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX607.corporate.adroot.infra.ftgroup
 (10.115.27.31) To OPE16NORMBX503.corporate.adroot.infra.ftgroup
 (10.115.26.27)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1772121268; x=1803657268;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q40j+o0Fz4Ok2APZgjgssoll4Qfg9neSWAgVConVTpE=;
 b=Chx/Luw/+XSuaRF5q44Du78Hp1Ix51SWPAaMSdFtKGHVtak9xnWIgtJf
 4khX4PVlfSrOF60HUCg84UOZVU8wO1+uyGJOMTp/GvncuHudsT02zrFGj
 uKamadmwMLrfh/5ACufotKmpbXBTrhFhD/xhRVNpe2kEk2vt9ZOVdgp81
 exGMzZ+u43rMBtNARrfb1muiw9Wy8naTtja5e1HNNfpnLNIv9OOqr4X7j
 BPiCJ163n8/dTpv0DNNUl2xgY8xZNWRFXR6GfSPI8ofpX62XpmuyRhZ+z
 T3wI0aavDD6rUXJj9IYEnZX6QSH9bM/T33GHMyHAS1D14L+mr1aZfYcjC
 A==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=Chx/Luw/
Subject: [Buildroot] [PATCH 10/11 v3] package/mosquitto: add option to
 enable the $SYS/# topics tree
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
 package/mosquitto/Config.in    | 7 +++++++
 package/mosquitto/mosquitto.mk | 3 ++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/mosquitto/Config.in b/package/mosquitto/Config.in
index 477e88a2be..1ffb60dc77 100644
--- a/package/mosquitto/Config.in
+++ b/package/mosquitto/Config.in
@@ -94,6 +94,13 @@ config BR2_PACKAGE_MOSQUITTO_BROKER_BRIDGE
 	help
 	  Include bridge support for connecting to other brokers
 
+config BR2_PACKAGE_MOSQUITTO_BROKER_SYS
+	bool "$SYS tree support"
+	default y  # legacy
+	help
+	  Enable the $SYS/# tree structure, to export broker status as
+	  MQTT topics.
+
 config BR2_PACKAGE_MOSQUITTO_BROKER_PLUGIN_STATIC_PASSWD
 	bool "static password file plugin"
 	default y
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index a8ea33fca5..cbb2db6281 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -93,7 +93,8 @@ MOSQUITTO_CONF_OPTS += \
 	-DWITH_PLUGIN_PASSWORD_FILE=$(if $(BR2_PACKAGE_MOSQUITTO_BROKER_PLUGIN_STATIC_PASSWD),ON,OFF) \
 	-DWITH_PLUGIN_ACL_FILE=$(if $(BR2_PACKAGE_MOSQUITTO_BROKER_PLUGIN_STATIC_ACL),ON,OFF) \
 	-DWITH_PLUGIN_DYNAMIC_SECURITY=$(if $(BR2_PACKAGE_MOSQUITTO_BROKER_DYNAMIC_SECURITY_PLUGIN),ON,OFF) \
-	-DINC_BRIDGE_SUPPORT=$(if $(BR2_PACKAGE_MOSQUITTO_BROKER_BRIDGE),ON,OFF)
+	-DINC_BRIDGE_SUPPORT=$(if $(BR2_PACKAGE_MOSQUITTO_BROKER_BRIDGE),ON,OFF) \
+	-DWITH_SYS_TREE=$(if $(BR2_PACKAGE_MOSQUITTO_BROKER_SYS),ON,OFF)
 
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
