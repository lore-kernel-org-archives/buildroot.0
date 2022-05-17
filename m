Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE94C433EF
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 22:58:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69D258329A;
	Tue, 17 May 2022 22:58:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MwQsomamldie; Tue, 17 May 2022 22:58:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D2FF831B0;
	Tue, 17 May 2022 22:58:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 19AB01BF4E7
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 22:58:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F2E440199
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 22:58:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LkPo1B8Q4KK0 for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 22:58:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 21645400D8
 for <buildroot@buildroot.org>; Tue, 17 May 2022 22:58:32 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id e3so445926ios.6
 for <buildroot@buildroot.org>; Tue, 17 May 2022 15:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wam4ANllydYlxPOZiyS1r6Nxm7VP3LRPJzt/ejFxRYc=;
 b=CtI0MfyPNI8xTepAsnZh0vTu6LSDZ2CWz0F4mIbI5njIGbEEIRIxM6OspvXT7aoG4+
 nOE39iMOnt6BYIHSXw/wD0wumCodoJsusChScbuZGCtjXEln9KewI7S7TZTxkXZimBMj
 6I9QM2ygeS4l0VAVisOA3XBkexdjP4pT8kxwAyWMSHXP2Y70y40vMvE6mm4oK02ymObA
 uIurilcWDgzrmNMl+acmI1bAUNy/D0WS1KVuov9d39lIPC6j3jktOWQ/R8/5oqZI2hgf
 QLfLlpnkGYGSQ0liFdSE0IsFEySNjj6VGPNgIbMRQAd7f+qqYBF/RfVx0n0W5fuC2CCh
 xOAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wam4ANllydYlxPOZiyS1r6Nxm7VP3LRPJzt/ejFxRYc=;
 b=WUV2yVZUiDzKQhXqAusCVGw4CUG6FBH/bwnG/7QanTuef3ix2XwowV8UjRwgItzhgQ
 hDfARSJDl+WdFbGgntT+9OW/JERMx9WMDT74hLp3Ksl6/ZR88dNWeZW5daJa1oC/W7/1
 rApvLPkRM5LS0gRLYym3WE1VotPDWUFI/NDJ9ZSIlwBTcKW3YiSR8GP6nqe/K+xZIYrz
 sLlSRZr6Uftm8Ns4VgCDSFWDdU9BjPOB6/0i6YBRvzmiHibHQgg3EJSL7uHtkxz5Ch0k
 XVU8HIseQqVjwcmBCeD4T5vi5shntUioCGXH+Jf79hjOOF4RyT89dpcwh/12ZxB2O29g
 yiNg==
X-Gm-Message-State: AOAM533vQ6pLKobQmruUEIJyYc1OGKfGPSnPCfPvYqYDiBlnCruY2dyP
 r6QjTMdR0AymS91sdxKaIofBmTiAOkA=
X-Google-Smtp-Source: ABdhPJw6PnEZMFN0ZwlHz4x0VlcQ7pIxmeonV8rm6+bt4jaqoN4WfT0xRW6ekncQi0Qr6RJxwGYplg==
X-Received: by 2002:a05:6638:468e:b0:32b:fe5f:d73f with SMTP id
 bq14-20020a056638468e00b0032bfe5fd73fmr13501593jab.234.1652828312007; 
 Tue, 17 May 2022 15:58:32 -0700 (PDT)
Received: from james-x399.localdomain (97-118-134-20.hlrn.qwest.net.
 [97.118.134.20]) by smtp.gmail.com with ESMTPSA id
 p8-20020a056e0206c800b002d10e4611e5sm133752ils.86.2022.05.17.15.58.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 15:58:31 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 May 2022 16:58:21 -0600
Message-Id: <20220517225821.1572443-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] utils/genrandconfig: add ARM trusted
 firmware fixup
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
boot/arm-trusted-firmware/arm-trusted-firmware.mk:200: *** No repository specified. Please check BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL.  Stop.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 utils/genrandconfig | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 60ef8739cc..cf43778183 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -426,6 +426,27 @@ def fixup_config(sysinfo, configfile):
         configlines.remove('BR2_KERNEL_HEADERS_CUSTOM_TARBALL=y\n')
         configlines.remove('BR2_KERNEL_HEADERS_CUSTOM_TARBALL_LOCATION=""\n')
 
+    if 'BR2_TARGET_ARM_TRUSTED_FIRMWARE=y\n' in configlines and \
+       'BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y\n' in configlines and \
+       'BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE=""\n' in configlines:
+        configlines.remove('BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y\n')
+        configlines.append('BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION=y\n')
+        configlines.remove('BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE=""\n')
+
+    if 'BR2_TARGET_ARM_TRUSTED_FIRMWARE=y\n' in configlines and \
+       'BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y\n' in configlines and \
+       'BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION=""\n' in configlines:
+        configlines.remove('BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y\n')
+        configlines.append('BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION=y\n')
+        configlines.remove('BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION=""\n')
+
+    if 'BR2_TARGET_ARM_TRUSTED_FIRMWARE=y\n' in configlines and \
+       'BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y\n' in configlines and \
+       'BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL=""\n' in configlines:
+        configlines.remove('BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y\n')
+        configlines.append('BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION=y\n')
+        configlines.remove('BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL=""\n')
+
     if 'BR2_TARGET_AT91BOOTSTRAP3=y\n' in configlines and \
        'BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG=""\n' in configlines:
         configlines.remove('BR2_TARGET_AT91BOOTSTRAP3=y\n')
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
