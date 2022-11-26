Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A045C4332F
	for <buildroot@archiver.kernel.org>; Sat, 26 Nov 2022 18:00:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7681060E34;
	Sat, 26 Nov 2022 18:00:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7681060E34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ugrnhCFZFFf9; Sat, 26 Nov 2022 18:00:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B999960E0A;
	Sat, 26 Nov 2022 18:00:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B999960E0A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 24A341BF356
 for <buildroot@lists.busybox.net>; Sat, 26 Nov 2022 18:00:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F383C81E0E
 for <buildroot@lists.busybox.net>; Sat, 26 Nov 2022 18:00:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F383C81E0E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gq1v4casw11C for <buildroot@lists.busybox.net>;
 Sat, 26 Nov 2022 18:00:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E03E81E06
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0E03E81E06
 for <buildroot@busybox.net>; Sat, 26 Nov 2022 18:00:32 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 j5-20020a05600c410500b003cfa9c0ea76so5579763wmi.3
 for <buildroot@busybox.net>; Sat, 26 Nov 2022 10:00:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rufbfOe+ZGHGiSjso2S0ivoSsWMoJLvID6pPR5blKwg=;
 b=Ahfkvpi73OsET1HkGs8xa7Xlv4vZ+xl83sg68FHtkcc8B8eEESCN2Rflep2nuxMsK4
 ElPfpDNRFIbiN2p9oF8NcEYds4ozoG2iuykPzehbQsj1DouddJmuvL1aGY2rtrEEXqP9
 yVAYcf1TvbBmpdkWBVq7xVfNsJ+hXOXKRZFFU+rznW75o4n5YLh+Jt5fzIaJ3VRft7cS
 CsnWW8dtDYt8KeRJZCz7sVIIah313NKPMK563cGhEHQLNZ30FNaslC2MzKA/oBirk7AZ
 eXZIFGYtaKkJ6J+Q7k0DoyVQn+Coy6/J+NpT2XUWpmSeu//883lfIxcEuC+EDQkRuQR6
 45qw==
X-Gm-Message-State: ANoB5pm9Z2nvBzceEfBm4el69Fa82IOEAuoFTkjBfnaUIOsYB7xFS6nS
 c15PTJe6FMQv6iHYtAncbhgg1jHVpIY=
X-Google-Smtp-Source: AA0mqf7uMH3UZDglw3Zwc5xIX5WgmxYkxHw8KzT3Bxg8CEF88Raj7KSB3PcQvRX4fwaYEDsjnqG5dg==
X-Received: by 2002:a05:600c:ac1:b0:3c6:d18b:304b with SMTP id
 c1-20020a05600c0ac100b003c6d18b304bmr20498276wmr.142.1669485630928; 
 Sat, 26 Nov 2022 10:00:30 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 r12-20020a5d494c000000b00241b6d27ef1sm6360340wrs.104.2022.11.26.10.00.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Nov 2022 10:00:30 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 26 Nov 2022 19:00:15 +0100
Message-Id: <20221126180016.280061-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rufbfOe+ZGHGiSjso2S0ivoSsWMoJLvID6pPR5blKwg=;
 b=bPlXNy8ycuEUzx1B3JeIfJvKhayXxZPHaAZkQkgvLuXdGGpqeeRFDVjy3zdRuFeyup
 M+0q/fDTCQs7By8TKV5Y/u6KrZWX87mQzd8NSv6QI6S44UctXo89j7JStA7tfT4BqXBA
 ipELSV4sOqNuvha/P2VQricVjpVmzxqTAqDnRR7VNnMdox7RhVeubLHY6XrOiaQez3zV
 Qdo5pqq5/ez+H5Zxa45LC8+k1+q/iDhN5ScY+g8/GT46S04dqsG8T6lYYt0kVUpK7JXi
 2WqfQ01bj8y+3MN6DqQnYKl0pPB35n+RbJOvbZmaTHAmAwShk06phRn663KEy5USNhH+
 QfQg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=bPlXNy8y
Subject: [Buildroot] [PATCH 1/2] configs/olimex_stmp157: bump Linux and
 U-Boot
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 configs/olimex_stmp157_olinuxino_lime_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/olimex_stmp157_olinuxino_lime_defconfig b/configs/olimex_stmp157_olinuxino_lime_defconfig
index a63394fa0..49670dbe4 100644
--- a/configs/olimex_stmp157_olinuxino_lime_defconfig
+++ b/configs/olimex_stmp157_olinuxino_lime_defconfig
@@ -16,8 +16,8 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/stmp1_olinuxino/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/OLIMEX/linux-olimex.git"
-# branch release-20220413-v5.10.105
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="d417808c240d55576ee76e5cbb40413ad444ecfd"
+# branch release-20221011-v5.10.105
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="1b955f3ee7ef3234f290f65dbea108063996aea0"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/olimex/stmp1_olinuxino/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -34,8 +34,8 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/OLIMEX/u-boot-olinuxino.git"
-# release-20220413, based on 2021.04
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="b39c5a7c93a2d8efaecc9cad4284378af857c3f7"
+# release-20220927, based on 2021.04
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="98ab5ecb0a16eeb426f34b2a1a28e56658c1a59c"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="STM32-OLinuXino-LIME"
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_IMG=y
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
