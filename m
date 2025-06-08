Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B81DBC5AD49
	for <buildroot@archiver.kernel.org>; Sun,  8 Jun 2025 10:58:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7650F409BE;
	Sun,  8 Jun 2025 10:58:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XMBgFXQ4MdBn; Sun,  8 Jun 2025 10:58:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5F03409C3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5F03409C3;
	Sun,  8 Jun 2025 10:58:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2164AC8
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 10:58:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D1A360BB8
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 10:58:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JSDWMyiKZHrw for <buildroot@buildroot.org>;
 Sun,  8 Jun 2025 10:58:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0EBF360AC5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EBF360AC5
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0EBF360AC5
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 10:58:51 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:656e:cf44:475c:a8d2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id ECC2AB00572;
 Sun,  8 Jun 2025 12:58:47 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
	Romain Naour <romain.naour@smile.fr>
Date: Sun,  8 Jun 2025 12:58:40 +0200
Message-ID: <20250608105840.14711-1-ju.o@free.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1749380330;
 bh=HkynhTGm/r+Yf4WCU/nvxXEdz0fNN98c0YZxreF/qVU=;
 h=From:To:Cc:Subject:Date:From;
 b=G7ln6aOkrFICALsx+zYP0LpzJFTznQHUXrtuJRxCbUI1nYv2t9VaU45U1vVlTFSjh
 ecfDlbapdDozxokIkTZO7Kl6ULq5Svq2dRWiSeHhZq8y8MBFobKWYT+/y3Os+gfErS
 llndpCr2eyr25YsSpgSl34G4omkNxKlSaDiCwi7MGki/eH2Ny0khehmBZDOtzBSHNS
 uTSF9ONZQRweGdoFlSjM8AqST0tYidnq4qqXf64lHVppN3wxPvAELBy826TpTKfRDM
 adwvRdtL3BzwBorR8MSC9yf2KUwoM6G7uDNhDVLOR7Y6DJOmapw2flZFfa+m/Wx6tf
 F7i9yYFLPKmhg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=G7ln6aOk
Subject: [Buildroot] [PATCH 1/1] package/spirv-llvm-translator: propagate
 llvm depends on wchar
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

The target package spirv-llvm-translator was instroduced in Buildroot
commit [1] without propagating the llvm dependency on toolchains with
wchar support.

This commit fixes this issue.

Fixes:

    WARNING: unmet direct dependencies detected for BR2_PACKAGE_LLVM
      Depends on [n]: BR2_PACKAGE_LLVM_ARCH_SUPPORTS [=y] && BR2_TOOLCHAIN_GCC_AT_LEAST_7 [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_INSTALL_LIBSTDCPP [=y] && !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 [=n] && !BR2_STATIC_LIBS [=n] && BR2_USE_WCHAR [=n] && BR2_HOST_GCC_AT_LEAST_7 [=y]
      Selected by [y]:
      - BR2_PACKAGE_SPIRV_LLVM_TRANSLATOR [=y] && BR2_PACKAGE_LLVM_ARCH_SUPPORTS [=y] && BR2_TOOLCHAIN_GCC_AT_LEAST_7 [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_INSTALL_LIBSTDCPP [=y] && !BR2_STATIC_LIBS [=n] && BR2_HOST_GCC_AT_LEAST_7 [=y]

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/58f9c7b83c86b06e1a086dbe884e216799410118

Cc: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/spirv-llvm-translator/Config.in | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/spirv-llvm-translator/Config.in b/package/spirv-llvm-translator/Config.in
index 73ca787d8a..91bd7f5ba3 100644
--- a/package/spirv-llvm-translator/Config.in
+++ b/package/spirv-llvm-translator/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_SPIRV_LLVM_TRANSLATOR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_USE_WCHAR # llvm
 	depends on BR2_HOST_GCC_AT_LEAST_7 # host-llvm
 	select BR2_PACKAGE_LLVM
 	select BR2_PACKAGE_SPIRV_HEADERS
@@ -15,8 +16,9 @@ config BR2_PACKAGE_SPIRV_LLVM_TRANSLATOR
 
 	  https://github.com/khronosGroup/SPIRV-LLVM-Translator
 
-comment "spirv-translator needs a toolchain w/ threads, C++, gcc >= 7, dynamic library, host gcc >= 7"
+comment "spirv-translator needs a toolchain w/ wchar, threads, C++, gcc >= 7, dynamic library, host gcc >= 7"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 \
-		|| BR2_STATIC_LIBS || !BR2_HOST_GCC_AT_LEAST_7
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
+		BR2_STATIC_LIBS || !BR2_USE_WCHAR || \
+		!BR2_HOST_GCC_AT_LEAST_7
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
