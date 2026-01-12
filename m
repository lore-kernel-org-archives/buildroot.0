Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52FBCD2504D
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:24:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D4E180F88;
	Mon, 12 Jan 2026 08:24:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qe51IhtLQ0OJ; Mon, 12 Jan 2026 08:24:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CDC5844BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768206289;
	bh=Bcm3noOFXqDyoxbY+oEkeBniqjzoVfod/KuBAZyMbpY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a2VySRmZioinU38dUTbZz4DAAOEczlovbzMrc/lOV6La45PpLV1qxncuMxQG0C8up
	 JgpItGni7wTHf8eO5jaYwoThPoZS49YGZ/V5OqF0Z2AnJHFlSibEoDJpAvka9PwcIH
	 KmyWwdVcsichReOfovj+oPq16qgY6h8BoBYkNWsV+6xzoYfacx0hmMkdiJrN0QBM+S
	 FWKWLf2qJFvIIp9Ms5nKXIDPCwifwXS26s9n95IrHc4+2TJf+XUrOMOzbn8NnPLH6i
	 MYRysppFgTFQ1xlNA0Uz3dz83ohvUthozATvu98pWEzRn1BmVkLODf9Gd1nZxAHO8K
	 KWO4xjVUfoG8A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CDC5844BC;
	Mon, 12 Jan 2026 08:24:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BB7F718D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:24:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD36B84546
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:24:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s2hj-Auw0uPV for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:24:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9EDAC844BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EDAC844BC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9EDAC844BC
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:24:46 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7956CA4C423A
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:05:48 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCuY-000000003M6-0HvV
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:03:26 +0100
Message-ID: <20260112080419.2516889-51-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205148;
 bh=YHJwX/xtQ1OG3ILYD76NR8GaxiH+bbEeDeMZ1ae9Wjc=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=QNWu2ibBfkNDzfSgIeKU47VdRL/bXUNZTsC4FvuWySwF56WuKRm6it3ne0ioXL0rc
 avKN8zFJUUAXou3qaoiv/vL5qW6DXtprr9YOyKQ70Onw10od2Rl+Qj/Js3eC7ni+5F
 Gmvyw8VShB0dkrsaeKRiEGehBoe3M3tsjV08J3NyA/D93SUm1sSOB7O32g12ewWbKz
 T8go66JVXR3ufF/4dvJgLw7N6GDC2hQLkrKmBms30JCd4biTnm0B1AWKFRlC6y9Ca1
 2e3v8TZEdSx7AEYNHkFqqzIuxY0tq9Q9bfnOF8iElA3AkTyMnfEpzCEfLfi0MPYdeM
 37a/Z3FdHKimw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=QNWu2ibB
Subject: [Buildroot] [PATCH 051/104] package/x11r7/xdriver_xf86-input-evdev:
 bump version to 2.11.0
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

https://lists.x.org/archives/xorg-announce/2024-October/003544.html

Switched tarball to xz.

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../xdriver_xf86-input-evdev.hash                         | 8 +++-----
 .../xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk  | 6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.hash b/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.hash
index c80eaeb9fa..5d02514294 100644
--- a/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.hash
+++ b/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2018-May/002898.html
-md5  e8bd1edc6751f92e425cae7eba3c61eb  xf86-input-evdev-2.10.6.tar.bz2
-sha1  660de292d5a40e2b8f385965c6a4e149c981ba59  xf86-input-evdev-2.10.6.tar.bz2
-sha256  8726073e81861bc7b2321e76272cbdbd33c7e1a121535a9827977265b9033ec0  xf86-input-evdev-2.10.6.tar.bz2
-sha512  560b0a6491d50a46913a5890a35c0367e59f550670993493bd9712d712a9747ddaa6fe5086daabf2fcafa24b0159383787eb273da4a2a60c089bfc0a77ad2ad1  xf86-input-evdev-2.10.6.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2024-October/003544.html
+sha256  730022de934cc366bb12439daf202a7bfff52a028cf4573e457642e25a071315  xf86-input-evdev-2.11.0.tar.xz
+sha512  ccd3727d9726565259a81db1c238aba7e414292c3f91e182c048845ac3caf1705c2b16ff1775f3b35ecb3b7088903257085bc90a20265641ccde05b2fc6966df  xf86-input-evdev-2.11.0.tar.xz
 # Locally computed
 sha256  f6b9b4732932434cad03b29cb3151d20edcf7d6e5681f40ee3c47f03dbd92dc9  COPYING
diff --git a/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk b/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
index 28923cb2a1..b40a44bf30 100644
--- a/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
+++ b/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_EVDEV_VERSION = 2.10.6
-XDRIVER_XF86_INPUT_EVDEV_SOURCE = xf86-input-evdev-$(XDRIVER_XF86_INPUT_EVDEV_VERSION).tar.bz2
-XDRIVER_XF86_INPUT_EVDEV_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_INPUT_EVDEV_VERSION = 2.11.0
+XDRIVER_XF86_INPUT_EVDEV_SOURCE = xf86-input-evdev-$(XDRIVER_XF86_INPUT_EVDEV_VERSION).tar.xz
+XDRIVER_XF86_INPUT_EVDEV_SITE = https://xorg.freedesktop.org/archive/individual/driver
 XDRIVER_XF86_INPUT_EVDEV_LICENSE = MIT
 XDRIVER_XF86_INPUT_EVDEV_LICENSE_FILES = COPYING
 XDRIVER_XF86_INPUT_EVDEV_AUTORECONF = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
