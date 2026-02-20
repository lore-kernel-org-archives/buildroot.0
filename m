Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60BB1C55ABE
	for <buildroot@archiver.kernel.org>; Fri, 20 Feb 2026 11:53:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 245C483E8C;
	Fri, 20 Feb 2026 11:53:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RlFjPNch4l1i; Fri, 20 Feb 2026 11:53:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49B4B83E8D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771588409;
	bh=EYz4YGv0DlGs9XmV3A4saR65LSmfyQ7jLbKlbj73mi4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=J3bIMau+2rKrPI+NPqchQbRrVZAJYiGIDuXHJhnRyiNncXrHmMqaEBCMeU9GceUkk
	 UBBZrqnlUCaUhBy5zwXcu3FsLVestEvLnKwfpBZ3vwr016RJl40aXvFuPXsEirX4b8
	 3SthxOYA3cv5hB1FnH9k2YOCPav5nRPairmrYTfllvLkRg8+SzB8UENikYtxO4zJQ2
	 Bzrl7lXCpY8GlpiMLlNGkPPTD/CQvIokJF88edtTqjV1GaZcjByEus1SSI7zQA7jkN
	 ahpJvsffePq7E8hPN4IShZa9+7B5Cz8HsyB/HlC6zk84EttTuOR6V5j4tyq3FbRtPZ
	 Brb6OFISIKoaw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49B4B83E8D;
	Fri, 20 Feb 2026 11:53:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 477BA1CE
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 11:53:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3987060665
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 11:53:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E4ymuaOAnai0 for <buildroot@buildroot.org>;
 Fri, 20 Feb 2026 11:53:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.237;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E93C3605A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E93C3605A4
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.237])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E93C3605A4
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 11:53:25 +0000 (UTC)
X-CSE-ConnectionGUID: yaTowkrwRsWrfnlVxYk0kg==
X-CSE-MsgGUID: T76efTVvQCS7YaMEXe8+Bw==
Received: from unknown (HELO opfedv1rlp0a.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 20 Feb 2026 12:53:23 +0100
Received: from unknown (HELO OPE16NORMBX503.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0a.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 12:53:22 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX503.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37;
 Fri, 20 Feb 2026 12:53:21 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Fri, 20 Feb 2026 12:53:21 +0100
X-CSE-ConnectionGUID: F//yMczLTLKNSH0wDkC1Uw==
X-CSE-MsgGUID: UD7PGBZxSlKCWwQingZh+A==
X-IronPort-AV: E=Sophos;i="6.21,166,1763420400"; d="scan'208";a="396840742"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Fri, 20 Feb 2026 12:53:10 +0100
Message-ID: <c7de8ac345db9e02ec9897c601ebb6c7db033b67.1771588390.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1771588390.git.yann.morin@orange.com>
References: <cover.1771588390.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX603.corporate.adroot.infra.ftgroup
 (10.115.26.31) To OPE16NORMBX503.corporate.adroot.infra.ftgroup
 (10.115.26.27)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1771588406; x=1803124406;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/d9ensGpkPp4WENFqZMd2pWzVyA9BZ4xWjBElFqld60=;
 b=Pt6iFFt4uoGG0ql6IoGVYpm/eJ/dSbogMSW0Dyb2gC5KQndsf7y3oaxz
 TuiHaL8fz0Wy2fanJuvtON8BlmVOIrZcnPlmXZqzfPQNa9AP9OTHCmwKo
 VDUq5mwiXO1rlhY6dVmQlt6HepQLMJLmB5txMjfo2Cy2CJ8BhcCl1f0nq
 EDr7up0HbO4/5xTSoQA5lTOgJPFdyxE0K/ROhHbYjfKIPzcPmYbahhedN
 I/Qz7G34v+fS5/FlY/sPt6TBLPA/dMTsRrPhmPZBsTo3C5LDtU5bSJ5Ac
 mtHQHmr8Rti32x68kDM59GTC5iWvCefN1EFBjOutXJQNVUTcSLHfnuOj/
 w==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=Pt6iFFt4
Subject: [Buildroot] [PATCH 5/8] package/mosquitto: add option for websockets
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
index 954a4d3b75..0ecc350be3 100644
--- a/package/mosquitto/Config.in
+++ b/package/mosquitto/Config.in
@@ -49,10 +49,33 @@ config BR2_PACKAGE_MOSQUITTO_APPS
 	    mosquitto_ctrl
 	    mosquitto_passwd
 
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
 config BR2_PACKAGE_MOSQUITTO_BROKER
 	bool "install the mosquitto broker"
 	default y
-	select BR2_PACKAGE_LIBWEBSOCKETS_EXT_POLL if BR2_PACKAGE_LIBWEBSOCKETS
 	help
 	  Build and install the mosquitto broker onto target.
 
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index 1cfc052003..f63170daef 100644
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
