Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36435D25050
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:46:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DC9684690;
	Mon, 12 Jan 2026 08:46:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RN1GHGar00A0; Mon, 12 Jan 2026 08:46:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E194B81758
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768207610;
	bh=4znA65W6KnBegD/9KSDQHiDLOCfXP5uu4f/t818zAT0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H5ZHx6inoofDQCSkmLhzCBC/jYVIIpBIwPlp/LZgxLjAtjssHFnve+rarTUbeESw1
	 U12ddp6NbY7JyFdVbJztrtZ1lkZUTi7i4gSjNxZvoKgNe4qQBfe0D/Qpu7E+/Pwq1Y
	 ISjjB4YFxw2uliRm8YfDRWKq4ZIkj4oC1xxEw8AE9NMaZb768I06MuNmFDkKwaZ2Mr
	 S+76m+N0PokAMn17LzqVl6HDSzQQLtFYvynhoIsQcTJJt++pM3Rki2DbAhusDogoy1
	 lSyr4MMr92cCOuhfqUkHzZHc4XGwe8I/m4LPk0yn+7HkIrK7fNjvrXTYYxJr01XRIK
	 dZBmX8au5K1WQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E194B81758;
	Mon, 12 Jan 2026 08:46:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B21318D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:46:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 82529415B7
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:46:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sdVw8CSbIE3r for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:46:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 79559415B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79559415B6
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 79559415B6
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:46:46 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4F111A4C4221
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:31:06 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJD-000000007z0-16eP
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:28:45 +0100
Message-ID: <20260112082950.2528445-37-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206666;
 bh=d3WX0dio2NJO+hOzSoNPRYn7KKQbONLZwe8nMS6F+tI=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=RJ5uXZSPp4CEJP7rAp33VknufSkP1HY2z7YJHhrcf2R8zZwmjdiB8nf8IH5GVtTxZ
 6PY3Y+QbMpl2c3gADOiEQC0+L+ZAJRIELwuxfIvl9t3hdy3v2TkuCFz5KoOywnRYn1
 lWWt91kJiQApqa5QLI8erA5x9l3aaV63PDXja5gG9qR4bMzensxemm2ozGWiE+K0GZ
 WUjnEWpQ3GgXhgRDVtjanUo5GThJH4xeJTnPGVurA26cF7qfxNgLHGeYfXT3DWyG3N
 Rw0fwhFLw5vNpRKJSzgR5CuBI8gNBe1/J8Lm+89VYRXChxNpN3eXxRnXA0fGbgVu3O
 2p9cX/5CStY7g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=RJ5uXZSP
Subject: [Buildroot] [PATCH 037/102] package/x11r7/xlib_libXau: bump version
 to 1.0.12
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

https://lists.x.org/archives/xorg-announce/2024-December/003570.html

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xlib_libXau/xlib_libXau.hash | 6 +++---
 package/x11r7/xlib_libXau/xlib_libXau.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xlib_libXau/xlib_libXau.hash b/package/x11r7/xlib_libXau/xlib_libXau.hash
index 8d2a6ff43c..799fd39efa 100644
--- a/package/x11r7/xlib_libXau/xlib_libXau.hash
+++ b/package/x11r7/xlib_libXau/xlib_libXau.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-December/003284.html
-sha256  f3fa3282f5570c3f6bd620244438dbfbdd580fc80f02f549587a0f8ab329bbeb  libXau-1.0.11.tar.xz
-sha512  f56abba3bef3fdd4739dfa69367a4251b5fab7c89194c9aece9efa66b9ebbf0736690cc9bd654aab19d9db377e4b9a5268c9c020b3d293bb5351bff5fe75a4dd  libXau-1.0.11.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-December/003570.html
+sha256  74d0e4dfa3d39ad8939e99bda37f5967aba528211076828464d2777d477fc0fb  libXau-1.0.12.tar.xz
+sha512  4bbe8796f4a14340499d5f75046955905531ea2948944dfc3d6069f8b86c1710042bfc7918d459320557883e6631359d48e6173c69c62ff572314e864ff97c5e  libXau-1.0.12.tar.xz
 # Locally computed
 sha256  56abe29bb1d9806a9e04fa9f80fed2c0f18027594df3f098148d814aef6bddfa  COPYING
diff --git a/package/x11r7/xlib_libXau/xlib_libXau.mk b/package/x11r7/xlib_libXau/xlib_libXau.mk
index 0e9f79d38d..9473abdf48 100644
--- a/package/x11r7/xlib_libXau/xlib_libXau.mk
+++ b/package/x11r7/xlib_libXau/xlib_libXau.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XLIB_LIBXAU_VERSION = 1.0.11
+XLIB_LIBXAU_VERSION = 1.0.12
 XLIB_LIBXAU_SOURCE = libXau-$(XLIB_LIBXAU_VERSION).tar.xz
-XLIB_LIBXAU_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXAU_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXAU_LICENSE = MIT
 XLIB_LIBXAU_LICENSE_FILES = COPYING
 XLIB_LIBXAU_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
