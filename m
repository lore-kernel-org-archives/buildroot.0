Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E36E0D25050
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:39:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B98CB61565;
	Mon, 12 Jan 2026 08:39:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X0hX6DrnQS81; Mon, 12 Jan 2026 08:39:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A65566152D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768207160;
	bh=/fi4a+2UZWcAObFFal1jV4ojdQ0GJpZCi3oJzrBcj5E=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EYIQH1+RkIVVC8pehfSSP04QLVNPax+wDKu0IHHyeo0FjrcS3PXWV3utKkYF3c6eZ
	 /Jl9ad8Cxyg0hDQLAW2CmawRcmgZ95akHtSRZW7woijNnl9wU1/L1nnDpYS2C5N2Lx
	 XO0qkpGZQygsSo55CQXhwnU08nuUjsLJlJjXScqxQW8Dx+u9fAvThs9xAAoW/cgo8R
	 2cmGxAqzdN9j4M+TITcpzw0ay+g+HwwfralCx0Tu3R6ZH04AB29ZY2yLSviOgvlL0y
	 0I+8LQCc1qHJHimK0MphqS0vc6nYbtuiCodiX9X74gAcZOPXsZg/t5aHpamR9IfgmY
	 7qWjHVi7iduDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A65566152D;
	Mon, 12 Jan 2026 08:39:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 20FE918D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:39:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1314141667
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:39:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PgYkjSUSc6J4 for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:39:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 09B6B4004D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09B6B4004D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 09B6B4004D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:39:17 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BA008A4C3D2E
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:30:36 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJH-000000007z0-1Idl
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:59 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:29:45 +0100
Message-ID: <20260112082950.2528445-97-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206636;
 bh=Rn/O7leaZolzd4Qh5s/lmsj6DFB+WSYnwgY3MmxV3EE=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=INjVOWAlp1wpSjBpviFNsBQ+2xZnsfmmA3v997NWZ52ZmlD7k+7hdijbhftiz95cN
 c+sgVnBpaB849zXgjL1g7pfqCxFmIt48nQk7UtCblL3qOWeENs+vTOIJH8O6YCcH5g
 i9H/KQqe5yd9XGgrLs2CMHKF8e4aBAf5phGn4UzusFhxvP73DbyLPvaMy0K6mFyDhd
 +HTJDCL/KUtRyTkkKO9SjzG1yIfVdlY0F9UUbmyLw2RZ/AlwBO/v5T8/KaPhPx8wRl
 tW4Ma/gAtYaNTasB/ykqEdkO9hXrYdJCjHwoy7NLPKgqNvUodJxoFLen2zL65hsWtn
 rj4cffGcGYO/A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=INjVOWAl
Subject: [Buildroot] [PATCH 097/102]
 package/x11r7/xdriver_xf86-input-libinput: bump version to 1.5.0
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

https://lists.x.org/archives/xorg-announce/2024-October/003543.html
https://lists.x.org/archives/xorg-announce/2023-August/003417.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../xdriver_xf86-input-libinput.hash                        | 6 +++---
 .../xdriver_xf86-input-libinput.mk                          | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
index cca2639dc3..2f6622ed58 100644
--- a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
+++ b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2023-April/003378.html
-sha256  1446ba20a22bc968b5a4a0b4dbc3b8e037c50d9c59ac75fa3f7fc506c58c1abb  xf86-input-libinput-1.3.0.tar.xz
-sha512  f81f408b37e5f98ee97337dc4da6e78449e554e0ab2a3c6791b089d2cb6d645d0206ddf9babbc2120ab8bfe3b1489314fe42503ee015cec41775024538f3a34f  xf86-input-libinput-1.3.0.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-October/003543.html
+sha256  2524c35f196554ea11aef3bba1cf324759454e1d49f98ac026ace2f6003580e6  xf86-input-libinput-1.5.0.tar.xz
+sha512  03090beb7c162fdf55e9bb9da41ffb8601b20047e4a53895bad27de47b3197fc920e710f26fa23e7322b367ab65fa56ba5f9a195ec69801529af3958632c2d6e  xf86-input-libinput-1.5.0.tar.xz
 # Locally computed
 sha256  4114220b281561e80f3422f0e7ae8d3e1fc85131ffc2e3b6265119e66f1adb27  COPYING
diff --git a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
index 381df31fee..4e2f48c947 100644
--- a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
+++ b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_LIBINPUT_VERSION = 1.3.0
+XDRIVER_XF86_INPUT_LIBINPUT_VERSION = 1.5.0
 XDRIVER_XF86_INPUT_LIBINPUT_SOURCE = xf86-input-libinput-$(XDRIVER_XF86_INPUT_LIBINPUT_VERSION).tar.xz
 XDRIVER_XF86_INPUT_LIBINPUT_SITE = https://xorg.freedesktop.org/archive/individual/driver
 XDRIVER_XF86_INPUT_LIBINPUT_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
