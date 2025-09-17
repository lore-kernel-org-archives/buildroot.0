Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B2BCAC592
	for <buildroot@archiver.kernel.org>; Wed, 17 Sep 2025 02:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6BF661301;
	Wed, 17 Sep 2025 02:45:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kyHWloDF5ajB; Wed, 17 Sep 2025 02:45:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD7FF6117A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD7FF6117A;
	Wed, 17 Sep 2025 02:45:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AF70AAF1
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 02:45:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9553883CD8
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 02:45:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y9yEe8G65nYv for <buildroot@buildroot.org>;
 Wed, 17 Sep 2025 02:45:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com;
 envelope-from=kastelic.jakob@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C9A7183CC9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9A7183CC9
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C9A7183CC9
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 02:45:47 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-267facf9b58so5230255ad.2
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 19:45:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758077146; x=1758681946;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QZ44RxTnzH/B5sDccFfuo12ldLWvwjdJvQwPqc49fOY=;
 b=mc2VS/8o45IODcR6oC7JHOrhwyoCuUl0KFRNmhBwsQ/5M4zczJ7npTYmBu0ZcG+5M1
 ZUREqSoycQUnsJgreDFz/QbbqqjN54Kl3qUxbr2cQOocIprBHfBIev7syRmzDfP6z77S
 kW48iaUeJD8i3KPWUItx87XQTjScHI512+Ja0l4uLmwuy8l2dfCb13G1v9eGFMJ4/Uli
 FtDgK0tpwV86atEIzr3ZKUdhYcXhbeZHfsw2y8MqvDlc5rj5TjzrKm96QhhDz9wOyaVA
 AZKUyPCA+GkdCA+YqX79iEpoYKoLmlIU952nRX0XCIsp4JDVVwSgPnKxcqsjumA0gRRB
 x3xw==
X-Gm-Message-State: AOJu0YzH+VxC4otZf9tT0AQ16orh3mTOW3vYSpgoZ/CPeW/4ATfziA3Z
 SNA2b0+nqy8D9C/xrwcZCDghBfhrPtFX/i8zlPnLdoK+JtfNM51ggpftLfoj7ULBVfk=
X-Gm-Gg: ASbGncuGU9DkBVng4xsv1UDOzqyUWoNDq8Gvl77Yn8FYonmlql9YwSR/X1LFjyWnROw
 7IA/y7eP4x53S7XWyZ0kF86pr599eNS2I87n59OjMCmsiZ2oPKtCeI8cNEyy9Nvc1iX83Ec9W7p
 1mKgiRjKPHcP9cnDrx2Qwem9hfq7FdLEgY1DRgGUImO3PYZipg/PVMie1r+2D00JGbmpaztPX+W
 cQegUMB8aDZe0G3GJEZ6iUpcqF5zVd2kLxP250o9fMdhIxQCJwCpG9eCtB4rE1ZgWtdG97oxJlq
 pqqqjbsPjLMz7nDIdFGCkyiwx/FrVU1q2ejz0l3RwYCK1QMEgYTWrazOF/4lwQqWw8/yWS49gqh
 G2kHz40WHO8S4gPguNojSapTyLKC20TLxYufHPKdGsSZYdwyj5U5rSqZCmFX7PXVFkOqzasMDFs
 IE
X-Google-Smtp-Source: AGHT+IGL9VO+A2C2YpO6euNj3kqxypExNLFYHuo0kBtbiNeB1B1Gwvd5aWXp+SWwGRoPr6+tLPFKgQ==
X-Received: by 2002:a17:903:3bcb:b0:267:d4d1:bf18 with SMTP id
 d9443c01a7336-26812169a76mr5597645ad.24.1758077146350; 
 Tue, 16 Sep 2025 19:45:46 -0700 (PDT)
Received: from localhost.localdomain (c-67-164-2-197.hsd1.ca.comcast.net.
 [67.164.2.197]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2631ee2ceb2sm102588735ad.141.2025.09.16.19.45.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 19:45:46 -0700 (PDT)
From: Jakob Kastelic <kastelic.jakob@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 16 Sep 2025 19:45:39 -0700
Message-Id: <20250917024541.1480367-1-kastelic.jakob@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241219214555.3435133-1-jkastelic@thinksrs.com>
References: <20241219214555.3435133-1-jkastelic@thinksrs.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758077146; x=1758681946; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QZ44RxTnzH/B5sDccFfuo12ldLWvwjdJvQwPqc49fOY=;
 b=QtPmxikxo4pZc0M1Sque8QJxKY4UDZtEAHwjb4AYufAjJd5qTe8JM2bsV87YCcHDSA
 aAGffSwGYAAvREUPfLRbKeB+mUnUoKL2gmWt+XEIuRpQXe7H6M0/Cz09WKwu4crTvFu1
 qLtoU6ZYy9kgZ5EDb4n/jQWkkVrHY+hyaJ37GQieTLjlis1h/QVdPBywaEW+oCEO5/Vo
 rWyPKyTdaQctPE3LSRBdslAJQojFgUxPEAMaWRlW0tP93Bkqx8Mk4fWWRRDVi5/SHVQT
 KyvuzwO+MxJRkuu7OC17iKw63O7x37/cGyz9+se34s1UnnIoIhE/1JLKWeB8PNZnHJ0o
 FwzQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=QtPmxikx
Subject: [Buildroot] [PATCH v2 0/2] Linux as BL33 in TF-A
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
Cc: Jakob Kastelic <kastelic.jakob@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, Sergey Matyukevich <geomatsi@gmail.com>,
 Dick Olsson <hi@senzilla.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch series allows one to run Linux directly from Arm Trusted Firmware
(TF-A) without U-Boot or another SPL (sometimes referred to as "falcon mode").

In my original submission, the patch introduced the new TF-A build option.
Arnout Vandecappelle suggested to also include a Qemu-based defconfig in which
this new flag can be tested. This patch series also includes the new defconfig.

Note that TF-A documentation talks about a ARM_LINUX_KERNEL_AS_BL33 option which
is intended for a similar purpose. However, on AArch32, that flag can only be
used with SP_MIN, which is not supported on all platforms. (For example, in the
present defconfig we use OP-TEE.)

The new flag applies only to AArch32 since I do not have a means of testing it
on AArch64.

For a consideration of alternative approaches, refer to the write-up here:
https://embd.cc/linux-tfa-bl33-qemu

Jakob Kastelic (2):
  boot/arm-trusted-firmware: optional Linux as BL33
  configs/qemu_arm_vexpress_tz_falcon_defconfig: new

 DEVELOPERS                                    |  3 ++
 .../qemu/arm-vexpress-tz-falcon/patch-dts.sh  | 21 +++++++++++
 board/qemu/arm-vexpress-tz-falcon/readme.txt  | 28 +++++++++++++++
 boot/arm-trusted-firmware/Config.in           | 21 +++++++++++
 .../arm-trusted-firmware.mk                   |  8 +++++
 configs/qemu_arm_vexpress_tz_falcon_defconfig | 36 +++++++++++++++++++
 6 files changed, 117 insertions(+)
 create mode 100755 board/qemu/arm-vexpress-tz-falcon/patch-dts.sh
 create mode 100644 board/qemu/arm-vexpress-tz-falcon/readme.txt
 create mode 100644 configs/qemu_arm_vexpress_tz_falcon_defconfig

-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
