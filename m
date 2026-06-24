Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 918A2CDB479
	for <buildroot@archiver.kernel.org>; Wed, 24 Jun 2026 18:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0FE581EAC;
	Wed, 24 Jun 2026 18:21:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZvFyVphdbGQz; Wed, 24 Jun 2026 18:21:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4B4081EA8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782325284;
	bh=YFG7HSfSWM+DTaiIzXJ0NiqOqog3Err5/p91R/6ehro=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hPV8HsnyK5GlyE71TNdzphP8/YZTk8sV8PsX8dgtc5WkNpRRjqHfTEt8qlcmCBZMp
	 nHQY84YBtO1P/+PPGmaISjWRTtFTJnkkUDTY4gjeD9R0r2nZT2ZdmDjhiWaXn/ZZGh
	 zxZDgx4vbFXs7IPv13rH7aFy66irCcx8LNMsP3Au6Q4paoW8OJMb7maRuTpc0cQp1L
	 6Q/xs/SleVtt0YCIYX8dslXUnc2IKCCKtMyHF9ccJt3v26xBrPw6xhwQRrNgUrcQd5
	 FBnXhlSH9SnjyLeem5xCSLaP5mVeq8y1LCRQn3nWwypPYJVJ8AzsnL3V84VX7sO9/l
	 9pCFrwrKxwUog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4B4081EA8;
	Wed, 24 Jun 2026 18:21:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BF50C256
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 18:21:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4D3140454
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 18:21:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K6hMptd8ln5u for <buildroot@buildroot.org>;
 Wed, 24 Jun 2026 18:21:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=thomas.devoogdt@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7D50B4025C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D50B4025C
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7D50B4025C
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 18:21:22 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-4624a44e152so1170986f8f.2
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 11:21:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782325280; x=1782930080;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VN3jwoJ7zWEmIZXFjdIj0ZBhKRO59TbuiYhN1lrg710=;
 b=iSFvgQgI7dLsr6Tzl34OxALVf0iv1T/GsiC7xRKOdIbpv6EXr8VveRD7++v/W18x20
 F63g98XmTSQe52qZEXpKMxiciVNNYZr3aHVj8hdtJBEGJ1tVChWAkP38hrMq3OyKb7Fk
 Q+XMTjMKc60iAlDp+sjftXv6u7qBE5RC4Lih3mwmcsIUG9ZS9ud5OJpS1oJU0GK3dQ4O
 QiUdnAXfbADqepH4srKnZ4Kt3l/HFBH/xAv70FaSRplw8m2/e1fmXCztdvEZypSei6NE
 Dkf38lTSsxk0rBnhXDJHPw5URobxEFi3Y1zmcJShgXydTewryeFUdzgx/eJrbLqG8Do0
 H/Ag==
X-Gm-Message-State: AOJu0Yz9nsDVtBiKYo7WKG5xc2DhNexEhfjYx5rrhXDPNGKErGZ66pvL
 8jE++EpXf2sHEKPYwQcHMwlbKxKNuO9WynO565sjtAySEbwClurwaG/JR/aN98udN7k=
X-Gm-Gg: AfdE7cmsG81o2RkopwlNnJyF6CgsWwAQ0vz2WF4PNldr0OAQVWjGtsnIaFFijAEMphy
 8FmXaBL3iv5eYfrGlS24Nun0um8KInbfK1uOgfbk+6FhRQ3juP6B43i73fKUeJ+4IqyYB3uHce7
 ohB6oyr3WLoDFqg5jtkAn4DAFzpQcG1bPOEGkRYaGlP5HOauqgh2/3nlTRssa8H70iQp9IA2PHk
 r8m+LfdJ0nU5KxhprmiPxLPPIBeEpyRnWfSjM7cIyy3KvvHz6i9FoHLkg3KBwwtMYj2P2vah2Jh
 qpRMf4xxzxMdu/eaNnJaQguOeLfiW0IfuMS7gfIR8+tTBhYClbNTtnv8TbBcit5cOedzhxehF0H
 53yFUW0ltOKGqXmSogEPi5PzBCbC7aoND0pnmaYPA805TCqhLX9lDpHXPfCvfGFqEDu6RTZMnM/
 zgYBFA74+bbKSDgqItlXxl/X+0XnPya1k/+W70BmyIOmnrCTj65RlUTT6RQnie7fQklIb38XEY5
 +V3hRYVjpI+ZUGPGAeFG7XObich8KMME/7y8OzdfxQjAj7E+PzT7AJy
X-Received: by 2002:adf:ec82:0:b0:45e:ec47:aa10 with SMTP id
 ffacd0b85a97d-46c06faa525mr5494364f8f.32.1782325279782; 
 Wed, 24 Jun 2026 11:21:19 -0700 (PDT)
Received: from KORLIN44614.barco.com ([2a02:a03f:eb5f:fa00:60:56e0:9fee:b2ee])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-46c1ee01d51sm7417741f8f.15.2026.06.24.11.21.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2026 11:21:19 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Date: Wed, 24 Jun 2026 20:21:17 +0200
Message-ID: <20260624182117.362190-1-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782325280; x=1782930080; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=VN3jwoJ7zWEmIZXFjdIj0ZBhKRO59TbuiYhN1lrg710=;
 b=FwnadT1XCUO7Dgo76LvLPNrYoC8Ve2yOsJKIcokoq63IOBiW0i836bM8ZJ37E0cBfl
 PBkBGauq2ZhRCtOic/sRn7s5QSCOQdWafBb85CIt5Skkr1VYM0Dsaaa5x0V8gcK6qVZ9
 rTZh7pxuASy2VhLVbUfVFybRd3gs0EIfncPfopb8FcIZ4bSATXl8Qr+NgQkAcSc6qtJ9
 wHq3CV7ruON5D+1TRzs6eudaGpijKVETRrOyVBUASdi+orIYfK4Pjh4shNYoiXMO2yeY
 tm9fXhgCY5DCOROFZn97j0YmareGyW1b/xbdy8z2bcrxlwgSUVCsRHkZVMTelzchJJ7k
 jqng==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=FwnadT1X
Subject: [Buildroot] [PATCH] package/webkitgtk: bump to version 2.52.4
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

Release notes:

https://webkitgtk.org/2026/06/02/webkitgtk2.52.4-released.html

Fixes the following security issues:

https://webkitgtk.org/security/WSA-2026-0003.html

Includes fixes (among others) for CVE-2026-28847, CVE-2026-28883,
CVE-2026-28901, CVE-2026-28902, CVE-2026-28903, CVE-2026-28904,
CVE-2026-28905, CVE-2026-28907, CVE-2026-28942, CVE-2026-28946,
CVE-2026-28947, CVE-2026-28953, CVE-2026-28955, CVE-2026-28958,
CVE-2026-43658, and CVE-2026-43660.

Also added 0001-REGRESSION-313606-main-Fails-to-build-with-system-ma.patch,
to get webkitgtk compiled when -DUSE_SYSTEM_MALLOC=ON is in use.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 ...6-main-Fails-to-build-with-system-ma.patch | 52 +++++++++++++++++++
 package/webkitgtk/webkitgtk.hash              |  6 +--
 package/webkitgtk/webkitgtk.mk                |  2 +-
 3 files changed, 56 insertions(+), 4 deletions(-)
 create mode 100644 package/webkitgtk/0001-REGRESSION-313606-main-Fails-to-build-with-system-ma.patch

diff --git a/package/webkitgtk/0001-REGRESSION-313606-main-Fails-to-build-with-system-ma.patch b/package/webkitgtk/0001-REGRESSION-313606-main-Fails-to-build-with-system-ma.patch
new file mode 100644
index 00000000000..decdba68148
--- /dev/null
+++ b/package/webkitgtk/0001-REGRESSION-313606-main-Fails-to-build-with-system-ma.patch
@@ -0,0 +1,52 @@
+From 146cdc86b7345ac8f513fdf649979e80db01a2ca Mon Sep 17 00:00:00 2001
+From: Alberto Garcia <berto@igalia.com>
+Date: Tue, 2 Jun 2026 07:24:38 -0700
+Subject: [PATCH] REGRESSION(313606@main): Fails to build with system malloc
+ https://bugs.webkit.org/show_bug.cgi?id=316083
+
+Reviewed by Fujii Hironori.
+
+Don't add bmalloc_CopyHeaders to LLIntOffsetsExtractor_DEPENDENCIES if
+USE_SYSTEM_MALLOC is on.
+
+* Source/JavaScriptCore/CMakeLists.txt:
+
+Canonical link: https://commits.webkit.org/305877.698@webkitglib/2.52
+
+Upstream: https://github.com/WebKit/WebKit/commit/a6bc685a685c8f16c919dc6310a62a26971d396e
+Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
+---
+ Source/JavaScriptCore/CMakeLists.txt | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/Source/JavaScriptCore/CMakeLists.txt b/Source/JavaScriptCore/CMakeLists.txt
+index a2a6d724608a..ea9ea17802f2 100644
+--- a/Source/JavaScriptCore/CMakeLists.txt
++++ b/Source/JavaScriptCore/CMakeLists.txt
+@@ -412,8 +412,10 @@ set(LLIntSettingsExtractor_DEPENDENCIES
+     JavaScriptCore_CopyHeaders
+     JavaScriptCore_CopyPrivateHeaders
+     WTF_CopyHeaders
+-    bmalloc_CopyHeaders
+ )
++if (NOT USE_SYSTEM_MALLOC)
++    list(APPEND LLIntSettingsExtractor_DEPENDENCIES bmalloc_CopyHeaders)
++endif ()
+ WEBKIT_EXECUTABLE(LLIntSettingsExtractor)
+ 
+ # LLIntSettingsExtractor target needs to have a direct or indirect
+@@ -439,8 +441,10 @@ set(LLIntOffsetsExtractor_DEPENDENCIES
+     JavaScriptCore_CopyHeaders
+     JavaScriptCore_CopyPrivateHeaders
+     WTF_CopyHeaders
+-    bmalloc_CopyHeaders
+ )
++if (NOT USE_SYSTEM_MALLOC)
++    list(APPEND LLIntOffsetsExtractor_DEPENDENCIES bmalloc_CopyHeaders)
++endif ()
+ WEBKIT_EXECUTABLE(LLIntOffsetsExtractor)
+ 
+ # The build system will execute asm.rb every time LLIntOffsetsExtractor's mtime is newer than
+-- 
+2.43.0
+
diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index 03b8d0a9bec..f8c0e0297a3 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,6 +1,6 @@
-# From https://webkitgtk.org/releases/webkitgtk-2.52.3.tar.xz.sums
-sha1  17f9b127618040a5f3fcbb70e37ea16ab6d69b0b  webkitgtk-2.52.3.tar.xz
-sha256  5b3e0d174e63dcc28848b1194e0e7448d5948c3c2427ecd931c2c5be5261aebb  webkitgtk-2.52.3.tar.xz
+# From https://webkitgtk.org/releases/webkitgtk-2.52.4.tar.xz.sums
+sha1  1bfaa562ae46a420abaad2b3b9175dc823cc7a93  webkitgtk-2.52.4.tar.xz
+sha256  cf4076a1ca2a64788edca8c452d8ebb68d5e2965e588fe46a388a016513edce4  webkitgtk-2.52.4.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 54e769d5892..6cab2c6a247 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.52.3
+WEBKITGTK_VERSION = 2.52.4
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
