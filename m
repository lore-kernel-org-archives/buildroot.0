Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B02CF43841
	for <buildroot@archiver.kernel.org>; Thu, 16 Apr 2026 07:34:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E1B480A52;
	Thu, 16 Apr 2026 07:34:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JETdac45DmPK; Thu, 16 Apr 2026 07:34:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D5BA809CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776324882;
	bh=mty++NOUD8yuBv+8mvA3M34NeZtW2vKbNh/98wKxPOA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EQALZhVozyX3kr/Pf4iqtLCMVY3LfMhxCP3vNBC/Plp14h3g6N8X1yGddrLI/JhlM
	 kjPRAwMNBgmLMJIGlTAj877eXBScf854X7VCja9e0xXj6ZkH2H2PsuVOx9cAB2DYw4
	 s2S0cJmtaCOeUDKL02wH1W5XYhyLx+AXk2j/O5qqe+HpQc/H6VEwvMBU03tcfZDppd
	 u4EO/88kG5QB4XKO3pC1Z8pwYZyrtUtCDAI9D5wd9jNZ9chhStgpDlr1m/igXn3qYA
	 LSXQZHV+8ixNKvQMIh2yS9/wljJh9tCr46DHyc67fVI4PiTI7t752SqRVZbdSktz+x
	 eUiEZYXKJw57w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D5BA809CD;
	Thu, 16 Apr 2026 07:34:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 22202127
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 07:34:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 08B2C40800
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 07:34:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Njiob_Qjo6F4 for <buildroot@buildroot.org>;
 Thu, 16 Apr 2026 07:34:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 77CC5407FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77CC5407FD
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 77CC5407FD
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 07:34:39 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cf3d.dip0.t-ipconnect.de [79.214.207.61])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 39714A4C0BEA
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 09:34:37 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54302)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wDHFE-000000007FP-3Eb3
 for buildroot@buildroot.org; Thu, 16 Apr 2026 07:34:36 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 16 Apr 2026 09:34:36 +0200
Message-ID: <20260416073436.3605243-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1776324877;
 bh=2o9BTiTVhsGip8QqoFdZUeLyGL0+yUCJG5yabAKYDXA=;
 h=From:To:Subject:Date:From;
 b=cjTQ4EzDCNExUEioVVBZzlhiI1atf7bxlOwMDPMyxsUgRQYd0DoAakLBIUmzaKITR
 4puP97tBSaF+CDjTEdpNH9aMpNpZC+5pGG2fAF8KXmSWKOFBr8nGJsQzUXEzFkAVrF
 cVaQsXFjTKb507OmpE8VcveKGQJj+vyL28LO09LK6UreeYnQ7ex4wYZ0CPhA5ah3FZ
 BCjVDN508wHfaw/mfzhcR6eaV3STuL6R8wwZHOHr4C27IB52nfmx+rCToP4zp52qnq
 cLEoQ3ZwFLLasgitbaS27w3v72oYnrii2XDzWPSyQ147fmhQj1T4GGtyQ3PW5h8NG8
 CRSqqRc+aVf9A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=cjTQ4EzD
Subject: [Buildroot] [PATCH 1/1] package/giflib: bump version to 6.1.3
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

https://sourceforge.net/p/giflib/code/ci/6.1.3/tree/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/giflib/giflib.hash | 6 +++---
 package/giflib/giflib.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/giflib/giflib.hash b/package/giflib/giflib.hash
index 8c1b1d06f5..76d1a34063 100644
--- a/package/giflib/giflib.hash
+++ b/package/giflib/giflib.hash
@@ -1,6 +1,6 @@
 # From https://sourceforge.net/projects/giflib/files/giflib-6.x/
-md5  d4ad42777ef499a7c6f8aabf2ccf7716  giflib-6.1.2.tar.gz
-sha1  bf0440c7aee5a0a151d7abbbe3657d3c1998ce86  giflib-6.1.2.tar.gz
+md5  a70e90ff780e9ebee9cb84b82bbd46a7  giflib-6.1.3.tar.gz
+sha1  5bc9aa3e5188d1828b5df8aed81720273952b2d4  giflib-6.1.3.tar.gz
 # Locally computed
-sha256  2421abb54f5906b14965d28a278fb49e1ec9fe5ebbc56244dd012383a973d5c0  giflib-6.1.2.tar.gz
+sha256  b65b66b99f0424b93525f987386f22fc5efb9da2bfc92ad4a532249aaffbab0e  giflib-6.1.3.tar.gz
 sha256  ed5d90cb4a041bddad679470a071302ab05ae5d0ec2cf8f9c97ad7b2708751e6  COPYING
diff --git a/package/giflib/giflib.mk b/package/giflib/giflib.mk
index bb563ee689..83bac5d2fb 100644
--- a/package/giflib/giflib.mk
+++ b/package/giflib/giflib.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GIFLIB_VERSION_MAJOR = 6
-GIFLIB_VERSION = $(GIFLIB_VERSION_MAJOR).1.2
+GIFLIB_VERSION = $(GIFLIB_VERSION_MAJOR).1.3
 GIFLIB_SITE = https://sourceforge.net/projects/giflib/files/giflib-$(GIFLIB_VERSION_MAJOR).x
 GIFLIB_INSTALL_STAGING = YES
 GIFLIB_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
