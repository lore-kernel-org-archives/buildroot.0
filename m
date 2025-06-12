Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11DFAC61CE8
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 10:05:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC30C406EF;
	Thu, 12 Jun 2025 10:05:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4mXmDZDBHTyi; Thu, 12 Jun 2025 10:05:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B3304077F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B3304077F;
	Thu, 12 Jun 2025 10:05:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2FFC8183
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 10:05:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 21420816FA
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 10:05:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hzc2SZl9mRvC for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 10:05:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 01BE280D76
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01BE280D76
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 01BE280D76
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 10:05:21 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 457242859; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 12 Jun 2025 10:05:18 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1uPeo8-004klr-26;
 Thu, 12 Jun 2025 12:05:16 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 12 Jun 2025 12:05:14 +0200
Message-Id: <20250612100515.1133081-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=OhJcPc22VIPsujD2J90CqxBFf6ctfJW7DT6blHpC7dp4hbVeIVH0x2PmFX5bMtE9f9QxXwFVwl2gP+KYTdD9NuH3oXnc1Rpmwb+zn74AKfDl44CukP9oo8s1MI0TLEak58h/MmTncr5sMFiY/A/hk3yiZSM5I0WradUt2sHJChkHdUyXUnpcs2A8cD/yR8gawFpAHigCFiFmq22no7/O8PwzYJMRQWCCzlw8wURrc7QWAEmve+oCM8dK8h+sfWEfUsX7aB16C7FiqSTLsrAiG+YDDaC2+9WCq5zD8R3nUiEyM2rsREq4YzBXvDJm87FKEvY5w0ND5QAeYKxrebVY6g==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=mIzXl/xakFok8mc4d0gAIROuS6czKv9xh0Pzi0v0bTI=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=OhJcPc22
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] package/mesa3d: clarify MESA3D_OPENCL
 dependencies
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
Cc: Romain Naour <romain.naour@gmail.com>, Bernd Kuhls <bernd@kuhls.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit fc7c7d74aa61 ("package/mesa3d: add RustiCL support") extended the
BR2_PACKAGE_MESA3D_OPENCL dependencies to include
BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS &&
BR2_PACKAGE_MESA3D_RUSTICL_SUPPORTED_DRIVER) as an alternative provider.

This is correct as in the kconfig language && has a higher priority than ||,
E.G. A || B || C && D is parsed as A || B || (C && D)

https://docs.kernel.org/kbuild/kconfig-language.html#menu-dependencies

But it is somehat unclear, so add a parenthesis for clarity.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mesa3d/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index fd9beb4704..b5c1d92d68 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -58,8 +58,8 @@ menuconfig BR2_PACKAGE_MESA3D_OPENCL
 		BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI || \
 		BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS || \
 		BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL || \
-		BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS && \
-		BR2_PACKAGE_MESA3D_RUSTICL_SUPPORTED_DRIVER
+		(BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS && \
+		 BR2_PACKAGE_MESA3D_RUSTICL_SUPPORTED_DRIVER)
 	select BR2_PACKAGE_LLVM_RTTI
 	select BR2_PACKAGE_CLANG
 	select BR2_PACKAGE_LIBCLC
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
