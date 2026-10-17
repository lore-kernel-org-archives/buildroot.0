Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1405CCF2CE
	for <buildroot@archiver.kernel.org>; Sat, 17 Oct 2026 13:13:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C55A4098B;
	Sat, 17 Oct 2026 13:13:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U8Q9v1M4l6v5; Sat, 17 Oct 2026 13:13:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6308040986
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792242781;
	b=spA6l943gEu+QCN/kWwYdJVdoos7e+dUufebgYikFEEscO69tTKvTULX9wqnIflH/xMK
	 r39SBtAo2XQyOd/iOZ3nkp9LNbCmc6W26doTPeYyF8+9h/NcA1zMH8IHSDkyH6zSW6WO1
	 S/5TRvOwJqeIKaAwV0ji8kgEsPmSbdmpLBD+t1yZ0zHqbR6AANMiyFAqSwAw74vzyjdXG
	 zte6N8EPg7iclI09YZ7Xf8LVo6CzhBzCwt+c/EI2hhKdY9LrOdZ8ZdaqCna0UR0mhihGA
	 WUtUTm4rt2SNQhiRgfh+YP+B6WmQraliRWURmu1iAmpaHHxnn6OHzv+kApMzqrsNhNg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792242781;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-MIME-Autoconverted:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=VnabhafLfRq91Bg7udUAtO00ccIMFB76r0KmFRTtmQk=;
	b=qPk+luE1IAFieKlveuTUjcpum7Bn9L68fF0JVqoaKETQGOnbKAO5bFkbGZUThbsXvYrd
	 2Dzbkt/cOWf3HB3jLACWQyvIKvys5xlqUUBVSVZH6O6Oz6ZnmBVV4CiWR1KR8jW3MEmdw
	 6P3v9I5RsK45rkPwIfhLIb9/SseooaJl7p9Rlh2Xt07hy7VwbyhsuuS0GMPy+13/shUjm
	 GGfXZaO+XPe6quFOj5qak/ZWTL+vTBwdVCsa9OMGPgENanBLTWDxe5YDMnMjU8qh+V2OS
	 4x+jbvKokyji13tH98+P4QaECrYKB7x/pixy+8H1eAlG4PsGyYigtP8UMPQiHOB8LqA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792242781;
	bh=VnabhafLfRq91Bg7udUAtO00ccIMFB76r0KmFRTtmQk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JHbhicxR22VRwrvER0qmKs03d6yeZLFSsQPnJtBQwfdzE9yRwlMUrbax6KpAw3FqN
	 Ev4CdKfQoLxzHPJ5oKxiaj/gfwtXWNIkm471mvGn5FVN1b2szw3JBMjNfz/phjji2E
	 eD5bdoBCAMGiimjDvSVBb4ov6vD2XgollWDhvpKDFVhnO0NIP0DKl6A6uf6Onugq07
	 h9KXigVLihqL8fOqx+YVKA4EX0v4L0jk6RL/ZV6/hfnX0OfdvNpGSlXePqh/WrF+ta
	 WME22gcTKpQZEiLVjBFBep0728oO9oWOns3KkbVBtgUiNbHy8omO8TVhbVHKsAVFC5
	 RC91kwlSXoDDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6308040986;
	Sat, 17 Oct 2026 13:13:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 62F9A1DE
 for <buildroot@buildroot.org>; Sat, 17 Oct 2026 13:12:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5495F40076
 for <buildroot@buildroot.org>; Sat, 17 Oct 2026 13:12:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MPCf2KvhqpLT for <buildroot@buildroot.org>;
 Sat, 17 Oct 2026 13:12:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org E0C4E40024
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792242775;
 b=DyITdFFf+uSZ/psgW4AhZvVcLHBMmk/UlMDjqLE0Dc2TAzKwHY9ievxZ4TsaSkbznjX5
 DtIAh0vBN4Qcmfmu7F0gmNZ3+TpnTq0KXOayyR2xbQfiYqoKqf1QEXU9HXWjBKs8s4mmH
 EX6qymHWuKVPtvsBXmGYxWXEPVdPVG9LPipJ01W/JVTfYyFSFwrZL26yw5hKMuVMxhb/5
 4eeM6lNf6CDhPFTkb7DdIUV4fai5FlMfwJeTnlRqrsrpVIW2PazS2BxoOJSfgAJMb8OOs
 6w6f7PBkCqWKOdFoi0t4EgDcJLA1w7JKTApYJVa4oHj56I6sALxWeLhsLE6LrNJw2zg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792242775;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:
 X-MIME-Autoconverted:Content-Type;
 bh=rxOsVkbySg8q8oxs+TSibBIc+l2Cn4t6/6WwAmi0mcE=;
 b=IYOwlN5rfB7up+LcjAoc7Ms2IsCgvOtcDPV6TQuPcT0Amgq1QexNLMC8JW9t0uoH1Riq
 T0xyPIT8ZrcLnxx6z81NvaO0JExDFQSnd9ydJA3arPpWf98a5fmFbozK65gaV+iR3EPJS
 ek9h9Oa67er5wS8NafiSYvle5/qyoZvRx6h0sBLiCJy5abpozgnjUmYHzDxIQW4LL5luV
 6EX0WAP2Spisb0mclEVNnL+ceb0Ll5DT59swEB3UaemMCGtQhNz8RRs+T/r2Lp1qVChnj
 5qDiPpT9HfLvgH+otKuNTI8SUIxP5xrN0DbVf6w/Fh8gdBVsL3u3412BrERlpZyOR2w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail3 header.b=iTTRjbwG; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=iTTRjbwG
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E0C4E40024
 for <buildroot@buildroot.org>; Sat, 17 Oct 2026 13:12:54 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=iTTRjbwGvyG7/AtpSDcrENyNNq+eihFLwH3H1qzqs6KktbTyHcyvd5RQ1drGu6mSAbwguOWPxS09oPIkc3ioiaaV/XyqlABXJjf3QAeKB48ZzYt+bF5LKZy2w4sdcpqdtO/eP2qI8QTTXM/TyjRsYO2f6W2vzuR0n5BLN1UbcYqXTZYYFWZmWhfO3tD9Geaw6uznRl/9anxSWHcaP2lV8vo9IU6F6TMZstH3DuOGdsVrbS9d/D5ceTop2eNQOFHVwta5WHG7EjaONa2O+Re3aeNCaIcOyYn6SSL4ufsuHV8+T4a2OMwYh4d6mCB/AbiiVLiEMpaaTZyim8IeRZR+LQ==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=0W+dfCsyhL37/ZxgXuUgcAPj18voYSmKm8ZjGGJOva8=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 547938724; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 17 Oct 2026 13:12:51 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1xI4DT-00000006b1K-0IaB;
 Sat, 17 Oct 2026 15:12:51 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 17 Oct 2026 15:12:42 +0200
Message-ID: <20261017131247.1572149-4-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261017131247.1572149-1-peter@korsgaard.com>
References: <20261017131247.1572149-1-peter@korsgaard.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Subject: [Buildroot] [PATCH 4/4] configs/lafrite_defconfig: bump Linux
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The aarch64 defconfig has grown, so bump the ext4 size to make it fit.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
