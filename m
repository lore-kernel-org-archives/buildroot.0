Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B236C44512
	for <buildroot@archiver.kernel.org>; Sun, 19 Jul 2026 12:53:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C94A6060A;
	Sun, 19 Jul 2026 12:53:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eroa7yQn8rJd; Sun, 19 Jul 2026 12:53:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 123126066F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784465635;
	bh=f92VF1ltUk83AjoJt7RheNuD8wcoTlh6LRnwk7Le9aQ=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q4QWBANhiQT2KAneMUyPW81Hxd3upxwZohKl+sd/MLVkCE7rDNqgOBNzNc+sPGDk6
	 x5Aqt6OX9cb4aTWXniFYhbO6tZg8u/ZaztfCvvT9XhM45Wj87T1XDsilVQvlwwT034
	 HKJMSILk9qI1iirIdq4ZwqfRsPpnLIkQ2Uk81/6V4Bom4Gf+lT6TLF12/jAo838Xtu
	 B7mjpnrO7ME2JyfnkpylAEuSDfhvryWNdpROP6GRL6W5XT4y47R8JMILBOtAVw8fea
	 a8+Bz/JwPPBrS5Bf3UAnqsHM1SZ/dIlJdwpgmigqwD830FSAkFkgPIkpGdYQp5g8Xv
	 2bT5smfcIgGCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 123126066F;
	Sun, 19 Jul 2026 12:53:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 36FDD206
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 12:53:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1CA884008E
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 12:53:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eKPVJnVmTN7R for <buildroot@buildroot.org>;
 Sun, 19 Jul 2026 12:53:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 81DBE40060
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81DBE40060
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 81DBE40060
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 12:53:51 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bf2b.dip0.t-ipconnect.de [84.161.191.43])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 40CE7A4C3CE1;
 Sun, 19 Jul 2026 14:53:35 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60424)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wlR1S-000000000fS-3Mqy;
 Sun, 19 Jul 2026 12:53:34 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, Simon Dawson <spdawson@gmail.com>
Date: Sun, 19 Jul 2026 14:53:34 +0200
Message-ID: <20260719125334.1772882-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260719125334.1772882-1-bernd@kuhls.net>
References: <20260719125334.1772882-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1784465615;
 bh=ybOJSypKKbZDOmT4q6q7mGN6KMmpKv39poLZ4WO2EJI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=pE2IDBhd1NPP9S7bQLOhqsDqWCb/sPbn98ziaHt98S2Di0U5Vq15lkmc1RgxZMLsK
 k7EU2jJcaHAei/AZMqXULrP8mgvpHyQBjK5pfAWHUdPfRZe2UPrpZhq5BMwa5MEggG
 /KxFFotV69eNtZcxRrhmdORnxosCJ5cyjijO00OFdO4m7Hu7HmCGysG4RAh7zdztCj
 vZpnn1wKlxBizhYUlot3YSZbVHzKHEajDc2zk/gp+6/W188hDie1/49O/OpR1KkRSM
 65zzdQyXo1WfymxenR1AcAROdaC2vIFTuBU6cdzZn8Mv5zOxik/WUvNJ4DHRR5yAL5
 PmXYflFV3zGmQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=pE2IDBhd
Subject: [Buildroot] [PATCH 2/2] package/libepoxy: needs threads
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

Buildroot commit cd2583ca0a993cb44e8822966f101e820ac2619e removed the
dependencies to gl/egl which revealed that libepoxy needs a toolchain
with threads:

../src/dispatch_common.c:168:10: fatal error: pthread.h:
 No such file or directory
  168 | #include <pthread.h>

Fixes:
https://autobuild.buildroot.net/results/dc2/dc27a008af73c7676e4f54e4846d87f9d5aef98e/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/434f04d604de12c7a4dcad4a605b0c5219d7319c

 package/libcamera-apps/Config.in | 2 +-
 package/libepoxy/Config.in       | 5 +++--
 package/libfm/Config.in          | 2 +-
 package/libgtk3/Config.in        | 2 +-
 package/libgtk4/Config.in        | 2 +-
 package/menu-cache/Config.in     | 2 +-
 package/pcmanfm/Config.in        | 2 +-
 package/wpebackend-fdo/Config.in | 2 +-
 package/xscreensaver/Config.in   | 2 +-
 9 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/package/libcamera-apps/Config.in b/package/libcamera-apps/Config.in
index a7f37e3e52..3c3ac7eaf6 100644
--- a/package/libcamera-apps/Config.in
+++ b/package/libcamera-apps/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_LIBCAMERA_APPS
 	bool "libcamera-apps"
 	depends on BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS # libcamera
 	depends on BR2_INSTALL_LIBSTDCPP # libcamera/boost
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libcamera/boost
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libcamera/boost, libepoxy
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # libcamera
 	depends on !BR2_STATIC_LIBS # gnutls/libcamera, libepoxy
 	depends on BR2_USE_WCHAR # gnutls/libcamera/boost
diff --git a/package/libepoxy/Config.in b/package/libepoxy/Config.in
index 269b43be85..6ff0c6072f 100644
--- a/package/libepoxy/Config.in
+++ b/package/libepoxy/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBEPOXY
 	bool "libepoxy"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS # dlfcn.h
 	select BR2_PACKAGE_XUTIL_UTIL_MACROS
 	help
@@ -12,5 +13,5 @@ config BR2_PACKAGE_LIBEPOXY
 
 	  https://github.com/anholt/libepoxy
 
-comment "libepoxy needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
+comment "libepoxy needs a toolchain w/ dynamic library, threads"
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libfm/Config.in b/package/libfm/Config.in
index e4d6528db5..abb35ca3dd 100644
--- a/package/libfm/Config.in
+++ b/package/libfm/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_LIBFM
 	bool "libfm"
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS # libgtk3
 	depends on BR2_USE_WCHAR # libgtk3, libglib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libgtk3, libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libepoxy, libgtk3, libglib2
 	depends on BR2_USE_MMU # libgtk3, libglib2
 	depends on BR2_INSTALL_LIBSTDCPP # libgtk3
 	depends on !BR2_STATIC_LIBS # libepoxy -> libgtk3
diff --git a/package/libgtk3/Config.in b/package/libgtk3/Config.in
index 7717afdac2..9715254ea8 100644
--- a/package/libgtk3/Config.in
+++ b/package/libgtk3/Config.in
@@ -17,7 +17,7 @@ config BR2_PACKAGE_LIBGTK3
 	bool "libgtk3"
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS # host-libgtk3 -> host-librsvg
 	depends on BR2_USE_WCHAR # glib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2, libepoxy
 	depends on BR2_USE_MMU # glib2
 	depends on BR2_INSTALL_LIBSTDCPP # pango
 	depends on !BR2_STATIC_LIBS # libepoxy
diff --git a/package/libgtk4/Config.in b/package/libgtk4/Config.in
index 958742ae43..c1f3928b8a 100644
--- a/package/libgtk4/Config.in
+++ b/package/libgtk4/Config.in
@@ -16,7 +16,7 @@ config BR2_PACKAGE_LIBGTK4
 	bool "libgtk4"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # librsvg
 	depends on BR2_USE_WCHAR # glib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2, graphene
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2, graphene, libepoxy
 	depends on BR2_USE_MMU # glib2
 	depends on BR2_INSTALL_LIBSTDCPP # pango
 	depends on !BR2_STATIC_LIBS # libepoxy
diff --git a/package/menu-cache/Config.in b/package/menu-cache/Config.in
index 3e7137c7a8..a84f807625 100644
--- a/package/menu-cache/Config.in
+++ b/package/menu-cache/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_MENU_CACHE
 	bool "menu-cache"
 	depends on BR2_USE_WCHAR # libglib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libepoxy, libglib2
 	depends on !BR2_STATIC_LIBS # libepoxy -> libfm
 	depends on BR2_USE_MMU # libglib2
 	select BR2_PACKAGE_LIBGLIB2
diff --git a/package/pcmanfm/Config.in b/package/pcmanfm/Config.in
index 7e411b22ac..5250176c1f 100644
--- a/package/pcmanfm/Config.in
+++ b/package/pcmanfm/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_PCMANFM
 	bool "pcmanfm"
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS # libfm
 	depends on BR2_USE_WCHAR # libfm
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libfm
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libepoxy, libfm
 	depends on BR2_USE_MMU # libfm
 	depends on BR2_INSTALL_LIBSTDCPP # libfm
 	depends on !BR2_STATIC_LIBS # libepoxy -> libgtk3 -> libfm
diff --git a/package/wpebackend-fdo/Config.in b/package/wpebackend-fdo/Config.in
index 0e59b8df1a..5dfbf678b6 100644
--- a/package/wpebackend-fdo/Config.in
+++ b/package/wpebackend-fdo/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_WPEBACKEND_FDO
 	bool "wpebackend-fdo"
 	depends on !BR2_STATIC_LIBS # libepoxy, wayland
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland, libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libepoxy, libglib2, wayland
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_USE_MMU # libglib2
 	depends on BR2_PACKAGE_HAS_LIBEGL
diff --git a/package/xscreensaver/Config.in b/package/xscreensaver/Config.in
index 80fb1550f3..5763f12601 100644
--- a/package/xscreensaver/Config.in
+++ b/package/xscreensaver/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_XSCREENSAVER
 	depends on BR2_PACKAGE_HAS_LIBGL # libglu
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS # libgtk3
 	depends on BR2_USE_WCHAR # libgtk3, libglib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libgtk3, libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libepoxy, libgtk3, libglib2
 	depends on BR2_USE_MMU # libgtk3, libglib2
 	depends on BR2_INSTALL_LIBSTDCPP # libgtk3
 	depends on !BR2_STATIC_LIBS # libepoxy -> libgtk3
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
