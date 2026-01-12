Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53CB6D2503F
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:06:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27D4D809AB;
	Mon, 12 Jan 2026 08:06:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mtiMheCjv1Z2; Mon, 12 Jan 2026 08:06:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C83C880884
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768205176;
	bh=liBaAAiuM7AASVY3Ft0G1i7X7FinamN67NsBtuSNEBg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pbm8OOXc/KJYx1Yo0Sjq8qintTsbH99A0/51IIWnbdpS//6iPwtscFBTaB0BRgHC9
	 h0pZz43ifI/s7WFfR11UHxBCrY+NFuNGg+xV5HgZQo28HYMYXIRbay64dGlmVEt9Vg
	 gNkUPaMKbCRPTr85KDudEzkehLtxnWxndxReA4fHNy7lOjMNvhrZRCIe4mOWtzvnX3
	 pW3Fzecwte3n3hMNzWRtBF99L5BvQ2atNFft70oFm36jvuf8W0HIWxbaNR3Fz/rjm6
	 cOLp8mChtz9hsNzSnz6GuxX4yVAEEa/bTe/NEbSHuxctOj1X2KZyGQUqikBtZAIEKf
	 qxmnM2lLiS/jA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C83C880884;
	Mon, 12 Jan 2026 08:06:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DC9718D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E99B415C9
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:06:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lqaIw7PFcP4c for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:06:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EB194415C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB194415C1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EB194415C1
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:06:13 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 81FCEA4C41A7
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:04:43 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCuY-000000003M6-2QBX
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:03:33 +0100
Message-ID: <20260112080419.2516889-58-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205083;
 bh=aWTzovUFjh6qC6Ae61adRNlLjiQ1F/kt0xuBfcIywbc=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=T/yuXCHy6wcIcT5qrZUJA1+VKJAKksW9x6x7WlLBIEJq6+Bn+/YZOy9d/pl7qpGUr
 lKOVCxLDE3DFTFx9ovT/Ev3zIHihhu4ZNzdZwo4csRmOnHqCwfzzYDzwBZdccB8aNl
 2mKs5Cib+lQkBE6WkM9ZWBUPbX/Mv/s+jzhijwC1Oh8bbuiVYalrBA7RZke4nR837M
 C/ED9Dws5LtKE6GYuPtaUmbDfmUjN+lUUyxFDs3qLpsLQIIIz4vGAporNOGZwrNGNF
 uZPtPfmk6tWGWkNaNSe4dmVpLef3hW6e71VYXvIJxu+E0xAZQ31GyB64OBOs1Yi35k
 TSQibvB9euSqg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=T/yuXCHy
Subject: [Buildroot] [PATCH 058/104] package/x11r7/xapp_xkbprint: bump
 version to 1.0.7
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

https://lists.x.org/archives/xorg-announce/2024-October/003535.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_xkbprint/xapp_xkbprint.hash | 6 +++---
 package/x11r7/xapp_xkbprint/xapp_xkbprint.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_xkbprint/xapp_xkbprint.hash b/package/x11r7/xapp_xkbprint/xapp_xkbprint.hash
index 8ca7656b5c..180216139d 100644
--- a/package/x11r7/xapp_xkbprint/xapp_xkbprint.hash
+++ b/package/x11r7/xapp_xkbprint/xapp_xkbprint.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-October/003222.html
-sha256  99cc9404f7b90289ae04944c0d98a208cc8b158492ad6481386e31d4d09aa7b0  xkbprint-1.0.6.tar.xz
-sha512  a1c2401b2a2ef4c6bd2efc18923ecb176adcf38b6c5dfdce25f22f1f5ab21e25f494b25dac25b1765fb9a0f6acc24d191cd41b9a098a9e3c6eaf9a9df490be29  xkbprint-1.0.6.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-October/003535.html
+sha256  1c4f49c030329e0defd8c7bc3739e60f2aa1d2aabe0e2d7e63740ab629aa59cc  xkbprint-1.0.7.tar.xz
+sha512  52f803ba85b053408dfff400f47ae9461954430665a12257a99b9775e26dd7192a97b979de949b9c4532936c9bfcc181a773de41514a122973f05d676dee6476  xkbprint-1.0.7.tar.xz
 # Locally computed
 sha256  79b32f28f7f5063054a564e1fdeee56f82a525b6516303704a1f70e55fe7197e  COPYING
diff --git a/package/x11r7/xapp_xkbprint/xapp_xkbprint.mk b/package/x11r7/xapp_xkbprint/xapp_xkbprint.mk
index f374c18dae..680a1d9f67 100644
--- a/package/x11r7/xapp_xkbprint/xapp_xkbprint.mk
+++ b/package/x11r7/xapp_xkbprint/xapp_xkbprint.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XKBPRINT_VERSION = 1.0.6
+XAPP_XKBPRINT_VERSION = 1.0.7
 XAPP_XKBPRINT_SOURCE = xkbprint-$(XAPP_XKBPRINT_VERSION).tar.xz
 XAPP_XKBPRINT_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XKBPRINT_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
