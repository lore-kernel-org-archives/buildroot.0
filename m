Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA527D116FE
	for <buildroot@archiver.kernel.org>; Tue,  2 Dec 2025 20:39:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4D6B61363;
	Tue,  2 Dec 2025 20:39:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OdyQcgQUp8J0; Tue,  2 Dec 2025 20:39:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D16006104F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764707964;
	bh=hfxXJdknJrOKgFRCojnXIISZC+o8BG5dmrp857PlPoA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sZf9KIZ//GTAk5TznXgxSJ81Ke+B2vTQv/eknbUjlENy8XTpR5rGCF3CyQUE6ujWY
	 JKbvdrpTJrhGjvDZuAC+8DhWqO8DbDkI+sf1SZOplGhm9mSeTKYpgtNAHQ4s6V2L9I
	 ttzFt9CKtNIkPdJZlid4W/XBmpU00cZJIibZ8E5FXEppgxfVek5PUFxGBKdrBUnH9b
	 Q85BjCaMYCmtcvhe8JrFSJSfV/2Ctxq0OP9oYomMvNynTJcpla9RDOkW3OEOOxVbDP
	 WAUe72DV+GJt7cQTySDG7euuR0b2elqpGGznVyH654eK6Yt0AwHBi1IGwxtuavz8Au
	 m5ePitq3fB6GQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D16006104F;
	Tue,  2 Dec 2025 20:39:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5053AE4
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 20:39:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 952584115E
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 20:39:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t2oxfQ2H0_C4 for <buildroot@buildroot.org>;
 Tue,  2 Dec 2025 20:39:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7B6044118C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B6044118C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7B6044118C
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 20:39:21 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3BBBDA4C2E91
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 21:39:19 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53106)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vQX9a-000000005zW-29qn
 for buildroot@buildroot.org; Tue, 02 Dec 2025 20:39:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  2 Dec 2025 21:39:18 +0100
Message-ID: <20251202203918.2216989-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764707959;
 bh=uMFoUbHG5UCw9FLhOeckzdz2drEvyHS/rydoF6SHlmc=;
 h=From:To:Subject:Date:From;
 b=KqTfuOEiPhE4TuhjLp++5IMZqxBbEZOWqvFc43QcVlzAWaQau+u+OqcKV//D9tZt7
 wzw4HW74OT0RJkGL/VZwnxnHnc78/N70vrzjUEyScbKD+nmQJXXYBNXXVHi/T9OeWS
 44ACue4w1C331zspflfTeyfya4zqh16eMR881usRvtR1IMPyNHvsKTxDHFe8tAplGn
 0gHsEg2DOL5tKH41T+beH1SHrQ+72a05Vi5Yv+9FrCxRWrlaCWe3F1BMGgTFrOkXZn
 WVhmSVPWH5lpU0I+jgL2bsoHCRbsC6wQNFxcpWSYXLP1s2J/WX54tbEj5dyCCstL7z
 2bfWj+dDlPAxA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=KqTfuOEi
Subject: [Buildroot] [PATCH/next v2 1/1] package/libyuv: bump version
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
v2: sent for -next

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
