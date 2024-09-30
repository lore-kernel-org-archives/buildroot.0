Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23157CEB2CB
	for <buildroot@archiver.kernel.org>; Mon, 30 Sep 2024 22:31:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0EC86075F;
	Mon, 30 Sep 2024 22:31:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HxwV5G_NgnV9; Mon, 30 Sep 2024 22:31:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C9D160762
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C9D160762;
	Mon, 30 Sep 2024 22:31:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2EAFA1BF294
 for <buildroot@lists.busybox.net>; Mon, 30 Sep 2024 22:31:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E6D4803DD
 for <buildroot@lists.busybox.net>; Mon, 30 Sep 2024 22:31:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i7SlbBQpYmpT for <buildroot@lists.busybox.net>;
 Mon, 30 Sep 2024 22:31:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d36; helo=mail-io1-xd36.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1F0898083E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F0898083E
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1F0898083E
 for <buildroot@buildroot.org>; Mon, 30 Sep 2024 22:31:38 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-82aab679b7bso185765539f.0
 for <buildroot@buildroot.org>; Mon, 30 Sep 2024 15:31:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727735498; x=1728340298;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yi6ptmomCgNw65JHjcYn56tmYWzvaY9g4r0VY20x88w=;
 b=FvnEXZibkQZt4vE2ZIwpYbYNugcvJMaQvGjHZbqDa/Z+VXFWdCPjhFhvaSShgjImHQ
 QtBKiuhY2I7IGzyKXAUoIzS5S3e5gsIbxDAQ/NNDZRhgRpsURKtfqV4zOBfNG3LA6wQ1
 cZFgfaJ7j0sSs1z74YN/e/KRrBtgDb8Q6TkmVmVx/6pNG+p0ciqDKnUcroBGgPy7HHdY
 wPWohAnMIFHZmT6wGuYZq0AdgfVgCJGpOwRciGF+pQWc+6pEbA7UEmToabPh+ZPegWvM
 t+CDbSvJg5EWgufXf+XCPcQKqPsAUVQ8Y3a6P2hZFX9hCwTyGgclbj+7bTI2wPVRykpS
 hZ8g==
X-Gm-Message-State: AOJu0Ywixm3ESEO9mUr+1w5KuD+11UcX0fchg64buMSWE0iMTsERBcya
 LcIdRT8UpVuWxK4IuTff5Kerxr9FWyFuab8osksY5VZTU/vrkXEdUsQXKA==
X-Google-Smtp-Source: AGHT+IGLIy1fl5aeOyGOwr78nRwDM481/o0R6JfGSxz70beSP2zqn56KdR/q1I4BY1dqKAVUqRJr6A==
X-Received: by 2002:a05:6e02:12c4:b0:39f:5abe:ec25 with SMTP id
 e9e14a558f8ab-3a3451b9b02mr117085795ab.19.1727735497858; 
 Mon, 30 Sep 2024 15:31:37 -0700 (PDT)
Received: from james-x399.localdomain (71-33-149-81.hlrn.qwest.net.
 [71.33.149.81]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d8888d94eesm2327929173.129.2024.09.30.15.31.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 15:31:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 30 Sep 2024 16:31:31 -0600
Message-Id: <20240930223133.1202389-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240930223133.1202389-1-james.hilliard1@gmail.com>
References: <20240930223133.1202389-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727735498; x=1728340298; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yi6ptmomCgNw65JHjcYn56tmYWzvaY9g4r0VY20x88w=;
 b=IbN2l1vu1rGNxdVkNF9M8+yLqejbS81Q0kdc3cWuyxl+MmYexp88sg/vTn2iYCIMj1
 mLr7B/P6BeKZ4N5fuJfJ571bbBlWZBzZMQB66ln6Va9DFv3DEdhGjxcnfvcu5OdCDf6D
 d/4w82H6UeKLqtjN0ePKazpY8f/rAG4UCp+bAENdcOcJ95P5AU2IVrc2LA/tYr4L2YUV
 oYBixsfzAROGZhFCgjGo5tXLULBk3NYA2zDNVT5TevcjHyIEuebpo81aambImK+KQFo/
 Q6J3CAhGkaRP2jVcFUgkefO8XK1hpl0EH45Z4A9tclFGjyl4Js/5/o0/KWafgvd3bgp3
 33Tw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=IbN2l1vu
Subject: [Buildroot] [PATCH 2/4] package/libcupsfilters: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                          |  1 +
 package/libcupsfilters/Config.in           | 26 +++++++++
 package/libcupsfilters/libcupsfilters.hash |  4 ++
 package/libcupsfilters/libcupsfilters.mk   | 65 ++++++++++++++++++++++
 4 files changed, 96 insertions(+)
 create mode 100644 package/libcupsfilters/Config.in
 create mode 100644 package/libcupsfilters/libcupsfilters.hash
 create mode 100644 package/libcupsfilters/libcupsfilters.mk

diff --git a/package/Config.in b/package/Config.in
index e1ceb81dc0..e0afe0f28b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2020,6 +2020,7 @@ menu "Networking"
 	source "package/libcgicc/Config.in"
 	source "package/libcoap/Config.in"
 	source "package/libcpprestsdk/Config.in"
+	source "package/libcupsfilters/Config.in"
 	source "package/libcurl/Config.in"
 	source "package/libdnet/Config.in"
 	source "package/libeXosip2/Config.in"
diff --git a/package/libcupsfilters/Config.in b/package/libcupsfilters/Config.in
new file mode 100644
index 0000000000..1d2addda95
--- /dev/null
+++ b/package/libcupsfilters/Config.in
@@ -0,0 +1,26 @@
+config BR2_PACKAGE_LIBCUPSFILTERS
+	bool "libcupsfilters"
+	# needs fork()
+	depends on BR2_USE_MMU
+	depends on BR2_INSTALL_LIBSTDCPP # qpdf
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_PACKAGE_CUPS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # qpdf
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # qpdf
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_FONTCONFIG
+	select BR2_PACKAGE_LCMS2
+	select BR2_PACKAGE_QPDF
+	help
+	  This package provides the libcupsfilters library, which in its
+	  2.x version contains all the code of the filters of the former
+	  cups-filters package as library functions, the so-called
+	  filter functions.
+
+	  https://github.com/OpenPrinting/libcupsfilters
+
+comment "libcupsfilters needs a toolchain w/ C++ and dynamic library, gcc >= 5"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_5
diff --git a/package/libcupsfilters/libcupsfilters.hash b/package/libcupsfilters/libcupsfilters.hash
new file mode 100644
index 0000000000..b8cc8348db
--- /dev/null
+++ b/package/libcupsfilters/libcupsfilters.hash
@@ -0,0 +1,4 @@
+# Locally computed:
+sha256  542f2bfbc58136a4743c11dc8c86cee03c9aca705612654e36ac34aa0d9aa601  libcupsfilters-2.0.0.tar.xz
+sha256  78cf92bd6a800263e865dcb3ea764cc3b0f7759d9a0bf3a0fb1253aacd1a1199  COPYING
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/libcupsfilters/libcupsfilters.mk b/package/libcupsfilters/libcupsfilters.mk
new file mode 100644
index 0000000000..7c2d3ca5cf
--- /dev/null
+++ b/package/libcupsfilters/libcupsfilters.mk
@@ -0,0 +1,65 @@
+################################################################################
+#
+# libcupsfilters
+#
+################################################################################
+
+LIBCUPSFILTERS_VERSION = 2.0.0
+LIBCUPSFILTERS_SOURCE = libcupsfilters-$(LIBCUPSFILTERS_VERSION).tar.xz
+LIBCUPSFILTERS_SITE = https://github.com/OpenPrinting/libcupsfilters/releases/download/$(LIBCUPSFILTERS_VERSION)
+LIBCUPSFILTERS_LICENSE = Apache-2.0 with GPL-2.0/LGPL-2.0 exception
+LIBCUPSFILTERS_LICENSE_FILES = COPYING LICENSE
+LIBCUPSFILTERS_INSTALL_STAGING = YES
+LIBCUPSFILTERS_DEPENDENCIES = cups lcms2 qpdf fontconfig jpeg
+
+LIBCUPSFILTERS_CONF_OPTS = \
+	--disable-mutool \
+	--enable-imagefilters \
+	--with-cups-config=$(STAGING_DIR)/usr/bin/cups-config \
+	--with-sysroot=$(STAGING_DIR) \
+	--with-jpeg \
+	--with-test-font-path=/dev/null
+
+ifeq ($(BR2_PACKAGE_LIBPNG),y)
+LIBCUPSFILTERS_CONF_OPTS += --with-png
+LIBCUPSFILTERS_DEPENDENCIES += libpng
+else
+LIBCUPSFILTERS_CONF_OPTS += --without-png
+endif
+
+ifeq ($(BR2_PACKAGE_TIFF),y)
+LIBCUPSFILTERS_CONF_OPTS += --with-tiff
+LIBCUPSFILTERS_DEPENDENCIES += tiff
+else
+LIBCUPSFILTERS_CONF_OPTS += --without-tiff
+endif
+
+ifeq ($(BR2_PACKAGE_DBUS),y)
+LIBCUPSFILTERS_CONF_OPTS += --enable-dbus
+LIBCUPSFILTERS_DEPENDENCIES += dbus
+else
+LIBCUPSFILTERS_CONF_OPTS += --disable-dbus
+endif
+
+ifeq ($(BR2_PACKAGE_GHOSTSCRIPT),y)
+LIBCUPSFILTERS_DEPENDENCIES += ghostscript
+LIBCUPSFILTERS_CONF_OPTS += --enable-ghostscript
+else
+LIBCUPSFILTERS_CONF_OPTS += --disable-ghostscript
+endif
+
+ifeq ($(BR2_PACKAGE_POPPLER),y)
+LIBCUPSFILTERS_DEPENDENCIES += poppler
+LIBCUPSFILTERS_CONF_OPTS += --enable-poppler
+else
+LIBCUPSFILTERS_CONF_OPTS += --disable-poppler
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEXIF),y)
+LIBCUPSFILTERS_CONF_OPTS += --enable-exif
+LIBCUPSFILTERS_DEPENDENCIES += libexif
+else
+LIBCUPSFILTERS_CONF_OPTS += --disable-exif
+endif
+
+$(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
