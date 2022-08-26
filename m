Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 092FFECAAA3
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 06:52:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7496C41981;
	Fri, 26 Aug 2022 06:52:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7496C41981
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Op8vVfqnDu8F; Fri, 26 Aug 2022 06:52:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7EA64196E;
	Fri, 26 Aug 2022 06:52:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7EA64196E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8988B1BF8A8
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 06:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70BE2409D3
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 06:48:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70BE2409D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id frAPjNZa1fxE for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 06:48:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01F5F40336
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 01F5F40336
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 06:48:23 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id bj12so1338217ejb.13
 for <buildroot@buildroot.org>; Thu, 25 Aug 2022 23:48:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=mKR+UXResBg6qXmrtU26kxuqzWre9QPAISeqnfOULT0=;
 b=WY8OS8+nxk3wfx97YvBiSTro1qirr+JhwgCgFgB9n7XbwpTbLx2tuWSTuI/ydOaIsK
 9twyEdaeFLeqLAucbaiIqvcMdNCWjyKCyam9afJoQzRPzMy99eEGqGFslKWLFFqXHInh
 y8LQklPhFxTjHb1JEIFIOXhU8rH5ugRxteyV+MmpP1kRShnPiXBA6j2i/fSAOQVs62WY
 iLKzVDHzv6Yd88wjPFOgaRnyVZlTWKx/5K2h7JrNN4SPdL7sf8Eqmk4ueWf43A0ZB/F2
 v0/KKKKHaw49yD+TaaGZn2SVtmg6qdROZtvadUQxXzm+QbggNvrjDyy9xUH3e1R/057R
 Z8mQ==
X-Gm-Message-State: ACgBeo3PuJ7YHZ0XlqrNTObil3KanzX8Y8DwaqYZ3rixkGQ3geGlX10l
 C05uQ4HBW6NTNBpoJvOBKdhtLley28RyNkOk
X-Google-Smtp-Source: AA6agR7kR9ir/ix5Bx9VuQN8KJ5XXRpvx5BUR8RHBjMnXzJJoq3UH3DrlQCdzFfXebKoMGf5uIF3WQ==
X-Received: by 2002:a17:906:6a2a:b0:73d:8246:f192 with SMTP id
 qw42-20020a1709066a2a00b0073d8246f192mr4650401ejc.507.1661496503161; 
 Thu, 25 Aug 2022 23:48:23 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a50fb81000000b00447c0dcbb99sm787613edq.83.2022.08.25.23.48.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 23:48:22 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 08:47:50 +0200
Message-Id: <20220826064758.3968647-22-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826064758.3968647-1-jesseevg@gmail.com>
References: <20220826064758.3968647-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=mKR+UXResBg6qXmrtU26kxuqzWre9QPAISeqnfOULT0=;
 b=g7N4oaGbSz6xfvH28i9XnTyLCUpwhZUfLEhEiXfJcOENrhL0kVKlTiOyimzCHGRQXP
 d3oKMkxZ3edQI2Ek5RT78nCAodUQ2zUSdojzqxT5FxZpdcg4pIdCEKcCM1cy6SqxMvOU
 Us/jNu8pgIuXsXl6aCBZsk7XwMxVO+wLj7mR/qd67O2MQGi52wstiObbCiKbgVwfpOyH
 oExhFKRCnUFqbvmNZXSqpRxnHQl9HhK7lFGD/rd2yZdmcenaXSLwGQb08gmbskyEuPpH
 mLgD1gzINBJqhY/Xl4E6CqdJG9zrsAu42f/J0aHufn0DeMhMfS9d2E64SxZUikmLEESd
 5WUw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=g7N4oaGb
Subject: [Buildroot] [PATCH v2 21/29] package/qt6/qt6base: add support for
 sql module with sqlite
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
 package/qt6/qt6base/Config.in  | 25 +++++++++++++++++++++++++
 package/qt6/qt6base/qt6base.mk |  9 +++++++++
 2 files changed, 34 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index 9cbbce6e4c..469e6b642c 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -74,6 +74,31 @@ comment "PostgreSQL plugin needs a toolchain w/ wchar, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
 
+choice
+	prompt "SQLite 3 support"
+	default BR2_PACKAGE_QT6BASE_SQLITE_NONE
+	help
+	  Select SQLite support.
+
+config BR2_PACKAGE_QT6BASE_SQLITE_NONE
+	bool "No sqlite support"
+	help
+	  Do not compile any kind of SQLite support.
+
+config BR2_PACKAGE_QT6BASE_SQLITE_QT
+	bool "Qt SQLite"
+	help
+	  Use Qt bundled SQLite support.
+
+config BR2_PACKAGE_QT6BASE_SQLITE_SYSTEM
+	bool "System SQLite"
+	select BR2_PACKAGE_SQLITE
+	select BR2_PACKAGE_SQLITE_ENABLE_COLUMN_METADATA
+	help
+	  Use system SQLite.
+
+endchoice
+
 endif
 
 config BR2_PACKAGE_QT6BASE_TEST
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 69c59b8d6f..de65711cde 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -122,6 +122,15 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_sql_psql=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_QT6BASE_SQLITE_SYSTEM),y)
+QT6BASE_CONF_OPTS += -DFEATURE_sql_sqlite=ON -DFEATURE_system_sqlite=ON
+QT6BASE_DEPENDENCIES += sqlite
+else ifeq ($(BR2_PACKAGE_QT6BASE_SQLITE_QT),y)
+QT6BASE_CONF_OPTS += -DFEATURE_sql_sqlite=ON -DFEATURE_system_sqlite=OFF
+else
+QT6BASE_CONF_OPTS += -DFEATURE_sql_sqlite=OFF
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
