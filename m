Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC072C0015E
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 14:06:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7973F41526;
	Sun,  6 Aug 2023 14:06:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7973F41526
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 68aN7C1BIgaZ; Sun,  6 Aug 2023 14:06:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3516D41369;
	Sun,  6 Aug 2023 14:06:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3516D41369
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 781B21BF340
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 14:05:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F1170606BF
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 14:04:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1170606BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kfjMRE3H9hQd for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 14:04:25 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E3C0E60AAC
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 14:04:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3C0E60AAC
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3FCE6A4C10EA;
 Sun,  6 Aug 2023 16:02:44 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46282)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qSeLD-0000Bn-3D;
 Sun, 06 Aug 2023 16:02:44 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  6 Aug 2023 16:02:37 +0200
Message-Id: <20230806140241.4155773-9-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230806140241.4155773-1-bernd@kuhls.net>
References: <20230806140241.4155773-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691330564;
 bh=7eV1+/rVnVT6Z06r5AdIDympo4hrI6ROZTMRjohOBm4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AdqwQg9uGFP2+ZSbPoCCZDJITBtitOMiCueAQ/eOFeRcPFrlteiJVKJw48Hhoz0/8
 GA8xxzgovHZEMfQqXBTkSknJ9OKW1Jbv6lCya4Hi4DgxxXDU/WZg5ONB/UyCpj+L4G
 gBOokbI6jE5nKH+OK5ErGf0WgqujAaphZAQdZspY5mzqEBHhN5PHb06/OiFBE7lnBx
 z3zVk9Slb8AfFp5bfJYAt7ndzUTxi+/TG2pKlP2oagv0aJsq3bYomuQ6Rszq8D1AMd
 T8Gi/jFfaQ8AbqFG9+GjikhkovIEXSN40Kst3+g5/gpaecElVdkGHmFlVM+rIBOmvM
 l4tPekGODTIVQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=AdqwQg9u
Subject: [Buildroot] [PATCH/next v9 08/12] package/libinput: only needs
 libudev, not udev daemon
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Sen Hastings <sen@phobosdpl.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Norbert Lange <nolange79@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libinput/Config.in   | 10 +++++++---
 package/libinput/libinput.mk |  2 +-
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/libinput/Config.in b/package/libinput/Config.in
index 1a8fcc7ed4..df1cff260f 100644
--- a/package/libinput/Config.in
+++ b/package/libinput/Config.in
@@ -1,8 +1,11 @@
 config BR2_PACKAGE_LIBINPUT
 	bool "libinput"
-	depends on BR2_PACKAGE_HAS_UDEV
+	depends on BR2_USE_MMU # libudev <- eudev/systemd
+	depends on BR2_USE_WCHAR # libudev <- eudev/systemd
+	depends on !BR2_STATIC_LIBS # libudev <- eudev/systemd
 	select BR2_PACKAGE_LIBEVDEV
 	select BR2_PACKAGE_MTDEV
+	select BR2_PACKAGE_LIBUDEV
 	help
 	  libinput is a library to handle input devices in Wayland
 	  compositors and to provide a generic X.Org input driver.
@@ -35,5 +38,6 @@ config BR2_PACKAGE_LIBINPUT_PYTHON_TOOLS
 
 endif
 
-comment "libinput needs udev /dev management"
-	depends on !BR2_PACKAGE_HAS_UDEV
+comment "libinput needs a toolchain w/ wchar, dynamic library"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index a4d30b5910..ff7b75077b 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -7,7 +7,7 @@
 LIBINPUT_VERSION = 1.23.0
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.bz2
 LIBINPUT_SITE = https://gitlab.freedesktop.org/libinput/libinput/-/archive/$(LIBINPUT_VERSION)
-LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
+LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev libudev
 LIBINPUT_INSTALL_STAGING = YES
 LIBINPUT_LICENSE = MIT
 LIBINPUT_LICENSE_FILES = COPYING
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
