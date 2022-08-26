Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A6AECAAD4
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 12:55:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A00BD82F4F;
	Fri, 26 Aug 2022 12:55:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A00BD82F4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4Dam2jT_9Em5; Fri, 26 Aug 2022 12:55:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9BC6829B1;
	Fri, 26 Aug 2022 12:55:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9BC6829B1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 22DF61BF27E
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 12:53:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0BC24610F7
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 12:53:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BC24610F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hxsjtqk6iZp8 for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 12:53:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C69F60761
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2C69F60761
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 12:53:11 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id u6so1960747eda.12
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 05:53:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=78YYMkUeEwaTr41w9qvTcNZvwNS6VeJOPsGCfIO6vm8=;
 b=mD8a2LAiIJJ8YA3FGGJq+XcoLhOemuSCZcolsQSREWoN5EeXOyTyl1Rizay8jmGTps
 5Rh3JH4YCMAkNLEXB5N/d8OSufmVbU7WaUMn5ecrLZvQq4c6gK0voy7oGMNA+HsedYUm
 Xf9O22Yb9j1SK48ijPC9Ewagsl1ykuM4wHWMYYoqe/ZBKPfZ3L36Z00sXxDqxgJbQ302
 MEc6e86rMYX99CO/B3l4k7AB5Qyuw7M7O/8Uy9Be5LngeZ/Em0Kf7ytkHaG29fgtUjoX
 0kHNZEIjvVE59kfccUOt/5uxuaCoTn3M+frkYiJK8GMrHmr5A2e9HqlPnGwfFDlCkwPe
 qfqw==
X-Gm-Message-State: ACgBeo1rxvaj46lWVUxVC482TofEQvkKMUkZBAxcPdmjYn9uM5nMMA3t
 yoEQKDixShLMFot31C0SWzY65MYIb/RMveKt
X-Google-Smtp-Source: AA6agR555w1pPnaiTzpoziYn5sq87pdNELUvxGWdFD3hrYNUSa0KRhsBye87ld8C28TTxz0/pB1eKA==
X-Received: by 2002:a05:6402:27ca:b0:43e:ce64:ca07 with SMTP id
 c10-20020a05640227ca00b0043ece64ca07mr6872726ede.66.1661518390366; 
 Fri, 26 Aug 2022 05:53:10 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a1709064d8200b0073923a68974sm829573eju.206.2022.08.26.05.53.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 05:53:09 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 14:52:37 +0200
Message-Id: <20220826125252.16782-15-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826125252.16782-1-jesseevg@gmail.com>
References: <20220826125252.16782-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=78YYMkUeEwaTr41w9qvTcNZvwNS6VeJOPsGCfIO6vm8=;
 b=NK6kue8SgAbk15PVA/vifolGFQuHBuYYgM4CBsz7qewwsi8b19gBetOCoUzGaV0KVH
 kb8uA7Fo1LsRJmMPnd6R7RRZe/M+CHvq3LIfxUe+c3Fr2kpuOHpfCfN3s8f6C6uNa8MU
 12RkUMR1exhpcrMyrzYt/6GsB3nZuHvz417YPgpZvWJWsHnBNYfw+SA2Fv+hofqYw7Wc
 eeWgaZMtJ7nGHxrD+Hs5RC71HgXlEXNhjF9bPgViXC+KYpW9+hXd9Um/ogDvXsrJ1yW/
 qKtdM5b6GlyA/c3RkNI20KH1K2pnWk/viucGV6mB1eZzrGq1Q4QI1qdFDkixaOz8nRzh
 LCRg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=NK6kue8S
Subject: [Buildroot] [PATCH v3 14/29] package/qt6/qt6base: add qt icu support
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
 package/qt6/qt6base/Config.in  | 15 +++++++++++++++
 package/qt6/qt6base/qt6base.mk |  7 +++++++
 2 files changed, 22 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index f3e56aefa4..0fc54a6c27 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -30,6 +30,21 @@ config BR2_PACKAGE_QT6BASE_DBUS
 	help
 	  This option enables the D-Bus module.
 
+config BR2_PACKAGE_QT6BASE_ICU
+	bool "Enable ICU support"
+	depends on !BR2_BINFMT_FLAT # icu
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # icu
+	select BR2_PACKAGE_ICU
+	help
+	  This option enables ICU support in Qt6. This is for example
+	  needed for Qt6Webkit.
+
+comment "icu support needs a toolchain w/ gcc >= 4.9, host gcc >= 4.9"
+	depends on !BR2_BINFMT_FLAT
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_HOST_GCC_AT_LEAST_4_9
+
 config BR2_PACKAGE_QT6BASE_NETWORK
 	bool "network module"
 	help
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 0826a0be07..47512fcab6 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -114,6 +114,13 @@ QT6BASE_CONF_OPTS += -DFEATURE_dbus=OFF
 HOST_QT6BASE_CONF_OPTS += -DFEATURE_dbus=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_QT6BASE_ICU),y)
+QT6BASE_CONF_OPTS += -DFEATURE_icu=ON
+QT6BASE_DEPENDENCIES += icu
+else
+QT6BASE_CONF_OPTS += -DFEATURE_icu=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_QT6BASE_NETWORK),y)
 QT6BASE_CONF_OPTS += -DFEATURE_network=ON
 else
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
