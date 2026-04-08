Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2261FD5F99
	for <buildroot@archiver.kernel.org>; Wed,  8 Apr 2026 08:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4215B40F4C;
	Wed,  8 Apr 2026 08:55:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eXyfsajRJsVS; Wed,  8 Apr 2026 08:55:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E9FE40C61
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775638525;
	bh=MgNEcxa16yn3SV37aS80I3EfUQT48yscBKHTXcUDbOw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EDOrHA62M/uW736amgQVAfhIWXfkZ169E4XwrsI/GiVnvEgN18sz6h6n6sBtJi3bq
	 0Wpk4GBR/tzPgoRjDHX43ntSFOQIJ4wzA76/ulOTjyfCfAaoor/fvYFrlSFYOtbPJL
	 YFMiiRj6GH9cLGfkqdlKeQRtKEtwbOckppbAP8oUbcuQh9hnqex6kbhr6FV7I0ingD
	 BLT+47BCMzksxWQd5akGlH164Y+bOGWo5Yauv15zc1y4/bVPwWa7elPil92EBLgVlE
	 12h68MNp9IkdyKOGU3pQv97nbVNfWBE2sQcPChryAvMdseIv3Vs9caBkpO8toSC1Ps
	 v2Dx+7FW+e4jA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E9FE40C61;
	Wed,  8 Apr 2026 08:55:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C51D0237
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 08:55:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA8EB4023E
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 08:55:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2SLBJc5dWeDj for <buildroot@buildroot.org>;
 Wed,  8 Apr 2026 08:55:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 495AD4023D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 495AD4023D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 495AD4023D
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 08:55:21 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a012a.dip0.t-ipconnect.de [91.58.1.42])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4EC83A4C10EC
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 10:55:18 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33388)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wAOgw-0000000058r-00hW
 for buildroot@buildroot.org; Wed, 08 Apr 2026 08:55:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  8 Apr 2026 10:55:17 +0200
Message-ID: <20260408085517.1641799-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775638518;
 bh=lmPGZ+IVZjb2Nk1sqoo3eCc/UMZf5r0WvCRJ7/zSeNE=;
 h=From:To:Subject:Date:From;
 b=dbJuKKdOQCBnhGuEPpiHuVAV/CNLn73hdM+k6VB7e1Ch2DBLCSdLLzkGNlepPBDA/
 wPPWKbDui6VlnupBN5D40p81Q1kIQgi0W2sxnGULVCXEXV9Uipn3Z8bp1hjkNMBWeC
 wUXrprhcoNl/CghsCoKIUUP0S4B+w/uYvdT/2yZbI/Ii/oWJs821NLQFztbUo57A51
 b3hOhEj0sdVQnEzSEeYgyYikWV+OA3m5P2VmxaYDeEcde3ZgknRr83qPsUp3ZnruMn
 eFfFbKfONElsWaLpymXrP6F5UTxrhIsxQ+gTFUV2IsQKgyJIRrEqNZy3HhMXoU/ODc
 v91a6S7D6qdTw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=dbJuKKdO
Subject: [Buildroot] [PATCH 1/1] package/libpciaccess: bump version to 0.19
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

https://lists.x.org/archives/xorg-announce/2026-March/003674.html

Added sha256 hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libpciaccess/libpciaccess.hash | 5 +++--
 package/libpciaccess/libpciaccess.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/libpciaccess/libpciaccess.hash b/package/libpciaccess/libpciaccess.hash
index e50aacc846..eb35208bfd 100644
--- a/package/libpciaccess/libpciaccess.hash
+++ b/package/libpciaccess/libpciaccess.hash
@@ -1,4 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2024-March/003483.html
-sha512  ef27999446e735df2331e94219ee3dafe9198a2472bb452f63ef9c9c446d5431f9e231e224cfabdeba1402974a5a0064546f9abced4d1770f994f5fc0c2b3310  libpciaccess-0.18.1.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2026-March/003674.html
+sha256  3c55aa86c82e54a4e3109786f0463530d53b36b6d1cfd14616454f985dd2aa43  libpciaccess-0.19.tar.xz
+sha512  a20ea0ef3d650e2cdc18423ea4770780ce273c35115eece85dbbb59e5f2e24bdbaf88e53b1648f2c5d4fa34b015a3fe8318721bf5655a86a835db323e6ecd4f7  libpciaccess-0.19.tar.xz
 # Hash for license file:
 sha256  f33f360f8905940dac01aa21597fe8a6727ca6f4ffa43b380e2116fd0666aa8a  COPYING
diff --git a/package/libpciaccess/libpciaccess.mk b/package/libpciaccess/libpciaccess.mk
index cd35b27015..8e72ab1a64 100644
--- a/package/libpciaccess/libpciaccess.mk
+++ b/package/libpciaccess/libpciaccess.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPCIACCESS_VERSION = 0.18.1
+LIBPCIACCESS_VERSION = 0.19
 LIBPCIACCESS_SOURCE = libpciaccess-$(LIBPCIACCESS_VERSION).tar.xz
 LIBPCIACCESS_SITE = http://xorg.freedesktop.org/releases/individual/lib
 LIBPCIACCESS_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
