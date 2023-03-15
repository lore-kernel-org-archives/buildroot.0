Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 838B3C6FD1D
	for <buildroot@archiver.kernel.org>; Wed, 15 Mar 2023 15:45:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0697460AC1;
	Wed, 15 Mar 2023 15:45:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0697460AC1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uJN7PNNfBySE; Wed, 15 Mar 2023 15:45:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D0C260743;
	Wed, 15 Mar 2023 15:45:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D0C260743
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E3B101BF31E
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 15:45:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BDAE081BCB
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 15:45:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDAE081BCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hHwTWCfn4HAh for <buildroot@lists.busybox.net>;
 Wed, 15 Mar 2023 15:45:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53BCA814B6
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 53BCA814B6
 for <buildroot@busybox.net>; Wed, 15 Mar 2023 15:45:29 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id cn21so47096301edb.0
 for <buildroot@busybox.net>; Wed, 15 Mar 2023 08:45:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678895127;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ty0meAHH74QNwCIA+seEc53E4l3SnAtAuH4OIdgTKyI=;
 b=7h2QP4VNUo0v8gy4pCqnpEK39IGdbS09l09YreeEyR7T5Hez9k5o4a+vxoEPmNaND3
 K7d482a9zwv8bzmuV3MkKdIMXS70U8QftM1cw93XQVF2SfJph2XTqIzvDhC776ZBW3Sz
 boPC4Gis8NyNX6lrMW1c/rXQ11xy3ZORpCH7fczzXnc4x7pX68wL5J0ijCMfZsHHbe19
 oLffWhl1vWPWsYArjVihL7Gge1H71GcRXym6U9SRV+uUpepnrVcPmWg+osifIBxrCp7g
 EbUEYoGlrqEnhevlKzV+YaVwDCnxpzClRtcoEyRIM2jp3Hr2rTUXPOK+AALjy1fX5EFQ
 xnBg==
X-Gm-Message-State: AO0yUKUkFEyZuocC2J1pu9/zJg3rlQ+5RumOHdAiTiXUDUgvgKC9gh7i
 +oromCHjJrlkMWi9TUz88hss5s1uP9I=
X-Google-Smtp-Source: AK7set/BPvGWQ84tfDwWL8dED6JI7/356E4DE72do1TIpXwT+G4B9A2DKIW3rD3dBeMTBjLhO6z6/w==
X-Received: by 2002:a17:907:72c1:b0:920:388c:5c60 with SMTP id
 du1-20020a17090772c100b00920388c5c60mr8565902ejc.41.1678895127182; 
 Wed, 15 Mar 2023 08:45:27 -0700 (PDT)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 l1-20020a170906644100b0091f5e98abd5sm2663166ejn.133.2023.03.15.08.45.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 08:45:26 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 15 Mar 2023 16:45:00 +0100
Message-Id: <20230315154500.1054297-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678895127;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ty0meAHH74QNwCIA+seEc53E4l3SnAtAuH4OIdgTKyI=;
 b=qS5PlKKjUrrx2VHRMa6sCRFZra1nxt78zZzRYXqlzf7YYEdSoRB06O9Y3FgmUcDKma
 K9urYp8Wmu41mEfWhlduVQXMWzbVDkqhsHjS6/dKJlFVm3oR+Y9J9RinqIg3Bim7TrnW
 HDZuzHe5+h6CTZzLYZIglM2G/9qatHO7KNO9uR049SQbcqst9kUjk7uV8boSxmKquQJS
 xklyNhPmYPu0Ms2UHaadSvlgfdH1RIM9ExipzC/vi3Qjd1kUh0veWOPfxd07EpMYrhD5
 kTwxvuF3YMN5jkM9JQ1jc8l+MrpoqLGDfysllGAgOTGHLIZ6Q6X4HXV9orWPavseuHeZ
 CeUA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=qS5PlKKj
Subject: [Buildroot] [PATCH] configs/olimex_stmp157: bump Linux and U-Boot
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
index 60c34d7fa..3b56fefec 100644
--- a/configs/olimex_stmp157_olinuxino_lime_defconfig
+++ b/configs/olimex_stmp157_olinuxino_lime_defconfig
@@ -17,8 +17,8 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/stmp1_olinuxino/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/OLIMEX/linux-olimex.git"
-# branch release-20221011-v5.10.105
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="1b955f3ee7ef3234f290f65dbea108063996aea0"
+# branch release-20230217-v5.10.105
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="c5a31724bdfaac894553b51c5a0fb92c1f10f3db"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/olimex/stmp1_olinuxino/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -35,8 +35,8 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/OLIMEX/u-boot-olinuxino.git"
-# release-20220927, based on 2021.04
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="98ab5ecb0a16eeb426f34b2a1a28e56658c1a59c"
+# release-20230110, based on 2021.04
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="9a49a20f71c698f538defbb69a6c6cb657d4315f"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="STM32-OLinuXino-LIME"
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_IMG=y
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
