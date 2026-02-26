Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EEF4FD8FCE
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 15:54:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F07A0615D0;
	Thu, 26 Feb 2026 15:54:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jGR7YQOpTAWw; Thu, 26 Feb 2026 15:54:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6BD26160B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772121261;
	bh=hX7URdto9jJLj5wVtagyTh6dtp1Qaow2yyyo6KyVkR0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=NeEYR3Wo84Mzqc6QcUfHltNvS8GEAcXsJr2jHR0AnvIW550NaIh1nY+GOI8QAKzBe
	 RE5s7dZzfdVrdeqv8Z5zang2j9FmYFqjy+GlvAKilyFoeKO/mmdytJNKH7yUP4mnAm
	 /PP6qBFmhiInrXAqxc7CL+xgE8DnNXljxDQ02Uxt0CuIX55567feF0YKf7skHpeTUl
	 VCDjJe3RqhWYlIO1IaT2I1qd/U1IvCQTnhnH/Ifb+QbQUS6UH5myARtVgLq1BKOTi8
	 8kZIz4uFD2EYj8iKquSaUAaWVVXu4S4Qg0ZTnwtK1eIEyQSWWa+tK2hGNSg2zz1T4k
	 3huYwxNNfDXvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6BD26160B;
	Thu, 26 Feb 2026 15:54:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D7A524E
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 15:54:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB23184790
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 15:54:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QF82Q5aBYDoO for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 15:54:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.238;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A12B2847B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A12B2847B3
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.238])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A12B2847B3
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 15:54:16 +0000 (UTC)
X-CSE-ConnectionGUID: B16/5t6+TKGXuhUXWHjBFA==
X-CSE-MsgGUID: tHz9S7+WRNyE87Hn60kOxQ==
Received: from unknown (HELO opfedv1rlp0g.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 26 Feb 2026 16:54:16 +0100
Received: from unknown (HELO OPE16NORMBX503.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0g.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 16:54:16 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX503.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37;
 Thu, 26 Feb 2026 16:54:14 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Thu, 26 Feb 2026 16:54:13 +0100
X-CSE-ConnectionGUID: h67zsShPRNqoH4HbAmgpAA==
X-CSE-MsgGUID: ALD0/DU5Tk6F0CuCXrYJIw==
X-IronPort-AV: E=Sophos;i="6.21,312,1763420400"; d="scan'208";a="396999564"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Thu, 26 Feb 2026 16:53:59 +0100
Message-ID: <513e5a0968caed0f71fc78c1a684b892977b8806.1772121240.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1772121240.git.yann.morin@orange.com>
References: <cover.1772121240.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX603.corporate.adroot.infra.ftgroup
 (10.115.26.31) To OPE16NORMBX503.corporate.adroot.infra.ftgroup
 (10.115.26.27)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1772121257; x=1803657257;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6i0GJfrYZ3/QwCh6QuNa/rHTZPVuZlZhoskfqbVoT5Q=;
 b=njm8mRNsMMJvxyA55GJ1jwBGJW9A1dKUU5l3AShKh8/vxlrcWwh2QD6o
 Nfu1072/hNcZS6vOCNiupubAJBJuNYyth7TjfHYFZovdATqWPSmkFkji3
 wLZg5+VPnl9kMuecfBPh1rgOADiea26TFkp60JgJwt6oi4vjd58K7PcMu
 jQa0g3ZQRty7dLx3qpmF7rZ+JY+DkarmYqlgfhZTLQNCJFDM/KoCJ2hG2
 GrAEqN+ENA7SeaUnpF6jO+/kPZr7kr1Ie6Py+nvCNM8iSp0uP++n+DFk2
 hkRRZosNrC2Kjpj32bjEHk2XkS0KBi4YORyyNmZoSwG/HUEW5AjIdA2dJ
 g==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=njm8mRNs
Subject: [Buildroot] [PATCH 05/11 v3] package/mosquitto: add option for
 websockets
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

Mosquitto 2.1.x adds the possibility to use a builtin websocket
implementation, as an alternative to using libwebsockets.

When using libwebsockets as the implementation, only the broker supports
websockets, and CLI tools do not; only when using the builtin one are
websockets usable with CLI tools (and the broker, of course).

Add a choice to select what type of websockets support to enable, if
any. Since the builtin implementation is still new, we keep the
libwebsockets one available.

Since this inverts the dependency logic to libwebsockets, we can't
provide a backward compatibility with existing (def)config files.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Titouan Christophe <titouan.christophe@mind.be>
---
 package/mosquitto/Config.in    | 25 ++++++++++++++++++++++++-
 package/mosquitto/mosquitto.mk |  4 +++-
 2 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/package/mosquitto/Config.in b/package/mosquitto/Config.in
index c19d80c943..bbc17bc00a 100644
--- a/package/mosquitto/Config.in
+++ b/package/mosquitto/Config.in
@@ -24,6 +24,30 @@ config BR2_PACKAGE_MOSQUITTO
 
 if BR2_PACKAGE_MOSQUITTO
 
+choice
+	prompt "Websockets support"
+	help
+	  Choose what websocket implementation to use. Note that
+	  the mosquitto_{sub,pub,rr} clients (above) only support
+	  websockets with the builtin implementation, while the
+	  broker supports websockets with either libwebsockets
+	  or the builtin implementation.
+
+config BR2_PACKAGE_MOSQUITTO_WS_NONE
+	bool "none"
+
+config BR2_PACKAGE_MOSQUITTO_WS_LIBWS
+	bool "with libwebsockets"
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBWEBSOCKETS
+	select BR2_PACKAGE_LIBWEBSOCKETS_EXT_POLL
+
+config BR2_PACKAGE_MOSQUITTO_WS_BUILTIN
+	bool "with builtin implementation"
+	select BR2_PACKAGE_OPENSSL
+
+endchoice
+
 config BR2_PACKAGE_MOSQUITTO_CLIENTS
 	bool "install clients"
 	default y  # Backward compatibility
@@ -52,7 +76,6 @@ config BR2_PACKAGE_MOSQUITTO_APPS
 config BR2_PACKAGE_MOSQUITTO_BROKER
 	bool "install the mosquitto broker"
 	default y
-	select BR2_PACKAGE_LIBWEBSOCKETS_EXT_POLL if BR2_PACKAGE_LIBWEBSOCKETS
 	help
 	  Build and install the mosquitto broker onto target.
 
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index a1848f96b3..9b3bcc1cf5 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -41,9 +41,11 @@ MOSQUITTO_CONF_OPTS += \
 	-DWITH_TLS=ON \
 	-DWITH_TLS_PSK=ON
 
-ifeq ($(BR2_PACKAGE_LIBWEBSOCKETS),y)
+ifeq ($(BR2_PACKAGE_MOSQUITTO_WS_LIBWS),y)
 MOSQUITTO_DEPENDENCIES += libwebsockets
 MOSQUITTO_CONF_OPTS += -DWITH_WEBSOCKETS=ON -DWITH_WEBSOCKETS_BUILTIN=OFF
+else ifeq ($(BR2_PACKAGE_MOSQUITTO_WS_BUILTIN),y)
+MOSQUITTO_CONF_OPTS += -DWITH_WEBSOCKETS=ON -DWITH_WEBSOCKETS_BUILTIN=ON
 else
 MOSQUITTO_CONF_OPTS += -DWITH_WEBSOCKETS=OFF -DWITH_WEBSOCKETS_BUILTIN=OFF
 endif
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
