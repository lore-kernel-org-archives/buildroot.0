Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA70D6AAF7
	for <buildroot@archiver.kernel.org>; Thu,  2 Apr 2026 18:02:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E264A40C35;
	Thu,  2 Apr 2026 18:02:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nPW4KfymRN-F; Thu,  2 Apr 2026 18:02:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EAAA240C47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775152935;
	bh=29UwxvCWblasr4XXjMeChnvIR0NVNuT0TIefE7AvPZw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=A2wjhBJYZdhFY4ano2t75Sw6Tb+yIXzwrk3bBf2vIRasbBH4tG0sczl3qlQjnnmvc
	 ovJ2wjCKlDRZI9FYmpLxCT3pZj2zdEYF3N7IroqOstSWdjHLhWNUYIA2QnqUlyZqs9
	 61YZIpwHGaA3kgwXGJVbA6Uj0F4m3813/27UYAHodq/YG6pht0DIPSTLDrYamihFyf
	 TVWKw/68nYDxhnEhvsomI2RvFfvm4qUQ2QmmBw8qY/oR4wvxvzehqj9KDApEf2dlel
	 /bYqSkymh0RJzkKZijZ7PosW8aXDQGTgZu7bpE3SRcMHEKEo2wTLaaTFFuBTPR1HvR
	 VDN1oiE1dmMIg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EAAA240C47;
	Thu,  2 Apr 2026 18:02:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8AD082D3
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 18:02:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B2CD40C47
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 18:02:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qkQeU9CR_vaS for <buildroot@buildroot.org>;
 Thu,  2 Apr 2026 18:02:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E753B40C35
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E753B40C35
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E753B40C35
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 18:02:10 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a08f0.dip0.t-ipconnect.de [91.58.8.240])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 107A8A4C32CE
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 20:02:09 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54696)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w8MMq-000000008Bn-1weP
 for buildroot@buildroot.org; Thu, 02 Apr 2026 18:02:08 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  2 Apr 2026 20:02:08 +0200
Message-ID: <20260402180208.2779866-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775152929;
 bh=nIFpkZLe5o/1IeRyT7Lf0nHJK0OXJZ+wQ/gxJh4C878=;
 h=From:To:Subject:Date:From;
 b=vD8s7j35GxdPXi5d9clLej+fbsJRxqM2YYW5MxkNvzIoInFBYpSKGcr9ShB2WKJCg
 iPsu7Om02KUO27tZHsQxdf/TKdN4dUqB/kbhiTZRUhOJPFFQGzz4ZDFUG0id+EYhgK
 8ot4q1ZDWPFtQzrHqCwf4iMjRyzNDwrYYrM14fvCm9h56/P0qgmHPRPaQFeqPKjOGf
 PERE3iYhd6DtdTpF2GeOswq3Ar8TlSWxGlEfvYjojt7bx+1mtKIUr4pstGQT/gjZu4
 qodNTioHC/uyUkkRv6VL4aa1t8eMZtHLY6ekeXOqrBsMtAUjKfAtXaJbytCXm+nYne
 OHB1fDwPflHCg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=vD8s7j35
Subject: [Buildroot] [PATCH 1/1] package/igt-gpu-tools: bump version to 2.4
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

https://lists.x.org/archives/xorg-announce/2026-March/003676.html

Upstream added a dependency to pciutils:
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/a97925a6d7cac457a5d46020f38fbef59e74abc5

Upstream replaced json-c with jansson library:
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/b24cdab174240399a6ac377dbeb7923d4f429680

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/igt-gpu-tools/Config.in          | 1 +
 package/igt-gpu-tools/igt-gpu-tools.hash | 6 +++---
 package/igt-gpu-tools/igt-gpu-tools.mk   | 7 ++++---
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/igt-gpu-tools/Config.in b/package/igt-gpu-tools/Config.in
index 87268969a1..00dc59a2ae 100644
--- a/package/igt-gpu-tools/Config.in
+++ b/package/igt-gpu-tools/Config.in
@@ -20,6 +20,7 @@ config BR2_PACKAGE_IGT_GPU_TOOLS
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBPCIACCESS
+	select BR2_PACKAGE_PCIUTILS
 	select BR2_PACKAGE_PIXMAN
 	select BR2_PACKAGE_PROCPS_NG
 	select BR2_PACKAGE_ZLIB
diff --git a/package/igt-gpu-tools/igt-gpu-tools.hash b/package/igt-gpu-tools/igt-gpu-tools.hash
index b1899cd986..b66d856da9 100644
--- a/package/igt-gpu-tools/igt-gpu-tools.hash
+++ b/package/igt-gpu-tools/igt-gpu-tools.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2025-December/003648.html
-sha256  429f2578fb16cff7402e9beb325c5c267ad30a2b7b957343c77e8ea24af03887  igt-gpu-tools-2.3.tar.xz
-sha512  669e5f124c1177ed58c43b8b9b945f6436fc37b1162b16bbd1db78c5e170c68be98cc3b08b5ecb438d1313722fee2ab8bba8ca86a971443401c2acc3f3ec68ff  igt-gpu-tools-2.3.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2026-March/003676.html
+sha256  a44b7d089a27555944d4cd5da372c9339501539e3cd2735bbdb30e0d802f1cbe  igt-gpu-tools-2.4.tar.xz
+sha512  3f8e8202e3a613faf077ecb3fcc6a13840a8df94f94cb7d3a7933e51888757ea22e4154f2e0f88b896583e23bc8fd472bd286a0b50630b8b5eeb13878a1a2d9f  igt-gpu-tools-2.4.tar.xz
 
 # Hash for license file:
 sha256  1b7e266857b05808660f42369a4a797459d7b7bec7245e378aa28a8db2f213da  COPYING
diff --git a/package/igt-gpu-tools/igt-gpu-tools.mk b/package/igt-gpu-tools/igt-gpu-tools.mk
index 85ed999ed4..6e6d4278f1 100644
--- a/package/igt-gpu-tools/igt-gpu-tools.mk
+++ b/package/igt-gpu-tools/igt-gpu-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IGT_GPU_TOOLS_VERSION = 2.3
+IGT_GPU_TOOLS_VERSION = 2.4
 IGT_GPU_TOOLS_SOURCE = igt-gpu-tools-$(IGT_GPU_TOOLS_VERSION).tar.xz
 IGT_GPU_TOOLS_SITE = https://www.x.org/releases/individual/app
 IGT_GPU_TOOLS_LICENSE = MIT
@@ -18,6 +18,7 @@ IGT_GPU_TOOLS_DEPENDENCIES = \
 	libdrm \
 	libglib2 \
 	libpciaccess \
+	pciutils \
 	pixman \
 	procps-ng \
 	udev \
@@ -44,9 +45,9 @@ ifeq ($(BR2_i386)$(BR2_x86_64)x$(BR2_RELRO_NONE),yx)
 IGT_GPU_TOOLS_LDFLAGS = $(TARGET_LDFLAGS) -Wl,-z,lazy
 endif
 
-ifeq ($(BR2_PACKAGE_JSON_C),y)
+ifeq ($(BR2_PACKAGE_JANSSON),y)
 IGT_GPU_TOOLS_CONF_OPTS += -Drunner=enabled
-IGT_GPU_TOOLS_DEPENDENCIES += json-c
+IGT_GPU_TOOLS_DEPENDENCIES += jansson
 else
 IGT_GPU_TOOLS_CONF_OPTS += -Drunner=disabled
 endif
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
