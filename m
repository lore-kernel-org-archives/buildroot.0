Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5987E7716A
	for <buildroot@archiver.kernel.org>; Sun, 15 Dec 2024 10:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86FDB847EC;
	Sun, 15 Dec 2024 10:56:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JMKu4qMIyo83; Sun, 15 Dec 2024 10:56:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A72384634
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A72384634;
	Sun, 15 Dec 2024 10:56:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7AC6869
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 10:56:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 694644135B
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 10:56:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gc1CYQapLWOr for <buildroot@buildroot.org>;
 Sun, 15 Dec 2024 10:56:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4D7FB41347
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D7FB41347
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4D7FB41347
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 10:56:20 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c243.dip0.t-ipconnect.de [79.214.194.67])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 388A6A4C3E88;
 Sun, 15 Dec 2024 11:55:38 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54102)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tMmHh-000000007l0-1QxF;
 Sun, 15 Dec 2024 10:55:37 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 15 Dec 2024 11:55:36 +0100
Message-Id: <20241215105537.1396270-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241215105537.1396270-1-bernd@kuhls.net>
References: <20241215105537.1396270-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1734260138;
 bh=67KPeyEuMFI1LeC4bzhWcSYcMdNRRiS3GtO/zcaQTUE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WAfBMOxKzI114cyaY/lmE90f79P7T/7Nyu3Ef3mWXa5YaOI63GK3GpwTjJF7mD9mT
 5Fz6r2jug4VZazqzhTysw/7akIB6SG8qgAjfjysLlB3Y24u//3MtsNGL3/NPNGj9RN
 UHuGiKsoa/1HRSknfYPj5TKNam5hyINR+6Ohr6dW2aoA4PQ9ZAqIhoLOuzutFsxkaS
 gtZJa0dUAyMVqjxEaS90cn9k0DX9Km0f1FbNjb/t3HDx9XZ19RZzGLFPXOegmfHBoT
 yikC6pRSXxLBlclzyorOnUiYoGkfq2nQ4iP2K/gZn+jQj+h96HcrVsJLRWtOZ5v0eQ
 2qGRnoo/aBYcw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202412041019 header.b=WAfBMOxK
Subject: [Buildroot] [PATCH 4/5] package/wpewebkit: needs NPTL
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

Fixes build error

/home/buildroot/buildroot/output/build/wpewebkit-2.44.4/Source/WTF/wtf/StackBounds.cpp: In static member function 'static WTF::StackBounds WTF::StackBounds::newThreadStackBounds(WTF::PlatformThreadHandle)':
/home/buildroot/buildroot/output/build/wpewebkit-2.44.4/Source/WTF/wtf/StackBounds.cpp:117:5: error: 'pthread_getattr_np' was not declared in this scope; did you mean 'pthread_attr_t'?
  117 |     pthread_getattr_np(thread, &sattr);

using this defconfig (and libvpx bump to 1.15.0 reverted)

BR2_arm=y
BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_PTHREADS=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PER_PACKAGE_DIRECTORIES=y
BR2_PACKAGE_RPI_USERLAND=y
BR2_PACKAGE_LIBGTK3=y
BR2_PACKAGE_WPEWEBKIT=y

A backport of this patch should be considered because the code is
present since 2011:
https://github.com/WebKit/WebKit/blame/03f678fac7076e4d69318bfaae065e4c0eab0f9e/Source/WTF/wtf/StackBounds.cpp#L117

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/wpewebkit/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index 8016367058..512f7ea672 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -16,11 +16,11 @@ config BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 
-comment "wpewebkit needs a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 10, host gcc >= 4.9"
+comment "wpewebkit needs a toolchain w/ C++, wchar, NPTL, dynamic library, gcc >= 10, host gcc >= 4.9"
 	depends on BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
 	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \
-		|| !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
+		|| !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS \
 		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_10 \
 		|| !BR2_HOST_GCC_AT_LEAST_4_9
 
@@ -35,7 +35,7 @@ config BR2_PACKAGE_WPEWEBKIT
 	depends on !BR2_BINFMT_FLAT # icu
 	depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu, host-ruby
 	depends on BR2_INSTALL_LIBSTDCPP # harfbuzz, icu
-	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland, icu, libsoup3
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	depends on BR2_USE_WCHAR # icu, libsoup3
 	depends on BR2_PACKAGE_HAS_LIBGLES # libepoxy
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
