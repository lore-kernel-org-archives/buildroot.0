Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A15C3601E
	for <buildroot@archiver.kernel.org>; Fri, 11 Apr 2025 01:08:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84BAD80D5C;
	Fri, 11 Apr 2025 01:08:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AcSOGz7Awcj4; Fri, 11 Apr 2025 01:08:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B25CF812EE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B25CF812EE;
	Fri, 11 Apr 2025 01:08:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 24548108
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 01:08:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 09FD54120A
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 01:08:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U3WvZR_FCPNW for <buildroot@buildroot.org>;
 Fri, 11 Apr 2025 01:08:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com;
 envelope-from=charlie@rivosinc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E5204412E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5204412E9
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E5204412E9
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 01:08:38 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-736c1138ae5so1443641b3a.3
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 18:08:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744333718; x=1744938518;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ggm72LZiQUZRJ0U+ZsPr4b+KcyZmO2E8z8TGwWVACiE=;
 b=OXMAuBcXPbsNOMjdazaxrUmygDZpYrVoDOb0XqJufOhI6nMttcNiZJRhpJYbzHmsCy
 xEV3ygZXg46755F2aSzAZM0qFp5MVOcDkRlqG1119oiPjUOwC3bSUoH41LiNM2ijTAnW
 FbFdgoTLgWEf5mLVr3qHPRyqhMJiYqMJb/+8drjeNkOCum2wufQgpXv9dEsHKjC5Vtuo
 Cow4T/M2mQtdhdjadZK1td7wRkaMniEf74c82iRk6uoN1hhCFpMhZ4XLv2UUX6fSSn8r
 jHq9CqO/OjOiWKP/g1N4h0r3s8y95DHj1lf/Gv81sEeABw65W3v6cwr7LMadNsbg/5jV
 CgFw==
X-Gm-Message-State: AOJu0Yy8hhIJzHWSrl0M+6DZRGCoGIFv0rXC3VAZZ01a/CGIsnkBx7PP
 nuWRVZT0JKCBtmXSUH9F81lwp00AaPhhyvL3jmru6LtYROk44WsJFnLDS6O+9r/kUIq8QLtrLqs
 C
X-Gm-Gg: ASbGnctCBNX2wOlQQa4kfSykURMtX8kamovvGaCKNWMOfvkmQS3bQ20i7R07EM/f4w1
 1AImn10x8yUtGwkpZgqnudKoHQ2u2UUHJA6E2SlibCPzLELLuTP+o1V01VWsBWR40Fua3STZq5L
 bgeLdjQAOzdlNf37iD47Hf8eQ6+s6d8pyxgI1jwCLw7N76BG91rKlSN1qgAOLGxsDFODf3skuJI
 8vBq4n0f8iEs8wrQo8NRzwhjqfz+gyEEvking6DY1nnA6g5YMou2lpKRNBzheB5/vaXY1AdkwhJ
 Lq5OsVfelW2n7M1ZZT06EFYVmQyuY7vNxkp2K6QwOXgfYp2vsv4RbeIj
X-Google-Smtp-Source: AGHT+IEKLcE19sWZZWT3ASDqklks1U4MCk26XiF0o0GsJx10WKSTCA8eYxp7AC5cwyhrzl52CtOQuA==
X-Received: by 2002:a05:6a00:c89:b0:73b:9be4:e64a with SMTP id
 d2e1a72fcca58-73bd12a3ae7mr1330202b3a.23.1744333717981; 
 Thu, 10 Apr 2025 18:08:37 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73bd22f0f33sm243983b3a.108.2025.04.10.18.08.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Apr 2025 18:08:37 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 10 Apr 2025 18:08:26 -0700
MIME-Version: 1.0
Message-Id: <20250410-pixman_riscv_dependency-v1-1-25d44d225acc@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIAIlr+GcC/x3MQQqEMAxA0atI1hbSoiheRUQ6adQsjKUFcRDvb
 nH5Fv/fkDkJZxiqGxKfkuXQAltXQJvXlY2EYnDoWmwsmijX7nVOkumcA0fWwEp/gxgckbfdr++
 h1DHxItd3HqfneQHSaUjkaQAAAA==
X-Change-ID: 20250410-pixman_riscv_dependency-00d2cca17b88
To: buildroot@buildroot.org
Cc: Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=792; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=xNgQXfjXoNaP8uc0xevTcPnsXS+3dKXXsTOyt5fwcJE=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/qP7L6Vm7Y1vl3JFJH+dseshog5t258Mdr7cm3u1ai8m
 aJq1m23O0pZGMS4GGTFFFl4rjUwt97RLzsqWjYBZg4rE8gQBi5OAZjIrg6G/4l+i+q/XJaWyPHg
 D6ySEizQanLP8eiLjqpie7c17UbrF0aGSf0qt5kcpcv3rZRy9jeSmNTh+sjEk921ZZf2aberEg5
 sAA==
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744333718; x=1744938518;
 darn=buildroot.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ggm72LZiQUZRJ0U+ZsPr4b+KcyZmO2E8z8TGwWVACiE=;
 b=nvAa/UPjoUaLftBLpbRfarU6Sn0/6M2Gq5hWbPOS3wNsLMYxvAK2bk8vCJJs/8YExv
 rM3KJcXw0ByBh/lF5sAePHAjI/lEwqonm6YnCLgCZpmClnuMMmOxVqMJofDhdRedBpvu
 Gn/YejlcHnc4KdmTUcCHcYwzgzpGbDYlnSjpTGYUyrH+THWz0PPuaewdjV5db/kIuun0
 lu66ka5bC9xOOWvw8KdIsmq3x0JnrSqYFPxH5ig+9zrWeAZTOp7ku4XeBkZROKzTD/kX
 3dqaoVlBMrVXWkj4RAgF+wXhGGwLVCIgybhiHsjYyd/SbbCrXdwtLm8ilQ48Rle26W12
 tRgQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=rivosinc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rivosinc-com.20230601.gappssmtp.com
 header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=nvAa/UPj
Subject: [Buildroot] [PATCH] package/pixman: Specify riscv dependency
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

riscv Pixman depends on COMPAT_HWCAP_ISA_V which is available in Linux
6.4+, so make Pixman dependent on headers that are at least 6.4.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 package/pixman/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pixman/Config.in b/package/pixman/Config.in
index aa2a68f6257ccc30f7daa9f1d8a4e93ba366101b..a10c19c673c4e7d778167f8c0c11475e74fc1943 100644
--- a/package/pixman/Config.in
+++ b/package/pixman/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PIXMAN
 	bool "pixman"
+	depends on !BR2_riscv || BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_4
 	help
 	  Cairo pixel manager
 

---
base-commit: f2b14baf2576b54cca43e6f2aebbb4a19fae3bd9
change-id: 20250410-pixman_riscv_dependency-00d2cca17b88
-- 
- Charlie

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
