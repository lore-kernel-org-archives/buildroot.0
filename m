Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED02FC36002
	for <buildroot@archiver.kernel.org>; Wed,  9 Apr 2025 08:51:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93911411CD;
	Wed,  9 Apr 2025 08:51:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fvf4qtrfq_Fb; Wed,  9 Apr 2025 08:51:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDA30412CB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDA30412CB;
	Wed,  9 Apr 2025 08:51:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2FF85108
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 08:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 153D683ADA
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 08:51:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c_QolOEQJEEj for <buildroot@buildroot.org>;
 Wed,  9 Apr 2025 08:51:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com;
 envelope-from=charlie@rivosinc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2017883AD8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2017883AD8
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2017883AD8
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 08:51:04 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-224341bbc1dso57339615ad.3
 for <buildroot@buildroot.org>; Wed, 09 Apr 2025 01:51:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744188664; x=1744793464;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B5saEHM123cdM0qgx09Eo5Z8mtzQvL96Bqj7rKGw8JU=;
 b=bna+SF4hQKViZdgllKki+RF99o2k5F64j1DS0k4ZxqF1ssZ7jCLkh5FWYOLFm24O8O
 OYj5GCUJMLnD4WxAV+z89WMSFaXXxWsl+GHpWOQN6IFbteA2MdVfTKpstylFzcMIOw1I
 mzk9AH4zyp0jThOcw+kJAl0pWV7A+FCLGAatpvPFcqUVG6C4K6x7PI8zQZ5n768EhwJO
 B5d0mm54DRUwU+MMXbd7J0ByF4zCNuo58omK501NauLsRSOlUGemzsNC4dWc0YlXL/kS
 +APKULb7ggMTQlMJmLbYO40qIfgC8bg3Hbt2JqfnJwZrWTFKrHY38FW3eG96AK3TqBhL
 A56Q==
X-Gm-Message-State: AOJu0Yw3MdzfOBQwGrEPFGLzt8V+/CDZNzqdR/U1pdlLfU1sW5Bl8pQc
 ncnFgjOwuh0UweXomvyRBhzWry3Aa1sJVZ2M6MI2fAHTVh/V76wMyvb3guTx/o4oYz3t4/7uzzq
 l
X-Gm-Gg: ASbGncsQh+87u4QH1PrE/duN6nOr8jy8c0eSnY6u+YFDlNLNt/LvOe9FWQSXDYFfWVM
 Bksm2ZlRyhOJR05xO1lSDT4F4z1npQE7yv2R8G3U6WnFNNv2r0B3v6qohzrEjneJrUBzJC1a0cc
 LIFdhIhy6+n7v1etLaMYMnRdBYCaHJ3GZHxUOUqHMD400k7tqVlteqSHtPeoih4UZbJeKX3aoxT
 nli7Spb+xbCSMDtqaVdH1wT7W5Nc5Xng7SQ5FlXr8SH1JR4gLQz2iLLBqh8eC4asmvCbU2+Y6rS
 5UU79XY/AeybNO3PiYZdQN2jZnMJE+F5b+YDjxgpBCNuvxWm06wiVEmzRs7l5aGDCLU=
X-Google-Smtp-Source: AGHT+IFjZA//errOlc+BDKZeB9NHBNn/e5xNdUi9c6Y0k099rugRhlhz7sckEDSzB59+CNxjN7XECQ==
X-Received: by 2002:a17:902:f681:b0:223:3396:15e8 with SMTP id
 d9443c01a7336-22ac29a8302mr32188615ad.22.1744188664125; 
 Wed, 09 Apr 2025 01:51:04 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22ac7c97207sm6491045ad.129.2025.04.09.01.51.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 01:51:03 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 09 Apr 2025 01:51:00 -0700
MIME-Version: 1.0
Message-Id: <20250409-fix_linux_tools_parallel-v1-1-14135d77acf1@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIAPM09mcC/x2MQQqAIBAAvxJ7TrC1oPpKhEhttbBoaEUQ/T3pO
 DAzDySKTAn64oFIFycOPkNVFjBtzq+keM4MqLHRte7UwrcV9udtjxAk2d1FJ0Ki0KBpsZvc0iL
 kfI+U3X89jO/7AWnhEulqAAAA
X-Change-ID: 20250409-fix_linux_tools_parallel-2323829caf82
To: buildroot@buildroot.org
Cc: Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1775; i=charlie@rivosinc.com; 
 h=from:subject:message-id;
 bh=IJxUlLrWxGIzugFYHuihh2KXgDdhp5Hq/Ljd3/B8GrU=; 
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/o3k2935N1nCB8TOXR1Sume9q8y66erZJzd9nDLr+uC0
 6W61sVwd5SyMIhxMciKKbLwXGtgbr2jX3ZUtGwCzBxWJpAhDFycAjARPR5GhlmVp6ednvLx6z2N
 l2smcz13vfK75KxbwpMf52Jr/3rxmAYz/JXOf9pctt9jEedSxljvJYcuzVc+dHHKLrYo2X4B7de
 srYwA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744188664; x=1744793464;
 darn=buildroot.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=B5saEHM123cdM0qgx09Eo5Z8mtzQvL96Bqj7rKGw8JU=;
 b=gVuL2XJlyJMh71qnl5ASJf3B+8AzZnL1xBGWqxENiaJqHq7XHIO6+iqaaGgySviCVT
 wQkO1ICHBaq3zp5otB7Vdg4hbI66ZvWFr7yZQfBmTNAc4GKDY8iEoiZiOTSEtue6vrhw
 61AOPZGERHPXB2zmEzI4AU/I5oPnsWmVOV98SoIGwMqVCwMCDH0qReT1q4+3JOo+9RHp
 DQvGH+D/483TIddx1krc5vNOlvg7Vstc7f4CBA+8xjyXalMvaCO1T56y/G61FwXJBWxN
 Sn11z7+KiXBuw9AsmKMxBa+GNaKDSVObX/NPfybSNpnYCAV6BoDAMCI7Baf18d1MsbBc
 YliA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=rivosinc.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rivosinc-com.20230601.gappssmtp.com
 header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=gVuL2XJl
Subject: [Buildroot] [PATCH] package/linux-tools: Fix parallel compilation
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

linux-tools opportunistically set linux as only a patch dependency. This
unfortunately introduces a race condition in the shared linux scripts
when using PER_PACKAGE_DIRECTORIES and using top level parallelism.  The
race manifests as the error "/bin/sh: 1: scripts/basic/fixdep:
Permission denied". This happens when the linux package and the
linux-tools package are being compiled in parallel. During the setup,
each of these tools ends up compiling scripts/basic/fixdep. When the
timing is correct, one of these packages will try to use fixdep while
the other is compiling it, resulting in fixdep being briefly not
available.

To fix this, set linux as a hard dependency instead of a patch
dependency.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
While the timing of this seems like it should very rarely be triggered,
on my build server I hit this issue nearly 100% of the time.
---
 package/linux-tools/linux-tools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-tools/linux-tools.mk b/package/linux-tools/linux-tools.mk
index 81b1fbc17605d6f003558d113143b64b5af6714d..a5d4a66f761fc44b156a92edaaf21774529f52d5 100644
--- a/package/linux-tools/linux-tools.mk
+++ b/package/linux-tools/linux-tools.mk
@@ -20,7 +20,7 @@
 include $(sort $(wildcard package/linux-tools/*.mk.in))
 
 # We only need the kernel to be extracted, not actually built
-LINUX_TOOLS_PATCH_DEPENDENCIES = linux
+LINUX_TOOLS_DEPENDENCIES = linux
 
 # Install Linux kernel tools in the staging directory since some tools
 # may install shared libraries and headers (e.g. cpupower).

---
base-commit: 7336c5fa93a896130511d661f0d42359a046ec9a
change-id: 20250409-fix_linux_tools_parallel-2323829caf82
-- 
- Charlie

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
