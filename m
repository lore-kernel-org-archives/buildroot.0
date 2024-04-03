Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66932CD1288
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 19:54:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 360934188C;
	Wed,  3 Apr 2024 19:54:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rvkLIugCh9nj; Wed,  3 Apr 2024 19:54:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 404BE418F5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 404BE418F5;
	Wed,  3 Apr 2024 19:54:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9D9121BF4D5
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:54:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 90D45418B9
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:54:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pCz-QsbfAClh for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 19:54:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 88AF341880
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88AF341880
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 88AF341880
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 19:54:13 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-33ddd1624beso111785f8f.1
 for <buildroot@buildroot.org>; Wed, 03 Apr 2024 12:54:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712174051; x=1712778851;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gOIECONNUUZhs73wsoswej8xN2LvAigrdEFP4BKe250=;
 b=hK9w+jq7k03EKYouqc9jZJpUkq3ZuyJCEk1oF69/T4dDayX7kawqSLC1MOu2OOo1r6
 zQJyczODaAU1CU9ZkZCKde3OpoqeW4OuoEnBgscnERp/L6LqABMGWdmaSKROHNMgc67m
 fDeZ+NM7rTIHp4iyhgrIxGV4GPW6zSzezr1SyjBNaBrCcmv3/1gIgyjl+NLP5PpJOvlT
 BOgk1fdWhYFzsbYFsCXdOQ1WJXHqIg+w2wO+3G/z8rwvp8sNdnAZuEDCgWCfbiS7mB+Z
 ht97S777tx9gKZnohK6tiGLvNOhS6V42wzIsjgGm6oKRxOVhBckFgmt0YnoTBA2kauYF
 ifjA==
X-Gm-Message-State: AOJu0YzCyzNNbfpaOvEXThlV+brhpecMJFPfM/ctsPMnw6ZAHERibr5j
 Z51TxEbeETtSUkcWiEYu8tb6IAvKJQfedlAU7w8YyiE8g9jkWcmpU7On4KC7NO+TgDH3BvtGEgs
 /
X-Google-Smtp-Source: AGHT+IE5Z1tP3630gSomQ0htmmd67kpDALZij98kqE7YfjRXGGSWCnIRUayDO1E0JPNmM3GqvWrpPg==
X-Received: by 2002:a05:6000:14b:b0:33e:c0fc:5e4b with SMTP id
 r11-20020a056000014b00b0033ec0fc5e4bmr3264657wrx.2.1712174051396; 
 Wed, 03 Apr 2024 12:54:11 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 cc13-20020a5d5c0d000000b00341b8edbe8csm15595571wrb.87.2024.04.03.12.54.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 12:54:11 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed,  3 Apr 2024 21:53:43 +0200
Message-ID: <20240403195403.1359007-10-romain.naour@smile.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240403195403.1359007-1-romain.naour@smile.fr>
References: <20240403195403.1359007-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1712174051; x=1712778851;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gOIECONNUUZhs73wsoswej8xN2LvAigrdEFP4BKe250=;
 b=ewJl7dle7xMjs2RQV/B7aaZ1TEFb/vUeIIJEzqjaphDRBTXZrjfrmLI5oOksq16qyI
 gbgtKvH/7tIG7qIzNLxtutDsfO7qTylZXsQ9C5Zyszv+fCBgX9ezSjpJ+g4jRacl5xsw
 5pMRshIkp5ROYvdrZZJth8G4egQ9fiNIG2XfZNl6BmsqD9Eoydn/o6+zKx8KInGuckOf
 jVfZeYFnwWOmUXbRxsy16541ABsI6kJreANKS29lVxu5lNM3NMeBC+t8+hQVBjxNiJdO
 KyTCH+P9Kn1DXwpB/xPUFDlE4XcejWgrF0AL6EdSXi4+9yBZ732I7ptOoiRvGc9DBLkK
 eKdg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=ewJl7dle
Subject: [Buildroot] [PATCH v11 09/17] configs/ti_am62x_sk_defconfig: bump
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

Tested on SK-AM62B-P1.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
Changes in v11:
- Add BR2_DOWNLOAD_FORCE_CHECK_HASHES=y

Changes in v8
- Bump to 6.6.18 from 6.6.17
- Update commit message

Changes in v5
- Bump to 6.6.17 from 6.6.1
- Update commit message

Changes in v4
- Add BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6 to ti_am62x_sk_defconfig.

no changes since v1
---
 board/ti/am62x-sk/patches/linux-headers/linux-headers.hash | 1 +
 board/ti/am62x-sk/patches/linux/linux.hash                 | 2 ++
 configs/ti_am62x_sk_defconfig                              | 5 +++--
 3 files changed, 6 insertions(+), 2 deletions(-)
 create mode 120000 board/ti/am62x-sk/patches/linux-headers/linux-headers.hash
 create mode 100644 board/ti/am62x-sk/patches/linux/linux.hash

diff --git a/board/ti/am62x-sk/patches/linux-headers/linux-headers.hash b/board/ti/am62x-sk/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/ti/am62x-sk/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/ti/am62x-sk/patches/linux/linux.hash b/board/ti/am62x-sk/patches/linux/linux.hash
new file mode 100644
index 0000000000..cedae67f33
--- /dev/null
+++ b/board/ti/am62x-sk/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  4e43d8c5fba14f7c82597838011648056487b7550fd83276ad534559e8499b1d  linux-6.6.18.tar.xz
diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index d664935db5..68e414ee6e 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -1,13 +1,14 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_4=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_GLOBAL_PATCH_DIR="board/ti/am62x-sk/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/ti/am62x-sk/post-build.sh"
 BR2_ROOTFS_POST_BUILD_SCRIPT_ARGS="-c ttyS2,115200n8 -d k3-am625-sk.dtb -r /dev/mmcblk1p2 -x earlycon=ns16550a,mmio32,0x02800000"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS="-c board/ti/am62x-sk/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.4.16"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am625-sk"
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
