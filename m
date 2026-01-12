Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC9ED25056
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 630318129F;
	Mon, 12 Jan 2026 08:46:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SU5Xi2OuA1He; Mon, 12 Jan 2026 08:46:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E956812F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768207596;
	bh=BkJO0FDJtIQW+rl1tVQXOR/EpuR+axC5jyUoiiVYKKM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BnbIEUf4kVVM/uLse4Fwja5HsP3Ud7PsaN5Ogl6vnedPah/SreRZL0C7CftcyoVl+
	 52ruT3I/uFCUNUTcAMal3S9h7qu7iCPG7sgVbhNYW/mblpYD3Hrbub/vBahHFA3E0H
	 gPc79ABcbnyuWUQlokPKaYAuBgHqAzlzVwUank4Ss4rYeHTujZ+RBV0aHvbe6UQtLT
	 UhHgfHmeaUQfmLc2pbqR6NFBbSBY4l5XTx2FKr/1pUXPvyMPKyOZEBaTq0XK8FTW7s
	 qE1dYwzx5BXgNKemP4UDaPK+mydp3WYj4c4f/GyJfPB5fbUAX7ttfrURdcLdfBejHa
	 FqdDHLxT46nMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E956812F9;
	Mon, 12 Jan 2026 08:46:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 261D61CC
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:46:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 18BFB40350
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:46:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oufzb7MZRlHk for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:46:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0D6154004D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D6154004D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0D6154004D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:46:33 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CF6C3A4C4220
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:31:04 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJD-000000007z0-0YjQ
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:28:43 +0100
Message-ID: <20260112082950.2528445-35-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206664;
 bh=tBcvu1HUXZuqC754bbzOgrx6bD0p9VeAqFO+de1cxZM=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=t/ncAAx8VaEczn9UTve+heMqNGCH6sSUDM5dZKAVrt09XQKhRi8Vd5+B5onid66pW
 UsrL7KszzvIdj04BIYrwRpFI/alJQYPg1xjvtOl77vTqA7dSuxXam6FWyMNEXLQig2
 pAAEMWJ48kASaDfrqUcsA19aNJ8c9zmavyUBC6l1x6VcAsTXGtTf7zfyFkjS19ubJM
 CHytvFGoqoStYb0X9O06yf4HFtHBVHxFpNjKuU2zjo1S1HMfegPflnU3Cc1kIJ02ec
 EIFlrTE3Ijzhe1z9P/MgiUiDzwRxLkIUMBuqUpII7qMawso3JoRIDcw46sYsPHVDrl
 ozUMWlZqBAbnA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=t/ncAAx8
Subject: [Buildroot] [PATCH 035/102] package/x11r7/xlib_libXv: bump version
 to 1.0.13
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

https://lists.x.org/archives/xorg-announce/2024-December/003573.html

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xlib_libXv/xlib_libXv.hash | 6 +++---
 package/x11r7/xlib_libXv/xlib_libXv.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xlib_libXv/xlib_libXv.hash b/package/x11r7/xlib_libXv/xlib_libXv.hash
index 0852f27f8b..dee8059f1a 100644
--- a/package/x11r7/xlib_libXv/xlib_libXv.hash
+++ b/package/x11r7/xlib_libXv/xlib_libXv.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-December/003280.html
-sha256  aaf7fa09f689f7a2000fe493c0d64d1487a1210db154053e9e2336b860c63848  libXv-1.0.12.tar.xz
-sha512  bdd00de1ce6a8911056181ab4de32f9e319a68567389162d4bc2e3c9946d5f3c60f87eb6c53f74c9b6a342255e591d5fef4a445a4ac8ca3c1b6fe87d42c51c1e  libXv-1.0.12.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-December/003573.html
+sha256  7d34910958e1c1f8d193d828fea1b7da192297280a35437af0692f003ba03755  libXv-1.0.13.tar.xz
+sha512  80d7a11e6415fbe0fc50c3c2a1abf8f0f2ec38446c9c8d88ff48875cd94b8949cb1028f2ab37476c4b25cbd7eac34dde9132dd998c4e04ea576b95ae411ba946  libXv-1.0.13.tar.xz
 # Locally calculated
 sha256  4fac4d581d00f11c459d68b7cb970f3d4e5a5bbfb53784d85f59a90076280301  COPYING
diff --git a/package/x11r7/xlib_libXv/xlib_libXv.mk b/package/x11r7/xlib_libXv/xlib_libXv.mk
index 808b1e6e7b..e150edf03a 100644
--- a/package/x11r7/xlib_libXv/xlib_libXv.mk
+++ b/package/x11r7/xlib_libXv/xlib_libXv.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XLIB_LIBXV_VERSION = 1.0.12
+XLIB_LIBXV_VERSION = 1.0.13
 XLIB_LIBXV_SOURCE = libXv-$(XLIB_LIBXV_VERSION).tar.xz
-XLIB_LIBXV_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXV_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXV_LICENSE = ISC-like
 XLIB_LIBXV_LICENSE_FILES = COPYING
 XLIB_LIBXV_CPE_ID_VENDOR = x.org
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
