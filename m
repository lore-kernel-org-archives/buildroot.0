Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21ECBD25050
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:31:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7D0F61517;
	Mon, 12 Jan 2026 08:31:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id agsxg1oxnNrl; Mon, 12 Jan 2026 08:31:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1EFA0614F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768206704;
	bh=5L+a8bkKmx2C7Mc39zit9A5g5wwMU/MvRF63IPULJ/k=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V3S6OeZLEdRtlCWdEFikpd+eeMdAOdiBU0xb9hVL+QxR9VuMPxA/z3TRfei3lGYWU
	 7CwCNUaw+EcnQ2W3ttiQioNOyh2XZ82RpO+BLBkzVe+ppKoKSN6QI1l4BoRK0gcSUC
	 CAZosUkhsNGBJDlB4MQUjER5GWcfcHbsPLiKeUD1cGa9AZB0LntHUZogW1uGy/BoD+
	 uNsuacKwcJV3cyt5aV47WdjwFR9oOAGCowVhFhZ2C5LqrXOvvu3lhYQPY+hSMhB1yV
	 rd2NHoK/wbs6JUvwbrDCy02VdEnj54eVBcIww3OELFCd0u9+uLvY2l5LU682abKo4R
	 GnwzKc4UCBDpA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EFA0614F7;
	Mon, 12 Jan 2026 08:31:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C22A1CC
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:31:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 33EFD40EE7
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:31:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AbBLDIJK3q7J for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:31:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2D6ED40ED6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D6ED40ED6
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2D6ED40ED6
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:31:41 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F1169A4C3B1C
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:30:06 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJE-000000007z0-39e9
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:29:07 +0100
Message-ID: <20260112082950.2528445-59-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206606;
 bh=8UENjDacPgr5At+T5WAzwDfJqrZyo0Iebym4tZbjJKw=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=TzR8uHsDetDF3Xf0EDCm4dRV/MiHQayVRNOjZaxcISEyAc4FL6MeMlD09kSPxzT99
 7Ah1N4PxKOt14IB0SGz2KA93cGwg7TsRRnQh/s1vsEC92y0lUZ2VdCDEg9AcmHnMnG
 gvh8l+iUelflGJ9e6PSSPxl6RFyL1wtkAk01CWJ2wi+6EyhdRh/1Xr2IjrDSJ/dQKl
 KiL8dkN63FJbZHaM8uT/RMv/H16ROqJyFqTDbPJaduBEiCw0tDWQ4nHbUQmydAhXfw
 6UyR8yEAyfzTPOv2EkkyBthJulYru4206XnZrZ0JPy3FRuhJYOkk7wF9FutgtkovMD
 Q0b2+BuDJO5+g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=TzR8uHsD
Subject: [Buildroot] [PATCH 059/102] package/x11r7/xlib_libXi: bump version
 to 1.8.2
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

https://lists.x.org/archives/xorg-announce/2024-September/003530.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xlib_libXi/xlib_libXi.hash | 6 +++---
 package/x11r7/xlib_libXi/xlib_libXi.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libXi/xlib_libXi.hash b/package/x11r7/xlib_libXi/xlib_libXi.hash
index 545d4881f6..a806235976 100644
--- a/package/x11r7/xlib_libXi/xlib_libXi.hash
+++ b/package/x11r7/xlib_libXi/xlib_libXi.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2023-May/003390.html
-sha256  89bfc0e814f288f784202e6e5f9b362b788ccecdeb078670145eacd8749656a7  libXi-1.8.1.tar.xz
-sha512  a30b1a07e6d710f5196e7477415d68074736f89d954e8f2d5ccc9b5f349e7d1d440c90fb512508176b5db5ecad55608cfb540872936b731963fd83343db3a0b9  libXi-1.8.1.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-September/003530.html
+sha256  d0e0555e53d6e2114eabfa44226ba162d2708501a25e18d99cfb35c094c6c104  libXi-1.8.2.tar.xz
+sha512  6348aae8f595217e26f348184dd594d83af800949f649bfd11b6aef7387faa5624ed18551fe2c3a38c8deab9d7473f72fd7e3e8472cff3ff30d4bb3fb2e6dc31  libXi-1.8.2.tar.xz
 # Locally computed
 sha256  9392174bc86e291369fd2f61f3ed325962735a5f5c585ce8d7ebd365e2a5639f  COPYING
diff --git a/package/x11r7/xlib_libXi/xlib_libXi.mk b/package/x11r7/xlib_libXi/xlib_libXi.mk
index 6ae5ec8be8..f5b0c81a99 100644
--- a/package/x11r7/xlib_libXi/xlib_libXi.mk
+++ b/package/x11r7/xlib_libXi/xlib_libXi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXI_VERSION = 1.8.1
+XLIB_LIBXI_VERSION = 1.8.2
 XLIB_LIBXI_SOURCE = libXi-$(XLIB_LIBXI_VERSION).tar.xz
 XLIB_LIBXI_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXI_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
