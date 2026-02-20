Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B222C55ABE
	for <buildroot@archiver.kernel.org>; Fri, 20 Feb 2026 11:53:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B0BC83EA0;
	Fri, 20 Feb 2026 11:53:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id esLWye7hf5Rf; Fri, 20 Feb 2026 11:53:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F60C83E87
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771588408;
	bh=702y3TcEouHxTSvwnCeRCkCkq67jgCSGyp6rZbN6RIY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=k3PSUrV9g01IHYyOewj9LijD77okRl0EvQSbMwihDxt2CsBhBKWNTXlKzQv8BJMB1
	 V9aqwqv59SLxpjK5qt+mc7SSbS5fXvrgvwqwl6G74sYRaic+9VbujA/GIpfuT8V5pv
	 JlunRWeS1BtHqZ0owHYe6+ib0whuqU6+mw2yq9C9s79dmd3NLbsqWxLYvu28L/cKeu
	 2dV8TyK4Pr97DtYesxrRustnZtU9ROHL/XvYRKhGbZW/9p2/PGT323N/8H3erUxQl3
	 N5KRP+Q3UL2fiX8gYjhnVYYMMGxm2Q6ogiHaFWHV1k9/BtOSTZOV8vA9vlmV5QqWe8
	 e0VV0lPlQOF2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F60C83E87;
	Fri, 20 Feb 2026 11:53:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CC7C71CE
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 11:53:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C939983E5D
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 11:53:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xO-usQ97OeKN for <buildroot@buildroot.org>;
 Fri, 20 Feb 2026 11:53:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.124;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 66B1483E68
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66B1483E68
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 66B1483E68
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 11:53:21 +0000 (UTC)
X-CSE-ConnectionGUID: zRAC/QpyTe+LwBW3JXzLLA==
X-CSE-MsgGUID: tM3LqoEOSn+T0MeVwj3bfQ==
Received: from unknown (HELO opfedv1rlp0b.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 20 Feb 2026 12:53:21 +0100
Received: from unknown (HELO OPE16NORMBX503.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0b.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 12:53:21 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX503.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37;
 Fri, 20 Feb 2026 12:53:19 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Fri, 20 Feb 2026 12:53:19 +0100
X-CSE-ConnectionGUID: cn6Sto+nQm2+K4k3y25jOA==
X-CSE-MsgGUID: Q/3umy50TASR8flIW0cR8g==
X-IronPort-AV: E=Sophos;i="6.21,301,1763420400"; d="scan'208";a="396645772"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Fri, 20 Feb 2026 12:53:09 +0100
Message-ID: <ab05c9e4712a533a581a956f978c383aa18ef7ab.1771588390.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1771588390.git.yann.morin@orange.com>
References: <cover.1771588390.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX608.corporate.adroot.infra.ftgroup
 (10.115.27.32) To OPE16NORMBX503.corporate.adroot.infra.ftgroup
 (10.115.26.27)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1771588401; x=1803124401;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X/sZopkfOjRkOBeB277qzz1KN1K2QrIQ5yEiIdCw++c=;
 b=fJCVgsSHZjjVffN7/DPFwS55xqSxsrcWndDQ+5Qkfjc//Zb5pUNa4/Aw
 +zMWOOyP2x4lvSFDX1F3OIWzBt+Ao3YNqNdRg9V4RgcGF4LYhshGeyW7T
 PKy7DWF98u86Zwi8/mcJuh70iaSO2ODhoP6Of3WhOIK/gImYVGZ02QY+n
 eWwW8/fEnol6YdO+JlYpjv/sD5pYi2E1DUE0HSj43Ad8Dl7ZXiLMbv1Y6
 Wq/LZNc5bwF+nOsut85k7MMP6W8PdLMTtLuIPe/tarpXMYLJCOj2lbecf
 NZZMdxxG4762Q8etHh+75ItKszcQfgoEToUdMArRXqSYUAcIqEmCP04ql
 w==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=fJCVgsSH
Subject: [Buildroot] [PATCH 4/8] package/mosquitto: add option to build
 broker-related apps
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

mosquitto_{ctrl,db_dump,passwd,signal} can be handy to interact with
the mosquitto broker during development, but are usually unnecessary
on the target.

Add an option to enable or disable them. Make that new option enabled
by default when the broker is enabled, to keep backward compatibility
with previous (def)config files.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Titouan Christophe <titouan.christophe@mind.be>
---
 package/mosquitto/Config.in    | 16 ++++++++++++++++
 package/mosquitto/mosquitto.mk | 12 ++++++++----
 2 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/package/mosquitto/Config.in b/package/mosquitto/Config.in
index d0f096e5cf..954a4d3b75 100644
--- a/package/mosquitto/Config.in
+++ b/package/mosquitto/Config.in
@@ -33,6 +33,22 @@ config BR2_PACKAGE_MOSQUITTO_CLIENTS
 	    mosquitto_sub
 	    mosquitto_rr
 
+config BR2_PACKAGE_MOSQUITTO_APPS
+	bool "install apps"
+	default y if BR2_PACKAGE_MOSQUITTO_BROKER  # Backward compatibility
+	depends on BR2_USE_WCHAR  # libedit
+	# For mosquitto_ctrl shell feature, mandatorily enabled:
+	select BR2_PACKAGE_READLINE if !BR2_PACKAGE_LIBEDIT
+	help
+	  Those apps can be used to interact with the broker:
+	    mosquitto_db_dump
+	    mosquitto_signal
+
+	  Additionally, when TLS is enabled, the following apps are
+	  also installed:
+	    mosquitto_ctrl
+	    mosquitto_passwd
+
 config BR2_PACKAGE_MOSQUITTO_BROKER
 	bool "install the mosquitto broker"
 	default y
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index de952e9d77..1cfc052003 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -19,8 +19,7 @@ MOSQUITTO_CONF_OPTS = \
 	-DWITH_TESTS=OFF \
 	-DWITH_STATIC_LIBRARIES=OFF \
 	-DWITH_BUNDLED_DEPS=ON \
-	-DWITH_HTTP_API=OFF \
-	-DWITH_CTRL_SHELL=OFF
+	-DWITH_HTTP_API=OFF
 
 # adns uses getaddrinfo_a
 ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
@@ -75,12 +74,18 @@ else
 MOSQUITTO_CONF_OPTS += -DWITH_CLIENTS=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_MOSQUITTO_APPS),y)
+MOSQUITTO_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBEDIT),libedit,readline)
+MOSQUITTO_CONF_OPTS += -DWITH_APPS=ON -DWITH_CTRL_SHELL=ON
+else
+MOSQUITTO_CONF_OPTS += -DWITH_APPS=OFF -DWITH_CTRL_SHELL=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_MOSQUITTO_BROKER),y)
 
 MOSQUITTO_CONF_OPTS += \
 	-DCMAKE_INSTALL_SYSCONFDIR=/etc \
 	-DWITH_BROKER=ON \
-	-DWITH_APPS=ON \
 	-DWITH_PLUGINS=ON \
 	-DWITH_PLUGIN_ACL_FILE=ON \
 	-DWITH_PLUGIN_PASSWORD_FILE=ON \
@@ -123,7 +128,6 @@ MOSQUITTO_POST_INSTALL_TARGET_HOOKS += MOSQUITTO_INSTALL_TARGET_CONF
 else # !BR2_PACKAGE_MOSQUITTO_BROKER
 MOSQUITTO_CONF_OPTS += \
 	-DWITH_BROKER=OFF \
-	-DWITH_APPS=OFF \
 	-DWITH_PLUGINS=OFF
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
