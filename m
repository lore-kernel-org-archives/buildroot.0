Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97CA1D2504D
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:22:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FF5084496;
	Mon, 12 Jan 2026 08:22:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id benGTWRjc-c7; Mon, 12 Jan 2026 08:22:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96F6F84502
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768206144;
	bh=nJaHxZMQSKORa4wmzPITSjDFpxlAqo3OdWnIR8ce/qc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZLFGp0wHjhZcYdujQLEgnLXzsFOQbf+dBojMrM934QFFB0XWP1gWLTdsu85Xbe4F+
	 emY3pE9IUF332gfL276PH0xZMYMavIzttPbvVIXgFVCSVnjNMKN5OZBm+RvDRepYaz
	 U0XlwGl+jgJBTJG/etKVG4rVZXIdCGAwsoMYbcb/I+NWa1ZL+8EQojJhL41vVuOCvG
	 V0ULPQwGvvlHVf/PTZ7gEIeZd43Fozv1virAlZqr7IwcdD/lk8kwFT4C03C9qTw5RP
	 /F2DhX9q0vY3uK7Fp8+j+HfNhtf1r730Cv0fN2rb7V5uP3qgYfO2u1pTvN1CxxJBAF
	 of5RAAjZDsLxQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96F6F84502;
	Mon, 12 Jan 2026 08:22:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1443418D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:22:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 062D784505
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:22:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TrlgLlZGRf0s for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:22:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F112B84502
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F112B84502
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F112B84502
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:22:21 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 74177A4C4225
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:05:47 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCuX-000000003M6-10AB
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:25 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:03:14 +0100
Message-ID: <20260112080419.2516889-39-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205147;
 bh=RCeOy7yV5qg6d0zJ5zuncnDS2vivfH7Y5YoX8KP315o=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=Q5o4D0XLl9bHQ057Xh//qivomVXeer9U2+M87qEM1XRNy6kwkt5Yyaq1CSqNdiKaZ
 qufmuhzdGKQCAKI8/XIQQqSWJHp0RzYr0tQscuTGoCxSQu0Bn4xuhtG8K9NZ8Go4h9
 SsVV/eFPh/V2aYjNJ5f8jZNumm0VXwXc3KIrLhPxraXfnr9FoLe0KIIwsrMgVW+Mms
 NtWi6QIDBXLNpnsR6MCIGc6w6kzBqWKLE+Rkg3QU6BrJwCrSLhvHb+J15g8NSmO/S3
 gPa1gP75ugKI9G7TUvsFoVef+L3OY4u1CLfRyoi7J8j4n6KPd/bZSQPc4GL8syQYeH
 5L1Y/xxw4t4Tg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Q5o4D0XL
Subject: [Buildroot] [PATCH 039/104] package/x11r7/xlib_libICE: bump version
 to 1.1.2
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

https://lists.x.org/archives/xorg-announce/2024-December/003568.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xlib_libICE/xlib_libICE.hash | 6 +++---
 package/x11r7/xlib_libICE/xlib_libICE.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libICE/xlib_libICE.hash b/package/x11r7/xlib_libICE/xlib_libICE.hash
index 4a58f97698..67850b6589 100644
--- a/package/x11r7/xlib_libICE/xlib_libICE.hash
+++ b/package/x11r7/xlib_libICE/xlib_libICE.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-December/003288.html
-sha256  03e77afaf72942c7ac02ccebb19034e6e20f456dcf8dddadfeb572aa5ad3e451  libICE-1.1.1.tar.xz
-sha512  2f7833a25f31cc743ca95cb88f9a8403b50e19ffb5bf43bfef87ba405857d359789daaa9ec2391351237d958f16d35dbf082adb76d301e46d3a54162a6b452d3  libICE-1.1.1.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-December/003568.html
+sha256  974e4ed414225eb3c716985df9709f4da8d22a67a2890066bc6dfc89ad298625  libICE-1.1.2.tar.xz
+sha512  340f51ffa1f14ed442ab8bcea92dd63df147c48242e232e818cafe02f43de7ab6e99c5430b9cb8d0dc661295239d2b3f6bdb6a092ce51a98afa06235257e9b1f  libICE-1.1.2.tar.xz
 # Locally computed
 sha256  60105b7ea93cb07a67fee8443b092b727e3db7f0dff4fbe05bc6cd7747fb53c8  COPYING
diff --git a/package/x11r7/xlib_libICE/xlib_libICE.mk b/package/x11r7/xlib_libICE/xlib_libICE.mk
index d92e81c0ab..60b16b47e9 100644
--- a/package/x11r7/xlib_libICE/xlib_libICE.mk
+++ b/package/x11r7/xlib_libICE/xlib_libICE.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBICE_VERSION = 1.1.1
+XLIB_LIBICE_VERSION = 1.1.2
 XLIB_LIBICE_SOURCE = libICE-$(XLIB_LIBICE_VERSION).tar.xz
 XLIB_LIBICE_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBICE_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
