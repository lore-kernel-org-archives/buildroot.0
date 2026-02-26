Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4CAEFD8FCF
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 15:54:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EAAD42210;
	Thu, 26 Feb 2026 15:54:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gHtfjSo5f7XZ; Thu, 26 Feb 2026 15:54:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8471A4220B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772121268;
	bh=IlbihQVBVgsKIwIFDDC6ty4P55MfJhfD8TrJRbku3GQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=q+4WgwuQzhXCQaNPqt+oGyxJb2qqRhRfaJi20JuBeoxFbkuTVzL44RSzXzsBxqc7P
	 b3YG1A3zV1y6bfgcF1p0+orA4zclXYvsgF9BUWoRdt/kHoPHfdHEPRh3Vk32G0vIx7
	 vg6Xqq1+UX54pe6xUD/NnD+Zi0o4Gy2o784Sz8RrwmUbwNKVE8iJ0J+sBhwXQBGjei
	 pyv5QydXh82tKZtldd8gv5tqbXJ0op8mOF2b7fDnoiF02w4KJrSv4njEWi8qayCXk8
	 PT/jzjcG+MlMiNo/z/oZSZprjbuK7VP4Le4+qbVF1INBd8ooW7Pj21JMeJJ6NFxVCJ
	 JJubygd8pSm/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8471A4220B;
	Thu, 26 Feb 2026 15:54:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 44ADC24E
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 15:54:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3679742204
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 15:54:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WRZuTrdU-6Dv for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 15:54:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.123;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C16A642207
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C16A642207
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.123])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C16A642207
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 15:54:23 +0000 (UTC)
X-CSE-ConnectionGUID: ZZZ+hHPmT3+2H9m00U5c6w==
X-CSE-MsgGUID: mhPgYEWuTq6DJK0vgk4g0A==
Received: from unknown (HELO opfedv1rlp0a.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 26 Feb 2026 16:54:20 +0100
Received: from unknown (HELO OPE16NORMBX503.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0a.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 16:54:20 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX503.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37;
 Thu, 26 Feb 2026 16:54:18 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Thu, 26 Feb 2026 16:54:17 +0100
X-CSE-ConnectionGUID: rx2PbiO3RceC14C74YyHEw==
X-CSE-MsgGUID: bcntMwONTfyNnCCqjr18gw==
X-IronPort-AV: E=Sophos;i="6.21,166,1763420400"; d="scan'208";a="399006774"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Thu, 26 Feb 2026 16:54:01 +0100
Message-ID: <1556fe7d6cd3ab912f05fe31b48ea73b46eafead.1772121240.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1772121240.git.yann.morin@orange.com>
References: <cover.1772121240.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX604.corporate.adroot.infra.ftgroup
 (10.115.26.32) To OPE16NORMBX503.corporate.adroot.infra.ftgroup
 (10.115.26.27)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1772121264; x=1803657264;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eB0VoGNufxFaClTyQ8173qFpX6vb97/G612g/oRNClk=;
 b=AmLxwHdNdNztah8Z7qL8vvb0dDFJkKuBv1PM5PP24f69wp8afME114CO
 IKBUadJsT7mVaZXteGckeeYN1xrVkbUG1lJzxw3jeHiOLqH/RpocTsSXO
 mdQUGS9HP17sj6zlsXfLYrlZBIlb+MkcZIRiBguEHWCOFUzyH24n7af0w
 G7MrqowMzzeDHvJBbdSQyn4gA1Q9VW8yX+JWcLRDxPUj3a4C3i1kByhgU
 hkDXL42tNSmgTSvVL758nw6J3oIicLkV9AJfyKgosiRtznRtIYX0AxFfX
 KCRlA0qtoCG6eBCD45JWo6Gn9Mf55nNM/wAVi90hjJpbLYS57Gh7dqww4
 w==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=AmLxwHdN
Subject: [Buildroot] [PATCH 07/11 v3] package/mosquitto: add options for
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
introduced to replace the builtin support, which is now deprecated and
will get removed in the next version.

Add two new configuration options for those plugins.

We decided to do a single commit, rather than one per option, because
they are relatively tied together (ACL needs passwords, at least).

We also choose to make those options enabled by default, because the
traditional way to configure mosquitto is to use static files for
authentication and authorization, and the builtin support if now
deprecated in favour for the plugins.

The usual ifeq-else-endif conditional block is a bit verbose when just
setting an option ON or OFF, when no additional dependency is needed.
Instead, use the not-unusual $(if)-inline one-liner. For consistency,
switch the existing dynamic-security plugin to use that one-liner too.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Titouan Christophe <titouan.christophe@mind.be>
---
 package/mosquitto/Config.in    | 14 ++++++++++++++
 package/mosquitto/mosquitto.mk | 13 ++++---------
 2 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/package/mosquitto/Config.in b/package/mosquitto/Config.in
index 54bb4faebe..1d7cd96aba 100644
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
index 160945d6d9..d95583d768 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -88,11 +88,12 @@ MOSQUITTO_CONF_OPTS += \
 	-DCMAKE_INSTALL_SYSCONFDIR=/etc \
 	-DWITH_BROKER=ON \
 	-DWITH_PLUGINS=ON \
-	-DWITH_PLUGIN_ACL_FILE=ON \
-	-DWITH_PLUGIN_PASSWORD_FILE=ON \
 	-DWITH_PLUGIN_EXAMPLES=OFF \
 	-DWITH_PLUGIN_PERSIST_SQLITE=OFF \
-	-DWITH_PLUGIN_SPARKPLUG_AWARE=OFF
+	-DWITH_PLUGIN_SPARKPLUG_AWARE=OFF \
+	-DWITH_PLUGIN_PASSWORD_FILE=$(if $(BR2_PACKAGE_MOSQUITTO_BROKER_PLUGIN_STATIC_PASSWD),ON,OFF) \
+	-DWITH_PLUGIN_ACL_FILE=$(if $(BR2_PACKAGE_MOSQUITTO_BROKER_PLUGIN_STATIC_ACL),ON,OFF) \
+	-DWITH_PLUGIN_DYNAMIC_SECURITY=$(if $(BR2_PACKAGE_MOSQUITTO_BROKER_DYNAMIC_SECURITY_PLUGIN),ON,OFF)
 
 ifeq ($(BR2_PACKAGE_MOSQUITTO_BROKER_HTTP_API),y)
 MOSQUITTO_DEPENDENCIES += libmicrohttpd
@@ -101,12 +102,6 @@ else
 MOSQUITTO_CONF_OPTS += -DWITH_HTTP_API=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_MOSQUITTO_BROKER_DYNAMIC_SECURITY_PLUGIN),y)
-MOSQUITTO_CONF_OPTS += -DWITH_PLUGIN_DYNAMIC_SECURITY=ON
-else
-MOSQUITTO_CONF_OPTS += -DWITH_PLUGIN_DYNAMIC_SECURITY=OFF
-endif
-
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
