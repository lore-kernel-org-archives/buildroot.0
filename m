Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D2EE6FE49
	for <buildroot@archiver.kernel.org>; Sun,  8 Sep 2024 18:29:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0745880D9C;
	Sun,  8 Sep 2024 18:29:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dFSlTJDmz-Al; Sun,  8 Sep 2024 18:29:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12BDF80DA0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12BDF80DA0;
	Sun,  8 Sep 2024 18:29:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0B3E21BF3D7
 for <buildroot@lists.busybox.net>; Sun,  8 Sep 2024 18:29:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0544940338
 for <buildroot@lists.busybox.net>; Sun,  8 Sep 2024 18:29:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UFwU6ajtCDen for <buildroot@lists.busybox.net>;
 Sun,  8 Sep 2024 18:29:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 85B3A40336
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85B3A40336
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 85B3A40336
 for <buildroot@buildroot.org>; Sun,  8 Sep 2024 18:29:05 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a7a9cf7d3f3so458781666b.1
 for <buildroot@buildroot.org>; Sun, 08 Sep 2024 11:29:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725820143; x=1726424943;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+2xn5wYnVx3NquaYbRElaz17iHt2ptAF/g4PwXvS+iE=;
 b=rTahp4EV2jRvfNvKBnIntYh7nIbUaQKSv8Zh1tblcuB9LLu6DdqkmgkZGcf8QecxWO
 OsUGc1MdJcHGg+dPfWpFba925oJ0lCGlXn7VwInW9iVn0lm52TZ7ABH2A83LKUB164Qw
 BL/jhWSeRDkrCqtLfOBmtmOoobuscW14TAxegROWCcuDA9L1clwjED7whIwDWsnn6Vbq
 ltYj9xc5grFLzwNqxZMkgzpcQUhbtyX72+/pM2Z2SFBkZjEKLld+2g4p2q8MDysXLbpx
 JfKSfSjZ61vobUJuDX25+AbR7hu/2obGbwcdoYbS8G1h6UmtgJJA12SPrqOptvZWILPn
 DunA==
X-Gm-Message-State: AOJu0Yw87aCqRTpXP780MgkKLPiFr8eHti2uBb6rapu4Vc3RM2QqHFsA
 U6BuPSTsfOTr+//QdkudiXhC6QwEHeLVslMEvvn8+imJSmgeJlK44nyVUu3YKIPN7G4tSC69lLc
 cJ3c=
X-Google-Smtp-Source: AGHT+IG1VFwJdvIt4NYUQlwbdWza9iLtCH0kSYl5eoVYrGKmeLoaHCJc3qd0BVP8LqX4st/9qQc4zw==
X-Received: by 2002:a17:907:782:b0:a7a:acae:3415 with SMTP id
 a640c23a62f3a-a8a885c3a7bmr666547266b.10.1725820142812; 
 Sun, 08 Sep 2024 11:29:02 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-4-102-18.retail.telecomitalia.it. [87.4.102.18])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25d5ddc0sm232447366b.188.2024.09.08.11.29.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Sep 2024 11:29:02 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun,  8 Sep 2024 20:28:56 +0200
Message-ID: <20240908182856.422176-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1725820143; x=1726424943;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+2xn5wYnVx3NquaYbRElaz17iHt2ptAF/g4PwXvS+iE=;
 b=d5zc9/IgkbAsiJnW17jGGc8GM2apDgcf0B7aTpx8EjlhOquYwZuwlRVHYFceGylnuz
 /psEvMg2C62hmJop9ITG7rBCyVN75Pj2uBUBm2Psr5AvlnjFdVyUpA87IPTozScLLhnU
 KWaHE4FGCMxhib+t3hj1FW8JuMJhgF6SFOMvM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=d5zc9/Ig
Subject: [Buildroot] [PATCH 1/1] package/xenomai: fixup download URL
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
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As reported in [1], https://xenomai.org/downloads/xenomai/stable has
been moved to https://ftp.denx.de/pub/xenomai/xenomai/stable.

Fixes:
- http://autobuild.buildroot.org/results/83061154a9c21ecf981fdf5b4c02be6a793a8e56

[1] https://lore.kernel.org/xenomai/95d4f7a6-1237-4ae0-9fb6-3979fa058bcc@siemens.com

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/xenomai/xenomai.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index 9356919259ba..378e51ad3e26 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -14,7 +14,7 @@ XENOMAI_SITE = $(call qstrip,$(BR2_PACKAGE_XENOMAI_REPOSITORY))
 XENOMAI_SITE_METHOD = git
 else
 XENOMAI_SOURCE = xenomai-$(XENOMAI_VERSION).tar.bz2
-XENOMAI_SITE = http://xenomai.org/downloads/xenomai/stable
+XENOMAI_SITE = https://ftp.denx.de/pub/xenomai/xenomai/stable
 endif
 # We're patching configure.ac
 XENOMAI_AUTORECONF = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
