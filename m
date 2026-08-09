Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA869C5AD4E
	for <buildroot@archiver.kernel.org>; Sun,  9 Aug 2026 11:11:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4154940531;
	Sun,  9 Aug 2026 11:11:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J1O5jBtMJuZ5; Sun,  9 Aug 2026 11:11:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6886E40532
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786273914;
	bh=Wu9kP/1XOmORCrOIrd3qN2CtkD5sU3F2jMZLGINKmyo=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=dJ8BQiIlgVmQ6k8DxEfkpk2LuGKaTzdsUzxCB+CoxbnCwktvGAw0zozUbzw1ilhOA
	 6ppkE3hh9ylFS4X4OHwXeOrGbMCgBhPbq02R0sgkY20RK0HAe9C8X+arlnvqtfJqUi
	 T/QBi3oC6VWHQ6TYIO5MMJgUSgLqy0975xLLBGvtuOf86E0r74NfsACZVLT/JCYf4x
	 ZGFoUBdZWRkf+cMDfViUxmFLJPFXawy5lnRwzN30ZXzzWMWDqMJmg85HyN51mTohZA
	 ZQZKQxnIQ7sJ52OFUp7Sml22mR7KR8BiezNoiKKiDirJ9KGFbcXJJ1+LcIcDE3pATd
	 VOkmdWrAg1B0g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6886E40532;
	Sun,  9 Aug 2026 11:11:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BEFDD2B6
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 11:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A53D440532
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 11:11:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UwA8EfrOH0KJ for <buildroot@buildroot.org>;
 Sun,  9 Aug 2026 11:11:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 579CE40531
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 579CE40531
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 579CE40531
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 11:11:50 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MuDc7-1x9sZV1pGf-00vu7B; Sun, 09
 Aug 2026 13:11:48 +0200
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Fiona Klute <fiona.klute@gmx.de>
Date: Sun,  9 Aug 2026 13:11:30 +0200
Message-ID: <20260809111130.2074795-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:dscls7sqLF/NVYEBQlmzXkGTN+CvjC2YuV9psSlJaDQlGVw48fz
 ajx3Dx4V6iie4Ln3vW9uURZFdBLZc8/iQF4zDnZBc9HY+4yfw5e4Xw5WDQaNQoIV56Lfuei
 /k1uTOIyVK+ApqcpbwY9wO5xlTkJUxM0U1gKifMCjb/lG1Sqh3c1zHMjC4vdQMnki+UhsPX
 m2K/cRBaMBUxxptSsviig==
UI-OutboundReport: notjunk:1;M01:P0:aBjjFCLsf/w=;GJYgn/2yEiBoBpAH2VXVURCxHej
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1786273908; x=1786878708; i=fiona.klute@gmx.de;
 bh=hPJPPVmsXIrG+bW1DkesDuXTON55qGcGkloEXT0emVo=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=R/XOUwvlhJDujvmpDq2frUphGH4orhtNK7D+FsWlkRl8nuPsfKyWVQ6L/MOOojwI
 mmqNTObMEntw2rkxOMsQAyc+e5jsLd8S0HBsdpew0pUePqIEvwIhtJmQkGlbprZsQ
 z2YbeX4yBgxf5asXt+OuCWoi+4c8GVrhyIwqLo8LY46IlTu0fjfqL69D1gQACd7yE
 6xoPbEG5eYYmAyO2djsvWn5DdCtzLCUL5OSxvYsnRJjHT1CnZ8Thxc6YHWzZM5NK8
 FsCoYCa0l3cBIhpqMJuOCfDGIkAKFT8oTzAGVsUJaaRWX5Kg3amHbT9CTgQyYO8aa
 noZyeiL55HAz7pAhKA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=R/XOUwvl
Subject: [Buildroot] [PATCH 1/1] package/uboot-tools: select p11-kit when
 building target mkeficapsule
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since upstream commit 0c716a157be460006a4b762625de329b5e36dbf9 (first
release: v2026.07) mkeficapsule supports PKCS#11 keys, and in turn
requires GnuTLS with PKCS#11 support.

Without it, building mkeficapsule for the target fails:

  HOSTLD  tools/mkeficapsule
/home/fiona/br-test-pkg/bootlin-armv5-uclibc/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/14.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: tools/mkeficapsule.o: in function `main':
mkeficapsule.c:(.text.startup+0x530): undefined reference to `gnutls_pkcs11_init'
/home/fiona/br-test-pkg/bootlin-armv5-uclibc/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/14.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: mkeficapsule.c:(.text.startup+0x544): undefined reference to `gnutls_pkcs11_add_provider'
/home/fiona/br-test-pkg/bootlin-armv5-uclibc/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/14.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: mkeficapsule.c:(.text.startup+0x5fc): undefined reference to `gnutls_pkcs11_obj_list_import_url4'
/home/fiona/br-test-pkg/bootlin-armv5-uclibc/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/14.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: mkeficapsule.c:(.text.startup+0x620): undefined reference to `gnutls_x509_crt_import_pkcs11'
/home/fiona/br-test-pkg/bootlin-armv5-uclibc/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/14.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: mkeficapsule.c:(.text.startup+0x1334): undefined reference to `gnutls_pkcs11_deinit'
collect2: error: ld returned 1 exit status

The error can be reproduced using "utils/test-pkg -c" with the
following config:

BR2_PACKAGE_UBOOT_TOOLS=y
BR2_PACKAGE_UBOOT_TOOLS_MKEFICAPSULE=y

For host-uboot-tools this was solved in Buildroot commit
6597563da7bb359eac57c8fb70e4efc3d6ef4c02 "package/gnutls: add host
support for pkcs11" by unconditionally enabling PKCS#11 support for
host-gnutls. For the target a more fine-grained approach is desirable,
so instead select BR2_PACKAGE_P11_KIT if
BR2_PACKAGE_UBOOT_TOOLS_MKEFICAPSULE=y and propagate dependencies.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/uboot-tools/Config.in | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/uboot-tools/Config.in b/package/uboot-tools/Config.in
index da6cd65252..b7fd6ff17d 100644
--- a/package/uboot-tools/Config.in
+++ b/package/uboot-tools/Config.in
@@ -68,17 +68,22 @@ config BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE
 
 config BR2_PACKAGE_UBOOT_TOOLS_MKEFICAPSULE
 	bool "mkeficapsule"
-	depends on !BR2_STATIC_LIBS # gnutls
+	depends on !BR2_STATIC_LIBS # gnutls, p11-kit
+	depends on BR2_TOOLCHAIN_HAS_THREADS # p11-kit
+	depends on BR2_USE_MMU # p11-kit
 	depends on BR2_USE_WCHAR # gnutls
 	select BR2_PACKAGE_GNUTLS
+	select BR2_PACKAGE_P11_KIT
 	help
 	  Install the mkeficapsule tool on the target system
 
 	  The mkeficapsule tool from Das U-Boot bootloader, which allows
 	  generation of UEFI capsule binaries.
 
-comment "mkeficapsule support needs a toolchain w/ wchar, dynamic library"
-	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS
+comment "mkeficapsule support needs a toolchain w/ wchar, threads, dynamic library"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS \
+		|| BR2_STATIC_LIBS
 
 config BR2_PACKAGE_UBOOT_TOOLS_MKENVIMAGE
 	bool "mkenvimage"
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
