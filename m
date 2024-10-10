Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC14ACF07DF
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 09:21:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1311B40F70;
	Thu, 10 Oct 2024 09:21:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9ILLR2nDJd_J; Thu, 10 Oct 2024 09:21:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B9A440F96
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B9A440F96;
	Thu, 10 Oct 2024 09:21:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0B57F1BF4DB
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 09:21:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EDB2840F70
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 09:21:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V3UIc_InURVX for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 09:21:44 +0000 (UTC)
Received-SPF: Pass (sender SPF authorized) identity=helo;
 client-ip=81.169.146.220; helo=mo4-p00-ob.smtp.rzone.de;
 envelope-from=ludwig.kormann@ict42.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9A0EC40025
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A0EC40025
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.220])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9A0EC40025
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 09:21:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1728551737; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=bWXIru/kQxj6Js8ZYANcD2UWUyM7I73rmjdfaLZqzoQDKhnslt91E4xaUshWXrSiwW
 EdymketT2xNI5qQR+MIq6rtt2LjqCnddwukTJ6HadMg1w2/6nLGKzmAIhznPA3XY8AZ6
 svhOQ/mer7STfM/u0aHL1Iz2mlc1S0OJBwlrdzUElSyTE+QyIMw3rrJdK4AkFKyO6WnF
 en2HR//jqAq29QyiN0mL5bfVUd0DIskJedHi2Ih1w5J+wbGYy3qK5YNCOtHtEaEQB0WP
 cNekWpsO3N9UjZSrN3mzpWr4hZ60FnWu2tMgK23xLqRZlfeQRgiSlCnaerWTG/kXr+SN
 U60w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1728551737;
 s=strato-dkim-0002; d=strato.com;
 h=Message-Id:Date:Subject:To:From:Cc:Date:From:Subject:Sender;
 bh=00kRXnpt6hCCiyAO4OtetIInkE2hhrU0eni1xvePiKI=;
 b=tJXnFX6Oi0OjMLnbOf2Zu7nf5nX2jdxzEiz3eWooDKWUI4kz2H1F2goNudRd0mgFhG
 Rh6LmtZQ8ekNTIZzU+STTnaV78e1BZhb0i1y8UhqHQn1vHHp0wNUn7feARwrvHjvIuvU
 FDaf+Suy607dQO9PFGAvivu2x/S84Lz665V8AXB5Y3yyz15JaYCAtQQq7IdRdiByttMA
 8v3ylAeBD6bp0A3Q6Ggq5DwzjQYCXiXZgeIXoIB8KHWTik+1mRpfIlG8AKSsyeWXX2EC
 bm+WieTJEWLQ0Qr8H2eQSLYI0+DYOulm8jQkjvJ8jQqRCwosnZk9tWFASGY54kOtkm11
 iktg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
X-RZG-AUTH: ":IHkAYkmvNfSwjg/qSc4u8zZOVaURsoXe3UH2mQA0KgllCYtN8WqJZ5aMuoQuCdrfzui0vA=="
Received: from debian-test.local.in-circuit.de
 by smtp.strato.de (RZmta 51.2.8 DYNA|AUTH)
 with ESMTPSA id j0dbb009A9Fb2eR
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate) for <buildroot@buildroot.org>;
 Thu, 10 Oct 2024 11:15:37 +0200 (CEST)
From: Ludwig Kormann <ludwig.kormann@ict42.de>
To: buildroot@buildroot.org
Date: Thu, 10 Oct 2024 11:15:30 +0200
Message-Id: <20241010091531.1943185-1-ludwig.kormann@ict42.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1728551737; 
 s=strato-dkim-0002; d=ict42.de;
 h=Message-Id:Date:Subject:To:From:Cc:Date:From:Subject:Sender;
 bh=00kRXnpt6hCCiyAO4OtetIInkE2hhrU0eni1xvePiKI=;
 b=Pu4LcMULBuaEz5ZUsgW68C3V64d5Tvvti7xvOoanxb9VdqaYxhON4H7VKm3NEp6hp8
 +d+qjimgj0BZvdgDapRPoRxgbmq3vcMgKR8Fd+jL5263Ci3MJ2J8m2u8yy9imNN2+T56
 rREdARgW0NIS9tFLxgyKhglxwP5tEZIW8dlKUkVP/ijAjOxasXwe3ImC1yEyDaxYZL2N
 cKBEwtNXGQOESYlXswhj+AMSctlNUd9haENoAtugDP5M89HHz0cp+2xRl7yNuSUqjoQZ
 zGm0GgqbpQHcYjFGaqlGHn0hLsn5R195Trisy9E+xmWdu6+BbgxsmfEoVxJe/udUOBbk
 9YgQ==
X-Mailman-Original-DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 t=1728551737; 
 s=strato-dkim-0003; d=ict42.de;
 h=Message-Id:Date:Subject:To:From:Cc:Date:From:Subject:Sender;
 bh=00kRXnpt6hCCiyAO4OtetIInkE2hhrU0eni1xvePiKI=;
 b=Z7xu9PdflfT7mtnxMJyUpDvW6ob7MQk6VzKiTOfvwAaWHbm0LBZlLHp9EJ0DYDm12G
 RMjFr+iQy8IftyWKm7CA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=ict42.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=ict42.de header.i=@ict42.de
 header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=Pu4LcMUL; 
 dkim=pass header.d=ict42.de header.i=@ict42.de header.a=ed25519-sha256
 header.s=strato-dkim-0003 header.b=Z7xu9Pdf
Subject: [Buildroot] [PATCH 1/2] configs/icnova-a20-adb4006: Bump Linux and
 U-Boot version
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump version of Linux to 6.6.54 and U-Boot to 2024.10

Signed-off-by: Ludwig Kormann <ludwig.kormann@ict42.de>
---
 configs/icnova-a20-adb4006_defconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/configs/icnova-a20-adb4006_defconfig b/configs/icnova-a20-adb4006_defconfig
index ba529c8db5..948b054d83 100644
--- a/configs/icnova-a20-adb4006_defconfig
+++ b/configs/icnova-a20-adb4006_defconfig
@@ -20,7 +20,7 @@ BR2_PACKAGE_HOST_MTOOLS=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.14"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.54"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/in-circuit/icnova-a20-adb4006/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -36,11 +36,12 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="icnova-a20-adb4006"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
