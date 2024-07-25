Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1617C3DA5D
	for <buildroot@archiver.kernel.org>; Thu, 25 Jul 2024 17:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CEDC814B7;
	Thu, 25 Jul 2024 17:37:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8o71eBPCQCPb; Thu, 25 Jul 2024 17:37:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52E1081E19
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52E1081E19;
	Thu, 25 Jul 2024 17:37:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 99E131BF2FB
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 17:37:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 939F281E19
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 17:37:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v0CIC3BLNz7q for <buildroot@lists.busybox.net>;
 Thu, 25 Jul 2024 17:37:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::341; helo=mail-wm1-x341.google.com;
 envelope-from=martin@wetterwald.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 375F9814B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 375F9814B7
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 375F9814B7
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 17:37:17 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id
 5b1f17b1804b1-42797bcfc77so9066825e9.2
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 10:37:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721929035; x=1722533835;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ku9abVqO1cDrATC0+A4fsM3ffTFRsyE2/2vxNRde00I=;
 b=bID0zebt2MTmYt4s529KM0SNhfJSiM92eixTHZXC1qWIFuczNDTqsxasc7bA9jKH3h
 +jofUcBxJ0rk3V55zk2n6punI+Ed7HVSNcpig7+vMVyhPCEf9hgfJHYj112nMsZej+ug
 OJV0dvXO2QV5NIcVV1a0m42gczNyX2yy9zz8MCmqe2Bx89PNOgR3vpHsnSUJpk2UXqYY
 wtFAWS9sMKNiAbDhlrM6KbsXqpkMfoQtskTRAAvQ3bxbutt5uyb4zVyP2nfwMurlWs5P
 VAuhqzl9CoKlRZgsILeNwb6CVt/UDcdz1l+WkK205CCsYZxSLzMBj/7giO1levKypkDt
 YS0g==
X-Gm-Message-State: AOJu0YwLfZD5LDSyrDRyQJ6sxFP9v0MARBlYfRB3WwSl4g+7A9lYvPUS
 MKU4iAuJM4u4qCggDt6RnQIawOxIWSOrfhp+cg0hru8F0AJm/gJSEdjuw/OzuVAsAPAZkLVCwp6
 AgmKsqw==
X-Google-Smtp-Source: AGHT+IH75raUHTyPUHRZhsNXD//+VmBu8T7xDd8yJApE+p+sDU0RB4kmr6ZAoLnjk2dyQdW2uVWYoQ==
X-Received: by 2002:a05:600c:5247:b0:426:5416:67d7 with SMTP id
 5b1f17b1804b1-4280550c7b1mr21874005e9.27.1721929034779; 
 Thu, 25 Jul 2024 10:37:14 -0700 (PDT)
Received: from Halley.. ([2a01:e0a:432:9c10:8b37:cbb1:cdce:bb5f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-428057a6307sm44679655e9.36.2024.07.25.10.37.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jul 2024 10:37:14 -0700 (PDT)
From: Martin Wetterwald <martin@wetterwald.eu>
To: buildroot@buildroot.org
Date: Thu, 25 Jul 2024 19:37:09 +0200
Message-ID: <20240725173709.1087549-1-martin@wetterwald.eu>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wetterwald-eu.20230601.gappssmtp.com; s=20230601; t=1721929035; x=1722533835;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ku9abVqO1cDrATC0+A4fsM3ffTFRsyE2/2vxNRde00I=;
 b=k3jPruesCSk7ihA2+IMBHRGjQycN898X9HJLYfAxsW99LrLfVFWZA4Nonm7jEgYucc
 TCCBZ42xsz6gmmhzjB4zGLQ4PDoZaGNYoEeaso0Sth2LEb4vFFl9a/egGWHgEDwhzBMq
 SHFuAvDQLSYEjcQhwZSp9Bdjak8VifYQrIHp0dBmBaj5UhzTCFxXLz3gN1CMvpp9qCvs
 PizR1X+KdObDOmI+2Z1Lsu1Ujuvo4di35uIWzbjikSS8ezCPOd50Pqw9oDxaT5fxNVEI
 gQw3Esb815VFDEMUee4gYkpXlrHeTaQJoeHex80NdBh5JH/xwkGbFT9vCFM3mNsiTflF
 ad8Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=wetterwald.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=wetterwald-eu.20230601.gappssmtp.com
 header.i=@wetterwald-eu.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=k3jPrues
Subject: [Buildroot] [PATCH 1/1] package/tinysshd: Fix static-only build
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
Cc: Vadim Kochan <vadim4j@gmail.com>, Martin Wetterwald <martin@wetterwald.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When using BR2_STATIC_LIBS=y, tinysshd's build was successful, but the
binary didn't work on the final target: this is because a dynamically
linked ELF was produced, on a target having no dynamic loader at all.

Using $(TARGET_CONFIGURE_OPTS) propagates all the options and not only
"CC", resulting in a correct static binary able to run on the target.

Without the patch:

> tinysshd: ELF 32-bit LSB executable, ARM, EABI5 version 1 (SYSV),
> dynamically linked, interpreter /lib/ld-musl-armhf.so.1, stripped

With the patch:

> tinysshd: ELF 32-bit LSB executable, ARM, EABI5 version 1 (SYSV),
> statically linked, stripped

Signed-off-by: Martin Wetterwald <martin@wetterwald.eu>
---
 package/tinyssh/tinyssh.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tinyssh/tinyssh.mk b/package/tinyssh/tinyssh.mk
index 80b6ccb850..e92ac628f2 100644
--- a/package/tinyssh/tinyssh.mk
+++ b/package/tinyssh/tinyssh.mk
@@ -10,7 +10,7 @@ TINYSSH_LICENSE = CC0-1.0
 TINYSSH_LICENSE_FILES = LICENCE
 
 define TINYSSH_BUILD_CMDS
-	$(TARGET_MAKE_ENV) CC="$(TARGET_CC)" $(MAKE) -C $(@D) cross-compile
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) cross-compile
 endef
 
 define TINYSSH_INSTALL_TARGET_CMDS
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
