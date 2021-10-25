Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3F09C433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 20:00:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FB1E60C4B
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 20:00:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4FB1E60C4B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 19D05400F0;
	Mon, 25 Oct 2021 20:00:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GVsc_wBAI7ha; Mon, 25 Oct 2021 20:00:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 18C6E40288;
	Mon, 25 Oct 2021 20:00:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4F13C1BF309
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 20:00:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3CE1A40288
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 20:00:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GXX4OzZZkpqh for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 20:00:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4D212400F0
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 20:00:54 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id w16so50049plg.3
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 13:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vKy89oZdpVy99hgUbXftcEE6BY9+VSC3aRI9ClCIwe8=;
 b=TJ+0qf+1XkztU39CX1bmgsZxwZWs1DH3LbtbJoe4PQkJx9aOXTOEvJhiG6F2pAozkI
 i1d1VbrvV0ZEDUvIw7hhooNGP2DNgtg17/GvKO0wuhkANEWyCjtEO7/gFemaJ56uthgI
 BGXgnybijOf+AZwk5uJ/d6n0z8X9fNa7lJ99gwWWVRrIUiTy9XyPC+2wt9B/FutbVnaQ
 sbGgTzkFQk5RYqAV1uu8P3Yb96XR23roN251a7Vq1j2JNxJcRVMgXe7levV28tu1tAGb
 FSxwtCdo+KD1n5qhTTopSrWordfkyNfkMjyQcXvXkhBrRKRTX7pVxliBGyYjUFMdMMuR
 M65g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vKy89oZdpVy99hgUbXftcEE6BY9+VSC3aRI9ClCIwe8=;
 b=UvGPD+fx/6pIALHzVAo6AEOVJCXazeqds4maaJRxNyAijk0j3U/0ZPkirNhxKi7WOI
 pX6jQeMvLy/UxZbgyVMUBgxRc9Ies/4zLHjNe9n5/zBUFLxzrsw31iKJvgfwvDTaTpLt
 LlWpfU3ROSwGl5n1iqK3EQYVcBCofrXZjUT0+mX16UaFrzAqcxLVrCgAPDanjMi9oAkR
 0EnU8fbIx7pPmN4FJKLUVCIoDwn3Abcb2ngYRsQlbSNi4HE9jKdbpxk1AIvp9wSeS3MT
 YdhfbTgbh+VVVW5Ar8C82eUk9xqzcMZ5pXDtqxLSeduZBcxf+sNXJzJHjuVurAgCBHEu
 q9lw==
X-Gm-Message-State: AOAM533HQpwPGagSkliBg8iQGyjKmYMQIK5gEc633AomOrBwigXYqkr0
 JejR82Db+oaMd5NijscguH7pwxXyF7Q=
X-Google-Smtp-Source: ABdhPJyW541gei2BQElN2/xgatPRHEORn3WI8MCzpP1TeOJAwmoAP7FjOObpxlT2c4vd3nfbpxpsGA==
X-Received: by 2002:a17:902:e0c4:b0:140:25e5:c06c with SMTP id
 e4-20020a170902e0c400b0014025e5c06cmr18028337pla.76.1635192053420; 
 Mon, 25 Oct 2021 13:00:53 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id y6sm16562520pfi.154.2021.10.25.13.00.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 13:00:53 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 25 Oct 2021 13:00:49 -0700
Message-Id: <20211025200049.381077-1-aduskett@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/qemu: bump host gcc requirements:
 propagate to all reverse dependencies
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
Cc: Daniel Price <daniel.price@gmail.com>, Anisse Astier <anisse@astier.eu>,
 Romain Naour <romain.naour@gmail.com>, Martin Bark <martin@barkynet.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

qemu now requires gcc >= 7.5, however, as there is no BR2_HOST_GCC_AT_LEAST_7_5,
set the host gcc requirements to 8.

In addition:
  - Propagate the host gcc dependency to gobject-introspection as it was missing
    to begin with.
  - Propagate the host gcc dependency to nodejs
  - Add a missing comment in package/qemu/Config.in.host explaining the host gcc
    requirements if host gcc < 8.

Fixes:
http://autobuild.buildroot.org/results/32b7fee1f8cda2290fd4bd8ac9fe78bacb25b652

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/gobject-introspection/Config.in | 3 ++-
 package/nodejs/Config.in                | 6 +++---
 package/qemu/Config.in.host             | 7 ++++++-
 3 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/package/gobject-introspection/Config.in b/package/gobject-introspection/Config.in
index bacf44363c..15b6bc3bfa 100644
--- a/package/gobject-introspection/Config.in
+++ b/package/gobject-introspection/Config.in
@@ -13,6 +13,7 @@ config BR2_PACKAGE_GOBJECT_INTROSPECTION
 	# compile errors with locale.c. As such, require 4.9 until this
 	# can be verified.
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	depends on BR2_HOST_GCC_AT_LEAST_8 # qemu
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	# gobject-introspection does not require python3 to run on the
 	# target; however, because the tools run in a qemu wrapper, a
@@ -41,7 +42,7 @@ comment "gobject-introspection needs python3"
 	depends on !BR2_PACKAGE_PYTHON3
 	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
 
-comment "gobject-introspection needs a glibc toolchain, gcc >= 4.9"
+comment "gobject-introspection needs a glibc toolchain, gcc >= 4.9, host gcc >= 8"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index 771f735e97..99c76bc3de 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -8,18 +8,18 @@ config BR2_PACKAGE_NODEJS_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET
 
-comment "nodejs needs a toolchain w/ C++, dynamic library, NPTL, gcc >= 7, wchar"
+comment "nodejs needs a toolchain w/ C++, dynamic library, NPTL, gcc >= 7, wchar, host gcc >= 8"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_NODEJS_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
-		!BR2_HOST_GCC_AT_LEAST_7 || !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || !BR2_USE_WCHAR
+		!BR2_HOST_GCC_AT_LEAST_8 || !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || !BR2_USE_WCHAR
 
 config BR2_PACKAGE_NODEJS
 	bool "nodejs"
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_NODEJS_ARCH_SUPPORTS
-	depends on BR2_HOST_GCC_AT_LEAST_7
+	depends on BR2_HOST_GCC_AT_LEAST_8 # qemu
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7
 	depends on BR2_USE_WCHAR
 	# uses fork()
diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index a5b38c081b..df5d921125 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -37,7 +37,7 @@ config BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
 config BR2_PACKAGE_HOST_QEMU
 	bool "host qemu"
 	depends on BR2_PACKAGE_HOST_QEMU_SYSTEM_ARCH_SUPPORTS || BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
-	depends on BR2_HOST_GCC_AT_LEAST_7
+	depends on BR2_HOST_GCC_AT_LEAST_8
 	select BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE \
 		if !BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE && BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
 	select BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE \
@@ -50,6 +50,11 @@ config BR2_PACKAGE_HOST_QEMU
 
 	  http://www.qemu.org
 
+comment "host-qemu needs a host gcc >= 8"
+	depends on BR2_PACKAGE_HOST_QEMU_SYSTEM_ARCH_SUPPORTS || \
+		BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORT
+	depends on !BR2_HOST_GCC_AT_LEAST_8
+
 if BR2_PACKAGE_HOST_QEMU
 
 comment "Emulators selection"
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
