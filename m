Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A12ECFC5E2
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 16:14:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57D3480ACD;
	Thu, 10 Oct 2024 16:14:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NHs9SwQ6-R9V; Thu, 10 Oct 2024 16:14:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D08D81EA1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D08D81EA1;
	Thu, 10 Oct 2024 16:14:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1256A1BF4D6
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 16:14:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 01D9560ACD
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 16:14:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qe7AKVBlErAP for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 16:14:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D059160A5C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D059160A5C
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D059160A5C
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 16:14:22 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5c8784e3bc8so1449605a12.1
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 09:14:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728576861; x=1729181661;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WUaym54IcjC0slLJj7vKP2n0+6iO4uePffrapvniNzU=;
 b=TkrTu+n12czOH/djwl5IDAUx3dyvj3Xe0MXwP2xmWEJrFx9gdRak/iDFgOZV7oYmY4
 2wDR6nXkGbVB+oATuC6Xmh6CZXOgGyaKcn/qHaXetLzPYJX9B5qbDoR5TUMxhHWZ0Tgq
 RBLdYFnvfv/7/jOjCfeVYKORuqtPYwd3hfYwzQbPN7I4jk5xW9XrqO09sWabTIRcl5bD
 CuWpmqty/Njbac+58yn6q3+wirdlYMTqNn+hNMPgjHLcMokfBYlQEEALGqG1R4At9Tvr
 HKz+zt/xLKQvkvmwOhyPJLEfp2fSQR9LgZhEbVy2JUqR9Kgn3/E7Vv/OkwepuossPz1i
 xmZA==
X-Gm-Message-State: AOJu0YyiiebxzmBYVuqw4WYv+Fh/a5tVP61B8IBG4PVlSWS9+oq8kD1u
 GCs4yddy5ATYFgG1asLEI27GnuQdAYNH3ey1ADjY+tpMzKou9E4O2kni2sygbq2nL+/nFAWNlol
 OFVU=
X-Google-Smtp-Source: AGHT+IHT2+uXELbIAzOld7GGYpK8OSMakB0fjpORuDYSBWC29JPGR0Kewb5lZPOIu6JuaCRlTc/AAg==
X-Received: by 2002:a05:6402:34c2:b0:5c5:cd86:4967 with SMTP id
 4fb4d7f45d1cf-5c931f41662mr3168946a12.0.1728576860693; 
 Thu, 10 Oct 2024 09:14:20 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:a293:3a9f:6dc0:1d29])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c9372608f4sm946018a12.70.2024.10.10.09.14.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2024 09:14:20 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 10 Oct 2024 18:14:18 +0200
Message-ID: <20241010161418.3597104-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1728576861; x=1729181661;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WUaym54IcjC0slLJj7vKP2n0+6iO4uePffrapvniNzU=;
 b=GSWm7c6iXwqGN6l1XkkIapH9WWluoTTzxEsfWKZpd8ugIY4DOgQcH0CEL0g0qnUwI/
 oDK0ciR8YeRVIfMiNZY9QM/ugQMFirnqu2GGY01Ne4WDXVuj1HBsYxbNqPxA556lXB6Z
 zZakHXCKT02XcIN3GrpA7fyYPLQRjitMEmW8Q=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=GSWm7c6i
Subject: [Buildroot] [PATCH 1/1] boot/uboot: bump to version 2024.10
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 boot/uboot/Config.in  | 6 +++---
 boot/uboot/uboot.hash | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index dd8069361488..bfe61cd167d6 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -41,7 +41,7 @@ choice
 	  Select the specific U-Boot version you want to use
 
 config BR2_TARGET_UBOOT_LATEST_VERSION
-	bool "2024.07"
+	bool "2024.10"
 
 config BR2_TARGET_UBOOT_CUSTOM_VERSION
 	bool "Custom version"
@@ -85,7 +85,7 @@ endif
 
 config BR2_TARGET_UBOOT_VERSION
 	string
-	default "2024.07"	if BR2_TARGET_UBOOT_LATEST_VERSION
+	default "2024.10"	if BR2_TARGET_UBOOT_LATEST_VERSION
 	default BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE \
 		if BR2_TARGET_UBOOT_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_TARBALL
@@ -315,7 +315,7 @@ config BR2_TARGET_UBOOT_USE_BINMAN
 	help
 	  Use binman tool for generation and signing of boot images.
 
-	  https://docs.u-boot.org/en/v2024.07/develop/package/binman.html
+	  https://docs.u-boot.org/en/v2024.10/develop/package/binman.html
 
 menu "U-Boot binary format"
 
diff --git a/boot/uboot/uboot.hash b/boot/uboot/uboot.hash
index 0811ed58c46c..af025a583e44 100644
--- a/boot/uboot/uboot.hash
+++ b/boot/uboot/uboot.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  f591da9ab90ef3d6b3d173766d0ddff90c4ed7330680897486117df390d83c8f  u-boot-2024.07.tar.bz2
+sha256  b28daf4ac17e43156363078bf510297584137f6df50fced9b12df34f61a92fb0  u-boot-2024.10.tar.bz2
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Licenses/gpl-2.0.txt
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
