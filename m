Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4FF9C982C3
	for <buildroot@archiver.kernel.org>; Fri, 16 Jan 2026 21:33:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F07C41BF4;
	Fri, 16 Jan 2026 21:33:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KChCHosV0Xvd; Fri, 16 Jan 2026 21:33:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F45741BF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768599207;
	bh=iUY36S3NxGwJnHIVEljje10ktQgv93o7j2q6LUmMlVg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HemjbW2yZF5SjSBmAYSChoxFKzhx57rM0gcsr7/mSy7vAD0FJkCGyotLqKE8Cg9RH
	 0KXhFkQyBw5/RlsuCEsY415bCLA+DIgXoNSRRxHtjMhTjVa8u6t/Jl4V45VliMH979
	 gFuPCRLCqt0cziCag/j/6quq7CTkyYauWEhwBXKg+76TvdCaSrHXCLIOt89c3VZPcm
	 KS2waNbFjVP47Tb/tPINXkmmd9xC4+Tg2yke5cF7lfnyYfT1KPEeZqU1Vi8l1c5vIx
	 lMuwpKWXcoX7SY5y4zyM+Fbn3dC1oyJgZafgMmUjf3kNG6ZS5IekJIWAb6YPTvhB+9
	 tufZP4YuVvUng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F45741BF5;
	Fri, 16 Jan 2026 21:33:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 51EE2160
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 21:33:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4DFC884BFD
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 21:33:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ApO5SYMeHSlA for <buildroot@buildroot.org>;
 Fri, 16 Jan 2026 21:33:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B63E784BFC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B63E784BFC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B63E784BFC
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 21:33:24 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc04.dip0.t-ipconnect.de [84.161.188.4])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 532BDA4C4219
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 22:33:21 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57794)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vgrRW-0000000065G-37r8
 for buildroot@buildroot.org; Fri, 16 Jan 2026 21:33:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 16 Jan 2026 22:33:19 +0100
Message-ID: <20260116213319.2747698-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768599201;
 bh=RpYgnEs/bIPS4+iNAr261qzd/QL9fit9zvNK35m8F7A=;
 h=From:To:Subject:Date:From;
 b=f6u4UTBU++kFmPNzlJRnPBaVCzfxluMCYDFxc2DZcuB//oAaF5/MQccR38rFT2thL
 nm9aNMLRgMRA4iQ5iTvmCsOxySSUXINSLWzoPn9OHn56JB4mMcOv3FXolUGLm//sQO
 UjaJJbt14ampRxwRlo/chH9FZzTwFKYHbrvc4vjYtO17vowRgAkEv7wuo+6MwJsfV7
 RLj/RQ9cIMp6HMrC/KNe0D9OEpo9E83+dCVg5UrQQYKMF/JFZl1a7QY9zu8EhNlrqd
 DQs57uE40VvRE8aa50A5uHTzN+gGP8D0AqQY7/cFIcksb6O6Wociidf6El2JCLKAO9
 rI2KPtWTyE1zQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=f6u4UTBU
Subject: [Buildroot] [PATCH 1/1] package/alsa-lib: bump version to 1.2.15.3
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

https://www.alsa-project.org/wiki/Changes_v1.2.15.2_v1.2.15.3

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/alsa-lib/alsa-lib.hash | 2 +-
 package/alsa-lib/alsa-lib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/alsa-lib/alsa-lib.hash b/package/alsa-lib/alsa-lib.hash
index 569b4887d4..1cefb08d5e 100644
--- a/package/alsa-lib/alsa-lib.hash
+++ b/package/alsa-lib/alsa-lib.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  637eefd4966ce738da44464494df2b2894e19778fac2f9e7c47277e2af9297f4  alsa-lib-1.2.15.2.tar.bz2
+sha256  7b079d614d582cade7ab8db2364e65271d0877a37df8757ac4ac0c8970be861e  alsa-lib-1.2.15.3.tar.bz2
 sha256  32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
 sha256  bfe16cf823bcff261fc6a062c07ee96660e3c39678f42f39a788a68dbc234ced  aserver/COPYING
diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index 08d96c3188..50e54712d0 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALSA_LIB_VERSION = 1.2.15.2
+ALSA_LIB_VERSION = 1.2.15.3
 ALSA_LIB_SOURCE = alsa-lib-$(ALSA_LIB_VERSION).tar.bz2
 ALSA_LIB_SITE = https://www.alsa-project.org/files/pub/lib
 ALSA_LIB_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (aserver)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
