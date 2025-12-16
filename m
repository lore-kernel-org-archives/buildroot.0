Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B04D5CC89
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 09:14:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0582F808BC;
	Tue, 16 Dec 2025 09:14:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zjJZPA5CuluU; Tue, 16 Dec 2025 09:14:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D26580956
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765876471;
	bh=nmjx+EFcDyuNpHQdYaS45JB6E1yJN64vnaYlBiH/gmA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jkfmaCC68JpJrq+047w3qIZLNY/foT8iDeN1AK1NWVnyv+Ec+Wc5cYIpbTzG5nfE7
	 NcC2UE6HuZjlEHstlSk//1WE0PfY5xq/qG3XPhUX3aJDjKy274US8kmMH0x8pmSeMO
	 xZWQyYr+znRnGwjnW6biEF9K5G+ESRt1pMj/eJI+Vjqby0h+6SAbKUCSOLaLXRWBei
	 3SDPr1yb6ddcjQeGpeTkirdIW5fVcLFbTusMizImCGX7pXTB7AXzVyVKYjU+GOiJta
	 tVQ8llEFouwEWIciMNahhEopdAr/Xy79urnkT3XmduTBuxvoTXpEYqsn3TcYUE1d1V
	 4wefN4AL+EWSw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D26580956;
	Tue, 16 Dec 2025 09:14:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 12A6D372
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 09:14:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE1A640B18
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 09:14:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mKLzuXilP2PE for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 09:14:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:660:530d:201::44; helo=mailgw-out1.grenoble.cnrs.fr;
 envelope-from=bonet@grenoble.cnrs.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1D58840B17
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D58840B17
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1D58840B17
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 09:14:27 +0000 (UTC)
Received: from [147.173.65.159] (unknown [147.173.65.159])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 5B031C1FF7;
 Tue, 16 Dec 2025 10:14:26 +0100 (CET)
Message-ID: <e6ff9c08-d044-463b-b3f7-2815d619be0a@grenoble.cnrs.fr>
Date: Tue, 16 Dec 2025 10:14:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Buildroot development <buildroot@buildroot.org>
Cc: Biagio Montaruli <biagio.hkr@gmail.com>
References: <c46ebb5e-ee04-4e67-8883-db808aa2161a@grenoble.cnrs.fr>
Content-Language: en-US, fr
In-Reply-To: <c46ebb5e-ee04-4e67-8883-db808aa2161a@grenoble.cnrs.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1765876466;
 bh=AAX8X0hUD3D0O9jIKFR58/Kg/A17UL9GWA4esR/N7TA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Bo7bFptB5svQ+8PDfDBK/bgtuZRMryEjEiitdsEEn3O/fLsFSjWgykx/VofplxYvO
 b1LEYwdXNX7OqBqMCtI7tW2UQRstxoLyCfznXyJkmZTXYDFarUcEZ2X5MlAJoRi61R
 x0bUrKDOxAneO5jnGUgF2L1LmXPkNWac1n0sarX672SdaifDtB940tm7B3zlaydXhw
 5BSHw4pAb+2ATqPt6wX9TyTJRRMn4U1Smhc7685GcopJtc5jUdDMO1Z5n3977ov35G
 ABXs7aJD8aHoVBnNbNGIWCHIN/sDJOBMtBb6d4l6QWnqnNr15I1lRh6tJvUN3Yy6M0
 9nvv6EiAG20lA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=Bo7bFptB
Subject: [Buildroot] [PATCH 2/2] configs/acmesystems_acqua_a5_*: bump to
 Linux 6.18.1
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
From: Edgar Bonet via buildroot <buildroot@buildroot.org>
Reply-To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Also update the device tree: since Linux v6.15-rc1 (510a6190cf5e "ARM:
dts: microchip: fix faulty ohci/ehci node names"), the USB nodes are
named "usb" instead of "ohci" or "ehci".

Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
---
 .../acmesystems/acqua-a5/dts/microchip/at91-sama5d3_acqua.dts | 4 ++--
 board/acmesystems/acqua-a5/patches/linux/linux.hash           | 2 +-
 configs/acmesystems_acqua_a5_256mb_defconfig                  | 2 +-
 configs/acmesystems_acqua_a5_512mb_defconfig                  | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/board/acmesystems/acqua-a5/dts/microchip/at91-sama5d3_acqua.dts b/board/acmesystems/acqua-a5/dts/microchip/at91-sama5d3_acqua.dts
index 60be8a67cd..4754c3cf1c 100644
--- a/board/acmesystems/acqua-a5/dts/microchip/at91-sama5d3_acqua.dts
+++ b/board/acmesystems/acqua-a5/dts/microchip/at91-sama5d3_acqua.dts
@@ -281,11 +281,11 @@
             status = "disabled";
         };
 
-        usb1: ohci@600000 {
+        usb1: usb@600000 {
             status = "okay";
         };
 
-        usb2: ehci@700000 {
+        usb2: usb@700000 {
             status = "okay";
         };
 		
diff --git a/board/acmesystems/acqua-a5/patches/linux/linux.hash b/board/acmesystems/acqua-a5/patches/linux/linux.hash
index 2c86a53263..f94bd191dc 100644
--- a/board/acmesystems/acqua-a5/patches/linux/linux.hash
+++ b/board/acmesystems/acqua-a5/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  6b19a3ae99423de2416964d67251d745910277af258b4c4c63e88fd87dbf0e27  linux-6.12.41.tar.xz
+sha256  d0a78bf3f0d12aaa10af3b5adcaed5bc767b5b78705e5ef885d5e930b72e25d5  linux-6.18.1.tar.xz
diff --git a/configs/acmesystems_acqua_a5_256mb_defconfig b/configs/acmesystems_acqua_a5_256mb_defconfig
index f693ad9baf..74ce958cd3 100644
--- a/configs/acmesystems_acqua_a5_256mb_defconfig
+++ b/configs/acmesystems_acqua_a5_256mb_defconfig
@@ -11,7 +11,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/acqua-a5/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.41"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.1"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_CUSTOM_DTS_DIR="board/acmesystems/acqua-a5/dts"
diff --git a/configs/acmesystems_acqua_a5_512mb_defconfig b/configs/acmesystems_acqua_a5_512mb_defconfig
index 3e243cd45e..d3912659db 100644
--- a/configs/acmesystems_acqua_a5_512mb_defconfig
+++ b/configs/acmesystems_acqua_a5_512mb_defconfig
@@ -11,7 +11,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/acqua-a5/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.41"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.1"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_CUSTOM_DTS_DIR="board/acmesystems/acqua-a5/dts"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
