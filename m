Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70559C83F26
	for <buildroot@archiver.kernel.org>; Thu, 24 Jul 2025 12:06:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33102613A9;
	Thu, 24 Jul 2025 12:06:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TeOurLpGwJz4; Thu, 24 Jul 2025 12:06:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 959E461308
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 959E461308;
	Thu, 24 Jul 2025 12:06:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 11CFADA
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 12:06:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 035CE404AB
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 12:06:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XvO4r1Fl2y09 for <buildroot@buildroot.org>;
 Thu, 24 Jul 2025 12:06:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7608440460
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7608440460
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7608440460
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 12:06:44 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4561ca74829so9806355e9.0
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 05:06:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753358802; x=1753963602;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xwu0w5F1UKZ68xRthn7XF5GFogI0N5u3JWIwPsrDJh0=;
 b=qfZRjmQBNRax6xyT2el4X0LEDHtEKwR6MJ4ZOCGyYGhtZm6Xl56eFlExpghJraSmyp
 yyoOLUfrvXs7kiDNKcG30FPK5kY9gfifHnOYYQ03floVetopqg2SMuPoxoPEvfQtPWR/
 5nLj5szghUwC4wM13/+cka4wr6Bj7LER+EalP/496alARraN5ntpVgg+m5RsrGjBWfoE
 ZwB6OfUZkRaDpMoGHjrvk6ErwDbbbJxusx68J0mIWJUE850sG/hWzoewruGttxpDMQnP
 yIJOcEqLigcaH3827r/eYdzEv/1U4nCppBUKRWpoiK6zZ/Qov6RmtZZatK5biO9AbjtG
 ACSg==
X-Gm-Message-State: AOJu0YwSlcmgFTs8qA3YO0KFeLmhp/2lxY4SzB2cM+W1DQGXbuIZfIed
 8cvCKo16YSahU4CfB3cCUYcREZxMlb9XNDjTFp2uKa6/oGCIg/BR6M1THVHIMVTIquRQ5swhKuG
 qtHGI
X-Gm-Gg: ASbGnctaYrn11JW3iElf5PyeERAdDhf0rnz+q4VrZiNcaRqzIq6Y+3sLVreAOLJbOy0
 WxI03yY9xkyetmrS0JXlAqwsxoJkebX6ZijEWStAw0ETa2PhRN0KBZQSW4yxknwtABrXGkZekLU
 6uko2L/S3ADLOpNXdvMQLWOZ21anquhYmUhGXolsK8PUaAfkQMCxc9WPr4P5+7QgpWEiw/i/W5d
 5jEqXsPtBf8Xdf3V1fldpuEYRGblBKUvH1Eo1oNHMUwPBT8pweLzcwGfUvvDeZFbjYkkDKMl+4b
 S1ZXhJMWfF/CuoKi+PCcHrPioFMpE+0/aKf9rT6+VP1njD2khfNJUrKBsV5AMz5oU5FtpLPvNtS
 4v/yN7JXQl9Up8Zwt0jLwr6VFS281nsxX4tVyIgFYLRmQTOR47gTmXqiNYr3DzcFydTxVtOAtEI
 Vj07uFgcGCOpZuR38I
X-Google-Smtp-Source: AGHT+IHE5RLH7sYf8+kUfZX7sYAn10qvzd4cgW009qJo8SRsFY7DNeNAD7TVULqYlB1ApsfKGtDoig==
X-Received: by 2002:a05:600c:8719:b0:456:2ce8:b341 with SMTP id
 5b1f17b1804b1-45868d47860mr66646455e9.17.1753358802133; 
 Thu, 24 Jul 2025 05:06:42 -0700 (PDT)
Received: from P-NAN-ABRICOT..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458705378ffsm17956925e9.1.2025.07.24.05.06.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jul 2025 05:06:41 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 El Mehdi YOUNES <elmehdi.younes@smile.fr>
Date: Thu, 24 Jul 2025 14:06:04 +0200
Message-ID: <20250724120604.2992836-2-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250724120604.2992836-1-elmehdi.younes@smile.fr>
References: <20250724120604.2992836-1-elmehdi.younes@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1753358802; x=1753963602; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xwu0w5F1UKZ68xRthn7XF5GFogI0N5u3JWIwPsrDJh0=;
 b=byUNGEODtTkANZOXNUmyN/Lt5pTQsOOU3sZcqO0My/onesyHXDjtmRvtmBU/K4P4Ou
 TzCaqU3v6R3fLx5V8+SsUBYtkXe9jaM2+pCkG44ToGZYWwSCA94iXtjEFuF/319UC7rF
 FGKsxAsAt4PSANO17VfxvqTMCX3q0Q7M4k+pY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=byUNGEOD
Subject: [Buildroot] [PATCH 2/2] package/rust: Bump to version 1.88.0
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
From: El Mehdi YOUNES via buildroot <buildroot@buildroot.org>
Reply-To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Some fixes and stabilizations.
Changelog:
https://doc.rust-lang.org/beta/releases.html

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
---
 package/rust-bin/rust-bin.hash | 128 ++++++++++++++++-----------------
 package/rust-bin/rust-bin.mk   |   2 +-
 package/rust/rust.hash         |   4 +-
 package/rust/rust.mk           |   2 +-
 4 files changed, 68 insertions(+), 68 deletions(-)

diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
index ca7a4fe894..7f9d2f6339 100644
--- a/package/rust-bin/rust-bin.hash
+++ b/package/rust-bin/rust-bin.hash
@@ -1,70 +1,70 @@
 # Generated with utils/update-rust
 # Do not edit manually
 
-# From https://static.rust-lang.org/dist/rust-1.86.0-aarch64-unknown-linux-gnu.tar.xz.sha256
-sha256  2b97d1e09a1d7fdbed748332879318ee7f41c008837f87ccb44ec045df0a8a1b  rust-1.86.0-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.86.0-i686-unknown-linux-gnu.tar.xz.sha256
-sha256  70eab6af09396f59f353a40adb5e89a830ec2f94f4374147f5132e79d031d433  rust-1.86.0-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.86.0-powerpc-unknown-linux-gnu.tar.xz.sha256
-sha256  5ab6bf190015adfdc119d66dbd410af8e2e7421d6240c9005926d4b0004ae8c4  rust-1.86.0-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.86.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
-sha256  b6a176174ea3090255113db93709a900cbc92541b533fa99a5a3cb1d24b5ba6c  rust-1.86.0-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.86.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-sha256  dffcf10fd9d24af8c6f40ba0cf6d013c92b833ce512e5555f2e91c914c32d44b  rust-1.86.0-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.86.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
-sha256  bd968612d77de0d2bb4ec4d33f4aa105c5cdc44eca8deabfe2d8cae2a0ffbe18  rust-1.86.0-riscv64gc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.86.0-s390x-unknown-linux-gnu.tar.xz.sha256
-sha256  15a21fbfe91ade94f838b7dc58dbaf4c767c7513b4c990c5b183f4ea6a0b8578  rust-1.86.0-s390x-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.86.0-x86_64-unknown-linux-gnu.tar.xz.sha256
-sha256  6b448b3669e0c74f7f4b87da7da4868a552fcbba1f955032d8925ad2fffb3798  rust-1.86.0-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.86.0-aarch64-unknown-linux-gnu.tar.xz.sha256
-sha256  176129577a5d560bbd94bcd2d24c0228bb495b73219df02556b4e4b4f0815bf7  rust-std-1.86.0-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.86.0-aarch64-unknown-linux-musl.tar.xz.sha256
-sha256  4ce6d1e5ec3678311e08d3104e61266ac4a129bbef8d3083fe6cda7d92934e58  rust-std-1.86.0-aarch64-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.86.0-arm-unknown-linux-gnueabi.tar.xz.sha256
-sha256  36302b48c1029eed9b7c787fdd90a98c96dfb40e52b5b6f9b644017ae87e83a8  rust-std-1.86.0-arm-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.86.0-arm-unknown-linux-gnueabihf.tar.xz.sha256
-sha256  71a3fd8a5c028e34791740ca15b59cc946a052c4e41403f39e1743f298aaa508  rust-std-1.86.0-arm-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.86.0-arm-unknown-linux-musleabi.tar.xz.sha256
-sha256  f85daf11938d4d61fa3a980e36246fd9e318d13007a7e3d461688445ebe3bd23  rust-std-1.86.0-arm-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.86.0-arm-unknown-linux-musleabihf.tar.xz.sha256
-sha256  a8231a8fc8fea7ee96dc0552432530d680b5fc7393917a74c093609b375bee04  rust-std-1.86.0-arm-unknown-linux-musleabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.86.0-armv5te-unknown-linux-gnueabi.tar.xz.sha256
-sha256  f12e8fd2389fdc6a6acba8320cc15e0bf30a51bd66ba7303e6b724202d6c57b6  rust-std-1.86.0-armv5te-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.86.0-armv5te-unknown-linux-musleabi.tar.xz.sha256
-sha256  4838aaa8c5e338cd1ee15c62febdebdb4672c0b3b0d98ce81b379053d813af02  rust-std-1.86.0-armv5te-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.86.0-armv7-unknown-linux-gnueabi.tar.xz.sha256
-sha256  bf753cb00272a98ab25bda042e3bfcc157f76f45c2cd07161e362a158db41530  rust-std-1.86.0-armv7-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.86.0-armv7-unknown-linux-gnueabihf.tar.xz.sha256
-sha256  5084c9fd40090dd19d9c77e7a892d48497ad748b9a77afc4643da2dae30bd968  rust-std-1.86.0-armv7-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.86.0-armv7-unknown-linux-musleabi.tar.xz.sha256
-sha256  27288495c6eb9a7b61af63d9ccdbee1a512623cf578336063df0eb6f101d5ee6  rust-std-1.86.0-armv7-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.86.0-armv7-unknown-linux-musleabihf.tar.xz.sha256
-sha256  474195b8051708b0729d73402e8f9049a84e8a97c095f844a350451db9853a2e  rust-std-1.86.0-armv7-unknown-linux-musleabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.86.0-i586-unknown-linux-gnu.tar.xz.sha256
-sha256  f0bddc6dba7d719b8ba131bcd634a8379e00fc825a51c0f17abf424c9cb5c052  rust-std-1.86.0-i586-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.86.0-i586-unknown-linux-musl.tar.xz.sha256
-sha256  fcba310580f7a94639a72dc238d9849ebf5de6be79217b0eb2c9649f456ee3b8  rust-std-1.86.0-i586-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.86.0-i686-unknown-linux-gnu.tar.xz.sha256
-sha256  ce9f0fa4b0760730e26bf315cebe099f0b883436e095c5fc4b94ba20bd9f121a  rust-std-1.86.0-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.86.0-i686-unknown-linux-musl.tar.xz.sha256
-sha256  ba8ab486cb183fd91d29b49db3cacc67198534587c4bf70d4e65e62e2edff001  rust-std-1.86.0-i686-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.86.0-powerpc-unknown-linux-gnu.tar.xz.sha256
-sha256  e5ed58a861619bcc89fc3f969174c84fd6ed8a26b5d4b196f06efb868653c1c1  rust-std-1.86.0-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.86.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
-sha256  06538b41a9351c449d215498d4ec2f072f728bd18df8fac7ef8534a0d0f34e27  rust-std-1.86.0-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.86.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-sha256  fcf940c0553a04cb9bd85cce524729c2f54b000b554fee95c7aa218d608b7e3d  rust-std-1.86.0-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.86.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
-sha256  b28b9c2f183521a204f2899610253c11c86ee4aa903fe66d8410dfaa22c926e6  rust-std-1.86.0-riscv64gc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.86.0-s390x-unknown-linux-gnu.tar.xz.sha256
-sha256  3919f6962d0aefdd2cd75d8dba749ed826936065b64c9a8d54d1d85c2685fd66  rust-std-1.86.0-s390x-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.86.0-sparc64-unknown-linux-gnu.tar.xz.sha256
-sha256  722238ae13e6e101d1b698d2b3a7915d59bb7f485b594e8d833cce8b9460383b  rust-std-1.86.0-sparc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.86.0-x86_64-unknown-linux-gnu.tar.xz.sha256
-sha256  67be7184ea388d8ce0feaf7fdea46f1775cfc2970930264343b3089898501d37  rust-std-1.86.0-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.86.0-x86_64-unknown-linux-musl.tar.xz.sha256
-sha256  8313c108da105181d27a5a0190ab46d1ac5b3e32bb5b2e7e0a41b7b5d353cba6  rust-std-1.86.0-x86_64-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.88.0-aarch64-unknown-linux-gnu.tar.xz.sha256
+sha256  d5decc46123eb888f809f2ee3b118d13586a37ffad38afaefe56aa7139481d34  rust-1.88.0-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.88.0-i686-unknown-linux-gnu.tar.xz.sha256
+sha256  1f28a28b025ab2637f479f7f239c391a83319dcb89c53819c5a828fe4f92616a  rust-1.88.0-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.88.0-powerpc-unknown-linux-gnu.tar.xz.sha256
+sha256  e685d4a1d4d616fbf2accf13f29f3dfa431e62b49125499677a7c0954afd216e  rust-1.88.0-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.88.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
+sha256  a06706c8e76dcdd652b74d8737d4d99c20991068520bca86712d3e6d94d141e5  rust-1.88.0-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.88.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+sha256  4e429d0c390032e556cea9a5729b8abc035aa421a1ad3ac232b63308705c14bb  rust-1.88.0-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.88.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
+sha256  3021ad1c6f5c5d177546f9890acaac105fbfc211bfd4b11fc06156f85112df09  rust-1.88.0-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.88.0-s390x-unknown-linux-gnu.tar.xz.sha256
+sha256  96f49ff456bd5649f19f2165864f5588d1bb1f533b9da8b4e3c7b65d61b28a7f  rust-1.88.0-s390x-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.88.0-x86_64-unknown-linux-gnu.tar.xz.sha256
+sha256  7b5437c1d18a174faae253a18eac22c32288dccfc09ff78d5ee99b7467e21bca  rust-1.88.0-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.88.0-aarch64-unknown-linux-gnu.tar.xz.sha256
+sha256  e9ac4ff3c87247a2195fcceddbf1bdeee5c4fd337f014d8f4c4e3ac99002021f  rust-std-1.88.0-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.88.0-aarch64-unknown-linux-musl.tar.xz.sha256
+sha256  b1562ce0836d5071abbbeaf52e3db9ce0d37fa432f5202b8f661aa4881b4c3e4  rust-std-1.88.0-aarch64-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.88.0-arm-unknown-linux-gnueabi.tar.xz.sha256
+sha256  598e389223ebef13efe6ef8d4dc11da3427c3716f21fd089b9ec5afbec1bb900  rust-std-1.88.0-arm-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.88.0-arm-unknown-linux-gnueabihf.tar.xz.sha256
+sha256  b5e1f168fa02ad57e1ace9ac3d379a9c95f816a26f12156216521a22e192f123  rust-std-1.88.0-arm-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.88.0-arm-unknown-linux-musleabi.tar.xz.sha256
+sha256  89190b0de686052ff76418f67efa25ca83430f112737c2625d2911d0839cf9fc  rust-std-1.88.0-arm-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.88.0-arm-unknown-linux-musleabihf.tar.xz.sha256
+sha256  5aa9d94539b8e5dc02454ca5605c420d7e96c74e62ec53889cc27d2744edef95  rust-std-1.88.0-arm-unknown-linux-musleabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.88.0-armv5te-unknown-linux-gnueabi.tar.xz.sha256
+sha256  37b77f0e226f291f42d02c4d3011d53a4bde67fc4b49ae205fde80cd50b55d8a  rust-std-1.88.0-armv5te-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.88.0-armv5te-unknown-linux-musleabi.tar.xz.sha256
+sha256  fe75a39a140e5ab430d17d6aed2b93b5c17735ece4c578629f5210d43512d6b6  rust-std-1.88.0-armv5te-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.88.0-armv7-unknown-linux-gnueabi.tar.xz.sha256
+sha256  60ee3766f67d6404f8c9e77090c57c21fef7eca540ec0ab2f2cd2b28a21dca37  rust-std-1.88.0-armv7-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.88.0-armv7-unknown-linux-gnueabihf.tar.xz.sha256
+sha256  f9e13ca81872019186a67c44919c017b1bfa80c1e2784caee81ab1f65f548b5b  rust-std-1.88.0-armv7-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.88.0-armv7-unknown-linux-musleabi.tar.xz.sha256
+sha256  822c8dc77c50eaf4786c42b9004daf3aa05472b3247d11c02caf8bc1d408d67f  rust-std-1.88.0-armv7-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.88.0-armv7-unknown-linux-musleabihf.tar.xz.sha256
+sha256  fd6684c2454c2859209e1f9791d4f7bd5be4e75f599276220ba8814f94f331cb  rust-std-1.88.0-armv7-unknown-linux-musleabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.88.0-i586-unknown-linux-gnu.tar.xz.sha256
+sha256  7c9016ce85e24dde9d76c0a34061fa0fd6f742ea495dd1784804b60061b39627  rust-std-1.88.0-i586-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.88.0-i586-unknown-linux-musl.tar.xz.sha256
+sha256  ab409bb848d7109005857e14cd200f5a07479b3c6b8c7fdda9325af61672a273  rust-std-1.88.0-i586-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.88.0-i686-unknown-linux-gnu.tar.xz.sha256
+sha256  ced56f7ab86496f6eb42d356841f9d0b625159eba65afd1913f232bb66d4b7e0  rust-std-1.88.0-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.88.0-i686-unknown-linux-musl.tar.xz.sha256
+sha256  dcd1ef607728bcc73bcd70341094a6fcaa1dbbfb01cfc48505c0e93b62394eb8  rust-std-1.88.0-i686-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.88.0-powerpc-unknown-linux-gnu.tar.xz.sha256
+sha256  891fe38736ca637bcd776f6d2b1822d761bd92305188482e45d26ab0dd84344b  rust-std-1.88.0-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.88.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
+sha256  89cf8b30e0fae601e0603e41d5eaf58881729208cac83636eff89b94724b7112  rust-std-1.88.0-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.88.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+sha256  1030e71f755692c3429bb16829cca776c1ac372abbce3001b04d4e46b1e4f32f  rust-std-1.88.0-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.88.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
+sha256  d446fc0d8e4ce985c2d21aa2adb6ec9fce8f7ebde85655200abd71e142b9a981  rust-std-1.88.0-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.88.0-s390x-unknown-linux-gnu.tar.xz.sha256
+sha256  df3144f87a22d606abea4dcfe88369fcd499ef2fc748724b47941308ae259a5d  rust-std-1.88.0-s390x-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.88.0-sparc64-unknown-linux-gnu.tar.xz.sha256
+sha256  95be6d0dec8be07fa13313a10dd177e72df9737660c235a3e673bffcdd2e9068  rust-std-1.88.0-sparc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.88.0-x86_64-unknown-linux-gnu.tar.xz.sha256
+sha256  36d7eacf46bd5199cb433e49a9ed9c9b380d82f8a0ebc05e89b43b51c070c955  rust-std-1.88.0-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.88.0-x86_64-unknown-linux-musl.tar.xz.sha256
+sha256  0c42b63c18a6343851e0f27aeb5cff73146c86fc95bc4e2bf51b726c4311249e  rust-std-1.88.0-x86_64-unknown-linux-musl.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  b71bd43a069ca0641a9ecfe585ca7b3c53b5cc1608f8b68321168698e28b5ea1  LICENSE-MIT
diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
index 989fbdef32..215bd84ad3 100644
--- a/package/rust-bin/rust-bin.mk
+++ b/package/rust-bin/rust-bin.mk
@@ -6,7 +6,7 @@
 
 # When updating this version, check whether support/download/cargo-post-process
 # still generates the same archives.
-RUST_BIN_VERSION = 1.86.0
+RUST_BIN_VERSION = 1.88.0
 RUST_BIN_SITE = https://static.rust-lang.org/dist
 RUST_BIN_LICENSE = Apache-2.0 or MIT
 RUST_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
diff --git a/package/rust/rust.hash b/package/rust/rust.hash
index 314d1aff5e..7b22bb8c94 100644
--- a/package/rust/rust.hash
+++ b/package/rust/rust.hash
@@ -1,8 +1,8 @@
 # Generated with utils/update-rust
 # Do not edit manually
 
-# From https://static.rust-lang.org/dist/rustc-1.86.0-src.tar.xz.sha256
-sha256  d939eada065dc827a9d4dbb55bd48533ad14c16e7f0a42e70147029c82a7707b  rustc-1.86.0-src.tar.xz
+# From https://static.rust-lang.org/dist/rustc-1.88.0-src.tar.xz.sha256
+sha256  0c1dcbb4f762513d021e1a282c0ac58c0a423642b3a6bf581cafb5414df4193e  rustc-1.88.0-src.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  b71bd43a069ca0641a9ecfe585ca7b3c53b5cc1608f8b68321168698e28b5ea1  LICENSE-MIT
diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index 7f6f2ebc17..22f3ca1455 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -6,7 +6,7 @@
 
 # When updating this version, check whether support/download/cargo-post-process
 # still generates the same archives.
-RUST_VERSION = 1.86.0
+RUST_VERSION = 1.88.0
 RUST_SOURCE = rustc-$(RUST_VERSION)-src.tar.xz
 RUST_SITE = https://static.rust-lang.org/dist
 RUST_LICENSE = Apache-2.0 or MIT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
