Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ADC3C433F5
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 22:25:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 080AC40B92;
	Sat, 28 May 2022 22:25:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tRuzPHZXduRu; Sat, 28 May 2022 22:25:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 10E0A40B8E;
	Sat, 28 May 2022 22:25:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E72E91BF580
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 22:25:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF80084A89
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 22:25:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 07xoFyIWDLoM for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 22:25:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 31C5384A88
 for <buildroot@buildroot.org>; Sat, 28 May 2022 22:25:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id A7E4286559; Sat, 28 May 2022 22:14:08 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 29 May 2022 00:25:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d81a99cc7cf2373b28bc06da4d3c543982b312b1
X-Git-Newrev: b2cef41ff988c273f52d3598449e829a9556e354
X-Patchwork-Hint: ignore
Message-Id: <20220528221408.A7E4286559@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ola: stageprofi and usbdmx needs
 gcc >= 4.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=b2cef41ff988c273f52d3598449e829a9556e354
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since re-introduction of the
package in commit 16ff948444c3978d63f483344a3d92d994c64312:

configure: error: compiler with C11 support is required to build libusb

Fixes:
 - http://autobuild.buildroot.org/results/7b15e23392805f5109c136a5aa870ddf49f48814

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/ola/Config.in | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/ola/Config.in b/package/ola/Config.in
index 399f7702fc..cfca09a936 100644
--- a/package/ola/Config.in
+++ b/package/ola/Config.in
@@ -153,10 +153,14 @@ config BR2_PACKAGE_OLA_PLUGIN_SPI
 
 config BR2_PACKAGE_OLA_PLUGIN_STAGEPROFI
 	bool "stageprofi"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	select BR2_PACKAGE_LIBUSB
 	help
 	  Build StageProfi plugin for OLA.
 
+comment "stageprofi needs a toolchain w/ gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+
 config BR2_PACKAGE_OLA_PLUGIN_UARTDMX
 	bool "uartdmx"
 	help
@@ -164,10 +168,14 @@ config BR2_PACKAGE_OLA_PLUGIN_UARTDMX
 
 config BR2_PACKAGE_OLA_PLUGIN_USBDMX
 	bool "usbdmx"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	select BR2_PACKAGE_LIBUSB
 	help
 	  Build USB DMX plugin for OLA.
 
+comment "usbdmx needs a toolchain w/ gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+
 config BR2_PACKAGE_OLA_PLUGIN_USBPRO
 	bool "usbpro"
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
