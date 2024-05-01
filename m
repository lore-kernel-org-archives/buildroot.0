Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADDC8C4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 19:05:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73CBB606C4;
	Wed,  1 May 2024 19:05:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rfPhFL7OSWrM; Wed,  1 May 2024 19:05:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75E6F60BBA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75E6F60BBA;
	Wed,  1 May 2024 19:05:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2FDFC1BF578
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 19:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1C64B401EB
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 19:05:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G8DGzeq1cgWN for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 19:05:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com;
 envelope-from=tekieli.lukasz@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ADD004011C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ADD004011C
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ADD004011C
 for <buildroot@buildroot.org>; Wed,  1 May 2024 19:05:30 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-51f0f6b613dso65189e87.1
 for <buildroot@buildroot.org>; Wed, 01 May 2024 12:05:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714590328; x=1715195128;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zD+RJzzo+XmYbj+BwTeaek4S0ytltv9HXz9zYCUdf34=;
 b=himHHhZU3aWs1zJbHmSR1qAUs/jhRmff/q1lB3dsDqSQ/d133wd5SNPo3WS071b0IQ
 GPdVvVVu+uecKQ5MnyDbNHDwivL2QAP4CINEP0vRks/L9oaEkFFRe1Xsrz9LH8QXmZh5
 Gc+kxO/RM4jks2kwFdhkhNSiuUV1qVV1tu2AVDw58nP5wG0dqmWPBxSRa/ClTSSVvhs1
 s/kW4+dn3ym1JgvWS6q/ob7KZs836Gprqdx6AxxG4qJN+SQHMY+Ucvxee/3WwBVep6ws
 XZcr+gvFaSZHgd3LQvJC0kcG08/I5xE6rd3zN4I9YFcDSjgUAfcWito/USXnfl3SWD7U
 m9GA==
X-Gm-Message-State: AOJu0YycDsGnzhIvcxL6XtfpE6GEIy6tc9jMI46DIPZdO//KJDgNW5L4
 /OAEV1W/zhlqYDRmwQK364VIhw/MljLYIrH/6qKRgBOLsC5wMEe7XE9vEeai
X-Google-Smtp-Source: AGHT+IEdEvFlkS1iIMrgaGYmjgS0TB6vw9/EfIXSdgvJgBweyVhb1j+zO04qeKxHdJPt3/RgcDLjxA==
X-Received: by 2002:a05:6512:3111:b0:51e:f67b:e914 with SMTP id
 n17-20020a056512311100b0051ef67be914mr495141lfb.33.1714590327666; 
 Wed, 01 May 2024 12:05:27 -0700 (PDT)
Received: from yoga7.fritz.box (ip5f5bff47.dynamic.kabel-deutschland.de.
 [95.91.255.71]) by smtp.gmail.com with ESMTPSA id
 ev9-20020a056402540900b005725de35790sm5845058edb.61.2024.05.01.12.05.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 May 2024 12:05:27 -0700 (PDT)
From: Lukasz Tekieli <tekieli.lukasz@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  1 May 2024 21:04:41 +0200
Message-Id: <20240501190441.496683-1-tekieli.lukasz@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714590328; x=1715195128; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zD+RJzzo+XmYbj+BwTeaek4S0ytltv9HXz9zYCUdf34=;
 b=KFtctoL7WNy77NpiGdphPCKFqzBN+61xdRW+4Gw30vZlghavJFEkWXlefDTLqqQzVw
 wjXo4Drs5hQky9T4e1Cysf4d0NcEgmgMK851lxcKEMZqn1E+RAnI7Fk8/fuT9H7JIAAX
 embTswcIjhDigYbiQXYRQUPFQcO3jJ9QHkPim+0eJes3CNVZy3htL5kAR7MWmzCpth0D
 f9ffQ1yOXQpx/UhRF2de0Yk05CSfxEFiAZ0Ydml4NsshdavSmejfTQ1g8+p++Dkg0CW0
 9NcnoNkf5I/+9E/7cQ0CPBIqCp9ynkUZ2KkSt51gjPK++E63vfuN1HWGSxWc2D/wVgp+
 K1aQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KFtctoL7
Subject: [Buildroot] [PATCH 1/1] configs/visionfive2_defconfig: add hashes
 for linux/opensbi/u-boot
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
Cc: Francois Dugast <francois.dugast.foss@gmail.com>,
 Lukasz Tekieli <tekieli.lukasz@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Enable BR2_DOWNLOAD_FORCE_CHECK_HASHES and set the patch directory.

Signed-off-by: Lukasz Tekieli <tekieli.lukasz@gmail.com>
---
 board/visionfive2/patches/linux-headers/linux-headers.hash | 1 +
 board/visionfive2/patches/linux/linux.hash                 | 2 ++
 board/visionfive2/patches/opensbi/opensbi.hash             | 2 ++
 board/visionfive2/patches/uboot/uboot.hash                 | 2 ++
 configs/visionfive2_defconfig                              | 2 ++
 5 files changed, 9 insertions(+)
 create mode 120000 board/visionfive2/patches/linux-headers/linux-headers.hash
 create mode 100644 board/visionfive2/patches/linux/linux.hash
 create mode 100644 board/visionfive2/patches/opensbi/opensbi.hash
 create mode 100644 board/visionfive2/patches/uboot/uboot.hash

diff --git a/board/visionfive2/patches/linux-headers/linux-headers.hash b/board/visionfive2/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/visionfive2/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/visionfive2/patches/linux/linux.hash b/board/visionfive2/patches/linux/linux.hash
new file mode 100644
index 0000000000..ccad8068dd
--- /dev/null
+++ b/board/visionfive2/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  9ac322d85bcf98a04667d929f5c2666b15bd58c6c2d68dd512c72acbced07d04  linux-6.8.2.tar.xz
diff --git a/board/visionfive2/patches/opensbi/opensbi.hash b/board/visionfive2/patches/opensbi/opensbi.hash
new file mode 100644
index 0000000000..bc4058abe6
--- /dev/null
+++ b/board/visionfive2/patches/opensbi/opensbi.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  319b62a4186fbce9b81a0c5f0ec9f003a10c808397a72138bc9745d9b87b1eb1  opensbi-1.4.tar.gz
diff --git a/board/visionfive2/patches/uboot/uboot.hash b/board/visionfive2/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..97a2b4eaf9
--- /dev/null
+++ b/board/visionfive2/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  18a853fe39fad7ad03a90cc2d4275aeaed6da69735defac3492b80508843dd4a  u-boot-2024.04.tar.bz2
diff --git a/configs/visionfive2_defconfig b/configs/visionfive2_defconfig
index 69c44dfbdd..bb8ab082af 100644
--- a/configs/visionfive2_defconfig
+++ b/configs/visionfive2_defconfig
@@ -1,4 +1,6 @@
 BR2_riscv=y
+BR2_GLOBAL_PATCH_DIR="board/visionfive2/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_OVERLAY="board/visionfive2/overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/visionfive2/post-image.sh"
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
