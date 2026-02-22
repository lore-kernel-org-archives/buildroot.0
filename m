Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 879D0C624D9
	for <buildroot@archiver.kernel.org>; Sun, 22 Feb 2026 10:57:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49F0F83D97;
	Sun, 22 Feb 2026 10:57:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RQrh1Qe-ey-i; Sun, 22 Feb 2026 10:57:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 609D483E0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771757824;
	bh=L3MYAa96pMkXTsp2Ku/Be7xNLsL+l5lZJpv6ypKZ8EA=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OprL0VycrEDWEBMIlaVru3GdZwrcF18NqNv8+/bllHVCBsDXJncJZ61BFfcuIScTH
	 LyAw56NfLLlvTuxkA9NIgj/aVvNOp90ZOb5nu5XKxR+IhdwTtywLqQmgYZyaaYv03o
	 O2I74HGGOE19bK4QJd4NX2YhIuGhVjyUbFZnERVLECi7hxjTUM4dvokeRMJOsT27xr
	 D6HziFzq6C5vEWKzzm85HsMGHqpmyIaBU19LB9Q3768nXq3ix1W1XV+nWs+Z+wIMzb
	 VnCXMfGWSuOO2tM69dyrRelKi3Lh60JR8muUpyLoXorEm2EvL2T8zmgyH8zVsrqFrz
	 bt97wcUQRyAmg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 609D483E0E;
	Sun, 22 Feb 2026 10:57:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 59A441CE
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 10:57:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A88183E0E
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 10:57:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id js4nYF4GZFPU for <buildroot@buildroot.org>;
 Sun, 22 Feb 2026 10:57:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CBF0983D97
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBF0983D97
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CBF0983D97
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 10:57:01 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0c16.dip0.t-ipconnect.de [91.58.12.22])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 622A9A4C2336;
 Sun, 22 Feb 2026 11:56:31 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49720)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vu78Z-000000007Gs-0Pzy;
 Sun, 22 Feb 2026 10:56:30 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Eugene Tarassov <eugene@largest.net>, Norbert Lange <nolange79@gmail.com>
Date: Sun, 22 Feb 2026 11:56:29 +0100
Message-ID: <20260222105630.549807-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260222105630.549807-1-bernd@kuhls.net>
References: <20260222105630.549807-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1771757791;
 bh=xlJPY8QlfuH4/yZBOYQJhhlZtfGK8WaO1zUWiuwHYuM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=XWCVsvpo+ZE3UvsX2CSL9x3hASbw2STA23pkBwMApqZiYdSpbcFtm6TeANcm0TGAm
 J/MrzB16Xs4YwizHb0ZVvgRAiBljd26UXtEVHFWYIM7Zhd++9IwAlVUMenO3HSvUyO
 tAckZkaE+kLH5RvMAJlo3w2WpxfTPTt6SaNkVX4EGk2URM6vv0dS/u3vdgepXoBC/R
 fMf0NIjhbAlD2BKVqnZF3uC1BY+YROO8qkVo1TxpRbB2UqwQ5kqvl5B8X3oF1mUQAG
 +TFjmMNVNAVTvAg2fUm/5lKf7KrE/On3w3pLhm3J9B4dJNOI4WlD9U6P8ZsbbAyXYE
 iSU9TpvNGdCAw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=XWCVsvpo
Subject: [Buildroot] [PATCH 2/3] package/tcf-agent: fix cmake 4 compatibility
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

Fixes:
https://autobuild.buildroot.net/results/1d2/1d237d7b85c6d34f3628b86a9820452b2baa50f7/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...pdate-CMake-minimum-required-version.patch | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/tcf-agent/0003-CMakeLists.txt-update-CMake-minimum-required-version.patch

diff --git a/package/tcf-agent/0003-CMakeLists.txt-update-CMake-minimum-required-version.patch b/package/tcf-agent/0003-CMakeLists.txt-update-CMake-minimum-required-version.patch
new file mode 100644
index 0000000000..f4cf1a510f
--- /dev/null
+++ b/package/tcf-agent/0003-CMakeLists.txt-update-CMake-minimum-required-version.patch
@@ -0,0 +1,39 @@
+From db29f70205479f26b557d68db1a74fd0c7342b95 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Tue, 3 Feb 2026 18:36:42 +0100
+Subject: [PATCH] CMakeLists.txt: update CMake minimum required version
+
+Building with CMake >= 4.x requires the cmake_minimum_required()
+version to be at least 3.5, so let's update to that to fix:
+
+CMake Error at CMakeLists.txt:3 (cmake_minimum_required):
+  Compatibility with CMake < 3.5 has been removed from CMake.
+
+  Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
+  to tell CMake that the project requires at least <min> but has been updated
+  to work with policies introduced by <max> or earlier.
+
+  Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
+
+Upstream: https://gitlab.eclipse.org/eclipse/tcf/tcf.agent/-/merge_requests/13
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ agent/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/agent/CMakeLists.txt b/agent/CMakeLists.txt
+index d5fa5396..aebf2cb5 100644
+--- a/agent/CMakeLists.txt
++++ b/agent/CMakeLists.txt
+@@ -1,6 +1,6 @@
+ # -*- cmake -*-
+ 
+-cmake_minimum_required(VERSION 3.1)
++cmake_minimum_required(VERSION 3.5)
+ project(tcfagent C)
+ include(GNUInstallDirs)
+ 
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
