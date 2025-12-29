Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 746A8E8FDB1
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 07:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14A8F60ACF;
	Mon, 29 Dec 2025 07:55:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E_9HXaZ12LwB; Mon, 29 Dec 2025 07:55:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5143560ACA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766994946;
	bh=phrG5fgcT+RKwwU9kJ12tHLdUlD5mMf+Ii6dbCTLzkU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RvgmN8FlDt2HoWgJQ8MhecUDUMtvZmZGu6+QFx3EFJcx7uZRAqRLqc02sTB8cwR/r
	 a4HupdUA1dFvMtxspplDVeK5BQ/PyhC6AlGiQ97koKXpeNB+T8eYYJnKkkcJg0Dd86
	 QhzQPrFAkbMp1A0v1briuMvi2cd4AZmORENCVEeUPeDgObNGhljVZ7U7OBjE+bOKL3
	 8zSc+lmzwSQs/AMwLF0JB+k+sVw+xzgUxyZo37byPIzTnnlrl0fZ7AyeVWXcmJK0Yu
	 ecsTrrbq095fOEKGfrbHv5dZMdUAbdIm7A8QQWdA24hbfVyKKfcAddtDa2HdhWF4ou
	 Oku+bp8zX9ehA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5143560ACA;
	Mon, 29 Dec 2025 07:55:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CEA3D8
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 07:55:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 13EA9808A9
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 07:55:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9f2Kv0oDz0Ak for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 07:55:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2E6278089C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E6278089C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2E6278089C
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 07:55:43 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 344B5A4C20C5
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 08:55:41 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60750)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1va86N-0000000027L-2qsL
 for buildroot@buildroot.org; Mon, 29 Dec 2025 07:55:39 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 08:55:39 +0100
Message-ID: <20251229075539.516207-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251229075539.516207-1-bernd@kuhls.net>
References: <20251229075539.516207-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766994941;
 bh=nhgDM6gQKKq5QJrIlUZYYRXGGpB9dz3ocazV3VDCjk8=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=nOppGgXoR27dDOhmSOrb4CxuOCi8iktl0OZSQRpJ5F9nSvXaJQUTeqtEZHP6e2ZVt
 ezYgJfmHGy93yf2T3GOfWcoGIj6rHnVPtO4FJd5oAMKDyPF6fEeqZ/RJ0/Dhy8Y1cI
 K6jGtWMPS1d4SDtMK3ULxlf/dQNm5SzY8H/+WsekngF5ROkabhKqYnafGemv3diC6S
 FDOSgfApsY5N6AwIVFMwzW1psMfx3nSZm3Aika0qlRI2FUyy44eotS+rQ4Es626U/u
 4DmYNc4HHJp+vEyqnThYWrNG7VNC7gF/wKG7s/UKesQAAy1ebhf+gYUejbOfizgg0J
 eqfu62G/sfBhA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=nOppGgXo
Subject: [Buildroot] [PATCH 2/2] package/utfcpp: bump version to 4.09
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

Release notes: https://github.com/nemtrif/utfcpp/releases/tag/v4.09

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/utfcpp/utfcpp.hash | 2 +-
 package/utfcpp/utfcpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/utfcpp/utfcpp.hash b/package/utfcpp/utfcpp.hash
index d995899165..7f8c2160b6 100644
--- a/package/utfcpp/utfcpp.hash
+++ b/package/utfcpp/utfcpp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f808b26d8c3a59def27fea207182ece77a8930bd121a69f80d328ecf3cfef925  utfcpp-4.0.8.tar.gz
+sha256  0902218f606e942ccc10724df8a988fc993c12da4b3adeace28a7f0211970e08  utfcpp-4.09.tar.gz
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE
diff --git a/package/utfcpp/utfcpp.mk b/package/utfcpp/utfcpp.mk
index 4e17364e0b..415ea3644e 100644
--- a/package/utfcpp/utfcpp.mk
+++ b/package/utfcpp/utfcpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UTFCPP_VERSION = 4.0.8
+UTFCPP_VERSION = 4.09
 UTFCPP_SITE = $(call github,nemtrif,utfcpp,v$(UTFCPP_VERSION))
 UTFCPP_LICENSE = BSL-1.0
 UTFCPP_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
