Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63229ECAAD4
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 13:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5AB44177B;
	Fri, 26 Aug 2022 13:59:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5AB44177B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gy9533vZCjvT; Fri, 26 Aug 2022 13:59:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC29840210;
	Fri, 26 Aug 2022 13:59:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC29840210
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 146261BF5F5
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 13:55:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E422683EF9
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 13:55:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E422683EF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XhltE2U_d_8D for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 13:55:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1982982FA9
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1982982FA9
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 13:55:28 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id bj12so3263921ejb.13
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 06:55:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=uQpWEsGAk7itpXAxvcJtgFDv+aFQ54EpM4OAulFWPuA=;
 b=tIsU3Ka1U1vF6KKgmtuUNvVlRWSH+gJdrT+3n7g3IRomD3tXpkmuhHUjG60yhHMHSu
 o0rKDH9Q7JkqvJxBsRTwcM7FevF3XHI2MGCz2fHswgZGEYVTjqwVF+hOCcEO3u6xVSOb
 xXywgeTMhY9umlD76jmSq3bLgKFWhNsrj9Fb6L1JxIxAx3uZNf+hG+wQG/zL/B/Cmg+9
 ND2nHOpJUwD4cqLKkTtYWQArXWZ6VYmm+SC1bUQUbq5dTLWDiC0T9P6Vw+UQzGb9E9wM
 YCtMyq4oj28cFQqDSHeGcVge74n4Yi58tPiYce0Hsl0W1P0VA3DDtyUy5jMsDMpvn7PS
 zj6w==
X-Gm-Message-State: ACgBeo32zBE5Rb2EcnSrWau5oZyx/8+RZQBHIwd6TGHvhqGaljcX51+M
 HTYq8by72VSPtOUkztK63pMP/fCMm7s6BmvP
X-Google-Smtp-Source: AA6agR5M1Qjpf2reValO5/LiDxYQ0Nl3PpoKlKOwTXo748hBP8bCMKKKqUxIRgaUqHyH5npKe9TKzA==
X-Received: by 2002:a17:907:d9e:b0:731:1a5:8c68 with SMTP id
 go30-20020a1709070d9e00b0073101a58c68mr5655936ejc.365.1661522127221; 
 Fri, 26 Aug 2022 06:55:27 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a508d86000000b00446bf462203sm1347928edh.1.2022.08.26.06.55.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 06:55:26 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 15:54:55 +0200
Message-Id: <20220826135503.20612-22-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826135503.20612-1-jesseevg@gmail.com>
References: <20220826135503.20612-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=uQpWEsGAk7itpXAxvcJtgFDv+aFQ54EpM4OAulFWPuA=;
 b=HN1436mT4abWw7J2a4Jsz9gsIo9qcBiRmuhjXMaupYN3Oj/S5Olf3JyHCNFEoVW7VZ
 qfBl32NE0cgEkwLLZSzb/P9EWMIdG0vTGayVzmr0BMEQ1/d5Od+sxyw4xhIF1srjeht9
 a9n++A7yfOwOVbWNu20zbOelcijBg1ofsZ9quubc7j5+3KkHVV2FWqkw42wKKcER3PSW
 FZnUwc7e7qjuRlPBKpPzM+cP4033JV62dK0nvuDKaRdDOwe1PT3vMU+cGw+r44PQawQT
 N/MZpFP5Iiu0E4PXhdTNtXL0KBe/EAqIAxmb8fzHFxHZtuuRLYQUubrPcjmn3QhUiUEx
 y03A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=HN1436mT
Subject: [Buildroot] [PATCH v4 21/29] package/qt6/qt6base: add support for
 gui module
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
 package/qt6/qt6base/Config.in  | 6 ++++++
 package/qt6/qt6base/qt6base.mk | 8 ++++++++
 2 files changed, 14 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index 5ae11afdb1..710e027602 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -40,6 +40,12 @@ config BR2_PACKAGE_QT6BASE_DBUS
 	help
 	  This option enables the D-Bus module.
 
+config BR2_PACKAGE_QT6BASE_GUI
+	bool "gui module"
+	select BR2_PACKAGE_FREETYPE
+	help
+	  This option enables the Qt6Gui library.
+
 config BR2_PACKAGE_QT6BASE_ICU
 	bool "Enable ICU support"
 	depends on !BR2_BINFMT_FLAT # icu
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index e7c403b75a..2e63d0b4f3 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -135,6 +135,14 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_sql=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_QT6BASE_GUI),y)
+QT6BASE_CONF_OPTS += -DFEATURE_gui=ON -DFEATURE_freetype=ON -DINPUT_opengl=no -DFEATURE_vulkan=OFF
+QT6BASE_DEPENDENCIES += freetype
+
+else
+QT6BASE_CONF_OPTS += -DFEATURE_gui=OFF
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
