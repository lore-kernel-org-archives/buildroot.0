Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F3DDEA4FC4
	for <buildroot@archiver.kernel.org>; Mon, 23 Feb 2026 14:18:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6DFD418D1;
	Mon, 23 Feb 2026 14:18:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uQkGWVJC8pET; Mon, 23 Feb 2026 14:18:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E55AA41820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771856282;
	bh=9ef23vlgFGSLsacN6qGQbBf5mh63liTvODttgmCTup8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Ex6i5VHOQsVidKx6Z8Rld4JS83U83pE3SJYKg0hi7+9u7iD6+4DUkrIdZtYtmL3A1
	 vuO7r6gSSDzAeMp5B6wd91aNUbzc2yLd2b+l6XodN/0huYiunlvPf6QK/DDg1IvTzF
	 dP157z1TdYdqjxmQ2LLEni/a9SJuneFzAVv2t4sNodeuiUdNEAiiGB5YVvVAColsgg
	 6sJfOkqrzgzHKacON9htG2d11cVx9QFB6KsZHUbRSGMYwI5ah75Iau5Nz8LywCh7my
	 XD5qOTq99LUTJ/pvSc54061Tg6K9XPqGimjgb3+ypyEX+Kn7c39L+w6KAaJ9gEJjl6
	 9gFWyJo9Oy9mw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E55AA41820;
	Mon, 23 Feb 2026 14:18:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A82A3249
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 14:18:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8DFE5842AD
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 14:18:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dRekzspemCW3 for <buildroot@buildroot.org>;
 Mon, 23 Feb 2026 14:18:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.124;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7561E842A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7561E842A6
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7561E842A6
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 14:17:59 +0000 (UTC)
X-CSE-ConnectionGUID: vEKmdnioSp+IOiPwNU+Plw==
X-CSE-MsgGUID: i/KrdzKHSfmPx5whdgvSxg==
Received: from unknown (HELO opfedv3rlp0e.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 23 Feb 2026 15:17:56 +0100
Received: from unknown (HELO OPE16NORMBX503.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0e.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 15:17:55 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX503.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37;
 Mon, 23 Feb 2026 15:17:54 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Mon, 23 Feb 2026 15:17:53 +0100
X-CSE-ConnectionGUID: QIYO6ePDTt+UmZjX21qjmA==
X-CSE-MsgGUID: VzfhQ1OjTtiWNj2Ron5Blw==
X-IronPort-AV: E=Sophos;i="6.21,306,1763420400"; d="scan'208";a="395694151"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Mon, 23 Feb 2026 15:17:43 +0100
Message-ID: <c908c88881d8740f191b60a1929405c67f513a5a.1771856260.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1771856259.git.yann.morin@orange.com>
References: <cover.1771856259.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.26.53]
X-ClientProxiedBy: OPE16NORMBX606.corporate.adroot.infra.ftgroup
 (10.115.27.30) To OPE16NORMBX503.corporate.adroot.infra.ftgroup
 (10.115.26.27)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1771856279; x=1803392279;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J2rGpFpFAvaRoH2+KP+/JFJ8aH1GtCOx0kMnR8fL13A=;
 b=blij5TqxRJzVrem6f0omCehUDm/HH000R+3hdPs/glP1iySeHv8XjERQ
 Pb6ihueJsDvBx5JBOqXrlHoEHhSHCVI0vmUggQNaOcD9LPP7bU0ns0QoL
 FnjezuoglADxoCTWp5Xd2z6NB9CC0KQWbhncb7xkrKbwp3F+XdopIYqiZ
 R2dzKWFWVNJ8fezIzWIyEyLrevSUG0mCnKtvyCn9NKnN8IHfluz8bDydY
 XYQihaaLDiWhPIu9hBwOcwDiqfzORkuF6jYhYlysM9sxkafBlrBP1r0iO
 cGD2CZv+gVxLBTz2MCiPz1EDBxE3fcGQYDWJoJqx+NZwgp1bdBkVCXNQ/
 A==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=blij5Tqx
Subject: [Buildroot] [PATCH 3/8 v2] pakcage.mosquitto: add option to install
 CLI tools
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

mosquitto_sub/pub/rr can be handy to test a broker from the command
line, but they can get superfluous when only the broker is required
on the target.

Add an option to enable or disable them. Make that new option enabled
by default to keep backward compatibility with previous (def)config
files.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Titouan Christophe <titouan.christophe@mind.be>
---
 package/mosquitto/Config.in    | 9 +++++++++
 package/mosquitto/mosquitto.mk | 7 ++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/package/mosquitto/Config.in b/package/mosquitto/Config.in
index 2667b60f57..d0f096e5cf 100644
--- a/package/mosquitto/Config.in
+++ b/package/mosquitto/Config.in
@@ -24,6 +24,15 @@ config BR2_PACKAGE_MOSQUITTO
 
 if BR2_PACKAGE_MOSQUITTO
 
+config BR2_PACKAGE_MOSQUITTO_CLIENTS
+	bool "install clients"
+	default y  # Backward compatibility
+	help
+	  Install CLI tools to publish/subscribe to the broker:
+	    mosquitto_pub
+	    mosquitto_sub
+	    mosquitto_rr
+
 config BR2_PACKAGE_MOSQUITTO_BROKER
 	bool "install the mosquitto broker"
 	default y
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index e767d97bee..de952e9d77 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -19,7 +19,6 @@ MOSQUITTO_CONF_OPTS = \
 	-DWITH_TESTS=OFF \
 	-DWITH_STATIC_LIBRARIES=OFF \
 	-DWITH_BUNDLED_DEPS=ON \
-	-DWITH_CLIENTS=ON \
 	-DWITH_HTTP_API=OFF \
 	-DWITH_CTRL_SHELL=OFF
 
@@ -70,6 +69,12 @@ else
 MOSQUITTO_CONF_OPTS += -DWITH_LIB_CPP=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_MOSQUITTO_CLIENTS),y)
+MOSQUITTO_CONF_OPTS += -DWITH_CLIENTS=ON
+else
+MOSQUITTO_CONF_OPTS += -DWITH_CLIENTS=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_MOSQUITTO_BROKER),y)
 
 MOSQUITTO_CONF_OPTS += \
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
