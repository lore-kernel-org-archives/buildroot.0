Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3587CCFA13
	for <buildroot@archiver.kernel.org>; Sat,  8 Nov 2025 10:59:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C5C5811A8;
	Sat,  8 Nov 2025 10:59:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d2Rza-jRRnDU; Sat,  8 Nov 2025 10:59:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68D3E81176
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68D3E81176;
	Sat,  8 Nov 2025 10:59:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 30B531CD
 for <buildroot@buildroot.org>; Sat,  8 Nov 2025 10:59:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2264F81176
 for <buildroot@buildroot.org>; Sat,  8 Nov 2025 10:59:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TnYHDJeW-iqU for <buildroot@buildroot.org>;
 Sat,  8 Nov 2025 10:59:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 251AF81169
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 251AF81169
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 251AF81169
 for <buildroot@buildroot.org>; Sat,  8 Nov 2025 10:59:11 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-b710601e659so255597766b.1
 for <buildroot@buildroot.org>; Sat, 08 Nov 2025 02:59:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762599550; x=1763204350;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=itcrR/LbwYeoqmWDAlaqTj0tEy3kI5PBhwIMZOek8Pw=;
 b=LX4PHB2DL0nCtmwJHnG+QsCXNyH7LQXaRYI5ZqHOE9UCwTidMDvOkN9FBkDOJ4CBnl
 hCMwkHLDLOwoWIGTyHFk47IKXQxFm5Dx2FZ3NOGyIRqOkWv/UF6uH7ufwFXAIeir3fYJ
 55nZRP8O67gW53PSgzAc6AEUWtpxci/0xP/Z8E1GMax+U3VjcxClay5rbJ/zLt8pGvxS
 L1gSI8y+2OiuSaj1CBcd4dAinw9rs+KoS3gWzNgprPwO77ohmZ/Bhm7zFjhivIK5/6VY
 ISWfHjUndH69+A61tsnvuG222I/TNybC5x7Tb/GNBgFLp4O5ogMqORxtlOfBbHS7J9vI
 oCtQ==
X-Gm-Message-State: AOJu0YzCCoRAuM+xn02XSj9yxqkfBLOXr7HhtSGpReLi+TooeSSriEwY
 cErDJti2Ib7OE0snK9Cd8XN8cg2Vh+gE3l0NdjIqnxIY/alpNMIOfd9UcAx6AWw7gne2HBo7Lpz
 U/dCBFBE=
X-Gm-Gg: ASbGncugqHtniZhpHFnvLlDVOmM+eD9WL6OzQHq62g+N/ce4LgHpmuUiT8yxRgUL80X
 Szus+2GkOIH3vZcEshzVzNEx3ZwvcrtXD5lRzgaBbklYmFK6F4W8G7yyH702oSp40ZZHQSUctNZ
 uqJcrXh6HRSlQwCbUWYGS/oe7HAWMiv8AVPJjYU5M88ow/3FmjpCThsO7fu3w8haOgo8WZ+X1qb
 vO4usKPGSK46VstAbQW+7Pv7Thx9auqsA133KwOOoxWSlvzwlwCGrbcmoxF9c0knGIOqeUYX5LL
 EqTRh/kKBKjXW9p7w+6yKeF+iZfUAwNr2aUZ1Hb1OItSMLE65qxHxEO5/HiNnB11etbHFZKlcd6
 k139+09oSPEBBW+QUTGxQTpbI4DKSJ5bL3JaT8Q4rsgTbZ7hxpI9/D9kac7diAe69yJimOxSuIw
 wV2iYcP21grzZdeHStHhthSNB2Ef/YDQR6/mvM55o1Tv26tsxKlrkqei6E7eErjYkfo7DifjTmU
 mvXRA9/ACCv4L1dHdTkknKCfjSWCvBwRpGdNqmUqQpOKkt6BVIA
X-Google-Smtp-Source: AGHT+IEJvyWpsNkgMJTPzqgR57chBy+NzCHhRBT5kcy2VygO23Oio5yXFQYmELp7uw1LRJvvnuoQeg==
X-Received: by 2002:a17:906:eeca:b0:b70:b52a:5597 with SMTP id
 a640c23a62f3a-b72e045a333mr215695466b.40.1762599549398; 
 Sat, 08 Nov 2025 02:59:09 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-87-9-99-245.retail.telecomitalia.it. [87.9.99.245])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bf312e51sm500065866b.17.2025.11.08.02.59.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Nov 2025 02:59:09 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sat,  8 Nov 2025 11:59:05 +0100
Message-ID: <20251108105905.2713315-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1762599550; x=1763204350;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=itcrR/LbwYeoqmWDAlaqTj0tEy3kI5PBhwIMZOek8Pw=;
 b=aSXGyke023BUBpb9Q0Vdg2hpAN3yZl5N8TiGGUmOzT/1F/yg1eEwrSFL4Aw9y+U0PF
 IhDqRYihCRflYEM/5lwDP6LtodvcCAYR4S1cbtHhokuDkIxPMiUjQDIgAV6jyo1dOD0q
 ZIWosTmC5r5QxkNex2QYSO4RLPXlP5bRwc9aU=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=aSXGyke0
Subject: [Buildroot] [PATCH 1/1] package/btrfs-progs: bump to version to 6.17
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

For release notes since v6.10, see:
https://github.com/kdave/btrfs-progs/blob/v6.17/CHANGES

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/btrfs-progs/btrfs-progs.hash | 2 +-
 package/btrfs-progs/btrfs-progs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/btrfs-progs/btrfs-progs.hash b/package/btrfs-progs/btrfs-progs.hash
index f12c76c2eef9..266dcffe557b 100644
--- a/package/btrfs-progs/btrfs-progs.hash
+++ b/package/btrfs-progs/btrfs-progs.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/people/kdave/btrfs-progs/sha256sums.asc
-sha256  3382a84e3fcfe1ffdea07a61ab3f4e86665d38fa35f1f34548d5df867423e0df  btrfs-progs-v6.10.tar.xz
+sha256  277d696c9d79713ff5afb53c7efebdcead2e6a6007789b1742ec411f4e4ca229  btrfs-progs-v6.17.tar.xz
 # Locally computed
 sha256  0d5bf346df9e635a29dcdddf832dc5b002ca6cdc1c5c9c6c567d2a61bb0c5c15  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  libbtrfsutil/COPYING
diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
index 273c7e37f2b9..220ea80c7192 100644
--- a/package/btrfs-progs/btrfs-progs.mk
+++ b/package/btrfs-progs/btrfs-progs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BTRFS_PROGS_VERSION = 6.10
+BTRFS_PROGS_VERSION = 6.17
 BTRFS_PROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/kdave/btrfs-progs
 BTRFS_PROGS_SOURCE = btrfs-progs-v$(BTRFS_PROGS_VERSION).tar.xz
 BTRFS_PROGS_DEPENDENCIES = host-pkgconf lzo util-linux zlib
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
