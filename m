Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7287AD25050
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:49:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A93A61535;
	Mon, 12 Jan 2026 08:49:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nfRj9HLNDAYP; Mon, 12 Jan 2026 08:49:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 624456156F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768207776;
	bh=Bcm3noOFXqDyoxbY+oEkeBniqjzoVfod/KuBAZyMbpY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LOQ4/QlQSJ3au79qYHUa1mNx7jY2OXr3RZBCR9W7tXUbCsvXKFOpmGe77VA1Dctar
	 EGeRT6kIVgifeDvUzRUqoDT8gOq75ObdYAqGGXe08PxT0DiNfcKmjG946Wexurld/6
	 ezeNiqxaWeWFaU1prgjabGc3ZC2e66kt1/HORoXEI1Jq3vOv03hgANOeBwlPSakXfp
	 hHzr1hiOO292GwXp00ah+WIBCg+HBAUndhfcXO7Ky0dfZYJaP8qPqsFjxwk/1Wn9Yw
	 4WZIIiSvBAqOwRV30hP7jlKXE4aBpfE09rlYfM8Q3DhPfu63bqsG6gNvLCec7k13jF
	 2NYou4LOeN6mQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 624456156F;
	Mon, 12 Jan 2026 08:49:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 732C31CC
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:49:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 59E2761535
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:49:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gFakBuSdcnn6 for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:49:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4491D6156F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4491D6156F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4491D6156F
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:49:34 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AAFEEA4C4237
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:31:11 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJE-000000007z0-0WoG
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:28:58 +0100
Message-ID: <20260112082950.2528445-50-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206671;
 bh=YHJwX/xtQ1OG3ILYD76NR8GaxiH+bbEeDeMZ1ae9Wjc=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=RTV+p+PZI9AIyLcfx2NL64rzywcDh4VmZ/NfDVrbKfs6dk/gG0qCo34b3roCDfdbM
 g03859SQ4/OtQ3SCxiyLemck8rX68cKL7RNNk5a1T2kc6IdbcxhayK+LiZRDG7AdU3
 z3V3hqe//dTSroc1mNhq9TlcwQaY44oVmlXA59wpAxEmfICI5qRffbjaOPYhai0U2v
 avJNnWcnfbJS2BBovnzmUPflITLP4Gs2oQDa6ecMPeTehbP36aF0WD+T+t+npWuEWP
 562bU/tM/2oivPSnKSH3nFJKwivlgedsaHXyxBn3QT7b+eDt3kaXfosGtd6wP6ZxIE
 aFPugb7rV5bUw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=RTV+p+PZ
Subject: [Buildroot] [PATCH 050/102] package/x11r7/xdriver_xf86-input-evdev:
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
