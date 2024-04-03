Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B68BCD1288
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 19:54:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09391417C7;
	Wed,  3 Apr 2024 19:54:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G74PBhhqowbP; Wed,  3 Apr 2024 19:54:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D3C9418CB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D3C9418CB;
	Wed,  3 Apr 2024 19:54:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4A1C11BF982
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:54:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83B77607E7
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:54:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bTxgAPQgh9-H for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 19:54:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 13EB36073E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13EB36073E
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 13EB36073E
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 19:54:08 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3436ffd65ebso113955f8f.0
 for <buildroot@buildroot.org>; Wed, 03 Apr 2024 12:54:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712174047; x=1712778847;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q3pj0TS3tsISaeTe0sEYU+cSRM8GHhE4IMrZv4c0ot4=;
 b=Eh8GqQMDYBjdjEZ8NsprfNfBCkmdc+DwRk5Y7cna3oQgHB3/aoC3k+US4B38YupyoU
 GmZfZsFSe0VOnDi2QRGa/YlgtWGCVyC2fS8DCoaWGnAo3E6lPulJY4iFoPlskOW2prZv
 glBVOyZSOGSSZhtBSGfcFut0aYz10qI9EPR3adFT7DBUo+d+Xzo6MS3IL+1udaEe49jE
 laqkoD7HFEDgiuDPk9oteHFiQ2OzAY5d2q+3jwZKHbiVlbGKqWeIClkrhtNeIES9GH8Z
 mFkp17NCbVP2EcmndpN+dxOwuLCczZ2DQtDIFf6vbLveiWuCD7qYh+ODZtqhpC9LzKXu
 HknQ==
X-Gm-Message-State: AOJu0Yx058kl2vCT1Wv+aRr+yuW0jJzAjbhv8oid0Cl8+sZIAEpZIs6Z
 M63eH/VWSEHYcor7bbqAfEeD42/kcdSwO5gVC9gvjSh9EB2aqGXqbJlth1Mdv1hiwASzbW2RXmp
 T
X-Google-Smtp-Source: AGHT+IGHRX8ZQ/YtiFAcUX0dC5dyUkW85Y5Piu+il5ZWWQJbV8bXbFjIVmBUo/VmFXu4m/70ndc7Cg==
X-Received: by 2002:a5d:5152:0:b0:343:9230:e079 with SMTP id
 u18-20020a5d5152000000b003439230e079mr304125wrt.71.1712174046806; 
 Wed, 03 Apr 2024 12:54:06 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 cc13-20020a5d5c0d000000b00341b8edbe8csm15595571wrb.87.2024.04.03.12.54.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 12:54:06 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed,  3 Apr 2024 21:53:35 +0200
Message-ID: <20240403195403.1359007-2-romain.naour@smile.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240403195403.1359007-1-romain.naour@smile.fr>
References: <20240403195403.1359007-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1712174047; x=1712778847;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q3pj0TS3tsISaeTe0sEYU+cSRM8GHhE4IMrZv4c0ot4=;
 b=lzwWLsP0DSqhCERODcr7c47SJXTpCN5uKFWk05IBYR6mvgGo9Hf+mcBdDKPinwHp1Y
 RQ8/lleTo9UjQ+TB5EXZTom0cZBXHkiVq0cqjbqtv4SiU+/MTp6XvjqYoCxYgwpOxElU
 bsTd+kqPTL3DKdhIpBnajHOm5kYPU7ij5uVMv/HlCMXSp0rlaMft9u0zMQqK8RCYZLr5
 zObtN8XYOugQKO26uTqN3teSHuntS3wUcSQKm0CjzwhZjFMZ0lN17Lizp7FItxQ/oQkG
 P1S5dzC8Jsv6oXdFitTo1MeW67sZ1qQ3mPYDj9BKz1z5rqtJ11ceoXgxTGynBscfoZ+4
 1NkA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=lzwWLsP0
Subject: [Buildroot] [PATCH v11 01/17] boot/ti-k3-r5-loader: drop hash for
 version 2022.10
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
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 "Yann E . Morin" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Dario Binacchi <dario.binacchi@amarulasolutions.com>

The patch removes the hash for version 2022.10 of ti-k3-r5-loader
(i. e. U-Boot), still allowing the ti_am6{2,4]x_sk_defconfig configurations
to properly validate the downloaded package with the appropriate hash.

Link: https://patchwork.ozlabs.org/project/buildroot/patch/20240304153253.732708-6-dario.binacchi@amarulasolutions.com
Suggested-by: Yann E. Morin <yann.morin.1998@free.fr>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
Added in v10
---
 board/ti/am62x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash | 2 ++
 board/ti/am64x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash | 2 ++
 boot/ti-k3-r5-loader/ti-k3-r5-loader.hash                      | 1 -
 configs/ti_am62x_sk_defconfig                                  | 1 +
 configs/ti_am64x_sk_defconfig                                  | 1 +
 5 files changed, 6 insertions(+), 1 deletion(-)
 create mode 100644 board/ti/am62x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
 create mode 100644 board/ti/am64x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash

diff --git a/board/ti/am62x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash b/board/ti/am62x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
new file mode 100644
index 0000000000..2a5c99c459
--- /dev/null
+++ b/board/ti/am62x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  50b4482a505bc281ba8470c399a3c26e145e29b23500bc35c50debd7fa46bdf8  u-boot-2022.10.tar.bz2
diff --git a/board/ti/am64x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash b/board/ti/am64x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
new file mode 100644
index 0000000000..2a5c99c459
--- /dev/null
+++ b/board/ti/am64x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  50b4482a505bc281ba8470c399a3c26e145e29b23500bc35c50debd7fa46bdf8  u-boot-2022.10.tar.bz2
diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.hash b/boot/ti-k3-r5-loader/ti-k3-r5-loader.hash
index 279cb7763a..fbe5d21540 100644
--- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.hash
+++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.hash
@@ -1,4 +1,3 @@
 # Locally computed:
-sha256  50b4482a505bc281ba8470c399a3c26e145e29b23500bc35c50debd7fa46bdf8  u-boot-2022.10.tar.bz2
 sha256  b99611f1ed237bf3541bdc8434b68c96a6e05967061f992443cb30aabebef5b3  u-boot-2024.01.tar.bz2
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Licenses/gpl-2.0.txt
diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index a129e216d2..37df7a93f7 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -1,5 +1,6 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_4=y
+BR2_GLOBAL_PATCH_DIR="board/ti/am62x-sk/patches"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/ti/am62x-sk/genimage.cfg"
 BR2_LINUX_KERNEL=y
diff --git a/configs/ti_am64x_sk_defconfig b/configs/ti_am64x_sk_defconfig
index 26195194c7..1ebdec68ac 100644
--- a/configs/ti_am64x_sk_defconfig
+++ b/configs/ti_am64x_sk_defconfig
@@ -1,5 +1,6 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_4=y
+BR2_GLOBAL_PATCH_DIR="board/ti/am64x-sk/patches"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/ti/am64x-sk/genimage.cfg"
 BR2_LINUX_KERNEL=y
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
