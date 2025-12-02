Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BFBCD1266A
	for <buildroot@archiver.kernel.org>; Tue,  2 Dec 2025 20:39:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 930B441298;
	Tue,  2 Dec 2025 20:39:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bQqbdKxAv-K8; Tue,  2 Dec 2025 20:39:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A595D4129D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764707948;
	bh=/7f4zkjsH6Zm5A+vu8nTAHTdvoFmDTCAIfhAdCrUAqE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RvXrJNi121BeZdCFxMeZOUAvoawZ5MfOkGS4xRX1FCtRCNh5GniNaRHkyZVwLcIpa
	 2uyxTOn+yWFK2gugUPC6Osm4b3/XZQWnSOGT40oAk/Q04pNjtPYti8BOGHifEDxuY5
	 k4RdvLaH1zKp0kmLkxq67sLfj4irIEPp/kEMLa7eSENHyc/pU1TIknQnU4leIMpuP/
	 ZOAYUbG6WguKNcp9p282wHJnOGyZI7PEZHNbFfo4IXN+04V/8e4JgolHqyHoU6rg8N
	 5n4gHv52k0MJ24T32zjojC4wnQU3TPUqaAOoc1DcUsPX9mhu6V+lkOnM4HHTCSJlEs
	 lWRwAtQMKlPUg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A595D4129D;
	Tue,  2 Dec 2025 20:39:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9453DE4
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 20:39:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7AEF483EF2
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 20:39:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C1r3Bo05rgHn for <buildroot@buildroot.org>;
 Tue,  2 Dec 2025 20:39:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 87611816E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87611816E5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 87611816E5
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 20:39:06 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A76E1A4C2E91
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 21:39:04 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45558)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vQX9L-000000005wn-3uWZ
 for buildroot@buildroot.org; Tue, 02 Dec 2025 20:39:04 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  2 Dec 2025 21:39:04 +0100
Message-ID: <20251202203904.2207366-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764707944;
 bh=Fg4WVDTQ5LRiWIbwE+JpDUnqzhv/GfeWFHDhiqw1udo=;
 h=From:To:Subject:Date:From;
 b=kKUyucN1yu+3bFRVY75qFY/splEg5SplZDwTEgUudYSDGEcnjTLklAcdsExrNO1rp
 +IWcOX6tJylsAkkrcm7Voi3x+zxXp1UeM5mWF/dJkemi0lDWvEPOevn1WiyAa/+MmK
 Xerqlo8tkf201REwF4pf3srZyLbI21xVqa1rK/wQL3/WE7inLkDwZFkaaBu1SI0z/Z
 g1nUB5Tl9azeU+L5DIYa+KSaubS1k3YYj65+PRZBeiMnn0KyUWkfGUCYtcEt6RATko
 ll+4SIXRb7ptPCTOFTIKcWUmjH/Vah3e6piZsWWJSynZP2oE0610GLnYO0HCeu7c69
 e4v1jp6srqQ8Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=kKUyucN1
Subject: [Buildroot] [PATCH 1/1] package/libyuv: bump version
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

This bump includes a patch which adds cmake4 compatibility.

Rebased patch 0001.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libyuv/0001-i386-sse2.patch | 14 +++++++-------
 package/libyuv/libyuv.hash          |  2 +-
 package/libyuv/libyuv.mk            |  2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/libyuv/0001-i386-sse2.patch b/package/libyuv/0001-i386-sse2.patch
index 2380bbc973..7d61fb0609 100644
--- a/package/libyuv/0001-i386-sse2.patch
+++ b/package/libyuv/0001-i386-sse2.patch
@@ -1,16 +1,16 @@
 Fix compilation on non-sse2 platforms
 
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 
 diff -uNr libyuv-1411.org/include/libyuv/scale_row.h libyuv-1411/include/libyuv/scale_row.h
 --- libyuv-1411.org/include/libyuv/scale_row.h	2015-05-22 23:39:21.000000000 +0200
 +++ libyuv-1411/include/libyuv/scale_row.h	2015-05-25 12:35:17.000000000 +0200
-@@ -55,7 +55,7 @@
- 
- // The following are available on all x86 platforms:
- #if !defined(LIBYUV_DISABLE_X86) && \
--    (defined(_M_IX86) || defined(__x86_64__) || defined(__i386__))
-+    (defined(_M_IX86) || defined(__x86_64__) || (defined(__i386__) && defined(__SSE2__)))
+@@ -24,7 +24,7 @@
+ #if !defined(LIBYUV_DISABLE_X86) &&                             \
+     (defined(_M_IX86) ||                                        \
+      (defined(__x86_64__) && !defined(LIBYUV_ENABLE_ROWWIN)) || \
+-     defined(__i386__))
++     (defined(__i386__) && defined(__SSE2__)))
  #define HAS_FIXEDDIV1_X86
  #define HAS_FIXEDDIV_X86
  #define HAS_SCALEADDROW_SSE2
diff --git a/package/libyuv/libyuv.hash b/package/libyuv/libyuv.hash
index 095da4e606..cad7427721 100644
--- a/package/libyuv/libyuv.hash
+++ b/package/libyuv/libyuv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e27c9d73ca502361d0e532065e790e41a958ae0369f1edfa4d296d33317653b1  libyuv-413a8d8041f1cc5a350a47c0d81cc721e64f9fd0-git4.tar.gz
+sha256  324b6bb4a158f2a231427562a01becafc7cb8ad4e105b9f9b21b85ccc406b649  libyuv-4825d9b29eea4dac24607245db7ec7d4c41c1964-git4.tar.gz
 sha256  2b2cc1180c7e6988328ad2033b04b80117419db9c4c584918bbb3cfec7e9364f  LICENSE
diff --git a/package/libyuv/libyuv.mk b/package/libyuv/libyuv.mk
index b3843cec8f..676a95c3d7 100644
--- a/package/libyuv/libyuv.mk
+++ b/package/libyuv/libyuv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBYUV_VERSION = 413a8d8041f1cc5a350a47c0d81cc721e64f9fd0
+LIBYUV_VERSION = 4825d9b29eea4dac24607245db7ec7d4c41c1964
 LIBYUV_SITE = https://chromium.googlesource.com/libyuv/libyuv
 LIBYUV_SITE_METHOD = git
 LIBYUV_LICENSE = BSD-3-Clause
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
