Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8512DD25050
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:36:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5AE5A6154A;
	Mon, 12 Jan 2026 08:36:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PG5h1INFtGzW; Mon, 12 Jan 2026 08:36:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71CDC6156B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768207016;
	bh=H4oZJcYwGomdgLIcTgC35L7lIXALlCKUBQHtpz5BVsE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KdcSoUqoJacI4cAqHL+6dgOio3nLiPyZzsDZW5BuXX9lcD3C0o+vxAoN/VOsxjtyH
	 lFxhHn6fQ8jJUeTMXBwrS3IZBffrJh/ZrbS6gC4/yNafSSk1BLav2QXsXN4LLKkW44
	 lhDkfjDPFnK5vNBIfjjhKd/ttz2otPpq4EbwFbmup3EJ9hrHXPyBu2c63XtT0l2LvQ
	 ejsfc/w+rZ5KT6qKO2HrKDFGIDz903F67VVJW9MFgscYIzJ9Lj6W7sEPIRObqGOOYK
	 ZPauI6NCrqiEC01zOnzyj0JePDQWLsUsaJuJ1Vw46R7ww4qwIINrKqG6mLntNT8RIp
	 NKnBPMxB2y4gA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71CDC6156B;
	Mon, 12 Jan 2026 08:36:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3FFE618D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:36:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 26A746156B
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:36:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MMQc_JoAb7s8 for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:36:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1AC116154A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1AC116154A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1AC116154A
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:36:54 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0F843A4C3ADD
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:30:33 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJG-000000007z0-2Msn
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:29:34 +0100
Message-ID: <20260112082950.2528445-86-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206633;
 bh=jipfskauV7pTjSya0dP2SKe/KVM0j1ggoIBTwBYhANY=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=mQER4kuUZkCUCC/0UwrtYUsLY9CEkxhA/8fXy3mF/jUhm/OHMveaGRe2VCm6BjrcE
 xdIWBsLzx0zB67zI1UMWlNRx7xt/qcj2RaicVxTdL5gzvN8Oa6dM3le05y5aSNBRLW
 xxfLFBx1nZV88CKM86Ib42e7Dx5ZqS+l9Nmr167tBe8VRRLnQnQgqZwGaUq9ZiJrTE
 d1qmRiSUOf1zbNrT3++6aCywS7o7Bixqcy1ptcFzVzfHdomSY9ChKMfve5F78jdxhD
 rKl/1a3fXEcWsGV8bA6zuiiUI92JQ4J1TZbRli6sO1z2n0EOWoX169Syt14puTBdHa
 /lKtOwCcCpdHg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=mQER4kuU
Subject: [Buildroot] [PATCH 086/102] package/x11r7/xfont_encodings: bump
 version to 1.1.0
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

https://lists.x.org/archives/xorg-announce/2024-March/003466.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xfont_encodings/xfont_encodings.hash | 6 +++---
 package/x11r7/xfont_encodings/xfont_encodings.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xfont_encodings/xfont_encodings.hash b/package/x11r7/xfont_encodings/xfont_encodings.hash
index 80d4a48c40..e2c100ebc7 100644
--- a/package/x11r7/xfont_encodings/xfont_encodings.hash
+++ b/package/x11r7/xfont_encodings/xfont_encodings.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2023-February/003355.html
-sha256  3a39a9f43b16521cdbd9f810090952af4f109b44fa7a865cd555f8febcea70a4  encodings-1.0.7.tar.xz
-sha512  dc72982b14e5d89fe1eff1ab11f308796c89255a06337d8cd6bf65757f11dd0a5478b41d844793213db8fe9638389734f148abe9df9fb05027ea563dacde6ba8  encodings-1.0.7.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-March/003466.html
+sha256  9ff13c621756cfa12e95f32ba48a5b23839e8f577d0048beda66c67dab4de975  encodings-1.1.0.tar.xz
+sha512  ae912e120847954f5756193cc8860f50ada6c79bb3ba44f7f0cd1913b13aeed7885e140282cb47989a93fae0a0e8cedebe9a2420f65b1936b40192dc7d208427  encodings-1.1.0.tar.xz
 # Locally computed
 sha256  13b4a0f9431f0fdd6ee36ed386e0b7d1eb429c5cb88df73353896078cbb5a137  COPYING
diff --git a/package/x11r7/xfont_encodings/xfont_encodings.mk b/package/x11r7/xfont_encodings/xfont_encodings.mk
index 7825f4117e..f9ebea2d17 100644
--- a/package/x11r7/xfont_encodings/xfont_encodings.mk
+++ b/package/x11r7/xfont_encodings/xfont_encodings.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XFONT_ENCODINGS_VERSION = 1.0.7
+XFONT_ENCODINGS_VERSION = 1.1.0
 XFONT_ENCODINGS_SOURCE = encodings-$(XFONT_ENCODINGS_VERSION).tar.xz
 XFONT_ENCODINGS_SITE = https://xorg.freedesktop.org/archive/individual/font
 XFONT_ENCODINGS_LICENSE = Public Domain
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
