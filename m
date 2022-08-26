Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F4FECAAA3
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 13:59:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67EB561114;
	Fri, 26 Aug 2022 13:59:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67EB561114
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c7n3kUmtYnkW; Fri, 26 Aug 2022 13:59:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94BB261112;
	Fri, 26 Aug 2022 13:59:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94BB261112
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3EA311C2742
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 13:55:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 23DFF6111F
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 13:55:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23DFF6111F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PYPq9AKFmbd6 for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 13:55:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 591C96110D
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 591C96110D
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 13:55:27 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id kk26so3276250ejc.11
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 06:55:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=S59TJoR4UJd6eHAefEuRS00QXMlxI6BKdj9+4HzCJp4=;
 b=C37ilFQdtweUaZp7vg0y3H8NdemJ0vlzl6YkjmhwCq/SY6JxidAvIVVAKprFiA1kZV
 1Otn8oCGW/Xt2PlFiTX7OyaTIO9ZaFjfne8LyRFafoqOHjcryzsJUszJfkKGAweT8dVh
 j7KaIkWw5K0xSSk8xL40i7CUBKduJpKJJYxfFeLa/nkJcZYj1jyeVq1/ZwIhpaM871m+
 GxnfG7t8GUEoKjeGx4fXbpoPPD0yL2PbaAbdCOyBE2rjkD7rRBGrGsjgDwrlt5EkOMaD
 VWP2VOMAurjug40ISyNH7DNMgdw7zNRq67fJjtdMlYPxcFf6ytW54LLLdFmtC0sgFrqE
 6oBA==
X-Gm-Message-State: ACgBeo3TDKP1xDQRU9Yd3P0gKhvgrKjQVxw1Uw0njPe7WArXflH00v2z
 7SU43g2vzH7P178Gf6zeIam0i/qFjf/Jb/yo
X-Google-Smtp-Source: AA6agR7pUEwIH/tBquKW0+Rk6MgSwDT+3BR4w+dy7V2/J83OjlftLMwCAc6Fy97t8+lkPU0DLit7Og==
X-Received: by 2002:a17:906:8a70:b0:730:9c9e:edb2 with SMTP id
 hy16-20020a1709068a7000b007309c9eedb2mr5482742ejc.41.1661522125209; 
 Fri, 26 Aug 2022 06:55:25 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a508d86000000b00446bf462203sm1347928edh.1.2022.08.26.06.55.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 06:55:24 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 15:54:53 +0200
Message-Id: <20220826135503.20612-20-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826135503.20612-1-jesseevg@gmail.com>
References: <20220826135503.20612-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=S59TJoR4UJd6eHAefEuRS00QXMlxI6BKdj9+4HzCJp4=;
 b=fFXg8oqf1qzPVmYwrnU0CK7UWFoiIZlrzj5lQtHEGLFFktnVMjcX3DISykO2GjpV1a
 zCB8yfxRSEow3zx0kKhW9yo8k56+DwTRH2VsNkIrwEkmiIiDCBLSpI3blI+A96PZVQFk
 UCc3BK8pW6AU4wc5b30tCm6TqQYMJ6wZczwnx51xJm4S7MWmz+hVyZs9nuh9YGCOCPcX
 fQi4rYbDwJnpOLZ3ZqRosmWNL56GYbtZ38Aqx7jKimpx+L+HhNL9WHq6fwceqmh6xBZp
 1aL35TrY1g4aMFTFrL7WYOZ9GGqHezs5dcnof+scFOh9JxhfOCsZw7jTzB8UylD9AMNJ
 EkZA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=fFXg8oqf
Subject: [Buildroot] [PATCH v4 19/29] package/qt6/qt6base: add support for
 sql module w/ postgresql
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
 package/qt6/qt6base/Config.in  | 14 ++++++++++++++
 package/qt6/qt6base/qt6base.mk |  7 +++++++
 2 files changed, 21 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index 9509fa5be9..79b6d675c5 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -76,6 +76,20 @@ config BR2_PACKAGE_QT6BASE_MYSQL
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
 
 config BR2_PACKAGE_QT6BASE_SYSLOG
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 0061a69c63..3925dee83b 100644
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
