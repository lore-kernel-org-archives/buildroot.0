Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E029C25B77
	for <buildroot@archiver.kernel.org>; Thu, 16 May 2024 15:52:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2E3E8382F;
	Thu, 16 May 2024 15:52:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r9jj_-uFzj5B; Thu, 16 May 2024 15:52:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C770583843
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C770583843;
	Thu, 16 May 2024 15:52:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D42BB1BF5AA
 for <buildroot@lists.busybox.net>; Thu, 16 May 2024 15:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C02BD60E89
 for <buildroot@lists.busybox.net>; Thu, 16 May 2024 15:52:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cwWDBhNFUoXo for <buildroot@lists.busybox.net>;
 Thu, 16 May 2024 15:52:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 66CFA60E4E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66CFA60E4E
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 66CFA60E4E
 for <buildroot@buildroot.org>; Thu, 16 May 2024 15:52:24 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-51f4d2676d1so1268143e87.3
 for <buildroot@buildroot.org>; Thu, 16 May 2024 08:52:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715874742; x=1716479542;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UwsFFEwoNu93+dJ4xjQfDIskzChGq6+5Q4aAmxttrMg=;
 b=kNOjoAM3EyVhpa4A8UhWF2MhVFjw2Vi+IHaLK3RxZa2H5fzFjFgDUq9o6wk0B4F5Ls
 43pmBUgRUQofYfcTXlSeRsSH9MlQEqFg9C+sOSOhInCt5/gEzEBtUMb8BDRcjkWz/us3
 Mbu6Yirm9lrnV7VhcD6kUsWV+ECz/hx9rSqXZfzxV9DeCAwfVQgycwy1xMjhMzDXEhum
 Der+xEy8eWh5dp1GTMnv8g/Rpo6umU8cufSPqHxWyQDMJvajU5lhZHWUTkTB1CEpN9fc
 GlSabHJG/jiQdMci6gw9ScNUtHsQ+FVRyY6SJ3sxpag9FmeEEQ5hWSNmsaFgGQ6mRcpQ
 B/QQ==
X-Gm-Message-State: AOJu0YyHdPpHjsH0+p5U6fysguFnT+bcDgd4OtIPemGA2GW5/4wnrAkj
 vIzb9MsHsFi3yo6CJ/I5rLvlCO0PT1mX/9msKckZCRBK3QlGGsV+nV8MixZGe7AizHgM4FpkxRn
 whbE=
X-Google-Smtp-Source: AGHT+IEiMrkxpB9Z4gyH5LyKfbB9+oBXK5KfR3j4/CV3GuFkoo0w21B96aBtGPS4JTE/XUrkaFQE7g==
X-Received: by 2002:ac2:5a4a:0:b0:519:1e33:9d85 with SMTP id
 2adb3069b0e04-5220fd7ad22mr11072351e87.36.1715874742009; 
 Thu, 16 May 2024 08:52:22 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 ([2001:b07:6474:ebbf:50d1:852a:4cf2:7ce4])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4201592e5f3sm156852215e9.43.2024.05.16.08.52.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 May 2024 08:52:21 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 16 May 2024 17:52:12 +0200
Message-ID: <20240516155212.975737-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1715874742; x=1716479542;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UwsFFEwoNu93+dJ4xjQfDIskzChGq6+5Q4aAmxttrMg=;
 b=Ub8x/56cgYQNaPboaD1tLJCPksLStbmP7NzGgojH2YHorBvkq9Mde8JTQRfLKsSVih
 3MXURh6Mc68GHK1U1YptHqJQwGs0uCHtTEqjtF2DRg8bCRbFalGQ/kQTisoiFW3oz58z
 lwkCMYyjbpMSjHoCD9U7risAHra/eH4/PAN3A=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Ub8x/56c
Subject: [Buildroot] [PATCH 1/1] configs/qemu_sparc_ss10_defconfig: fix
 linux hash
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
Cc: Romain Naour <romain.naour@gmail.com>, michael@amarulasolutions.com,
 linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Dmitry Chestnykh <dm.chestnykh@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch fixes "make legal-info" for qemu_sparc_ss10 configuration:

>>> host-gcc-initial 13.2.0 Collecting legal info
COPYING: OK (sha256: 231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c)
COPYING3: OK (sha256: 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903)
COPYING.LIB: OK (sha256: a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861)
COPYING3.LIB: OK (sha256: a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c)
ERROR: No hash found for linux-6.8.6.tar.xz

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../qemu/sparc-ss10/patches/linux-headers/linux-headers.hash  | 1 +
 board/qemu/sparc-ss10/patches/linux/linux.hash                | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)
 create mode 120000 board/qemu/sparc-ss10/patches/linux-headers/linux-headers.hash

diff --git a/board/qemu/sparc-ss10/patches/linux-headers/linux-headers.hash b/board/qemu/sparc-ss10/patches/linux-headers/linux-headers.hash
new file mode 120000
index 000000000000..5808d92afe89
--- /dev/null
+++ b/board/qemu/sparc-ss10/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/qemu/sparc-ss10/patches/linux/linux.hash b/board/qemu/sparc-ss10/patches/linux/linux.hash
index 762f8575e7e7..9d0d5466ca17 100644
--- a/board/qemu/sparc-ss10/patches/linux/linux.hash
+++ b/board/qemu/sparc-ss10/patches/linux/linux.hash
@@ -1,2 +1,2 @@
-# From https://cdn.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  1973e6fc3e8617fc8b0e24b33180449f1a39fa6a607f8dba61cf91b4c5bba466  linux-6.8.6.tar.gz
+# sha256 locally computed
+sha256  9e723232d603ab45ebf043c34714c48f277ab195c29abcb8472f2a4c3a5a1995  linux-6.8.6.tar.xz
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
