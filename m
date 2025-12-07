Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B235D2CE17
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 14:27:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0421840660;
	Sun,  7 Dec 2025 14:27:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mq6C06C7T-NV; Sun,  7 Dec 2025 14:27:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B4234066D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765117669;
	bh=7gExWxUA0vw9QV0ljIJbt9sXMSSWZUYcRjBDfc3VXPQ=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SWhp2Y0mZuP9XP4CjKdhYUmYnMG/O1RyCP6c6MmrWelvI6murWKPaCDfCUk0tzetn
	 2FYlh711TvAm21JoMCIp2vT4fp8i7FSx4aqdyLCWi4JQQQ6+dONrMaecv2GcGrEz+G
	 EH9Vnn0V8SckTFi2YPNOR/+k9ZWaO4nvj1rZ05FobQBKmRWNH0q4hvmRvLQKr4Iibe
	 SynN5IswV/vWWzQdjS8tknBF/KgmIqkqucKEm2ysbDt1Z/oOopbBTeFBDefJ+0bUJR
	 Q8FLdWwRq2WvT8gnEF86V1bfrFhFz0p9lfwt4b3D89AM4nsvaiSAteDQMbcypG2vOw
	 soJoK+fNfuX6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B4234066D;
	Sun,  7 Dec 2025 14:27:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DDD282CF
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:27:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CFDF181178
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:27:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CIFmTnap7LXi for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 14:27:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9D3C981119
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D3C981119
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9D3C981119
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:27:46 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c020.dip0.t-ipconnect.de [79.214.192.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3950FA4C0967;
 Sun,  7 Dec 2025 15:26:59 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60616)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vSFit-000000001Fk-1ZiF;
 Sun, 07 Dec 2025 14:26:51 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Bartosz Bilas <b.bilas@grinn-global.com>, Eric Limpens <limpens@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Jianhui Zhao <zhaojh329@gmail.com>, Jon Ringle <jringle@gridpoint.com>,
 Julien Olivain <ju.o@free.fr>, Maxim Kochetkov <fido_max@inbox.ru>,
 Pieterjan Camerlynck <pieterjanca@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, TIAN Yuanhao <tianyuanhao3@163.com>
Date: Sun,  7 Dec 2025 15:26:42 +0100
Message-ID: <20251207142651.3695074-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251207142651.3695074-1-bernd@kuhls.net>
References: <20251207142651.3695074-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765117619;
 bh=uXPmvecoZUI4OxbC/xohbDUGKgT3vUE47+UQGQxedw4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=lrrNbDr+w9LcBXhvqr4Z/Cqd8LCjajeflDXMteKB/uELUy9KHS4rVznefpRTVqYX1
 F7VltiTDPXqgzhHDDr4PbI+8BS2wER7YP+StZLHt87eJszbNIinTFb5O81b2blA5hz
 jvo5yovGyPvicMozM0MKDZAuVQEIj/9hHRFVidvDZquK7kpCZYNMwujAJrgycg3+XP
 RXvEQlpg17/hd7PLFf/3G4JzfKyKSZGr/rOuF5I2XfUGrO8zSRzvNqPYuROq7W2m3J
 V2xvWcZm3579i3CkDtOHvAidIrZCJlMCEOxHE6NWjwlI70xe2/yuvHi6a3lvd/Xskw
 kpqKp2TDePj9g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=lrrNbDr+
Subject: [Buildroot] [PATCH/next 05/14] package/libosmium: fix cmake 4
 compatibility
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../0001-Require-a-more-modern-CMake.patch    | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 package/libosmium/0001-Require-a-more-modern-CMake.patch

diff --git a/package/libosmium/0001-Require-a-more-modern-CMake.patch b/package/libosmium/0001-Require-a-more-modern-CMake.patch
new file mode 100644
index 0000000000..6c39e751fb
--- /dev/null
+++ b/package/libosmium/0001-Require-a-more-modern-CMake.patch
@@ -0,0 +1,45 @@
+From 7ab87418a0697ac9b7b5f005fbd64dcd99a01124 Mon Sep 17 00:00:00 2001
+From: Jochen Topf <jochen@topf.org>
+Date: Tue, 15 Jul 2025 17:19:57 +0200
+Subject: [PATCH] Require a more modern CMake
+
+So it works with CMake 4
+
+See #391
+
+Upstream: https://github.com/osmcode/libosmium/commit/7ab87418a0697ac9b7b5f005fbd64dcd99a01124
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 11 ++---------
+ 1 file changed, 2 insertions(+), 9 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index cfeffa8e..80f6bfe1 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -6,7 +6,7 @@
+ #
+ #-----------------------------------------------------------------------------
+ 
+-cmake_minimum_required(VERSION 2.8.12 FATAL_ERROR)
++cmake_minimum_required(VERSION 3.10.0 FATAL_ERROR)
+ list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")
+ 
+ 
+@@ -36,14 +36,7 @@ set(CMAKE_CONFIGURATION_TYPES "Debug;Release;RelWithDebInfo;MinSizeRel;Dev;Cover
+ #
+ #-----------------------------------------------------------------------------
+ 
+-project(libosmium)
+-
+-set(LIBOSMIUM_VERSION_MAJOR 2)
+-set(LIBOSMIUM_VERSION_MINOR 22)
+-set(LIBOSMIUM_VERSION_PATCH 0)
+-
+-set(LIBOSMIUM_VERSION
+-    "${LIBOSMIUM_VERSION_MAJOR}.${LIBOSMIUM_VERSION_MINOR}.${LIBOSMIUM_VERSION_PATCH}")
++project(libosmium VERSION 2.22.0 LANGUAGES CXX C)
+ 
+ set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
+ 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
