Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C775EEA854
	for <buildroot@archiver.kernel.org>; Thu, 12 Feb 2026 21:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38F26840E9;
	Thu, 12 Feb 2026 21:36:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4NPvtq1DTrub; Thu, 12 Feb 2026 21:36:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65F08840C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770932176;
	bh=Um4EoK+5dqIgipdH/5ZeMbDZjBy/0HSVMlDSMoRfaq8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YWqTEDlGIhvtFbW/tI460YWdvRFgIo/uzWVSZBPnoI6cyC4EGb7rEjjUiX80G2Mi8
	 53+AyAi1iq+9H7RoHLNdRnenO0Y1wKir5gmTXwHp72eIzkAgMIaeTyEbcvznxXOqrF
	 8ZeNWrkoFEzrC24KvT33tb+a5HkJfUO/nReKBuGfsuxBcev0jwuXEnCqC7CFRJnWWv
	 oDcfDkAhmgQyn7n3KftbVjeRuhqhbURMgHsMVPX2aWKu6g36MHhFzM2X4Zo17e4I95
	 soqVUOorvnewywAvcNstMmvQEmadmSVzXV3ahi5mgTkLwtyLUFjOh9X8B+wzb7/z4w
	 9s4Ng+OxcM5IA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65F08840C0;
	Thu, 12 Feb 2026 21:36:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E44571D6
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 21:36:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E14FD840DD
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 21:36:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l6Tz-MRK5B4M for <buildroot@buildroot.org>;
 Thu, 12 Feb 2026 21:36:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.131;
 helo=smtpcmd12131.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C1B5B8317B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1B5B8317B
Received: from smtpcmd12131.aruba.it (smtpcmd12131.aruba.it [62.149.156.131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C1B5B8317B
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 21:36:10 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id qeM3vYRX5P2aDqeM3v70SY; Thu, 12 Feb 2026 22:36:07 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Thu, 12 Feb 2026 22:36:06 +0100
Message-ID: <20260212213606.539483-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfG5gPh3R6Fi1lIe/UetFOtQL3cQGJfwK++KHVv5uVMPWv6CkFDN6A+AoE66lPpJmtN2uaedSZpZhWdE3ufpeW7cqYIQ0AdCq394Jp77k/JICH7G5a8cq
 mS9fsWQvyDLqUbIYvsJO8wlo5FJUNpcAi2uQHkQkvwOwHlPjtX0yA1K94waz85btNvunfiGau1UFJpKHIbIq9G8jb3cXnzqAPc0Zu2Tqh84PNpC2DwAOzs8Y
 w3Q3ot1JP+zLQIs1M6U2bsfb4Tlq9+H6qXJC1A0Y2VI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1770932167; bh=nblC7Se0qtY76anAnUdPJCw/R8/vPFOw88Gjq0Wm47A=;
 h=From:To:Subject:Date:MIME-Version;
 b=jp+HpBlRx3f/jPf+MeB55QH9H2om/+7FH+qw1cMrS0phR6XnZdVx2+4BcOH0CP3bL
 XRdPUOoEieZ/kuhB+eQPCYVg54F966hV90ZsDzCEreK3DiUiWQ4oSc7mFtU682njY1
 9VaO1LgyQYiNjGp8m7oBy8iTHhqNO8bDAUNe+wo242xPHjaFem47UFh7MMNGdD6EwB
 tP3rTMud3mAt2/lRWQ/Cf7stlpCZX5R/FVnhOG/I4sDhes54M3lgYUrH//kPYABSTW
 Arh497BgNRrnlP0/JnQN4U4E3M/VhWZEZc8Wiv9B5Uhg3O7CYgRNW8vT5HZh69nNQu
 ZMO+uCazSW/CA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=jp+HpBlR
Subject: [Buildroot] [PATCH] package/zlib-ng: fix Power 8 build failure due
 to missing VSX(set soft-float)
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

Add local patch pending upstream to fix build failure on Power8 with
soft-float enabled.

Fixes:
https://autobuild.buildroot.org/results/a0fa5a175c546993d818371a0de93b2e9845a183/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...ix-build-failure-on-Power8-with-soft.patch | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/zlib-ng/0001-CMakeLists.txt-fix-build-failure-on-Power8-with-soft.patch

diff --git a/package/zlib-ng/0001-CMakeLists.txt-fix-build-failure-on-Power8-with-soft.patch b/package/zlib-ng/0001-CMakeLists.txt-fix-build-failure-on-Power8-with-soft.patch
new file mode 100644
index 0000000000..e3dd9c8612
--- /dev/null
+++ b/package/zlib-ng/0001-CMakeLists.txt-fix-build-failure-on-Power8-with-soft.patch
@@ -0,0 +1,37 @@
+From 065481dbdff2a85389f4e9fec9b4ab0e37f4f568 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Thu, 12 Feb 2026 22:08:17 +0100
+Subject: [PATCH] CMakeLists.txt: fix build failure on Power8 with soft-float
+
+Even if all Power8 has VSX extension, we can decide to build a toolchain
+forcing soft-float. This way VSX is not recognized by CMake but at the
+moment building on Power8 assumes VSX is available and in this particular
+case it's not true. So let's guard the building of Power8 accelerators
+against HAVE_NOVSX.
+
+Upstream: https://github.com/zlib-ng/zlib-ng/pull/2151
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ CMakeLists.txt | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 25376429..be337789 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -905,8 +905,10 @@ if(WITH_OPTIM)
+         # Power8 specific options and files
+         if(WITH_POWER8)
+             if(HAVE_POWER8_INTRIN)
+-                add_definitions(-DPOWER8_VSX)
+-                set(POWER8_SRCS ${ARCHDIR}/adler32_power8.c ${ARCHDIR}/chunkset_power8.c ${ARCHDIR}/slide_hash_power8.c)
++                if(NOT HAVE_NOVSX)
++                    add_definitions(-DPOWER8_VSX)
++                    set(POWER8_SRCS ${ARCHDIR}/adler32_power8.c ${ARCHDIR}/chunkset_power8.c ${ARCHDIR}/slide_hash_power8.c)
++                endif()
+                 if("${ARCH}" MATCHES "powerpc64(le)?")
+                     add_definitions(-DPOWER8_VSX_CRC32)
+                     list(APPEND POWER8_SRCS ${ARCHDIR}/crc32_power8.c)
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
