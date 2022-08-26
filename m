Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A39ECAAD4
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 13:59:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D93E83F29;
	Fri, 26 Aug 2022 13:59:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D93E83F29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bk2XNtto51WC; Fri, 26 Aug 2022 13:59:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4468B83336;
	Fri, 26 Aug 2022 13:59:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4468B83336
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 388131BF5F5
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 13:55:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1FD4E41A21
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 13:55:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FD4E41A21
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zdnthfriHBgF for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 13:55:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1824341A10
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1824341A10
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 13:55:27 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id p16so180780ejb.9
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 06:55:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=yUNsauMXtACwwV3p18dAZ61z4AoSiMi0I5wTidsGspI=;
 b=sDyekfucbMF9I697Vj7goR1GjBxcsHGU/eX5/OIz9UiAYRbl75bQl8Nxjk1H6tJgZa
 AOQHyZU+GK5QPTvNvRbHu4LIKwtTKhEJBVAk1qRaLmCk/RZmcHSDPTfeHdzkRgKPTEG1
 s2X44SG4hmKLx5wuyhR/7KkHviLKWA+wFgwnLZxMd8uMG371oiJj3gap9s+vbJLQ1QW4
 kbH2JVl9mXlETNUSIUVMW15D3b2wdLHKNHQWLx03RzhIPMNJMmNxk5QpnsTiJ+1JzeHS
 UmecrAozFesZBw5J69ecIKSMByTmziuuL0O8pomdBSsUcsfh6Gyg86TkWjL67x8dvcWR
 lXpw==
X-Gm-Message-State: ACgBeo0x91+0vcK4FY5yaRY6GN41QkfT1f1gD0+hLALYoctxiQh9VbVJ
 qhLEHtv0D9a71bFARYIg5OsvbjFJMFRjNAd0
X-Google-Smtp-Source: AA6agR7Hn9ad2n5znm1snvR54TMi+uiqbYIkM7rEehUxc1EIXFLsv2AGIjtTlvMdYdYVuEC/021EEg==
X-Received: by 2002:a17:907:2d1e:b0:73e:7c1f:b47d with SMTP id
 gs30-20020a1709072d1e00b0073e7c1fb47dmr2125155ejc.681.1661522126199; 
 Fri, 26 Aug 2022 06:55:26 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a508d86000000b00446bf462203sm1347928edh.1.2022.08.26.06.55.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 06:55:25 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 15:54:54 +0200
Message-Id: <20220826135503.20612-21-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826135503.20612-1-jesseevg@gmail.com>
References: <20220826135503.20612-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=yUNsauMXtACwwV3p18dAZ61z4AoSiMi0I5wTidsGspI=;
 b=cveYzXHWJmu02k3LzKfi654cJqJ3a4l92h0Hdw/LoRgdxCHwnDvQWmLKfNX4XOHim7
 /BooA188EI7ymcMVQeNkywERGhV8lioKN4dg6sRGaxw7GISSdQ9iNmqp4fxtLd0snfB4
 ewamUWMN1A4whx6Liq93RlVuMPh/VgnMBhwUx9ygyTkNgX6S7snJaApNhgEE7pU2zgbh
 74FS9yirXmJsNaUza6UI589lLxY+4fl8bptTevOdOlPYpfv998VV/sHh4fxAqKC4M8aY
 fAtkeC6ry4NtemN4hcXJi0U5dR2yBzOEGHY1ijGDrQ9kBM8PlTxjM7mKwV5Pxa4aSkFt
 yFqA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=cveYzXHW
Subject: [Buildroot] [PATCH v4 20/29] package/qt6/qt6base: add support for
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
