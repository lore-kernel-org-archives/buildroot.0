Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93652C369D5
	for <buildroot@archiver.kernel.org>; Mon, 21 Apr 2025 21:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6252080CD7;
	Mon, 21 Apr 2025 21:37:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gkt8OTGsYRtM; Mon, 21 Apr 2025 21:37:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 922B580D0F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 922B580D0F;
	Mon, 21 Apr 2025 21:37:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CE9CF1BC
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 21:37:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BFF9440A92
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 21:37:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EK440GGooY8a for <buildroot@buildroot.org>;
 Mon, 21 Apr 2025 21:37:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com;
 envelope-from=charlie@rivosinc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A43B34026B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A43B34026B
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A43B34026B
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 21:37:15 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-2264aefc45dso71546915ad.0
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 14:37:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745271435; x=1745876235;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DAvk8q9GXzlUQ4v75szp5HZZL1+M3xOMzyFevkIZphk=;
 b=iSCH/EJ/J6S55j/X4Qc72r5mx9n628Of0v2smbhkxro+RPnGItRZ4YCmN+5kjH/003
 ZQvVuX5uLaShxHp1fgmtvTT/VeGoULGyU5CfHG/HEJSFVfoJCjEzs6NFfaNZgRVq6rPE
 bxSCSlEPe4O9WUBtrquQXSt4J4PhKDvMWRqT+t40MqvjkqjfNsf8Wms8WCBat7F5yqjt
 V0vJYRqLIWlpJma4NZ28Z4yVe5TGaxv6ilPCgZSJS3MWK4YhREjA3+scw6jc//+1MO4j
 QGvaxKzuddHW7hcB/ID5mSAUJLX3CsRCSLPgvYiyxIWq9xxGYw8MS8mPo883IOEGnsuI
 R1dQ==
X-Gm-Message-State: AOJu0YwhxcWQi4WYQrm7Be6D+lC0BbPiMByRekoz+NEkCsuGLIPAaQ63
 XU3TaeF5uFuWT+gqgMpf6/o37ZV+Jt6AWL5OCWtBQI0kOh7TwkECcIqUfVoizELLzEFZQj8AZBz
 l
X-Gm-Gg: ASbGncthV6LBHRJXsfLWK3Z+V0O4h4NhkG4LPUb85E+p5wLSFNuIgnYJ0rO6HgBVO3e
 xTSvsL7g9UraiPneXl/C5Oq8j5Y6SWnsanb6cRdWkr8jpOgXvfWpJM/gikR4lbAtyjDC4QWWYKr
 /+wHcerlsf7WqTi3WWulqbGh1gXLP8OukZokrlEjGcEVyKWofretymTe7apgTz+v4gixgigqV3f
 yUHg9VrKhbJ8pSdcCyMAauh3grz59zkghqoUyUC4euQ3HDvnDvI+e/PPNFOonv2QljblPFX6D6Y
 sv00KOcmIQ1t5jQw93WKYTiaAPqnKQ8rwSFwsczNM6my4im33YVW07Hn
X-Google-Smtp-Source: AGHT+IHjpLmc6QWMyHw3FIS1GZjk4E84mhcXuVKLQaYYmAAh9tBt8QHqYEi5pU9Faz5pIbNQD81TPQ==
X-Received: by 2002:a17:903:191:b0:224:194c:6942 with SMTP id
 d9443c01a7336-22c53607ff7mr201706895ad.34.1745271435038; 
 Mon, 21 Apr 2025 14:37:15 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73dbf8e4825sm7355082b3a.54.2025.04.21.14.37.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Apr 2025 14:37:13 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 21 Apr 2025 14:37:04 -0700
MIME-Version: 1.0
Message-Id: <20250421-pixman_riscv_dependency-v2-2-7209dd6f2485@rivosinc.com>
References: <20250421-pixman_riscv_dependency-v2-0-7209dd6f2485@rivosinc.com>
In-Reply-To: <20250421-pixman_riscv_dependency-v2-0-7209dd6f2485@rivosinc.com>
To: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2393; i=charlie@rivosinc.com; 
 h=from:subject:message-id;
 bh=+IcEZCA6KqIwub9236EyFNvQsgFolC8Dx5hyzT3XMFE=; 
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQwbbrrZH+ZOPXaztTpHfxC7ssiVcyeNk/uPdjGx3X6xYm
 Xb9TvjRjlIWBjEuBlkxRRaeaw3MrXf0y46Klk2AmcPKBDKEgYtTACZidp7hf+zxL0vW93BU3nni
 l7p095I+hYYc+Y1vu27dd17WZar9aS3D//LL2c+OK/A/f+ZWnsdUlLHk/u6eMP+/ndueP9/fs+v
 GfA4A
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745271435; x=1745876235;
 darn=buildroot.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DAvk8q9GXzlUQ4v75szp5HZZL1+M3xOMzyFevkIZphk=;
 b=0imAXA5Zk6ai8+8FBCYvzmczjpyYeyXNF+/kxM4ZiR19c9RyGo6RZFVHzsncrsrmip
 Rcvl/V1FdPzeeD7Wibv8dKN2enF9c6K90oQw46bkax5e3tydWlqf4/gZz4SAwx1SIxzL
 hc3mBh0wkp6DGqxQtMmdkhW2bkgu39UzA54dK6yaVUGe7Q1Cf1eDE6zfAJaz5q/no6C2
 bpunDZMg3EWahQANEr+Xq5eP/5oAE76zjqQ57j1jv9cr7zvwJAkdNyssQbVnDFPnuKzb
 VokY/A5zHcDdfz1u61DI/5afJywAAzuhK4kffz7RtJOPrLI+Z1EVO3iVhu8AJDkIV8fO
 1/4Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=rivosinc.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rivosinc-com.20230601.gappssmtp.com
 header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=0imAXA5Z
Subject: [Buildroot] [PATCH v2 2/2] package/pixman: Fix pixman compilation
 on riscv
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

When the riscv vector extension is enabled for pixman, it assumes that
the kernel headers also support riscv vector. Apply a patch that
disables riscv vector in pixman if the Linux headers do not support
COMPAT_HWCAP_ISA_V which pixman requires for vector runtime detection.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Fixes: http://autobuild.buildroot.net/results/4ecdf5320716ec8b39f09fde3fcbbdcdb557f8ab/
---
 ...-enable-RVV-on-linux-if-hwcap-headers-are.patch | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/package/pixman/0001-RISC-V-Only-enable-RVV-on-linux-if-hwcap-headers-are.patch b/package/pixman/0001-RISC-V-Only-enable-RVV-on-linux-if-hwcap-headers-are.patch
new file mode 100644
index 0000000000000000000000000000000000000000..a76963324c0d62d7e9d25e4ebdda747a29f99ae7
--- /dev/null
+++ b/package/pixman/0001-RISC-V-Only-enable-RVV-on-linux-if-hwcap-headers-are.patch
@@ -0,0 +1,44 @@
+From d0045f1fc32635d9629ea9e361631b07d9ca4140 Mon Sep 17 00:00:00 2001
+From: Charlie Jenkins <charlie@rivosinc.com>
+Date: Mon, 21 Apr 2025 13:08:50 -0700
+Subject: [PATCH] RISC-V: Only enable RVV on linux if hwcap headers are
+ available
+
+Linux 6.4 introduced COMPAT_HWCAP_ISA_V. When trying to compile pixman
+against linux headers older than this, pixman will fail to compile
+because it assumes COMPAT_HWCAP_ISA_V exists.
+
+During meson configuration, do not enable have_rvv if the platform is
+Linux and COMPAT_HWCAP_ISA_V doesn't exist.
+
+Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
+Fixes: 0e424031bda2 ("RISC-V floating point operations")
+Upstream: Pending
+---
+ meson.build | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index fdea28f..cb10931 100644
+--- a/meson.build
++++ b/meson.build
+@@ -379,7 +379,15 @@ if not use_rvv.disabled()
+         }
+       ''',
+       args : rvv_flags,
+-      name : 'RISC-V Vector Intrinsic Support')
++      name : 'RISC-V Vector Intrinsic Support') and cc.compiles('''
++      #if defined(__linux__)
++      #include <asm/hwcap.h>
++      #include <sys/auxv.h>
++      COMPAT_HWCAP_ISA_V
++      #endif
++      ''',
++      args : rvv_flags,
++      name: 'RISC-V Vector Linux HWCAP Support')
+       have_rvv = true
+     endif
+   endif
+-- 
+2.43.0
+

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
