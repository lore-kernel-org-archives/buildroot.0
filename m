Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C456ECAAA3
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 13:56:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 40FC740FE4;
	Fri, 26 Aug 2022 13:56:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40FC740FE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xyjdhjTs2uh0; Fri, 26 Aug 2022 13:56:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C1C2140FD1;
	Fri, 26 Aug 2022 13:56:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1C2140FD1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6D7331BF5F5
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 13:55:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48C9D83EF9
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 13:55:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48C9D83EF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W6yZOU0oEXBx for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 13:55:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 985BD82FA9
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 985BD82FA9
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 13:55:14 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id h22so3320047ejk.4
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 06:55:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=dfaKtT7wjvLCYkzgkaaA/BTPNP57uHLK9gUNAghQsUQ=;
 b=5Oo7R/Xucu7gj5H/lOmM36m7QsLjbW2uMWXBgknJTCTljgXaXe+F/E/LNyk7olgttM
 q+W2swuw5m6txeiL9oYXb2aLtEet5Q3CCcBnvdcIz1mRoQs40jmZC54j78tecHnTwKkY
 3zR8CrRxcr2xNdrFa0olRFXP+jspZOLDzZx1wAczNVmhxK6wRuJSVDAFZNb8U+761BYy
 S550XONHzgZ5fGYndCgVbRRfKucBMK2CUXZbf5NTlzKHGAriqq2HwS8dq8nEP49TUrYQ
 2TV+6gtyFF9rkVegnskDd9pMmu8vKOodQpsbDvQ8nECm49Sus09M838rJ0pvMkR4x9FG
 LSrw==
X-Gm-Message-State: ACgBeo0d0crMsvUJiZ7IrOAhG6xMIgMXjtgNb6HpmGufUCQRfkSbciO2
 Il4gW0KXu9oilMgJPgrMOxlB3itYEb5jq9Ef
X-Google-Smtp-Source: AA6agR6IZtVavnDgkqzTiQ9pVqPho5XK96PCPSwC7lpsgZWDbvm8J7TkGnwaWVtM3lUSOjm9FhBiAg==
X-Received: by 2002:a17:907:3ea5:b0:73d:85ec:453 with SMTP id
 hs37-20020a1709073ea500b0073d85ec0453mr5443430ejc.311.1661522112483; 
 Fri, 26 Aug 2022 06:55:12 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a508d86000000b00446bf462203sm1347928edh.1.2022.08.26.06.55.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 06:55:11 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 15:54:40 +0200
Message-Id: <20220826135503.20612-7-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826135503.20612-1-jesseevg@gmail.com>
References: <20220826135503.20612-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=dfaKtT7wjvLCYkzgkaaA/BTPNP57uHLK9gUNAghQsUQ=;
 b=bk5Sqt0mjpPd0TR6PzlxbWTbQHWq6K0Xso7t6km7EWavn4QHALT+fEwVB4HvPzCAAY
 0xgwKkJb6gYtO+wBJCuY6t5o9xQD5yPS1UiUJYYpwtlb+mE6EbMG/7CnaH7kNLwSpaMr
 Jw7+GfbR7F9el2icC4hpP7zOcL+FASdSzgQl6J6qTpXHREPT/VDutm2NcKq3Ht8RDrwt
 BhInYtPuLGV9MrpTrFjXulRoi1kxMQTbSoXqDI4uCZmdJuDoq7LernTkHtsqKsVdvKd0
 +EhjNxPyaAhogpc+pHs4q5SYd6gmcdvhXDR6KsjQiBUW6tmsmL1WzVKd8QXuEGg36+Ml
 2Dzw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=bk5Sqt0m
Subject: [Buildroot] [PATCH v4 06/29] package/qt6/qt6base: add support for
 test module
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
 package/qt6/qt6base/Config.in  | 5 +++++
 package/qt6/qt6base/qt6base.mk | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index 41c04fc5f6..354e02280a 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -27,6 +27,11 @@ config BR2_PACKAGE_QT6BASE_NETWORK
 	help
 	  This options enables the Qt6Network library.
 
+config BR2_PACKAGE_QT6BASE_TEST
+	bool "test module"
+	help
+	  This options enables the Qt6Test library.
+
 config BR2_PACKAGE_QT6BASE_XML
 	bool "XML module"
 	help
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 1af24334a9..fd1e0a2847 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -89,6 +89,12 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_concurrent=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_QT6BASE_TEST),y)
+QT6BASE_CONF_OPTS += -DFEATURE_testlib=ON
+else
+QT6BASE_CONF_OPTS += -DFEATURE_testlib=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_QT6BASE_XML),y)
 QT6BASE_CONF_OPTS += -DFEATURE_xml=ON
 else
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
