Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EEA4FF513B
	for <buildroot@archiver.kernel.org>; Tue,  7 Apr 2026 20:29:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25FFC818D0;
	Tue,  7 Apr 2026 20:29:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FCpQyiGSky57; Tue,  7 Apr 2026 20:29:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34AFF818D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775593783;
	bh=ROTcjwLzPgWHMxUZP6zBBBPlvqEcY/3n6po6oOKGkNI=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Vhn/oZqrU1ZBOMgl05Zfp+12k2ib7fcNuqiyuKkXZ3BYtprXro4QBZBvb6HmavhMy
	 cePpxlq2nJbU1e1hJrsYVslaRRaschg4Lb6WJYNmLVsFAk0aIvFSArzJebINovf06G
	 t66EXlZiLPS1q/DvugiBZ5c6yH1X06Ke0KoYxW78zYASuHzis/wQ2E0kWBykE+k4yN
	 P5s8mmP1z8/qRTv1FWYMGqk6/5LF7CFOYfCwKtYSHV/S53HF7BA6EzcSniYl5T+hc+
	 24HkkhUgEY406pb655d3iSXeGzI/3t9cZ+DxAAvWGcY3ddnwcnp2c71FwgqkUekbWi
	 vlogAxl3NrhVw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34AFF818D4;
	Tue,  7 Apr 2026 20:29:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 713701F6
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 20:29:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 576CF401D8
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 20:29:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 00VTUX-krwSB for <buildroot@buildroot.org>;
 Tue,  7 Apr 2026 20:29:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3B83A400F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B83A400F5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3B83A400F5
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 20:29:40 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a012a.dip0.t-ipconnect.de [91.58.1.42])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4D5A5A4C399C;
 Tue,  7 Apr 2026 22:29:25 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55902)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wAD36-000000000XO-3rty;
 Tue, 07 Apr 2026 20:29:25 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Jonathan Ben Avraham <yba@tkos.co.il>
Date: Tue,  7 Apr 2026 22:29:20 +0200
Message-ID: <20260407202921.3557385-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260407202921.3557385-1-bernd@kuhls.net>
References: <20260407202921.3557385-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775593765;
 bh=RbtD+eiAKs0O9pBpfJ2bIfN25FW5E66j3VHDDW64fKc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=vSqDvJG31G+6N4DWL4I5t+DlsRLTkv9ySmhgqCAyAA5lH965v9wvmjAlaNVJoTmuv
 oyG22SkB5H6r7eja2Qd7HoTW+atM520u5UhPA/mgeHt+8koBMnnvyJdzweYpfYtUKY
 O3HDLRY7++YYjhgv5wwTgiS5Up2SRW+0yrZx8zSogMQrF85vVWhdoeVh7GlyWPicto
 1GeSXIYMY+j2hiV0yYOF7lI2GNlh6MeBWWG6Ep5q6E2xPN5xp8fNhb8Cs3nNDzZFBe
 THLjxfkdcAmjGIKPipHZwRLItbrEaq4BLdKIJveORfyzLdOXbeqRPvv/BzIVjfwyOJ
 vhFSu+ioR+mqA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=vSqDvJG3
Subject: [Buildroot] [PATCH 2/3] package/phidgetwebservice: remove package
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
Cc: Jonathan Ben Avraham <yba@tkos.co.il>
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
index 25787f0588..f6403d2580 100644
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
index 341d50ee2c..ff326a2a05 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1739,7 +1739,6 @@ F:	arch/Config.in.xtensa
 F:	package/autofs/
 F:	package/dawgdic/
 F:	package/libphidget/
-F:	package/phidgetwebservice/
 F:	package/rapidxml/
 
 N:	Joris Offouga <offougajoris@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index 263554efdc..e60e9d811e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2579,7 +2579,6 @@ endif
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
