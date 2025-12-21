Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88135E67482
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 21:26:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A90E940630;
	Sun, 21 Dec 2025 21:26:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gxiyFzIGAfiP; Sun, 21 Dec 2025 21:26:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 246D440612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766352395;
	bh=U6qHrB5RrqvEczvGg9ogjnZr2l5xgswSXkJ9+oKIu6Y=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=DaC90vlkYKZV62m+xIhbc4T/siaUyKqSwbuXt0MPyn8q6AhNXQzwgTAiOuDbBVz6g
	 s4JZEmxXGrSepGD3RNBtp8AAXlld+SQYRscHuGAA95D2vGODan4ReFMHTNT9MXgGXn
	 A73ZHH7RGR/+0QhEVH/wxs0401slhc5nPnRecLbmmEYKPeZ3xWf1vFvGrdzE9uYPMb
	 CHhTc/+WnN+BbmIy1ls7/qYZoChPYv95n2nf9wWEmpwfGlKPINO0P1T21uB6EIrO8h
	 RlWBvwXGaVfElwKkYQ/7Np7aXrFLl9iJnizUqgZVA3fFGi2KxcXgwiAKHYwGGqIA+g
	 mEUG7Eux4YO4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 246D440612;
	Sun, 21 Dec 2025 21:26:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 48F15BC
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 21:26:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 39ABB60746
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 21:26:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ENBniI4u8br8 for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 21:26:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 938C760738
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 938C760738
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 938C760738
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 21:26:29 +0000 (UTC)
Received: from 91-154-227-245.elisa-laajakaista.fi ([91.154.227.245]
 helo=kodama) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vXQwa-00FKtM-QG; Sun, 21 Dec 2025 22:26:24 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 55a81f1b;
 Sun, 21 Dec 2025 21:26:21 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Sun, 21 Dec 2025 23:26:19 +0200
Message-ID: <20251221212621.1146875-1-aperez@igalia.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=15VTUrq22iy9d1SqsAj+mH1EPJEvSp1GLqZ7+VdSSyY=; b=iFrZ4YLbCUTseBdpNhQXfo1RN7
 tbJMe1K49Lu7fksUC3Nk1Q0yM2npOWf1ad7DSujoER7UUawqeAv99m5SogWckl2Apps+BtiE2nNon
 zEaDoj+3D7OhU/5DZRJTZ66X6T1hT83/lDUSEpFEkWJpTmzS/MVKTF0ZxNuId9BmX3hEH2TRRQLHz
 CEW/fXzLCQuNaW8U6dIqyQghHjB4prQqhCMECU4QmtNn9FKxVo770cPIBIvDvOQelfT11E/tjGiRq
 wLZ14qiEkGG0ZwpgoCDlIQUJ9XfdAfpVQ62si9EFfzM9x5Yk02L00uS6C1X4TgytxEfyaBXbWdLN5
 F5qiATnQ==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=iFrZ4YLb
Subject: [Buildroot] [PATCH v2] package/wpebackend-fdo: bump to version
 1.16.1
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
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This maintenance release introduces support for newer versions of the
Mesa library. Release notes:

  https://wpewebkit.org/release/wpebackend-fdo-1.16.1.html

Also imports an upstream patch that is needed at least to successfully
build when using the Musl libc.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 ...-ws-egl-Add-missing-unistd.h-include.patch | 30 +++++++++++++++++++
 package/wpebackend-fdo/wpebackend-fdo.hash    |  8 ++---
 package/wpebackend-fdo/wpebackend-fdo.mk      |  2 +-
 3 files changed, 35 insertions(+), 5 deletions(-)
 create mode 100644 package/wpebackend-fdo/0001-ws-egl-Add-missing-unistd.h-include.patch

diff --git a/package/wpebackend-fdo/0001-ws-egl-Add-missing-unistd.h-include.patch b/package/wpebackend-fdo/0001-ws-egl-Add-missing-unistd.h-include.patch
new file mode 100644
index 0000000000..037682a608
--- /dev/null
+++ b/package/wpebackend-fdo/0001-ws-egl-Add-missing-unistd.h-include.patch
@@ -0,0 +1,30 @@
+From 5316ecb0193d8c8cbbbe0921ba711859b36f8ef3 Mon Sep 17 00:00:00 2001
+From: Adrian Perez de Castro <aperez@igalia.com>
+Date: Sat, 20 Dec 2025 15:05:05 +0200
+Subject: [PATCH] ws-egl: Add missing unistd.h include
+
+Fixes #204
+
+(cherry picked from commit 84492327673fa0dedfa4fa0ab9488bed1763a5a8)
+
+Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
+Upstream: https://github.com/Igalia/WPEBackend-fdo/commit/5316ecb0193d8c8cbbbe0921ba711859b36f8ef3
+---
+ src/ws-egl.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/ws-egl.cpp b/src/ws-egl.cpp
+index 76d6194..cc7a8f2 100644
+--- a/src/ws-egl.cpp
++++ b/src/ws-egl.cpp
+@@ -33,6 +33,7 @@
+ #include <vector>
+ #include <sys/mman.h>
+ #include <sys/stat.h>
++#include <unistd.h>
+ 
+ #ifndef EGL_WL_bind_wayland_display
+ #define EGL_WAYLAND_BUFFER_WL 0x31D5
+-- 
+2.52.0
+
diff --git a/package/wpebackend-fdo/wpebackend-fdo.hash b/package/wpebackend-fdo/wpebackend-fdo.hash
index f0578808c4..5e36137524 100644
--- a/package/wpebackend-fdo/wpebackend-fdo.hash
+++ b/package/wpebackend-fdo/wpebackend-fdo.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpebackend-fdo-1.16.0.tar.xz.sums
-md5  38f488aaa6d68252b593b65ba3e2d9d1  wpebackend-fdo-1.16.0.tar.xz
-sha1  8a06e51aeb2c94b4cf254d866c19eca587d3cd37  wpebackend-fdo-1.16.0.tar.xz
-sha256  beddf321232d5bd08106c179dbc600f8ce88eb3620b4a59a6329063b78f64635  wpebackend-fdo-1.16.0.tar.xz
+# From https://wpewebkit.org/releases/wpebackend-fdo-1.16.1.tar.xz.sums
+md5  a112358168e03abf4937c0cecfe1dc9d  wpebackend-fdo-1.16.1.tar.xz
+sha1  4ed9d1d568ef805f79b691baa0d1cbdff17ef453  wpebackend-fdo-1.16.1.tar.xz
+sha256  544ae14012f8e7e426b8cb522eb0aaaac831ad7c35601d1cf31d37670e0ebb3b  wpebackend-fdo-1.16.1.tar.xz
 
 # Hashes for license files:
 sha256  c9f6803371047fad3e72200ec6cd226329a5ee08ac61104c8211c2761fb46825  COPYING
diff --git a/package/wpebackend-fdo/wpebackend-fdo.mk b/package/wpebackend-fdo/wpebackend-fdo.mk
index e5972754f6..6dbe6edfe3 100644
--- a/package/wpebackend-fdo/wpebackend-fdo.mk
+++ b/package/wpebackend-fdo/wpebackend-fdo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEBACKEND_FDO_VERSION = 1.16.0
+WPEBACKEND_FDO_VERSION = 1.16.1
 WPEBACKEND_FDO_SITE = https://wpewebkit.org/releases
 WPEBACKEND_FDO_SOURCE = wpebackend-fdo-$(WPEBACKEND_FDO_VERSION).tar.xz
 WPEBACKEND_FDO_INSTALL_STAGING = YES
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
