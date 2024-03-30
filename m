Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF4BBCD1288
	for <buildroot@archiver.kernel.org>; Sat, 30 Mar 2024 18:39:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9280840649;
	Sat, 30 Mar 2024 18:39:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kQLzGa2GLPR6; Sat, 30 Mar 2024 18:39:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AC264064B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4AC264064B;
	Sat, 30 Mar 2024 18:39:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C86BB1BF2F2
 for <buildroot@lists.busybox.net>; Sat, 30 Mar 2024 18:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B54FD606CE
 for <buildroot@lists.busybox.net>; Sat, 30 Mar 2024 18:39:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z6G1t5hRjX5n for <buildroot@lists.busybox.net>;
 Sat, 30 Mar 2024 18:39:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8887D60621
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8887D60621
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8887D60621
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 18:39:43 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-34175878e3cso2200478f8f.0
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 11:39:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711823981; x=1712428781;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X6kbZr4JHn8P1o4AKXuQXCxN78iPISQdLENCcXW+kDk=;
 b=WLjSfrHzLUZ1jJZP/oRrmdJcvgf52wgfoW7QF6y/BxLuKdHiELPEOsGlXfrX6GzuCQ
 5ONftKvnbmEHWych+dporTNiaelwPaGnRsrr2zcCGDZlV3F1hCdYoNKiIxOmByP4Tl6q
 R2hm/xy40YM3AjQOejjBVME+uHYiwPHejF0lPny0ltCDFbI09fn9ILQY7mn0O2MHUZpU
 CGBKP1ZXRkY2Mok4WeL1hJ3CzaBkq4KWg5V2YvWi06jRzzVlYDIy9x51QRb8jXsRqPUG
 3mEx7S9/UQV7+kyhUqz99NES2eaJqtYRWaJOzV3NM+MzUo3k8QbNH08ng5ywZdEn3vj6
 6jWA==
X-Gm-Message-State: AOJu0Yy9/DOEYRhl1WCnqcwR6z15YqjUxAnMXCHH5COL1qaWyvKajFFq
 fInEzb1FYDXuSOAx9hKxBJfMxG+u4j2Ox6R2cuieoUGcH+V7nQ0Sz6u4IKDo
X-Google-Smtp-Source: AGHT+IH/3WrK05z5ivhtvIUI1XVHzGbiZkskJ7mOoCqd9LJmfSfq9Y1Y48V/UH4ZedAszB2oGpINig==
X-Received: by 2002:a5d:4843:0:b0:343:3425:c06b with SMTP id
 n3-20020a5d4843000000b003433425c06bmr3772409wrs.20.1711823980877; 
 Sat, 30 Mar 2024 11:39:40 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 o17-20020a5d6851000000b0033ec9936909sm7002838wrw.39.2024.03.30.11.39.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 11:39:40 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Mar 2024 19:39:38 +0100
Message-ID: <20240330183938.882905-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711823981; x=1712428781; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=X6kbZr4JHn8P1o4AKXuQXCxN78iPISQdLENCcXW+kDk=;
 b=GQvZ3YPMkKhcs2qX5NnX0PTNoqPZoSvWOu4aWcEhIEDDeruIYenMNe/0EVa61xuUmj
 H0MRoKoz/h27A8oBC0AtX0gZUVALGxtSl40FnC9oHXfECbAMkVGsE/hpwjR8+KqXWMPI
 4bZc1qWGpMx/vBfQnFAPW3cS25kSXp+Ulg+QeK0VQbCy6yrSVp2TE5/S8ZZ0Wfy/8qiO
 vsTHyvq4BUJBaAcOnqGsPyluG+iI39az1eIPWlWldNBibJhItkjTD5Qbb3Hgdbfx10Mq
 SHNcx2OsYLs+D48ke9Ao/XUlAa1cXMNFkaOU80mcAQZ7wjOFZGSABGkAlg/NJK70QoUR
 VPhQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GQvZ3YPM
Subject: [Buildroot] [PATCH 1/1] package/dav1d: fix riscv32 build
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following riscv32 build failure raised since bump to version
1.4.1 in commit d8c440936d51b7f76472b43002780f5490b7a3bf and
https://github.com/videolan/dav1d/commit/43ee02a99cce1f221bdb574c9ee484180d71013f:

/home/buildroot/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/riscv32-buildroot-linux-gnu/13.2.0/../../../../riscv32-buildroot-linux-gnu/bin/ld: src/libdav1d_bitdepth_8.a.p/itx_tmpl.c.o: in function `.L0 ':
itx_tmpl.c:(.text.unlikely+0x76c): undefined reference to `dav1d_inv_txfm_add_dct_dct_4x4_8bpc_rvv'

Fixes: d8c440936d51b7f76472b43002780f5490b7a3bf
 - http://autobuild.buildroot.org/results/28192c494c7a2f88cc90205b6a08afd11782df40

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dav1d/dav1d.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/dav1d/dav1d.mk b/package/dav1d/dav1d.mk
index 74c68d1660..36a94da6e4 100644
--- a/package/dav1d/dav1d.mk
+++ b/package/dav1d/dav1d.mk
@@ -24,6 +24,11 @@ ifeq ($(BR2_ARM_CPU_ARMV4)$(BR2_ARM_CPU_ARMV5)$(BR2_ARM_CPU_ARMV7M),y)
 DAV1D_CONF_OPTS += -Denable_asm=false
 endif
 
+# riscv assembly requires riscv64
+ifeq ($(BR2_RISCV_64),)
+DAV1D_CONF_OPTS += -Denable_asm=false
+endif
+
 # Uses __atomic_fetch_add_4
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 DAV1D_LDFLAGS += $(TARGET_LDFLAGS) -latomic
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
