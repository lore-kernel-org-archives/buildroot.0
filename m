Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C84C02198
	for <buildroot@archiver.kernel.org>; Tue, 18 Feb 2025 09:43:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6C9E82EB5;
	Tue, 18 Feb 2025 09:43:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M0RbxUW6Fsvv; Tue, 18 Feb 2025 09:43:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BB13832C9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BB13832C9;
	Tue, 18 Feb 2025 09:43:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7BA20C8
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 09:43:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 549B141218
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 09:43:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ewIlG0up2Cyg for <buildroot@buildroot.org>;
 Tue, 18 Feb 2025 09:43:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com;
 envelope-from=eagle.alexander923@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1F2CC411C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F2CC411C2
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1F2CC411C2
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 09:43:06 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-5461b5281bcso2142346e87.3
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 01:43:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739871784; x=1740476584;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GUEspsSNyWLU7NaDaipu1iGQ0hyMIeO+3P9NiUROcZo=;
 b=dzpAXbsduHxfJbyXjz5Cj3X/BsmIJ4Q94meFNN297pe0jIcJqfxuJWYsm8u7z5s5jI
 1LAHAnMlARiX3z8zed8/qIOzg9iIeNvi9+VoIXOmNgc/o/vBbjt+ENx1U2o2yzEhvr7C
 zcpDHAJ8Xio2lzxsOPuMEAjWEoY84aMC9BYb8GuFHFFpLzSuBrDlmnwGqsDz3+8H0NbP
 fb9H5KlXG/FvaRg9MugU/IdE03+PPrdgNGVY0ILy3NZxn8Dqr74CCTWAL3DRmSb3MwfA
 18xmXgjj8DaOj+0C7Pnqb5g7Bh2oyFBDFp+r6qJPAq+qLsm2NbKjTi/QoZRDya+zuqqA
 QKkA==
X-Gm-Message-State: AOJu0YydGGxkXrfdE6oHMfQLJRWNkLFOv1l7NZ59/tdEmrLkB5Tf2ZNE
 RzUbalOnLfbMqwxxvmUAzzbOwn2nF5I31/PlB58h+y7gkTr8XXJojXXnew==
X-Gm-Gg: ASbGncve0YU9nvCs1H/FUupimhqE31eRd9fAHyDOajCwPV3JHASqIuHE6UK6gxLU0at
 HcPjH134ClmtjXuITQsaTWqivCZQsXHIVAzcQhzDMqMKLcjU/3Udrfki/IAiFlhJvWWTmuJxBLJ
 AP0GWPLmty4GnI1cAmiM5NrNvUOplvTyYnpxUu5Ni+CeMTYLCzM4MHKr4Soiu1RnTt8AtpHFVVA
 Ri6D9dQGulthdFwEWhsocukTFWXRd5WifFiZZAn/jLN9d1C8ko0OwFaglfU1X6QG3IDBg18LehK
 ZkzK5p6fut+JXrJoX/OH+kjUW3hZiPIjWpiZDw==
X-Google-Smtp-Source: AGHT+IEXVSbrTd6K/HtGREax798tOHWYVEMduDMpxDz/gYeCv3tVBzzO4jehfYjXmatbYuEW0ZIigw==
X-Received: by 2002:a05:6512:401b:b0:544:f93:6909 with SMTP id
 2adb3069b0e04-5452fe653b3mr3754773e87.30.1739871783811; 
 Tue, 18 Feb 2025 01:43:03 -0800 (PST)
Received: from localhost.localdomain ([188.243.23.53])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5452ed3ad8asm1320414e87.165.2025.02.18.01.43.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 01:43:03 -0800 (PST)
From: Alexander Shiyan <eagle.alexander923@gmail.com>
To: buildroot@buildroot.org
Cc: Alexander Shiyan <eagle.alexander923@gmail.com>
Date: Tue, 18 Feb 2025 12:42:51 +0300
Message-Id: <20250218094251.608607-1-eagle.alexander923@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739871784; x=1740476584; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GUEspsSNyWLU7NaDaipu1iGQ0hyMIeO+3P9NiUROcZo=;
 b=DhawLgcEK1jsYEUmEfDycFnv7DcQW3MUyWlhJocB4f+3vbnJQIPDiDki1TuswhAXFv
 /yI6S2e8wGhjJ1+ZmJMcn7pTwc1pgLQJ4/o2u5fnVCRAThZRNgXZZ8wxWE25TR5Ni+Wh
 9s5fUNjGk/e7ISQZeu5Lvj1KXF0c7r4A2A5Z1aDGG2sQek8hxJGaKpsUx/GKDYryViU5
 zTJhCQUoj16gWPraQQP6DMUT+0gRlfrBZweXUx+2btxkpI5YjCdAYYudkXHgV8RGch5t
 5B705OpZMnc8jrPHAcdWvWmmJQkpanwR6PF3fDcyoThhjy07zjrUAEipSZpaAGZqjH9p
 4TeQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=DhawLgcE
Subject: [Buildroot] [PATCH] package/kodi: Do not select
 BR2_PACKAGE_LIBDISPLAY_INFO unconditionally
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

BR2_PACKAGE_LIBDISPLAY_INFO is selected unconditionally when
the symbol BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_GBM is evaluated.
Let's use it only if BR2_PACKAGE_KODI opyion is selected by the user.

Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
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
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
