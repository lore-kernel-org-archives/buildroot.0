Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ABADC369D9
	for <buildroot@archiver.kernel.org>; Wed, 30 Apr 2025 19:11:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E09BC82003;
	Wed, 30 Apr 2025 19:10:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6deEILlzO1sR; Wed, 30 Apr 2025 19:10:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11AAD81FE4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11AAD81FE4;
	Wed, 30 Apr 2025 19:10:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 83E64236
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 19:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 758F040C38
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 19:10:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qX-LcbdGJ825 for <buildroot@buildroot.org>;
 Wed, 30 Apr 2025 19:10:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com;
 envelope-from=charlie@rivosinc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BFB7740813
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFB7740813
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BFB7740813
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 19:10:55 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-7369ce5d323so279729b3a.1
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 12:10:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746040255; x=1746645055;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3lry9QBVE6wXdmcrOggHUN3WTty0Q/2xfIC2eFRzPgo=;
 b=BBJ61D9d+4gOfgpOLqfq7i3MkEZdjG6/3gT5ZI/cH+kjMkSn8AiDEzuIC59CmlEDXv
 Ri/Rce86sWkVMD0aNi6yNRvijZX13QrsCchFnwnt054Xva4CYSGS7OIGNgs36H4rhehi
 bo1o8A00E9OV2w2WqXLnjjEQ2xDIV4HEWTLjFipi9b2/YK7onWKGap/nIczsqauRtXRq
 EwCp0auHddJMWhxPd/24vgFAxgeXNjVAvGHzLaqejA+wO6i/bZaGleoCdbkNtGwKT8zN
 J/GmAxeiXXxj4chH4tjeJ/TkhmTIoE74iV3zYEln2o2JOdzAjNWc21vvvsR+cS41UMqA
 wodw==
X-Gm-Message-State: AOJu0YzdN/PA+MsyLvCkeEyyw8hHcqqZo35K4ppaWVa9OnJ6WSUwxfej
 PnO1O06hTcCCsL8tQAW2v+HUY6bgjXcHml+VO+WgelUrMk6vRZA17eBl7QOOcB8=
X-Gm-Gg: ASbGncu1YetloCXFKEMGLZ5dMfzJWi6aHM6HaohPwEb0VvpPtg/XgeoFLgFIJeuRdsE
 b8C8uKBglfiIGt6spt3PQqBZKu/Msj9slxlbQxRSV6qN8K0ZMsVwZweDKVVGzSmiq9/HAe1/H0w
 LxZRSx0YpPCKcbM3ALBSXnatVyhyTVArK2FE8hTurgcQLwLfKfxJVZy8T582rnLgCChZZ219/cD
 8mfbNpkC6/UdmaIkW4UWPTNU4RHIcA8rPmvKd3W/0oQX0uqJ8ESoHLku7B7F6n6F0e4C57jhM4g
 MOFb6rEa6deBV3SDkfLJNswJLIsavxxX4KG0BCh0YZ9h6U5NLXXk7J/S
X-Google-Smtp-Source: AGHT+IHMb5ktJK3HKSQkWdmAgCR4oazKJ0zPdDWCXQ6dF0V3N9pJviPxYgenH30ZWFa+zB7UaDpyMg==
X-Received: by 2002:a05:6a21:3102:b0:1f5:889c:3cdb with SMTP id
 adf61e73a8af0-20a87251935mr6637643637.8.1746040255223; 
 Wed, 30 Apr 2025 12:10:55 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b15f76f42a8sm11111304a12.3.2025.04.30.12.10.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Apr 2025 12:10:54 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 30 Apr 2025 12:10:35 -0700
MIME-Version: 1.0
Message-Id: <20250430-uprev_pixman_46-v1-1-c1608b4d4bd7@rivosinc.com>
References: <20250430-uprev_pixman_46-v1-0-c1608b4d4bd7@rivosinc.com>
In-Reply-To: <20250430-uprev_pixman_46-v1-0-c1608b4d4bd7@rivosinc.com>
To: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=985; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=1yjh05nd5lHeSNerPzBINfaWQ21dv/PFpoKcSfPN/d0=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ4ZQ6e6HyluUBXdvEJgsH/jitJ1Oee++u2Xnmdfm3elcv
 fxD4VnzjlIWBjEuBlkxRRaeaw3MrXf0y46Klk2AmcPKBDKEgYtTACYieoiR4Xj5b63yzqU5jgfl
 p+VarDuZEvdnVuG2VRba5x9d3l6nbcfwP80vvfyB6+voA6t0kmL3XWq1zr7axT7zxD+OPL+kxwv
 SmAA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746040255; x=1746645055;
 darn=buildroot.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3lry9QBVE6wXdmcrOggHUN3WTty0Q/2xfIC2eFRzPgo=;
 b=riXWXOV4g9rtczPNLj7MJDNaz5SzIX7qplv2NdnVr/KU/jvU5mzgdUA3PpVVvDB/iJ
 VeTGXmDHllcytydJUAV2fbrSkhYJgc9u9G7EbD0uP/n4mcC/NvN0K36gzx0JShO8FUVZ
 N8BQhxBhJV0TWHiHwHF4wv9+2DgYNm1C/MFy20uzfXRA1j+a+7LWneCyjBkJYGfOQtaC
 1jElvLwCDAUmb/dD1w/JCBo4IqCAFGK/ZWSzN20DUcy9K6gBEnPfvyWiZK6HYwXVsd6r
 6dlHEo+nPaq4V1BwzKzmQaUWUZtflxt4HGc0fYzTTp3xA8XHB4fd7cMPfWgFyo07EWdX
 xcjA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=rivosinc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rivosinc-com.20230601.gappssmtp.com
 header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=riXWXOV4
Subject: [Buildroot] [PATCH 1/2] package/pixman: Don't require vector when
 BR2_RISCV_ISA_RVV
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

If -Drvv=enabled is set but the toolchain doesn't have kernel headers
with vector support, pixman will fail with the error:

"RISC-V Vector Support unavailable, but required"

When BR2_RISCV_ISA_RVV is set, let pixman decide if it wants to use
vector instead.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Fixes: 386e6bb47994 ("package/pixman: only compile with riscv vector support when selected")
---
 package/pixman/pixman.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index 76e72d6d96161f9458cad71a8437e46b3fdf4d95..78ab20da5915f2b7b9d5710b46b5ca8011e32240 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -74,9 +74,7 @@ else
 PIXMAN_CONF_OPTS += -Da64-neon=disabled
 endif
 
-ifeq ($(BR2_RISCV_ISA_RVV),y)
-PIXMAN_CONF_OPTS += -Drvv=enabled
-else
+ifneq ($(BR2_RISCV_ISA_RVV),y)
 PIXMAN_CONF_OPTS += -Drvv=disabled
 endif
 

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
