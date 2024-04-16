Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46751C4345F
	for <buildroot@archiver.kernel.org>; Tue, 16 Apr 2024 18:43:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F205F60AE6;
	Tue, 16 Apr 2024 18:43:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V_DLqJaJAJcV; Tue, 16 Apr 2024 18:43:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BC3960AD8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BC3960AD8;
	Tue, 16 Apr 2024 18:43:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0F6511BF969
 for <buildroot@lists.busybox.net>; Tue, 16 Apr 2024 18:42:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F107A81E4B
 for <buildroot@lists.busybox.net>; Tue, 16 Apr 2024 18:42:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2zkBa6mkrRxk for <buildroot@lists.busybox.net>;
 Tue, 16 Apr 2024 18:42:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.208.178;
 helo=mail-lj1-f178.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A73C881E43
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A73C881E43
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A73C881E43
 for <buildroot@buildroot.org>; Tue, 16 Apr 2024 18:42:28 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2da08b06e0dso51386171fa.2
 for <buildroot@buildroot.org>; Tue, 16 Apr 2024 11:42:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713292946; x=1713897746;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ymI7xriOrwimLm1LQdp/zHGJa9tdXjZ+KQRzorwCcNY=;
 b=k/Hj+TfRn0sO+34Ckrof9QLm/e08+wQwXkqBPc4evvDd9b4OEWWYOqp8YgniowQmLh
 jZb8tuzUVyS1WsNQoiqkYzLAU8AdRoE2TtndXVrizmFm7oFDhf8KOgf3AFe+HGOt2JSu
 hzxut8AVdJJdbD+DVLN/cfQkKrBwvlJqLIB5DGh6xYyp2p2Qxi4ZJf+HuGH1Cri0AbDl
 v1qv3eM3XUw/g62A6ryHwth08ZzXbkjEr03gF4Oi2O1sobF+CpJ7Yw2RB32/zAWfpsdc
 1WlcPLLC+aY8ynMZrMq4+OuK0TyykJuH2X3AXAY0JW4b5cpQ+uy9XK+ywsA+KfDbzS5s
 qxFA==
X-Gm-Message-State: AOJu0YyOeBUl9PqiWOUmhfOrmEe5dF8WaluexLbLZ+wu2fF6I1S8H8Hx
 9UOy94/2vBBI56F8jcg70Iepaua3VmXleJXeXTb+BoYNF17QkLNPrdLyTP6P
X-Google-Smtp-Source: AGHT+IG+qqx7vkU7gYTzClMZTAzwRg6frLRD0skHRyZh+lr52SHWPPWZZc3ZkyuTpl2qLtVBUTbJzQ==
X-Received: by 2002:a05:6512:48cf:b0:516:d47d:34b9 with SMTP id
 er15-20020a05651248cf00b00516d47d34b9mr8073705lfb.22.1713292945587; 
 Tue, 16 Apr 2024 11:42:25 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:eb68:2f00:ddfc:df5d:2cba:1046])
 by smtp.gmail.com with ESMTPSA id
 ht8-20020a170907608800b00a525669000csm4328455ejc.154.2024.04.16.11.42.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 11:42:25 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Tue, 16 Apr 2024 20:42:08 +0200
Message-Id: <20240416184209.2621561-3-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240416184209.2621561-1-thomas@devoogdt.com>
References: <CACXRmJhRXXUUGFz=P9gOhVkqtAMePE4xgDg8rMNafuPMDWU3nQ@mail.gmail.com>
 <20240416184209.2621561-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v3 3/4] Revert "package/x11r7/xlib_libxshmfence:
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
Cc: Adrian Perez de Castro <aperez@igalia.com>, Bernd Kuhls <bernd@kuhls.net>,
 Thomas Devoogdt <thomas@devoogdt.com>, Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This reverts (partial) commit e39ad96136a8c340b3aea6b036024e28f14584f3,
and 26642e4cc09666110d5105e7867579a0e48cfa09.

Fixed by 0001-src-xshmfence_futex.h-fix-build-on-32-bit-architectu.patch.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
v2: n/a
v3: n/a
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
