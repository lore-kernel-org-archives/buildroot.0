Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83233C55ABF
	for <buildroot@archiver.kernel.org>; Fri, 20 Feb 2026 11:53:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28FE883E83;
	Fri, 20 Feb 2026 11:53:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ge30D0W3jNr0; Fri, 20 Feb 2026 11:53:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4536083E95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771588411;
	bh=Ty8dXlLerD09I3easIQZI610ITb/4ZeeHzcV6Xny1lQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=pf2Ai5Sd1CqNGF9vwoyAG5iFiNnRuV09mQrm4YmrV+ux7LELPnw8fZNvUKhOwdpSS
	 A52pXNsHp42scmxMwnD+jJtvqL8zbF8l3BKN5XGFSFfqxpL8ME3b5IYBjqEvxrOT8J
	 sBYOlTYr32SWDsUSr4TYA42wiNSGZUcE5hxWOjvIJI7C6jwJAydlIGUaj79fVee85T
	 L2oPnE7RWg69FgdGOz/7IBiuhRdd/+ioMyE+E62MgMHpyNSragX4Eho7zZ1129Esms
	 U0n7diY9jrazCd7J6g61ISfVIEXMC6XGhreo8wVVddQlM8h5bE+klXl8qKmpH+pvjA
	 TZgUL2v1X/qPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4536083E95;
	Fri, 20 Feb 2026 11:53:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 39B791CE
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 11:53:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F65B4053E
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 11:53:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5plM3g7tOMYW for <buildroot@buildroot.org>;
 Fri, 20 Feb 2026 11:53:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.121;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EB4CC4051D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB4CC4051D
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.121])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EB4CC4051D
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 11:53:27 +0000 (UTC)
X-CSE-ConnectionGUID: BTjG9bRsSP+G3sLP8BK/nw==
X-CSE-MsgGUID: +8Wtu0LzSkCouP8YOGiiFw==
Received: from unknown (HELO opfedv1rlp0g.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 20 Feb 2026 12:53:24 +0100
Received: from unknown (HELO OPE16NORMBX503.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0g.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 12:53:25 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX503.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37;
 Fri, 20 Feb 2026 12:53:23 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Fri, 20 Feb 2026 12:53:22 +0100
X-CSE-ConnectionGUID: lgXs5PMjQYyLL+AWK3BDXQ==
X-CSE-MsgGUID: O05goSHZQOmNPiX1ZToIzw==
X-IronPort-AV: E=Sophos;i="6.21,301,1763420400"; d="scan'208";a="394768700"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Fri, 20 Feb 2026 12:53:11 +0100
Message-ID: <bfbdb756d7f816f67acfc043131f1c4afac80164.1771588390.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1771588390.git.yann.morin@orange.com>
References: <cover.1771588390.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX507.corporate.adroot.infra.ftgroup
 (10.115.27.27) To OPE16NORMBX503.corporate.adroot.infra.ftgroup
 (10.115.26.27)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1771588408; x=1803124408;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wiwiLuF7t3rSINVvT9W2lvKb9LyZY+a+2ApEDcH2Bos=;
 b=kOl1vM2p3e9adagbFe6epdV6o2PmZ2j+yfWHLtiEAxX+h+o5IKwuYAFO
 SC211Rzi0REjqLEpjOsnzKMQtBREVpKfz97g9Y+zzWbqoIvxxJZwhgHTw
 SeRIwc3OcpC7HQOex/VK4QP09y//lwvOAk0w/Qsam8gybrTKi6sEXbaqA
 SxMMzPzkp6xDNOK/UkqjPTqLg1R/RaoMcIr3ypIZ1X6LsKHx7e946uF4D
 eiQ+YhAEFuRU16a7pHxRB8P7ofkz9Jab2isBv0SFp7B5eoc1F/zhw1ZCN
 5buygyaEGqT7h8vhZjIX1KvNApN+UViYzSwDGapfIU0A1AZzSfbHTVami
 Q==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=kOl1vM2p
Subject: [Buildroot] [PATCH 6/8] package/mosquitto: enable HTTP API with
 libmicrohttpd
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

Add a new option to enable the availablility of http_pi.

Note that we do not just depend on libmicrohttpd to be anbled, because
the HTTP API is a security boundary, and enabling it must be n explicit
decision.

Co-developped-by: Titouan Christophe <titouan.christophe@mind.be>
[yann.morin@orange.com: make it an explicit option]
Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Titouan Christophe <titouan.christophe@mind.be>
---
 package/mosquitto/Config.in    | 12 +++++++++++-
 package/mosquitto/mosquitto.mk | 10 ++++++++--
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/package/mosquitto/Config.in b/package/mosquitto/Config.in
index 0ecc350be3..1a58b372d2 100644
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
index f63170daef..ffd9c19e30 100644
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
@@ -64,6 +63,13 @@ else
 MOSQUITTO_CONF_OPTS += -DWITH_SRV=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_MOSQUITTO_BROKER_HTTP_API),y)
+MOSQUITTO_DEPENDENCIES += libmicrohttpd
+MOSQUITTO_CONF_OPTS += -DWITH_HTTP_API=ON
+else
+MOSQUITTO_CONF_OPTS += -DWITH_HTTP_API=OFF
+endif
+
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 MOSQUITTO_CONF_OPTS += -DWITH_LIB_CPP=ON
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
