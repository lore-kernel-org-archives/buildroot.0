Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D749CCF2C4
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 13:39:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B13A840600;
	Sun, 18 Oct 2026 13:39:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6zMezHJZzX6t; Sun, 18 Oct 2026 13:39:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org CFE6E40608
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792330784;
	b=Ox6+++VmLhlPSLUxAJztBY54adjyf6Elur/jsNkPX7zzSjq+ohJk08R+8PyvLvQpgKuI
	 WgR5jtGbqyN2htfZQsgJACjcecrkEugTjNR80EPG587oHLGuTy5KJmyElvXkPf3bARIq6
	 Bcz1fqr+dyHgZU80kXMAMD4M2PBgAdEGXd+KDc8Ftcr21HoM6O19ZEFSsIKEEzJuwioeG
	 /On/2K/LwUbefumzGKA1jFboS8RAmBDM777FZFq1quulI2LKNSNzr1c2889+24XHMN21C
	 i/51X31TlZnHjeJUxKE6zE4BlM+oVyKWV2N1Pg4bqmoigFKSQBOe7KML6lMOpnJHrpA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792330784;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=j3LmZjVb15Fd1OOH8hiFkVR9xv8OkHOtgkbidcQ8FHM=;
	b=QvidPllcSRzQr5Q7GXGw0cAbiP2WIaYdg6cyRLSTtbaCj12TvWDduFavO5/UGUSD9ZFu
	 KmxeB3eoI/0mMzTFag9pTIEwSVEsahyLHjiMLqrmHxKL6HpjVCtQanKzXKVSn6VBUgDfJ
	 tbxMM8vlN8H9mbfi/CKFIdhQWjAaObtXxGSmEsYB5q+EC1Xz2hS59lUAWdtboEDn7xELl
	 MZCBnnUJShHtrulzO1rYy/5NhLVGYVZhnTArVsbe9TZYo860Fxey6nGTXr/LJhAflQa66
	 RtbIDT4tbuSiBgkB/KhA04SzFNc8VbVwO4LvsY5rmnK7VPbfM2Vlk47DU1Eje7G2e2g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792330784;
	bh=j3LmZjVb15Fd1OOH8hiFkVR9xv8OkHOtgkbidcQ8FHM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=H+zeO2MgZB4wmWq7gU1I2jS3SRwvVsGCqI6b0D+fCsDXwHBYeifBaMR8V2HIjPe8B
	 jXcnRA3Q5MVj8oyX6UOiSxhKnoXLBuf/1d0wS5jfk0pl+JA9eLHzdwndXWnSEGmOz0
	 CtXK7hDuRiWhTfjWqqNZkERuKHLRdi9CHgO+WDwer9u/U5AL3OiRbIFFZNBVKvhAy3
	 upDOaBCJi6qfhmtig7r6d8KfvY/WUOcZMEIve2vamQcsreUXayGBwNvKlIvKbIPnyd
	 UMzl7zQCTmjFYcqo31owwd/fELhHvGoRuErwCOmuEn4v83+oqjsQLKBEUPnXYETNVO
	 2+RbhEGwVz80A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFE6E40608;
	Sun, 18 Oct 2026 13:39:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4AD2861
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 13:39:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C414400BE
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 13:39:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nTlNzBkX2Z3j for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 13:39:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 3F5474005F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792330782;
 b=THCcmLoyQzj4l7vL6v33JUcxj2GQ0XoUumffJWzAXk961Bup2igcIeE+sTHQ49geqFe1
 nPiTHBMLjJbHM/qJ6gjJfLYzTPU5PYY24uEI4c3CWXPIDl0UHNDwdg6Yp+Urk/zLJBq9C
 0DcqtFv50DQOe00yWS/q94hwcoXRSv761x5fltYGZClimPhO0xso+LNE478eMd25dMiTJ
 n7A7EzkpkdMveJ6bUVw46mj6sp+90o/RKCl3lSK7fKf2wvHF9qgGA4gsKmuVUSSlOhrNn
 UDWuB+216Dz422ckOa/46+OsPjxxnbwILmWa3jJ4YTnELz07RriMoe4XImYuIOtbHfA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792330782;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Xp85CwUsy315pXo66bXtrHLWxcj4stRyExrHCjZj47c=;
 b=Al1lLW2cAKbH9AJun4W0vYDvMLkL/Pfvq5YN3aBHUGrz9zSF5h3ADrtstaW1oycGVxUV
 k27c7z+0D/e6iOQthIKHWEG+DgXaaxJN3wGaFqE+Xd9VY+aPIB8atVIAQDH0Je3TgVZLc
 a5MUdcQzIlt6GFxd7FUZki1oA9+qUJEsQLTS47iDBeTp46av/anVMknpEVAojG1uETfRd
 +c/PNZYSNy2IUddCNg+tcrxI/ZbtL45EfvH60eUUbH/YNYSaH/33BmDzpfahZM9V8BsFf
 rXC5AKVXXiNFnyDiKsvKchEy0UQ9W8uAb5jKAsiD6qNBv+eKD9vgiCL4WRI+oPzVglw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F5474005F
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 13:39:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 20EB29769B; Sun, 18 Oct 2026 13:38:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 Oct 2026 15:37:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 42340d022fdbbe900e69461228b0e61666785562
X-Git-Newrev: a019024561fb8a8738f5f341fbba965c7d348c75
X-Patchwork-Hint: ignore
Message-Id: <20261018133820.20EB29769B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/stm32f429_disco_xip: bump Linux to
 6.1.189
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a019024561fb8a8738f5f341fbba965c7d348c75
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The patch bumps the Linux kernel to version 6.1.189. The size of
xipImage has increased by 9286 bytes (1706592 bytes compared to
1696766 in version 6.1.177).

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/stmicroelectronics/stm32f429-disco/patches/linux/linux.hash | 2 +-
 configs/stm32f429_disco_xip_defconfig                             | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/stmicroelectronics/stm32f429-disco/patches/linux/linux.hash b/board/stmicroelectronics/stm32f429-disco/patches/linux/linux.hash
index be1c34bc23..196a0535c9 100644
--- a/board/stmicroelectronics/stm32f429-disco/patches/linux/linux.hash
+++ b/board/stmicroelectronics/stm32f429-disco/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  f6529bfe1a457adab69156fb7fa2232cc203eb63f5e46210f9953d6fc9f70a30  linux-6.1.177.tar.xz
+sha256  3ec834a2fefc9a08aac62f993525d7acd10163db6f01d63b4549cbff3f5c9439  linux-6.1.189.tar.xz
diff --git a/configs/stm32f429_disco_xip_defconfig b/configs/stm32f429_disco_xip_defconfig
index 40577a21a5..d82088c718 100644
--- a/configs/stm32f429_disco_xip_defconfig
+++ b/configs/stm32f429_disco_xip_defconfig
@@ -8,7 +8,7 @@ BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.177"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.189"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32f429-disco/linux.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
