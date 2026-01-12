Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 972E2D25050
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:48:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72527846BA;
	Mon, 12 Jan 2026 08:48:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j54BwYGiVXhr; Mon, 12 Jan 2026 08:48:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A06A5846AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768207680;
	bh=AdIsJeMHPkyTyVuWY/2SbwNMrt+iCIed1HXAnm6CdlI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MhKo36F8U+56/Vya7c7kjaMVWxUD8Jnz5MrHYnsm6h8O6nODA6qy8v36brJ05Ds44
	 OTvKMYTsREhOz5PN3/9yRqxWswcvZVzd+L6LsAYgZ3lPhjpQPwPjmrqy5L1L66RKxJ
	 k99mj1KhtpPziqK0oCDrZUEqINqQ4WJtTe+BwTyjA6VudPP/TvF3weoj/o/6SmTlC4
	 3UsDqgMyjxL2Rul8IVH9ur111B3cQpZbK3LXKxPvF1ClpXVctTc4vf1mXQHMBf78BB
	 2a/ShRkNhteBjfp6vPS9Jy48HtGUPJdCh1k/y67gkSWjpIdu02tN7ljbLJVY/05gUc
	 +I+LR8QXk068g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A06A5846AE;
	Mon, 12 Jan 2026 08:48:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7423D1CC
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:47:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 66648415BD
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:47:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TnaRG8oY7D9B for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:47:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 56B05415BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56B05415BC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 56B05415BC
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:47:58 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9D5EBA4C4228
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:31:09 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJD-000000007z0-2hNt
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:28:51 +0100
Message-ID: <20260112082950.2528445-43-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206669;
 bh=9APImWnUgf7o5vl7t170mwWypnlZbJYRQ9oR6rkpxyk=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=BybDv7V9OvaPkB+OGPNer0EA2Czy3863e8jBCvu/SJc0CqjAul2Aem7kqZjw5dMOS
 /hnkyHu3RRAH+jMENppqAvN9a0N8T22JzkrDY5gSGZxSHPN/otpzcUYnSxKbDGD1hN
 UVNPAzOom+BsswEIQeOGNNfwqvGH23kCJQ/nbm56czWXGjz0+U5EFtrFN6ed/hhlwg
 +qaCVtrslqOwfV0CMmzV03fPtdkm8EYJmGFC20wUB+VmEQcqVaQRTl/JCCpsWxrLHA
 28u4Bx6H2nWA8Gwer+yk8wlgFne4BvAnrwfWmWP8xL3qP9ovmZhpyuVzg/Q+tORGWV
 5f5IxjFvBGiGQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=BybDv7V9
Subject: [Buildroot] [PATCH 043/102] package/x11r7/xapp_xlogo: bump version
 to 1.0.7
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

https://lists.x.org/archives/xorg-announce/2024-November/003557.html

Updated license hash due to upstream commit:
https://gitlab.freedesktop.org/xorg/app/xlogo/-/commit/c31ea299ed8e2915361dc4109d7720bb32992413

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_xlogo/xapp_xlogo.hash | 8 ++++----
 package/x11r7/xapp_xlogo/xapp_xlogo.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_xlogo/xapp_xlogo.hash b/package/x11r7/xapp_xlogo/xapp_xlogo.hash
index 58f2ac4028..7dc7580b36 100644
--- a/package/x11r7/xapp_xlogo/xapp_xlogo.hash
+++ b/package/x11r7/xapp_xlogo/xapp_xlogo.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-November/003257.html
-sha256  c16ae461a7f7ea275f55c82acf3ee86ce0eb5e406f3a91ab2bb4d332693f32a0  xlogo-1.0.6.tar.xz
-sha512  f0c921e0e34d2c0959d95ca0fcb7488395043280b8b35bcad4e8a528224f2b38581fbf60e82239d06760ecd637692cb29c3b1c0c46ac7f269f692a139d954ea0  xlogo-1.0.6.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-November/003557.html
+sha256  8a3f67b20407a53286a7de1a04dbda12d272234d59ef35e68ecfaf7633d83624  xlogo-1.0.7.tar.xz
+sha512  dfea0d42aeec7394c487e009c22ebb24af9501fa8144079d4fe1f32931cfad6bd1eb3830a1d211b9785a9f89fe22c61d4d4b6d6b881af42f3f916ccc5eb9ce66  xlogo-1.0.7.tar.xz
 # Locally computed
-sha256  972b454b6c0da17cec61225ab9dfd4afc69fd8e7e4c629497197c6f79adc6fb0  COPYING
+sha256  29bfb0a3200dfa6868639a6ab313d1049d0aee6c2de2752c2c279a6be6121b1e  COPYING
diff --git a/package/x11r7/xapp_xlogo/xapp_xlogo.mk b/package/x11r7/xapp_xlogo/xapp_xlogo.mk
index 27d693bec9..84f464204a 100644
--- a/package/x11r7/xapp_xlogo/xapp_xlogo.mk
+++ b/package/x11r7/xapp_xlogo/xapp_xlogo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XLOGO_VERSION = 1.0.6
+XAPP_XLOGO_VERSION = 1.0.7
 XAPP_XLOGO_SOURCE = xlogo-$(XAPP_XLOGO_VERSION).tar.xz
 XAPP_XLOGO_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XLOGO_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
