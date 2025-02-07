Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E950C02196
	for <buildroot@archiver.kernel.org>; Fri,  7 Feb 2025 20:36:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33B9842C85;
	Fri,  7 Feb 2025 20:36:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tbHsA282aKYt; Fri,  7 Feb 2025 20:36:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA2ED42CAE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA2ED42CAE;
	Fri,  7 Feb 2025 20:36:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5AE59CF
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 20:36:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 497494037E
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 20:36:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c7NFb-AXaZ2P for <buildroot@buildroot.org>;
 Fri,  7 Feb 2025 20:36:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 14FDE4028E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14FDE4028E
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 14FDE4028E
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 20:36:52 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4361b6f9faeso15110505e9.1
 for <buildroot@buildroot.org>; Fri, 07 Feb 2025 12:36:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738960611; x=1739565411;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2hWpDeAVjEJ4ybBQ5AGBDP3bYCvBW9O5R9pY64j5f4s=;
 b=cpb3OJ5PeWpvB3Cp6A13janH6IDoeo5fJMj0d10wf5mshWO4OkJ82uaPFvkeoEZwE+
 W7UxRlAFDKmf76keZXuevhnRELD4B/utFoxny4IwXEDxKcAvkOcc7D9T6WRgQilllOTq
 VlLpFgRrrwj066dpiFtN8fSN6Dp/0iipF5iZWZUWUt+DgjtPoR9XezculO24lEN9E0EB
 BhwbZoUyGjw7vf8m6H8s6XJt8DTCWOdJ5TbPLnUzZWwtwAMuNADrervwKyskMw6QrKlU
 Hi/+Ud8Ds3q9aOEy2hDsJOyUXb65myG1b3Ppqa5dBFIvaAjwpBYgC+OyhX5bWZNkS4DB
 ylhQ==
X-Gm-Message-State: AOJu0YwjUpcPGWl/St4wko9ejXu+3S0yj5tw77+F5QAPp2F9TXpt8iLL
 kfQJKDDAv2FHJgup1QcvC0Xuyn3ja+etrDMABVT8AVquW6mA/It/1EM0/Q==
X-Gm-Gg: ASbGncvO/bD+bUgMgVwtDlglAkuV4PMUcmVmuKF02QByp07KfgnawbBvjNmZ/NssV2t
 oAnvoBj3xYH+0dmlQEL3m0l8aJiWiBIlPTRWX8/GMjWmDm7MiWSBlLzfbZ/PT0wxJ2yT50Gx0xa
 GGft3v7at3wkgtBdE/p9FAPWD7TUjYFtEJOvnBimnaahyVSYESY3Zjym34O+AByueGiuABl4Wgd
 3hERt8bpNzTy4v8HKtRssumVuJlgOOX+8JerAz+GQYuPomewCHHiFBzo8mxIXZNfVsZoVYJn7i+
 hInIn0H4PuykfS56uh7ndkn2Zg==
X-Google-Smtp-Source: AGHT+IGAHGzfahrBkD/xm2NvD+krY7Ar6x3KsMUL+sw42LC7U7EO05HYyKJz/WDRbJ3KRlId668lvA==
X-Received: by 2002:a05:600c:4f8f:b0:434:fe3c:c662 with SMTP id
 5b1f17b1804b1-439255b817cmr29402595e9.12.1738960610894; 
 Fri, 07 Feb 2025 12:36:50 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4391dcb0e92sm64412055e9.24.2025.02.07.12.36.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 12:36:50 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  7 Feb 2025 21:36:49 +0100
Message-ID: <20250207203649.83870-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738960611; x=1739565411; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=2hWpDeAVjEJ4ybBQ5AGBDP3bYCvBW9O5R9pY64j5f4s=;
 b=IDfPzbk2sIyIuQUthPO/111QKBUhA2D0cTNhw/EN2k1EoeHCQN9IZKFs1lOHj7JUPp
 ojQbKiOKXHrpVANruUAHbRTBApp/VQIK3wBQ+sDWmutZ+vtZZBfqM4WHHSUEyNMxxv6T
 DxlYKjKvV19I/sO+TTzuoctpE1TUtdL5ZNeNQFio54gqh6iPiX9dQdbGQSjiAGvlTwz6
 Q+ZoOGArYAd0gG5uaAJI1q4VpCz0cn7XL1VUFeN7cTu1BmnoZlAQcIB7V+7UN6mLO6Je
 0cCI9J7Zf+AAooUb0HvticHxCbIXy1Sp0qzsj0CHNXB3j6SaUkDE/ixAD2rId5xkUAIt
 md8w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=IDfPzbk2
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
index 1977263db8..3c8963e53b 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -27,7 +27,6 @@ config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_GBM
 	depends on BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
 	depends on BR2_PACKAGE_HAS_UDEV # libinput
 	select BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
-	select BR2_PACKAGE_LIBDISPLAY_INFO
 
 comment "kodi needs udev support for gbm"
 	depends on !BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
@@ -84,6 +83,7 @@ menuconfig BR2_PACKAGE_KODI
 	select BR2_PACKAGE_LIBCDIO
 	select BR2_PACKAGE_LIBCROSSGUID
 	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_LIBDISPLAY_INFO if BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_GBM
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_LIBFRIBIDI
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
