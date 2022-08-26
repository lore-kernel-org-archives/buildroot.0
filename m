Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F8BDECAAD2
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 06:52:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F09C40D0F;
	Fri, 26 Aug 2022 06:52:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F09C40D0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MTOhPYN-WRaP; Fri, 26 Aug 2022 06:52:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 36F39400F1;
	Fri, 26 Aug 2022 06:52:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36F39400F1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EE0291BF8A8
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 06:48:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D6EA940012
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 06:48:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D6EA940012
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XDpdpyhuRXHP for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 06:48:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 034E3400F1
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 034E3400F1
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 06:48:23 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id h22so1393122ejk.4
 for <buildroot@buildroot.org>; Thu, 25 Aug 2022 23:48:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=NET95BUjHQdADzOxmTcP+WCNy/TRDEWdWkrvtEGufG0=;
 b=OvCXiw12q0C6yTUpm182FBh38HsD3xz3YZ25ib5tVh34cFDtvcJDwn6BxrY1xdf/3l
 9IpeRccaSHBrQnxz2+1lz3DlnDsMrirk7RW+HDJNYmVYY4iSBMOXc6u/G87mATQfYe5x
 YdgRdnmDHGTL5SjGc0eHRas/9YPj0l9korD/v5Z8dSbt6JU9buvlxmsh2DIjuuHWjCUE
 1T66JIxWTa+RJydIpoWJw3lZjHAPduHiYEprU5aBOx6Evzrj0QMXvJpc6Xg9om3AO23b
 1I09fabOp/9atP/4jJi2IvD9BHHJWEOWVxRNWKXEWidRuWgXqqLIbPAXIoy7w1dIVMzQ
 h5fA==
X-Gm-Message-State: ACgBeo2O0RnSYKTFFeM9IPgCVYRm1/tD6FIE9LgHNT9IRV/2voLCSM5M
 JBaGq7Of68vR6GIGy01TyOM0TtvXvI+E9pWu
X-Google-Smtp-Source: AA6agR66oHBG87w1WALI2dSViy3lHIZathloFdvi8qv068ABQeW2NLlmuRCVAe1YFznZ+ySvcohq7Q==
X-Received: by 2002:a17:907:8a0a:b0:730:a118:75de with SMTP id
 sc10-20020a1709078a0a00b00730a11875demr4856267ejc.189.1661496502194; 
 Thu, 25 Aug 2022 23:48:22 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a50fb81000000b00447c0dcbb99sm787613edq.83.2022.08.25.23.48.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 23:48:21 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 08:47:49 +0200
Message-Id: <20220826064758.3968647-21-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826064758.3968647-1-jesseevg@gmail.com>
References: <20220826064758.3968647-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=NET95BUjHQdADzOxmTcP+WCNy/TRDEWdWkrvtEGufG0=;
 b=a+0AtWcBq93lIHKQKUv01HVbdV8SH7HS0Z5NQQKQ1mERxXf0282OSF0yxmP/wCfJ4r
 +h2syBJjKQbv5ApE0opiFUiggmg2qyc2fCP3rpH0Cetwvw0IxGID9Qf7nKDybeQkhPqu
 SQPJE29j0AO8BC9QqbjgPYQYAXO79vgpVJh01oi/OQG4xUd111/8yg26zvBj6MrhTc7j
 IrN5azbqZHl5OGiuVOt8pFJotmxohcqE4aAPYSG0cEmh5bSFkhgyX5cRyNiZDa1Yt6Yw
 SMAAZvJJfkQntmE4J2LNpiLcgN3fJy+CTDkZwdDt5vimq6oFrcDi8fgBPnhEdeCEpfFr
 53bg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=a+0AtWcB
Subject: [Buildroot] [PATCH v2 20/29] package/qt6/qt6base: add support for
 sql module with postgresql
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
 "Yann E . Morin" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

---
 package/qt6/qt6base/Config.in  | 14 ++++++++++++++
 package/qt6/qt6base/qt6base.mk |  7 +++++++
 2 files changed, 21 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index 35a83beb92..9cbbce6e4c 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -60,6 +60,20 @@ config BR2_PACKAGE_QT6BASE_MYSQL
 	  Build MySQL plugin
 	  If unsure, say n.
 
+config BR2_PACKAGE_QT6BASE_PSQL
+	bool "PostgreSQL Plugin"
+	depends on BR2_USE_MMU # postgresql
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_USE_WCHAR # postgresql
+	select BR2_PACKAGE_POSTGRESQL
+	help
+	  Build PostgreSQL plugin
+	  If unsure, say n.
+
+comment "PostgreSQL plugin needs a toolchain w/ wchar, dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
+
 endif
 
 config BR2_PACKAGE_QT6BASE_TEST
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 5a3798a1d2..69c59b8d6f 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -115,6 +115,13 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_sql_mysql=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_QT6BASE_PSQL),y)
+QT6BASE_CONF_OPTS += -DFEATURE_sql_psql=ON
+QT6BASE_DEPENDENCIES += postgresql
+else
+QT6BASE_CONF_OPTS += -DFEATURE_sql_psql=OFF
+endif
+
 else
 QT6BASE_CONF_OPTS += -DFEATURE_sql=OFF
 endif
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
