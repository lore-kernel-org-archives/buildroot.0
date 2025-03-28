Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC5CDC36013
	for <buildroot@archiver.kernel.org>; Fri, 28 Mar 2025 19:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F80F70913;
	Fri, 28 Mar 2025 19:57:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rFYNHUZAVnv3; Fri, 28 Mar 2025 19:57:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F487708D3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F487708D3;
	Fri, 28 Mar 2025 19:57:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 75C0D19A
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 19:57:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 682FD4F260
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 19:57:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tcizsdlbT5bE for <buildroot@buildroot.org>;
 Fri, 28 Mar 2025 19:57:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=francois.dugast.foss@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 913AB4F268
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 913AB4F268
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 913AB4F268
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 19:57:47 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-39149bccb69so2278733f8f.2
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 12:57:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743191865; x=1743796665;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8e5cRQ2uux4pO4GHY0xb1cOdHI6AiDwLeK0kws4urd8=;
 b=E4eVWsJXn4AU8ar6X8hO7uNSvaLY5pLDym1wyTcWijMPnchOYdTmb7ILH6kKpSvf17
 CWWO9Y1kTIcrx21G3+Cay69YsdpDCskvLZ+37riX9XCetvb1TSe6dbEvz3tiZPQZ9qaj
 EbYJ7vc4FakcQsw1v3hngPf8fGhctcav5y4SLf/IPPbFQii3gy+g36NvOQQH8c+wshAy
 0YhkVQdLsZF8yEXH5+4KHYLhEdn73E9srTrwr6NPyqYl4+n4vR3d9QJv4/IgJw/Js7uc
 W/5NL3cuH623AyqMuPSCInxg2lc0HzmC4L+TEvZ9mxctu/AtMBHqSlDFIBji2SBGdxee
 nh1w==
X-Gm-Message-State: AOJu0YzdFej+MwiexE3OW3x4JsgK2sX0RvyDCb1qXm4OJ1mq3zamUX41
 dAg23vWMP6gEXtZMSquvet5q38GGOd54Tn4xm2/xtikae3KMncN9XEfe3Q==
X-Gm-Gg: ASbGncv94Ptkmx4vsCDCcM5TC2q9u+vMxVFe9sjSTPQNFL3AqLrcjy3fPTRlT/bxe8X
 T6Nzoc2qSCyNza85waC6ZNPVReKSbMZbmuYYgBMXzFFM1eiLiR6384XwYFLQaghjDl96cjAULBc
 EiHk0/Dh7xx14Yrvcum7KEqL+vDUN/SR8RG90JO8m32wiOMAK0ML7KxQxhszRUb4025h/8k7cHv
 FrO62fI5VGg/whMDn+yvOVU20c7PfTQptkuvaJZ4gsNCTx7dwy8cFvH3u6UgFCJNckj8XnwxLWt
 V/m5G7Avhg9eAEW/+teX6vMEUylbn46PvJZcLSe1IZonycMr/nWQjkZi66UrMQwKyFu2HkI4j6g
 i7x5bxr91u+pm4PBKTBqNRtPdI7KJ
X-Google-Smtp-Source: AGHT+IGFt6HQVIktPMvNK9RowQUbyEtqPNWodeWAGJb9N5Tjk57VGOz6JZF5nZeoeMEzCSQ2iM90JQ==
X-Received: by 2002:a5d:5f90:0:b0:391:2e0f:efce with SMTP id
 ffacd0b85a97d-39c120ccaa4mr393705f8f.1.1743191865177; 
 Fri, 28 Mar 2025 12:57:45 -0700 (PDT)
Received: from comet.lan (lfbn-ren-1-1629-205.w86-253.abo.wanadoo.fr.
 [86.253.181.205]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b79e0dcsm3552272f8f.64.2025.03.28.12.57.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Mar 2025 12:57:44 -0700 (PDT)
From: Francois Dugast <francois.dugast.foss@gmail.com>
To: buildroot@buildroot.org
Cc: Alistair Francis <alistair@alistair23.me>, ju.o@free.fr,
 Francois Dugast <francois.dugast.foss@gmail.com>
Date: Fri, 28 Mar 2025 20:57:39 +0100
Message-Id: <20250328195741.3921731-3-francois.dugast.foss@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250328195741.3921731-1-francois.dugast.foss@gmail.com>
References: <20250328195741.3921731-1-francois.dugast.foss@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743191865; x=1743796665; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8e5cRQ2uux4pO4GHY0xb1cOdHI6AiDwLeK0kws4urd8=;
 b=F0T7b397zJdlbxyO0XqVu0P5hRi01bnUdbk1m1FdrnS/Vubpcl/LN1ZFnowMExFugt
 IO+33fNkXHDMfx4EvDH340wI4cytA5q9q3tN1YqzhlNXG8q3MF11ng77gChxtzLZI49a
 fjAxKGodeJCd13nr5vPraDaB/nzbI7rpop5xb1Kw1fVFAprdtkgr9e9oedxVOaKKWPip
 mvl3BtDk/79VsFxSdEExMZNw/0AX66GPbPl7qJkqY4oOzT97OpmEEge9SR5vEw4Z3CBL
 1kgBXyBUOHT4FtA6x7mCDcPEcvUjdsc7U2V2F01hq+mDL/ImCWc/j70ucRxDJnLXKdq1
 MshQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=F0T7b397
Subject: [Buildroot] [PATCH 2/4] configs/hifive_unleashed: extract common
 configuration
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

Move the generic part of the configuration into a new "common" directory
so that it is easier to add similar boards without duplicating the files.

Signed-off-by: Francois Dugast <francois.dugast.foss@gmail.com>
---
 .../sifive/{hifive-unleashed => common}/genimage_sdcard.cfg | 0
 .../{hifive-unleashed => common}/genimage_spi-nor.cfg       | 0
 .../{hifive-unleashed => common}/linux.config.fragment      | 0
 board/sifive/{hifive-unleashed => common}/post-build.sh     | 0
 board/sifive/hifive-unleashed/readme.txt                    | 2 +-
 configs/hifive_unleashed_defconfig                          | 6 +++---
 6 files changed, 4 insertions(+), 4 deletions(-)
 rename board/sifive/{hifive-unleashed => common}/genimage_sdcard.cfg (100%)
 rename board/sifive/{hifive-unleashed => common}/genimage_spi-nor.cfg (100%)
 rename board/sifive/{hifive-unleashed => common}/linux.config.fragment (100%)
 rename board/sifive/{hifive-unleashed => common}/post-build.sh (100%)

diff --git a/board/sifive/hifive-unleashed/genimage_sdcard.cfg b/board/sifive/common/genimage_sdcard.cfg
similarity index 100%
rename from board/sifive/hifive-unleashed/genimage_sdcard.cfg
rename to board/sifive/common/genimage_sdcard.cfg
diff --git a/board/sifive/hifive-unleashed/genimage_spi-nor.cfg b/board/sifive/common/genimage_spi-nor.cfg
similarity index 100%
rename from board/sifive/hifive-unleashed/genimage_spi-nor.cfg
rename to board/sifive/common/genimage_spi-nor.cfg
diff --git a/board/sifive/hifive-unleashed/linux.config.fragment b/board/sifive/common/linux.config.fragment
similarity index 100%
rename from board/sifive/hifive-unleashed/linux.config.fragment
rename to board/sifive/common/linux.config.fragment
diff --git a/board/sifive/hifive-unleashed/post-build.sh b/board/sifive/common/post-build.sh
similarity index 100%
rename from board/sifive/hifive-unleashed/post-build.sh
rename to board/sifive/common/post-build.sh
diff --git a/board/sifive/hifive-unleashed/readme.txt b/board/sifive/hifive-unleashed/readme.txt
index e9ccb26fa6..45cb8ece55 100644
--- a/board/sifive/hifive-unleashed/readme.txt
+++ b/board/sifive/hifive-unleashed/readme.txt
@@ -97,7 +97,7 @@ Adjust Buildroot configuration by:
   $ make menuconfig
 
 Change "System configuration" -> "Extra arguments passed to custom scripts"
-value to "-c board/sifive/hifive-unleashed/genimage_spi-nor.cfg", save the
+value to "-c board/sifive/common/genimage_spi-nor.cfg", save the
 configuration and build. This creates a output/images/spi-nor.img that can
 be programmed to the on-board SPI flash.
 
diff --git a/configs/hifive_unleashed_defconfig b/configs/hifive_unleashed_defconfig
index cb217a5af1..f96e171e43 100644
--- a/configs/hifive_unleashed_defconfig
+++ b/configs/hifive_unleashed_defconfig
@@ -8,14 +8,14 @@ BR2_RISCV_ISA_RVC=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttySIF0"
 BR2_SYSTEM_DHCP="eth0"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/sifive/hifive-unleashed/post-build.sh"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/sifive/common/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/sifive/hifive-unleashed/genimage_sdcard.cfg"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/sifive/common/genimage_sdcard.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.190"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sifive/hifive-unleashed/linux.config.fragment"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sifive/common/linux.config.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="sifive/hifive-unleashed-a00"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
