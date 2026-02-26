Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D95D1FD8FD0
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 15:54:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF9B761649;
	Thu, 26 Feb 2026 15:54:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8qAKrKu2469s; Thu, 26 Feb 2026 15:54:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B350E61661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772121269;
	bh=dIRwjk8wEC6JBUxD7MnycT9KT26rE0Yn1pBnrgg8C9E=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Y461x/qibz0AzotcMaKdJY6d+fFPR7a50e1EmoaBC8ng95t2B8KdKTwjFy9fE3Lua
	 E2Wk02grQqFyB+TCXd6rLVn3AJzdF1DSKmtSzlWP2h7faFp1L/BO/8nPew+oYzgsGi
	 J4uF7hRkVHhOksWoeMckWndW3NrdFNCefCz1eURFrPy0wzYUVhhC+2mYEDE83GLhyO
	 5b5K4WLy52RAprHKq4d+UlmBMyAo2VmtCD/gXfNPRe6vk6jqr5jlKOK0js1++INCOD
	 SdGPZ81UASOrPvv8Z+rWzCoPW5VZLUAMDVA4oz7jXh+TyIm6B0yTi1vsU9SJFx/o25
	 4EUH1Qg9c/CeQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B350E61661;
	Thu, 26 Feb 2026 15:54:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7947224E
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 15:54:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5E81161684
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 15:54:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K_RrNONXksh9 for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 15:54:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.239;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 266C761089
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 266C761089
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.239])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 266C761089
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 15:54:25 +0000 (UTC)
X-CSE-ConnectionGUID: IdmuYayVTfyEv7Vql8i8dA==
X-CSE-MsgGUID: 0RD/IXegTFaktTcQlw1kzw==
Received: from unknown (HELO opfedv1rlp0g.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 26 Feb 2026 16:54:23 +0100
Received: from unknown (HELO OPE16NORMBX503.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0g.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 16:54:22 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX503.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37;
 Thu, 26 Feb 2026 16:54:20 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Thu, 26 Feb 2026 16:54:19 +0100
X-CSE-ConnectionGUID: 3GZVejiEQOinLkfde7Xerg==
X-CSE-MsgGUID: 8B9aoqQGSiiZHF0OdAG4Hw==
X-IronPort-AV: E=Sophos;i="6.21,312,1763420400"; d="scan'208";a="396999569"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Thu, 26 Feb 2026 16:54:02 +0100
Message-ID: <5cec881be3d44fb6d5b4fae4b90ef1a6a191d594.1772121240.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1772121240.git.yann.morin@orange.com>
References: <cover.1772121240.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX602.corporate.adroot.infra.ftgroup
 (10.115.26.30) To OPE16NORMBX503.corporate.adroot.infra.ftgroup
 (10.115.26.27)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1772121266; x=1803657266;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+ml0Lu7Mpfh1VRggFwLZLF6m1kMuJxxhs4xNjDQYYHg=;
 b=kdmHOh4yv7wEbqFU4jgpDMksa32/2TwZotA9ZrTteGRcF9Kr41pCXXkS
 H/e/9BP4bCeaBbfykA04soaHgwqD9Lle2haoZhW6f5QEP3SycW32Vq1bT
 IAgdo6+ovVLZFg1o0g8lCfsLNkWGzccYmd4LGoZdMdO4gRmJYQaXUIZWT
 YgEVcInGt2TR63Zm2zb9M7lRsZcOm+lkD+BSvC5egE8Sf3yS9Vg99JdhW
 3M+jDr+Shkjis0MshzT4yaKlWdWOVMlzhPc1JRcWPsDbknh7nYX9wWEJr
 loDUg8TwUAd689vubWH/i74NzdDLJ/Mu10D05kKpFue8Ts7W4pm9gdMn3
 w==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=kdmHOh4y
Subject: [Buildroot] [PATCH 08/11 v3] package/mosquitto: add option to
 enable the persist-sqlite plugin
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

Note that this plugin has a dependency, so we don't use the $(if)
one-liner.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Titouan Christophe <titouan.christophe@mind.be>
---
 package/mosquitto/Config.in    | 7 +++++++
 package/mosquitto/mosquitto.mk | 8 +++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/package/mosquitto/Config.in b/package/mosquitto/Config.in
index 1d7cd96aba..02a30c03e5 100644
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
index d95583d768..246dcb8227 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -89,7 +89,6 @@ MOSQUITTO_CONF_OPTS += \
 	-DWITH_BROKER=ON \
 	-DWITH_PLUGINS=ON \
 	-DWITH_PLUGIN_EXAMPLES=OFF \
-	-DWITH_PLUGIN_PERSIST_SQLITE=OFF \
 	-DWITH_PLUGIN_SPARKPLUG_AWARE=OFF \
 	-DWITH_PLUGIN_PASSWORD_FILE=$(if $(BR2_PACKAGE_MOSQUITTO_BROKER_PLUGIN_STATIC_PASSWD),ON,OFF) \
 	-DWITH_PLUGIN_ACL_FILE=$(if $(BR2_PACKAGE_MOSQUITTO_BROKER_PLUGIN_STATIC_ACL),ON,OFF) \
@@ -102,6 +101,13 @@ else
 MOSQUITTO_CONF_OPTS += -DWITH_HTTP_API=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_MOSQUITTO_BROKER_PLUGIN_PERSIST_SQLITE),y)
+MOSQUITTO_DEPENDENCIES += sqlite
+MOSQUITTO_CONF_OPTS += -DWITH_PLUGIN_PERSIST_SQLITE=OM
+else
+MOSQUITTO_CONF_OPTS += -DWITH_PLUGIN_PERSIST_SQLITE=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 MOSQUITTO_DEPENDENCIES += systemd
 MOSQUITTO_CONF_OPTS += -DWITH_SYSTEMD=ON
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
