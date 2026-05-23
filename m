Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D89CD5BB1
	for <buildroot@archiver.kernel.org>; Sat, 23 May 2026 09:12:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A819C60673;
	Sat, 23 May 2026 09:12:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GsJ2HNYWHWTI; Sat, 23 May 2026 09:12:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C99D260880
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779527545;
	bh=RqxxabCS9Cf2Qyf//Em2znz87V9eRbqFC9QiplmUfmI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F9LOUHQwQRlvqjbksVjvwU2YEpvxNdSv810XbKDhr/GTINkrTyiexl8Wgn8lZzFJz
	 t79cPEzN9+MdmFoZsLkGRrkzI2QURYCiI3aPod6Sv7bCT3Z+iJ8Emy8OjJvJq9yuzj
	 tWtjNubQ9bj9LMyaY2YpFCVmBtiaDT+tCx/avbfxwlYhMFXQjBPeyigF6Q5+ikqPdZ
	 lVfSIKWyzcwZjTL2yQ3M79/Ey8eMDot0RbSMAH05z6dAyC42O7K6q/W8iznD4ThoTq
	 LD+gBdA/Kwq4+xiKbSlKQUhOnHFd0/8wJap+RKEAXS2lUvFqWKNSTw2/eQH64xmkgq
	 +DIHG/PgY2y5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C99D260880;
	Sat, 23 May 2026 09:12:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CDD58282
 for <buildroot@buildroot.org>; Sat, 23 May 2026 09:12:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BFE6260880
 for <buildroot@buildroot.org>; Sat, 23 May 2026 09:12:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eIKr_To62hhW for <buildroot@buildroot.org>;
 Sat, 23 May 2026 09:12:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9D04B60673
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D04B60673
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9D04B60673
 for <buildroot@buildroot.org>; Sat, 23 May 2026 09:12:23 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b5dd.dip0.t-ipconnect.de [84.161.181.221])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7CCC9A4C027B
 for <buildroot@buildroot.org>; Sat, 23 May 2026 11:11:57 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36918)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.3)
 (envelope-from <bernd@kuhls.net>) id 1wQiOi-000000001HG-3Uc8
 for buildroot@buildroot.org; Sat, 23 May 2026 09:11:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 23 May 2026 11:11:54 +0200
Message-ID: <20260523091156.112718-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260523091156.112718-1-bernd@kuhls.net>
References: <20260523091156.112718-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1779527517;
 bh=QfvLHsg2fZG+5rnpo6rvWkVPbPZAtb16CMSbbhUUabQ=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=TaclfHVsGB2AlBZOusvkf+1yPDtupGuHcg8kQAZgJorcvxxfqgh8mLO1u2TF2ZmLR
 feapTk3loEj252vwZ8VPWltoxBTsKYh8oVQlpML2HQJIpfMQqCsgrzvBFpN3xwj6VI
 LheKpWtOaOg047/5KXw8bDamAqx1iea/F76JOj0up3xh2mvMUiRDmHQgHa0PxN+048
 +zji4yl8dOoP1n5C1nPNsqWSj7uKiO+EmEaqUsyibefytmPdxVVRghhK1YFkOMdmxl
 DyMu6B2csrFi4MbZUn3JqEKYunRYPlxOfpaJ+JasHrunWAhixWmu0JXMdVTQBUPSml
 bsNGVhSt/FA1A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=TaclfHVs
Subject: [Buildroot] [PATCH 3/5] package/libphidget: remove package
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

Fixes:
https://autobuild.buildroot.net/results/977/977964a64279e3d29cfa6a1083af613b99ac8039/

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
index dd62350ffd..5359459cd6 100644
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
index f185bae943..de0d0d6f76 100644
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
index daab795124..f5e93688a5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1847,7 +1847,6 @@ menu "Hardware handling"
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
