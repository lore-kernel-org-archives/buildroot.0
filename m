Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 110EFFF6E90
	for <buildroot@archiver.kernel.org>; Tue, 17 Mar 2026 22:39:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1FA483F20;
	Tue, 17 Mar 2026 22:39:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZLKu4PL70mTF; Tue, 17 Mar 2026 22:39:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25A1B83F08
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773787145;
	bh=M/s0QzAav0o5R6lgct9T3o9YELduwFvd0MrRM5PUuuM=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QEsbD5A2f87nzpgOoYheak6UgEPYLSvk19BS0aUEpoEf3iUq1VYkxQMwN94BiJyKF
	 TFwN/ih0Hhqh1kjpZsG4Lt4lgA1A66dvIjd4cEzX4kenLQR4ZRkabJJImYlUkrs2R0
	 qFAjxUmmTGCGLCjLSjxLS0iPuBVB3H0i8ghZ20aN9stY8cdNa/3Hc230za7ihgqhNU
	 BSqGwdQwk89iRN/W5wZpIpbW8iwqzQ4DAJJ5jJIEoN9YjWpsmD5C0ShQyaAd/khadZ
	 ScVkuM8Sh1l2cImqG/Pz0Rv4KYmDlwF3HGcymae3eW/8h1RYiUlMvyaqG3KNRPuaQi
	 jgvqypNE+4VBQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25A1B83F08;
	Tue, 17 Mar 2026 22:39:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B877B3BE
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 22:39:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E6D641506
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 22:39:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JLyOobI5QhBE for <buildroot@buildroot.org>;
 Tue, 17 Mar 2026 22:39:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E0FA041505
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0FA041505
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E0FA041505
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 22:39:02 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-8299f1ca894so93499b3a.2
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 15:39:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773787142; x=1774391942;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wrzMqNdlJ5wF69xIyu00dGpYU+eKhlrMlDxpOQ3wexs=;
 b=rSpNSTVGGauDurGszECx3ySO4vMiX0QdXnFtvJYpAaKJ5LgWYloElVLzH/096kcIl+
 ql9IyCg/x47sLOeURLmMGPRqjhHUvZ85jj+fpRhjwCpjoLreoX4sYiHTlRHMQ1qNlXqP
 bzRo8eQVQVnygKkn99LLwdgDSOntHaeBCdxF7vpIJ5jRLkwbt8bWbovk4JJejNIy2YDN
 01J1vEwVgYkoYqtUMwwgjziPMxO5iiQrpYHlbHBEsR+9Ew9IdEbsTvN/My65GV2mWTP+
 kU1R45urdgTOW5Q3v3YImbI/wgjInRH4D0vFx1q/v09IhFAqwC90GtRMEXQuVJBM3DnT
 Ecjg==
X-Gm-Message-State: AOJu0YyATW/bBxzQtIrJ/j8D/eFXB5k+FtZzwIRfml2/9kxh0ZM7ZhKr
 vj9NTELM5VpcjSd+Jo8d1UxffZGzDQf+4ZpyEGGaHzyeR+/uJ1vxSaUT2CnK4Yn9r7U=
X-Gm-Gg: ATEYQzzCIrUTVxlCQkaJm/tSXpQcawHpAtu2LPeNDchcevgJGlypfwWQc5J+S5SKcy1
 z1xIUaA+7x3mUHHbfM0VW7eNHzs6FMhNRFS53uFIVH1UL/hJr/XNIU/8NGAIgdqclosOBfvaAgA
 j52UyTqRQhNEG563wYUvci4zAhvGM8K7gXvTmn/BNm+IzAnstWFe7KqtiRwDfbnCKeOu5buSrSh
 6v+R6PoS1DLei54cTRW/ZQWcH42bqo5+nbVQZN1uTjSqfkplOO5OHFFO0+hihvtqefVdH5OmsX5
 I1WoQHla8wBKNhih6Yk+61z3Sy3XchAnL+ANn0mWGo0+1jESOO9S0IXhMm0uFWoEMWMOgmgoJrH
 C40nr45d3nQK3GQmkBgi4X1sTzsvt7hq9FELXrfifJqWvzbiuiNtLgHXaXr4XWHcmsK/emKvgfe
 CW1b5jlsqsorlfUUQe6Y4u9XTsJdc=
X-Received: by 2002:a05:6a00:140b:b0:823:b1f:892e with SMTP id
 d2e1a72fcca58-82a6ae17b43mr888764b3a.43.1773787141949; 
 Tue, 17 Mar 2026 15:39:01 -0700 (PDT)
Received: from wash-13.local ([50.120.91.49]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82a6b52e5a0sm564494b3a.4.2026.03.17.15.39.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Mar 2026 15:39:01 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Tue, 17 Mar 2026 15:38:50 -0700
MIME-Version: 1.0
Message-Id: <20260317-radeonsi-aco-compiler-v1-1-115d2a1817a9@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MwQrCMAyA4VcZORvoVnDWVxEPaRddQNORDBmMv
 bvV43f4/x2cTdjh2u1g/BGXqg39qYMykz4ZZWqGIQznEPsRjSau6oJUKpb6XuTFhjnGlBKHMMY
 LtHYxfsj2/97uzZmcMRtpmX835W2F4/gCe/oB6X4AAAA=
X-Change-ID: 20260317-radeonsi-aco-compiler-b33999e00738
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Romain Naour <romain.naour@gmail.com>, 
 Joseph Kogut <joseph@anodize.com>, Joseph Kogut <joseph.kogut@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773787141; l=1395;
 i=joseph.kogut@gmail.com; s=20251022; h=from:subject:message-id;
 bh=zMrsadRSWSaVjVxrhTpMAZYucSKu/Ug/hMPCJ2BuXF0=;
 b=nAOTmu5CKbirbOS9WRMCVvz8iBVjDdixuN//wd/ZzMPHoeKuH2StCsBYwhMBEAi1eRcYTIJNa
 xeHFPpTk/xxCy7+mH+y6vFzd1Vvn+r4TsOWXZc6mHpS5sHi9H/hPV2M
X-Developer-Key: i=joseph.kogut@gmail.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773787142; x=1774391942; darn=buildroot.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wrzMqNdlJ5wF69xIyu00dGpYU+eKhlrMlDxpOQ3wexs=;
 b=JtlcpzC46s7eghuKXTn09dZtcTbB7KDvLrqieyvzQpRt6ekUdzB218arbAhl4uLVvp
 DJvKV2JZP3EV3ro3DexrwBXDvm4P6i6Jhtg7BHPHkKny37Ded4r6GIWTd62t40LebN+x
 ZcfepTU8g9c380iuQueFmY+Us+9efuMMN6uz1FVB18qFZR1qij/FaFb8hfnz3Xk3nLq9
 BYtNILc1oMCNPSloJsyEeW4ZSFr2J0L4bFIJIAKdCP56DxfNlbIMuNLQmPYlw/sN7xeR
 X1XF1zvPIbfVdjUh7szsQCCY88e+9SQUQMCDZsrZi9pnF7wl4HngGguk8lXDdak4IG0P
 WQhA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JtlcpzC4
Subject: [Buildroot] [PATCH] package/mesa3d: make LLVM optional for radeonsi
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

From: Joseph Kogut <joseph@anodize.com>

Since mesa3d v26.0 [0], the ACO compiler has been the default over LLVM.
This shader compiler backend has been used for even longer by the RADV
vulkan driver.

Let's make LLVM optional.

[0] https://cgit.freedesktop.org/mesa/mesa/commit/?id=e26c28f311cc5416f6c7f5b09a53ca2b14dfb955

Signed-off-by: Joseph Kogut <joseph@anodize.com>
---
Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 package/mesa3d/Config.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 63acf0cc6e..fcb8ed51d7 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -246,11 +246,10 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI
 	bool "Gallium Radeon SI driver"
 	depends on BR2_USE_MMU # libdrm
 	depends on BR2_i386 || BR2_x86_64
-	depends on BR2_PACKAGE_MESA3D_LLVM
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_LIBDRM_AMDGPU
 	select BR2_PACKAGE_LIBDRM_RADEON
-	select BR2_PACKAGE_LLVM_AMDGPU
+	select BR2_PACKAGE_LLVM_AMDGPU if BR2_PACKAGE_MESA3D_LLVM
 	select BR2_PACKAGE_ELFUTILS
 	select BR2_PACKAGE_MESA3D_NEEDS_ELFUTILS
 	select BR2_PACKAGE_MESA3D_RUSTICL_SUPPORTED_DRIVER

---
base-commit: e555590b94532097c1319b9450ac84fab06b758b
change-id: 20260317-radeonsi-aco-compiler-b33999e00738

Best regards,
-- 
Joseph Kogut <joseph.kogut@gmail.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
