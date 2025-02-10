Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DBD9C02198
	for <buildroot@archiver.kernel.org>; Mon, 10 Feb 2025 10:40:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7BDF80EDE;
	Mon, 10 Feb 2025 10:40:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P8oy129lzfn0; Mon, 10 Feb 2025 10:40:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E241E80D30
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E241E80D30;
	Mon, 10 Feb 2025 10:40:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 76C5C199
 for <buildroot@buildroot.org>; Mon, 10 Feb 2025 10:40:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 634AC80D1D
 for <buildroot@buildroot.org>; Mon, 10 Feb 2025 10:40:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YNkwGRdrl_tM for <buildroot@buildroot.org>;
 Mon, 10 Feb 2025 10:40:10 +0000 (UTC)
X-Greylist: delayed 1130 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 10 Feb 2025 10:40:09 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8F0BD80C7A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F0BD80C7A
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.60.130.6;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8F0BD80C7A
 for <buildroot@buildroot.org>; Mon, 10 Feb 2025 10:40:09 +0000 (UTC)
Received: from 91-153-34-249.elisa-laajakaista.fi ([91.153.34.249] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1thQua-0079sn-9M; Mon, 10 Feb 2025 11:21:14 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 726533b4;
 Mon, 10 Feb 2025 10:21:12 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Mon, 10 Feb 2025 12:21:09 +0200
Message-ID: <20250210102112.273298-1-aperez@igalia.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=r6awnAcJJrR63ofduGddNb6wf06yv0urso9sBF2fJKc=; b=Ln+Uos4x9lV5w0eyMj5A83WMiv
 Q4DszJIinpyy2HWXxJUwmNsDfUOj8p9AB2Y3j4WswSe1bEhMNR8oDZ9bPQZKotLjX3OIMzXURt9cF
 HUYUR866GKPX8jieVg9rSVbQXrzJ0bGVbXs8iLgJf0nVBaFzxQHbSUNN9NyS1d0Dv/b4N5d5l6JoO
 wY37ivY0oRxTrPdmMu1d0g7PFIJZDoT06wWCuvmBuQxUJZ3eXznCBkJ4ikXBtAHhelalZu46lRQ8H
 Ws9GbzSq1Sk92bh1nPO2AXBIB1zTl2reIFNFo5RupcXhSKlEQuBaPv01jOVGVXKH0mWLRRCdJ57wD
 6Lt1kt9A==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=Ln+Uos4x
Subject: [Buildroot] [PATCH 1/1] libwpe: bump to version 1.16.2
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
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This minor release brings in support for analog gamepad/joystick
inputs. Version 1.16.1 was deliberately skipped because it introduced
accidental ABI breakage, which was fixed in 1.16.2.

Release notes:

  https://wpewebkit.org/release/libwpe-1.16.1.html
  https://wpewebkit.org/release/libwpe-1.16.2.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/libwpe/libwpe.hash | 8 ++++----
 package/libwpe/libwpe.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libwpe/libwpe.hash b/package/libwpe/libwpe.hash
index 2a2ee3c2e9..45bba04d35 100644
--- a/package/libwpe/libwpe.hash
+++ b/package/libwpe/libwpe.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/libwpe-1.16.0.tar.xz.sums
-md5  9779115aaa7e67abe642777394e7bfa2  libwpe-1.16.0.tar.xz
-sha1  ea574e09b5d47461a5579a24006488419474d136  libwpe-1.16.0.tar.xz
-sha256  c7f3a3c6b3d006790d486dc7cceda2b6d2e329de07f33bc47dfc53f00f334b2a  libwpe-1.16.0.tar.xz
+# From https://wpewebkit.org/releases/libwpe-1.16.2.tar.xz.sums
+md5  689306c9baf6f8d6844146a5c84fc932  libwpe-1.16.2.tar.xz
+sha1  499b62ddd3c1becaffc3b344ff5131c37d527144  libwpe-1.16.2.tar.xz
+sha256  960bdd11c3f2cf5bd91569603ed6d2aa42fd4000ed7cac930a804eac367888d7  libwpe-1.16.2.tar.xz
 
 # Hashes for license files:
 sha256  35bef295cedbbf179eaee14328002587a0e7dc08ebf3f15ea080a6f2815f0d7b  COPYING
diff --git a/package/libwpe/libwpe.mk b/package/libwpe/libwpe.mk
index de49cedfb4..5721b83784 100644
--- a/package/libwpe/libwpe.mk
+++ b/package/libwpe/libwpe.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # The middle number is even for stable releases, odd for development ones.
-LIBWPE_VERSION = 1.16.0
+LIBWPE_VERSION = 1.16.2
 LIBWPE_SITE = https://wpewebkit.org/releases
 LIBWPE_SOURCE = libwpe-$(LIBWPE_VERSION).tar.xz
 LIBWPE_INSTALL_STAGING = YES
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
