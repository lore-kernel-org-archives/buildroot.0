Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C84E3ECAAD4
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 13:59:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 709B940FD5;
	Fri, 26 Aug 2022 13:59:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 709B940FD5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c798rvmPhCDc; Fri, 26 Aug 2022 13:59:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8BE344101B;
	Fri, 26 Aug 2022 13:59:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8BE344101B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 50E2C1BF5F5
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 13:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C3A583EF9
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 13:55:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C3A583EF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LlEXO8VdQIE1 for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 13:55:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 546E782FA9
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 546E782FA9
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 13:55:26 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id t5so2191899edc.11
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 06:55:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=VbWNruDmOkvw4MWJOSBtssdAXoM38o1BjaS+JTCSMFY=;
 b=5vsdS9JKnZ7kjzlLPmhnlFZP+vlZP7zoGx+VSRy/y63/huUx1/GDHjWRG1Q3SnmhlH
 8Sb/lLrq4+zBtxZPGVmpzcav43+bZu3F+tzWqGieotrZfOlN3c4qOnXIzONlx8lPOX0E
 uvLn38HtmLmT1UPiEvlnOp3pPK+Jv8pQlbc9yemU85j+X+xAwe/oyj7dea7AtSUVNHrq
 3MHpkLIYryCl/iqXpUeh7rg/GbS00LH+nGY9uL4geZB8cXTRi4NPKNwvBhBXswRda721
 ZG8hwCy1tvfnn3woRMCj1ucvGrQ1zPSuW5A29klmwwb8KOm9evjyxyZ9rVDR1KEKpaoh
 ggQA==
X-Gm-Message-State: ACgBeo1KIuUFz8AKsdgELrxwEb0wel4wqk8R7HEbcp0Rycgdbfz5stvL
 qWAxt7c5dhIdns2yHqKoUoPGOnNaM636PG/k
X-Google-Smtp-Source: AA6agR4zpAVwkbNuNhfDeDI9HkkA8JDeTz1AnFcDcP5PnO/nO0chKy9s2PsEHlZqdA5EIqjLDcM2uA==
X-Received: by 2002:a05:6402:401d:b0:446:6f14:831d with SMTP id
 d29-20020a056402401d00b004466f14831dmr7151583eda.18.1661522124203; 
 Fri, 26 Aug 2022 06:55:24 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a508d86000000b00446bf462203sm1347928edh.1.2022.08.26.06.55.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 06:55:23 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 15:54:52 +0200
Message-Id: <20220826135503.20612-19-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826135503.20612-1-jesseevg@gmail.com>
References: <20220826135503.20612-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=VbWNruDmOkvw4MWJOSBtssdAXoM38o1BjaS+JTCSMFY=;
 b=NxmVQt7kVo3/ssYwOVwgETlnByOrFAxyiIflroqt4Ud+SnD+bhutdcCCcWGfIsiE1z
 SvozHOQs8u5Ee66XOSnD0ouWofEauYuzoNSECKsp1MzbAPkz5X/1yS9uVwK2VuwQEJYM
 4uL4Erm9RZfM/vKyDq8+21JmY7uPU725bspGepG7rdyMaX4kvw6rnq4eN7qW7R03FKod
 3T6t82me+z98rN/O9qCoOJYrTvY1N4Lbj3O6W0+VRz+ia6SgYxwThmJ+e+Nt/CHAA/VX
 gSh75bBk7/cevbgSEx8RxsOVCYeHm2RESxL2KaT8OEASqZvrC/u85tbik5fO2R9GOP2S
 v7ig==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=NxmVQt7k
Subject: [Buildroot] [PATCH v4 18/29] package/qt6/qt6base: add support for
 sql module w/ mysql
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
---
 package/qt6/qt6base/Config.in  | 18 ++++++++++++++++++
 package/qt6/qt6base/qt6base.mk | 16 ++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index 25f848f7a7..9509fa5be9 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -60,6 +60,24 @@ config BR2_PACKAGE_QT6BASE_NETWORK
 	help
 	  This options enables the Qt6Network library.
 
+config BR2_PACKAGE_QT6BASE_SQL
+	bool "sql module"
+	help
+	  This options enables the Qt6Sql library.
+
+if BR2_PACKAGE_QT6BASE_SQL
+config BR2_PACKAGE_QT6BASE_MYSQL
+	bool "MySQL Plugin"
+	depends on BR2_USE_MMU # mysql
+	select BR2_PACKAGE_MYSQL
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_READLINE
+	help
+	  Build MySQL plugin
+	  If unsure, say n.
+
+endif
+
 config BR2_PACKAGE_QT6BASE_SYSLOG
 	bool "syslog support"
 	help
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index ffb03314ec..0061a69c63 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -103,6 +103,22 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_libudev=OFF
 endif
 
+# Qt6 SQL Plugins
+ifeq ($(BR2_PACKAGE_QT6BASE_SQL),y)
+QT6BASE_CONF_OPTS += -DFEATURE_sql=ON
+QT6BASE_CONF_OPTS += -DFEATURE_sql_db2=OFF -DFEATURE_sql_ibase=OFF -DFEATURE_sql_oci=OFF -DFEATURE_sql_odbc=OFF
+
+ifeq ($(BR2_PACKAGE_QT6BASE_MYSQL),y)
+QT6BASE_CONF_OPTS += -DFEATURE_sql_mysql=ON
+QT6BASE_DEPENDENCIES += mysql
+else
+QT6BASE_CONF_OPTS += -DFEATURE_sql_mysql=OFF
+endif
+
+else
+QT6BASE_CONF_OPTS += -DFEATURE_sql=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 QT6BASE_CONF_OPTS += -DINPUT_openssl=yes
 QT6BASE_DEPENDENCIES += openssl
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
