Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98852CFA446
	for <buildroot@archiver.kernel.org>; Thu, 20 Nov 2025 22:16:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 242C58495F;
	Thu, 20 Nov 2025 22:16:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iCmk7p-FcoZF; Thu, 20 Nov 2025 22:16:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A75B28495B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A75B28495B;
	Thu, 20 Nov 2025 22:16:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8231E122
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 22:16:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 64BEB6086B
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 22:16:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UJNgMIdUOkmu for <buildroot@buildroot.org>;
 Thu, 20 Nov 2025 22:16:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 89DB2608B2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89DB2608B2
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 89DB2608B2
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 22:16:03 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 0992C1A1C61
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 22:16:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CBA17606F6
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 22:16:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E824A10371BCD; Thu, 20 Nov 2025 23:16:00 +0100 (CET)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Nov 2025 23:15:48 +0100
Message-ID: <20251120221558.1138538-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1763676961; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=xMk+wnGGpVNgABHQxxe+7pSvOctXnP0DMdZlJT7+60A=;
 b=Gjv/7l4RZ/q1Jwxka7K3S7H3pidWAZptJq9NpasTSVEGpsoy/0r2J//YWcrRt8lpXTFsMs
 uuKO0XqOUGZAax3ZcCXTdGAG7QcaTj3WxNZhbZ/KF3H6mV3Qa65Z80R4mhfMCxxZA5+vew
 0b8HgITDJWpyxT9fuz3lU99J0sq572AwkOSyIc1UUl+wnaMYdFKPoL1HFJrkx4qr7M6BDk
 +cXNl7BD9x0uF2Kr6Q3lpYFxUb9UkmR/n2mFuVS36CqAovs03bAPBbpc9eqKWdsN0yJJIT
 /O7BYN8HGS0vOvfEXLiURhadErsXKLidZ6Q8QDdxc1EJmmaXKTKW51nPGOo4kw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Gjv/7l4R
Subject: [Buildroot] [PATCH 0/3] binutils: bump to 2.45, default to 2.44,
 drop 2.42
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Since binutils 2.45.1 has been released, this series implements the
usual dance around binutils versions.

It has been tested with:

An i386 glibc toolchain build:

BR2_BINUTILS_VERSION_2_45_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y

An ARM 32-bit uclibc toolchain build:

BR2_arm=y
BR2_cortex_a8=y
BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
BR2_BINUTILS_VERSION_2_45_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y

A RISC-V musl build, with older gcc, older headers:

BR2_riscv=y
BR2_TOOLCHAIN_BUILDROOT_MUSL=y
BR2_KERNEL_HEADERS_6_12=y
BR2_BINUTILS_VERSION_2_45_X=y
BR2_GCC_VERSION_13_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y

Thomas Petazzoni (3):
  package/binutils: add support for binutils 2.45.1
  package/binutils: make binutils 2.44 be the default
  package/binutils: remove support for binutils 2.42

 Config.in.legacy                              |   9 +
 ...ertion-fail-in-nios2_elf32_install_i.patch | 125 ---
 ...gnu23-compatibility-wrt-static_asser.patch |  90 --
 ...ngs-when-building-gprofng-with-Clang.patch | 770 ------------------
 ...gnu23-compatibility-wrt-unprototyped.patch | 619 --------------
 ...007-gprofng-fix-build-with-std-gnu23.patch | 199 -----
 .../{2.42 => 2.45.1}/0001-sh-conf.patch       |  12 +-
 .../0002-poison-system-directories.patch      |  61 +-
 package/binutils/Config.in.host               |  10 +-
 package/binutils/binutils.hash                |   2 +-
 package/binutils/binutils.mk                  |   2 +-
 11 files changed, 53 insertions(+), 1846 deletions(-)
 delete mode 100644 package/binutils/2.42/0003-PR27597-nios-assertion-fail-in-nios2_elf32_install_i.patch
 delete mode 100644 package/binutils/2.42/0004-opcodes-fix-std-gnu23-compatibility-wrt-static_asser.patch
 delete mode 100644 package/binutils/2.42/0005-Fix-32097-Warnings-when-building-gprofng-with-Clang.patch
 delete mode 100644 package/binutils/2.42/0006-gprofng-fix-std-gnu23-compatibility-wrt-unprototyped.patch
 delete mode 100644 package/binutils/2.42/0007-gprofng-fix-build-with-std-gnu23.patch
 rename package/binutils/{2.42 => 2.45.1}/0001-sh-conf.patch (84%)
 rename package/binutils/{2.42 => 2.45.1}/0002-poison-system-directories.patch (87%)

-- 
2.51.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
