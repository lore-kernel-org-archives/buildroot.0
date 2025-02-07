Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E1E3C02196
	for <buildroot@archiver.kernel.org>; Fri,  7 Feb 2025 20:43:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D82D641861;
	Fri,  7 Feb 2025 20:43:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7j1sNA4lrzYv; Fri,  7 Feb 2025 20:43:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A77C841A0A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A77C841A0A;
	Fri,  7 Feb 2025 20:43:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DAB3C1B5
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 20:43:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B93C4403F0
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 20:43:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wzy1O9fHOSF5 for <buildroot@buildroot.org>;
 Fri,  7 Feb 2025 20:43:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BD4E44028E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD4E44028E
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BD4E44028E
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 20:43:01 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-38dcb7d6b69so507692f8f.3
 for <buildroot@buildroot.org>; Fri, 07 Feb 2025 12:43:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738960979; x=1739565779;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mJzWZqgr4TcHWR/NRo/36zvJirQwQG9e77liqrU+WlI=;
 b=jK0fVU/gprohHX/b8k4NK+cqvbXe0Ogd/ZSgTjI7Av/e8SYzGUGV0Z+Vk/ojNoUmdy
 B5/T05dYF4bhvp715TAbgO4jE8IRYSqv5CiU3VRKX4jtHff10NHlQkpBuex1Wh/cVIi2
 J+acI2wE8X/2XIpMWkgC95kpBIIy1RPywIPdjD2V6GaX5xDMv5kmx2c8XWNLVW3boFhi
 B0zxySEpe7/Do7poOe6NO/eMeHYqFL1BbGhkEjbRMHIolgTGYrZIj75e0Wb5KEiAw4QW
 b39hUU4fADdrmrHDmJFCJS9oQJCznaD388jQ6M6iqy949FyL+cZ42NoM9UhcihpcDxO/
 ScEw==
X-Gm-Message-State: AOJu0YzdoZHgfcFFkHCPRzRv5l/X08a+wz82Q4Nsk9A13i99N/cLeFCP
 ILAEKDBQVGVgkA8kWZXj+wT0QVSoSa5ePMx7HIe2SZuTt32J+OHcGsegXA==
X-Gm-Gg: ASbGncvokh653nSQahAA0sO6isl74fdmGfTGbt7/V4z4O9hqbP36nA/WK3KLs2Q5RKR
 F4m0992uruxE7+E4AbIjDGAhIVlUVgEdnFlbLflYRwUQpH4WFeGt7HfCdmdk0pry/mw6821im3/
 iGETrqXwDswaWtcpCCgoOexvcTW/fijRnfPfWuJWtO6T38S8EhA+Ca42VakAVmEZysJOtl3Ts7M
 BgGaXokmdpRGhgdXYHj0TUUcXZ4gXkmBWqtjNS/PdQib+G1kfk0YAl4+aG4CybSHneXomz+Cyok
 ta3tuCvpPw9refPxR/pHg2zqHA==
X-Google-Smtp-Source: AGHT+IGabfIsU4SoHYCcC7hWB644/p8cC+z+JwQ9dXdWqKUF5zQKtK9eQNZiyyxuP6l+SioBC4dePA==
X-Received: by 2002:a05:6000:2ac:b0:38b:dbf0:34f2 with SMTP id
 ffacd0b85a97d-38dc949415amr2821287f8f.52.1738960979468; 
 Fri, 07 Feb 2025 12:42:59 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dd34f2af5sm247793f8f.78.2025.02.07.12.42.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 12:42:59 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  7 Feb 2025 21:42:58 +0100
Message-ID: <20250207204258.87410-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738960979; x=1739565779; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=mJzWZqgr4TcHWR/NRo/36zvJirQwQG9e77liqrU+WlI=;
 b=TGPSyLDIilnK80RfxS6PunpWTj6nhOc+/+/dbD195pT33y+ypo6g5R6vEDycUz7+UU
 37ajUcO/CfSuZxhFnOMYBJ5CQ1M34urjsaCg+rU6TwuutUR5BxWgmvsX/wN3HxQKBTGb
 +wr/uvgomh6Vgip8OYq2rplrDRimvwjUvxkTb69L748oYFQrPFPdC5TRl+MR3nNReP8t
 QbTRDc+0SaXsBIBr/X/KIgxS9UeQVzcVKT20YKlThrkin8E24Nnb8g7nCa8myBfMsxIb
 JYedF6nU/uRPwF4WsUUpg59+ZpEUK5m92uFTHmJsqsUZq4McQRo2cWobqOPtzqQ/ssUH
 FjbA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TGPSyLDI
Subject: [Buildroot] [PATCH] package/kodi: don't uselessly select
 libdisplay-info
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

Commit c61934611111 (package/kodi: bump version to 21.0-Omega) added a
select onto libdisplay-info from a blind option that only represents
whether a specific subset of Kodi is available, not whether Kodi itself
is enabled.

This causes useless builds of libdisplay-info for a lot of builds where
Kodi is not enabled.

Move the select to the man Kodi symbol itself, guarded with the proper
condition, like a few existing dependencies for GBM.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 1977263db8..9661ab47bc 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -27,7 +27,6 @@ config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_GBM
 	depends on BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
 	depends on BR2_PACKAGE_HAS_UDEV # libinput
 	select BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
-	select BR2_PACKAGE_LIBDISPLAY_INFO
 
 comment "kodi needs udev support for gbm"
 	depends on !BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
@@ -108,6 +107,7 @@ menuconfig BR2_PACKAGE_KODI
 	select BR2_PACKAGE_TINYXML2
 	select BR2_PACKAGE_ZLIB
 	select BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY if BR2_TOOLCHAIN_USES_GLIBC # runtime UTF conversion support
+	select BR2_PACKAGE_LIBDISPLAY_INFO if BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_GBM
 	select BR2_PACKAGE_LIBINPUT if BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_GBM
 	select BR2_PACKAGE_LIBXKBCOMMON if BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_GBM
 	select BR2_PACKAGE_LIBXKBCOMMON if BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_WAYLAND
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
