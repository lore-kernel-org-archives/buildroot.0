Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B94C4345F
	for <buildroot@archiver.kernel.org>; Sun, 21 Apr 2024 09:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F58980B79;
	Sun, 21 Apr 2024 09:54:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tdw4b-L7m0op; Sun, 21 Apr 2024 09:54:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39EE280BD5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39EE280BD5;
	Sun, 21 Apr 2024 09:54:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 412CA1BF2F0
 for <buildroot@lists.busybox.net>; Sun, 21 Apr 2024 09:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3AFB2605F7
 for <buildroot@lists.busybox.net>; Sun, 21 Apr 2024 09:54:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1oaCZSb9-25O for <buildroot@lists.busybox.net>;
 Sun, 21 Apr 2024 09:54:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 847A1605DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 847A1605DF
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 847A1605DF
 for <buildroot@buildroot.org>; Sun, 21 Apr 2024 09:54:00 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-571c25a329eso4216618a12.0
 for <buildroot@buildroot.org>; Sun, 21 Apr 2024 02:54:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713693238; x=1714298038;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kCM/H82T9SSxONTHQuQnnSbmIg7C+OwrC53vcl5eOLM=;
 b=U+2Ma6VVdOsFWrUgRcqX02/RVJJ8vya9aUrIg6jVt+xAlH1Y3h37wOEPHg5/eYfrYW
 FR5076nWIUCTByGIKeIWZ8ADrmeHO62jWq2f3TV9W+yp6a9hJKOaZIOeV6OKgYRorRJ1
 i3xqltj8SI/iLaSilu+gdTA077V5rDJobhKAI6ppzwGWK7UCSLkACEWYWzKgowxQAbsP
 KuhpJrPRyYMPWAjJOq5Y1YCPiDRcEhqRzrJ0JnBSgOdRgto3UFgM/Q/3dOfYZdrc66DB
 ZKptecC2WIbuhKcKfDdR1PQn1hFs8Vf130psEQfx9HjqY8QqY2eyk+teaGeA5LTlM8NC
 RzyQ==
X-Gm-Message-State: AOJu0YzDzP2lQFPgMchpHG1jEQpxkp6Ry2hfyzlTN4rzKRfzES/AIrdx
 ZnFVF30gJbAYPYoFVsAxjvO1A96yh/GNcbzyhGsHEL8bWWanQenyxFGWsCll8c/NxM5U84C4swy
 kMqk=
X-Google-Smtp-Source: AGHT+IFpJ+uk1/qTU9JJlGqNO5pSO6wzscQWA8X1QfRwPR+IrRmcmji5Th8qDHuj2qiW2yKC+hwZEg==
X-Received: by 2002:a05:6402:340e:b0:56b:f2d8:1552 with SMTP id
 k14-20020a056402340e00b0056bf2d81552mr9021172edc.13.1713693238206; 
 Sun, 21 Apr 2024 02:53:58 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-8-99-67.retail.telecomitalia.it. [87.8.99.67])
 by smtp.gmail.com with ESMTPSA id
 f15-20020aa7d84f000000b00571db231915sm2318427eds.78.2024.04.21.02.53.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Apr 2024 02:53:57 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun, 21 Apr 2024 11:53:53 +0200
Message-ID: <20240421095353.208034-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240421095353.208034-1-dario.binacchi@amarulasolutions.com>
References: <20240421095353.208034-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1713693238; x=1714298038;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kCM/H82T9SSxONTHQuQnnSbmIg7C+OwrC53vcl5eOLM=;
 b=b7zH+9jq4baWNe1YpB4XU/6asDmiZfHdWzLZ591Ni1QJXrd7jDFDKnuw/a/5WiDjuy
 6ET+6XIM54lUuKa+Sj1Dbrys6JJnF7pqZ36CAK72FHG88KoVojYdxBvdaphTwXWJlxXf
 w+/GlKDVgRG7r6B4GGBMoYkkhqa0qwBVVkdNU=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=b7zH+9jq
Subject: [Buildroot] [RFC PATCH 2/2] configs/ti_am62x_sk_defconfig: create
 the bmap image
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
Cc: Xuanhao Shi <X15000177@gmail.com>, michael@amarulasolutions.com,
 linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The use of a bmap image allows for speeding up the writing of the
image to the SD card, as can be seen from the following results:

$time sudo dd if=output/images/sdcard.img of=/dev/sda
[sudo] password for dario:
655361+0 records in
655361+0 records out
335544832 bytes (336 MB, 320 MiB) copied, 49,1122 s, 6,8 MB/s

real	0m52,177s
user	0m0,022s
sys	0m0,017s

$time sudo bmaptool copy output/images/sdcard.img.gz /dev/sda
bmaptool: info: discovered bmap file 'sdcard.img.bmap'
bmaptool: info: block map format version 2.0
bmaptool: info: 81921 blocks of size 4096 (320.0 MiB), mapped 29339 blocks (114.6 MiB or 35.8%)
bmaptool: info: copying image 'sdcard.img.gz' to block device '/dev/sda' using bmap file 'sdcard.img.bmap'
bmaptool: info: 100% copied
bmaptool: info: synchronizing '/dev/sda'
bmaptool: info: copying time: 11.8s, copying speed 9.7 MiB/sec

real	0m11,885s
user	0m0,004s
sys	0m0,011s

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 configs/ti_am62x_sk_defconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index 5c7b97b3b0b1..708cb98f22d5 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -5,7 +5,7 @@ BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/ti/common/am6xx/post-build.sh"
 BR2_ROOTFS_POST_BUILD_SCRIPT_ARGS="-c ttyS2,115200n8 -d k3-am625-sk.dtb -l am62x-sk-buildroot -r /dev/mmcblk1p2 -x earlycon=ns16550a,mmio32,0x02800000"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS="-c board/ti/am62x-sk/genimage.cfg"
+BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS="-c board/ti/am62x-sk/genimage.cfg -b"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
@@ -44,6 +44,7 @@ BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="tispl.bin"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="TEE=$(BINARIES_DIR)/tee-pager_v2.bin"
+BR2_PACKAGE_HOST_BMAP_TOOLS=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
