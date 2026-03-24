Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 846B2F54AA8
	for <buildroot@archiver.kernel.org>; Tue, 24 Mar 2026 13:00:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA67B8228A;
	Tue, 24 Mar 2026 13:00:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GKVKM-OoXFJs; Tue, 24 Mar 2026 13:00:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0754B822A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774357248;
	bh=77chZz4Gz5YjveRCTS+AwobMBJTWjgg15Wv8l08vRcQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=f4fH80ELOSezs9Eg2mmCEZf58Y6GrXkhc+35mEpweyDkIuwJMJ8SYBCy2GD23b5q5
	 pyBBDR6K7WdzXGe08gj+1TSzSn4vHlyz7c80XSVKc7pJuw4sQEzpEkw2xV+tEZv1YT
	 TJOHwaiw6wlEdOoEyo4d6+/Bi2JtnpiRdkUPNTq+yw2K3mpLn/aO6xeHNcQjQHz9ca
	 QBK5iQxPcab3DYw9SrDfsgZI8eV3GqYgyhcpu4sqse7HzlyIR7PpbmMrNc2Lomnswr
	 5vPW2J4TQTSjgutXOiQ0iYZzRvhiiYXT6HKx3pFYQ4RPc9aEZbrMCBwFjISXCwUaSU
	 DV2BeXECW6g+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0754B822A1;
	Tue, 24 Mar 2026 13:00:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 860EFF4
 for <buildroot@buildroot.org>; Tue, 24 Mar 2026 13:00:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6BBB5608FD
 for <buildroot@buildroot.org>; Tue, 24 Mar 2026 13:00:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HfrGQCnpCeyr for <buildroot@buildroot.org>;
 Tue, 24 Mar 2026 13:00:45 +0000 (UTC)
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=77.87.242.242;
 helo=harvie.cz; envelope-from=tomas.mudrunka@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 66BDA608C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66BDA608C9
Received: from harvie.cz (harvie.cz [77.87.242.242])
 by smtp3.osuosl.org (Postfix) with ESMTP id 66BDA608C9
 for <buildroot@buildroot.org>; Tue, 24 Mar 2026 13:00:44 +0000 (UTC)
Received: from anemophobia.amit.cz (unknown [31.30.84.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by harvie.cz (Postfix) with ESMTPSA id 47780180068;
 Tue, 24 Mar 2026 14:00:42 +0100 (CET)
From: Tomas Mudrunka <tomas.mudrunka@gmail.com>
To: buildroot@buildroot.org
Cc: tomas.mudrunka@gmail.com
Date: Tue, 24 Mar 2026 14:00:37 +0100
Message-ID: <20260324130037.1411867-1-tomas.mudrunka@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=gmail.com
Subject: [Buildroot] [PATCH 1/1] package/hidapi: add support for build
 without hidraw support when udev is not available
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

This allows use of libhidapi on tiny systems without udev

Signed-off-by: Tomas Mudrunka <tomas.mudrunka@gmail.com>
---
 package/hidapi/Config.in | 28 ++++++++++++++++++++++++----
 package/hidapi/hidapi.mk | 20 +++++++++++++++-----
 2 files changed, 39 insertions(+), 9 deletions(-)

diff --git a/package/hidapi/Config.in b/package/hidapi/Config.in
index 1d3c86b677..efacd1aa26 100644
--- a/package/hidapi/Config.in
+++ b/package/hidapi/Config.in
@@ -1,10 +1,8 @@
 config BR2_PACKAGE_HIDAPI
 	bool "hidapi"
-	depends on BR2_PACKAGE_HAS_UDEV
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	select BR2_PACKAGE_LIBUSB
-	select BR2_PACKAGE_LIBGUDEV
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	# runtime UTF conversion support
 	select BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY if BR2_TOOLCHAIN_USES_GLIBC
@@ -13,9 +11,31 @@ config BR2_PACKAGE_HIDAPI
 	  to interface with USB and Bluetooth HID-Class devices on
 	  Windows, Linux, and Mac OS X.
 
+	  On Linux you can disable the hidraw backend (see below) to
+	  build only libhidapi-libusb, which does not require udev.
+
 	  http://github.com/libusb/hidapi/
 
-comment "hidapi needs udev /dev management and a toolchain w/ NPTL, gcc >= 4.9"
+if BR2_PACKAGE_HIDAPI
+
+comment "hidapi hidraw backend unavailable (no udev - enable eudev or systemd)"
+	depends on !BR2_PACKAGE_HAS_UDEV
+
+config BR2_PACKAGE_HIDAPI_HIDRAW
+	bool "hidraw backend"
+	default y if BR2_PACKAGE_HAS_UDEV
+	depends on BR2_PACKAGE_HAS_UDEV
+	help
+	  Build the Linux hidraw implementation (libhidapi-hidraw). This
+	  requires libudev from a udev provider (eudev or systemd).
+
+	  Say 'n' here to build only the libusb backend
+	  (libhidapi-libusb), which is enough for applications that
+	  link against hidapi-libusb and allows using HIDAPI on systems
+	  without udev.
+
+endif
+
+comment "hidapi needs a toolchain w/ NPTL and gcc >= 4.9"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
-		!BR2_PACKAGE_HAS_UDEV || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/hidapi/hidapi.mk b/package/hidapi/hidapi.mk
index c4daf934ee..11b622a8ad 100644
--- a/package/hidapi/hidapi.mk
+++ b/package/hidapi/hidapi.mk
@@ -7,16 +7,26 @@
 HIDAPI_VERSION = 0.15.0
 HIDAPI_SITE = $(call github,libusb,hidapi,hidapi-$(HIDAPI_VERSION))
 HIDAPI_INSTALL_STAGING = YES
-# No configure provided, so we need to autoreconf.
-HIDAPI_AUTORECONF = YES
+HIDAPI_SUPPORTS_IN_SOURCE_BUILD = NO
 HIDAPI_LICENSE = GPL-3.0 or BSD-3-Clause or HIDAPI license
 HIDAPI_LICENSE_FILES = LICENSE.txt LICENSE-gpl3.txt LICENSE-bsd.txt LICENSE-orig.txt
 
-HIDAPI_DEPENDENCIES = libusb libgudev
+HIDAPI_DEPENDENCIES = libusb
+
+HIDAPI_CONF_OPTS = \
+	-DHIDAPI_WITH_LIBUSB=ON \
+	-DHIDAPI_WITH_TESTS=OFF \
+	-DHIDAPI_BUILD_HIDTEST=OFF
+
+ifeq ($(BR2_PACKAGE_HIDAPI_HIDRAW),y)
+HIDAPI_CONF_OPTS += -DHIDAPI_WITH_HIDRAW=ON
+HIDAPI_DEPENDENCIES += udev
+else
+HIDAPI_CONF_OPTS += -DHIDAPI_WITH_HIDRAW=OFF
+endif
 
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 HIDAPI_DEPENDENCIES += libiconv
-HIDAPI_CONF_ENV += LIBS="-liconv"
 endif
 
-$(eval $(autotools-package))
+$(eval $(cmake-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
