Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47A8DECAAD4
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 12:56:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA8BF83F2C;
	Fri, 26 Aug 2022 12:56:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA8BF83F2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qX8-n4Hvm0Bo; Fri, 26 Aug 2022 12:56:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 247D283F00;
	Fri, 26 Aug 2022 12:56:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 247D283F00
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2EF9A1BF27E
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 12:53:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 182E040515
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 12:53:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 182E040515
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SfkN7sbmGXSh for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 12:53:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39E2F404BB
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 39E2F404BB
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 12:53:15 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id d21so3004700eje.3
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 05:53:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=VbWNruDmOkvw4MWJOSBtssdAXoM38o1BjaS+JTCSMFY=;
 b=KAc/9oMt2RBM5ia/LyCaxjb6EXLdJVf/rPfHkLw9h09ySdwegM7DL3RJzapGWwmPzy
 ktJXxNK0xFEHth7xe6qBUVi/XZ1Hi18ObQEHAo+/hAhMyItZlUQGBVq9xdMI/Ihx1yU7
 +B0FMmLGjDndY6GACOToqUR5jgFvPy31aPLeFrgAyb9tBKrF4u8ZtP8nWT0aFegOYiER
 /9hxaPwk+Xm0gFO/oFfFLPO6qdzjjg6CqSFkMCv20FjDO4EyyXlaL3Z2iXHTFxIkz8y+
 ZiWorQrMPcLJUrUlME6bhsNTK0hjfLf5CFkVA6m2fveSXyUwYHqtsD2pyKoVksw7mRbs
 Yxrg==
X-Gm-Message-State: ACgBeo0eEZ5Zy/ah5S32BJRVty5mJDKYpQOkLVvhDboPqQXy9JIYsxVe
 PZlWz6zV3XKNM34+fim63JJQVxMNVA02bHRV
X-Google-Smtp-Source: AA6agR7Mfj+gRfbZGAjH9ITgKhkIAchD63+2xbfTT6dNIutYTD1P/GwUScdXBxwK1vCTFra+vZlpVA==
X-Received: by 2002:a17:906:9b0a:b0:73d:c29e:cc87 with SMTP id
 eo10-20020a1709069b0a00b0073dc29ecc87mr5340175ejc.118.1661518394421; 
 Fri, 26 Aug 2022 05:53:14 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a1709064d8200b0073923a68974sm829573eju.206.2022.08.26.05.53.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 05:53:13 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 14:52:41 +0200
Message-Id: <20220826125252.16782-19-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826125252.16782-1-jesseevg@gmail.com>
References: <20220826125252.16782-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=VbWNruDmOkvw4MWJOSBtssdAXoM38o1BjaS+JTCSMFY=;
 b=jHH4AIahvr5ZBMiT/rS39At95QN3Z9FAqyllqVr97grIblSzC+Y+xEPYiLUQBEO+c5
 HdlIMT7NoSMKL62i+keNjodvE3jqrnrtoRLooAaJIjC+I+JK6ae+s2w4rh5LGti9l8Hb
 ULamyusMi+Ss/049tPMBo5KA+HDT4qNhIOi7lbhFTDikRchuiGtfN36mbxqsnXNtYaHr
 JiWD5S154Uvg+1vS4vCNi1YZZ91Srm/M1J7EWYVze7HQsloERSn1iKzmf5SAFbsLdBkR
 KNsKQRbif6xSyl2stxEv6lVmwxYsGWKXGSB6mufQmwN/klsENKw1XyAJ7BI3q4+4SRpL
 RG6w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=jHH4AIah
Subject: [Buildroot] [PATCH v3 18/29] package/qt6/qt6base: add support for
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
