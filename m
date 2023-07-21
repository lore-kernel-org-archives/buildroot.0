Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07092EB64DD
	for <buildroot@archiver.kernel.org>; Fri, 21 Jul 2023 20:28:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8957341E7B;
	Fri, 21 Jul 2023 20:28:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8957341E7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EH4B1zczBxut; Fri, 21 Jul 2023 20:28:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64CD941E92;
	Fri, 21 Jul 2023 20:28:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64CD941E92
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 12A7B1BF299
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 20:28:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD4CB6131C
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 20:28:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD4CB6131C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lYt3XStDhRLi for <buildroot@lists.busybox.net>;
 Fri, 21 Jul 2023 20:28:13 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6F5DE612F8
 for <buildroot@buildroot.org>; Fri, 21 Jul 2023 20:28:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F5DE612F8
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id D7EF913F87E;
 Fri, 21 Jul 2023 22:28:07 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 21 Jul 2023 22:27:57 +0200
Message-ID: <20230721202757.15824-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1689971290;
 bh=PcCspBOsflaJnzAS3VDWfvQTTrpg6jLx9ds3qMD4Apg=;
 h=From:To:Cc:Subject:Date:From;
 b=bcizYEfivceY1SjD/GPbdZj6geXN5DL2kg54i0yxV3pEy2TmdNpclUgmALrLvOJEj
 OGTS9rBSnWKGi05ehtkk6xsuW5Lt9HlLXrwdYylm+IS182o8jjwASAt46KVr8XFQwH
 kD6PjYv5MhjqsRlz6Kb4MhWb1UMc8ZVU7dJPDZboe/9jNE2kQhDIEeuWEjZNg+/bWt
 1D2IHU6kixtmMn2HFFnVAfR5gVPHcEVKaASRczEWk+KFy9AESU5Dqltq6RuEDDvV0B
 0M6pbKXS0I8PCiS3AIwqsh9oBEZh7/DpgfuKuwGrF43NSbVPxLFjTfq8rDXLZiZWVY
 5fRgBplt5AyBw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bcizYEfi
Subject: [Buildroot] [PATCH 1/1] boot/edk2: introduce a new
 _OVMF_DEBUG_ON_SERIAL option
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When EDK2 OVMF is built with debug, messages are printed to
IO port 0x402. Those messages are not shown in the normal
Qemu emulated serial port. Enabling this option will print
debug messages on the emulated serial port, potentially
mixing messages with UEFI serial console output.

See OVMF README:
https://github.com/tianocore/edk2/blob/master/OvmfPkg/README

This option has been useful to debug problems such as [1], in which the
emulator was hanging at startup without any log. Enabling this option
show the debug message on the console, before hanging:

    ...
    PlatformCpuCountBugCheck: Present=0 Possible=1
    PlatformCpuCountBugCheck: Broken CPU hotplug register block found. Update QEMU to version 8+, or
    PlatformCpuCountBugCheck: to a stable release with commit dab30fbef389 backported. Refer to
    PlatformCpuCountBugCheck: <https://bugzilla.tianocore.org/show_bug.cgi?id=4250>.
    ...

[1] http://lists.busybox.net/pipermail/buildroot/2023-July/670807.html

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 boot/edk2/Config.in | 15 +++++++++++++++
 boot/edk2/edk2.mk   |  6 ++++++
 2 files changed, 21 insertions(+)

diff --git a/boot/edk2/Config.in b/boot/edk2/Config.in
index 855a62f70b..bed503b168 100644
--- a/boot/edk2/Config.in
+++ b/boot/edk2/Config.in
@@ -108,6 +108,21 @@ comment "QEMU SBSA depends on ATF not using EDK2 as BL33"
 
 endchoice
 
+config BR2_TARGET_EDK2_OVMF_DEBUG_ON_SERIAL
+	bool "OVMF Debug on Serial"
+	depends on BR2_ENABLE_DEBUG
+	depends on BR2_TARGET_EDK2_PLATFORM_OVMF_I386 || \
+		BR2_TARGET_EDK2_PLATFORM_OVMF_X64
+	help
+	  When EDK2 OVMF is built with debug, messages are printed to
+	  IO port 0x402. Those messages are not shown in the normal
+	  Qemu emulated serial port. Enabling this option will print
+	  debug messages on the emulated serial port, potentially
+	  mixing messages with UEFI serial console output.
+
+	  See OVMF README:
+	  https://github.com/tianocore/edk2/blob/master/OvmfPkg/README
+
 config BR2_TARGET_EDK2_FD_NAME
 	string
 	default "OVMF" if BR2_TARGET_EDK2_PLATFORM_OVMF_I386
diff --git a/boot/edk2/edk2.mk b/boot/edk2/edk2.mk
index 399bd346ef..1ed22d87da 100644
--- a/boot/edk2/edk2.mk
+++ b/boot/edk2/edk2.mk
@@ -55,6 +55,9 @@ EDK2_DEPENDENCIES += host-nasm
 EDK2_PACKAGE_NAME = OvmfPkg
 EDK2_PLATFORM_NAME = OvmfPkgIa32
 EDK2_BUILD_DIR = OvmfIa32
+ifeq ($(BR2_TARGET_EDK2_OVMF_DEBUG_ON_SERIAL),y)
+EDK2_BUILD_OPTS += -DDEBUG_ON_SERIAL_PORT=TRUE
+endif
 
 else ifeq ($(BR2_TARGET_EDK2_PLATFORM_OVMF_X64),y)
 EDK2_ARCH = X64
@@ -62,6 +65,9 @@ EDK2_DEPENDENCIES += host-nasm
 EDK2_PACKAGE_NAME = OvmfPkg
 EDK2_PLATFORM_NAME = OvmfPkgX64
 EDK2_BUILD_DIR = OvmfX64
+ifeq ($(BR2_TARGET_EDK2_OVMF_DEBUG_ON_SERIAL),y)
+EDK2_BUILD_OPTS += -DDEBUG_ON_SERIAL_PORT=TRUE
+endif
 
 else ifeq ($(BR2_TARGET_EDK2_PLATFORM_ARM_VIRT_QEMU),y)
 EDK2_ARCH = AARCH64
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
