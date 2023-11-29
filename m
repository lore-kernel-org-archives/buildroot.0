Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88457C4167B
	for <buildroot@archiver.kernel.org>; Wed, 29 Nov 2023 21:10:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D4AA615A6;
	Wed, 29 Nov 2023 21:10:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D4AA615A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zdCnrPvHEnxa; Wed, 29 Nov 2023 21:10:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D1EB615A1;
	Wed, 29 Nov 2023 21:10:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D1EB615A1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 214601BF377
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 21:10:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EDC25615A1
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 21:10:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDC25615A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7mK3umn5_i_b for <buildroot@lists.busybox.net>;
 Wed, 29 Nov 2023 21:10:17 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 06E146159C
 for <buildroot@buildroot.org>; Wed, 29 Nov 2023 21:10:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06E146159C
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40b54261534so1584245e9.3
 for <buildroot@buildroot.org>; Wed, 29 Nov 2023 13:10:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701292214; x=1701897014;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cHjMlPG0GU+jQRMaWWKW+juxSV593pAncwKnvYrb8Po=;
 b=Hzqj4fVLlaIGCrh6X0IaReQrYJy9kKib9AGXAC9+aNMZY1Qk491FIyXb/CRMQdDcOa
 oAr1T0/MelV3ZENdHPecUkefZuolgZ9sj5KVHg5cjK6hS781zyWvIkChyeXjgbSOYiDz
 dazRqQxQDp+YUK8CUDFviFc2lzDbII2VL7ckmEnYT1CGMjJQb+YB9KyzfUuuQlYAgwVw
 cETjqWeW+YusiQCtcWXfKaMIZDIp0m3+uO4L2ICLsvVe6YNWYyjuzIrvcm+5m2IbrE1M
 LEGp7JM68CVIJOa5JCHjlUfo3wawm01Oh9dES8+fW0sFz8zqzg1nvwqD5iE4PCKgZNHX
 9Klg==
X-Gm-Message-State: AOJu0YwDIdy1EAm8DqKL+QCnCnvGYfJhglWMRlnxT4yhlPUxBgIDlWTz
 aCggmvIVCuranh3IBLSS6+O1P5u4MwY=
X-Google-Smtp-Source: AGHT+IG6SOyqmexJvmeD4/wr2K1k/vTRKnqs+5JQanO82CRj/T1G6L4lWcYXbhYrK3zXaVXYFg7JTw==
X-Received: by 2002:a05:600c:1d05:b0:40b:3faa:c964 with SMTP id
 l5-20020a05600c1d0500b0040b3faac964mr10689354wms.27.1701292214389; 
 Wed, 29 Nov 2023 13:10:14 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 m16-20020a05600c4f5000b0040b349c91acsm3407242wmq.16.2023.11.29.13.10.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Nov 2023 13:10:13 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 29 Nov 2023 22:10:11 +0100
Message-ID: <20231129211011.1207351-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701292214; x=1701897014; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cHjMlPG0GU+jQRMaWWKW+juxSV593pAncwKnvYrb8Po=;
 b=XrxvsbFvXXtSS/eSlvtKkvhL1cDw5ufK4R/r9XVgmEjI3Sf3SiBbYDXcmKx3NUKNjo
 ovfIPvK9emMyHKAZ3/MayyBqT3SCDXdfpgAKbolumk4ur2A6zlWCQJ7UBmvLOIRHg5Qc
 IpN9b+0zcLZ1ttonhFuoKsXFvjmleZF63AGPnQLRMu6OhTTv6B98//H271Pe92NnZgU1
 tZGEEiIxB0ZtG5x69N8mqyfkq1WyPowm3ZFMcjhbXtzm0x7Trn3Jh3CKTgvhWCwT/hgB
 w5HSkNDNwm2orUr/CLxeq6Lzww866wURmSsiiZPemlksm4p2csjHQRp1Nzaz8eD9t+jo
 w7tw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XrxvsbFv
Subject: [Buildroot] [PATCH 1/1] package/zlib-ng: fix arm build
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

Set CMAKE_C_COMPILER_TARGET to BR2_ARCH to fix the following arm build
failure raised since bump to version 2.0.6 in commit
d2249821d3f30202ca2a35ad24918378d9a0a0e8:

-- Detecting C compile features - done
-- Arch not recognized, falling back to cmake arch: 'l'
-- Basearch 'l' not recognized, defaulting to 'x86'.
-- Basearch of 'l' has been detected as: 'x86'

[...]

/home/buildroot/autobuild/instance-0/output-1/build/zlib-ng-2.1.3/arch/x86/x86_features.c:17:12: fatal error: cpuid.h: No such file or directory
   17 | #  include <cpuid.h>
      |            ^~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/1551aa69be19239a8d8e081f033e4027d679ab8f
 - http://autobuild.buildroot.org/results/075d704c0f11710353bac43478e4501addcd747d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/zlib-ng/zlib-ng.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/zlib-ng/zlib-ng.mk b/package/zlib-ng/zlib-ng.mk
index fbb906503a..33e8754c9d 100644
--- a/package/zlib-ng/zlib-ng.mk
+++ b/package/zlib-ng/zlib-ng.mk
@@ -13,6 +13,7 @@ ZLIB_NG_PROVIDES = zlib
 
 # Build with zlib compatible API, gzFile support and optimizations on
 ZLIB_NG_CONF_OPTS += \
+	-DCMAKE_C_COMPILER_TARGET=$(BR2_ARCH) \
 	-DWITH_GZFILEOP=1 \
 	-DWITH_OPTIM=1 \
 	-DZLIB_COMPAT=1 \
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
