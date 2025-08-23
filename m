Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FCA7CA0EFA
	for <buildroot@archiver.kernel.org>; Sat, 23 Aug 2025 09:38:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DAA6483C2E;
	Sat, 23 Aug 2025 09:38:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4QAI6jJP5ccC; Sat, 23 Aug 2025 09:38:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0FCA83C25
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0FCA83C25;
	Sat, 23 Aug 2025 09:38:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D43E19C
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 09:38:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 33B0441316
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 09:38:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J0GUb02pV1DI for <buildroot@buildroot.org>;
 Sat, 23 Aug 2025 09:38:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4D6304130C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D6304130C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4D6304130C
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 09:38:44 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b990.dip0.t-ipconnect.de [84.161.185.144])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EDFA3A4C42BD;
 Sat, 23 Aug 2025 11:28:48 +0200 (CEST)
Received: from [192.168.1.144] (port=35972 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1upkYK-000000006Fn-2TJh;
 Sat, 23 Aug 2025 09:28:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
Date: Sat, 23 Aug 2025 11:28:48 +0200
Message-ID: <20250823092848.3760614-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1755941328;
 bh=zbDFVwHTdqzdfkOUMgfja93NJLUkbn0V473MqkZ1jw4=;
 h=From:To:Cc:Subject:Date:From;
 b=iEDwxlvCtkHOqHksAE/nltMC2j4uhclSriHw6dY3+gJJL7WhtEWSpB7mBrofpbNRH
 hnROTVbRFQkEBVxhJjFbFywYX/CwUxvlmcK0PPPgZR80W7KjVQcjxFPl76HzGVJjY5
 BieXlquL1+nrEXI440Et10pM3EhEFPiesp3fqMDi/ne08jbXytjRhPA3Ux614Xg/fN
 XzNTg9udjVkblu8fPHxZbathxhgdUtLnz20R3GM4aHjNyY4jhLBqLXfE1QOWgKXH0k
 R72FMHeugoM2BL0YE7dMlIS85xUmgv24pCLSqqfkDwgBg42qF9XLaw4L1eQUuTx14k
 hfJGtB9sYlDDQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=iEDwxlvC
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 25.1.8
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

Release notes of the bugfix-only release:
https://lists.freedesktop.org/archives/mesa-announce/2025-August/000817.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 8dd0581b41..5cd05cc9ff 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 25.1.7
+MESA3D_HEADERS_VERSION = 25.1.8
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 9514b5e0e6..a3858d398d 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2025-July/000814.html
-sha256  4afd26a3cc93c3dd27183d4c4845f1ca7d683f6343900b54995809b3271ebed6  mesa-25.1.7.tar.xz
-sha512  a62fc6970efce3b4861094be2ef3139a3b18a6a51d770ead9f04d39592abc0a13a04702c552637e63bc965236f66ad545d30a9ec446b24f0bfc5bbb7cf0f0757  mesa-25.1.7.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2025-August/000817.html
+sha256  5cf1571d0d646d90047f3d93f57acc787cf88ec7e95efe172c555b492c30fb71  mesa-25.1.8.tar.xz
+sha512  98435d52a2855c71b15060785c225dc674b3565545a8581a5dd501605a04f9d597636282f1bce61e7a2e8ee98c31ecf7fbccab594571e31bc8b827e18e98aaa5  mesa-25.1.8.tar.xz
 # License
 sha256  0d1a0472ecc81830e75c20d59b0ea02841e3db21255e0ebad97ab682c54d6615  docs/license.rst
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  licenses/MIT
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 74994fe02a..e94bafed8c 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 25.1.7
+MESA3D_VERSION = 25.1.8
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.47.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
