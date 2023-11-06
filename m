Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7039C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 21:38:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 659F7404CC;
	Mon,  6 Nov 2023 21:38:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 659F7404CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fQ3TQ1L2LPvs; Mon,  6 Nov 2023 21:38:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C35640866;
	Mon,  6 Nov 2023 21:38:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C35640866
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5AD8A1BF3A6
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 41012820B1
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:38:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41012820B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uuXnC1geFFdl for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 21:38:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A6B682718
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 21:38:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A6B682718
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 46A3D86ABF; Mon,  6 Nov 2023 21:38:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Nov 2023 22:27:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d5d4e88a96a41542bcb30cb648f7d8750c48f419
X-Git-Newrev: 1ecfe60f134751460f2e7707c6277ec6d43bcbda
X-Patchwork-Hint: ignore
Message-Id: <20231106213813.46A3D86ABF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flashrom: fix libftdi build
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1ecfe60f134751460f2e7707c6277ec6d43bcbda
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

flashrom depends on libftdi1 since bump to version 1.3.0 in commit
073b0fc9c1fe9945eccf4b792b948633aae9a9b8:

Dependency libftdi1 found: no
[...]
/home/autobuild/autobuild/instance-7/output-1/host/lib/gcc/mips64el-buildroot-linux-gnu/12.3.0/../../../../mips64el-buildroot-linux-gnu/bin/ld: libflashrom.a(ft2232_spi.o): in function `send_buf':
ft2232_spi.c:(.text+0x20): undefined reference to `ftdi_write_data'

Fixes:
 - http://autobuild.buildroot.org/results/11fae0933b38d82f15fec37e78298df232321bcd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/flashrom/flashrom.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/flashrom/flashrom.mk b/package/flashrom/flashrom.mk
index 1ccef572da..86bfec40cc 100644
--- a/package/flashrom/flashrom.mk
+++ b/package/flashrom/flashrom.mk
@@ -11,8 +11,8 @@ FLASHROM_LICENSE = GPL-2.0+
 FLASHROM_LICENSE_FILES = COPYING
 FLASHROM_MAKE_OPTS = WARNERROR=no
 
-ifeq ($(BR2_PACKAGE_LIBFTDI),y)
-FLASHROM_DEPENDENCIES += host-pkgconf libftdi
+ifeq ($(BR2_PACKAGE_LIBFTDI1),y)
+FLASHROM_DEPENDENCIES += host-pkgconf libftdi1
 FLASHROM_MAKE_OPTS += \
 	CONFIG_FT2232_SPI=yes \
 	CONFIG_USBBLASTER_SPI=yes
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
