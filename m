Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 039FBCCF2C9
	for <buildroot@archiver.kernel.org>; Sat, 17 Oct 2026 19:44:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 773B44082E;
	Sat, 17 Oct 2026 19:44:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4xqZVJSvn8nZ; Sat, 17 Oct 2026 19:44:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 90C084082B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792266250;
	b=lOeCTNCFkKK3aPjvu+wHwuFuVg6vn9hFfz16AFu+iG4hr+Jg56UyKzSXc/WDPirL+3yL
	 GjsI70dPWBTkBNj91R4uq68OVpkyLGmErLlTx538d/8OJJuRLuziXI5LdcV76yr4puWQa
	 pZF6/avwsF+8juHy4VFmgqN7H6kkbvH0CZFsWi4xHYgmo0C3TLuGQ/oCttFElazsuCdJb
	 s5y4AkCIqigCnPsk2QeZk1lCysLRKSF+PgLQVWWhW+TG8uS+/R/yPq/RLq50dLF9lCQ5n
	 Zn7xYGGGFP8ej9UoRi+5tynqAvHzrG7VJCnxMU7gmBA8sbT7/LzSFgeoMaEAouEEZkA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792266250;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=4WIpG8ZjOWoBpvYKWgVFXNgqqYfIi87LiqaJlY9DHpU=;
	b=Lfyp1LdQxIBrRCwIjr4BZsvPLKhop9BAKc0wCZHALP4KaBV7AJQ/r1W2OpOlPNyg6+nV
	 cGWNDj5ePDKtIGX6iTyltJfXLb2Z9wyb/cuweH8G14y+lyuSLVBVtc6KPJkFxWMWDKQXY
	 brM6eHQuMFiQJqYMt066tI2CTVgU2XScuyNliTqC2SqOMRKAaTUIsUCkzAE+2AGs6vetF
	 fsZ6pIMqDIkhsCRDnqM8ydbjwj+AqI5XFGmjDuf81aPAoGftNKSE5LLRq5VqrawRiif3b
	 sXBJha0Ty9SB2wrlwse9W5egHY6cNf2TBR/E4/be4u8lbFn+Su7bqftuVbTFSO0iSrw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792266250;
	bh=4WIpG8ZjOWoBpvYKWgVFXNgqqYfIi87LiqaJlY9DHpU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ssO2uxhfLtyyAeNce2uV/9O1SwdBsG77KOSVZ+FMRbkucPsiJwdyGhL99a3ZYhNy0
	 +XQDDFRR+NKab/udSw2UeOshvrhF4mnLznZKjq2egXfIt7UA75q1EZjAQzGdVU1+Gl
	 j9Mr7JehIYmJdZlBjZ4qjRIyiWT74kFCVUkA0iQjeiHi930PmSLdJBefgMXqdyce1+
	 hw3ODk23FjGsnxw5EkcjHT5Bt4NC/feaUko47QCbnPRZWrhUt9a8g+IekNDUPRed1w
	 jchbwEOahEpNHMugxDbU4yj6uw7CgozxI5m4JbQbCD3//GmjjlmYtaoPNFE44kL1HV
	 Nrqy/RnQfCiWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90C084082B;
	Sat, 17 Oct 2026 19:44:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B8E4961
 for <buildroot@buildroot.org>; Sat, 17 Oct 2026 19:44:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9ECBA60614
 for <buildroot@buildroot.org>; Sat, 17 Oct 2026 19:44:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y6GuZMS79wqt for <buildroot@buildroot.org>;
 Sat, 17 Oct 2026 19:44:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E315B60604
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792266247;
 b=UtpBfcJlvL0EQgydOhJETGYU4ruIc6ScR1oNn1LekH9TvvaTuqoeAynh5CXsGEE1t5NN
 g2u+1U6Ihlv8qITrluwfB3yMVrhOZ01/89UMAHi1bsQ2lqQsf/V8SwuI+iH0S2fGvvkfK
 9lMil4m5Zs+S4GxN6ur4h+ZI4fxmDguXHTPD3vQ/qq4PNFVokzjs0mCN9FkNOdbVLStsB
 4rop1qLDSAJKNJcDwhpFtjNqsk5ZNF3Uuu0AsPX6We7qAhG0KYkWO8k82Tt40XYkImzeU
 00RimJ7KDvzaW183OgDpOQqmwYSnRFcHxDjkINJgbOWwLveMEOmLytnEcLJbMNqiCnA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792266247;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=in8670Rj30HdZPusYHh43FNr2bfG8FZPViwugWP8Mxg=;
 b=sI3PtbdkiO89qo3uvUgVSy0/jsN4JQDhxmw4WRZglzAxtEa1G3Tfr3RHAixFqE17+7JN
 OwAASXq1AlVJO0djIaJIimCVhN6D1xr5eTyInPpuYKUSbFlCmPys2cYHh2/GkJgbAKr8R
 +rJ5f+BwgSZV901ooVr8KKBNt+Gx52EFO+AjEgyq2CWxxDLgBfcAE8SNDLVcuqdayCo6w
 E3ccpvDtYfQ+o6eXpntA+dEVhvAvk3oT0coAOdvpYycQKYB1U+46a5GBQJy+SP7uzHXnC
 mb03HzPd8mMXUa4fEojs9KaBj302vswZwjfOTCAyWiULpSgFia1QatUi+TmbOzY1Izw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E315B60604
 for <buildroot@buildroot.org>; Sat, 17 Oct 2026 19:44:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2DD5C9639F; Sat, 17 Oct 2026 19:42:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 17 Oct 2026 21:19:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 37ef3af415a830a2eb136704816b3d9735d2945d
X-Git-Newrev: 45fb109414f273a51939e00f0196906a78dc4db5
X-Patchwork-Hint: ignore
Message-Id: <20261017194246.2DD5C9639F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/lafrite_defconfig: bump Linux
 kernel to 6.18.56
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/45fb109414f273a51939e00f0196906a78dc4db5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The aarch64 defconfig has grown, so bump the ext4 size to make it fit.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 board/librecomputer/lafrite/patches/linux/linux.hash | 4 ++--
 configs/lafrite_defconfig                            | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/librecomputer/lafrite/patches/linux/linux.hash b/board/librecomputer/lafrite/patches/linux/linux.hash
index 899adefd07..6f1b1a66e4 100644
--- a/board/librecomputer/lafrite/patches/linux/linux.hash
+++ b/board/librecomputer/lafrite/patches/linux/linux.hash
@@ -1,2 +1,2 @@
-# Locally calculated
-sha256  23e3e7b56407250f5411bdab95763d0bc4e3a19dfa431d951df7eacabd61a2f4  linux-6.6.22.tar.xz
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  4633bbda2ab95eaf2a7af4041236451d6759c72e6946265531af4b3aacefbf89  linux-6.18.56.tar.xz
diff --git a/configs/lafrite_defconfig b/configs/lafrite_defconfig
index 2454d2b7ff..f23fd0ca99 100644
--- a/configs/lafrite_defconfig
+++ b/configs/lafrite_defconfig
@@ -11,7 +11,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/librecomputer/lafrite/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.22"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.56"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="amlogic/meson-gxl-s805x-libretech-ac"
@@ -19,6 +19,6 @@ BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+BR2_TARGET_ROOTFS_EXT2_SIZE="150M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_PACKAGE_HOST_GENIMAGE=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
