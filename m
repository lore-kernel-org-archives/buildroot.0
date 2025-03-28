Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79F44C36013
	for <buildroot@archiver.kernel.org>; Fri, 28 Mar 2025 18:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDD0981F24;
	Fri, 28 Mar 2025 18:04:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QexR94gML4mw; Fri, 28 Mar 2025 18:04:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAFE4851DF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAFE4851DF;
	Fri, 28 Mar 2025 18:04:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 89A221B8
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:04:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6FF5A70451
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:04:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dg9BFLPlh1Uf for <buildroot@buildroot.org>;
 Fri, 28 Mar 2025 18:04:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B9692707C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9692707C5
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B9692707C5
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:04:40 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43cf7c2c351so1405465e9.0
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 11:04:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743185078; x=1743789878;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A6W7z5hH7aINihHcWHsjNci7uj5f0H/G4lSUOGtmSn4=;
 b=ofLhE42pWI8+nnZv1XIDow17ZNQXKdBRPJOFm/mEHn2/daRiqHAar13Sz00BQBm6Nv
 On7sNU5GlmvkzTYf6fAtKt8lJkWOmI7q+u3+pGkhQxkHoA2u0le8iTelITj9IvBeNGOF
 9nzf177cURZFCi36TSr3/CFEYmNtDEkXrXIKoKUzAcn9OgGoTEVbp5NP6PsSWG+DHIyA
 p4vEmuCh9z2+D70WvgxbdAEMeyXNlaERTh1JtvBp1GA79WYPsG5fDz6QoZ7eKCOtkxxb
 14Yk4fFjEg2xxBI8VQ922Gk1WXF/dWXkHw4jHKEIfIU6vbvVyEgE1CI05EFBO13+yy9S
 rDTQ==
X-Gm-Message-State: AOJu0YzTSlh9X9YArK9s2woZEw9P+5zawk7oHIVoxgCSRVte8bWwkv3h
 saPaNpXUC74OJjCUGZePcHQ+BtwCYS2NKx7woUXDBjlsiKPTM4DCMiWSdB0f
X-Gm-Gg: ASbGnctuFPJuehfTBXaOfCYxQomkU/mUBMhdhWhw0aJLpS9XSeXlQhlLupNDyvFPw5Q
 CKFJF3fBI6Me/vBQgbWilyTrtRoq+6hfXxaXQRtmlqS0n7B3vHVjcUew5aHZ6QdOxxUV3xEKSfD
 RpCWWQhaSm1qsIS2Zfz9cA7UoABUrLxepNqW7V5rndXS35PbxUWNTQWEYHUrjtc+VY0D1+sUQiM
 udP+oi1D5yqmRsc0ItWzu26N96QYOQFhIEvbSklHpm0nCLg3weRVtIARB66x/vrkPuxXT3BVPdn
 08KGUzzXXDhqlT907k1MBLyABSdB1GTtX4vaeQ==
X-Google-Smtp-Source: AGHT+IF8BO1BI860M2S0r2jvg4q+sPCAwbbhMHMqhM53rPraw6tHq9x9KHOHCXe1MHAsgzz8wdu70w==
X-Received: by 2002:a05:600c:8712:b0:439:9a1f:d73d with SMTP id
 5b1f17b1804b1-43dbc6fce54mr1561635e9.8.1743185077461; 
 Fri, 28 Mar 2025 11:04:37 -0700 (PDT)
Received: from skbuf.lan ([188.25.110.61]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d90000f48sm34692995e9.37.2025.03.28.11.04.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Mar 2025 11:04:36 -0700 (PDT)
From: Vladimir Oltean <olteanv@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 28 Mar 2025 20:04:11 +0200
Message-ID: <20250328180427.3434693-4-olteanv@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250328180427.3434693-1-olteanv@gmail.com>
References: <20250328180427.3434693-1-olteanv@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743185078; x=1743789878; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A6W7z5hH7aINihHcWHsjNci7uj5f0H/G4lSUOGtmSn4=;
 b=DfKXQ2vEcsHx49hoXTPtyLUbEdKE+x/X45j8wwTFHgn+k5M5wxEmcjsfqCATZKsO4U
 QJ0wMEvGR1hphYa893qwuBxKzjBZVWomJox2Mtu2GFnTnO4EcdOQFUZm3GYqFZa3bjmb
 pYd0GEWswwW3Kr8Z5EQ961odPv5rmeKN5f2fqPZ2RP+NM9YDcnuZ/X1m8L9l9uuhzMzK
 xUZ1BIDGTuM7yqoVg8VtigezqxHaP2NMwCEDSvAJeYbKe6JfO/TPsLXM4/vnowykkkmD
 vpriPquQrs6erQDYmR9VxHOII2x7lWEghkxILv0n7Z/HW1fldRpAAUM1zLPKP8tM0RlN
 tHaQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DfKXQ2vE
Subject: [Buildroot] [PATCH v2 03/18] configs/ls1043a-rdb: enable the fmc
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

Since LS1043A-RDB uses the Linux Factory-supplied lsdk.config, it
disables the upstream DPAA1 kernel networking drivers and enables their
SDK counterparts. These SDK kernel drivers are configured using the fmc
tool to do basic things such as apply a default PCD, so it seems a
reasonable idea to enable this package by default.

Since fmc uses C++, we need to add the standard library for that, which
also seems to increase the rootfs size.

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
---
v1->v2: increase rootfs size

 configs/ls1043a-rdb_defconfig | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/configs/ls1043a-rdb_defconfig b/configs/ls1043a-rdb_defconfig
index d70e8692abe1..7073d6343cbe 100644
--- a/configs/ls1043a-rdb_defconfig
+++ b/configs/ls1043a-rdb_defconfig
@@ -21,7 +21,7 @@ BR2_PACKAGE_QORIQ_FM_UCODE=y
 BR2_PACKAGE_QORIQ_FM_UCODE_PLATFORM="ls1043"
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
 BR2_PACKAGE_HOST_QORIQ_RCW_INTREE="ls1043ardb/RR_FQPP_1455/rcw_1600_sdboot.bin"
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
