Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 774DCCD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 10:35:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47CDE415DB;
	Sun,  7 Apr 2024 10:35:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eZ6AjVNmjg1X; Sun,  7 Apr 2024 10:35:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEAC441B18
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEAC441B18;
	Sun,  7 Apr 2024 10:35:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4AEFA1BF94D
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 10:35:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 38F0A822B2
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 10:35:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SfWyzDYultnL for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 10:35:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7A94A822AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A94A822AF
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7A94A822AF
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 10:35:22 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-41650ee55faso3417605e9.1
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 03:35:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712486120; x=1713090920;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p9Q7XS1pC/pj2BDMnSN1LtfbEI65hfKhUVPlY0jTfqo=;
 b=wx4f5KIWf2bx49Hi5xFGAR1J9ivgehTcFdJzZq4FULyBWdxrr0MMxeJCOgdH0VQjHF
 zNGduE3/pxb5nAy2qY73rMwZYY0vKSSo2k5HtkhadgcbVRshDr8hi02jXp1R85Vte5QB
 Szfphd1zfxlsim2Ssjqo3BFH/eYouo8v0WWQiq8FVW2KGRkw/+ETxTzpd6aobjufZKgU
 mvkFErTd8bhbipLXSonQQZzzmR7FHI4Hkxa6ZfCulbMi/xYiA0EOWb6eALaCBgWpmLtf
 okf4/WYMFZHhHAJvHL4PhdrCS5n576eHEzNWPNnkUH1ZxEAFiIna82zgGTEG4CncDw/t
 ZgBw==
X-Gm-Message-State: AOJu0YzkYf5TM3kotYEQMnU6i054TA+U677WeZJNNWI+tslZfD+Yt5+S
 dah9pc11E1lfMz8eelKdbyhish2TQKus40nQyQNFaUFLWU98waaHRvTrv4ka5mNUl7OtgSYHRuN
 1
X-Google-Smtp-Source: AGHT+IFJXgV+kZixZIJ5Kfkf74/klNcNYBaV/qfO8wQj8OKs1sfNJ9nTDjIBi3Qd1KuVc1t5yQsWpw==
X-Received: by 2002:a05:600c:1382:b0:413:ff06:83cd with SMTP id
 u2-20020a05600c138200b00413ff0683cdmr4358485wmf.3.1712486120696; 
 Sun, 07 Apr 2024 03:35:20 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 je4-20020a05600c1f8400b004149536479esm9486542wmb.12.2024.04.07.03.35.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 03:35:20 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 12:35:03 +0200
Message-ID: <20240407103512.1112712-11-romain.naour@smile.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240407103512.1112712-1-romain.naour@smile.fr>
References: <20240407103512.1112712-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1712486120; x=1713090920;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p9Q7XS1pC/pj2BDMnSN1LtfbEI65hfKhUVPlY0jTfqo=;
 b=uGS4AlgV8suxk7v+d2rNOk6XpQBunMyqtMeoz50K22LliObgN4b2/KRITMkQe5Wibc
 w+EcuclLkmjoUPSYnNDGXI+uLmCh852pq7Kt7E78fjd6j/hnRQQAjW7eUkjBilL3u7Qw
 4dI3fma22AGwJak7ayIMN67J1fIlRlGKYGxVl5kFHe8Q0il7vGqU9hVgRVh8X+GFqgMI
 ionMp1DRLvUF2cygcQrIhk3+SBWVa/5XI/kI0Z2LJja7Mv/AU6Cu5yfk7PI6l4S3ife5
 fPXRg1yACDowpJyzilRMQnv1GWz276yn80QcMfsT77YhcaZsXzDlt4NjFeBsOS1PnCAg
 Lctg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=uGS4AlgV
Subject: [Buildroot] [PATCH v12 10/16] board/ti/am62x-sk: move post-build.sh
 to board/ti/common/am6xx
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

The patch makes it clear that the moved script can be used by the
am6{2,4}x platforms.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
Changes in v11:
- Remove board/ti/common/am6xx/post-image.sh since we use
  BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS option instead.

Added in v8
---
 board/ti/{am62x-sk => common/am6xx}/post-build.sh | 0
 configs/ti_am62x_sk_defconfig                     | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename board/ti/{am62x-sk => common/am6xx}/post-build.sh (100%)

diff --git a/board/ti/am62x-sk/post-build.sh b/board/ti/common/am6xx/post-build.sh
similarity index 100%
rename from board/ti/am62x-sk/post-build.sh
rename to board/ti/common/am6xx/post-build.sh
diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index 1c7085d04d..b62f624d82 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -2,7 +2,7 @@ BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_GLOBAL_PATCH_DIR="board/ti/am62x-sk/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/ti/am62x-sk/post-build.sh"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/ti/common/am6xx/post-build.sh"
 BR2_ROOTFS_POST_BUILD_SCRIPT_ARGS="-c ttyS2,115200n8 -d k3-am625-sk.dtb -l am62x-sk-buildroot -r /dev/mmcblk1p2 -x earlycon=ns16550a,mmio32,0x02800000"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS="-c board/ti/am62x-sk/genimage.cfg"
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
