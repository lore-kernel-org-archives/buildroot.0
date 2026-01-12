Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D209FD25050
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:30:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8F55614C9;
	Mon, 12 Jan 2026 08:30:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JQSM4cYFaJg3; Mon, 12 Jan 2026 08:30:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B06EB614E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768206631;
	bh=K3Iyw++8696SQadhawCqeF30MuMOU+i75IhCU3q9D4U=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Js1k14AB13AhFgH7TwNS69XfyNyEJg9oTa6o+JeG2VFAe3I8XZ2v1pU5zjzs4Mkcr
	 wG0Oe8YrU7CqbOuv1if/L8OqIk2zk7g9EhD1s74+wq4k0UBEmX+8xjaD5wuenv6HSD
	 +ZsfWBmathDHmt/fLy+iYcBgDabE8h0Ao1mzBuPE4sWFrI+lqLFKxmqdUPh6uPocks
	 8NkQM9PU3l3kn85cCMx9VKdj93hUCSpLhdvbi2UQSai8IC0yhaHlC6FRr2co8ejVKP
	 uAMRdOETiDuXTuO2ZeBzaBqgVVc/357dv8Dghy20tXn2WYQQot2Y6pTN2GOl5KO1rr
	 DEOJg+OFxnZIg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B06EB614E2;
	Mon, 12 Jan 2026 08:30:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A75CF1CC
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:30:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A4638614E2
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:30:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y4gDRLmL-fWr for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:30:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8D01A614C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D01A614C9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8D01A614C9
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:30:29 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E3F0EA4C3ADD
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:30:01 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJC-000000007z0-42Ax
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:28:41 +0100
Message-ID: <20260112082950.2528445-33-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206601;
 bh=1RKXa53ge4kxPZBnrpJZPzhlX/MbbtTNeBRrpetEaRI=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=O8PIq0MHMYJ+TyZ4Qk22AlDeT1vz1MhN+61XaLknCWWD8bOkjdv4pDg8GrauaF5Mw
 sn5UAB6CZenQMd+BSTPkDvbaphi8ImxH184/qq5i5MAV45nbInNP4g1w//Y7cmy2lB
 P/w4tciwDXODMbUW4NCaXxmUb1oXsOvfgJW3SdjXHZw8fK4L5qpBXDZiuIL2g1xjdW
 Hh0XsLPZ+iehqKBteWvO/oLZESA8TMPYXx8sasrDKyvLT2OqTXv2nfb1H6356CfG4C
 gobnycwnxRRDoth2QDGtKdFR3xBhs+JW8jAXIFv5Wu0eMTXpD69UOdhLVXdAlYeADO
 tj+acB5o9rx4Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=O8PIq0MH
Subject: [Buildroot] [PATCH 033/102]
 package/x11r7/xdriver_xf86-input-synaptics: bump version to 1.10.0
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

https://lists.x.org/archives/xorg-announce/2025-January/003578.html

Rebased patch 0001 due to upstream commit:
https://gitlab.freedesktop.org/xorg/driver/xf86-input-synaptics/-/commit/64407e809dd7a75516acd3178aa77db7dc04e19d

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../0001-build-get-rid-of-sdkdir.patch                    | 8 +++++---
 .../xdriver_xf86-input-synaptics.hash                     | 6 +++---
 .../xdriver_xf86-input-synaptics.mk                       | 4 ++--
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-synaptics/0001-build-get-rid-of-sdkdir.patch b/package/x11r7/xdriver_xf86-input-synaptics/0001-build-get-rid-of-sdkdir.patch
index 62950b0667..9e0eb29d04 100644
--- a/package/x11r7/xdriver_xf86-input-synaptics/0001-build-get-rid-of-sdkdir.patch
+++ b/package/x11r7/xdriver_xf86-input-synaptics/0001-build-get-rid-of-sdkdir.patch
@@ -11,6 +11,8 @@ appended in the target:
 Other drivers (e.g. keyboard) got rid of sdkdir. Do the same.
 
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+[Bernd: rebased for version 1.10.0]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  Makefile.am          | 1 -
  configure.ac         | 9 ---------
@@ -34,9 +36,9 @@ diff --git a/configure.ac b/configure.ac
 index 970dd5f..574353b 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -55,11 +55,6 @@ XORG_DRIVER_CHECK_EXT(RANDR, randrproto)
+@@ -60,11 +60,6 @@ XORG_DRIVER_CHECK_EXT(RANDR, randrproto)
  # Obtain compiler/linker options for the Synaptics driver dependencies
- PKG_CHECK_MODULES(XORG, [inputproto >= 2.1.99.3] [xorg-server >= 1.12] xproto inputproto $REQUIRED_MODULES)
+ PKG_CHECK_MODULES(XORG, [inputproto >= 2.1.99.3] [xorg-server >= 1.18] xproto inputproto $REQUIRED_MODULES)
  
 -# X Server SDK location is required to install Synaptics header files
 -# This location is also relayed in the xorg-synaptics.pc file
@@ -46,7 +48,7 @@ index 970dd5f..574353b 100644
  # -----------------------------------------------------------------------------
  #			Configuration options
  # -----------------------------------------------------------------------------
-@@ -154,10 +149,6 @@ if test "x$have_libxtst" = "xyes" ; then
+@@ -159,10 +154,6 @@ if test "x$have_libxtst" = "xyes" ; then
  fi
  # -----------------------------------------------------------------------------
  
diff --git a/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.hash b/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.hash
index 97d55f2e2d..2cfb3d39ff 100644
--- a/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.hash
+++ b/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-July/003181.html
-sha256  b8fa4aab913fc63754bbd6439e020658c412743a055201ddf212760593962c38  xf86-input-synaptics-1.9.2.tar.xz
-sha512  6fd46505f22bba79f612fbd48dddd4818f7d874cc29caac71840744de27f1d224c68861e3a18d2a866b78178924d2f093f5260e27b221aa1fb17dbc09d66b649  xf86-input-synaptics-1.9.2.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-January/003578.html
+sha256  e0c26adb068edd0869f87a87f5e9127922d61c0265d7692a247a91a5cc1bb5c2  xf86-input-synaptics-1.10.0.tar.xz
+sha512  deb14ba039f423c4575825ecdeb74f31e30f044a4efc7dae9c1634f841dcf7066970cd470be7e63f68eccd4899e0434d602e59c297042cb2f38ff2a3a02d7e91  xf86-input-synaptics-1.10.0.tar.xz
 # Locally computed
 sha256  e14dc9a27158cadaeea8bcc2c70069762f05adb29030a444336bfde268751dc7  COPYING
diff --git a/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk b/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk
index 888f60b2fb..5a4e528b50 100644
--- a/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk
+++ b/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_SYNAPTICS_VERSION = 1.9.2
+XDRIVER_XF86_INPUT_SYNAPTICS_VERSION = 1.10.0
 XDRIVER_XF86_INPUT_SYNAPTICS_SOURCE = xf86-input-synaptics-$(XDRIVER_XF86_INPUT_SYNAPTICS_VERSION).tar.xz
-XDRIVER_XF86_INPUT_SYNAPTICS_SITE = https://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_INPUT_SYNAPTICS_SITE = https://xorg.freedesktop.org/archive/individual/driver
 XDRIVER_XF86_INPUT_SYNAPTICS_LICENSE = MIT
 XDRIVER_XF86_INPUT_SYNAPTICS_LICENSE_FILES = COPYING
 XDRIVER_XF86_INPUT_SYNAPTICS_DEPENDENCIES = libevdev xserver_xorg-server xorgproto mtdev
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
