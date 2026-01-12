Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7C96D25032
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:18:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E1B6843F9;
	Mon, 12 Jan 2026 08:18:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5PspoQb8qlco; Mon, 12 Jan 2026 08:18:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A292284496
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768205914;
	bh=EeyJFad6iMMPUHT0y779f4eWoj4erPHqNM2Hl2j/nQ4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HMJXoDuwVFCzvuUGASwHzCNWDCldfq9bFpjvARhSMu01uHEKA8G5yPeCHzrAmyrfX
	 u0tdgMcLEqTHKFGCwZwWl17Pj+wLCbsOQFT9HPm0I8RO4nei9aBv/K4M6/Xk/iwRQf
	 jjhfop+MQOZTeAUKl/JZbrntwgiUuUuCbr/rl4gy9LBQ13io6Fjm6hilMl3Q7Cy1Yk
	 zu6d4UZ3BnDNl5XmVE/jIKHvUpqW1PlLW4a5neHtZebhyHa/rHhqlsiW8z5YPXFBWW
	 lleipxIUEHjEzlAYWc8RPr4BDYu6VfTDK/SbP4EwXlqKCT3F+rimLKQpElYeaLPeuM
	 pbE+s2vST88Pg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A292284496;
	Mon, 12 Jan 2026 08:18:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F3EFD12E
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:18:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB352414C6
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:18:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lH52rnpEF0Eg for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:18:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D7BD4414C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7BD4414C5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D7BD4414C5
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:18:31 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A4CF2A4C3F95
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:05:42 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCuV-000000003M6-3ciY
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:23 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:02:55 +0100
Message-ID: <20260112080419.2516889-20-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205142;
 bh=RG372R8YM4wUHUX2b4oTv3dsgzuexoh05rfkm8jDvvc=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=H8VbOFcjrP+UpdEA2JNupx2A4o4YmLkDF3JWqaD1edIcbHIR+PrVupm6BHc9ZTe9Q
 ztHVIBoWy4t9kE94f9qJIQA1/+Z0Gc+hEh6RtkUx0motXvPL5SrqCPb4SZdQYz9Wsk
 FvX69zjpSJwxCAqpjyzIyjUuhA1QOQDBnCbrBX1futRZNkGvk840MdVZdubCxf11lM
 ohcuAEULaUDTszIWmctmxG9jxBEkZPCB/c9ACIR7rUGlxCTuqDPZlKh99wlxcPB8Ho
 UPK7WhinD0HNtoXyQmydETXjcCsldRaazYUOInv2K4jYcVoo0mMHLP/gxYLtPnITYj
 P+wdUAsX5h24Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=H8VbOFcj
Subject: [Buildroot] [PATCH 020/104] package/x11r7/xapp_xeyes: bump version
 to 1.3.1
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

https://lists.x.org/archives/xorg-announce/2025-July/003618.html
https://lists.x.org/archives/xorg-announce/2023-July/003409.html

Switched tarball to xz.

Updated license hash due to upstream commit:
https://gitlab.freedesktop.org/xorg/app/xeyes/-/commit/7dc4f720f57471d2eccefd87cdca54494cf75eb5

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_xeyes/xapp_xeyes.hash | 8 ++++----
 package/x11r7/xapp_xeyes/xapp_xeyes.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xapp_xeyes/xapp_xeyes.hash b/package/x11r7/xapp_xeyes/xapp_xeyes.hash
index 734492b6cd..ce058140ea 100644
--- a/package/x11r7/xapp_xeyes/xapp_xeyes.hash
+++ b/package/x11r7/xapp_xeyes/xapp_xeyes.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2021-August/003101.html
-sha256  f8a17e23146bef1ab345a1e303c6749e42aaa7bcf4f25428afad41770721b6db  xeyes-1.2.0.tar.bz2
-sha512  2d1614614b3ba3d1ebaa0e9801a2e159389b94aaacafb962d326b7e6dc712c1eb2c12a50ceb10b3135cf0eee6ae86bbf84e73098deb08e73792f14a60616b4d8  xeyes-1.2.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2025-July/003618.html
+sha256  5608d76b7b1aac5ed7f22f1b6b5ad74ef98c8693220f32b4b87dccee4a956eaa  xeyes-1.3.1.tar.xz
+sha512  c0c3e25b1685cc943c8d27f88c4d3ec79aa05c102ba7ac0cbd7dcebdf703111ecb2288f4bac55d9ffc5b7aa3b15cba58f28c21025a53b415a8a18bdb61688dcf  xeyes-1.3.1.tar.xz
 # Locally computed
-sha256  d8de1de40e16227d1eb4b19e95117ce3f990f71f71df096a2259b0bc9931e042  COPYING
+sha256  eb051f2b83cbc5c65b3b8c268747ee7fe5e37997375af47d269beca8ec58b362  COPYING
diff --git a/package/x11r7/xapp_xeyes/xapp_xeyes.mk b/package/x11r7/xapp_xeyes/xapp_xeyes.mk
index 3f37aaee8c..29f8022170 100644
--- a/package/x11r7/xapp_xeyes/xapp_xeyes.mk
+++ b/package/x11r7/xapp_xeyes/xapp_xeyes.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XAPP_XEYES_VERSION = 1.2.0
-XAPP_XEYES_SOURCE = xeyes-$(XAPP_XEYES_VERSION).tar.bz2
+XAPP_XEYES_VERSION = 1.3.1
+XAPP_XEYES_SOURCE = xeyes-$(XAPP_XEYES_VERSION).tar.xz
 XAPP_XEYES_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XEYES_LICENSE = MIT
 XAPP_XEYES_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
