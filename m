Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D899DFD8FC3
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 15:54:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC47461698;
	Thu, 26 Feb 2026 15:54:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id axu7x40nIgZd; Thu, 26 Feb 2026 15:54:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05CFE6167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772121274;
	bh=j4CKb7NLUy71Y4XCgv0MvLDTtUhPrKuAhQML3GxZwas=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=jUKmirQOmKF/LHni58Le4mNum1fleeP872Tno6yx9gNMq8H6vsChtuyd3K9dmzVrR
	 Zno5bvXLWLxk132u6R/qtqP0roWDe0mmXZq3n6yRm5KUqa9gk+jMTXUHF0pZeX8OiI
	 EXxDv7eWGeGCn7YA94Zq4CiL9txSYh1WJtel8VSTO9zAqhSrX6UiNHnslEkIiSCEaq
	 5wYFV32YLlD+JU50+6CKEZWZMoKH/hrh9vj7nIZpNRKC2m/Oy2TlNjszsOwCfwgDfL
	 Tar1dK5z1PeLRCOj+lpjM0zqgpHBLrJd9cJxcWNkiNMEjbB91WdZpExiv1oyq8r8zb
	 kUugwdQ24bjIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05CFE6167F;
	Thu, 26 Feb 2026 15:54:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F6A024E
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 15:54:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 05759418D4
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 15:54:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HS_aTOLdRZlm for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 15:54:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.236;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 968AA404CF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 968AA404CF
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.236])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 968AA404CF
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 15:54:31 +0000 (UTC)
X-CSE-ConnectionGUID: eZj6qEDlS7CMXAupoyvl6A==
X-CSE-MsgGUID: Ktk132hoTIGMIjbqHijeJg==
Received: from unknown (HELO opfedv1rlp0c.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 26 Feb 2026 16:54:30 +0100
Received: from unknown (HELO OPE16NORMBX503.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0c.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 16:54:29 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX503.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37;
 Thu, 26 Feb 2026 16:54:26 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Thu, 26 Feb 2026 16:54:26 +0100
X-CSE-ConnectionGUID: mEXgmkNoSGK//EixArhFDA==
X-CSE-MsgGUID: MecQAxRQRSazJn7EwHFn+A==
X-IronPort-AV: E=Sophos;i="6.21,312,1763420400"; d="scan'208";a="400427452"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Thu, 26 Feb 2026 16:54:05 +0100
Message-ID: <484bf45a56ffd2f343265076aefefdcfa8694aaa.1772121240.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1772121240.git.yann.morin@orange.com>
References: <cover.1772121240.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX608.corporate.adroot.infra.ftgroup
 (10.115.27.32) To OPE16NORMBX503.corporate.adroot.infra.ftgroup
 (10.115.26.27)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1772121272; x=1803657272;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8bsXEOnwi1esoLLVmODb6Zyd8ug7LCQ7CkQ4BYTFH/M=;
 b=YyY5Q5EnMs/7ojJPKymwTgRe//7cWHcKbWdVnADGtLMhW2nheeEe/RPE
 qNg06+6uFZ9uwyMAghY17E3/bo6ooA7bloK5mZzUPqMlrmxZ+JcdubqFa
 ztKY3WvBS2Omg/chrPIHsEeWleuMdtTI2oAslrU11D6yLwVTrJttqP9IB
 h27EnerO88/I3gwdflFxUSdiufFJmRi3imKHPinRr65OlJoGnffAbfZw1
 b955JJGdGQG9tpzXKfZVaouw9PVjyuYVfuHSL9rIyieq8xPck6SOLhNON
 D4nbchKieOQ12OAsfNM0tSrDPqh0mokUSlHvAVvjqCrQREOGWY2sJRF+I
 g==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=YyY5Q5En
Subject: [Buildroot] [PATCH 11/11 v3] package/mosquitto: add option to
 enable the $CONTROL/# topics tree
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
index 1ffb60dc77..e603683508 100644
--- a/package/mosquitto/Config.in
+++ b/package/mosquitto/Config.in
@@ -101,6 +101,13 @@ config BR2_PACKAGE_MOSQUITTO_BROKER_SYS
 	  Enable the $SYS/# tree structure, to export broker status as
 	  MQTT topics.
 
+config BR2_PACKAGE_MOSQUITTO_BROKER_CONTROL
+	bool "$CONTROL tree support"
+	default y  # legacy
+	help
+	  Enable the $CONTROL/# tree structure, to control the broker
+	  via messages posted to, or retrieved from, MQTT topics.
+
 config BR2_PACKAGE_MOSQUITTO_BROKER_PLUGIN_STATIC_PASSWD
 	bool "static password file plugin"
 	default y
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index cbb2db6281..9147756449 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -94,7 +94,8 @@ MOSQUITTO_CONF_OPTS += \
 	-DWITH_PLUGIN_ACL_FILE=$(if $(BR2_PACKAGE_MOSQUITTO_BROKER_PLUGIN_STATIC_ACL),ON,OFF) \
 	-DWITH_PLUGIN_DYNAMIC_SECURITY=$(if $(BR2_PACKAGE_MOSQUITTO_BROKER_DYNAMIC_SECURITY_PLUGIN),ON,OFF) \
 	-DINC_BRIDGE_SUPPORT=$(if $(BR2_PACKAGE_MOSQUITTO_BROKER_BRIDGE),ON,OFF) \
-	-DWITH_SYS_TREE=$(if $(BR2_PACKAGE_MOSQUITTO_BROKER_SYS),ON,OFF)
+	-DWITH_SYS_TREE=$(if $(BR2_PACKAGE_MOSQUITTO_BROKER_SYS),ON,OFF) \
+	-DWITH_CONTROL=$(if $(BR2_PACKAGE_MOSQUITTO_BROKER_CONTROL),ON,OFF)
 
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
