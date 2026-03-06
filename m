Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E249DFC9EC0
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 23:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 987C7613AA;
	Fri,  6 Mar 2026 23:25:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NXf85SPZj4JO; Fri,  6 Mar 2026 23:25:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 639E8613C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772839539;
	bh=72DP/IlC17lg0cTgvbS14ntHjJXEJqmz+TOrUP+Qvi8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KffpJHbFzjKgodK3XDvPvvThug7KxTj4VrWPxSj5tSXsExxgbzRxUlwN6QfFs+xaH
	 RggHSgZaKew5lfP5f0Ykt6CZk0Ja95rrfZd2r7uTEfqkbS2lCftWLzEH5eOxm5EWEo
	 wY1Kb5Ewu881gr9RL2Kxwi7RDsmAaWHRcY9RHu45RikzTXnAoOsCuYEVKz2VMdsiCJ
	 sugFkUbWOD5UjY/CxtKzQ21Zq5HF4tT1L7lZyNHxB3qr1DHAf/R4dUuZE9tepZIyva
	 ddZ1y8Abs0CWdsHKR/J08b8e6JajSTWpXuYp+9m7gNFby71n5qOw3KGHtUCnOoy+DT
	 Hf5narl9bd5gw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 639E8613C9;
	Fri,  6 Mar 2026 23:25:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AE5EA169
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 23:25:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 943F741F31
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 23:25:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ohdfdXweWjoO for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 23:25:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8F02C41EF7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F02C41EF7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8F02C41EF7
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 23:25:36 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc67.dip0.t-ipconnect.de [84.161.188.103])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2C173A4C08E6;
 Sat,  7 Mar 2026 00:25:34 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58940)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vyeY1-000000003hQ-3NRA;
 Fri, 06 Mar 2026 23:25:33 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Steve Kenton <skenton@ou.edu>
Date: Sat,  7 Mar 2026 00:25:33 +0100
Message-ID: <20260306232533.466162-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772839534;
 bh=O9NZAZbTRpz0jVGfcJMb9TTPnTjRjAskK62XcOrjwzY=;
 h=From:To:Cc:Subject:Date:From;
 b=g1hZf4ujuiwictNMeNnXDOxfv25atNCX6CslnruI04FLRt5K8V5sd5YuSFO13Y01g
 gKlbNgIerQRKAwpyZB83kok8jA4e/O4i7WcFQnOZJMJ2wuY3LE/36AO6fX3T68TqUm
 11QlN3JqyNIeFqjVT47Auhv3gukbUnDgjWjVSP23IVOXC1V7f+u5SQRWPGkjesAie2
 5fNSPGpjDW5wkLyfS633HTj9ri3wCOjDg0iHqdG9//5mzjGl0Q5zMqAeqGfOOg/LYe
 nDKIteZ6/kCII+CxgOsn/W1Lnt+hzOXlCI+ld+UvQ4YvViHFEM8ogHJ6xD/p4Mlgun
 VbHL6wjmZnXWA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=g1hZf4uj
Subject: [Buildroot] [PATCH 1/1] package/memtest86: bump version to 8.00
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

https://github.com/memtest86plus/memtest86plus/releases/tag/v8.00

Upstream merged memtest.bin and memtest.efi into mt86plus:
https://github.com/memtest86plus/memtest86plus/commit/71d061a4c7cd22fe882bb025b3a061745d952d4c

and renamed the build directories:
https://github.com/memtest86plus/memtest86plus/commit/a10664a2515a81b07ab8ae999f91e8151a87eec6

Upstream commit
https://github.com/memtest86plus/memtest86plus/commit/6f4ec848c4e9291626236bca457baf7b95542325
removed the override of $CC, for details of the problem see this thread:
https://lists.buildroot.org/pipermail/buildroot/2023-December/366174.html

and in fact the first build command now reads

/home/bernd/buildroot/output/per-package/memtest86/host/bin/i686-buildroot-linux-gnu-gcc
 -m32 -x assembler-with-cpp -c -I../../boot -o boot/x86/startup.o ../../boot/x86/startup32.S

instead of this command seen with version 7.20:
gcc -m32 -x assembler-with-cpp -c -I../boot -o boot/startup.o ../boot/startup32.S

This should hopefully fix the build on non-x86 hosts:
https://autobuild.buildroot.net/results/fc1/fc14be4f2e5b1db2f7313156b50c9e2e298b06e9/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Deliberately not used "Fixed:" tag because I cannot easily test the
build on non-x86 hosts.

 package/memtest86/Config.in      |  6 +++---
 package/memtest86/memtest86.hash |  2 +-
 package/memtest86/memtest86.mk   | 12 +++++-------
 3 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/package/memtest86/Config.in b/package/memtest86/Config.in
index c9a8cf749f..3883176efb 100644
--- a/package/memtest86/Config.in
+++ b/package/memtest86/Config.in
@@ -30,17 +30,17 @@ config BR2_PACKAGE_MEMTEST86
 	  line:
 
 	  menuentry "Start Memtest86+ (USB keyboards)" {
-	      linux16 /boot/memtest.bin keyboard=both
+	      linux16 /boot/mt86plus keyboard=both
 	  }
 	  menuentry "Start Memtest86+ (serial line)" {
-	      linux16 /boot/memtest.bin console=ttyS0,115200
+	      linux16 /boot/mt86plus console=ttyS0,115200
 	  }
 
 	  Or for UEFI BIOS using the Linux 32-bit or 64-bit boot
 	  protocols, using USB keyboard:
 
 	  menuentry "Start Memtest86+ (USB keyboards)" {
-	      linux /EFI/BOOT/memtest.efi keyboard=both
+	      linux /EFI/BOOT/mt86plus keyboard=both
 	  }
 
 	  Other boot loaders will have similar requirements.
diff --git a/package/memtest86/memtest86.hash b/package/memtest86/memtest86.hash
index 20d96dce95..109e9f3761 100644
--- a/package/memtest86/memtest86.hash
+++ b/package/memtest86/memtest86.hash
@@ -1,3 +1,3 @@
 # locally computed using sha256sum
-sha256  8bad4b5788bc28e4dd1db78c9069bd0c65a4a6baf16409ab537c795bb04578b3  memtest86-7.20.tar.gz
+sha256  ec7edde55f60d12d9e7bc1cc560837cdbaa14cf00020cebb4a1d7fe4afeddb4a  memtest86-8.00.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/memtest86/memtest86.mk b/package/memtest86/memtest86.mk
index 4f9c1b9a28..30336a3dc5 100644
--- a/package/memtest86/memtest86.mk
+++ b/package/memtest86/memtest86.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MEMTEST86_VERSION = 7.20
+MEMTEST86_VERSION = 8.00
 MEMTEST86_SITE = $(call github,memtest86plus,memtest86plus,v$(MEMTEST86_VERSION))
 MEMTEST86_LICENSE = GPL-2.0
 MEMTEST86_LICENSE_FILES = LICENSE
@@ -12,10 +12,10 @@ MEMTEST86_INSTALL_IMAGES = YES
 MEMTEST86_INSTALL_TARGET = NO
 
 ifeq ($(BR2_i386),y)
-MEMTEST86_BUILD_DIR = build32
+MEMTEST86_BUILD_DIR = build/i586
 else
 ifeq ($(BR2_x86_64),y)
-MEMTEST86_BUILD_DIR = build64
+MEMTEST86_BUILD_DIR = build/x86_64
 endif
 endif
 
@@ -24,10 +24,8 @@ define MEMTEST86_BUILD_CMDS
 endef
 
 define MEMTEST86_INSTALL_IMAGES_CMDS
-	$(foreach ext, bin efi, \
-		$(INSTALL) -m 0755 -D $(@D)/$(MEMTEST86_BUILD_DIR)/memtest.$(ext) \
-			$(BINARIES_DIR)/memtest.$(ext)
-	)
+	$(INSTALL) -m 0755 -D $(@D)/$(MEMTEST86_BUILD_DIR)/mt86plus \
+		$(BINARIES_DIR)/mt86plus
 endef
 
 $(eval $(generic-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
