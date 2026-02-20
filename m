Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6CF6C55ABC
	for <buildroot@archiver.kernel.org>; Fri, 20 Feb 2026 11:53:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD05383E96;
	Fri, 20 Feb 2026 11:53:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7vBVss9LPfiC; Fri, 20 Feb 2026 11:53:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C48F83E9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771588414;
	bh=CgRmoBtqYhESmJZGvZoH5hmqx0KefkDYFAhheH/klhY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=eP8NibHDD/JRCVTNU8WumhyPtY0yGx7fH5+aiIoiqNyldSZkqrTY6TZ61BLIFWE4v
	 eP8Y3ysexibxHMOgZ1myj83LN30vLswymbSGYpCe8/N+g868NIn7p+a5KH4dPnySj7
	 SJSQIbwY+OyY4+smdsLnF3CtWwe6fITsrlimlUxkqC8k7eR5Xu9J7zFGvF1jjQnshj
	 JftYdK54FCnp+z6lw0QtnCjd3CzbbWQ1m3NhK4gv8IC3Np8UYOTvcVkrjqw1sw6GMg
	 ulCMxQAqAuPIIC3nA90/yKQVu8nmsRcv8CyHAdLsh22EIMIxgJunQvc76CvngBF2W9
	 eq9lGvxZ5so9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C48F83E9D;
	Fri, 20 Feb 2026 11:53:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 696601CE
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 11:53:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F1464051D
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 11:53:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tbux-Iyj8T-Z for <buildroot@buildroot.org>;
 Fri, 20 Feb 2026 11:53:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.121;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E22DB40524
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E22DB40524
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.121])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E22DB40524
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 11:53:28 +0000 (UTC)
X-CSE-ConnectionGUID: yq9ESTMNTsqMI+2/OWjhXA==
X-CSE-MsgGUID: mlaN18jfRQOo10wiAoQvcg==
Received: from unknown (HELO opfedv1rlp0g.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 20 Feb 2026 12:53:28 +0100
Received: from unknown (HELO OPE16NORMBX503.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0g.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 12:53:28 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX503.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37;
 Fri, 20 Feb 2026 12:53:26 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Fri, 20 Feb 2026 12:53:26 +0100
X-CSE-ConnectionGUID: pDKYSIzQSKeUpjtLiRT0IQ==
X-CSE-MsgGUID: OKnyyce4S2ujIGWm3tGX/Q==
X-IronPort-AV: E=Sophos;i="6.21,301,1763420400"; d="scan'208";a="394768731"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Fri, 20 Feb 2026 12:53:13 +0100
Message-ID: <0a67d2a3b35a4f15274830d78c422403e82889f7.1771588390.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1771588390.git.yann.morin@orange.com>
References: <cover.1771588390.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX501.corporate.adroot.infra.ftgroup
 (10.115.26.25) To OPE16NORMBX503.corporate.adroot.infra.ftgroup
 (10.115.26.27)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1771588409; x=1803124409;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=84ZWRnvOxCOOTpHD12BqgrFmFSeVU2xtd2rck3tQlZs=;
 b=bHKjfG/+mzca1jeNHApo7Miium04jmPNn8uLcDw2MAEj5YyYh1ns8ZY5
 XqtBMBQ+jv3EgsSyGB69B+nBKXlhFshyQa26Z6YNdTJ5ulEt2AzxwzY9a
 LACT1Z8oxPItmFJcsrKL4VOY2r6OHWUDeUi9IQeliGhYkFGSpBFMFH/wA
 44ESX2zuFsWuPW7lq4vKGAfbP7KMAcZkGe8f4Tffx/OUi8M3SobPkugiw
 lVeyKDi3hkIYSBg8peBHLt1FR+UwtDU0TMKWR/bZ/5XHJ/AE7mMyX94Zm
 P/idm0/I41XsHZV3km4mFvwPtjB8OSxXgcOP8TdJor8l8p8QU8CHEl49s
 w==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=bHKjfG/+
Subject: [Buildroot] [PATCH 8/8] package/mosquitto: add option to enable the
 persist-sqlite plugin
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

That plugin can be used instead of the builtin support to persist the
mosquitto state across restarts.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Titouan Christophe <titouan.christophe@mind.be>
---
 package/mosquitto/Config.in    | 7 +++++++
 package/mosquitto/mosquitto.mk | 8 +++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/package/mosquitto/Config.in b/package/mosquitto/Config.in
index daa3441ec3..360d0fb1f5 100644
--- a/package/mosquitto/Config.in
+++ b/package/mosquitto/Config.in
@@ -109,6 +109,13 @@ config BR2_PACKAGE_MOSQUITTO_BROKER_DYNAMIC_SECURITY_PLUGIN
 	  Build and install the dynamic security plugin for
 	  mosquitto broker onto target.
 
+config BR2_PACKAGE_MOSQUITTO_BROKER_PLUGIN_PERSIST_SQLITE
+	bool "persist-sqlite plugin"
+	select BR2_PACKAGE_SQLITE
+	help
+	  Add the persist-sqlite plugin, to persist the broker
+	  state across restarts.
+
 endif
 
 comment "mosquitto broker needs a toolchain w/ dynamic library"
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index 4d0f51176c..0650cfa37a 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -96,7 +96,6 @@ MOSQUITTO_CONF_OPTS += \
 	-DWITH_BROKER=ON \
 	-DWITH_PLUGINS=ON \
 	-DWITH_PLUGIN_EXAMPLES=OFF \
-	-DWITH_PLUGIN_PERSIST_SQLITE=OFF \
 	-DWITH_PLUGIN_SPARKPLUG_AWARE=OFF
 
 ifeq ($(BR2_PACKAGE_MOSQUITTO_BROKER_PLUGIN_STATIC_PASSWD),y)
@@ -117,6 +116,13 @@ else
 MOSQUITTO_CONF_OPTS += -DWITH_PLUGIN_DYNAMIC_SECURITY=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_MOSQUITTO_BROKER_PLUGIN_PERSIST_SQLITE),y)
+MOSQUITTO_DEPENDENCIES += sqlite
+MOSQUITTO_CONF_OPTS += -DWITH_PLUGIN_PERSIST_SQLITE=OM
+else
+MOSQUITTO_CONF_OPTS += -DWITH_PLUGIN_PERSIST_SQLITE=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 MOSQUITTO_CONF_OPTS += -DWITH_SYSTEMD=ON
 MOSQUITTO_DEPENDENCIES += systemd
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
