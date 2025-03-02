Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D946C19F32
	for <buildroot@archiver.kernel.org>; Sun,  2 Mar 2025 21:53:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F52760A89;
	Sun,  2 Mar 2025 21:53:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1PdNcna0Ix5t; Sun,  2 Mar 2025 21:53:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6502860A93
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6502860A93;
	Sun,  2 Mar 2025 21:53:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4628EB89
 for <buildroot@buildroot.org>; Sun,  2 Mar 2025 21:53:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2708E408E2
 for <buildroot@buildroot.org>; Sun,  2 Mar 2025 21:53:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N-dOg9EfwEm7 for <buildroot@buildroot.org>;
 Sun,  2 Mar 2025 21:53:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1BFA740529
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1BFA740529
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1BFA740529
 for <buildroot@buildroot.org>; Sun,  2 Mar 2025 21:53:05 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43937d315abso3868725e9.2
 for <buildroot@buildroot.org>; Sun, 02 Mar 2025 13:53:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740952383; x=1741557183;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yDRRlFTYE4+LgsPI3s/oymatdObjYi2nBqhfQN1sRDg=;
 b=lRO4mcOhH7qt/ZZzam9qlqCCoDeH4Sco1vkYIdE3ozHFg6URPChY+fua8rX6QqrsSA
 MogK9f9Q8Vnn0pPffjP+QuEN/dB1yfBmTs2zwdgiqeaJwampV99W2fSaroUoKLod06sG
 TsBdPAKkVllqm6TY6LSXbh0fMM8byaXH1Eg/sXBEvNUUrVspChw7y9Xj6WZ0+LZvp8nV
 8YQeO/IgGyIv2+5IwnPJakZoXl4pEOvrK7GHVImC2c1+gG6q4uGv9nEzQYKGPSigzoJ+
 3GPo0U2nHP03tFPAC5jdzsYxWm/oahzKv0QwSQoAVTRQ289KMUyDTxCAVfPNb+d8usgg
 DPyQ==
X-Gm-Message-State: AOJu0YxlaqbHuttuUJ/ePm2heODJIr2IuAmLpib6evZ4M990bLY0KbA5
 A5h/T3TE7m5do5Xj/M8GyS/0cN/fpJt3GQ8yLuIrd5jVCC2iHiLgfFIYG+iu
X-Gm-Gg: ASbGncsZTMnh1bgfckAZ8np2epwlYN4/wujWAnn/VP5iMiZiZxL00BV4nYB6TXe6yBU
 kFMapIkc/6Ymg2xtNjuiVD/i2e6AxBITvGJPghDfLhjFoah7JZr3RosR/AA4iYq/4yBYPGrNBZV
 VMHOldI+eGCILNQwgfIa4s+t82VMJmPcOuaA4cJdE4QISpFm45XtjqR1y8c9OxomAjyk5Vx8w3L
 HjLpC7IGavbRKyP2qWDmjcXUy/cHJylM7EAdJFBni5oIXY7cEfSqQAsH6AccKX8DIrReFsNDBJv
 ZzplRWBOYmWlvyEDR5VGW/mXlDm9p3Kmc/lM4Q==
X-Google-Smtp-Source: AGHT+IGHaH9A7/PM+SxDtnRSGBfnTPK7Coxo1w53RFSc39lkbhgM3ceQSu7YwO4EGWvtg/Qdkzr6Yw==
X-Received: by 2002:a05:600c:4451:b0:439:94f8:fc74 with SMTP id
 5b1f17b1804b1-43ba665f7dbmr35083625e9.0.1740952382696; 
 Sun, 02 Mar 2025 13:53:02 -0800 (PST)
Received: from skbuf.lan ([86.127.124.81]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ab2cb1063sm113389645e9.2.2025.03.02.13.53.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Mar 2025 13:53:01 -0800 (PST)
From: Vladimir Oltean <olteanv@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  2 Mar 2025 23:52:18 +0200
Message-ID: <20250302215219.1276480-15-olteanv@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250302215219.1276480-1-olteanv@gmail.com>
References: <20250302215219.1276480-1-olteanv@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740952383; x=1741557183; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yDRRlFTYE4+LgsPI3s/oymatdObjYi2nBqhfQN1sRDg=;
 b=HXZ5nhC39zddZk5jbbQ1bIZy+ptkHL4w4jUCLDlZ31rDMi8JW/pcvKsEY085LtFQd0
 lJoXsGSMjS5P145RlWZedU38vUXds8wltLlwTcqr4GxZnhrDyEegZzPYEhtWalgd4q/r
 whO6mdLymIsonHxWVP0T0AATT78J7QpR6akg+KOQ3mQfkOLZ38KeC6ULWP7eMjS1Rq/U
 V1XElw+7k2lNyHisbnqOn+pKJHNA3W/Nf4ui6w7CxqHjBz++b0oob/6LI9d+VDSvSwG9
 kY0omNn1+gNo080DyJNHc4K56wMstx24R9mRj0K21p6muiyLtE0uLziFi9LyxzDcT+An
 QVsg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HXZ5nhC3
Subject: [Buildroot] [PATCH 14/15] configs/ls1046a-rdb: enable the fmc
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

Since LS1046A-RDB uses the Linux Factory-supplied lsdk.config, it
disables the upstream DPAA1 kernel networking drivers and enables their
SDK counterparts. These SDK kernel drivers are configured using the fmc
tool to do basic things such as apply a default PCD, so it seems a
reasonable idea to enable this package by default.

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
---
Change log:
Patch is new.

 configs/ls1046a-rdb_defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/configs/ls1046a-rdb_defconfig b/configs/ls1046a-rdb_defconfig
index 441d461298d7..bf66e6b91b61 100644
--- a/configs/ls1046a-rdb_defconfig
+++ b/configs/ls1046a-rdb_defconfig
@@ -41,3 +41,7 @@ BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_QORIQ_RCW=y
 BR2_PACKAGE_HOST_QORIQ_RCW_INTREE="ls1046ardb/RR_FFSSPPPH_1133_5559/rcw_1800_sdboot.rcw"
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
