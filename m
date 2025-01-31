Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 533A0C02194
	for <buildroot@archiver.kernel.org>; Fri, 31 Jan 2025 17:06:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09CAE81135;
	Fri, 31 Jan 2025 17:06:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gqCrH_ETZQYy; Fri, 31 Jan 2025 17:06:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17D2B84744
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17D2B84744;
	Fri, 31 Jan 2025 17:06:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 343D917D
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 17:06:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 183C7606E3
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 17:06:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Id0MkWOA4HA1 for <buildroot@buildroot.org>;
 Fri, 31 Jan 2025 17:06:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=kazemi.ms@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2F51760645
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F51760645
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2F51760645
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 17:06:55 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-aaecf50578eso446385666b.2
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 09:06:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738343213; x=1738948013;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sOeW1BKx47CnTc08z4qTLD/7U9V7rMYpxf79CqjOjto=;
 b=e+WI+WX/IXsoCt3CUYNFSp9QmsD2wi1QolXODyrugSpa/gf9vgi7yoXKLYVsb8JOfJ
 GIPT6ag6otQ0eq2Kz5jnn8lo3vBeYYOHmPI1Q2c2fumPwqJ7EmpKHFLtwaY4Nhrr7qdQ
 r+UcKZo8uyKfe4XDZmTrZeNxQVcYu9yD6uFTmBHRBiWSlnooegsZV9Z58az9rX/BExOS
 FRXyl2xCbs9Pwy9IpgMUo5VNGrgFCjn97LBczkVvWddKGI4r9JhdqqzzTdyuptHzd9dd
 ZLEMvNs7q3oXKgwfzMK6HscZ4Ew+h7vMTB3ZoFMLefpAuxRwcq8qK/7dYWk3OYYP4fH0
 W/xQ==
X-Gm-Message-State: AOJu0Yww3VVHjoviNX/9cIdSK6rMtjwY3d2SdXhzigcEqJHi6LaAbFJe
 PwFd4KUYGmeIaVGNZCNkQvtpMxfxP8tTlX9455JJTw02Lan8E13trLebZjdj
X-Gm-Gg: ASbGncutcNUqn9XLMbz1QwALNVXMINLxIqXp8s0Mu6So530Spby6IEY6q4oML3IR/0N
 MxWWeBR0nkcMhOKgAoJeGPgO43qhecplZKYFlQ2Anp8qfV4suW2swSDrBynxhUbSUdD1FidU8Wu
 2iu+aKgdDYSsgDz5zUY46p2d09sHjwrNeg63p5VeZKnI8Ja7/WB3dhyOEcjrCZk8exLmC6F18ul
 hheWQyCpQk9FRDmRwTY+mYBu3nMX5836W3nKMRvZedjABi3LD2524/wlVPyrZJQeHSyNhQJIE5Y
 Ke/qtDfG8Hgzq8IqoIOEyvDiuqNhAMkJ6ZK91YhfEw39CplL61mX8r8Nk/PKlAJ1yH6J/CpHfVi
 71w3UsM8gBgNxblPFo03loMbY+eUE4DLMgpBnbPQgqxgqLJcVKfTTXHk=
X-Google-Smtp-Source: AGHT+IHENT8uzxfeOn46xAb8RhFbQD/Pe43YGzPlobku1xEsyLmjzsNPiPizkaT9vFTPK0/Hq6x+9A==
X-Received: by 2002:a17:907:6d15:b0:ab6:f688:dae5 with SMTP id
 a640c23a62f3a-ab6f688e0a0mr488030266b.36.1738343211030; 
 Fri, 31 Jan 2025 09:06:51 -0800 (PST)
Received: from saeedkazemi-ThinkPad.dynamic.ziggo.nl
 (2001-1c00-0b8e-2100-a983-d10d-b482-34c3.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:b8e:2100:a983:d10d:b482:34c3])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dc724d9de2sm3161323a12.81.2025.01.31.09.06.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jan 2025 09:06:50 -0800 (PST)
From: Saeed Kazemi <kazemi.ms@gmail.com>
To: buildroot@buildroot.org
Cc: Saeed Kazemi <kazemi.ms@gmail.com>
Date: Fri, 31 Jan 2025 18:06:48 +0100
Message-ID: <20250131170648.2429439-1-kazemi.ms@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738343213; x=1738948013; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sOeW1BKx47CnTc08z4qTLD/7U9V7rMYpxf79CqjOjto=;
 b=ZCKQBoPGe80OFJ+ri7LlWD/rA2K9r/2reuoOQmk+jQNTs4NWrkDUDuA8/VUg2Dwofk
 S3g3APp81QrkV+Emc/S/LXsWQRfydA1MuSfGQH+lOr1shGEfBnDFNj2zq/MQ5QQH7DOC
 ZZxkl1yY2ya5QkSjtx153Ly2mCrlEIed9G/hs9Dz3HTQDmwmOn3k8VxWg/PaTnqFpXyM
 1k9vlTS2ByFlH12sXrtttVMtgmZXDv24CLtKAR3uzajC0fK1NsHOMbxdF9fBaW/5Fs4V
 KO/lGMs+edrQOBmCxATD+TrVlR/N4BAU0uW4FeQtpCWKd3b52uWe9SLqC+xoQe6FpFJv
 RO/g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZCKQBoPG
Subject: [Buildroot] [PATCH 1/1] package/procs: bump to version 0.14.9
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

Release notes:
https://github.com/dalance/procs/releases/tag/v0.14.9

Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>
---
 package/procs/procs.hash | 2 +-
 package/procs/procs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/procs/procs.hash b/package/procs/procs.hash
index da6b4377e2..e795834358 100644
--- a/package/procs/procs.hash
+++ b/package/procs/procs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  86715967bd378a4c0330708e11714bda2c8ce9f757fb3006073238d77e83e6e1  procs-0.14.5-cargo2.tar.gz
+sha256  ac3306ea16d3def828b085678da114d49f2272bcc1362755c98b0958514910fe  procs-0.14.9-cargo2.tar.gz
 sha256  feb87a2e0c305de3464cc44077da5393c52d8ca6362d37427157d04ec6f4510d  LICENSE
diff --git a/package/procs/procs.mk b/package/procs/procs.mk
index 019e69a1de..b6ada48115 100644
--- a/package/procs/procs.mk
+++ b/package/procs/procs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROCS_VERSION = 0.14.5
+PROCS_VERSION = 0.14.9
 PROCS_SITE = $(call github,dalance,procs,v$(PROCS_VERSION))
 PROCS_LICENSE = MIT
 PROCS_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
