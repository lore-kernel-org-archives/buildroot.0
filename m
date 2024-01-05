Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AF4AC3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 13:25:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 283E083EC9;
	Fri,  5 Jan 2024 13:25:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 283E083EC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c4a3CY93vGLd; Fri,  5 Jan 2024 13:25:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 792E883E19;
	Fri,  5 Jan 2024 13:25:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 792E883E19
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8EAA31BF841
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 13:25:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 74330436EC
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 13:25:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74330436EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T0M9FcTdZMtV for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 13:25:14 +0000 (UTC)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E44FA435DF
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 13:25:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E44FA435DF
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3368d1c7b23so1209578f8f.0
 for <buildroot@buildroot.org>; Fri, 05 Jan 2024 05:25:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704461111; x=1705065911;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nUftWCMUOnHzuV7B2NGyps/MMiQ6+HOxnaDhKJKnUuE=;
 b=nxpjrLOJrflcoEp31YtQLd2bz6NhBMlKlQOubDf6mm0JsU9OHMgCDTx5I3vxo8tLiq
 ZNVxJvpQ4t1E/ux+cUN53g+boiIMXTFF1fqF+DkffeRvFSBv8c8wA9mH6upfmcYECZ6h
 Z80KnhMpeEKlUoTn4cjNoFmOo0dBqEr8wZYUrmWcHeSln0q83lnpGx9KfegxvtWaT08Y
 +k+JcpL/lzTR+2vQ4SjhwhvVtc0rAYcDwRR/vm+nnZUTtHp0PW82R2qufhy/flVCpDCL
 A/Ugigg0KHWCkU6DdZ8glEXoWMuLTwWmOTSKegzGn9sqEtBlPHqCS3ocT2A1h8/XcGZB
 CIFA==
X-Gm-Message-State: AOJu0Yzbni5uNaL4mhqAwxuqprOQj8RMxrhW6RSAFSoxdoYX4Zl6L5QR
 eWzLlwGLL/E5DPmV7cGBm+Cw2UQrDRc=
X-Google-Smtp-Source: AGHT+IHx8v8HfHhyk7ng+G/0nPkbul6GiAt0slOQ0nJcmb83iDGjzQ9eXmKKE6yJzyHbodd7k9GKiQ==
X-Received: by 2002:a05:6000:174d:b0:337:4a10:df3 with SMTP id
 m13-20020a056000174d00b003374a100df3mr1009336wrf.56.1704461110810; 
 Fri, 05 Jan 2024 05:25:10 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 a22-20020a5d4576000000b0033671314440sm1410940wrc.3.2024.01.05.05.25.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jan 2024 05:25:10 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  5 Jan 2024 14:25:08 +0100
Message-ID: <20240105132508.505325-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704461111; x=1705065911; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nUftWCMUOnHzuV7B2NGyps/MMiQ6+HOxnaDhKJKnUuE=;
 b=csDqeXlFMENUXmV+lQ3NHJDmc2nFfQDIrx/+phsch+g98ZNrEIwUHdH9AVmBr44OdV
 wryBrlG895gObE+JaImx4t94kRRCOepeEBp2D0x1PdreV4X4b0dqLEFcoNCeRW98h3Gb
 og2N9p5nkQ8NrXbA1suDSYcIUy6CrLx4YDhfRKemOAmF6Bnxm8tGYLl4lzTwtCeaj7M7
 QOXiZCND+hW6t5fJOrc2xZnXbR9EiZ0AsppLOiGkU4J5H+ca4RKeotRdRv9iEwkGe9uq
 VX871pM5sjKues8Z58undZtiqwKRbzL7Jyz4JjYSz5uP7oJ7ShXTWtOs7uF0wT3CBxdU
 2irQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=csDqeXlF
Subject: [Buildroot] [PATCH 1/1] package/bullet: bump to version 3.25
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bullet/bullet.hash | 2 +-
 package/bullet/bullet.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bullet/bullet.hash b/package/bullet/bullet.hash
index 5c70c683b0..3160b04572 100644
--- a/package/bullet/bullet.hash
+++ b/package/bullet/bullet.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  49d1ee47aa8cbb0bc6bb459f0a4cfb9579b40e28f5c7d9a36c313e3031fb3965  bullet-3.21.tar.gz
+sha256  c45afb6399e3f68036ddb641c6bf6f552bf332d5ab6be62f7e6c54eda05ceb77  bullet-3.25.tar.gz
 sha256  885cd516a8420acb7c3e0b1a7119913b686495001ae564e3229740460e8cff59  LICENSE.txt
diff --git a/package/bullet/bullet.mk b/package/bullet/bullet.mk
index 9afd922ec9..e112623b79 100644
--- a/package/bullet/bullet.mk
+++ b/package/bullet/bullet.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BULLET_VERSION = 3.21
+BULLET_VERSION = 3.25
 BULLET_SITE = $(call github,bulletphysics,bullet3,$(BULLET_VERSION))
 BULLET_INSTALL_STAGING = YES
 BULLET_LICENSE = Zlib
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
