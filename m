Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A447C28B20
	for <buildroot@archiver.kernel.org>; Fri, 28 Mar 2025 18:04:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E90584DFA;
	Fri, 28 Mar 2025 18:04:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ygOoQL7nFf_C; Fri, 28 Mar 2025 18:04:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 876FE84A8B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 876FE84A8B;
	Fri, 28 Mar 2025 18:04:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B7D8A12A
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:04:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA0B9707C5
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:04:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ttXJtXty3UA for <buildroot@buildroot.org>;
 Fri, 28 Mar 2025 18:04:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E1C7370451
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1C7370451
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E1C7370451
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:04:36 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-39123ad8a9fso120227f8f.2
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 11:04:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743185074; x=1743789874;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NN3ZGS7w7MDoWI+j+rmBcWuuz1IuzeL/XCNmjwGanlo=;
 b=MU0+yJk1S8UEccHIIFgkZdOjS+D4Ook15xa/J7IMieZ6aNueymCP4l1pls74Ff/Wo6
 2QLFob4NBIfLq+F1SteH5/uw3z/Oy6J7aqbnqssRQQ/8r6lchJx3hYH5wt7GtUfmFnGC
 ilYvYfTRvEmvSrlQT6x2xP6jT9zECXvrH4c40M64hc3fl+ln4JwyxwjoqI9ch+SAY2Qn
 clPl6FYbkJ8+WZaoYBGK2f+KoDudpYSzMdyWJsiYuuWHE3J+jXmjjKcy/VqMaQISs8tn
 IGiletW2XFJGZuPcF7tvLEIzMxgs94LHtrRtkVz67QpOeCVM5fkXya4WLoX84xLkKl/Q
 2qdw==
X-Gm-Message-State: AOJu0YzkPgCyW+omn+7XgFcoI9pzVSkP/mBno2H5uy3bRv+rQmqXXM8M
 6eiGqM2lNCfLXwsN6gCvj2NDmZCOPa3RTkkvywHYuR/ue889KvveZReZ8WOQ
X-Gm-Gg: ASbGncsc1Ic2PJvqTCr02/oGDLzmU9x2YxrpmQVpy3IoXmOrw6dIVfkxbaZPxWGHvQE
 Cp/F/geSwBVYt7u9KTFmLv1cORhd9zZ2mR8jRGI21jdDsvgBR6TDyg/Y++2PjYldKSSqvFvcLW+
 vUHF2HnAnvlYpL4H2r/rbd/UgAuniMejGOzFOuIvAX6046nw0FUV7idHv5Zn2VwKlE11VrKY56D
 fBcnmoG++hkHJBnNjs+88Ch6ZhTxb17GPa3hBKZ+/C5cT4p/z4dXG16CnoPH7N5VAVt+HgE+H76
 3xNZAUVPx1jRdr5aEp7s2PXvlSyvXyOSwwKy0Q==
X-Google-Smtp-Source: AGHT+IEkVQ+5FENOqvR+SMDA0GOFFnkbKRokFY1zpVeVL4yCWuOcQNIZS8c7YtQlYar73ffZUiQcrA==
X-Received: by 2002:a05:600c:1d8f:b0:439:9a5a:d3bb with SMTP id
 5b1f17b1804b1-43db61d936emr2070905e9.2.1743185073833; 
 Fri, 28 Mar 2025 11:04:33 -0700 (PDT)
Received: from skbuf.lan ([188.25.110.61]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d90000f48sm34692995e9.37.2025.03.28.11.04.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Mar 2025 11:04:32 -0700 (PDT)
From: Vladimir Oltean <olteanv@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 28 Mar 2025 20:04:09 +0200
Message-ID: <20250328180427.3434693-2-olteanv@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250328180427.3434693-1-olteanv@gmail.com>
References: <20250328180427.3434693-1-olteanv@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743185074; x=1743789874; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NN3ZGS7w7MDoWI+j+rmBcWuuz1IuzeL/XCNmjwGanlo=;
 b=TdpZGhGs1gONmtiUCgwfZW1ohhnFMmNsgsm36MHuPsm2c/yaPz/AXx6hyteXlDjFTX
 GItTnJTOXLeqaaHxCs0gHISf80aPRdGpxunMBMQVDDs1Y4Ywg6g9LfqMjNWXBzgRN2sU
 YIL9ckpMbjTQ2tzTDGl+n3SibACnUiCTTwHTZsfBl2HXDwx3wgSWcyy6rEMUk1FBKiOp
 vv2WMsx3Xq6XIibuYxGBDdSG2nMXmDD3J2mL4k24EDD2YBpbMls3hrIqd41lFiTmMqeZ
 q9OdYfU/Jeu6qGs4GDey2zzf5cIAnpWM54c0d8bbB+VFUJKh60xfrtZev6lKk0avgWkx
 KyaA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=TdpZGhGs
Subject: [Buildroot] [PATCH v2 01/18] configs/ls1046a-frwy: enable the fmc
 package and dependencies
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Ioana Ciornei <ciorneiioana@gmail.com>,
 Brandon Maier <Brandon.Maier@collins.com>, Vincent Jardin <vjardin@free.fr>,
 Julien Olivain <ju.o@free.fr>, Romain Naour <romain.naour@smile.fr>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since LS1046A-FRWY uses the Linux Factory-supplied lsdk.config, it
disables the upstream DPAA1 kernel networking drivers and enables their
SDK counterparts. These SDK kernel drivers are configured using the fmc
tool to do basic things such as apply a default PCD, so it seems a
reasonable idea to enable this package by default.

Since fmc uses C++, we need to add the standard library for that, which
also seems to increase the rootfs size.

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
---
v1->v2: increase rootfs size

 configs/ls1046a-frwy_defconfig | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/configs/ls1046a-frwy_defconfig b/configs/ls1046a-frwy_defconfig
index 52d8f0cc07bb..a138234a1423 100644
--- a/configs/ls1046a-frwy_defconfig
+++ b/configs/ls1046a-frwy_defconfig
@@ -21,7 +21,7 @@ BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_PACKAGE_QORIQ_FM_UCODE=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
+BR2_TARGET_ROOTFS_EXT2_SIZE="200M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
@@ -41,3 +41,7 @@ BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_QORIQ_RCW=y
 BR2_PACKAGE_HOST_QORIQ_RCW_INTREE="ls1046afrwy/NN_NNQNNPNP_3040_0506/rcw_1600_sdboot.bin"
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_FMLIB_QORIQ_FAMILY_ARM=y
+BR2_PACKAGE_FMLIB=y
+BR2_PACKAGE_FMC=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
