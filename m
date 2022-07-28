Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8066AC04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 12:28:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0344B418F1;
	Thu, 28 Jul 2022 12:28:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0344B418F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WdjOt3TEZqNv; Thu, 28 Jul 2022 12:28:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7A0B4184A;
	Thu, 28 Jul 2022 12:28:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7A0B4184A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 63FBA1BF3F2
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 12:28:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D0854184A
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 12:28:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D0854184A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9iKoyK9CFq6p for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 12:28:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3CE041840
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D3CE041840
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 12:28:45 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id q18so1975819wrx.8
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 05:28:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O9NrdRfdEEc2/AWafTJFyG5XTYirqYuNA/xAaLispQ0=;
 b=oCuX11Wt+rfDG+TqNSMthOHeqtOgOLy3cH86JDMJFMcqT89oT9rC4V8FbYsutJmbcn
 G6g4jQKqJqcAT6SM6Y1dvSzqZmuzWcs2qqWPQivz2uSOIeQx+5iR1NFB3kTvzwjjzCMP
 6Ovh8aWXdUDJKIzoofexCvv6O3ajanHb2VeW/Zou8PofTNLVEJEujwbF/kVBUVcELKRi
 m9qF3uF1h7s+rYaBD/B8095IyVJCC9l92aXZPsbiWn/cmCuZhNQ7rGxM+Qx949MwMq89
 lONXj5tyS4+oLgOHt+IGeV/bDIDe5R19oJQuIFDz9stDD+6s/HB+EIMPivqQrMHcAtEy
 F5BA==
X-Gm-Message-State: AJIora9q1RE6PyXSAxI1Xb2iVW9P13BAM4yiQR7CzXlzh6L3QhzYTz8D
 eYY0qB6pZ9TdXgGUMXxfcQVuWB3NbJQ=
X-Google-Smtp-Source: AGRyM1syAjrrhivj4AeaYoCKfCeYcw94eHp0ahwWOpIC87KUAtarQcuz27Eo/mcinFahlTnveucXpA==
X-Received: by 2002:adf:f911:0:b0:21e:c0f6:fd26 with SMTP id
 b17-20020adff911000000b0021ec0f6fd26mr6057971wrr.361.1659011323691; 
 Thu, 28 Jul 2022 05:28:43 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 r14-20020a0560001b8e00b0021b9585276dsm767508wru.101.2022.07.28.05.28.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 05:28:43 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 28 Jul 2022 14:28:39 +0200
Message-Id: <20220728122839.2616590-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O9NrdRfdEEc2/AWafTJFyG5XTYirqYuNA/xAaLispQ0=;
 b=c6rDpdSdjLYpBysoI2VzQcXEoySPlY8nI5ttvTVngLap9IKPK/XFtPx4nxjwUAMYDT
 HZAsRlQ4AZ+Iw2Z2R4F+LyvpyAj390WO8i/I7IGUkCqIMOuhMd8PJ1X6tQeJ+xfLyac6
 Clqi9p6lsOCV1tci5rf8ohjK+wsU4PdNTO5A1MA/9XfkpNiY21PShJZBebZQFWJnOhmD
 yYc3Ag+G9/kJhMqyhRRp5vhRt74mXsys5BD1IFCJrm7l5z4YZI7fO3MDGNZUjyCWMkgi
 nJyMX0juONOU/bB7kITIz9cQIO7vtbsBFdRPfBivAPpXM7lgC2f/7SeBqguJOILFlxmh
 wbhQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=c6rDpdSd
Subject: [Buildroot] [PATCH 1/1] package/wine: simplify alsa-lib feature
 selection
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
Cc: =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Instead of having the user need to figure out that 2 alsa-lib features
are needed for wine ALSA support, have the top-level wine option select
the relevant alsa-lib features, when alsa-lib is enabled as already done
for pulseaudio in commit 97cd3680a4cc4bc0c71bccccb1459eda4b880159

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wine/Config.in | 2 ++
 package/wine/wine.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/wine/Config.in b/package/wine/Config.in
index 18fb0a64a2..db3b1570ef 100644
--- a/package/wine/Config.in
+++ b/package/wine/Config.in
@@ -15,6 +15,8 @@ config BR2_PACKAGE_WINE
 	depends on !BR2_STATIC_LIBS
 	# pthread_attr_setstack
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_PACKAGE_ALSA_LIB_SEQ if BR2_PACKAGE_ALSA_LIB
+	select BR2_PACKAGE_ALSA_LIB_RAWMIDI if BR2_PACKAGE_ALSA_LIB
 	help
 	  Wine is a compatibility layer capable of running Windows
 	  applications on Linux. Instead of simulating internal
diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index b2d7e1c8ac..b89a8a6c9f 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -45,7 +45,7 @@ ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
 WINE_CONF_OPTS += TARGETFLAGS="-b $(TOOLCHAIN_EXTERNAL_PREFIX)"
 endif
 
-ifeq ($(BR2_PACKAGE_ALSA_LIB)$(BR2_PACKAGE_ALSA_LIB_SEQ)$(BR2_PACKAGE_ALSA_LIB_RAWMIDI),yyy)
+ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
 WINE_CONF_OPTS += --with-alsa
 WINE_DEPENDENCIES += alsa-lib
 else
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
