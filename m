Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A91C19F32
	for <buildroot@archiver.kernel.org>; Sun,  2 Mar 2025 21:53:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF54884115;
	Sun,  2 Mar 2025 21:53:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yc6R50WM3t30; Sun,  2 Mar 2025 21:53:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0090284142
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0090284142;
	Sun,  2 Mar 2025 21:53:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 068B0958
 for <buildroot@buildroot.org>; Sun,  2 Mar 2025 21:53:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CCA2F83FF2
 for <buildroot@buildroot.org>; Sun,  2 Mar 2025 21:53:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kwAb_diEnfps for <buildroot@buildroot.org>;
 Sun,  2 Mar 2025 21:53:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7A88C83FB0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A88C83FB0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7A88C83FB0
 for <buildroot@buildroot.org>; Sun,  2 Mar 2025 21:53:07 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-390debc81d1so342172f8f.3
 for <buildroot@buildroot.org>; Sun, 02 Mar 2025 13:53:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740952385; x=1741557185;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uSj1w4Gpdk6p0itpggQbSPuZ9MAW4vDYhui5VttjG+k=;
 b=qLo688aLYKqL1DDUgDb4UrWyUxMGdOMq94KARCQP90xIre5kF/2AUwZ7dcJidg6+kx
 AeRyhTGTwDK4fWdZUBdlPrmo5PmKYLHD2SArEP2pGT95J/Q6MYPrKOpaSIxV7x5lsvGE
 SkpPWl3O+PGBPOi59aJ4WhnBtgTL31CkTZElmRTPmDe+3sn3LnlNwjpRq7JdVBsoS/Eu
 bafboDyIeOEPnpd6aOybT4PT8SwStr9Jh9qG6I9Ze8ZpYEH0e4/RruIWL48w9cgDDF2D
 3VOZScCoDqjBySlod5nkm2uFVG/zIiverE11rp4ZRiXc4FiZ5041uhqLPkGlcKseRqDq
 KjcQ==
X-Gm-Message-State: AOJu0YwVGXYteNYn5qISQZxXOZhiCsWn41EW7mynE9rGNye5OCEc6Zxd
 9WWSFG0GcBfN2ZHEWCRjJyu7Aw+CZvQcHnz8/WLo9bkPtDLPW8zzFHEvhDlD
X-Gm-Gg: ASbGnctERkYifU8Jx2O3XHmDQZcsiC5qxaHk0ZnBNGwmWYFCDybId12qUhOiVARQ7Su
 K4fey0IiiwaNLk74YBOg2qzNZe6NB5RaElWve0/dSeJoD2SzBinxbfLAuMb3c3JwwXEnZYUFiXX
 naU2o7vqJIDlrh6PnRAYs9Ig7FrpI+LzzAclXOoein18XQm34G++urIZpGjXKCSd05f0pUL87S6
 O+UzlTtHa7zueAwxloVa54Soj4ohSfEW7myZaoN/pib3xPVWew6MEU/V+Arf0ohiXz6AU72tVc7
 CjjBfgks9D2QHN+ZOdMru/A0NbQJ2cJGkJmd5w==
X-Google-Smtp-Source: AGHT+IEsgpZAoxQ5UEzwUvYNQqNxBjARz8NTeLeYy0/u0eKXOq/Z4UhHWyi2dSYssJWFkbePP+elfg==
X-Received: by 2002:a5d:6da3:0:b0:38f:2685:8457 with SMTP id
 ffacd0b85a97d-390ec7746e7mr3542852f8f.0.1740952384859; 
 Sun, 02 Mar 2025 13:53:04 -0800 (PST)
Received: from skbuf.lan ([86.127.124.81]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ab2cb1063sm113389645e9.2.2025.03.02.13.53.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Mar 2025 13:53:04 -0800 (PST)
From: Vladimir Oltean <olteanv@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  2 Mar 2025 23:52:19 +0200
Message-ID: <20250302215219.1276480-16-olteanv@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250302215219.1276480-1-olteanv@gmail.com>
References: <20250302215219.1276480-1-olteanv@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740952385; x=1741557185; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uSj1w4Gpdk6p0itpggQbSPuZ9MAW4vDYhui5VttjG+k=;
 b=G3D/FzWlWzH48BIKb0h88JhqwR4AI6GGPxC6wWYX6D87HxugvdyazVvhikM388Agew
 NIaVgkZidcWtDHdpUJo/Z+rjeTsFSID/4xKmEjtTKDyD6TYRsTunozoIapd06afa/8iQ
 YOeFGUbVkUA+IKdjScqf4X1YQSMJM6tzPiKtjGhzjk5u+yalGo6xwGhyx3viwfGWK/3d
 QuJSzug9uY9X+iSr3q1IoKW15eq1mZZs+i7xT7BH8R9lF2QzNSxiFZnwlZ9q3lVWSZ6l
 40hUo/IsjMxzm3d8dWD/EozYbqradoYGqJ/HlyyL2x5q6422+VJPt0CfHfAu9AYCq0nO
 X5Ng==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=G3D/FzWl
Subject: [Buildroot] [PATCH 15/15] configs/ls1043a-rdb: enable the fmc
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

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
---
Change log:
Patch is new.

 configs/ls1043a-rdb_defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/configs/ls1043a-rdb_defconfig b/configs/ls1043a-rdb_defconfig
index d70e8692abe1..15cfce93e742 100644
--- a/configs/ls1043a-rdb_defconfig
+++ b/configs/ls1043a-rdb_defconfig
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
