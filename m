Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E43A6CD1288
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 19:55:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B393F41999;
	Wed,  3 Apr 2024 19:55:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wu8P9gOe3jDI; Wed,  3 Apr 2024 19:55:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 651FD41989
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 651FD41989;
	Wed,  3 Apr 2024 19:55:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5EA181BF4D5
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:54:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF5B46080B
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:54:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FMS80qyRRYcf for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 19:54:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BB6046079A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB6046079A
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BB6046079A
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 19:54:14 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-41628d9c907so705985e9.0
 for <buildroot@buildroot.org>; Wed, 03 Apr 2024 12:54:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712174053; x=1712778853;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yAuSAY3CxW/MGO9Ot7OeLHyKyvr1PZgeeBvraSRotUg=;
 b=VhLszJzcsZugEpiKM9RHObXZ1OktG5QfMddaNaPj+ZDrqHDNUMkvePhUboBtcDmbcz
 6wNJ+ag4Lfh62OIEt1qO7qAOjJeEDdYPQYQ4Vvesbr5b0golDtMj1f5W9bU6Lcd1iyC6
 MUlw8EFAxw8uFOdxc9/5zmrJ0tvLr9eInXV9Aaeyg3Bh/4OupECR/2FbCMeDE/MsyooN
 S4euUYjk7/icE2sxWpTSDv/T3ULOZpveE3LgYKMWFaFhO+IMaLNVUE6nqGTsqOCQVxUY
 VJfmXkz7zLXacSboM2SWXzghWuIXCnfXGffpP5h03HM5242TlzBzp+IygHE8B2HUUsa+
 +sUw==
X-Gm-Message-State: AOJu0Yyyx1Xjb5V/idIq1qLi14iqQLGUMigNkEIor+SzsjA3TtXEtL+D
 XDHbai1uQNgoxTNh1fWtDkQT1GseJkQQk7IKgVQbfyn7MDxtdIg/UYat5EnYT6gjuZdIv3tf4ac
 J
X-Google-Smtp-Source: AGHT+IHt0Y+RSp5m6/+tTCvQDmQdWGNCEW9yyc0E8JPdf6spstidXH6gzd1sPS0kY2D72sXVuH6crA==
X-Received: by 2002:a05:600c:4d1e:b0:414:8c0d:8e53 with SMTP id
 u30-20020a05600c4d1e00b004148c0d8e53mr479304wmp.8.1712174052937; 
 Wed, 03 Apr 2024 12:54:12 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 cc13-20020a5d5c0d000000b00341b8edbe8csm15595571wrb.87.2024.04.03.12.54.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 12:54:12 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed,  3 Apr 2024 21:53:45 +0200
Message-ID: <20240403195403.1359007-12-romain.naour@smile.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240403195403.1359007-1-romain.naour@smile.fr>
References: <20240403195403.1359007-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1712174053; x=1712778853;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yAuSAY3CxW/MGO9Ot7OeLHyKyvr1PZgeeBvraSRotUg=;
 b=W4lKfwVX+IpcLtyvp5DfiuF9MTn7MvnX53bPgCK0+uiplvUKNrIWAJBYEjk/4KDz9l
 Ot4fecP5IlDDiJ0SmyX9nUdpvXO7tCcTizx0G+TBL2vYXQPMhg4cUhC1C9hKNyvacTQz
 7CMadxr9unaV2sL6nH2zNaTqMO/EgE/Y64XRtyTaC9eQovVaK2SeqhZ8y71ZOTNoP/nL
 69YbYbE4mwiqyTjZxVED9gmNSljsbfljJe82iIuThlo1UWMpT0OJilBxYN9Dfx+vq4wL
 UkpMUXCM9Y7urmShBl5hgOKJm5L0IkD6Ea/l44VQbMQdu/YEGMLVvxqar3SogHKEhTzg
 WiCw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=W4lKfwVX
Subject: [Buildroot] [PATCH v11 11/17] board/ti/am62x-sk: move post-build.sh
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
index df7733f526..a1110597b3 100644
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
