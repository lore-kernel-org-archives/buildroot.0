Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B35DCCF9F8
	for <buildroot@archiver.kernel.org>; Wed,  5 Nov 2025 18:17:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27E6B8290B;
	Wed,  5 Nov 2025 18:17:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3yoCTuekjGAc; Wed,  5 Nov 2025 18:17:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59BD584434
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59BD584434;
	Wed,  5 Nov 2025 18:17:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 22579B00
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 18:17:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B60C34121A
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 18:17:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IQOxZstP_mEL for <buildroot@buildroot.org>;
 Wed,  5 Nov 2025 18:17:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3749B40304
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3749B40304
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3749B40304
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 18:17:45 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0d15.dip0.t-ipconnect.de [91.58.13.21])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 86128A4C0C4D
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 19:17:42 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46594)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vGi4j-000000000fY-44iK
 for buildroot@buildroot.org; Wed, 05 Nov 2025 18:17:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  5 Nov 2025 19:17:41 +0100
Message-ID: <20251105181741.1333777-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1762366662;
 bh=upBOZqJsw3vPYrbmUNZmpL2i0R2aGP+npj5dU7HvS4M=;
 h=From:To:Subject:Date:From;
 b=HYIB33tjGdB3zhCISV2FsGtVRUGJ38+VsGqy+6zBYnsA8R/+kA8Nrq62N93Yn665p
 67JFT/zbHk3H8kn+9w66y2B1vA0sb3cIBrMob6lQpd3NmTBAn6HFRq2QrKi6zF4xcx
 HmUPb0e+JgbQsidfkD0rUOZBajawspUwcu9e9AXZo9WRCc17E9SDmTHmJpvdRTXJA7
 MrNLKUH7cOsHMoQshXv8cf3HAiXl0qFqlpIZOGh+GtlSIbwPBbkULEDUfke4i+HP4b
 qVxg65qAXc/iZpQYDdnrCgZupCRc5nvkWtuF+/8L1RaxYxc6m6FUYhLdsnI+nnsnNf
 77rSb8uzGaVXg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=HYIB33tj
Subject: [Buildroot] [PATCH 1/1] package/uboot-tools: add dependency to
 gnutls for mkeficapsule
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

Buildroot commit 14a0169714cd5c35be40faadc066412f144bc1a6 added gnutls
as dependency to BR2_PACKAGE_UBOOT_TOOLS_MKEFICAPSULE in uboot-tools.mk
without adding the dependency and its reverse dependencies to the
Config.in causing a build error:

Makefile:578: *** gnutls is in the dependency chain of uboot-tools that
 has added it to its _DEPENDENCIES variable without selecting it or
 depending on it from Config.in.  Stop.

Fixes:
https://autobuild.buildroot.net/results/39d/39db5ae9aad95e4976c3d8a40aca95b26568f8ea/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/uboot-tools/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/uboot-tools/Config.in b/package/uboot-tools/Config.in
index e8bbf3a16e..1e9129d223 100644
--- a/package/uboot-tools/Config.in
+++ b/package/uboot-tools/Config.in
@@ -68,12 +68,17 @@ config BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE
 
 config BR2_PACKAGE_UBOOT_TOOLS_MKEFICAPSULE
 	bool "mkeficapsule"
+	depends on !BR2_STATIC_LIBS # gnutls
+	depends on BR2_USE_WCHAR # gnutls
 	help
 	  Install the mkeficapsule tool on the target system
 
 	  The mkeficapsule tool from Das U-Boot bootloader, which allows
 	  generation of UEFI capsule binaries.
 
+comment "mkeficapsule https support needs a toolchain w/ wchar, dynamic library"
+	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS
+
 config BR2_PACKAGE_UBOOT_TOOLS_MKENVIMAGE
 	bool "mkenvimage"
 	help
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
