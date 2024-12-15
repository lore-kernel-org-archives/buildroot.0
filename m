Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E97FEE7716A
	for <buildroot@archiver.kernel.org>; Sun, 15 Dec 2024 10:56:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7CB2611A9;
	Sun, 15 Dec 2024 10:56:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v1f_q1T_8MIZ; Sun, 15 Dec 2024 10:56:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6D64611C3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6D64611C3;
	Sun, 15 Dec 2024 10:56:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C06D7CE
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 10:56:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE7C3611BD
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 10:56:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 29jU_uPb3PW4 for <buildroot@buildroot.org>;
 Sun, 15 Dec 2024 10:56:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A0493611A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0493611A9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A0493611A9
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 10:56:32 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c243.dip0.t-ipconnect.de [79.214.194.67])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 47FDDA4C3E8F;
 Sun, 15 Dec 2024 11:55:38 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54102)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tMmHh-000000007l0-1la8;
 Sun, 15 Dec 2024 10:55:38 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 15 Dec 2024 11:55:37 +0100
Message-Id: <20241215105537.1396270-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241215105537.1396270-1-bernd@kuhls.net>
References: <20241215105537.1396270-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1734260138;
 bh=HkEXRLvl46Cko+tPOxv5Z4oMa/GEMgBt+rG8iPO1W04=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PvhR0dOpTFUV2O+Nr1En+LumDJMwaVlGKE4B0quhE+ZAG65WXuOxRPgxtEHH/vvai
 q4CzFXgf26kIo/8YFz4OKdpzPp8H3esWSrqsQ5uK54xGfc4t41G6H5htZrLYtYpjYm
 IuyAm3rWMM6fqHoadFtkE+5NUVqCNsGWJLXeMFnFZyHFvBGpZciLwyIWfZk0SWbL2f
 ZfgMI57q+8kWxh0Vtn5peuCsfxqE/4ZRSWp9RhrIyxSUd+d3sRark67o07BZ2sNZUq
 WsbQHG6CgbSiArQxqK/nKoN30CgUFpsq0OImkGW36Sn/R8BeYpN3ZhX/wqweruAB7M
 9T+jiI8JKjnVQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=PvhR0dOp
Subject: [Buildroot] [PATCH 5/5] package/libvpx: needs NPTL
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Spenser Gilliland <spenser@gillilanding.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot commit 03ec8aad1e5f535b39224c3e37b82b7c39e781dd bumped
libvpx to version 1.15.0 which includes a commit adding a call to
pthread_setname_np:
https://chromium.googlesource.com/webm/libvpx/+/8cf26c12842b6de94539dc7389e33733ef3ba50b%5E%21/

Also add reverse dependencies when needed. This patch depends on the
webkit patches which are part of this series.

Fixes:
https://autobuild.buildroot.org/results/078340144f4b18b64a4ef9df1fba21564eba2562/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/gstreamer1/gst1-plugins-good/Config.in | 2 +-
 package/libvpx/Config.in                       | 6 +++---
 package/qt5/qt5webengine/Config.in             | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
index 3cf227b78d..6a738faa00 100644
--- a/package/gstreamer1/gst1-plugins-good/Config.in
+++ b/package/gstreamer1/gst1-plugins-good/Config.in
@@ -419,7 +419,7 @@ config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_TWOLAME
 
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_VPX
 	bool "vpx (webm)"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libvpx
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libvpx
 	select BR2_PACKAGE_LIBVPX
 	help
 	  VP8 plugin
diff --git a/package/libvpx/Config.in b/package/libvpx/Config.in
index 6b0400c0a2..f0fb69115e 100644
--- a/package/libvpx/Config.in
+++ b/package/libvpx/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_LIBVPX
 	bool "libvpx"
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # pthread_setname_np()
 	help
 	  A high-quality, open video format that's freely available to
 	  everyone. Supports the VP8 and VP9 formats.
 
 	  http://webmproject.org
 
-comment "libvpx needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "libvpx needs a toolchain w/ NPTL"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
diff --git a/package/qt5/qt5webengine/Config.in b/package/qt5/qt5webengine/Config.in
index 28786bd2c8..6179591399 100644
--- a/package/qt5/qt5webengine/Config.in
+++ b/package/qt5/qt5webengine/Config.in
@@ -25,7 +25,7 @@ config BR2_PACKAGE_QT5WEBENGINE
 	depends on BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_USES_GLIBC # execinfo.h, mallinfo
 	depends on BR2_HOST_GCC_AT_LEAST_4_9 # qt5base-icu
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, libvpx, qt5base-dbus
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libvpx
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_PACKAGE_QT5_GL_AVAILABLE # qt5declarative, qt5base-eglfs
 	depends on BR2_PACKAGE_HAS_LIBEGL # qt5base-eglfs
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
