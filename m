Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C5CECAAD2
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 06:53:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E7FFF40DC6;
	Fri, 26 Aug 2022 06:53:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7FFF40DC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ih9IQH4lFKx8; Fri, 26 Aug 2022 06:53:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB8D140D77;
	Fri, 26 Aug 2022 06:53:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB8D140D77
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4FDFF1BF8A8
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 06:48:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B967400F1
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 06:48:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B967400F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SacR7ZrbPmpa for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 06:48:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B28E40012
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5B28E40012
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 06:48:27 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id m1so955786edb.7
 for <buildroot@buildroot.org>; Thu, 25 Aug 2022 23:48:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=1F94TV2kmmt135y68sjJkqSzhlQRYgHDY4ndskKk4J8=;
 b=YEx0X/qCLvyGGDLWEwNQBgln0bHGxaIKEeqqS1Il9/sxN+nXDm905qCJTiZHeVq5Qp
 qY+Qa6tHFC5ipG3t2LAzZp2VBDnk8xV6jTAahFPwWjonsZCq+wUgMk46O4BrgPAW2Oa8
 gerfgweT6x3p+LFUsgS2l1LB3BQaRBD8Aqia0RHTu6ELVwb62YsclBs6//TbggkBVRD/
 xHpEJAJMcM1HwwLHsBzBnW3uyAYWHFI+8UZK44VaSvAaq2UZidPK6/uQWozn4h0iwNoz
 brZJYOppPoYhTP2pyz9B8xomNAegyrz/DCZBi6WwCISyTtalGrO9wjOySrWXpVwjcXAG
 dtLQ==
X-Gm-Message-State: ACgBeo1K7u0rreHucZSbV2tiBFtBg9h2XLK6T6ejRAE8S6bvEAkV0z6C
 BjQv7KH81+Yn/qh1WC/K81omrphhUqk9XiTv
X-Google-Smtp-Source: AA6agR6idv2+CmtsZqsyIbHhInuGZS5z/93EfknE1KzGt8LYHrlwb4hFawFwIkA49+VgZayVsb34pA==
X-Received: by 2002:a05:6402:e96:b0:443:a086:e3e8 with SMTP id
 h22-20020a0564020e9600b00443a086e3e8mr5901381eda.330.1661496505134; 
 Thu, 25 Aug 2022 23:48:25 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a50fb81000000b00447c0dcbb99sm787613edq.83.2022.08.25.23.48.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 23:48:24 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 08:47:52 +0200
Message-Id: <20220826064758.3968647-24-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826064758.3968647-1-jesseevg@gmail.com>
References: <20220826064758.3968647-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=1F94TV2kmmt135y68sjJkqSzhlQRYgHDY4ndskKk4J8=;
 b=Op6R81ugX8WNK8UppdlnVk+QOfdwaZgOkZ6bd/HK7+ltrceqdgQxtRr8WmnjVLL6cI
 Yi9rcsiHZMb8VQiWkMLq+ipMhZ5/3yn2mnR5zCGbUr+CcxR0xE0QzBIM7ggP8njBn3ix
 cUxlqu2I0AHXuPl6C/I7eBpsfEk7CmgmG2bWTSxcVOuJKwV8UTzosNHtzfra1H32PYuU
 PeuA3GjpVlFegXEVJJuMWyrdpYt1faCh5MdO+9rlJbmsjuwyn5gsZI3K01rqKVFebNWP
 JO1C4n/DJX1qxT8Zfds1HDli0vj7fBmfOiYTk+TrkoKJX8NfYAQR7pPKlkBuz4TqI7Wa
 MElw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Op6R81ug
Subject: [Buildroot] [PATCH v2 23/29] package/qt6/qt6base: add support for
 gui module fontconfig/harfbuzz
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
 package/qt6/qt6base/Config.in  | 21 +++++++++++++++++++++
 package/qt6/qt6base/qt6base.mk | 23 +++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index 8959a59431..e78fd45421 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -117,6 +117,27 @@ config BR2_PACKAGE_QT6BASE_GUI
 	help
 	  This option enables the Qt6Gui library.
 
+if BR2_PACKAGE_QT6BASE_GUI
+
+config BR2_PACKAGE_QT6BASE_FONTCONFIG
+	bool "fontconfig support"
+	select BR2_PACKAGE_FONTCONFIG
+	help
+	  This option enables Fontconfig and Freetype support using
+	  the system fontconfig and freetype2 libraries.
+
+config BR2_PACKAGE_QT6BASE_HARFBUZZ
+	bool "harfbuzz support"
+	select BR2_PACKAGE_HARFBUZZ if \
+		BR2_TOOLCHAIN_HAS_SYNC_4 && \
+		BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	help
+	  This option enables HarfBuzz support (either system harfbuzz
+	  if the toolchain supports __sync for 4 bytes, or the qt
+	  provided one which avoids this dependency by using QAtomic).
+
+endif
+
 config BR2_PACKAGE_QT6BASE_SYSLOG
 	bool "syslog support"
 	help
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 6378614526..c92239f2fd 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -139,6 +139,29 @@ ifeq ($(BR2_PACKAGE_QT6BASE_GUI),y)
 QT6BASE_CONF_OPTS += -DFEATURE_gui=ON -DFEATURE_freetype=ON -DINPUT_opengl=no -DFEATURE_vulkan=OFF
 QT6BASE_DEPENDENCIES += freetype
 
+ifeq ($(BR2_PACKAGE_QT6BASE_HARFBUZZ),y)
+QT6BASE_CONF_OPTS += -DFEATURE_harfbuzz=ON
+ifeq ($(BR2_TOOLCHAIN_HAS_SYNC_4),y)
+# system harfbuzz in case __sync for 4 bytes is supported
+QT6BASE_CONF_OPTS += -DQT_USE_BUNDLED_BundledHarfbuzz=OFF
+QT6BASE_DEPENDENCIES += harfbuzz
+else #BR2_TOOLCHAIN_HAS_SYNC_4
+# qt harfbuzz otherwise (using QAtomic instead)
+QT6BASE_CONF_OPTS += -DQT_USE_BUNDLED_BundledHarfbuzz=ON
+QT6BASE_LICENSE += , MIT (harfbuzz)
+QT6BASE_LICENSE_FILES += src/3rdparty/harfbuzz-ng/COPYING
+endif
+else
+QT6BASE_CONF_OPTS += -DFEATURE_harfbuzz=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_QT6BASE_FONTCONFIG),y)
+QT6BASE_CONF_OPTS += -DFEATURE_fontconfig=ON
+QT6BASE_DEPENDENCIES += fontconfig
+else
+QT6BASE_CONF_OPTS += -DFEATURE_fontconfig=OFF
+endif
+
 else
 QT6BASE_CONF_OPTS += -DFEATURE_gui=OFF
 endif
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
