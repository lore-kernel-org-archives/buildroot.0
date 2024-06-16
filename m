Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8627C27C77
	for <buildroot@archiver.kernel.org>; Sun, 16 Jun 2024 07:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D28160790;
	Sun, 16 Jun 2024 07:09:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ry69Ec7GrHW; Sun, 16 Jun 2024 07:08:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDD9360621
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDD9360621;
	Sun, 16 Jun 2024 07:08:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 94AEE1BF2CA
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 07:08:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7FC5680B1C
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 07:08:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VwEXzlVeOtpD for <buildroot@lists.busybox.net>;
 Sun, 16 Jun 2024 07:08:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3F03080AE9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F03080AE9
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3F03080AE9
 for <buildroot@buildroot.org>; Sun, 16 Jun 2024 07:08:52 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-35f23f3da44so3085843f8f.0
 for <buildroot@buildroot.org>; Sun, 16 Jun 2024 00:08:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718521730; x=1719126530;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b9WoZdJbxemBdFGRrOl4Z7OugqGG9pRjdoX0YpZ9g44=;
 b=QY+Z7LBNgrDp+/gDKVKVrXNImntwjJKQNS6kqLXELzCI0tF5yAdil1FHNYRQvgHQMm
 SJ1dMrqr7D/sW2hf5/UPQd1VMFRTJkV2H0xb7FhCcyDbtkUqB57Za1YhiN+JGoUZ7DQr
 xpBoMQjcwB3dmk0wvyKCuywmx8CkmXmjzINVu4EvHn/mlPg7m1M4eYlroV15kXj4IMos
 La+X/0o9oPX2fk4p3ko9m5BKw3C+ZCgCaeapryzUgefw7nHH+IPALT8hm9Ei2V38jn7R
 +nKajSl+bP8yXG9FDOFYL9QqmjFQo9ZP8lSwABUTeQ2rT92OI/Bpk0aj+jnZC6eIPD5a
 utrA==
X-Gm-Message-State: AOJu0YxKgYTCCu5rtR1T+VSxXYQ6V0BMdQdNZUzuV2m5FVAfonjxnDkp
 Cqe4w/PXoGu+wlwdyOaxM3zGFZgTmk9izfmMfg/4jGhvjfR2KlUJr9qvDQ==
X-Google-Smtp-Source: AGHT+IFXfLyA+pP3g27ktFdoTvrG+dHxgLorOYIe3I1PJCIj3BgA6x4pEXCdY9KGHdJNTG1MTDgEKw==
X-Received: by 2002:a5d:5f90:0:b0:360:82a0:ba4 with SMTP id
 ffacd0b85a97d-36082a00c65mr4551294f8f.57.1718521729890; 
 Sun, 16 Jun 2024 00:08:49 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36075093615sm8792985f8f.6.2024.06.16.00.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jun 2024 00:08:49 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 16 Jun 2024 09:08:49 +0200
Message-ID: <20240616070849.2608438-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718521730; x=1719126530; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=b9WoZdJbxemBdFGRrOl4Z7OugqGG9pRjdoX0YpZ9g44=;
 b=DfoZ86HpL6FTAbhIkXMgid+ftjXRIhvJMOWS4Af/C7AGkJFL4R/qS2XgOudiWzVpbt
 M1Hjl/RN3H0NFHXvD/S+ufAA9nEtHoYy2mPmRzqxy6c5RWzWzVO05TApsJHyNFm2hMVM
 EaWb7B1+vBiCSfxs+8Svm0ou5Z9/QyliBkTHYJGbpOBFfZM7VnhK8SJZti4GYVT0uvcR
 bgEPfZrnBm/n29YgoBSx14Vu1vrtoYEyoQw90WJtPf+4XY2F6OAGb62G7VzHclXwUGI0
 8Nl4yWzEenjKhk/AGZGS2RwtgonYDx4zoT9ZXZBzXV9UE8/lmowKFKo1p7gH0SGWWewO
 Wx4g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DfoZ86Hp
Subject: [Buildroot] [PATCH] board/xilinx: re-add hash file for
 xilinx-prebuilt
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When xilinx pre-built was added in a6648ad8da (boot/xilinx-prebuilt:
new boot package), the hash file was initially a board-specific hash
file. However, that hash file, in commit a6648ad8da, really belonged
to the xilinx-prebuilt package, for two reasons: the package needs a
hash file for the version it installs, and no defconfig was using it
at that time. So the hash file was moved out of the boar directory,
and into the package directory when the patch was applied.

When the xilinx-related boards were changed to use xilinx-prebuilt,  in
551ba16a0f (configs/zynqmp_*: migrate to xilinx-prebuilt) and 8271323649
(configs/versal_vck190_defconfig: migrate to xilinx-prebuilt), they were
correctly made to use a custom, non-default version. But then, it meant
that those defconfig would no longer have a hash when we would bump the
default version in xilinx-prebuilt.

Re-add the initial board-specific hash file now that it is required.

Fixes: 551ba16a0f09fe550acb3ef6d12a1b2587d03292
Fixes: 8271323649c42420adaf4513b0472a7203f7784d

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Neal Frager <neal.frager@amd.com>
---
 board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash

diff --git a/board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash b/board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash
new file mode 100644
index 0000000000..c955cd79f5
--- /dev/null
+++ b/board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  7abcba4e0e44e3a4adf9c1f971d918575226d7604dfd64a386baaa00c1c6c35f  xilinx-prebuilt-xilinx_v2024.1.tar.gz
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
