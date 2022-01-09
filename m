Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4183C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 20:13:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48D2C81CD0;
	Sun,  9 Jan 2022 20:13:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YL1rkrMaLeZi; Sun,  9 Jan 2022 20:13:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96DB281CE1;
	Sun,  9 Jan 2022 20:13:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 85B891BF44C
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 20:13:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F3D44032A
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 20:13:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XwQtvo2auxWi for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 20:13:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF47D40327
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 20:13:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 79FDC82AB8; Sun,  9 Jan 2022 20:07:16 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 21:13:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 02e679d8bf8acae9e110820858d1f242ff971af8
X-Git-Newrev: a5cdb54ed78b136c83dd44aebfa27f715cda5ea3
X-Patchwork-Hint: ignore
Message-Id: <20220109200716.79FDC82AB8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mesa3d: Gallium VC4 driver depends
 on NEON
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

commit: https://git.buildroot.net/buildroot/commit/?id=a5cdb54ed78b136c83dd44aebfa27f715cda5ea3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since version 21.3.0 of mesa3d, the generic broadcom infrastructure
(which is called v3d but is used also for VC4) started using NEON
instructions. This leads to assembler failures when VC4 is built for
32-bit ARM without NEON:

FAILED: src/broadcom/libv3d_neon.a.p/common_v3d_tiling.c.o
/home/buildroot/autobuild/instance-2/output-1/host/bin/arm-linux-gcc [...] -c ../src/broadcom/common/v3d_tiling.c
/tmp/ccAvufNv.s: Assembler messages:
/tmp/ccAvufNv.s:602: Error: selected processor does not support `vldm r7,{q0,q1,q2,q3}' in ARM mode
[...]
/tmp/ccAvufNv.s:686: Error: selected processor does not support `vstm r7,{q0,q1,q2,q3}' in ARM mode

Let the VC4 driver depend on NEON for 32-bit ARM. Aarch64 always has
NEON, so no condition is needed there.

Fixes:
http://autobuild.buildroot.net/results/2b5/2b531f7aa4506ee31a7252c87a2e401fffab9dfb/
http://autobuild.buildroot.net/results/6f9/6f9e7c864808dc0fafbca7c8984651fe92edbaf2/

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mesa3d/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index b9a5574b63..7cf5c26227 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -274,7 +274,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D
 
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4
 	bool "Gallium vc4 driver"
-	depends on BR2_arm || BR2_aarch64
+	depends on (BR2_arm && BR2_ARM_CPU_HAS_NEON) || BR2_aarch64
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
 	select BR2_PACKAGE_MESA3D_DRI3 if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
