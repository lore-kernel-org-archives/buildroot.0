Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B11C00140
	for <buildroot@archiver.kernel.org>; Thu, 18 Aug 2022 07:01:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D936C41B91;
	Thu, 18 Aug 2022 07:01:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D936C41B91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HsqIGNc2n6hG; Thu, 18 Aug 2022 07:01:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7CD541B8B;
	Thu, 18 Aug 2022 07:01:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7CD541B8B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A8EC91BF3FC
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 07:01:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8308A41B8B
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 07:01:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8308A41B8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 12rKfko2v4qT for <buildroot@lists.busybox.net>;
 Thu, 18 Aug 2022 07:01:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B1BC41947
 for <buildroot@buildroot.org>; Thu, 18 Aug 2022 07:01:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B1BC41947
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id DBBC9879A3; Thu, 18 Aug 2022 06:46:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 18 Aug 2022 08:57:40 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 1f49d55e845f5f1303b1efb619613b352d1ce097
X-Git-Newrev: 1f4a9dbebcb4d0125715c39fb23ec4fa1f2a1cd5
X-Patchwork-Hint: ignore
Message-Id: <20220818064628.DBBC9879A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/uclibc: define
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

commit: https://git.buildroot.net/buildroot/commit/?id=1f4a9dbebcb4d0125715c39fb23ec4fa1f2a1cd5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

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
(cherry picked from commit 8195e85e10c30b2284613200b4cb1dcba31c9386)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
