Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B9CED2504D
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:21:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4F9761466;
	Mon, 12 Jan 2026 08:21:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QZnxj1V3FO0x; Mon, 12 Jan 2026 08:21:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED535614C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768206083;
	bh=K3Iyw++8696SQadhawCqeF30MuMOU+i75IhCU3q9D4U=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xwid39MTToLdmpbkgxvk2Jt0pB7CV1ScjX2E8YGbHoWXhbJINKCSLyTZzDkLmutzD
	 5uRS73Fc9/9v03yIdGDpKi/vMUCBegarLS14jpp8B0Dmg+jQlQy2WylRL2Apa+2NNt
	 Sbq7hogPo13XzhAVH6ojgpTJ6h+3sRmEyqeglzTo+ftAowDvQsKHOfIqxhbqQd3EJc
	 qQ84UpTEgJ/tQYq7cs41/zhpPYQf5VjiDaktlr0rCYAtcrQzaVrG/vNOYPUWFxuKy5
	 dzHbRAUevseRX9VK36GVKR0hbPVXqXGBC3gXcoVHKNlixm5W4nLTxnitor2MeH3oQK
	 XA1nK1CeBw93w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED535614C0;
	Mon, 12 Jan 2026 08:21:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 33A1118D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:21:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2554C80F1C
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:21:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G-sd_2wkw6KK for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:21:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E1D0980F11
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1D0980F11
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E1D0980F11
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:21:20 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C72B8A4C41A2
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:05:46 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCuW-000000003M6-3YHe
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:03:09 +0100
Message-ID: <20260112080419.2516889-34-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205146;
 bh=1RKXa53ge4kxPZBnrpJZPzhlX/MbbtTNeBRrpetEaRI=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=aLsxUggkaJSCla8qglUp664c9E/exUgL3DxLPoa+Qu8VrD3W0fW/JvDfDfKXCo4Bp
 lwBcXSE+Kwq7RLtkibpWllzctERMg1mE63Hdk7FNNM9j2kryzflwW7U6CnUVXDkLzR
 330xu+yqEHQgjOAPNFlKU8jfkt03QjtaahRlAITUCTE+ZEP3KJH9gW3Rv8b1xB6e/r
 RJUXTUgcbtsvYkdTSSd2TwOu9UvWkHJEj38O+eI4C/orb6xrwmqGDIrV31+V0qGaph
 99RzdGHyASP+7MVC1++/ucO22dNrhWSsMqBW7rrXov+2hJxNCqOYjaVtE/d6Z4PI5V
 bsv7K2KKdQXMg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=aLsxUggk
Subject: [Buildroot] [PATCH 034/104]
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
