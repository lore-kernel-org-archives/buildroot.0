Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65FADF8809B
	for <buildroot@archiver.kernel.org>; Thu, 16 Apr 2026 07:34:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12958809B3;
	Thu, 16 Apr 2026 07:34:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cFjxO3cqNGqK; Thu, 16 Apr 2026 07:34:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02750809A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776324861;
	bh=Zdz46gW13yCJ7FQKPLpTMmBAvWHfOOu9WNxdzMiQtcg=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lARJuxQfjNqCr4BNzGjC7fw9JSsM8htSfb0OlsarM0s1l7uIUCbBFI/0UneQ9fvhb
	 Qn67Jgn/9a9muMsM8sip2T6liGYUZGNdf6h9FT0ZqS07iEd9cNjQNpSNlfetUscpVR
	 49QkEL2lKWrlOV19rv2hcj/BMxrHrQspsBkCcIHMbSSjuAVUTHVCwJqg+26GyqEs72
	 KvTPHUxev0bvGnk8nbnUQsQb/He46JSU9EE5oAyEHtYB8QRhHjDnmX1ect7BjCt429
	 n79mAfCCr67gCv90dqgBpWDsK3Vqhs3V/ewkUO8bQbBkj+3YNL+w1Wpq5Uw6NVS0qM
	 fxV6USBzYLgZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02750809A9;
	Thu, 16 Apr 2026 07:34:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 83CA12CF
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 07:34:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 74E29606CF
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 07:34:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hGrmKI0OzGQF for <buildroot@buildroot.org>;
 Thu, 16 Apr 2026 07:34:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D5E36606CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5E36606CB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D5E36606CB
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 07:34:17 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cf3d.dip0.t-ipconnect.de [79.214.207.61])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 84FCFA4C0BEA;
 Thu, 16 Apr 2026 09:34:13 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35746)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wDHEq-000000007Ac-3irR;
 Thu, 16 Apr 2026 07:34:13 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Thu, 16 Apr 2026 09:34:12 +0200
Message-ID: <20260416073412.3605054-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1776324853;
 bh=iOhBgkrLRpLvsUCs/96MvQCyqL8bVpd+yNH6r5NbtuM=;
 h=From:To:Cc:Subject:Date:From;
 b=aItBTDelVf1aSylaJN2gsLKu3SdIMdnGHQ/r1x+sI1uPm78MVsveaUtLCrcmejr0S
 d2vVnpiIWZlvae37K4WGcPEPw+5wdj6dT90IrNw9zCmrS/YWddXJkhS1CE4CtLPBvT
 Tyj/ATwx70c3JaMVf9nHLkFjadwLDkV9GNpvrMeQd8XtdRackGsQxiYzpqT9gB/6QS
 OB3dcK0UC+vc+7j8C/UZD1OP0rlf1CcUD0gg01FyglHrOSf6uG2qtM5EO6sVH/bjqz
 MMeSM/qMxBrm3YcPEOhjHw6xexBbm1sUy+CQK1I1ciwvj/E0pWeoAy1JtjrcmLodB/
 a7V4FdJG+PXbw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=aItBTDel
Subject: [Buildroot] [PATCH 1/1] package/ccache: bump version to 4.13.3
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

https://ccache.dev/releasenotes.html#_ccache_4_13_3

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ccache/ccache.hash | 4 ++--
 package/ccache/ccache.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ccache/ccache.hash b/package/ccache/ccache.hash
index a0c53a8a11..e69897473d 100644
--- a/package/ccache/ccache.hash
+++ b/package/ccache/ccache.hash
@@ -1,5 +1,5 @@
-# From https://github.com/ccache/ccache/releases/tag/v4.13.2
-sha256  4a0d835f1b3fd7e2ac58a511718bbc902532941f377f7990a3d33b5cf8733ba6  ccache-4.13.2.tar.xz
+# From https://github.com/ccache/ccache/releases/tag/v4.13.3
+sha256  1aefc18ba43c237723d224eeecfe47fd0fc7d3c93ccdda31a619b8eb90c3e470  ccache-4.13.3.tar.xz
 # sha256 computed locally
 sha256  80b5112739a423dfac7bed1ca8a1df3cccda3d794425441997d4462b83db4dd5  GPL-3.0.txt
 sha256  072c40891d4ec8e1bcc93420031ebbbeb90b8f2c49fcd7c872d1bb05564c345c  LICENSE.adoc
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index 8f9d0005fa..e4156feb55 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CCACHE_VERSION = 4.13.2
+CCACHE_VERSION = 4.13.3
 CCACHE_SITE = https://github.com/ccache/ccache/releases/download/v$(CCACHE_VERSION)
 CCACHE_SOURCE = ccache-$(CCACHE_VERSION).tar.xz
 CCACHE_LICENSE = GPL-3.0+, others
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
