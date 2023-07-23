Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 617C5C001DE
	for <buildroot@archiver.kernel.org>; Sun, 23 Jul 2023 16:11:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E17A360BAF;
	Sun, 23 Jul 2023 16:11:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E17A360BAF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mPp7Egticqc4; Sun, 23 Jul 2023 16:11:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D02B60BAA;
	Sun, 23 Jul 2023 16:11:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D02B60BAA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9DD7E1BF345
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 16:11:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 771B460BAA
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 16:11:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 771B460BAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tnr9--t9VM3f for <buildroot@lists.busybox.net>;
 Sun, 23 Jul 2023 16:11:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 86D1F60B6A
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 16:11:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86D1F60B6A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 74743827D6; Sun, 23 Jul 2023 16:11:50 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 23 Jul 2023 18:11:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 15cc8d1e453d8c9e20389c8908c024f03f826388
X-Git-Newrev: 8e9c8e624f7a3a29c4887cc2e2c0c2e775baf86a
X-Patchwork-Hint: ignore
Message-Id: <20230723161150.74743827D6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/edk2: introduce a new
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8e9c8e624f7a3a29c4887cc2e2c0c2e775baf86a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Tested-by: Romain Naour <romain.naour@gmail.com>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 boot/edk2/Config.in | 15 +++++++++++++++
 boot/edk2/edk2.mk   |  7 +++++++
 2 files changed, 22 insertions(+)

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
index 399bd346ef..95cbe415ef 100644
--- a/boot/edk2/edk2.mk
+++ b/boot/edk2/edk2.mk
@@ -16,8 +16,15 @@ EDK2_INSTALL_IMAGES = YES
 
 ifeq ($(BR2_ENABLE_DEBUG),y)
 EDK2_BUILD_TYPE = DEBUG
+ifeq ($(BR2_TARGET_EDK2_OVMF_DEBUG_ON_SERIAL),y)
+# DEBUG_ON_SERIAL_PORT is only tested to be set, so don't disable it, as
+# it would still be set.
+EDK2_BUILD_OPTS += -DDEBUG_ON_SERIAL_PORT=TRUE
+endif
 else
 EDK2_BUILD_TYPE = RELEASE
+# DEBUG_ON_SERIAL_PORT is only valid in debug builds, so useless to set
+# it (enabled or disabled) on a relase build.
 endif
 
 # Build system notes.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
