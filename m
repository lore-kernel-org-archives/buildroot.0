Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F11C4345F
	for <buildroot@archiver.kernel.org>; Sat, 27 Apr 2024 18:38:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F14A6606DC;
	Sat, 27 Apr 2024 18:38:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y7_qMxDwXgOu; Sat, 27 Apr 2024 18:38:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDA23607D8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDA23607D8;
	Sat, 27 Apr 2024 18:38:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 673E41BF3C1
 for <buildroot@lists.busybox.net>; Sat, 27 Apr 2024 18:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 54135414C9
 for <buildroot@lists.busybox.net>; Sat, 27 Apr 2024 18:38:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l0oN0RSSoVjR for <buildroot@lists.busybox.net>;
 Sat, 27 Apr 2024 18:38:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2E6AC40771
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E6AC40771
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2E6AC40771
 for <buildroot@buildroot.org>; Sat, 27 Apr 2024 18:38:11 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-41a1d2a7b81so23714045e9.0
 for <buildroot@buildroot.org>; Sat, 27 Apr 2024 11:38:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714243089; x=1714847889;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=opM4GsfBHmp66auy8rCijPkmvwsWKbdWjoBLvyCKWlg=;
 b=VrfWI0QPwo8V/sNZ0gfsrLDXIqrvTJtTvt9SYiRiM37ywfTYdfBDcQsSvnmAVN4dOw
 4QRWB9MP+oQ4yxXUgRC7lUb+YOgbKAcjwlbj5eusVkiWDFr0uR9MwmHuhLjTQbbLSugA
 RbUhNZQcJAevJH52T2f3SuX3m4LI+IK1ujprLB9nMuEQMml+eYidkbq/ixLSY8TobgQE
 Msndi5Q0swSH3caaIaiyaPe1q3Yy26qk1wLzPXqUADdaYzxuec1aqCugrIUkXp4VXy0Z
 gfVeCQVbxb/p3ilyaw6OZuDIgI5/NV0pNt2tZXV7eZP35NjeHj82LYnawXvVh7cmkcqd
 lqrg==
X-Gm-Message-State: AOJu0Yw1Ra1eiCXxRPthk7h4TKJ6KFrMEO/cAN2JLtLZ9A+Va5r6NMgZ
 6K8BlAQ/sOSE6MWWLyqihW8WvwgaAU90rj3rGftAPl+fDgPYd3EQU+4aDg==
X-Google-Smtp-Source: AGHT+IEcK3EmeMO3PaqrJTq3MiktUdSvg7H9yIJXvlG0W7xsqPIT/r34G+wDprnK0dJ4mve1y54sKw==
X-Received: by 2002:a05:6000:237:b0:34c:5f07:45b1 with SMTP id
 l23-20020a056000023700b0034c5f0745b1mr4916022wrz.25.1714243089230; 
 Sat, 27 Apr 2024 11:38:09 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 k21-20020adfb355000000b0034c6b368aecsm4136589wrd.26.2024.04.27.11.38.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Apr 2024 11:38:09 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 27 Apr 2024 20:38:01 +0200
Message-ID: <deae1dd16e9b9ec1a1843467cfac5aeda237db32.1714243078.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1714243078.git.yann.morin.1998@free.fr>
References: <cover.1714243078.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714243089; x=1714847889; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=opM4GsfBHmp66auy8rCijPkmvwsWKbdWjoBLvyCKWlg=;
 b=eQx8Wqb8DJHms3TgtjhC9Q5fBRzbLeA4cV9dwKODDOsqsSGZnJXOmerIlBvYfRyWav
 H+mali32XEbNtCmtYBpt6/vp3xk8Ld5+McqMeOYFBbYstr01xGjtIk+phFQhx23yt2cI
 8hwkhXn7o9LMUfirkb9r4sepT/plf9KC27fnDy6J5VM4LcDrpiIXOjtqi+hKYQRyxgxz
 WwyahzjhiCxI2bszRFmII0dv6HAGukO/tPVlujqoKPWFySGSV+IL9nZRob2ug6cAdXDZ
 F7Q498G2wjE3KeD/QHtrQr9p7sTCg7ENgXNR99pIIeGF54GFiCQ8HhK+z5c4cSRuS9aM
 TzPg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=eQx8Wqb8
Subject: [Buildroot] [PATCH 14/15 v2] board: update hashes of git archives
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 board/radxa/rock5b/patches/linux/linux.hash        | 2 +-
 board/toradex/apalis-imx6/patches/linux/linux.hash | 2 +-
 board/toradex/apalis-imx6/patches/uboot/uboot.hash | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/board/radxa/rock5b/patches/linux/linux.hash b/board/radxa/rock5b/patches/linux/linux.hash
index 8797d29f68..18074c0aee 100644
--- a/board/radxa/rock5b/patches/linux/linux.hash
+++ b/board/radxa/rock5b/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  a5eca7b8f929a1918125e2e4fbd7ab4ea5b3910b5ae4547e81c794b47373ffb5  linux-52f51a2b5ba178f331af62260d2da86d7472c14b-br2.tar.gz
+sha256  255961f7ea8ea82c42f19be049f94a690f9cb171fe8562ea87868ac5cabc3eb9  linux-52f51a2b5ba178f331af62260d2da86d7472c14b-git3.tar.gz
diff --git a/board/toradex/apalis-imx6/patches/linux/linux.hash b/board/toradex/apalis-imx6/patches/linux/linux.hash
index ff2b1ea287..277abc20aa 100644
--- a/board/toradex/apalis-imx6/patches/linux/linux.hash
+++ b/board/toradex/apalis-imx6/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  9c69a1c283db6ee8042cc6f013a159473f257e71751887312c7dd2902f01bec8  linux-d899927728beca8357a5b4120b690cb3c1d80844-br2.tar.gz
+sha256  41551a4f44bdfe18f68bedc0fd9c644d8657d2ee63215cc348a708cfd5b7e6f2  linux-d899927728beca8357a5b4120b690cb3c1d80844-git3.tar.gz
diff --git a/board/toradex/apalis-imx6/patches/uboot/uboot.hash b/board/toradex/apalis-imx6/patches/uboot/uboot.hash
index 80cad35849..d451219cb4 100644
--- a/board/toradex/apalis-imx6/patches/uboot/uboot.hash
+++ b/board/toradex/apalis-imx6/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  9a540b08ccb7e8a0252f86d0bad5d676d0964725a7f2a06d798225c2a3024878  uboot-30a1208727729dae22cb42f9ba9ba17efe5e6f77-br2.tar.gz
+sha256  2fa23d10559c17362ef92e5d7e636b388e9af3784c9b03e86c702a71df100f36  uboot-30a1208727729dae22cb42f9ba9ba17efe5e6f77-git3.tar.gz
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
