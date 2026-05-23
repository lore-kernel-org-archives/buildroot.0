Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6FF6CD5BB1
	for <buildroot@archiver.kernel.org>; Sat, 23 May 2026 09:12:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A10F815D9;
	Sat, 23 May 2026 09:12:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BW16fJs7jBRs; Sat, 23 May 2026 09:12:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFF89815DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779527533;
	bh=nMn/RSEDojYUMzvl0qarVOXsk+BeM9dSTKtPnVXGfr0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EAjNHC6Nzo7JT6PW7DXWWyyuB247k4VzsnTw0TkMs6ZR3r1kOdQta3byV0BYDgJ1b
	 6g/0BrWiRbuLZBU1WTBe1X2E/1KapGmxrzhoQatKL8kl1auQy2DkBKjCiix5Vrdg5b
	 ydfamchC3poaaFmCeqv74sD+6RiEXdbirna8GoI91LeFnRavrTInnj7LAGLvV7DbTA
	 HIkj6jlsl+5p0Sj6lAeyJurGDRR9z7POj60xewFw0ylFXU/y06af8xmzCCcrNSD60N
	 0E8y6uhpTJfUSpFlj7mp8ZIPzgpka6EvH0Q/EphpA1wCiJEsngYBz0ZfGt17QglsNd
	 g+xgZJI5YNRrA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFF89815DB;
	Sat, 23 May 2026 09:12:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BBB8D282
 for <buildroot@buildroot.org>; Sat, 23 May 2026 09:12:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A197A60673
 for <buildroot@buildroot.org>; Sat, 23 May 2026 09:12:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ecf9SDo9EvVh for <buildroot@buildroot.org>;
 Sat, 23 May 2026 09:12:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 901E360880
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 901E360880
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 901E360880
 for <buildroot@buildroot.org>; Sat, 23 May 2026 09:12:11 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b5dd.dip0.t-ipconnect.de [84.161.181.221])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5F70AA4C0170
 for <buildroot@buildroot.org>; Sat, 23 May 2026 11:11:57 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36918)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.3)
 (envelope-from <bernd@kuhls.net>) id 1wQiOi-000000001HG-2zkt
 for buildroot@buildroot.org; Sat, 23 May 2026 09:11:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 23 May 2026 11:11:53 +0200
Message-ID: <20260523091156.112718-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260523091156.112718-1-bernd@kuhls.net>
References: <20260523091156.112718-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1779527517;
 bh=8m4bBa5jp8sD8sqsVakrDr7uGkBPCh/T8wpG8FiG1bc=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=R6dlEbqpE2MePryh3g87+3tkjrM44ogQ08KWTJXjDQnJoKcam/uM8fHgYtmSnNSEO
 B/Mycx06X2QY/t+IC0km4byIrZFKqfKIBJqMIc9Sre6pc2RX8y0k9YDXLEwbcUypO/
 w9zXC1WJXOjryR/ILvrI+fdvPVkvfRX0EYiuVr0nFb8ftJe+2fLUWm2TDarQV1+rRa
 aaNips6OuSflUZ8oS3Ys7QEqw+n0ZUwnU/7RGqRrMl1FcqrjBXQls+4t4YJnpRN0t+
 +El7v/2w+OUQKEksaAsqP5U4kLGaC542n+mFKy8LTil2s6iUHOp4SXGSHiSPFFgeSG
 BOBb8cWFpgiDA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=R6dlEbqp
Subject: [Buildroot] [PATCH 2/5] package/phidgetwebservice: remove package
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
https://autobuild.buildroot.net/results/ca7/ca7b93d6b2f74f7ef6b697d9289f8a49771eb4be/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 Config.in.legacy                              |  8 +++++++
 DEVELOPERS                                    |  1 -
 package/Config.in                             |  1 -
 package/phidgetwebservice/Config.in           | 23 -------------------
 .../phidgetwebservice/phidgetwebservice.hash  |  3 ---
 .../phidgetwebservice/phidgetwebservice.mk    | 14 -----------
 6 files changed, 8 insertions(+), 42 deletions(-)
 delete mode 100644 package/phidgetwebservice/Config.in
 delete mode 100644 package/phidgetwebservice/phidgetwebservice.hash
 delete mode 100644 package/phidgetwebservice/phidgetwebservice.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 12609ffb77..dd62350ffd 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2026.05"
 
+config BR2_PACKAGE_PHIDGETWEBSERVICE
+	bool "phidgetwebservice"
+	select BR2_LEGACY
+	help
+	  phidgetwebservice was removed from Buildroot as it was
+	  insufficiently maintained. It can be re-added if someone
+	  volunteers to maintain it.
+
 config BR2_PACKAGE_DAQ
 	bool "daq removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index c426563870..f185bae943 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1727,7 +1727,6 @@ F:	arch/Config.in.xtensa
 F:	package/autofs/
 F:	package/dawgdic/
 F:	package/libphidget/
-F:	package/phidgetwebservice/
 F:	package/rapidxml/
 
 N:	Joris Offouga <offougajoris@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index d6a6490c6c..daab795124 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2580,7 +2580,6 @@ endif
 	source "package/p910nd/Config.in"
 	source "package/parprouted/Config.in"
 	source "package/passt/Config.in"
-	source "package/phidgetwebservice/Config.in"
 	source "package/phytool/Config.in"
 	source "package/pimd/Config.in"
 	source "package/pixiewps/Config.in"
diff --git a/package/phidgetwebservice/Config.in b/package/phidgetwebservice/Config.in
deleted file mode 100644
index b052f180f0..0000000000
--- a/package/phidgetwebservice/Config.in
+++ /dev/null
@@ -1,23 +0,0 @@
-config BR2_PACKAGE_PHIDGETWEBSERVICE
-	bool "phidgetwebservice"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb, libphidget
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libphidget -> libusb
-	depends on !BR2_STATIC_LIBS # libphidget
-	select BR2_PACKAGE_LIBPHIDGET
-	help
-	  phidgetwebservice (the Phidget WebService) provides an HTTP
-	  front-end to the libphidget device control API. This
-	  provides an alternative to the libphidget C linkage
-	  interface for controlling locally attached Phidgets USB
-	  devices and it also allows you to control Phidget USB
-	  devices remotely when the host running the phidgetwebservice
-	  has an exposed network interface.
-
-	  The phidgetwebservice client program uses the libphidget
-	  HTTP functions to send commands to the phidgetwebservice.
-
-	  http://phidgets.com/
-
-comment "phidgetwebservice needs a toolchain w/ threads, dynamic library, gcc >= 4.9"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/phidgetwebservice/phidgetwebservice.hash b/package/phidgetwebservice/phidgetwebservice.hash
deleted file mode 100644
index 49017f2994..0000000000
--- a/package/phidgetwebservice/phidgetwebservice.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# locally computed
-sha256  aa63cbd2ab87182d6e0c05d553ee4c8cc73d268516d8e0a1e881baed391c081d  phidgetwebservice_2.1.9.20190409.tar.gz
-sha256  ea8af5e789cb2d4e9b10bce3874982ade163b749b6bfbdb32e2df21c4d106de1  COPYING
diff --git a/package/phidgetwebservice/phidgetwebservice.mk b/package/phidgetwebservice/phidgetwebservice.mk
deleted file mode 100644
index b5f335c4ec..0000000000
--- a/package/phidgetwebservice/phidgetwebservice.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# phidgetwebservice
-#
-################################################################################
-
-PHIDGETWEBSERVICE_VERSION = 2.1.9.20190409
-PHIDGETWEBSERVICE_SOURCE = phidgetwebservice_$(PHIDGETWEBSERVICE_VERSION).tar.gz
-PHIDGETWEBSERVICE_SITE = https://www.phidgets.com/downloads/phidget21/servers/linux/phidgetwebservice
-PHIDGETWEBSERVICE_DEPENDENCIES = libphidget
-PHIDGETWEBSERVICE_LICENSE = LGPL-3.0
-PHIDGETWEBSERVICE_LICENSE_FILES = COPYING
-
-$(eval $(autotools-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
