Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD403C19F21
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 12:25:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 36BBC40AFE;
	Thu, 28 Jul 2022 12:25:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36BBC40AFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ljJrPgn9r8ij; Thu, 28 Jul 2022 12:25:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3DECB4048B;
	Thu, 28 Jul 2022 12:25:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DECB4048B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4ADA31BF3F2
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 12:25:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 246BF60AD7
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 12:25:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 246BF60AD7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7ALMDnX3tHnT for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 12:25:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E3C8607A1
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4E3C8607A1
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 12:25:04 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 8-20020a05600c024800b003a2fe343db1so969801wmj.1
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 05:25:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B0bVYla0TWLoXW+18e9hnIo1GEX1hLHp4/XPHl8icVY=;
 b=1etsPjj/nUU+mvNdG1wl7Vepj3hJJv0EzeEGm1z9q652BKSQbo5dXcWMn+DSLgO8Wv
 xaLz0TG96UFFNWx/40NbQPhMEgHIEqrS6GFlnjPnSi+qVSxpBJCCj6shI5YWexhR/0dk
 Z+SE6oGUr9OmrZLcX8oOtT+b+wffyZLPpnVct5my4TPXXjjZCnpWINAmaLmNJBVJ/j3L
 KKoQawqNkuB3bBizjFQOTgPEXhTfyB0h4T2Dh+FHY+/3zpAxVoq2M2XaeJvdWKeG4+oU
 lbRphvhDnPYkvdwBr05I0+0TB5PL7LHb/asWZhE1jQ464nyDB5E2uKkjqpZNvkJnrg7Z
 GPQQ==
X-Gm-Message-State: AJIora+EtHreqvMbyyNljVfdRzDL/40529YddMpSgUQHGefLU8kZDue3
 566KjkRdj7KxzxbTlaGjCPnvez6qNX4=
X-Google-Smtp-Source: AGRyM1uo2qkAtgnacI6JgmVGcpQtIJjmvoUqngrc2YV8/fan44eaUtUbaw3bKdU28qxlDImTLFFHyw==
X-Received: by 2002:a05:600c:1e03:b0:3a3:6cd6:1d38 with SMTP id
 ay3-20020a05600c1e0300b003a36cd61d38mr6452535wmb.25.1659011102069; 
 Thu, 28 Jul 2022 05:25:02 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 m12-20020a056000008c00b0021eaf4138aesm962781wrx.108.2022.07.28.05.25.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 05:25:01 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 28 Jul 2022 14:24:49 +0200
Message-Id: <20220728122449.2615761-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B0bVYla0TWLoXW+18e9hnIo1GEX1hLHp4/XPHl8icVY=;
 b=nBZmF589stE7Daiydv1AHHHdLNLmVoBkRT5OSSbW20qnQtrFvR/LIVsUjGFSplVbNa
 xzbHCteh7UG7GdCqA6vMVGTbMYlK8Fxa6PFz2jqPFmkIsTpwdQxcOSLUSyHErOf6ZWLV
 PWgUTaD5+n5GkjapmsvwsZypGHQt//WLycTbZoXNg2+mf8T8z0Z9JJreLoIR2/JCjUs6
 vrFIwYN3A6ybWq02UpXQNdgjnbGdyvJlA2t7XlYFeuB6iJMO2WAoAvGmrZhJs9lN6SXv
 dBr9nvdCQWpvy9RfxV0mB9FTxByuUv8RCS0TvnAoNNtLPOjQq7OrJ9UXYrQLPQqtNYJj
 MrSQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=nBZmF589
Subject: [Buildroot] [PATCH 1/1] package/mediastreamer: simplify alsa-lib
 feature selection
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Instead of having the user need to figure out that 2 alsa-lib features
are needed for mediastreamer ALSA support, have the top-level pulseaudio
option select the relevant alsa-lib features, when alsa-lib is enabled
as already done for pulseaudio in commit
97cd3680a4cc4bc0c71bccccb1459eda4b880159

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mediastreamer/Config.in        | 2 ++
 package/mediastreamer/mediastreamer.mk | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/mediastreamer/Config.in b/package/mediastreamer/Config.in
index 471d8ad91a..e776b60df3 100644
--- a/package/mediastreamer/Config.in
+++ b/package/mediastreamer/Config.in
@@ -5,6 +5,8 @@ config BR2_PACKAGE_MEDIASTREAMER
 	depends on BR2_TOOLCHAIN_HAS_THREADS # ortp
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # ortp
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14
+	select BR2_PACKAGE_ALSA_LIB_MIXER if BR2_PACKAGE_ALSA_LIB
+	select BR2_PACKAGE_ALSA_LIB_PCM if BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_MBEDTLS
 	select BR2_PACKAGE_ORTP
 	help
diff --git a/package/mediastreamer/mediastreamer.mk b/package/mediastreamer/mediastreamer.mk
index 5d66a09880..febbb7b343 100644
--- a/package/mediastreamer/mediastreamer.mk
+++ b/package/mediastreamer/mediastreamer.mk
@@ -22,7 +22,7 @@ MEDIASTREAMER_CONF_OPTS = \
 	-DENABLE_UNIT_TESTS=OFF \
 	-DENABLE_ZRTP=OFF
 
-ifeq ($(BR2_PACKAGE_ALSA_LIB_MIXER)$(BR2_PACKAGE_ALSA_LIB_PCM),yy)
+ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
 MEDIASTREAMER_CONF_OPTS += \
 	-DENABLE_ALSA=ON \
 	-DENABLE_SOUND=ON
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
