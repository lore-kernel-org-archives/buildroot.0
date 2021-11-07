Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD55EC433EF
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 19:29:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21CDE61215
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 19:29:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 21CDE61215
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C968460744;
	Sun,  7 Nov 2021 19:29:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7Dv_CuC2OzJZ; Sun,  7 Nov 2021 19:29:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E638F6072D;
	Sun,  7 Nov 2021 19:29:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0E3FD1BF328
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 19:29:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F2B2D80BF3
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 19:29:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bLgNvkxY338I for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 19:29:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0332380BBC
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 19:29:38 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 d72-20020a1c1d4b000000b00331140f3dc8so10213711wmd.1
 for <buildroot@buildroot.org>; Sun, 07 Nov 2021 11:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Qf/smqxSWKrklYX7X5GA8QFmh2tE2bBZf1w71cwnPEk=;
 b=gIQOHv/cydUuw9jsR6ZTfwvkwGyacZybSBQrsZQoHnGvUW4/j4o6dSuDf4pe3cVlVi
 1KOfk9gOPsiLrjTQ4SgnPVqbJquggND9A3VDsri0NZqsiV1GP7hW3JHvovw/NSNSxb9f
 upd4BKeNe2/5KAN500PvAzCq4WOZy2oRZj34VMNJkmLlYaWPI/6oRvvu6ssWqIJQMFyD
 7Uln6FrjXQxoWCZt4xlVPeuyGASTXJhLZc4CVTrW0608K9ggpnQP/SvoJdmVGiUnVor2
 SKCpo7F2+lxT/0JkhCbaWubr7St95HMQb8MsbbCkkjCc01EE1XSR9gm1ywd7AsSeZwLm
 H2xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Qf/smqxSWKrklYX7X5GA8QFmh2tE2bBZf1w71cwnPEk=;
 b=IlkprP5p9JIX9XmXFzCd8YBos6LnoqMGpRxDyXQ859QOcs76MBUqHf8m+lqRwHnlwj
 D09pWpoINr2ZtnNQjacO2ngvabDx03v+WafuscS32dNhEsDuR253W0FO1zQ9jHvnigHC
 U/nZtZE6vowloasHI83Nko/g25QexNuBjoGLByIwTA0kAjvk0CZdjI9Ux/qMroDr/Wz6
 UouIQ1FtdNMONmzDIals/f/j+9HOdqcEelynNEegHFa4WjtyiCKAti6bZhmW90pEdd/G
 I2ikwCeGtztgFOIivzClT12QGSMHWq8XysKOUO7M+xR4WCUDZIW3xU2hz1v8rnVVCDmR
 H+gA==
X-Gm-Message-State: AOAM530RrlEKOcrU/cRvUp8Np9mdAUdOk0zNKQQtZ842TJ5KldcseQWH
 ch7seFGTyrFeU6Zf0a8hiy2Ky5yYkIQ=
X-Google-Smtp-Source: ABdhPJzrzi2BqJPqrJhIznWmYuvXH+gJuIKsfN87YpOxMQDaklGtZSQic0BsMx26XhLMoHzCJTU/hg==
X-Received: by 2002:a7b:c764:: with SMTP id x4mr48473733wmk.78.1636313377176; 
 Sun, 07 Nov 2021 11:29:37 -0800 (PST)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id r15sm15017405wru.9.2021.11.07.11.29.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 11:29:36 -0800 (PST)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 20:29:30 +0100
Message-Id: <20211107192930.370979-2-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211107192930.370979-1-romain.naour@gmail.com>
References: <20211107192930.370979-1-romain.naour@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] configs/qemu_aarch64_sbsa_defconfig: add
 gitlab runtime testing tag
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Enable the runtime testing by adding the tag in the readme.txt

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Dick Olsson <hi@senzilla.io>
---
The gitlab job needs more that 3h to build and execute the test:
https://gitlab.com/kubu93/buildroot/-/jobs/1755899154
Tested locally using the Buildroot docker image.

I'm not sure about the comment about SeaBIOS package, the test works
fine with the current host-qemu (6.1.0).
---
 board/qemu/aarch64-sbsa/readme.txt  | 2 +-
 configs/qemu_aarch64_sbsa_defconfig | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/board/qemu/aarch64-sbsa/readme.txt b/board/qemu/aarch64-sbsa/readme.txt
index b62947f55f..cf5f66d4d6 100644
--- a/board/qemu/aarch64-sbsa/readme.txt
+++ b/board/qemu/aarch64-sbsa/readme.txt
@@ -23,7 +23,7 @@ Run the emulation with:
     -nographic \
     -pflash output/images/SBSA_FLASH0.fd \
     -pflash output/images/SBSA_FLASH1.fd \
-    -hda output/images/disk.img
+    -hda output/images/disk.img # qemu_aarch64_sbsa_defconfig
 
 Note that if you want to run sbsa-ref emulation with QEMU provided by
 your distro (i.e., not host-qemu by Buildroot) then you may need to
diff --git a/configs/qemu_aarch64_sbsa_defconfig b/configs/qemu_aarch64_sbsa_defconfig
index d1e0adadd1..e7d3bd03ca 100644
--- a/configs/qemu_aarch64_sbsa_defconfig
+++ b/configs/qemu_aarch64_sbsa_defconfig
@@ -16,8 +16,8 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
 
 # Image
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/aarch64-sbsa/assemble-flash-images support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/qemu/aarch64-sbsa/genimage.cfg"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh board/qemu/aarch64-sbsa/assemble-flash-images support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG) -c board/qemu/aarch64-sbsa/genimage.cfg"
 
 # Linux headers same as kernel
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
