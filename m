Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE92AD2CE17
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 14:29:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B39E606D9;
	Sun,  7 Dec 2025 14:29:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3xIb_R9XB0ui; Sun,  7 Dec 2025 14:29:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99FD260750
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765117742;
	bh=/bTWYSHWU1NSasg8vGSF8niUsUbk62HmCQft2GCTAJk=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xwaq3xVu9YSVJy0WM9IC19Bmf5uabCin59bw7l9EM6f7w4hx5EGru8FVnO8ujZqBT
	 JAh0T734G4lSLRt7h3JF/5WhjKO4axEWyFZydm5uQVnbbLM9N9gkpJ+9egf7lB51JE
	 PETPGLrKvBEsMznOHinCJp6Bk7rmEhgmLoOaGAcLVtBbTF4/81dAKSUOAe9Upr0rhV
	 iFy3CNP9b/JncQueTFEa6rU7avMlgsCP3huzrLSgUlun+qa/Ps9b6r25S0JhJ8A7fd
	 eZV1PuSVZSb72R/Xkkp9nfRx0zFNJEPcRXH/LhfYElCbkKhms4ZungQu8i9zcZ9mi+
	 zPAd8opqVrJxg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99FD260750;
	Sun,  7 Dec 2025 14:29:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CC97BE7
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:29:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B2E72606D9
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:29:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2joSVJ5vfAnc for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 14:28:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A83F660AD4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A83F660AD4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A83F660AD4
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:28:59 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c020.dip0.t-ipconnect.de [79.214.192.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9DABFA4C0990;
 Sun,  7 Dec 2025 15:27:00 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60616)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vSFit-000000001Fk-3I1F;
 Sun, 07 Dec 2025 14:26:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Bartosz Bilas <b.bilas@grinn-global.com>, Eric Limpens <limpens@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Jianhui Zhao <zhaojh329@gmail.com>, Jon Ringle <jringle@gridpoint.com>,
 Julien Olivain <ju.o@free.fr>, Maxim Kochetkov <fido_max@inbox.ru>,
 Pieterjan Camerlynck <pieterjanca@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, TIAN Yuanhao <tianyuanhao3@163.com>
Date: Sun,  7 Dec 2025 15:26:47 +0100
Message-ID: <20251207142651.3695074-10-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251207142651.3695074-1-bernd@kuhls.net>
References: <20251207142651.3695074-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765117620;
 bh=3T17FMzcrRj4Z3OD8cTYEYT7GZ3LR7kiIVd+7a5Wtyo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=G7yujkBfF4hVyeM67OPlGtf7zYPioy2+32fa228ketoCYkhyg57TsUbOxQpfTvl49
 3dbEOxUUiSLnj2JXQqKDLzWIYtcxYDMjd/ApzVP+n7/DHeWXKpwkn8fDOwRSLKOVh+
 rDZThheMTpQbiLvtjeorPW5NvPAAGXcg+BXZDI3hjOa05IZNqh8GY48lQj8aPCRVjz
 F0JynhXM9X9p9BNyTkZ7K9FLGBC7o2wEqqPdhsJtJRTGWoJm6zbMh+D7jnk2Xmc1+S
 fq5DBTbg38COWqeu5xgEBevpQUTIZJg2HzPjjvjjkGzeLMmmatS+ojDXfeUg845iJE
 mrxWMja3HDG3Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=G7yujkBf
Subject: [Buildroot] [PATCH/next 10/14] package/mraa: fix cmake 4
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
 .../0003-cmake-bump-minimum-version.patch     | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 package/mraa/0003-cmake-bump-minimum-version.patch

diff --git a/package/mraa/0003-cmake-bump-minimum-version.patch b/package/mraa/0003-cmake-bump-minimum-version.patch
new file mode 100644
index 0000000000..8cad2b7ba1
--- /dev/null
+++ b/package/mraa/0003-cmake-bump-minimum-version.patch
@@ -0,0 +1,46 @@
+From 92a1337e110464bbb3aaba2b3ede77dc13b3f175 Mon Sep 17 00:00:00 2001
+From: Alex T <alext.mkrs@gmail.com>
+Date: Sun, 2 Nov 2025 19:06:06 +0100
+Subject: [PATCH] cmake: bump minimum version to address a deprecation warning
+
+This fixes the following warning shown while configuring:
+
+  [cmake] CMake Deprecation Warning at CMakeLists.txt:1 (cmake_minimum_required):
+  [cmake] Compatibility with CMake < 3.10 will be removed from a future version of
+  [cmake] CMake.
+
+We don't have a clearly defined supported distro/versions list, so I
+took Ubuntu 22.04 as arguably the oldest one we'd want to support for
+the reference point. It has CMake 3.22, released in July 2022.
+
+Signed-off-by: Alex T <alext.mkrs@gmail.com>
+
+Upstream: https://github.com/eclipse/mraa/commit/92a1337e110464bbb3aaba2b3ede77dc13b3f175
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 10 ++--------
+ 1 file changed, 2 insertions(+), 8 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 7a13eeb81..34ded2b75 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,15 +1,9 @@
+-cmake_minimum_required (VERSION 2.8.11)
++cmake_minimum_required (VERSION 3.22)
+ project (mraa C)
+ 
+ FIND_PACKAGE (Threads REQUIRED)
+ 
+-if (CMAKE_VERSION VERSION_LESS "3.1")
+-  if (CMAKE_C_COMPILER_ID STREQUAL "GNU")
+-    set (CMAKE_C_FLAGS "-std=gnu99 ${CMAKE_C_FLAGS}")
+-  endif ()
+-else ()
+-  set (CMAKE_C_STANDARD 99)
+-endif ()
++set (CMAKE_C_STANDARD 99)
+ 
+ option (BUILDCPP "Enable C++ (needed by FTDI4222 and tests)" ON)
+ 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
