Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 592B9ECAAD2
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 06:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E21DD83E8C;
	Fri, 26 Aug 2022 06:52:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E21DD83E8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9LZ1rltic0pu; Fri, 26 Aug 2022 06:52:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E9A683E83;
	Fri, 26 Aug 2022 06:52:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E9A683E83
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4FADB1BF8A8
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 06:48:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B35340012
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 06:48:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B35340012
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RPQgEu-DxZMj for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 06:48:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E63B4014C
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5E63B4014C
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 06:48:23 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id lx1so1344938ejb.12
 for <buildroot@buildroot.org>; Thu, 25 Aug 2022 23:48:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=F2lfkKeu0KUaMEzji4lNyZqyqzK+YHQerLJX7iL5f4o=;
 b=y4ILlDg39+x0omtFlLx43WdU7M0zE3yqefHXFB9msJPlherqPTHxxjuFdR/gEsZNkx
 m2J9rU8C8Lle4I5lbAra328NMakgrPwkNMxlAiW0hlLldfbuzIlee5vhyGPpPwKV3ox+
 zAuGUgHaaCWjQq1zXRNrIYdzxgZnJcSOdxD5MQE0kD6mKfgYDmW9K08+QIe5D+9c6GVf
 KK2qxdziHSgHinVmBZBBSxDCzisiFtlxHoEVxzsw3I/6wdPtVjGaIuIBbgQ5WAB3deRV
 j7nrh/My0c31KN8RWQ+N9g+bX5ybKZEfn+UKwsyyWZfJvGNfPJQ7XgnC0brPwkyS/r1S
 8NPw==
X-Gm-Message-State: ACgBeo1sZYNuLHN37ZJAxsfZvLiuu+L54FRWgl9OeYcGgkfyFIyB1nBI
 b3IvYQC0g+W/AZpfa18IqPTeuRYRPvYzDc2w
X-Google-Smtp-Source: AA6agR4RIIxzPrnEFQGoJO+5TYbe75ZgW41V2qVwXLs+csXzHkl07kP5qMgJlkQ1LjxkxAXx2mhTuw==
X-Received: by 2002:a17:907:31c7:b0:740:e3e5:c025 with SMTP id
 xf7-20020a17090731c700b00740e3e5c025mr482774ejb.341.1661496501193; 
 Thu, 25 Aug 2022 23:48:21 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a50fb81000000b00447c0dcbb99sm787613edq.83.2022.08.25.23.48.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 23:48:20 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 08:47:48 +0200
Message-Id: <20220826064758.3968647-20-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826064758.3968647-1-jesseevg@gmail.com>
References: <20220826064758.3968647-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=F2lfkKeu0KUaMEzji4lNyZqyqzK+YHQerLJX7iL5f4o=;
 b=Et6B5+T5fWkFHxAXdbShWguU5H4jWACer9DZGi+PyyOjH/kP7JzrIF3mWcIh3GsKJ8
 tWrIJLK/1qA4dDQax+SQuT9BOXE1hjJUtamZhGKU9sWnUPdX/ymp7YFZmYX8ce3VZECV
 xPTMF2/gTDUYJ6M4XJRTbhLOxjp4D3doU8+4pt3fSOlekTx7anfXjDRR4S55dAMd1Zey
 Nf+YV+IHB/49rdf7nKFVfEkOvPInBEcZYxS5n5eH8gCemhyleNt4fRgSgchW7LeJD9Hl
 hoIP5Ux51tP4aFuNA/x6/Kl9PdWLZKozdSY6UUG+1t0mPLtkX/M2PfeeB3SBMs8DERdF
 N64A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Et6B5+T5
Subject: [Buildroot] [PATCH v2 19/29] package/qt6/qt6base: add support for
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
 "Yann E . Morin" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

---
 package/qt6/qt6base/Config.in  | 18 ++++++++++++++++++
 package/qt6/qt6base/qt6base.mk | 16 ++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index 949bf26843..35a83beb92 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -44,6 +44,24 @@ config BR2_PACKAGE_QT6BASE_CONCURRENT
 	help
 	  This options enables the Qt6Concurrent library.
 
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
 config BR2_PACKAGE_QT6BASE_TEST
 	bool "test module"
 	help
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index ce937300d0..5a3798a1d2 100644
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
