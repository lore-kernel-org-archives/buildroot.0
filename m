Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D861EECAAD5
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 13:56:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 559C983F3A;
	Fri, 26 Aug 2022 13:56:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 559C983F3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ms93jZeeJout; Fri, 26 Aug 2022 13:56:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A02C83F33;
	Fri, 26 Aug 2022 13:56:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A02C83F33
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8B9F01BF5F5
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 13:55:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 66F1461116
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 13:55:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66F1461116
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bP-wY3EavcCu for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 13:55:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A59FB6110D
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A59FB6110D
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 13:55:13 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id x93so2052414ede.6
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 06:55:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=t+VgvIKVX6WJLeXrohUbPy9OzLwFDWGM8kmn+2Egxx8=;
 b=uUg4xXLw7tQbeKcxSUZDEhK+LKQvaZdy6k9LuATvVibSdFTk1QADsRTSRIaEwcbKcA
 ZhXgQHLPjI5tYqrGK3FXit2MoXL3hvwMXI6f+29qrWjDfFscTAc5y/WXXy5o2PwhYAS8
 o3XfvN/BRcDM7pXHm57aJc2SZ4wBKRAF4F0oQFWlebJp9vGkWSjwejKivkcRfr07EAAq
 TrTZk0n/yPs1PAnNHxagfpntmajgSDl80Pcti8MMCg4GD/Zwnn5xaL3Y4G0UvNIvKWVl
 pAYsnPjqDVs087f4f9jaShCmhl0YYQbPh92lRqY+APBhmblBfncJixMLe8YOSmA3orpU
 xHJA==
X-Gm-Message-State: ACgBeo3IbRfvdsONZVfmmvPbjz/lx/8NvHi+esGqnCixcad8HRgI34y2
 R+5lxoi5u8YmS8S65mNSw8CqaibegBQEOvmx
X-Google-Smtp-Source: AA6agR4anf81v08qa5obaQuy+7cguYJVUeqPM+PD7kLbXTwDqHpKRfyStIDsPyv9mxv69iXTd3l7hw==
X-Received: by 2002:a05:6402:551a:b0:446:1526:85ea with SMTP id
 fi26-20020a056402551a00b00446152685eamr7031832edb.188.1661522111482; 
 Fri, 26 Aug 2022 06:55:11 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a508d86000000b00446bf462203sm1347928edh.1.2022.08.26.06.55.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 06:55:10 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 15:54:39 +0200
Message-Id: <20220826135503.20612-6-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826135503.20612-1-jesseevg@gmail.com>
References: <20220826135503.20612-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=t+VgvIKVX6WJLeXrohUbPy9OzLwFDWGM8kmn+2Egxx8=;
 b=iA+o7qeoxerlIols4biegS0urvgc7/QiQLXDyHpS5/pXKNxvur5dYDubgiRx38VCK2
 mLmDmz61VYB1bZHxDXnGPR14RNYpsLony3pF/fJChzw05mODyx59wTH1qV6EcQs1WVN4
 6INssiCxnGczuODKvSEQUYPufYBFF7tKP5uVAG0F3v8ialDlKIrqFkvuuXBjdbSzNGm1
 Z9DBrXna9/BQYG+l2X8WtsHVqF2pLFIM/tuJsRPkctT/+D87R8Bk39aOON8k/rZrkAyt
 p4+d4dhEZPHdT72dmDhWrS9WsKHMh5ivn2zfadafmQb2Rr5tarYbKvfy87eTUCLoHii/
 /qTg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=iA+o7qeo
Subject: [Buildroot] [PATCH v4 05/29] package/qt6/qt6base: add support for
 xml module
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
index fe488f1cc9..41c04fc5f6 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -27,4 +27,9 @@ config BR2_PACKAGE_QT6BASE_NETWORK
 	help
 	  This options enables the Qt6Network library.
 
+config BR2_PACKAGE_QT6BASE_XML
+	bool "XML module"
+	help
+	  This options enables the Qt6Xml library.
+
 endif
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 302aecab31..1af24334a9 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -89,5 +89,11 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_concurrent=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_QT6BASE_XML),y)
+QT6BASE_CONF_OPTS += -DFEATURE_xml=ON
+else
+QT6BASE_CONF_OPTS += -DFEATURE_xml=OFF
+endif
+
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
