Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEF22FF885E
	for <buildroot@archiver.kernel.org>; Sun, 26 Apr 2026 14:31:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B29DD42978;
	Sun, 26 Apr 2026 14:31:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VFsJk3i6RpDx; Sun, 26 Apr 2026 14:31:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFA574298B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777213864;
	bh=Gw6mETpDA5/K0x0OV7fF+1VXsnTQED1RiUCvUUdiAWM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h33zMAXczUnccN4OISbWFJ6umklbijI9U4HS18DCbGqa5EmJS82l+k5+DOEs1mhBg
	 zzHuxaejbWDTGnsXcrqmZhRMEodQhudLvpLOO4EWslkzMXAqVD3qHd7+r7zMe+Zc6M
	 hM0LPEsMcE6+sis0lSeZX75lFhud1bXXQ1fMx3diwBc4zZnepgph//rEL/L7fc1Rt5
	 2rczG2cfqBeSIXNn+0N2jHGZ78j/qOkuFBSfZU7+52YshJu690QIgyeAE03wfhzP6g
	 p0iC0NELpMQlsIGWSlj0gsHsSpUaB2b6bWhmO0f15cepQlyReZUFXizic2pi3Lef6D
	 jfKPg05BS9WUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFA574298B;
	Sun, 26 Apr 2026 14:31:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A6648231
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 14:31:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8D0564298B
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 14:31:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ub74jHTgl8U9 for <buildroot@buildroot.org>;
 Sun, 26 Apr 2026 14:31:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8009642978
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8009642978
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8009642978
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 14:31:02 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c5b2.dip0.t-ipconnect.de [79.214.197.178])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 147F5A4C0F5E
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 16:30:47 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36784)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wH0VS-000000006Gc-191L
 for buildroot@buildroot.org; Sun, 26 Apr 2026 14:30:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 26 Apr 2026 16:30:44 +0200
Message-ID: <20260426143046.1503221-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260426143046.1503221-1-bernd@kuhls.net>
References: <20260426143046.1503221-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777213847;
 bh=34CypUjmAezrlmJL1l4kuS9ZvQyx6u5YlwGt6u1+MGA=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=kuXsiY9mOp/jCGbB4eZ0tDFDfhWNje5Owuwqy3K7cFBwHUmnkCZASF9L1zw9ivOcE
 5/Z9UMc4JvoQr+M1jOimcu75qtmuhU3gB1maSzwvFle6kRuAP8U3jEouVGNyoaGhRr
 csMzBH+IiPUXwkcphOR1NSYYAMYmdR51I61mj660qX1qJegHGh5zw09STYIF7Wv9OT
 B9YWAAbe2YECKMzdIqLvsp8c7V9eXevMy9e/1tQHmVXa6mjn9ecIOhYN/E1+0TVu9Q
 BHBRxv/Oj+8pd1vFqQ6j+DPXrFM1JO6dqZrKjKiEckCA8fK0zoBkhLZYuuWfrers39
 M9P/0wJx+patw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=kuXsiY9m
Subject: [Buildroot] [PATCH 2/4] package/phidgetwebservice: remove package
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
index 6e29192664..6229dab2b6 100644
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
index e97a11ae41..9b7f39068e 100644
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
index f2601a6eb1..393bdc5ada 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2581,7 +2581,6 @@ endif
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
