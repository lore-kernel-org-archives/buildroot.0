Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3FF4D0C5F6
	for <buildroot@archiver.kernel.org>; Fri, 25 Oct 2024 09:33:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 241658118A;
	Fri, 25 Oct 2024 09:33:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 740b8is8zFF8; Fri, 25 Oct 2024 09:33:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46D1881318
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46D1881318;
	Fri, 25 Oct 2024 09:33:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D82E2316
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 09:32:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 12BF3406A2
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 09:32:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8_ZszMvdU1pZ for <buildroot@buildroot.org>;
 Fri, 25 Oct 2024 09:32:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=robertoxmed@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EE0C84068F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE0C84068F
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EE0C84068F
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 09:32:56 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-37ed7eb07a4so1404238f8f.2
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 02:32:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729848774; x=1730453574;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wDZVfUl3Eag3goaTdXviz4wc3nOV13h7mG9aYf4NIUE=;
 b=QW5V3blcRRTz6W66Zk2VBHdst0i+fBe/Fl0X/r99ijlenGLuiD1m5PH6PkBW+RvkaJ
 DB6wsvBPVNfgKkR2hOehQ3uqKAnqKuxeEBYc9KUP+RoMqMM/Pt4NjLYYVnHFOJ2e5WOE
 CUqsknczZV39ilMAQx55xtYZ+dNn64fxCDT9rOztN6DxLr7oyusCP9SYcsWfKBMG+DhU
 WaKoVTOA8VYYNIVNx8BFZPurnfSM5ad6b2+zaq2eLI45wFM0klcatatdj4mQAuqwHpo/
 FgJttdR/EnaMVPZLN+/eonOcIbhzfp4JFbGE3wkI5WLnQvCPdL794UCNHi37swpuMF2J
 L6Og==
X-Gm-Message-State: AOJu0YxjdTxaxTRp0rVtP1VJl/waOwuzZQY994nVcSCPlJ2Q5soPmAPh
 XVbsNfA9c53fxD+ZI0ZyNgctne8DnfQmSvSr8N77uUM1N988a9Y+JYAvD3SrS2c=
X-Google-Smtp-Source: AGHT+IHdQ8YizpZnxANzTmmcVOB00MTSzLdv534qspNf2OpzLh+lhLdsGmezs1z2Qb2wFS4B2T1sVg==
X-Received: by 2002:a05:6000:191:b0:37d:4a21:c754 with SMTP id
 ffacd0b85a97d-37efcef0b96mr5943737f8f.2.1729848773660; 
 Fri, 25 Oct 2024 02:32:53 -0700 (PDT)
Received: from Suzaku.home ([2001:bb6:11e3:a300:da4d:c63d:b184:11d6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b3bc31sm1055607f8f.28.2024.10.25.02.32.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2024 02:32:52 -0700 (PDT)
From: Roberto Medina <robertoxmed@gmail.com>
To: buildroot@buildroot.org
Cc: Roberto Medina <robertoxmed@gmail.com>
Date: Fri, 25 Oct 2024 10:32:47 +0100
Message-ID: <20241025093248.2015508-1-robertoxmed@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729848774; x=1730453574; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wDZVfUl3Eag3goaTdXviz4wc3nOV13h7mG9aYf4NIUE=;
 b=k/CWJtU0C6oo0J4s+0/PDVOgQhq7rPftv454yAN5ld1uA/7IqwPtS6OEqfp054L/z8
 FUAhBlHm528xedSvfAAilxVlzRdc3Tf1ZW+Lxhz85As9d62AipbXlFUFn8v8vE/CPm+6
 qQ3HNemyDFIgIAJtF9/ksYWR+X8GYFWh/mo4SUHYm2h4P2LwwXk1+dTqTzr3q3EF8nrE
 3nXGUR/a1A3SUgKCDXFVSnDsoLuoaSxb/84mPQDCHBazH0ggnFXPUnJbRDuk3mXKP4E+
 Eoa4bbMhuqiMFQFBEaCCXVLc9PXZCEu4MDw1iWKnmyurEnIO+uJ5xesUbhzBHoL385V3
 s45Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=k/CWJtU0
Subject: [Buildroot] [PATCH v2 0/1] configs/roc_pc_rk3399: Bump Linux, U-Boot,
 TF-A
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

v2 -> v1:
- Enable checking hashes and add relevant hash files.
- Move from Glibc to uClibc.

Roberto Medina (1):
  configs/roc_pc_rk3399: Bump Linux, U-Boot, TF-A

 .../arm-trusted-firmware/arm-trusted-firmware.hash    |  2 ++
 .../patches/linux-headers/linux-headers.hash          |  1 +
 board/firefly/roc-rk3399-pc/patches/linux/linux.hash  |  2 ++
 board/firefly/roc-rk3399-pc/patches/uboot/uboot.hash  |  2 ++
 configs/roc_pc_rk3399_defconfig                       | 11 +++++++----
 5 files changed, 14 insertions(+), 4 deletions(-)
 create mode 100644 board/firefly/roc-rk3399-pc/patches/arm-trusted-firmware/arm-trusted-firmware.hash
 create mode 120000 board/firefly/roc-rk3399-pc/patches/linux-headers/linux-headers.hash
 create mode 100644 board/firefly/roc-rk3399-pc/patches/linux/linux.hash
 create mode 100644 board/firefly/roc-rk3399-pc/patches/uboot/uboot.hash

-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
