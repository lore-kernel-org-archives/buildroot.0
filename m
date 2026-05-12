Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB6DFCD4F24
	for <buildroot@archiver.kernel.org>; Tue, 12 May 2026 19:37:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E8358258A;
	Tue, 12 May 2026 19:37:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9_YWIzmEc966; Tue, 12 May 2026 19:37:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F26E825B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778614628;
	bh=8shYrQ70TZOlZ5vF133gn+43NqfZeqlH1ytTe5Ki/Kk=;
	h=From:Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WzPusTZCk4Hy95L1jqVuQlP907F8cYhNrRE9Rgw3fqImIbe3MtE2zJ+rwkqUdC4W7
	 +0rjWSwXP/GWv3FQY56DTH2rIvnnkcLPShlPQwPHZN/y1xa+ksXy44cSH2SrK/Un0n
	 Mxso3LILOUMXCWPezHXOJoSDz5D/MkWoenZPcz7Wsivnt71Lse0KFRs9kuOqFewrY5
	 yW0Mkj7rkcltXG7ejFlEG5EblmPFxtGElvJkIYhCMWHEBOM6yDSPb+pmmhSUe7ZhH2
	 Jk7zEakjCUUf2u/pJGkEmdEAPITp/On8MrSaxMDf0zPFL63IPpwVMefeaf8ZW2zrZP
	 fi9sxo293wTbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F26E825B1;
	Tue, 12 May 2026 19:37:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B7B6F15F
 for <buildroot@buildroot.org>; Tue, 12 May 2026 19:37:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D9DC60E1E
 for <buildroot@buildroot.org>; Tue, 12 May 2026 19:37:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nGKpixidAUvz for <buildroot@buildroot.org>;
 Tue, 12 May 2026 19:37:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E937860E1C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E937860E1C
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E937860E1C
 for <buildroot@buildroot.org>; Tue, 12 May 2026 19:37:03 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-837dfccd950so2907407b3a.0
 for <buildroot@buildroot.org>; Tue, 12 May 2026 12:37:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778614623; x=1779219423;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=epW3ZROakF8kYfNYFDa6UViUp/0bq14bELEWmJ7FF+4=;
 b=beKnELv1EL6ztaYI18NaN7NMclh1qWwM6okHX8k2TyOjKC6VcERGpIHgwvKLsmllnC
 HO6EDt2xKQYLWKdigGFB/B6jPe3Clyw75TnZfltgnMtCXm08jcxJHe270b8KG9+ct8PA
 BEkEmrBtJoFvsES0Yad/n7KUU7Hz4fF/EIsiy58DSWAc+bggYyKALiKFMXZoNrDkBlI5
 84oA9gdH5pr4Jm1V0R/TcK3CmbQjMIgFAGab0zfow7PuQM+Ur3c/ejl+QaLsRHPJUfs6
 yRAkRlcBbwh3hnxEcCy768Ct6SkZLjZTHXSXSreQR5ubco1fYHAbCENrPnkmJeXPJgHG
 touQ==
X-Gm-Message-State: AOJu0YzEy4kg3M3f/xjsKfv1l3qbD8KK/omqoPc9pTZqKmuFzGpbCBo7
 tg3tM1spYzRiqbjsj1+ybnOHncvgW1GMI6aCktXBD7GBYBWDYoBYzI3x
X-Gm-Gg: Acq92OHo9EBPkM9Hb7FNPcYjSpeGm+wvqFDVpPO1eDFR3vOKatRkcqd9k7eIpjIeAXg
 v0StcgmU9RG4t5/qNY9Wjw2J90SGVfIlXQ1GeeITf9WoSYhXvkgE6ljYFsq+8JHgxlEJeka8Fei
 wS4hUWju5xapXoewAlsB8gHzXKT8btl1rBWe9Pjl+NBHNlAIr58lKA8ZSDDS4Malp04bnQoe5SU
 GAhWZWG8sKKDgUATFo7E1AFZ70AA0CAqTURLDE4uGcmdS9TP642/0YHUb4LLdscuyTdI7Rj3Fhh
 AzeLrzoI5hCMTe65hU64WC64Fs5JP03OyvSDpB7s5aWeBXZ7mvzfaTAO2t3NImE+lMXtaicXzFe
 j8Hm6TFIbPrqxq9DWx+FJ/+N3dNKB8pMjpkB72FrsJiieV/995SL4RHNQIuctTFSJ4lNkUSuZi9
 xGrjquA8cJ2reumcL7bP3jtETfkq0R29cwxyY=
X-Received: by 2002:a05:6a00:3027:b0:838:c01a:7a4c with SMTP id
 d2e1a72fcca58-83f042b19damr44091b3a.33.1778614623189; 
 Tue, 12 May 2026 12:37:03 -0700 (PDT)
Received: from wash-3.local ([50.120.90.9]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-839679c8634sm28932799b3a.39.2026.05.12.12.37.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2026 12:37:02 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Tue, 12 May 2026 12:36:33 -0700
MIME-Version: 1.0
Message-Id: <20260512-virglrenderer-v5-4-1806e588eb59@gmail.com>
References: <20260512-virglrenderer-v5-0-1806e588eb59@gmail.com>
In-Reply-To: <20260512-virglrenderer-v5-0-1806e588eb59@gmail.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Romain Naour <romain.naour@gmail.com>, 
 Joseph Kogut <joseph.kogut@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778614619; l=1764;
 i=joseph.kogut@gmail.com; s=20251022; h=from:subject:message-id;
 bh=uuqcAnP8eiBBPnUd5Pz4uuWVvjp2A1AbrdgYqKpAVkw=;
 b=KHMKvIrK19nSGHkNwJh2fb5Y18HNSZsFtHGVBN7zp/2/+34caUX7wcgJJ7NJy+gcqmvDUS+3C
 LLenyJJ5JAEAycvHLed0vkbaRuuhIuE2VMIi8oEyFoPYCBJ9SNkYFjs
X-Developer-Key: i=joseph.kogut@gmail.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778614623; x=1779219423; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=epW3ZROakF8kYfNYFDa6UViUp/0bq14bELEWmJ7FF+4=;
 b=YdRoePUsVDVblIESMnNrMohu7VptyTx8LzbxtyFVS+VaciSGu0KsLQ+9rLefaJaX1J
 VZfxbeIG8OkGMpUqonITTmD41jEqewvJU9h7qFGJVCbPpaMRivk/iAC54uHlYdeUhTNJ
 DbMy4GUVgbDFb+vgmbHZw+xEkqonQiI2X1bDq6r9igcqE0IHPBLWPY1lAbBC9+nAYjoK
 P15MN1cVttEvn0F3Mg6PbrPN+QDy3R+eKpPb0KwJe66+kZr4d14A+XTkqiGvkJnXzKSd
 Fz7j9NKB6mNaj3hLBjdGXm9KeV6HEtIIChrAU1buwG+C9IAbXq2SEyGMkGeJ447KzUrJ
 85QQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=YdRoePUs
Subject: [Buildroot] [PATCH RESEND v5 4/5] package/qemu: add OpenGL config
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 package/qemu/Config.in | 14 ++++++++++++++
 package/qemu/qemu.mk   |  8 +++++++-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index e16eafe446..e4e8eb3b63 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -116,6 +116,20 @@ config BR2_PACKAGE_QEMU_SDL
 	  Say 'y' to enable the SDL frontend, that is, a graphical
 	  window presenting the VM's display.
 
+config BR2_PACKAGE_QEMU_OPENGL
+	bool "Enable OpenGL"
+	depends on BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL # libepoxy
+	select BR2_PACKAGE_LIBEPOXY
+	help
+	  Say 'y' to enable OpenGL accelerated display frontend support.
+	  This is necessary to efficiently display frames rendered in a
+	  guest on the host.
+
+	  Run qemu with `-display sdl,gl=on`
+
+comment "OpenGL support needs an OpenGL and/or OpenGL EGL backend"
+	depends on !(BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL)
+
 config BR2_PACKAGE_QEMU_FDT
 	bool "Enable FDT"
 	select BR2_PACKAGE_DTC
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 97f8e22091..9b780797fa 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -274,6 +274,13 @@ else
 QEMU_OPTS += --disable-usb-redir
 endif
 
+ifeq ($(BR2_PACKAGE_QEMU_OPENGL),y)
+QEMU_OPTS += --enable-opengl
+QEMU_DEPENDENCIES += libepoxy
+else
+QEMU_OPTS += --disable-opengl
+endif
+
 ifeq ($(BR2_STATIC_LIBS),y)
 QEMU_OPTS += --static
 endif
@@ -330,7 +337,6 @@ define QEMU_CONFIGURE_CMDS
 			--disable-membarrier \
 			--disable-mpath \
 			--disable-netmap \
-			--disable-opengl \
 			--disable-oss \
 			--disable-pa \
 			--disable-plugins \

-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
