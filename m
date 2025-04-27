Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD996C369D1
	for <buildroot@archiver.kernel.org>; Sun, 27 Apr 2025 12:57:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50CC580D27;
	Sun, 27 Apr 2025 12:57:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oo5qyAqgj7DD; Sun, 27 Apr 2025 12:57:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D33C80CC1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D33C80CC1;
	Sun, 27 Apr 2025 12:57:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9585BC5
 for <buildroot@buildroot.org>; Sun, 27 Apr 2025 12:57:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7BF3D80CC1
 for <buildroot@buildroot.org>; Sun, 27 Apr 2025 12:57:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U7aV0qnu216G for <buildroot@buildroot.org>;
 Sun, 27 Apr 2025 12:57:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=francois.dugast.foss@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8E76380CB3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E76380CB3
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8E76380CB3
 for <buildroot@buildroot.org>; Sun, 27 Apr 2025 12:56:59 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-39ee5a5bb66so2346754f8f.3
 for <buildroot@buildroot.org>; Sun, 27 Apr 2025 05:56:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745758617; x=1746363417;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rH7OUDTOtKRyxFmux0zcQKBRVKRaJ5C5FdS+2kOJtqg=;
 b=r2ujpdmyHyvgbGs6dZ5OluZ5ZLtlpkR6SjihZ+EYaEfY8KIDNmxdlWYaKD0m0ZcMHC
 Pb1L74uPvp1odMBL3gzKSmUD1k/wL5uGILRtl35dTe95uZDvYxCfcmQYL6L+dDB3eL3P
 DBvZjsMXjtR3QUQtM7IccDhPuUEkeiCr+fySN1EjllBHZvH2Fsi4eO5AV0D030Twk4Yn
 kcIBDkjJq1DDDlv0ytHcIhKlJQVHd2SWSL440hogvHXN/Onfd4m1f5EMJf6e3XYfzPUQ
 vcSA+UE0KRdAQTVKlFHqw7wER/JfRcOjpPjVY1O8aaKnWuheVbpe1qb+PaFvmyZ41KWI
 Bu5A==
X-Gm-Message-State: AOJu0Yxs0Oml2ywietBO42n6GZ4DDfwuaveNevyxa589ckzagxX69XnM
 aesrCSR0wAQ/kQFi72lsw9ThgVyxQ+APD93+ZxCbaoxjZLIwMwK21oBpcQ==
X-Gm-Gg: ASbGncuNA6Lh/UcYqMV9YImOnv/MsFVKu4MZMAHDwqEf00Ylxel0dOhE6/EkNxvypbD
 sfZs+4LbTa7YF8WRa7WdT7c+hoe7hvt1RK+7d1seCeKDAKdZ5UiBeB3A2Ogg4vPI6jPcU0+Z9bn
 Kn5Gi1pZJlao5YwaIv4beFe2wqJU0p3MxjL5/0QAgyoJiBD1UGKZ0sYbBmgEOEhBGeViUrgffvU
 jadXVBT9Z7C5z5N+kb/BI9SYrZwQ9uy1SI/GLEtSvaInZkkWQKT/fIogI9pRSP9RTh4xOn3ERmT
 5MdLg6F/1220BKvvVeLKit8FZ7wANKevOQREhAcZLKoOYBcZ3fwhia94U2MxbckD/tStrlEK5jC
 BwmpZeHryfi5k+4lbxqfX0Y+0iDZsQYvvZTw=
X-Google-Smtp-Source: AGHT+IEHvR8+lYeVQtWZ8uBn+gXLoTAbxIXL5Zl0lddmg4zbBKoYmcnhj62ltUlTVDKBVbYIl2iQfQ==
X-Received: by 2002:adf:f311:0:b0:39c:1258:2dc8 with SMTP id
 ffacd0b85a97d-3a074f84db0mr5255556f8f.57.1745758617242; 
 Sun, 27 Apr 2025 05:56:57 -0700 (PDT)
Received: from comet.lan (lfbn-ren-1-1629-205.w86-253.abo.wanadoo.fr.
 [86.253.181.205]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a07a7c39a0sm5468011f8f.101.2025.04.27.05.56.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Apr 2025 05:56:56 -0700 (PDT)
From: Francois Dugast <francois.dugast.foss@gmail.com>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Romain Naour <romain.naour@gmail.com>,
 Francois Dugast <francois.dugast.foss@gmail.com>
Date: Sun, 27 Apr 2025 14:56:49 +0200
Message-Id: <20250427125649.1970194-1-francois.dugast.foss@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745758617; x=1746363417; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rH7OUDTOtKRyxFmux0zcQKBRVKRaJ5C5FdS+2kOJtqg=;
 b=M45iruLYHN+u2d8COVmUFH6Hu8jZZp25JWe/ISARLLoD7N4km/afC8r531n9em8BcI
 3qxyFJus8GkvA9PMbxl/+scHrCzpfFiq4oj1efyKoxeenlRq0oxhOVhJH2ndy1ntzara
 tVOSGRUuvMOuKVHRAamfL0KKeRnKQhK48i0/IAZipyr89q7+Vg6brRL+WTW8wlIba+Sx
 wdJVkMiGOaG5XOIGdiexAuG0bTzscJLub9G3vAOBkuum611VcjDVc/e2+7ebmR0GsdVu
 uYKv2w/Lc41s2McsuRrohO/JJyKXXSf7SO14Pa3UaDi9XtX0YpXqRCqREa/C3RQz1Gbf
 XztQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=M45iruLY
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: remove depends on
 architecture for Iris/Vulkan
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

This dependency systematically applied with integrated GPUs but no longer
with discrete GPUs, so remove it.

Signed-off-by: Francois Dugast <francois.dugast.foss@gmail.com>
---
 package/mesa3d/Config.in | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 0412998214..279466a1e5 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -128,7 +128,6 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_I915
 
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS
 	bool "Gallium iris driver"
-	depends on BR2_i386 || BR2_x86_64
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	help
 	  Mesa driver for iris-based Intel GPUs.
@@ -314,7 +313,6 @@ config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_BROADCOM
 
 config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL
 	bool "Vulkan Intel driver"
-	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # memfd.h
 	depends on BR2_TOOLCHAIN_USES_GLIBC # ifunc, static_assert
@@ -323,7 +321,6 @@ config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL
 	  Vulkan driver for Intel hardware from Ivy Bridge onward.
 
 comment "intel vulkan needs a glibc toolchain w/ headers >= 3.17"
-	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 || \
 		!BR2_TOOLCHAIN_USES_GLIBC
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
