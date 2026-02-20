Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 083F1C55ABC
	for <buildroot@archiver.kernel.org>; Fri, 20 Feb 2026 11:53:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEDF983E90;
	Fri, 20 Feb 2026 11:53:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fsfArZhmI5yW; Fri, 20 Feb 2026 11:53:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F36483E91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771588410;
	bh=p+E7pBGR8CXqM7gCaZLlZy1macZegvCcRxsvjcoglnI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Yjo1DlaEqOnlORL121zem3f2lVKjoT6Q9kJOUwWtn9x952iOqj2wxl2YFTbwTyu4v
	 x7hpkGBlcwHxjgMgSawH+3HkBkqbr8VlvFI+EhG5yTBP9hk/1AaLY+IYOydD9qWWfB
	 m6jFcYrcr0hvKcz8tIsextKiHAv1P2KxW6/a2abms3+C5LSSxbXdGoLzAW8p8wMzwU
	 zZrDtdHIRIqK6IJYKb846FrxoGvgZ7rmtJbz62CtETYCr281tUdh7245UKYehNIPB/
	 Cnn38VcHmN0VzdBvn/L4hRHnhber5GiVW1Dm8RjL+2+TUVVZzR55O0gvkm5V7i52ik
	 oNx7wA+RdwSBg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F36483E91;
	Fri, 20 Feb 2026 11:53:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FE3A206
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 11:53:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 05EAE605A4
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 11:53:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 451qFwmaHXty for <buildroot@buildroot.org>;
 Fri, 20 Feb 2026 11:53:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.237;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DE6CF60650
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE6CF60650
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.237])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DE6CF60650
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 11:53:26 +0000 (UTC)
X-CSE-ConnectionGUID: n9IWfiN7TXSpHtWeGyj0LQ==
X-CSE-MsgGUID: IBHrsuerR6aDf2IlYWJSSQ==
Received: from unknown (HELO opfedv1rlp0e.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 20 Feb 2026 12:53:26 +0100
Received: from unknown (HELO OPE16NORMBX503.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0e.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 12:53:26 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX503.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37;
 Fri, 20 Feb 2026 12:53:25 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Fri, 20 Feb 2026 12:53:24 +0100
X-CSE-ConnectionGUID: RMZUAh+uTP+Uu/E3JTCOOg==
X-CSE-MsgGUID: +f2OS0SvRIWavctEUgWLuA==
X-IronPort-AV: E=Sophos;i="6.21,202,1763420400"; d="scan'208";a="394477339"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Fri, 20 Feb 2026 12:53:12 +0100
Message-ID: <ca402318fa59b7243d3003cf471fedee4114a775.1771588390.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1771588390.git.yann.morin@orange.com>
References: <cover.1771588390.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX503.corporate.adroot.infra.ftgroup
 (10.115.26.27) To OPE16NORMBX503.corporate.adroot.infra.ftgroup
 (10.115.26.27)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1771588407; x=1803124407;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xFCT6rS5ybyhyknd92e61ZiK2w23Qe9NZK8uiblng1g=;
 b=BNsh3IHtDzygMKqABOFhjUiTcidtW3537KctqsFFmzARwoNaP7FKqfsg
 X8rC9iB19uIlvTgCKiU7S/rRsBVOpKls+No9Oo764KDI0E6cUST2tk5j1
 2+POibttpK30o4Ai2mMFjyVKU24k3vwXm0mBMU/wj8WLgrF9usmsR5eJ7
 qQu1UFvR/ONQlPIBCQPkZpmLJ9/z/8Fum11sDRtucJomeMX7sLTEz6Fw5
 1cGUf7GWVoXbLFMbyJTGf7OqxYUmbNZ1TCUSjlvv2qhXmbstYQo3iv4Bb
 3+xzVW9I1ODQfE0cZI4oXhhmKxSH3T7kmj/g6QMD+LhftGuLV1XOCsliI
 Q==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=BNsh3IHt
Subject: [Buildroot] [PATCH 7/8] package/mosquitto: add options for password
 and ACL plugin
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
index 1a58b372d2..daa3441ec3 100644
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
