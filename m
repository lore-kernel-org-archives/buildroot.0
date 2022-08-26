Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F14FECAAA3
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 13:56:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19FA541A3D;
	Fri, 26 Aug 2022 13:56:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19FA541A3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g_gfVCQATfig; Fri, 26 Aug 2022 13:56:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E39BB41A35;
	Fri, 26 Aug 2022 13:56:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E39BB41A35
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E4BC81BF5F5
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 13:55:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE0AE61114
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 13:55:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE0AE61114
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3WXybsYm8fXV for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 13:55:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C306261112
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C306261112
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 13:55:11 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id 2so2224604edx.2
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 06:55:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=qnno27R6JkSQiFr3ayg+EneJr6Kh6G2JB7xMr9N5D9k=;
 b=lJ28C0zon6NHFwAT+v4UMffbgA4N1wxV4tUpmPYlVULAa7e2Sc6glHZMRj+a7cGZB2
 Rbd85iNzCk1ZOsYiJFuPXuYHdHfeu3mhB3ju9BNe63Zz1hAEhevPO5xVuRTmy7lg9qmt
 GqhAxlRdxkr2Qpla+AQeXqf2lldSv2l3hqSWfPRX8ntkngMce6K+X6+Pbk1ej7evM2Jf
 4U0FZ1qDJTyDzbE6WDlsybxStTioMJemEeUjScSnwFDChhIvMp9+O8mfOpG+b3tMsQc7
 8Vq+MPg4N4G3ILQT5qtfbxV5QysAz45RJdP1rWu1mQ1rjYH3AVUONwPXWOtt//1j5kUL
 b41w==
X-Gm-Message-State: ACgBeo0ZuNz5vLIdVBwMQ89pKs+lA92BV7DdEn6N+UF4CP4joGwg7Hd/
 063NLk/rUHTR8RVc5V2Gya1P+zzl2KrUUkrT
X-Google-Smtp-Source: AA6agR7IPNXTUeVeFllSfboRVHJVH1ha/2RHs3wvx0j6iwVJ1FlWyoXMPN5ffISbrtLhTQCacymxIg==
X-Received: by 2002:a05:6402:2b88:b0:43a:6c58:6c64 with SMTP id
 fj8-20020a0564022b8800b0043a6c586c64mr7015708edb.348.1661522109435; 
 Fri, 26 Aug 2022 06:55:09 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a508d86000000b00446bf462203sm1347928edh.1.2022.08.26.06.55.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 06:55:08 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 15:54:37 +0200
Message-Id: <20220826135503.20612-4-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826135503.20612-1-jesseevg@gmail.com>
References: <20220826135503.20612-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=qnno27R6JkSQiFr3ayg+EneJr6Kh6G2JB7xMr9N5D9k=;
 b=FtPmRG8wozfwPxpbPojzCkjbqY/mewDJe1AV5aL6137pWWl9zSha8jBdClmKrbS4rg
 WgODWgTv6lpDjmB54ZKQIdYP71yqo7LFtReq+ihDErFz2tOiK2tRzruPamzpAcOJ6O3x
 eAeYrmz1HwUW5Q4SLGjtDRFIYXDVJIQlY9j5OLz/ns2MB1UXvBc0kadVWL+mXMxUUi0q
 BRL2Yo2NZRAv1ooS970atmM9XjafHbOY/5KUAlfAI3IciihY1ovsLHCHsQjnMkOAL5Bg
 0tfAzM1C2FetXZxdVwVn8riD0y0P+wbhXgQav4tw+dW/F/+eTWszpnGz2/X/hyewRNFT
 ovaw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=FtPmRG8w
Subject: [Buildroot] [PATCH v4 03/29] package/qt6/qt6base: add support for
 network module
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
 package/qt6/qt6base/Config.in  | 9 +++++++++
 package/qt6/qt6base/qt6base.mk | 6 ++++++
 2 files changed, 15 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index a489ce39fc..68bca728e2 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -14,3 +14,12 @@ config BR2_PACKAGE_QT6BASE
 	  QtWidgets, etc.
 
 	  http://qt.io
+
+if BR2_PACKAGE_QT6BASE
+
+config BR2_PACKAGE_QT6BASE_NETWORK
+	bool "network module"
+	help
+	  This options enables the Qt6Network library.
+
+endif
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 7a0838b2bc..b4b6450bf1 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -77,5 +77,11 @@ define HOST_QT6BASE_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(BR2_CMAKE) --install $(HOST_QT6BASE_BUILDDIR)
 endef
 
+ifeq ($(BR2_PACKAGE_QT6BASE_NETWORK),y)
+QT6BASE_CONF_OPTS += -DFEATURE_network=ON
+else
+QT6BASE_CONF_OPTS += -DFEATURE_network=OFF
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
