Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D8AFF885D
	for <buildroot@archiver.kernel.org>; Sun, 26 Apr 2026 14:31:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C317D84767;
	Sun, 26 Apr 2026 14:31:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qC3hR4AYy_qN; Sun, 26 Apr 2026 14:31:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D128284768
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777213876;
	bh=xVhb1ys0EDrdFnNkKUa/dw7CY4vIt4n4ItvH5ER3Seg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fGFQfRy7P7GYkhxpemoAWOC3mtF+hoDv5tMgVdBQEGUeuRQA+v4JBEhMjhrhWdceU
	 hBunNZ+bV9KIETHiA01mFQAX6p6ExJL4AzQ1EsUN0cio7OEzyXzmamJ1K1Jlc+7o2I
	 dijnUBp3P7gvtXTKzMNeAd31qfhmc29V0vqiBHxWypHtDjwKlumQCQYSB7SuIckQa6
	 mh+50GtHoslOMzWW8TkvdwgO4mf6fWFVt8KPOd+vlDYKKNc2dKEEU84VV3A1a3XjCH
	 aEY3ej1udjW75V1NPFdpa3nhyuaw85skk40zgVxDE9qstYp2Qo/4c8rDQQaYOsCezN
	 7kEdAloe1pr+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D128284768;
	Sun, 26 Apr 2026 14:31:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D899D1B8
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 14:31:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE76E41FF1
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 14:31:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FpcUeuDPeUO3 for <buildroot@buildroot.org>;
 Sun, 26 Apr 2026 14:31:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9AA4141FD2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9AA4141FD2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9AA4141FD2
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 14:31:14 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c5b2.dip0.t-ipconnect.de [79.214.197.178])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2C02EA4C105D
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 16:30:47 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36784)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wH0VS-000000006Gc-1dtc
 for buildroot@buildroot.org; Sun, 26 Apr 2026 14:30:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 26 Apr 2026 16:30:45 +0200
Message-ID: <20260426143046.1503221-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260426143046.1503221-1-bernd@kuhls.net>
References: <20260426143046.1503221-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777213847;
 bh=SnuHsA5Iztrn4CDREgeUxKYM2XJbkjmvwVTJAKhvzJ4=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=X5q/tdisbHIE9kE1ZdSdeLcvfdlSY+RAvchoS7p/DnHGFuBqJvJ0zTpyylnqp3HgK
 TWbBJQVVfEfHVTNmqWVis7BQFpJ808WufZqWl9byoSgB22cVeDqi34JBbLhFvDIjz4
 NsLcauHZuIy/bgpbpMvytcncHJ6vxIapC/H4cHSV8K03rd0qESD2NDQFf/dOrPYHJG
 sesUUqTqsJQyj0HPS77Yhia1Y+XvbTTZks7zvqfN38O8EJqJsySfDT2PuV7tNIF4hp
 Y7ANbPj7gCTvCo101YMdvLli5uOoW7IW/04SVUYmCrOeZHJ3ZO6y9U6eVmkIgicDd0
 VZtWT6TcpKn3A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=X5q/tdis
Subject: [Buildroot] [PATCH 3/4] package/libphidget: remove package
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

As discussed on the mailinglist:
https://lists.buildroot.org/pipermail/buildroot/2026-April/799929.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 Config.in.legacy                   |  8 ++++++++
 DEVELOPERS                         |  1 -
 package/Config.in                  |  1 -
 package/libphidget/Config.in       | 29 -----------------------------
 package/libphidget/libphidget.hash |  3 ---
 package/libphidget/libphidget.mk   | 16 ----------------
 6 files changed, 8 insertions(+), 50 deletions(-)
 delete mode 100644 package/libphidget/Config.in
 delete mode 100644 package/libphidget/libphidget.hash
 delete mode 100644 package/libphidget/libphidget.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 6229dab2b6..f71fdebae9 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2026.05"
 
+config BR2_PACKAGE_LIBPHIDGET
+	bool "libphidget"
+	select BR2_LEGACY
+	help
+	  libphidget was removed from Buildroot as it was
+	  insufficiently maintained. It can be re-added if someone
+	  volunteers to maintain it.
+
 config BR2_PACKAGE_PHIDGETWEBSERVICE
 	bool "phidgetwebservice"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 9b7f39068e..f97fffbcba 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1726,7 +1726,6 @@ N:	Jonathan Ben Avraham <yba@tkos.co.il>
 F:	arch/Config.in.xtensa
 F:	package/autofs/
 F:	package/dawgdic/
-F:	package/libphidget/
 F:	package/rapidxml/
 
 N:	Joris Offouga <offougajoris@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index 393bdc5ada..38745eb00c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1848,7 +1848,6 @@ menu "Hardware handling"
 	source "package/libnfc/Config.in"
 	source "package/libnvme/Config.in"
 	source "package/libpciaccess/Config.in"
-	source "package/libphidget/Config.in"
 	source "package/libpri/Config.in"
 	source "package/libqmi/Config.in"
 	source "package/libqrtr-glib/Config.in"
diff --git a/package/libphidget/Config.in b/package/libphidget/Config.in
deleted file mode 100644
index ab1e3e31b1..0000000000
--- a/package/libphidget/Config.in
+++ /dev/null
@@ -1,29 +0,0 @@
-config BR2_PACKAGE_LIBPHIDGET
-	bool "libphidget"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
-	depends on !BR2_STATIC_LIBS
-	select BR2_PACKAGE_LIBUSB
-	help
-	  The libphidget library provides an API for controlling
-	  Phidgets USB devices. The library translates API function
-	  calls to libusb function calls to control attached Phidgets
-	  devices that provide GPIO's, DAC's, accelerometers, servo
-	  motors, and other capabilities either singly or on combo
-	  devices.
-
-	  To use libphidget for controlling locally attached devices you
-	  need to set up the userspace USB device tree /dev/bus/usb. See
-	  file udev/99-phidgets.rules.
-
-	  The libphidget library also contains an API for sending
-	  commands to a local or remote phidgetwebservice using HTTP.
-	  The phidgetwebservice then translates HTTP requests to
-	  libphidget API function calls to control locally attached
-	  Phidgets devices.
-
-	  http://phidgets.com/
-
-comment "libphidget needs a toolchain w/ threads, dynamic library, gcc >= 4.9"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/libphidget/libphidget.hash b/package/libphidget/libphidget.hash
deleted file mode 100644
index 7c2f67af7f..0000000000
--- a/package/libphidget/libphidget.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# locally computed
-sha256  b1682ffb4a9a7d4589ec24256cbd30af1342880914117d3e3f4814e70049238c  libphidget22-1.24.20260127.tar.gz
-sha256  7c1c42a1485cd44f9b8275931e645962b7af86c524c0b683ab9fba62e7e3ece5  COPYING
diff --git a/package/libphidget/libphidget.mk b/package/libphidget/libphidget.mk
deleted file mode 100644
index f81080e1da..0000000000
--- a/package/libphidget/libphidget.mk
+++ /dev/null
@@ -1,16 +0,0 @@
-################################################################################
-#
-# libphidget
-#
-################################################################################
-
-LIBPHIDGET_VERSION = 1.24.20260127
-LIBPHIDGET_SOURCE = libphidget22-$(LIBPHIDGET_VERSION).tar.gz
-LIBPHIDGET_SITE = https://www.phidgets.com/downloads/phidget22/libraries/linux/libphidget22
-LIBPHIDGET_DEPENDENCIES = libusb
-LIBPHIDGET_CONF_OPTS = --disable-ldconfig
-LIBPHIDGET_INSTALL_STAGING = YES
-LIBPHIDGET_LICENSE = BSD-3-Clause
-LIBPHIDGET_LICENSE_FILES = COPYING
-
-$(eval $(autotools-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
