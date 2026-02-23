Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8704BEA4FC7
	for <buildroot@archiver.kernel.org>; Mon, 23 Feb 2026 14:18:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 547EA41A4F;
	Mon, 23 Feb 2026 14:18:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t2X1fE5-djbR; Mon, 23 Feb 2026 14:18:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5309741AA8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771856287;
	bh=lfesHhR4CYvCUcP98bWNzJsz3i6TxpE9yMP9exxblvw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=R7bZ/ZLtV3huI0X5wnCcQuMGdXSxEE8FWB72V1ZCEkPDBxhT8SszKnPtCkG0180hV
	 jfl966bMA/2K6MAuyEg7R6rvsrj5gIbQS8KMnBF1Ir00+K4YNIFx0uyH0sgj9jWxT0
	 1jN+nJj7jfOioiVSXlAAUyFSbEk2mRKmmezCK5FrwekkZ5LArj0fxB4+8Ajnn/y30v
	 AZd3xLdH7rGQZX/ona6cLJmslg/Y/mCXk/wprKvWHhv3DYuWIRrDJX0X7Viwa6r7e2
	 speh4B0+UWc9UHClhMwvc7CyCL7quUDVOt4ZH3khgDRQaZDGgnzSVyUMb0VhGr33Or
	 hBQ730i49Nexg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5309741AA8;
	Mon, 23 Feb 2026 14:18:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 986E6249
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 14:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 89F6040251
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 14:18:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2M7uiGhWwFRR for <buildroot@buildroot.org>;
 Mon, 23 Feb 2026 14:18:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.124;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 36BB14024A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36BB14024A
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 36BB14024A
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 14:18:03 +0000 (UTC)
X-CSE-ConnectionGUID: 42EplPoIQBWVyA3gJrHpVw==
X-CSE-MsgGUID: bpGxHzicRLKWfXn2PadVIA==
Received: from unknown (HELO opfedv3rlp0h.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 23 Feb 2026 15:18:02 +0100
Received: from unknown (HELO OPE16NORMBX503.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0h.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 15:18:02 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX503.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37;
 Mon, 23 Feb 2026 15:18:00 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Mon, 23 Feb 2026 15:18:00 +0100
X-CSE-ConnectionGUID: lCQ86wHYRj+YbT52YQOr3Q==
X-CSE-MsgGUID: WCwsZgO3R/mCasJLo2h8CQ==
X-IronPort-AV: E=Sophos;i="6.21,306,1763420400"; d="scan'208";a="395429108"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Mon, 23 Feb 2026 15:17:46 +0100
Message-ID: <bae485557e7aa2ac43dc46a05a82677eda2d4bf9.1771856260.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1771856259.git.yann.morin@orange.com>
References: <cover.1771856259.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.26.51]
X-ClientProxiedBy: OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26) To OPE16NORMBX503.corporate.adroot.infra.ftgroup
 (10.115.26.27)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1771856284; x=1803392284;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZpvRvddLHErPudYezRdgWxG5bIm2A46cyVyAHEgcikg=;
 b=Ql4a7mw3Jn5SwM2dv9DlgoIYq9twcCA6o3+zzT5p8IYGA8E2qgXeYHwx
 prp4E2au9lhwdudBsnJb7V3u/UHz4IiI2VUj0DlTcCTYrScrH4QphZHEU
 McJEBOz+UaN5ZAYaynYFWvkzx/0rPxYeyqX5EcmUnBdcvqU/illVnn3z5
 OJt07DcCkOVEiI5p90AiUJ/6GA4O/OeuebmeZntpW4YBsLrFFEIAMbyX7
 PNSakzfcmlcSTkcichWrFkrzY7ZUCVld5VCyHrsqdYXmfVGa96apTYOGs
 F0h5yzrERPVQcNRwrB1GWE1rPERVOx1oK4Qd7MSUQwlN3bbIUy6bF3LsM
 g==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=Ql4a7mw3
Subject: [Buildroot] [PATCH 6/8 v2] package/mosquitto: enable HTTP API with
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
index 6e0644e9b6..3df6131a5d 100644
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
