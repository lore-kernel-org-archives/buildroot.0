Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF43CD128A
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 19:54:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17538418C2;
	Wed,  3 Apr 2024 19:54:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pePhroQGJXpi; Wed,  3 Apr 2024 19:54:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7BD84192F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7BD84192F;
	Wed,  3 Apr 2024 19:54:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 083771BF983
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:54:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D5E78418A6
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:54:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S9I9DLWY6hYM for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 19:54:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0C391418BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C391418BA
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0C391418BA
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 19:54:15 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-341c7c8adf3so146033f8f.0
 for <buildroot@buildroot.org>; Wed, 03 Apr 2024 12:54:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712174054; x=1712778854;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/jYRhXnFpFaB/rl049Q8i/jgARbOYSdLre0by+1QH+4=;
 b=ud7W4VupAKhd9saUmVwSwC13W69KU81bkxbhN8eXp5mzePo/VfSL4W+qfwfCJWPRYi
 RCDZFyFApeggFYx/DsR27XDayiQ2HmsuexlxaelYGHHwGd7ntA+B/yxsgUEySeCNkBro
 GyZqxochf0DqtHR/OJDih9FjtskYV8RWo6oIXppTtuHWY8tn08B9vNPxhKBp0vlrqsS2
 g5/xS4g/YXhZBTIIbZ0PRs2l5h76k/tmTetsHc5aj6yDC4Oe9D+EHChQ3tus1hMSS3/P
 fjMyYBdZ/P8JnxV2/Uxroc+0bQXFkzz+cNN3G6dUYxJg5EidaAgv64y2yao32J49M6XI
 s0sA==
X-Gm-Message-State: AOJu0Ywm8jSguyH6BkG9dpg6o3mOOvSShf/kM8p3mSz2CjwMfUP4qPNy
 1fGhDPdGYDM0iFOp/lPnAgWj0Luh9+iBGhWFoWYzM5YG4LxuZzijgSryP5yjLwnT3mh2OCX0u1V
 G
X-Google-Smtp-Source: AGHT+IEWS+fiZty0oOPaMqd+c6c4ajsAFchdWiBnw80cynbmNpXGRfJxWD6YskHfJ9CKe4gkNg9zZw==
X-Received: by 2002:adf:a35d:0:b0:343:a21c:467a with SMTP id
 d29-20020adfa35d000000b00343a21c467amr361744wrb.7.1712174054114; 
 Wed, 03 Apr 2024 12:54:14 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 cc13-20020a5d5c0d000000b00341b8edbe8csm15595571wrb.87.2024.04.03.12.54.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 12:54:13 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed,  3 Apr 2024 21:53:47 +0200
Message-ID: <20240403195403.1359007-14-romain.naour@smile.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240403195403.1359007-1-romain.naour@smile.fr>
References: <20240403195403.1359007-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1712174054; x=1712778854;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/jYRhXnFpFaB/rl049Q8i/jgARbOYSdLre0by+1QH+4=;
 b=QDXxEsvjkr5Lp2neBsmLaGICG44IzhZUFbNFOUizruhlYs3YX4EurF9GfprxBD4EQv
 KMlsFLqM4OxacOQkHQsxmBbLgO3OR7sAxzy6qM0s38wtiLGjN2bCujiVVejcoiokJh+6
 MIl3r+tlHlmL4ssQmK/AJDcaklmYo+im9TE/87kcHdnx+jGvSx7ku7qXb0s4SM+GunM6
 pvHxrgGJHD0SC/4JhP1/cbqClZuiqpdK2jOZfhMNXonqB4rkXXGUvttOLQzTUdrmabaS
 49+OMqFFW8Y+4NnY1Mjc5BZhuCAt05y5UzsKvB9h/hVSqh6eoIZtB5E3eTXB5rBhBx8K
 iWkg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=QDXxEsvj
Subject: [Buildroot] [PATCH v11 13/17] configs/ti_am64x_sk_defconfig: bump
 Linux version to 6.6.18
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
Cc: Romain Naour <romain.naour@smile.fr>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
Changes in v11:
- add BR2_DOWNLOAD_FORCE_CHECK_HASHES=y

Added in v8
---
 board/ti/am64x-sk/patches/linux-headers/linux-headers.hash | 1 +
 board/ti/am64x-sk/patches/linux/linux.hash                 | 2 ++
 configs/ti_am64x_sk_defconfig                              | 5 +++--
 3 files changed, 6 insertions(+), 2 deletions(-)
 create mode 120000 board/ti/am64x-sk/patches/linux-headers/linux-headers.hash
 create mode 100644 board/ti/am64x-sk/patches/linux/linux.hash

diff --git a/board/ti/am64x-sk/patches/linux-headers/linux-headers.hash b/board/ti/am64x-sk/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/ti/am64x-sk/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/ti/am64x-sk/patches/linux/linux.hash b/board/ti/am64x-sk/patches/linux/linux.hash
new file mode 100644
index 0000000000..cedae67f33
--- /dev/null
+++ b/board/ti/am64x-sk/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  4e43d8c5fba14f7c82597838011648056487b7550fd83276ad534559e8499b1d  linux-6.6.18.tar.xz
diff --git a/configs/ti_am64x_sk_defconfig b/configs/ti_am64x_sk_defconfig
index 9a2faa5c6d..8a3de181d4 100644
--- a/configs/ti_am64x_sk_defconfig
+++ b/configs/ti_am64x_sk_defconfig
@@ -1,13 +1,14 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_4=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_GLOBAL_PATCH_DIR="board/ti/am64x-sk/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/ti/common/am6xx/post-build.sh"
 BR2_ROOTFS_POST_BUILD_SCRIPT_ARGS="-c ttyS2,115200n8 -d k3-am642-sk.dtb -l am64x-sk-buildroot -r /dev/mmcblk1p2 -x earlycon=ns16550a,mmio32,0x02800000"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS="-c board/ti/am64x-sk/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.4.16"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am642-sk"
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
