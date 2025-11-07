Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F4A3CCF9E3
	for <buildroot@archiver.kernel.org>; Fri,  7 Nov 2025 21:40:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BCA8606CC;
	Fri,  7 Nov 2025 21:40:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CtjP9QFBD_G3; Fri,  7 Nov 2025 21:40:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63CCA6069B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63CCA6069B;
	Fri,  7 Nov 2025 21:40:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F8551CD
 for <buildroot@buildroot.org>; Fri,  7 Nov 2025 21:40:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 358314010D;
 Fri,  7 Nov 2025 21:40:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k04AQ40zJ_wZ; Fri,  7 Nov 2025 21:40:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 56C074010A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56C074010A
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 56C074010A
 for <buildroot@buildroot.org>; Fri,  7 Nov 2025 21:40:12 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-47773cd29a4so83295e9.2
 for <buildroot@buildroot.org>; Fri, 07 Nov 2025 13:40:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762551610; x=1763156410;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kzsdE2mi4sg5oPzCeD1R9CszLrEOKerUZI7RcFVp6aA=;
 b=sMmwX/PRd02rFDWNoDXk07BO2AgyRVApYrdm9PK3VRwGLyA+I5T1vzIF3P4483Oj46
 KHfWuBc9+lqfDyDWHg4wsdwoeH1Rk6MYzpsczcqslFDf+o+PQs/KI8CPFeN6T6G+kt3Z
 T5AFzZvtCw9jkBHc3B3eGEXcHLF7KlLu089zlo/YWW3gboqyRQaE0Z5wObG8ATMzH4Fk
 ixORqltfVZDrv8bBBWAko0zNaF800LHcdDcco6Pa5wJ0vjdAEhbFoLBP+SxJXdKbCeop
 5Ha2jwh1eE9VFFIUBTMJDO/yBETojpIALQn9tBbyP7prljppKyAIxmOpiBgnq52ujij0
 kS8g==
X-Gm-Message-State: AOJu0YyHZbHZ948+A2FBttmATpI/gFtK1Wpb6XtA7QcnoFsrGczqC0b1
 Pg0aZXWozfI0ZTDZ0Al2DlUNpuQCOwx8F1DxrWokCUmZ1hkp7ZZwXGzzP5ehEg==
X-Gm-Gg: ASbGncshjkkw84LnYE6kWbHG3xiKll6jhhZtXfLly06KriyQvnk9eo6xFsFCy+Fa9T7
 wqIXyysvTgbbxEECE6GrcyQa9UiXthnxx5D4l1UB1O5FQf0OSYipznah9Xo/BDbIiQlXPYHWjNy
 fvjjtyrLoLVECWsPjU6hpzSuz3wg2rLwjZbUGCIVeQecwNBFha91DL7XUCYjwrAdC4Jhnjpab7k
 JfaDEmdBG817cD8Eyx8DH3I0p6ReR2Nlo0pKHnDUV5g12C0EcZxAQYlKzkOEn0qmoSh6PrV4GAr
 BBUY/nUBLswtYBojIV4IOdVDSK4Xoqsw7rif1XL1ED8lHYJZ/pXbDWYuKfMM6zcgxJX2inI1Dm3
 6BK4m/JCmxjVYL0fKJYNO8XwIDicFh/SwMr1t3f7oUu5zXdbiJqbpJWgkkiHVXHXXEUcjpT86Bo
 SG/328HxJ6tyc=
X-Google-Smtp-Source: AGHT+IEKIQhLyhqVdfu+g9nEavJ343zyTbeuoUO+oYchAB/+d+VcaojETY6Ygpe0Myb6VCe6/owzHw==
X-Received: by 2002:a05:600c:354c:b0:477:5a11:5545 with SMTP id
 5b1f17b1804b1-477732927cemr3330585e9.27.1762551610102; 
 Fri, 07 Nov 2025 13:40:10 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477632bda1asm119815055e9.3.2025.11.07.13.40.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Nov 2025 13:40:09 -0800 (PST)
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Romain Naour <romain.naour@gmail.com>
Date: Fri,  7 Nov 2025 22:40:09 +0100
Message-ID: <20251107214009.403006-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762551610; x=1763156410; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=kzsdE2mi4sg5oPzCeD1R9CszLrEOKerUZI7RcFVp6aA=;
 b=IIJ9aYvWYX2U2/DsbJHCL4cts0aovajT89q4SoSNXGF49tYThVDYd7E83AqkRc0Lq9
 D3EP6TknSahneonJkxJK8b1voBbebZ4g3zzDC63d2TYSsjtRx7tn2TDFEOWFaMBtMD/6
 9ds9N+EN7fbbQ0tx2ECKmmOgNaFZCaxJvmHgQQNrr9o68lh5PUfhJrsbzhNHSDGrpFL8
 VDmQJVTxquc9DNtEg/4tGsaRMseeCymgmD0mP3lkGFFpfJBLboaV+TZRtULR7U93SCMS
 BS2bN4eE1DfI2sTVZFptxWX7lZwYQDaNmZKiI3pcRU3Fi8NZg9zlPEanGOnYDuCUOkvx
 pMew==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IIJ9aYvW
Subject: [Buildroot] [PATCH] docs/manual: add merged-bin details to
 customize rootfs
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
From: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>
Reply-To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As was done in dc7c6487cff0 (Makefile: check rootfs overlays with
BR2_ROOTFS_MERGED_USR enabled) to document how overlays should be
set up for the merged-usr case, and following 428ac6fcc4c2 (system:
add support for merged /usr/sbin (aka merged-bin), extend the
documentation to explain how rootfs overlays should be set up for
the merged-bin case.

Reported-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 docs/manual/customize-rootfs.adoc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/docs/manual/customize-rootfs.adoc b/docs/manual/customize-rootfs.adoc
index d334093748..5d8bcba778 100644
--- a/docs/manual/customize-rootfs.adoc
+++ b/docs/manual/customize-rootfs.adoc
@@ -28,6 +28,11 @@ When +BR2_ROOTFS_MERGED_USR+ is enabled, then the overlay must not
   such a situation, should the overlay have any programs or libraries,
   they should be placed in '/usr/bin', '/usr/sbin' and '/usr/lib'.
 +
+Additionally, when +BR2_ROOTFS_MERGED_BIN+ is enabled, then the overlay
+  must not contain the '/usr/sbin' directory, as Buildroot will create
+  it as a symbolic link to '/usr/bin'. In such a situation, should the
+  overlay have any program, they should be placed in '/usr/bin'.
++
 As shown in xref:customize-dir-structure[], the recommended path for
   this overlay is +board/<company>/<boardname>/rootfs-overlay+.
 
-- 
2.51.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
