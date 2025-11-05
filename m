Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95120CCFA1B
	for <buildroot@archiver.kernel.org>; Wed,  5 Nov 2025 18:51:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42BB4613A3;
	Wed,  5 Nov 2025 18:51:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mN0vDTfatPTa; Wed,  5 Nov 2025 18:51:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EAB461147
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EAB461147;
	Wed,  5 Nov 2025 18:51:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AC3E8462
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 18:51:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9DDFE40EE0
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 18:51:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bjzgVeClP0T3 for <buildroot@buildroot.org>;
 Wed,  5 Nov 2025 18:51:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4861C40A18
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4861C40A18
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4861C40A18
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 18:51:52 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0d15.dip0.t-ipconnect.de [91.58.13.21])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F2677A4C0F46;
 Wed,  5 Nov 2025 19:51:49 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36282)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vGibl-000000006mh-2f1P;
 Wed, 05 Nov 2025 18:51:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Laurent Vivier <laurent@vivier.eu>
Date: Wed,  5 Nov 2025 19:51:49 +0100
Message-ID: <20251105185149.1601939-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1762368710;
 bh=09In0m3l5YPobtD0sHsOa6F9Qvt410flXiQy2wvnoeM=;
 h=From:To:Cc:Subject:Date:From;
 b=JwmebEkgAfCK2uH2a6gcLvMBouIBNOOUTGBdmqbymQh/+kJCkiVSWszYOAdFioMac
 Roqd4gP6CsfUnwa2RKhM/EQ0+tBpnrf5uKUiRKWsMjLd4J1zrqJ1As2j1wGDPYba7s
 ZIzxmnaJitgJgiBTBZ6L9BKc/Bg/8Ro7Jyb56tVqamY01lOL/BRUinNzuN/oVpgGr8
 CnGo7Fc7m5pwMP8+J49AbxwcyF92qu9fdBbev0L3IXhDbIj4yEKHnQqllR5bWFjsnF
 ARMP3zJYoFfT9ngQYpgt7v7/Wj1LM9mETIDKRL85nSD+ClHnoEDy2Ful/oUPK1yP26
 TFczyCtiuTn9g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=JwmebEkg
Subject: [Buildroot] [PATCH 1/1] package/nvme: needs dynamic library
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

Buildroot commit f75faf43506e5090857eb4a9d876d430ff34a972 bumped nvme
from 1.12 to 2.15 which depends on dynamic library:

../libnvme-wrap.c:8:10: fatal error: dlfcn.h: No such file or directory
    8 | #include <dlfcn.h>

Fixes:
https://autobuild.buildroot.net/results/5bc/5bccbbd7ad4ce4a6898f6bcfd0a92c09e61324ca/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/nvme/Config.in      | 5 +++++
 package/petitboot/Config.in | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/nvme/Config.in b/package/nvme/Config.in
index 16b8726144..a27ddf50a9 100644
--- a/package/nvme/Config.in
+++ b/package/nvme/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_NVME
 	bool "nvme"
+	depends on !BR2_STATIC_LIBS # dlfcn.h
 	depends on BR2_USE_MMU # libnvme
 	select BR2_PACKAGE_LIBNVME
 	help
@@ -7,3 +8,7 @@ config BR2_PACKAGE_NVME
 	  Express (optimized PCI Express SSD interface) devices.
 
 	  https://github.com/linux-nvme/nvme-cli
+
+comment "nvme needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+	depends on BR2_USE_MMU
diff --git a/package/petitboot/Config.in b/package/petitboot/Config.in
index 50d5a4da70..76cbbe9c6d 100644
--- a/package/petitboot/Config.in
+++ b/package/petitboot/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_PETITBOOT
 	depends on BR2_PACKAGE_KEXEC_ARCH_SUPPORTS || BR2_PACKAGE_KEXEC_LITE_ARCH_SUPPORTS
 	depends on BR2_USE_MMU # lvm2, agetty
 	depends on BR2_USE_WCHAR # elfutils, kexec-lite
-	depends on !BR2_STATIC_LIBS # elfutils, kexec-lite, lvm2
+	depends on !BR2_STATIC_LIBS # elfutils, kexec-lite, lvm2, nvme
 	depends on BR2_TOOLCHAIN_HAS_THREADS # elfutils, kexec-lite, lvm2
 	depends on BR2_PACKAGE_HAS_UDEV
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 || !BR2_PACKAGE_KEXEC_ARCH_SUPPORTS # kexec
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
