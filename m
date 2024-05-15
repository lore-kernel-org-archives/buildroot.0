Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D4B1C25B75
	for <buildroot@archiver.kernel.org>; Wed, 15 May 2024 15:11:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 093D64033C;
	Wed, 15 May 2024 15:11:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KrJwnmXrxLbt; Wed, 15 May 2024 15:11:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CEC40404F7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CEC40404F7;
	Wed, 15 May 2024 15:11:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EC6351BF841
 for <buildroot@lists.busybox.net>; Wed, 15 May 2024 15:11:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D9BFD60788
 for <buildroot@lists.busybox.net>; Wed, 15 May 2024 15:11:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JTmJD8My3771 for <buildroot@lists.busybox.net>;
 Wed, 15 May 2024 15:11:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2489960772
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2489960772
 for <buildroot@buildroot.org>; Wed, 15 May 2024 15:11:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0EB5A873AB; Wed, 15 May 2024 15:11:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 15 May 2024 17:09:37 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: f113543d83d57f9c5ef621e03b4934e2623e20f4
X-Git-Newrev: e036a25271ceedb8b9839437832c3bccd2075e14
X-Patchwork-Hint: ignore
Message-Id: <20240515151102.0EB5A873AB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x]
 configs/raspberrypizero2w_defconfig: fix typo in headers series option
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
Content-Type: multipart/mixed; boundary="===============5390693336423535548=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5390693336423535548==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=e036a25271ceedb8b9839437832c3bccd2075e14
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

The build for this defconfig fails with:

  Incorrect selection of kernel headers: expected 6.8.x, got 6.1.x

Found with the following command while trying to find boards that have
missing custom headers series:

  grep --null --recursive --files-without-match "BR2_TOOLCHAIN_EXTERNAL=y" ./configs \
    | xargs --null grep --null --files-with-matches "BR2_LINUX_KERNEL_CUSTOM_.*=y" \
    | xargs --null grep --null --files-without-match "BR2_KERNEL_HEADERS_[0-9]\+_[0-9]\+=y"\
    | xargs --null grep --files-without-match "BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_[0-9]\+_[0-9]\+=y"
  ./configs/mangopi_mq1rdw2_defconfig  # patch pending
  ./configs/raspberrypizero2w_defconfig
  ./configs/sipeed_licheepi_nano_defconfig  # patch pending

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/6712162631

Signed-off-by: Gero Schwäricke <gero.schwaericke@posteo.de>
[Romain: add gitlab-ci link]
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit dc18b639c93f972246fce345b43dc091d07d35ca)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/raspberrypizero2w_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/raspberrypizero2w_defconfig b/configs/raspberrypizero2w_defconfig
index 1bf335c076..e152889f2d 100644
--- a/configs/raspberrypizero2w_defconfig
+++ b/configs/raspberrypizero2w_defconfig
@@ -3,7 +3,7 @@ BR2_cortex_a53=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
 # Linux headers same as kernel, 6.1 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6.1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 

--===============5390693336423535548==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5390693336423535548==--
