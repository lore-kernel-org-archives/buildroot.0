Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C2D2C48260
	for <buildroot@archiver.kernel.org>; Fri, 16 Feb 2024 05:34:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE53F41F69;
	Fri, 16 Feb 2024 05:34:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xBXIIL0Zozg1; Fri, 16 Feb 2024 05:34:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E2AA41F64
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E2AA41F64;
	Fri, 16 Feb 2024 05:34:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 638E01BF3F6
 for <buildroot@lists.busybox.net>; Fri, 16 Feb 2024 05:34:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C9DD41F64
 for <buildroot@lists.busybox.net>; Fri, 16 Feb 2024 05:34:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0bwZrqQSb3EL for <buildroot@lists.busybox.net>;
 Fri, 16 Feb 2024 05:34:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 82DE741F07
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82DE741F07
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 82DE741F07
 for <buildroot@buildroot.org>; Fri, 16 Feb 2024 05:33:58 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0164.dip0.t-ipconnect.de [91.58.1.100])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D239CA4C0DD6;
 Fri, 16 Feb 2024 06:33:55 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38002)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1raqrD-000000002ix-0MDA;
 Fri, 16 Feb 2024 06:33:55 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 16 Feb 2024 06:33:55 +0100
Message-Id: <20240216053355.12317-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1708061635;
 bh=vdlWYskeBGwAK+iHgYnnJlQJ6P+fEmoSPoElQQjTvAY=;
 h=From:To:Cc:Subject:Date:From;
 b=r3gPhPzcR31tZl6YtdaVGydgnVucWN7fcqw486tWD6yixIaPhdaXGpWGHzbh3MF4i
 VXX0pHvjqnuzWaSQ/5ORw4GUQKS8ZGkf01CuwtHQ/df0nS1xH1N4Bxp0vgQBzwjFhC
 0MX6otpILrIoZNCKUYtZoI9iYXq0QqNh0N0s4DvBRf5jvLDGG/ERZxjMJw1eEiRcgu
 45Sb+SvS2p/510/xU2XN1FjVXT4hn9RT+hrMA+gl4znSXSrsdyIXIA18+qiwmq/aU2
 Ym9ciFpt9VH/PmzvGSGhUT2S6tEYtyMLp5iXUM8Nvos3QbIIMK1AlKAhqHLXv6xDyd
 mxteoKqhEWZ4g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202312101026 header.b=r3gPhPzc
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 24.0.1
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
Cc: Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://lists.freedesktop.org/archives/mesa-announce/2024-February/000749.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 1d006dbc91..f46dcac224 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 24.0.0
+MESA3D_HEADERS_VERSION = 24.0.1
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 49b42e2132..0a7692a20f 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2024-February/000747.html
-sha256  dc7e8c077bc5884df95478263b34bdebb7e88e600689cb56fb07be2b8c304c36  mesa-24.0.0.tar.xz
-sha512  9dfdea7cebb37b9c020335e24194b39b399f48b5af6eec30c3455108276ac4e29e7b06df942cb2abc7afa667784968c0c43d19b9afe30ef03021b9cb6a789f15  mesa-24.0.0.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2024-February/000749.html
+sha256  f387192b08c471c545590dd12230a2a343244804b5fe866fec6aea02eab57613  mesa-24.0.1.tar.xz
+sha512  1eaff5dcff8dd314b2dfe249d25db68d530d3f0fb54e926999768d0a48aa34b67c31ec3587bb2a7d1969845b26e79a4d87aceb7a141fd2e811ae0c47c00b0963  mesa-24.0.1.tar.xz
 # License
 sha256  a00275a53178e2645fb65be99a785c110513446a5071ff2c698ed260ad917d75  docs/license.rst
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 2d13f7336f..4c3476ec3d 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 24.0.0
+MESA3D_VERSION = 24.0.1
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
