Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C93EC04A68
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 20:56:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFC5F60758;
	Tue, 26 Jul 2022 20:55:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EFC5F60758
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6C6Ifjv6ERRF; Tue, 26 Jul 2022 20:55:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06F24606FF;
	Tue, 26 Jul 2022 20:55:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06F24606FF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0FDCF1BF9B9
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 20:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C804C81765
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 20:55:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C804C81765
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pwX0PKMStZv3 for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 20:55:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 362E781766
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 20:55:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 362E781766
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id AADC186026; Tue, 26 Jul 2022 20:41:26 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 22:54:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b4cb2d3ebc6e2c08fb79e1c195a5028ed24a0cde
X-Git-Newrev: 8195e85e10c30b2284613200b4cb1dcba31c9386
X-Patchwork-Hint: ignore
Message-Id: <20220726204126.AADC186026@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uclibc: define
 BR2_UCLIBC_TARGET_ARCH for ARM64
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

commit: https://git.buildroot.net/buildroot/commit/?id=8195e85e10c30b2284613200b4cb1dcba31c9386
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

So far, BR2_UCLIBC_TARGET_ARCH had a value for all
architectures... except for ARM64. Its value is passed as ARCH= when
building uClibc... which is currently empty:

/usr/bin/make -j33 -C .../build/uclibc-1.0.41 ARCH="" CROSS_COMPILE=".../host/bin/aarch64-buildroot-linux-uclibc-"

And also in uclibc.mk, when we inject the architecture in uClibc's
.config:

        $(call KCONFIG_ENABLE_OPT,TARGET_$(UCLIBC_TARGET_ARCH))
        $(call KCONFIG_SET_OPT,TARGET_ARCH,"$(UCLIBC_TARGET_ARCH)")

We enable TARGET_ (which doesn't exist) and set TARGET_ARCH to the
empty string.

Nobody noticed so far, and it happens to work because aarch64 is the
first architecture in the choice of architectures in
extra/Configs/Config.in in the uClibc code. So, when the architecture
is not specified, aarch64 is used.

As we are about to add some logic in uclibc.mk that will use
BR2_UCLIBC_TARGET_ARCH, we noticed this missing definition.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/uclibc/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 2eea4d30f3..ba8b5885ec 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -124,6 +124,7 @@ config BR2_UCLIBC_INSTALL_UTILS
 # uClibc architecture names.
 config BR2_UCLIBC_TARGET_ARCH
 	string
+	default "aarch64"  if BR2_aarch64 || BR2_aarch64_be
 	default "arc"	   if BR2_arcle || BR2_arceb
 	default "arm"	   if BR2_arm	|| BR2_armeb
 	default "m68k"	   if BR2_m68k
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
