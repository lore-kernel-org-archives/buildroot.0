Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BF45C369D9
	for <buildroot@archiver.kernel.org>; Wed, 30 Apr 2025 19:10:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46F0460844;
	Wed, 30 Apr 2025 19:10:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l5pBk5EPjUGG; Wed, 30 Apr 2025 19:10:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D43A60856
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D43A60856;
	Wed, 30 Apr 2025 19:10:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9ED5B236
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 19:10:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9130D81FE4
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 19:10:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xkz9nHy1cSvk for <buildroot@buildroot.org>;
 Wed, 30 Apr 2025 19:10:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::536; helo=mail-pg1-x536.google.com;
 envelope-from=charlie@rivosinc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A6FC981FE2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6FC981FE2
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A6FC981FE2
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 19:10:54 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-b0b2d0b2843so181159a12.2
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 12:10:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746040254; x=1746645054;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E/54QTAd/4xyLqfgqF65AFt1fglglXW2jjXbqqDeOcI=;
 b=SrD2mKJDIjwqrkp+DaJbr1Xrg+k22hBpK/YvCiPLirusNuwkb91rO2qla5DR/nBX7R
 2HvZnEp58qT7oSpuqtkvTh5h+mW7PAabVbOt4GFTLuNZ3aeKXg+G9Hfonx9+nO8CxsBt
 sjH5D8TwpZ2S9ONEgn6+Y7iBIBFx0rsk7/4m6DPVx98BLMv7O7RBxrt2NoFcXcOEvBKf
 NBSSev72xesOUFVswooCmuTo1yRjXc2knkMKs8REAHFAl4TPvDOYjZr1JqUlFC65FKNd
 kMcvKZ87DukxdjgLSs9hhRPk4hVjOC8l0umKgpgtDiufX72oxIQOftpCjoZFJo0Mz7nN
 MHBg==
X-Gm-Message-State: AOJu0Yyagk+3n5LNsdLyLCsHWudlBzKRAdLpH4Qzhqi550hhimdXHB5n
 wi/iie1+jfYaxeaov2oK4YmyvxCt/4eFaoo66LmE9dv9jxHnWLLIG5hKVXF9GiFN8VY43fuwwyo
 I
X-Gm-Gg: ASbGnct7rC70Qjz8RUxZ2K/mtoY8j3oMHG1XbCeXGCmsnbu4mLlyb01n0icEuRXsRHb
 qvExu7eRkWCMk804nZs6Msp9XrT5RX0KbPzC1HTxd1vRY/tJIw+nO9IrXEgMSJ5NmfxIaZ7oOBC
 OvElE9fCQIacsN7GLZ2ImqP2nfJAxaGxUlf/yce0EAnMOO1GPmzJkJqDf8ZDQUS6lOltJTWAhUC
 iEmllKzqIW8mws3rzBBhvr0zw3eqSleqkOS1UvcwhOJa0KRlKoBr9zDQb+/tr0MLam1qwM7Ynov
 LItopf5lXaFYYsALfg2HddM5gtL6VvmjOX91abibiBKJDxtWR+D+UNqe
X-Google-Smtp-Source: AGHT+IHrG2bNCkTd2KYM2OMEqvasU7WjBrOpPQxShlogslZwkBdnHEfB36CU5kYYiNAQRp/B4SBhzQ==
X-Received: by 2002:a05:6a20:6f96:b0:1f5:882e:60f with SMTP id
 adf61e73a8af0-20a87d4e917mr5565551637.17.1746040253914; 
 Wed, 30 Apr 2025 12:10:53 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b15f76f42a8sm11111304a12.3.2025.04.30.12.10.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Apr 2025 12:10:53 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 30 Apr 2025 12:10:34 -0700
Message-Id: <20250430-uprev_pixman_46-v1-0-c1608b4d4bd7@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKp1EmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDE2MD3dICoLL4gsyK3MS8eBMzXaOUJDNjYyOTNGOTJCWgLqB0WmYF2MT
 o2NpaAHhuyBFhAAAA
X-Change-ID: 20250430-uprev_pixman_46-2db63324f34b
To: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=830; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=6ElyIRe/lEW53q7lo1fgLJT2O8853HD0wFaMaMOXkB8=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ4ZQ6abrx2KPZF3IWLzMMc1LRD3sTMe6I9MmL/4740RLh
 deMpUUrO0pZGMS4GGTFFFl4rjUwt97RLzsqWjYBZg4rE8gQBi5OAZiI7U6G/4HxXB1bH9urK4ht
 WJ1kxfak9Fl/n+rKnhdzrvE+WaXpnsLwv/7HtjnznzBmR75w350jbbLlpPX7DcyV9w53Nwq019Y
 58AIA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746040254; x=1746645054;
 darn=buildroot.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=E/54QTAd/4xyLqfgqF65AFt1fglglXW2jjXbqqDeOcI=;
 b=r8LArs85228ysgnIdnFfRTgodBGM+DCmWe1Qfjzl9t/kWn24xB1DXNShcZyF7+Gpni
 8LleYtPoTX9B2Ak3qm4HT+X3P2EO810QUBNCSlM9WEu9CLpeKXrPJ0PVzxTvQTAb4Kxl
 AYDXJ0o3EQvzHLweONsuwRIV9Pk5pYnEAeCUdtNqRdncCzxiYrs/EVXgblRZ67GgCLdS
 EnTZWMSuJsoZE3CiClWkh2tLX84ceJk+hq1/P8954G2bQfQGBL7v9pzra3Mg47kzOtN0
 oBo7kZEljC8JtyOWUWvykuq73G/EMlntGbo8AahHxy4aMifdgn3PEO2eYgPf5yAp2Fq3
 NS3w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=rivosinc.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rivosinc-com.20230601.gappssmtp.com
 header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=r8LArs85
Subject: [Buildroot] [PATCH 0/2] package/pixman: Uprev pixman
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

In the process of upreving pixman I realized that if the toolchain has
kernel headers that don't support vector, then pixman will fail to
compile if -Drvv=enabled is set. As a result, this series contains a
patch to uprev pixman and to fix this issue.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
Charlie Jenkins (2):
      package/pixman: Don't require vector when BR2_RISCV_ISA_RVV
      package/pixman: Uprev to 0.46.0

 ...-enable-RVV-on-linux-if-hwcap-headers-are.patch | 44 ----------------------
 package/pixman/pixman.hash                         |  4 +-
 package/pixman/pixman.mk                           |  6 +--
 3 files changed, 4 insertions(+), 50 deletions(-)
---
base-commit: 8e1ad23f2a43d860a27208c69d2e8f424324dd84
change-id: 20250430-uprev_pixman_46-2db63324f34b
-- 
- Charlie

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
