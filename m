Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B45A1ECAAA3
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 12:57:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D4E9610FD;
	Fri, 26 Aug 2022 12:57:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D4E9610FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7XeJjXehXarY; Fri, 26 Aug 2022 12:56:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6AFC2610AF;
	Fri, 26 Aug 2022 12:56:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6AFC2610AF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 724CA1BF27E
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 12:53:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 49BFC83EE9
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 12:53:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49BFC83EE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EQhPBPXeHZ0U for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 12:53:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BC6083EFE
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6BC6083EFE
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 12:53:17 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id lx1so2950538ejb.12
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 05:53:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=yUNsauMXtACwwV3p18dAZ61z4AoSiMi0I5wTidsGspI=;
 b=LlzlPMr1WyIux1OL3hhdpZfkXFpYolNtCqXaHKTlxqbjEkLFGF8TLVP1J/g+EUHehj
 mn29rDPdXhSJ95oLVs8RuJkj74Ry6rNBB886rH+ebOockH0Ofi6BYEEbFYjMI/IyKDnT
 6kJR/EPPU4hqklnZJWzY1rNnE8Jl+JM/xnwDJLAmQ98zmRfU3P2kMMdjKkn5vQN/tEkl
 vyjBFhnqD+NFEEuZLLjdhB/ppq0xVi8ObEWKQRSoVrugJ9bovsnyG92lwLBZDDwz47Fy
 Qus+++Em5J6EHn/gmdiHNynsI2xImFIjC51uqItjXJkicaWtbhxJMHtSEZBNveYwK5up
 o0Aw==
X-Gm-Message-State: ACgBeo3WgIIgZdOBO6kmYmzGmsmFCGHIUmWipqaPAaklhVhDMjTKYTmz
 wJPT9D4wCxWvohV2tYbEWtvdavOf/+tOeXhs
X-Google-Smtp-Source: AA6agR5WrViV8bTc16j0JKm8IlJrD3mULASLj19ObLaJ326TdP36QJ3FT68nCRivoxNsIi4vwSopJw==
X-Received: by 2002:a17:907:97d2:b0:730:657f:bef5 with SMTP id
 js18-20020a17090797d200b00730657fbef5mr5487832ejc.757.1661518396578; 
 Fri, 26 Aug 2022 05:53:16 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a1709064d8200b0073923a68974sm829573eju.206.2022.08.26.05.53.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 05:53:16 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 14:52:43 +0200
Message-Id: <20220826125252.16782-21-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826125252.16782-1-jesseevg@gmail.com>
References: <20220826125252.16782-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=yUNsauMXtACwwV3p18dAZ61z4AoSiMi0I5wTidsGspI=;
 b=iToHgm6bo2UGIgyM7cI4Ig2m9jgcC6TEluxT9ywuxMFeMhN2ylCM/5kgkg/1eIViPx
 MFEgW+ItmU4d1l9qKaNVy5lnHY4H4b22pWZz97ONOlhZWf0A0Q8hEbepLmuAXulkD70f
 Mn1baHo3AcyY/YlJEJ31jEX3Qe2M+kQ3AGh6C+x3/fmWyIZLd8qSW3hPdWG/0Zp6v1fB
 BO6DPEyuYxcEevC0J4xW6fJpJTP1Z+tFWOMma+XmCXSF6ISRPKS5pWwqbsZy0GOvIi73
 koOEesBVfk9UT9jS5edmsJLAdw5Ww9SSq8iTftATyYkpptrkJDonaKms2/KSsE8syBl8
 BRNQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=iToHgm6b
Subject: [Buildroot] [PATCH v3 20/29] package/qt6/qt6base: add support for
 sql module w/ sqlite
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
 package/qt6/qt6base/Config.in  | 25 +++++++++++++++++++++++++
 package/qt6/qt6base/qt6base.mk |  9 +++++++++
 2 files changed, 34 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index 79b6d675c5..5ae11afdb1 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -90,6 +90,31 @@ comment "PostgreSQL plugin needs a toolchain w/ wchar, dynamic library"
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
 
 config BR2_PACKAGE_QT6BASE_SYSLOG
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 3925dee83b..e7c403b75a 100644
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
