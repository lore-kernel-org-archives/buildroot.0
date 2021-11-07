Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29049C433EF
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 19:29:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EB866120D
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 19:29:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6EB866120D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05C17606F9;
	Sun,  7 Nov 2021 19:29:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tvhmrl8PbaXR; Sun,  7 Nov 2021 19:29:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 673236069C;
	Sun,  7 Nov 2021 19:29:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 612531BF328
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 19:29:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C58B400D8
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 19:29:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3CURVGAiu7VO for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 19:29:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 23A084024E
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 19:29:38 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id r8so23089938wra.7
 for <buildroot@buildroot.org>; Sun, 07 Nov 2021 11:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FWE4lGSGaywCW1pmRaF1TOH2ipP7+su/Rn1FFMb2ZVU=;
 b=OVUVip954vkx0GBysVjyEl8jyB3IlL2n9k8d2H7hXyY/7EHtkJjimRsgmJOBGwRhf+
 iTT9Eo4xCizyaxxbjIHmJg4P+8+FnOGdQTKuihWGlA7Uaz9hYx4v1PVeX+bP7jOertSy
 W4o/tZtb0tsMjBpqa/PbU2K/6RylTUOqg10BzeZU12Qs1SBvcjGFg9PrD96+8hL8knxU
 EBJVg4mDNgljyOgCbUvCa+rFIyoKPjjH7kF4p5o5UqU/wK2lwKdoZgKajl1VHOGDsP+n
 lZoSLQELT20zTffNneinHLvxaSAT9EsJONjspEIbyqzFjXX1AqIxxc3sFNwBa6RT9vAK
 KkYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FWE4lGSGaywCW1pmRaF1TOH2ipP7+su/Rn1FFMb2ZVU=;
 b=gaxtiIpWXbe7R3szXeN4matyVJdfjgHorF6ZVTvvVMxzdTFXoMeHnnJPIxPRa2smp7
 jcAo10lWLt0pUKnDpUy6C4ZWJqg5rw1tXeYUOy/Ra/wcKgGA9xOWKkvavcwGz9lM7OIF
 patoQcwjISLpIO7asaIBoxFaGHck09zBoYdIDIAz9PLtKpBm+YX/BqSofp+3PbygxKxc
 mqXFdnlxE71+5fvZ8Tj3ffPnreDsxvgagdB7+bEFHzX2Z39wLNsrx0Y65ReYOnt7HyhP
 QO8IqMCMZhWZfIDYs4ew+R+CmDKOSYQpgaZKymevaIYO9AOXuJtgp2Xr1/Y1/gnnB2zL
 x11w==
X-Gm-Message-State: AOAM532DtqzZZV4EU8rBvOzC2kFwl0h5+5oL+tDZpgQplyutWeH4PdQz
 WQ4GGIAj4t8gNoPS8/K8V/qzGH9l7GM=
X-Google-Smtp-Source: ABdhPJzfRxSBQO7dJV8nqRNLFmypojJl9seurfYpszxqnLSo/5h6986Tm1Cg7xyaAV7Kdc0Qs+vXZw==
X-Received: by 2002:adf:efc6:: with SMTP id i6mr69443364wrp.428.1636313376228; 
 Sun, 07 Nov 2021 11:29:36 -0800 (PST)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id r15sm15017405wru.9.2021.11.07.11.29.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 11:29:35 -0800 (PST)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 20:29:29 +0100
Message-Id: <20211107192930.370979-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] configs/qemu_aarch64_sbsa_defconfig: use
 ARM cortex a57
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

When booting with cortex-a53, qemu refuse to start with the following message [1]:

  qemu-system-aarch64: sbsa-ref: CPU type other than the built-in cortex-a57 not supported

Use ARM cortex a57 as requested by Qemu.

[1] https://git.qemu.org/?p=qemu.git;a=commitdiff;h=64580903c2b3aee08d74d64e6248a313b246cb69

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Dick Olsson <hi@senzilla.io>
---
 board/qemu/aarch64-sbsa/readme.txt  | 2 +-
 configs/qemu_aarch64_sbsa_defconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/qemu/aarch64-sbsa/readme.txt b/board/qemu/aarch64-sbsa/readme.txt
index 7935108ef1..b62947f55f 100644
--- a/board/qemu/aarch64-sbsa/readme.txt
+++ b/board/qemu/aarch64-sbsa/readme.txt
@@ -17,7 +17,7 @@ Run the emulation with:
 
   qemu-system-aarch64 \
     -M sbsa-ref \
-    -cpu cortex-a53 \
+    -cpu cortex-a57 \
     -smp 4 \
     -m 1024 \
     -nographic \
diff --git a/configs/qemu_aarch64_sbsa_defconfig b/configs/qemu_aarch64_sbsa_defconfig
index 0e1c799b4d..d1e0adadd1 100644
--- a/configs/qemu_aarch64_sbsa_defconfig
+++ b/configs/qemu_aarch64_sbsa_defconfig
@@ -1,6 +1,6 @@
 # Architecture
 BR2_aarch64=y
-BR2_cortex_a53=y
+BR2_cortex_a57=y
 
 # Toolchain
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
