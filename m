Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD40FD8FD0
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 15:54:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B6B761677;
	Thu, 26 Feb 2026 15:54:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id enq6Ha5sDjRX; Thu, 26 Feb 2026 15:54:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F46761619
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772121265;
	bh=eIfS++ge235xA+k5+PrjBlTqFBVZejDDhbXOG5lDOU0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=FULMA60xCVYwewDgFckQnsf/UP74ENvHlDteAfA4fp1vTaDT7BCTZlHdrWzckW/by
	 UZgqSmp0j3WHwZXQaX5E99n8kcBiPAdYvlQSpLaGvv9OhXe0s2pqmJqbfxBvoCdiUb
	 UwmdTdQcxjM7DkrpC4xrEEbSwTKmN0G/3MQPTfl83SkOtPWv6GWcnJUdx9GMvzoIzr
	 EUtbekv+0Z5/1sFlBdmruIbIRPNFRt3j0EwV6QsjGHqPqU0l1CX6ppwp5DBAZV8Sy+
	 nV/BbIvtX8Fy/yeB20nMLtdpIehpq9K38jgAh7pjPIEsyzIsxr564h4rZAwTfX3hI2
	 K1lO1gqfY2UCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F46761619;
	Thu, 26 Feb 2026 15:54:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0300624E
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 15:54:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E89E542208
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 15:54:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pa_eg8jwJ7eT for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 15:54:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.123;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A943C40D35
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A943C40D35
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.123])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A943C40D35
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 15:54:22 +0000 (UTC)
X-CSE-ConnectionGUID: hF1+zpPXSE6MAKTlGYy97g==
X-CSE-MsgGUID: 0MoX/JiFQMaENhzh7uTy6A==
Received: from unknown (HELO opfedv1rlp0a.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 26 Feb 2026 16:54:19 +0100
Received: from unknown (HELO OPE16NORMBX503.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0a.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 16:54:19 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX503.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37;
 Thu, 26 Feb 2026 16:54:16 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Thu, 26 Feb 2026 16:54:15 +0100
X-CSE-ConnectionGUID: 3c9KZwM/Q6iUKY5FF2pE+A==
X-CSE-MsgGUID: N35uAkhsR3WXsW3dECNqcA==
X-IronPort-AV: E=Sophos;i="6.21,166,1763420400"; d="scan'208";a="399006770"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Thu, 26 Feb 2026 16:54:00 +0100
Message-ID: <9ac2fc7f9cb89c67ae048edfa505f0d7544ec6c7.1772121240.git.yann.morin@orange.com>
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
 t=1772121262; x=1803657262;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YwCjCEvkyT6efcxHFK81baW9IQ1uqLZsPEFyVXeNGfg=;
 b=l8QIl+Pxx7xiAeShvVJaF5vwNr0Y9FkR4j0v6nqS++4p49zB/Uur0euJ
 XoMrtiNKaT2L28HEPs5yCn4LXTo70iTyFaqYkaaIlHojq1MIujAhxgt2r
 0d1KFJijZqXl4870anKLCYY64qkIrlfok+ZCslpXnnetVTLPp0qZCX/Wz
 ec9FS8Y4OTMA5QFk/VcaZyiB0r4PtvBpjDWDfiMhYBY8gYzusos8gsoLN
 wikUXt/hD2nP8Mu2XpISqhN7njlnpuR3a+9+GZn8Mpgc3H77rBAIrwlD2
 yNKGuCXBc9pXHpt0w52FWv96sdlIb5vEfhLiFXN4whMBhRLj3yRNvJlMW
 g==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=l8QIl+Px
Subject: [Buildroot] [PATCH 06/11 v3] package/mosquitto: add option to
 enable HTTP API on listeners
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

The mosquitto broker (not the library) can have listeners configured to
serve HTTP requests; it can optionally accept (some) HTTP API requests
on such listeners.

Add a new option to enable the availability of http_pi.

Note that we do not just depend on libmicrohttpd to be enabled, because
the HTTP API is a security boundary, and enabling it must be an explicit
decision.

Co-developped-by: Titouan Christophe <titouan.christophe@mind.be>
[yann.morin@orange.com: make it an explicit option]
Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Titouan Christophe <titouan.christophe@mind.be>

---
Changes v2 -> v3:
  - move inside the broker conditional block in the .mk
---
 package/mosquitto/Config.in    | 12 +++++++++++-
 package/mosquitto/mosquitto.mk | 10 ++++++++--
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/package/mosquitto/Config.in b/package/mosquitto/Config.in
index bbc17bc00a..54bb4faebe 100644
--- a/package/mosquitto/Config.in
+++ b/package/mosquitto/Config.in
@@ -79,14 +79,24 @@ config BR2_PACKAGE_MOSQUITTO_BROKER
 	help
 	  Build and install the mosquitto broker onto target.
 
+if BR2_PACKAGE_MOSQUITTO_BROKER
+
+config BR2_PACKAGE_MOSQUITTO_BROKER_HTTP_API
+	bool "http_api"
+	select BR2_PACKAGE_LIBMICROHTTPD
+	help
+	  Add support for simple webserver as a listener to serve
+	  some of the HTTP API.
+
 config BR2_PACKAGE_MOSQUITTO_BROKER_DYNAMIC_SECURITY_PLUGIN
 	bool "dynamic security plugin"
-	depends on BR2_PACKAGE_MOSQUITTO_BROKER
 	select BR2_PACKAGE_OPENSSL
 	help
 	  Build and install the dynamic security plugin for
 	  mosquitto broker onto target.
 
+endif
+
 comment "mosquitto broker needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
 
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index 9b3bcc1cf5..160945d6d9 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -18,8 +18,7 @@ MOSQUITTO_CONF_OPTS = \
 	-DWITH_DOCS=OFF \
 	-DWITH_TESTS=OFF \
 	-DWITH_STATIC_LIBRARIES=OFF \
-	-DWITH_BUNDLED_DEPS=ON \
-	-DWITH_HTTP_API=OFF
+	-DWITH_BUNDLED_DEPS=ON
 
 # adns uses getaddrinfo_a
 ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
@@ -95,6 +94,13 @@ MOSQUITTO_CONF_OPTS += \
 	-DWITH_PLUGIN_PERSIST_SQLITE=OFF \
 	-DWITH_PLUGIN_SPARKPLUG_AWARE=OFF
 
+ifeq ($(BR2_PACKAGE_MOSQUITTO_BROKER_HTTP_API),y)
+MOSQUITTO_DEPENDENCIES += libmicrohttpd
+MOSQUITTO_CONF_OPTS += -DWITH_HTTP_API=ON
+else
+MOSQUITTO_CONF_OPTS += -DWITH_HTTP_API=OFF
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
