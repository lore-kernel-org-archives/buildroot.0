Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94384EA4FC4
	for <buildroot@archiver.kernel.org>; Mon, 23 Feb 2026 14:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 388D441AAA;
	Mon, 23 Feb 2026 14:18:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oxrJvbRZ59ZI; Mon, 23 Feb 2026 14:18:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B30E41AAC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771856294;
	bh=wo3T27sVyRjInZ8UaX2kQs2xJ3CaoHi0QG1DkPZDaDI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=T5feI2bp2Z13P87sPqhBh7ZTZJgWGu7WSV8kSkc3n/sojiVZBl9uPXza+RhRBVFpm
	 uBTSQIKbctChZd/BdEh6rarsVUTCXsPtPZckYBThjAIV5Hb16aovgG9IG+b5bEnufA
	 DlnuG/k44Riq2nWbVmlNMT7vjNBGVp2fYnZeSb7tF8VqPaLC8Mc2El2nbuJxO5XV9f
	 LGksfW2o1kvJrnBk5O3dIB7/xZBsmjiXH6r+Z23rrjyd4sakWyqA27Wr3dYD+vlCuD
	 ocPrelmJWNpo/sDh2ivxBRH+pcfXiUxaL6PQ4jBFLXzk/h1HAB6eVuVwEOfmNNs7uu
	 X4bF+ios8SBrQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B30E41AAC;
	Mon, 23 Feb 2026 14:18:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 247361CE
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 14:18:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 09F0040A08
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 14:18:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fDS4skH-SNpR for <buildroot@buildroot.org>;
 Mon, 23 Feb 2026 14:18:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.122;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6E62241A4F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E62241A4F
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.122])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6E62241A4F
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 14:18:06 +0000 (UTC)
X-CSE-ConnectionGUID: YpaaD5VPRECQMO9WXpbp/g==
X-CSE-MsgGUID: fhgmX3LyQ7KSbKrIPlZ6rQ==
Received: from unknown (HELO opfedv3rlp0c.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 23 Feb 2026 15:18:04 +0100
Received: from unknown (HELO OPE16NORMBX503.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0c.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 15:18:04 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX503.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37;
 Mon, 23 Feb 2026 15:18:02 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Mon, 23 Feb 2026 15:18:02 +0100
X-CSE-ConnectionGUID: AUwNpu4YTgKIhhMrYozmOw==
X-CSE-MsgGUID: r6Ld2PlbQuyyCb1PG2Z7Mw==
X-IronPort-AV: E=Sophos;i="6.21,306,1763420400"; d="scan'208";a="396029191"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Mon, 23 Feb 2026 15:17:47 +0100
Message-ID: <4991400fea4d0acfcca7062c0df172c0e914ea93.1771856260.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1771856259.git.yann.morin@orange.com>
References: <cover.1771856259.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.26.53]
X-ClientProxiedBy: OPE16NORMBX608.corporate.adroot.infra.ftgroup
 (10.115.27.32) To OPE16NORMBX503.corporate.adroot.infra.ftgroup
 (10.115.26.27)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1771856286; x=1803392286;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b4T6ildXFBioLQZPqJ3m/91Nm2IXQ1nxlIJ+Hm0zCdI=;
 b=NronWY/vCeqP4sDTWgbPSRKecELwNx03vrQ08DnwkTkyU73K2Yyp5aXo
 qjNk+7GqEJgKhLP2+gOHXGocbBUq/CvUlxelo/uypeFw8dL+XGh5S9YPJ
 ZwNSrDSx0pHwV32ejzVy0t/jHqQiwF6UeSk9gTP0xebBAP4GW3j5HY/LP
 ib7IbMy9HiLdkcpZk6X0nboo24ThPip71xU8N+P8gjnUkbQnVaqrCibBG
 IEAzErjI4ybw89JwvnqBLUS5MY16eoeuu7z/Ll/ixRB4GexQFfPEfRylp
 Y+VLpuB5c7Vt/MsmCx3zLfEQE+DxeHCtmkebb54Zj+CrYLgigXBxHL5nx
 w==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=NronWY/v
Subject: [Buildroot] [PATCH 7/8 v2] package/mosquitto: add options for
 password and ACL plugin
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

Until version 2.0.x, support for using static password or ACL files, was
builtin to the broker. With version 2.1.x, two new plugins have been
introdiuced to replace the builtin support, which is now deprecated and
will get removed in the next version.

Add two new configuration ooptions for those plugins.

We decded to do a single commit, rather than one per option, because
they are relatively tied together (ACL needs passwords, at least).

We also choose to make those options enabled by default, because the
traditional way to configure mosquitto is to use static files for
authentication and authorization, and the builtin support if now
deprecated in favour for the plugins.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Titouan Christophe <titouan.christophe@mind.be>
---
 package/mosquitto/Config.in    | 14 ++++++++++++++
 package/mosquitto/mosquitto.mk | 14 ++++++++++++--
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/package/mosquitto/Config.in b/package/mosquitto/Config.in
index 3df6131a5d..f7bd5a01b8 100644
--- a/package/mosquitto/Config.in
+++ b/package/mosquitto/Config.in
@@ -88,6 +88,20 @@ config BR2_PACKAGE_MOSQUITTO_BROKER_HTTP_API
 	  Add support for simple webserver as a listener to serve
 	  some of the HTTP API.
 
+config BR2_PACKAGE_MOSQUITTO_BROKER_PLUGIN_STATIC_PASSWD
+	bool "static password file plugin"
+	default y
+	help
+	  Add support for authentication based on static files. using
+	  a plugin rather than the legacy builtin support.
+
+config BR2_PACKAGE_MOSQUITTO_BROKER_PLUGIN_STATIC_ACL
+	bool "static ACL file plugin"
+	default y
+	help
+	  Add support for authorization (ACL) based on static files,
+	  using a plugin rather than the legacy builtin support.
+
 config BR2_PACKAGE_MOSQUITTO_BROKER_DYNAMIC_SECURITY_PLUGIN
 	bool "dynamic security plugin"
 	select BR2_PACKAGE_OPENSSL
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index ffd9c19e30..4d0f51176c 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -95,12 +95,22 @@ MOSQUITTO_CONF_OPTS += \
 	-DCMAKE_INSTALL_SYSCONFDIR=/etc \
 	-DWITH_BROKER=ON \
 	-DWITH_PLUGINS=ON \
-	-DWITH_PLUGIN_ACL_FILE=ON \
-	-DWITH_PLUGIN_PASSWORD_FILE=ON \
 	-DWITH_PLUGIN_EXAMPLES=OFF \
 	-DWITH_PLUGIN_PERSIST_SQLITE=OFF \
 	-DWITH_PLUGIN_SPARKPLUG_AWARE=OFF
 
+ifeq ($(BR2_PACKAGE_MOSQUITTO_BROKER_PLUGIN_STATIC_PASSWD),y)
+MOSQUITTO_CONF_OPTS += -DWITH_PLUGIN_PASSWORD_FILE=ON
+else
+MOSQUITTO_CONF_OPTS += -DWITH_PLUGIN_PASSWORD_FILE=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_MOSQUITTO_BROKER_PLUGIN_STATIC_ACL),y)
+MOSQUITTO_CONF_OPTS += -DWITH_PLUGIN_ACL_FILE=ON
+else
+MOSQUITTO_CONF_OPTS += -DWITH_PLUGIN_ACL_FILE=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_MOSQUITTO_BROKER_DYNAMIC_SECURITY_PLUGIN),y)
 MOSQUITTO_CONF_OPTS += -DWITH_PLUGIN_DYNAMIC_SECURITY=ON
 else
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
