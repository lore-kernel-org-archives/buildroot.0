Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB71C3601E
	for <buildroot@archiver.kernel.org>; Sun, 13 Apr 2025 11:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3BB0608B1;
	Sun, 13 Apr 2025 11:35:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r2SAN1LNaepD; Sun, 13 Apr 2025 11:35:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F21C460AA4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F21C460AA4;
	Sun, 13 Apr 2025 11:35:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7FD3FD4
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 11:35:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F1E54035E
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 11:35:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tSD1Vopr7tGW for <buildroot@buildroot.org>;
 Sun, 13 Apr 2025 11:35:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA673404C4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BA673404C4
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 11:35:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A6DBC8456D; Sun, 13 Apr 2025 11:35:54 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 13 Apr 2025 13:29:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f81bb4a2ca3d9c545b97cffbc344afd9ad92ac38
X-Git-Newrev: b1fac04a6e3d979e8dbcb436b42bbe167db96bab
X-Patchwork-Hint: ignore
Message-Id: <20250413113554.A6DBC8456D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/ti_am62ax_sk_defconfig: switch to
 am62x op-tee platform flavor
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b1fac04a6e3d979e8dbcb436b42bbe167db96bab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since optee_os bump to 4.5.0 in commit [1], the ti_am62ax_sk_defconfig
fails to build with error:

    core/arch/arm/plat-k3/drivers/sa2ul.c:36:42: error: 'SA2UL_BASE' undeclared here (not in a function); did you mean 'SCU_BASE'?
       36 | register_phys_mem_pgdir(MEM_AREA_IO_SEC, SA2UL_BASE, SA2UL_REG_SIZE);
          |                                          ^~~~~~~~~~

This is due to a logic change in platform flavor selection in upstream.
See [2].

There is unfortunately no SA2UL_BASE defined for the am62ax in op-tee
which is causing the op-tee builds to fail however the platform is
identical to the am62x platform. So for now let's switch to using the
am62x which has the proper configuration for this SoC even if it's
mislabeled.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/9690372425

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/14ef1ed7d27ba2f6d99bbdd0d80f67df50fccce9
[2] https://github.com/OP-TEE/optee_os/commit/35c75f355c98242290e342c04648e91baf35a4f3

Signed-off-by: Bryan Brattlof <bb@ti.com>
[Julien: add extra info in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 configs/ti_am62ax_sk_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/ti_am62ax_sk_defconfig b/configs/ti_am62ax_sk_defconfig
index 68a0e0fb9d..0b3ebe6242 100644
--- a/configs/ti_am62ax_sk_defconfig
+++ b/configs/ti_am62ax_sk_defconfig
@@ -23,7 +23,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="k3"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_TARGET_BOARD="lite"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
 BR2_TARGET_OPTEE_OS=y
-BR2_TARGET_OPTEE_OS_PLATFORM="k3-am62ax"
+BR2_TARGET_OPTEE_OS_PLATFORM="k3-am62x"
 BR2_TARGET_TI_K3_R5_LOADER=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2024.07"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
