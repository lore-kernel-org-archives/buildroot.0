Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1641EC25B75
	for <buildroot@archiver.kernel.org>; Sun, 19 May 2024 09:16:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5037C405AA;
	Sun, 19 May 2024 09:16:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EF7CyvLRMkFx; Sun, 19 May 2024 09:16:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2C6F40595
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2C6F40595;
	Sun, 19 May 2024 09:16:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 456491C3C02
 for <buildroot@lists.busybox.net>; Sun, 19 May 2024 09:16:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 32B3140119
 for <buildroot@lists.busybox.net>; Sun, 19 May 2024 09:16:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ibLFqfRjbh-L for <buildroot@lists.busybox.net>;
 Sun, 19 May 2024 09:16:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.208.174;
 helo=mail-lj1-f174.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 149294010F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 149294010F
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 149294010F
 for <buildroot@buildroot.org>; Sun, 19 May 2024 09:16:33 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2e271acb015so43660481fa.1
 for <buildroot@buildroot.org>; Sun, 19 May 2024 02:16:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716110191; x=1716714991;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O3HOvCI++OsNBRzw+I08lsXYUFOGPFqy28NJ+WL2who=;
 b=TIx7BXW+bAwRC9IuflTumn92HjUmW55zUhMSCrHGFKOcU5kLHJINvw+eOnz1VVQ4OI
 9vrkUsAQEc9rSitey5v6pF/h1mlYIsj7P1UIkwFRhoym42GpmCGoQr/0iAkTGadSsd3u
 LmVbsx6GlmQnP30QQXNfxyrOc1RGyaXK8DdRqz0Sb+TEA/RJV8qR6Z/KACiizvSDT1mc
 RlfrNHCCWurRF41qdgDXykE+A/OfqwgGhVL4dX7M7XLrzWzIGxTrAW6Q9P7uFQTZhPZR
 3atVy6nZ4G5XBaWS3A7YJdH471azZlFN8LwWLorOXmpIN5eRIylCywO750ksQ5SVHsTj
 fwow==
X-Gm-Message-State: AOJu0Yz7kEv/FdMMy4lfvBH5jmK5Z78bwqdUbno0SSF7R/z5fvB7HERq
 JPirgH0qbprNO/fuH3We/1qFkO/gDaHSkWBPpTNL9Cc/+OcODa/HM3//bQ==
X-Google-Smtp-Source: AGHT+IEqQwXWWtpgKhxLEkC6BT1jLC+9S02ZT/oEcJB7N7CtqrXfm0CopD9PBQx0wcZvfQXGp1UkQw==
X-Received: by 2002:a2e:4e11:0:b0:2e5:751d:6a8 with SMTP id
 38308e7fff4ca-2e5751d09d3mr126195401fa.42.1716110191369; 
 Sun, 19 May 2024 02:16:31 -0700 (PDT)
Received: from thomas-Precision-7670.barco.com
 ([2a02:a03f:eb68:2f00:511e:920d:27e2:2c76])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41fe518a8fasm351628415e9.33.2024.05.19.02.16.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 May 2024 02:16:31 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Sun, 19 May 2024 11:16:27 +0200
Message-Id: <20240519091627.2195972-2-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240519091627.2195972-1-thomas@devoogdt.com>
References: <20240519091627.2195972-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v4 2/2] Revert "package/x11r7/xlib_libxshmfence:
 disable on riscv32"
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>,
 Romain Naour <romain.naour@gmail.com>, Bernd Kuhls <bernd@kuhls.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This reverts (partial) commit e39ad96136a8c340b3aea6b036024e28f14584f3,
and 26642e4cc09666110d5105e7867579a0e48cfa09.

Fixed by 0001-src-xshmfence_futex.h-fix-build-on-32-bit-architectu.patch.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
v4: move xlib_libxshmfence to separate patch series
---
 package/mesa3d/Config.in                    | 6 +++---
 package/x11r7/xlib_libxshmfence/Config.in   | 3 ---
 package/x11r7/xserver_xorg-server/Config.in | 3 +--
 3 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 459051b2db..d8ea22ac91 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -99,7 +99,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_CROCUS
 
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV
 	bool "Gallium Etnaviv driver"
-	depends on (BR2_TOOLCHAIN_HAS_SYNC_4 && !BR2_RISCV_32) || !BR2_PACKAGE_XORG7 # libxshmfence
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_LIBDRM_ETNAVIV
 	help
@@ -135,7 +135,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS
 
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LIMA
 	bool "Gallium lima driver"
-	depends on (BR2_TOOLCHAIN_HAS_SYNC_4 && !BR2_RISCV_32) || !BR2_PACKAGE_XORG7 # libxshmfence
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	help
 	  Mesa driver for ARM Mali Utgard GPUs.
@@ -151,7 +151,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU
 
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST
 	bool "Gallium panfrost driver"
-	depends on (BR2_TOOLCHAIN_HAS_SYNC_4 && !BR2_RISCV_32) || !BR2_PACKAGE_XORG7 # libxshmfence
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	help
 	  Mesa driver for ARM Mali Midgard and Bifrost GPUs.
diff --git a/package/x11r7/xlib_libxshmfence/Config.in b/package/x11r7/xlib_libxshmfence/Config.in
index 7823bda7c0..710476b357 100644
--- a/package/x11r7/xlib_libxshmfence/Config.in
+++ b/package/x11r7/xlib_libxshmfence/Config.in
@@ -1,8 +1,5 @@
 config BR2_PACKAGE_XLIB_LIBXSHMFENCE
 	bool "libxshmfence"
-	# Due to use of SYS_futex - can be enabled again when upstream
-	# adds SYS_futex64 as an alternative
-	depends on !BR2_RISCV_32
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	select BR2_PACKAGE_XORGPROTO
 	help
diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index b933bd0285..89410f22bb 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -49,8 +49,7 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_LIBPCIACCESS
-	select BR2_PACKAGE_XLIB_LIBXSHMFENCE if \
-		(BR2_TOOLCHAIN_HAS_SYNC_4 && !BR2_RISCV_32)
+	select BR2_PACKAGE_XLIB_LIBXSHMFENCE if BR2_TOOLCHAIN_HAS_SYNC_4
 	help
 	  This variant of the X.org server is the full-blown variant,
 	  as used by desktop GNU/Linux distributions. The drivers (for
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
