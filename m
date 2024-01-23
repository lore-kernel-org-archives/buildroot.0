Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6527C47DDB
	for <buildroot@archiver.kernel.org>; Tue, 23 Jan 2024 09:32:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61E326105C;
	Tue, 23 Jan 2024 09:32:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61E326105C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fzQzrkM0khme; Tue, 23 Jan 2024 09:32:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7122C61065;
	Tue, 23 Jan 2024 09:32:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7122C61065
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 443781BF2B8
 for <buildroot@lists.busybox.net>; Tue, 23 Jan 2024 09:32:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D09440289
 for <buildroot@lists.busybox.net>; Tue, 23 Jan 2024 09:32:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D09440289
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3rS4_cqQbMcv for <buildroot@lists.busybox.net>;
 Tue, 23 Jan 2024 09:32:51 +0000 (UTC)
X-Greylist: delayed 2305 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 23 Jan 2024 09:32:51 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D44540123
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7D44540123
 for <buildroot@buildroot.org>; Tue, 23 Jan 2024 09:32:49 +0000 (UTC)
Received: from 91-153-34-210.elisa-laajakaista.fi ([91.153.34.210] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rSCY1-009DLp-C7; Tue, 23 Jan 2024 09:54:21 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 39b1cb1d;
 Tue, 23 Jan 2024 08:54:20 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Tue, 23 Jan 2024 10:54:17 +0200
Message-ID: <20240123085419.1761894-1-aperez@igalia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9pSX7z30485dL1HUOyBcStlx7fNDKyhygOkkmMa6nO8=; b=NO0j8g4ZX9LRsYVTyks+TIsEPe
 Ow+K1EtVti5jPSqP9lgFa5UQW2PXuknCg3f2aeQNGTLlOENKoAMCDVw6+3Yhdf3opiNamlWVUHimk
 8A6onMXqHhK+noZco9UuwWk2QRYmeT4dg0Suv5E8p3CoQH97I0HxEhJKdN9iKmiZ7grYdNkZhFJDX
 ezncKbqVCFFYJwSbmRrOmU7N6fj3I3RFx9vwIrYjj9z+M/W5FHMuk+amDams8wWNEhcU6WFP+fOvO
 U66JMtMxQxuoXGaYgIAjyhDcZ7h2y2weCcyn2fXvLh7Te36PNdFfwUr0zE15rZg34zGUUhF4brs4e
 A5XcWNFg==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=NO0j8g4Z
Subject: [Buildroot] [PATCH] package/wpewebkit: security bump to version
 2.42.4
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
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The minimum GCC version is changed to 10.x, conditionals added for
USE_JPEGXL and USE_GBM. Both are optional and will be automatically
enabled if the relevent packages have been enabled. GBM is recommended
for performance, is it avoids a buffer copy on each frame rendered by
WebKit.

Release notes:

 - https://wpewebkit.org/release/wpewebkit-2.40.4.html
 - https://wpewebkit.org/release/wpewebkit-2.40.5.html
 - https://wpewebkit.org/release/wpewebkit-2.42.0.html
 - https://wpewebkit.org/release/wpewebkit-2.42.1.html
 - https://wpewebkit.org/release/wpewebkit-2.42.2.html
 - https://wpewebkit.org/release/wpewebkit-2.42.3.html
 - https://wpewebkit.org/release/wpewebkit-2.42.4.html

This update covers fixes for CVE-2023-37450, CVE-2023-38133,
CVE-2023-38572, CVE-2023-38592, CVE-2023-38594, CVE-2023-38595,
CVE-2023-38597, CVE-2023-38599, CVE-2023-38600, CVE-2023-38611,
CVE-2023-40397, CVE-2023-39928, CVE-2023-39434, CVE-2023-40451,
CVE-2023-41074, CVE-2023-41993, CVE-2023-32359, CVE-2023-41983,
CVE-2023-42852, CVE-2023-42916, CVE-2023-42917, CVE-2023-42883,
and CVE-2023-42890.

Relevant security advisories:

 - https://wpewebkit.org/security/WSA-2023-0006.html
 - https://wpewebkit.org/security/WSA-2023-0007.html
 - https://wpewebkit.org/security/WSA-2023-0008.html
 - https://wpewebkit.org/security/WSA-2023-0009.html
 - https://wpewebkit.org/security/WSA-2023-0010.html
 - https://wpewebkit.org/security/WSA-2023-0011.html
 - https://wpewebkit.org/security/WSA-2023-0012.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/wpewebkit/Config.in      |  6 +++---
 package/wpewebkit/wpewebkit.hash |  6 +++---
 package/wpewebkit/wpewebkit.mk   | 16 +++++++++++++++-
 3 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index 81b66f8429..432aa4c3a3 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -16,12 +16,12 @@ config BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 
-comment "wpewebkit needs a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 9, host gcc >= 4.9"
+comment "wpewebkit needs a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 10, host gcc >= 4.9"
 	depends on BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
 	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \
 		|| !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_9 \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_10 \
 		|| !BR2_HOST_GCC_AT_LEAST_4_9
 
 comment "wpewebkit needs an OpenGL ES w/ EGL-capable Wayland backend"
@@ -37,7 +37,7 @@ config BR2_PACKAGE_WPEWEBKIT
 	depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu, host-ruby
 	depends on BR2_INSTALL_LIBSTDCPP # harfbuzz, icu
 	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland, icu, libsoup3
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	depends on BR2_USE_WCHAR # icu, libsoup3
 	depends on BR2_PACKAGE_HAS_LIBGLES # libepoxy
 	depends on BR2_PACKAGE_HAS_LIBEGL # libepoxy
diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
index aaeea2bcda..322e494c36 100644
--- a/package/wpewebkit/wpewebkit.hash
+++ b/package/wpewebkit/wpewebkit.hash
@@ -1,6 +1,6 @@
-# From https://wpewebkit.org/releases/wpewebkit-2.40.3.tar.xz.sums
-sha1  c840bd76b2c86cb8ca0d68b56598cb0abbafc727  wpewebkit-2.40.3.tar.xz
-sha256  05b6a9cb1d7d03485e0dc41b2a8e6f99a36aea23d32ba3ecb38d0d6860747ada  wpewebkit-2.40.3.tar.xz
+# From https://wpewebkit.org/releases/wpewebkit-2.42.4.tar.xz.sums
+sha1  34da38e9554586154c83fdbb5c20e353b6d97277  wpewebkit-2.42.4.tar.xz
+sha256  8836040a3687581970b47a232b713e7023c080d5613427f52db619c29fb253a4  wpewebkit-2.42.4.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index bf0b095372..13143efb38 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEWEBKIT_VERSION = 2.40.3
+WPEWEBKIT_VERSION = 2.42.4
 WPEWEBKIT_SITE = https://wpewebkit.org/releases
 WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
 WPEWEBKIT_INSTALL_STAGING = YES
@@ -84,6 +84,13 @@ else
 WPEWEBKIT_CONF_OPTS += -DUSE_WOFF2=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBJXL),y)
+WPEWEBKIT_CONF_OPTS += -DUSE_JPEGXL=ON
+WPEWEBKIT_DEPENDENCIES += libjxl
+else
+WPEWEBKIT_CONF_OPTS += -DUSE_JPEGXL=OFF
+endif
+
 ifeq ($(BR2_INIT_SYSTEMD),y)
 WPEWEBKIT_CONF_OPTS += -DENABLE_JOURNALD_LOG=ON
 WPEWEBKIT_DEPENDENCIES += systemd
@@ -91,6 +98,13 @@ else
 WPEWEBKIT_CONF_OPTS += -DENABLE_JOURNALD_LOG=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_HAS_LIBGBM),y)
+WPEWEBKIT_CONF_OPTS += -DUSE_GBM=ON
+WPEWEBKIT_DEPENDENCIES += libgbm
+else
+WPEWEBKIT_CONF_OPTS += -DUSE_GBM=OFF
+endif
+
 # JIT is not supported for MIPS r6, but the WebKit build system does not
 # have a check for these processors. The same goes for ARMv5 and ARMv6.
 # Disable JIT forcibly here and use the CLoop interpreter instead.
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
