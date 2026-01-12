Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E2D2D25049
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:20:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1552A8446D;
	Mon, 12 Jan 2026 08:20:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zPYLr7yDCvX0; Mon, 12 Jan 2026 08:20:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F843844CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768206023;
	bh=PmB1nUzpTVLawcN+NVmfEO3LzcnKn19x2kfsyMBionU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p775qPdEeWybqZHq/UUeHrNzgD35ZEFIFkrY+1ZZwsUZ9eYjlG8a8VsfsFTOpsgsp
	 IMCZMsCpMsLyfVC8eh4eRgSBJRYZbB3OqXOHY92m5Xq8c0PazYRUlG07syX3eVaDYt
	 uAKt1TaR8xe+i16NGQWChILbENzDhDLvZiD9TJKgejpwtpM3zlsrKgFunhs9OQMxMa
	 //8gfM3VO5uVs0QMQI0H6Em84eBbWxwwvWlMn+tBjnu6X/rbdNj3gmWqJCAN91iL4V
	 /n1tucVCaj49B9oA+MyoQZ250RhhJKbMkjKA2IrVfT88/aVcCQYgeJ0XJ048TtZ7RO
	 JacRLuQ+tdQeA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F843844CA;
	Mon, 12 Jan 2026 08:20:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id ACDD012E
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:20:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 93334614EC
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:20:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bfldn4Ha7aB2 for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:20:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8B52761466
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B52761466
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8B52761466
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:20:20 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B2CDFA4C4175
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:05:45 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCuW-000000003M6-253N
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:03:04 +0100
Message-ID: <20260112080419.2516889-29-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205145;
 bh=DWRBLQC4Ck0eKUylhw4GQmAva7ibGOLffuJMAu5HDEk=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=X+Z50NZ52as8e887OZnvBI95MU/nWbZ5sjD5XXVbLckEBMNPaOw0XNiGTWy13bfXs
 1U5Izy0CezLHFjY17F+4Nd71AQLsUN4/IsAuj1/MgcO0CzgtYRpbdcvAj4dyDptvUZ
 yQ3JjVXSBnDK32kWJmHObEmyeSUpKvgcHkFDcU+AEQPxagrzVLC6/jedfFXHRBCNQ+
 YKNbEzwSw7MX+WJY3/nA91KiHvEH/yVqcARn7qiCkpebY+nKw31zgoAEjPXjTIB+Qv
 2ZOSNrLYG1rkIr9jtGIZJt3yFexCwxXtMAWp78Imye1JWpGu9mLUeurYWja5kLcO4E
 jbSlEI0MqH78Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=X+Z50NZ5
Subject: [Buildroot] [PATCH 029/104] package/x11r7/xlib_libXft: bump version
 to 2.3.9
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

https://lists.x.org/archives/xorg-announce/2025-April/003597.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xlib_libXft/xlib_libXft.hash | 6 +++---
 package/x11r7/xlib_libXft/xlib_libXft.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libXft/xlib_libXft.hash b/package/x11r7/xlib_libXft/xlib_libXft.hash
index 749aa0ad62..5b0d466c8b 100644
--- a/package/x11r7/xlib_libXft/xlib_libXft.hash
+++ b/package/x11r7/xlib_libXft/xlib_libXft.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2023-April/003384.html
-sha256  5e8c3c4bc2d4c0a40aef6b4b38ed2fb74301640da29f6528154b5009b1c6dd49  libXft-2.3.8.tar.xz
-sha512  fc385d73e1acb701942c154ffb5a283d17891f21d3ac598c4a3fb375a7d6082734593062368c15cad67c1a94177dd15deed878ec5ea852188393b52e92c372c8  libXft-2.3.8.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-April/003597.html
+sha256  60a25b78945ed6932635b3bb1899a517d31df7456e69867ffba27f89ff3976f5  libXft-2.3.9.tar.xz
+sha512  493e4475c0eeab04a510819446eaa871ba9e1695e42d05bb7791d2ed59f7faff31e910dae95efa4b0ac4a7a2da38614b5740a4ca9388134bea80d348e9ad57e5  libXft-2.3.9.tar.xz
 # Locally computed
 sha256  7cda22286b1379b9b73df695f72cbad36595e65b039a5fbc5c89b69ecc44438c  COPYING
diff --git a/package/x11r7/xlib_libXft/xlib_libXft.mk b/package/x11r7/xlib_libXft/xlib_libXft.mk
index 154c220aa1..59777776ee 100644
--- a/package/x11r7/xlib_libXft/xlib_libXft.mk
+++ b/package/x11r7/xlib_libXft/xlib_libXft.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXFT_VERSION = 2.3.8
+XLIB_LIBXFT_VERSION = 2.3.9
 XLIB_LIBXFT_SOURCE = libXft-$(XLIB_LIBXFT_VERSION).tar.xz
 XLIB_LIBXFT_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXFT_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
