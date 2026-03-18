Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3EBD10775F9
	for <buildroot@archiver.kernel.org>; Wed, 18 Mar 2026 18:21:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56F3C60C14;
	Wed, 18 Mar 2026 18:21:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iTDQS_vOfQlA; Wed, 18 Mar 2026 18:21:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D16A260BED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773858114;
	bh=5tcsP+0wiBYciB3F/I5TiD48MA0yjfahWz64IFtYUfU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gor59UocOsWVJWW9KZpvyzO0oQ9JFi5KuuHetRLFTRTFg0NuipaEZR1ftmrXkNu6/
	 NjlFJLBapCXPFyPrDgkaLtZrwnLWCGX6eq/mvPP/u5dp2Jj29AokCLEv+F91KWo0z0
	 /A8BFP87GQcDUZbHt+sV5cw2VKIEyAa5xRwSpw/IUu6tJBGNOhb0kF42VRmAb/Bix/
	 LVKPEvT6UpU95Z3Vpnu3u0V2ygcDHjEFVHyvxnLw5GkekcJfEgUhIJGo9ghsWQ9ehK
	 bk28PQ6yPE4zVEOSwB1V32PTYz80tchnuDtn4xjA/+KyflDjkJ6UnNZSwoxFqRPW37
	 0CVAtH0B4ANqw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D16A260BED;
	Wed, 18 Mar 2026 18:21:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A2521B6
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 18:21:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4354181061
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 18:21:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RBPM9dTN8ZNt for <buildroot@buildroot.org>;
 Wed, 18 Mar 2026 18:21:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63BD68104D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63BD68104D
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 18:21:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 69EEF84AC2; Wed, 18 Mar 2026 18:21:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 18 Mar 2026 19:06:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c26a70b5240f7ab79ece130668950fbfb61d93fd
X-Git-Newrev: 0e8739fab27e8a7b9850c936d95c1cdaca3ea0f9
X-Patchwork-Hint: ignore
Message-Id: <20260318182146.69EEF84AC2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xen: fix armv7 build with gcc-15
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6573077518883388416=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6573077518883388416==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0e8739fab27e8a7b9850c936d95c1cdaca3ea0f9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Backport a patch from Xen 4.21 to fix the following build errors for Arm v7
with gcc-15:

  xen-4.14.6/xen/include/asm/platforms/midway.h:1: error: header guard '__ASM_ARM_PLATFORMS_MIDWAY_H' followed by '#define' of a different macro [-Werror=header-guard]
  xen-4.14.6/xen/include/asm/platforms/omap5.h:1: error: header guard '__ASM_ARM_PLATFORMS_OMAP5_H' followed by '#define' of a different macro [-Werror=header-guard]

Since the external 32b arm toolchain has been updated to a version based on
gcc-15, the tests.package.test_xen.TestXenArmv7 python test does not build
anymore.
Adding the patch repairs it.

Link: https://gitlab.com/buildroot.org/buildroot/-/jobs/13518318473
Fixes: 86d453a7dc08 ("toolchain/toolchain-external/toolchain-external-arm-arm: bump to 15.2.rel1")
Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Cc: Alistair Francis <alistair@alistair23.me>
Cc: Dowan Gullient <dowan.gullient@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0009-Arm-platforms-fix-build-with-gcc15.patch  | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/package/xen/0009-Arm-platforms-fix-build-with-gcc15.patch b/package/xen/0009-Arm-platforms-fix-build-with-gcc15.patch
new file mode 100644
index 0000000000..fb95ca9fa5
--- /dev/null
+++ b/package/xen/0009-Arm-platforms-fix-build-with-gcc15.patch
@@ -0,0 +1,46 @@
+From d12666d74dc742bb06c30b96d6b874a3e14c6b46 Mon Sep 17 00:00:00 2001
+From: Jan Beulich <jbeulich@suse.com>
+Date: Tue, 26 Aug 2025 08:41:18 +0200
+Subject: [PATCH] Arm/platforms: fix build with gcc15
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+For two of the headers gcc15 complains "header guard ... followed by
+'#define' of a different macro". Misra certainly wouldn't have liked
+this either, if these headers were covered by a scan.
+
+Signed-off-by: Jan Beulich <jbeulich@suse.com>
+Acked-by: Michal Orzel <michal.orzel@amd.com>
+Upstream: https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=39f95089e2ba15c5438ce904c0cbbd8d79d3e6e7
+Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
+---
+ xen/include/asm-arm/platforms/midway.h | 2 +-
+ xen/include/asm-arm/platforms/omap5.h  | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/xen/include/asm-arm/platforms/midway.h b/xen/include/asm-arm/platforms/midway.h
+index 099e435..6914393 100644
+--- a/xen/include/asm-arm/platforms/midway.h
++++ b/xen/include/asm-arm/platforms/midway.h
+@@ -1,5 +1,5 @@
+ #ifndef __ASM_ARM_PLATFORMS_MIDWAY_H
+-#define __ASM_ASM_PLATFORMS_MIDWAY_H
++#define __ASM_ARM_PLATFORMS_MIDWAY_H
+ 
+ /* addresses of SREG registers for resetting the SoC */
+ #define MW_SREG_PWR_REQ             0xfff3cf00
+diff --git a/xen/include/asm-arm/platforms/omap5.h b/xen/include/asm-arm/platforms/omap5.h
+index c559c84..8867b45 100644
+--- a/xen/include/asm-arm/platforms/omap5.h
++++ b/xen/include/asm-arm/platforms/omap5.h
+@@ -1,5 +1,5 @@
+ #ifndef __ASM_ARM_PLATFORMS_OMAP5_H
+-#define __ASM_ASM_PLATFORMS_OMAP5_H
++#define __ASM_ARM_PLATFORMS_OMAP5_H
+ 
+ #define REALTIME_COUNTER_BASE                   0x48243200
+ #define INCREMENTER_NUMERATOR_OFFSET            0x10
+-- 
+2.53.0
+

--===============6573077518883388416==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6573077518883388416==--
