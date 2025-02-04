Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8BADC02193
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 16:36:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99A0C82225;
	Tue,  4 Feb 2025 16:36:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WsrgXUqSQUlK; Tue,  4 Feb 2025 16:36:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58E1A820AE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58E1A820AE;
	Tue,  4 Feb 2025 16:36:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 44A4012A
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 16:36:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5189180CF0
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 16:36:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XLneUhOQ0niE for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 16:36:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2F5CC80CE7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F5CC80CE7
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2F5CC80CE7
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 16:36:28 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-385dece873cso2751046f8f.0
 for <buildroot@buildroot.org>; Tue, 04 Feb 2025 08:36:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738686986; x=1739291786;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3r+0FmL//RcilU/+TzO/w1q100z3SaBCGOpme82h/FQ=;
 b=Ce1XUiImQewHP7h1QdZHWHpo1EVyGyjvepy4XknjZJ7FcuTPyimIaTN/HTN90fEU1z
 +Omi9Tnx2KhIYUYYsTXQjuT5Ln0hvYQOMbnzXRm2jkNFQE4GJlNf54uuLAtqQzn3Ypjo
 fZVKGLbqdLhhACnwp9lYBNEkYCQcNSpbECGAa8NFOe76C0dcaDBoeEw1arlm7gGJc0oG
 sS7Y6nTIyYZHr7l/8CPugRHK/6LuDr3zw7wosbRVZq4Os/09EwhYIxh1DEJUzniChqd3
 +7hczd0N0hOgDvxCRpn3ndyRnKVtJDlJMVDnPxZrIkwTzD/hzD5WwL0e72lE/b6USUGv
 1w/Q==
X-Gm-Message-State: AOJu0YwnFZQpJ5qz7Cw6lvtNyxRRgWIlNlHlLoIWbWXnz/vp0blpX++1
 SC9WezBOXf6Gm1KOmxcauODJy/ps/olD16cSfnp5NBS6mDVHouID3mnZJWtb2bFfSAOLPdLJ0RT
 wkd4=
X-Gm-Gg: ASbGncuG4vSgeVX6ExRzdPmWNcJDfbSxn3Ug+dBVZvpyxcWrkEPvx2l4Wyq1i7haxzB
 1wBDdrUQYWK4VqxY+IuTh39xvpcZClapySOsuoytFmxgGboVQnpekjCwz+c5kwcgPjxLtt5Ghgz
 2EiUCJqfdHhxz3qSmERZn2pWwTld8mOinG0MXZi42mu9AvDq+mYy24NgXIkQmi+Euc+/jGGB27S
 IdyM9c++jm649OqaadufXkLSV6V2EUcA+8GXANdhVbfrfQX3YRcTAQsiOlEL9T8V3i4lqRtIZv4
 5zD/fCIl8M8Q9eXid4fELE5C+kJIouxSB5A+0mg5jD4bbhlS+/oXD5k=
X-Google-Smtp-Source: AGHT+IFwpW+npPn0UD+4NXqHfe1pkf6V1+Q6QrSmS2YXN8/uWns8uweFJWVfQ/zW1uPuYDmoyv7LQw==
X-Received: by 2002:a5d:47a6:0:b0:385:f892:c8fe with SMTP id
 ffacd0b85a97d-38c5195b4b5mr26834299f8f.21.1738686986226; 
 Tue, 04 Feb 2025 08:36:26 -0800 (PST)
Received: from P-NTS-Evian.. (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1cf560sm16032693f8f.89.2025.02.04.08.36.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2025 08:36:25 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>, Edgar Bonet <bonet@grenoble.cnrs.fr>
Date: Tue,  4 Feb 2025 17:36:19 +0100
Message-ID: <20250204163622.192932-4-romain.naour@smile.fr>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250204163622.192932-1-romain.naour@smile.fr>
References: <20250204163622.192932-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1738686986; x=1739291786; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3r+0FmL//RcilU/+TzO/w1q100z3SaBCGOpme82h/FQ=;
 b=ssVhKEIW//RhByT7CyEPXjaRJP7CdLUxK6Rt1+HsK6zhFXn+JvNYbA7E+YKElay33q
 AV1Y9fTK0egjCqSCkD1ZiWo99oG99S50yDEuVwcHARCh4NZ/xDkkGYR6V11uyMAyiLBz
 Fyt+UjzU0pClYEQZwlPMjnecMOd7cQG6gOS/Q=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=ssVhKEIW
Subject: [Buildroot] [PATCH v5 4/6] configs/acmesystems_acqua_a5_*: bump to
 Linux 6.12.9
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use the newly introduced BR2_LINUX_KERNEL_CUSTOM_DTS_DIR
option to provide the Out-of-tree Device Tree Source file with
its vendor subdirectory that is needed since kernel 6.12 [1].

Revert the sama5d31.dtsi include path update added by the previous
kernel version bump 6.6.12 [2].

As noticed by Michael Walle, newer OOT device trees should use the
same #include directives as the in-tree device trees to ease
sharing the files between u-boot, linux and OOT external trees [3].

[1] https://lists.buildroot.org/pipermail/buildroot/2024-October/765463.html
[2] 8fb5209885 ("configs/acmesystems_acqua_a5_*: bump to Linux 6.6.12")
[3] https://lore.kernel.org/buildroot/D6UG5Z1HUN9N.GWVHB4L823ZC@kernel.org/

Cc: Edgar Bonet <bonet@grenoble.cnrs.fr>
Acked-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
Tested-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
Runtime testing:
v4: https://lore.kernel.org/buildroot/e68817f0-312c-4980-837c-7264656457ca@grenoble.cnrs.fr/
---
 .../acqua-a5/{ => dts/microchip}/at91-sama5d3_acqua.dts     | 2 +-
 board/acmesystems/acqua-a5/patches/linux/linux.hash         | 2 +-
 configs/acmesystems_acqua_a5_256mb_defconfig                | 6 +++---
 configs/acmesystems_acqua_a5_512mb_defconfig                | 6 +++---
 4 files changed, 8 insertions(+), 8 deletions(-)
 rename board/acmesystems/acqua-a5/{ => dts/microchip}/at91-sama5d3_acqua.dts (99%)

diff --git a/board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts b/board/acmesystems/acqua-a5/dts/microchip/at91-sama5d3_acqua.dts
similarity index 99%
rename from board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts
rename to board/acmesystems/acqua-a5/dts/microchip/at91-sama5d3_acqua.dts
index 411d1942f5..60be8a67cd 100644
--- a/board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts
+++ b/board/acmesystems/acqua-a5/dts/microchip/at91-sama5d3_acqua.dts
@@ -9,7 +9,7 @@
  * Licensed under GPLv2 or later.
  */
 /dts-v1/;
-#include "microchip/sama5d31.dtsi"
+#include "sama5d31.dtsi"
 
 / {
 	model = "Acme Systems Acqua SOM";
diff --git a/board/acmesystems/acqua-a5/patches/linux/linux.hash b/board/acmesystems/acqua-a5/patches/linux/linux.hash
index 4b20a009a7..7a4c4e57c9 100644
--- a/board/acmesystems/acqua-a5/patches/linux/linux.hash
+++ b/board/acmesystems/acqua-a5/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  b66a5b863b0f8669448b74ca83bd641a856f164b29956e539bbcb5fdeeab9cc6  linux-6.6.30.tar.xz
+sha256  87be0360df0931b340d2bac35161a548070fbc3a8c352c49e21e96666c26aeb4  linux-6.12.9.tar.xz
diff --git a/configs/acmesystems_acqua_a5_256mb_defconfig b/configs/acmesystems_acqua_a5_256mb_defconfig
index b102dde0ba..a50e306b1b 100644
--- a/configs/acmesystems_acqua_a5_256mb_defconfig
+++ b/configs/acmesystems_acqua_a5_256mb_defconfig
@@ -2,7 +2,7 @@ BR2_arm=y
 BR2_cortex_a5=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/acmesystems/acqua-a5/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_SYSTEM_DHCP="eth0"
@@ -10,10 +10,10 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/acqua-a5/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.30"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts"
+BR2_LINUX_KERNEL_CUSTOM_DTS_DIR="board/acmesystems/acqua-a5/dts"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
diff --git a/configs/acmesystems_acqua_a5_512mb_defconfig b/configs/acmesystems_acqua_a5_512mb_defconfig
index da54eaf620..6ae8d037e7 100644
--- a/configs/acmesystems_acqua_a5_512mb_defconfig
+++ b/configs/acmesystems_acqua_a5_512mb_defconfig
@@ -2,7 +2,7 @@ BR2_arm=y
 BR2_cortex_a5=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/acmesystems/acqua-a5/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_SYSTEM_DHCP="eth0"
@@ -10,10 +10,10 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/acqua-a5/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.30"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts"
+BR2_LINUX_KERNEL_CUSTOM_DTS_DIR="board/acmesystems/acqua-a5/dts"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
