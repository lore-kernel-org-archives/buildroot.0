Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32742CEB2FA
	for <buildroot@archiver.kernel.org>; Sat, 15 Nov 2025 18:21:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D149D8400C;
	Sat, 15 Nov 2025 18:21:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vJabh1vn7s7n; Sat, 15 Nov 2025 18:21:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9205083EBD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9205083EBD;
	Sat, 15 Nov 2025 18:21:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B348D158
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 18:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 99EA560A4C
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 18:21:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nzy_kYs329eu for <buildroot@buildroot.org>;
 Sat, 15 Nov 2025 18:21:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E46C660A42
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E46C660A42
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E46C660A42
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 18:21:24 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-640860f97b5so4891896a12.2
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 10:21:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763230882; x=1763835682;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3k0xeXbdmvirDjvJdowTJJEND98jD8pQXKS+MrkeEnw=;
 b=BkzcJD2wflj2viIp6De4Se2GLYjmbW+xmJH4YE0xI1+8Xl7jephpIRO7YqPQog/itG
 YcBulaxKKxARvgs5Z2OpGb1HWUgbdUBWjUGScAQVbrs8j9gZLFWbK7Th8rhD155qj2DG
 vvrvTi+nayptRrJkIetWmEESXa6zfTly4YAnLEYBvumvHl6jWxEGqEGX9F5ay1CPfrGr
 nzVCYp+qbJRIMcF/SZKPalbtmvn7Ovr6uHqBapY8o9eDrFVriWzF7+023KHReFo/Nvia
 +iEHLdIV0KEVl5LYkKj08xtg0BBg8p24RFFdaB/hiupbwp0BWPQRL0nGwGAF+fBefQIt
 rg+A==
X-Gm-Message-State: AOJu0Yxp4d5CGBEKSFW+ieMc8Y3p2hKXwKhEEto0y6+kqTe/Z6LH6Hgn
 uJPoj12H5vu0N1QzOzj6oF3DkXG7gFwvyX24DMDrO+ZXanl9P2T9N1dkUA2GPxZsLkj1VE4yyYO
 G8i8h
X-Gm-Gg: ASbGncvogzF1JrXLxLRg7p+WAS+r3MmtJBneU+zObeR822GHaPFA6VfvBvAnyegsfGL
 jtM6JUynho8Wlbl80pcnB6UJDWA6RKTWqoelYiDD4aj3umuKkWjmgNdsQoF0+q+oajNPuXKV2Ny
 m4ZyENh51wwc/p77G1F3XWNQtREts01p1evIhS8Rmy363kLCWrmW7C0dw8FOirGwQtmJagp5K3R
 Nbj8in0Ugyj7ZCuoCch/oH7zHtflk/P7RtYDqAaheDWrxEp/dPVd5fyOLTBnwYDk6RbOYEYfTCj
 6kVZzW9EPg/vB6hs2QmeXxwBnpU9IYcC3DHF6F39ffonM4UexyhRuoFz7+AX74vtn0ownSVBGuF
 rPBfrI3rPZNHikrmmu8lxcupyPA7yLd/HrHs4ecJbK7RuCkadipd/0LlTLET0k28VEgmNf2Kw+h
 Ap8JNL9XFaczl/NggY/ysWbLyUGvoOSVwy0fN1lLintr2VytpDSXJiGMgb/6KZASRuBcdz7kMRb
 UCjISLb8HRWs1+xTwb50VTGOm3wNIUU7Z6P7KqXK7+8guD9+sbYgH4=
X-Google-Smtp-Source: AGHT+IF2pk90OZXL8IpshsGsfHeIzH6X2XCKbmBwYGP1CuGSFal7i6UIEfLn2bg6bwN+GcjElSdsMQ==
X-Received: by 2002:a05:6402:2806:b0:643:5f45:6fa5 with SMTP id
 4fb4d7f45d1cf-6435f457518mr4664885a12.33.1763230880045; 
 Sat, 15 Nov 2025 10:21:20 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-54-71-163.retail.telecomitalia.it. [79.54.71.163])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a4c5834sm6088324a12.33.2025.11.15.10.21.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Nov 2025 10:21:18 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sat, 15 Nov 2025 19:21:08 +0100
Message-ID: <20251115182110.464345-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251115182110.464345-1-dario.binacchi@amarulasolutions.com>
References: <20251115182110.464345-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1763230882; x=1763835682;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3k0xeXbdmvirDjvJdowTJJEND98jD8pQXKS+MrkeEnw=;
 b=VS4BjsOEwjskx6Qg31+9M/PElEEPsw3qFiG/80maAR6TTbskW20gaHW7gMKEPj3/IJ
 GcVSgdcnKNAGV/W02k35UzQurp6WeCy7gsbaKVArmdbBkdYNyicnHg8KDDgqsLcGlHIY
 UFvMePodBuXlB8i3Kxqm1WqbyhSH3fGgLqoR4=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=VS4BjsOE
Subject: [Buildroot] [PATCH 2/4] package/libyang: bump to version 3.13.6
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

License file changed due to copyright year change:

-Copyright (c) 2015-2024, CESNET
-Copyright (c) 2015 - 2025, CESNET

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/libyang/libyang.hash | 4 ++--
 package/libyang/libyang.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libyang/libyang.hash b/package/libyang/libyang.hash
index 169dbb5485d5..c6bf66169dda 100644
--- a/package/libyang/libyang.hash
+++ b/package/libyang/libyang.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a2ae94ce43d8b4b084f67c05902f97cbc0ec882d38ef5ddf1d601659f64d5c66  libyang-3.12.2.tar.gz
-sha256  f4fbaa09c8b2faa6a873a38181ff860e2ff90808320f71deb369f03ddfb920da  LICENSE
+sha256  5cd5018f39c830f97d70616c003990287ce5e820ae2792763a49e2a1f63af8d6  libyang-3.13.6.tar.gz
+sha256  9fe5fa94b97504d1bc32b4221cc3d32a2bd10b2086583b980ce36a3207a88eab  LICENSE
diff --git a/package/libyang/libyang.mk b/package/libyang/libyang.mk
index 94f9ba3b8a95..6f82397eb082 100644
--- a/package/libyang/libyang.mk
+++ b/package/libyang/libyang.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBYANG_VERSION = 3.12.2
+LIBYANG_VERSION = 3.13.6
 LIBYANG_SITE = $(call github,CESNET,libyang,v$(LIBYANG_VERSION))
 LIBYANG_LICENSE = BSD-3-Clause
 LIBYANG_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
