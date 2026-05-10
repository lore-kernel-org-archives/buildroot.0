Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C14CD37B2
	for <buildroot@archiver.kernel.org>; Sun, 10 May 2026 19:38:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F146784489;
	Sun, 10 May 2026 19:38:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CAOITE7J8UKA; Sun, 10 May 2026 19:38:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 327E284556
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778441920;
	bh=tReUSeYXodj8g7cTNBpUgXrLAsO3yu3jWIIhxEAtRKU=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MTKJRx5RUBuKiJkKr1WRoRS82R8Z2XD2SPHyuZlo6Yv5CV/p3Ti3khSebp8bN7l+6
	 Zsi2mEcc8zVkHW012PpYTU+WPpsmOoIpS/lh0DMvVgeU5d+j6mpAuAH0ncjye7HS1O
	 udX9h9jmWGD7l5cUSZ0vy0tgg+6izZzaOG/3na9+rs3uETtGgR398Up0B4Slexldqn
	 lIRorAMnKhy8FtxBN4XcQvy++yjPz8Pd3NOH6g6ItA1EyoIEc8/udy9NEYVCPls0nP
	 0yj/v/FYB97pZHW0481BS2eTna9u9bN+MR9Ttvfl3J9Ju/X/Wl1gdesLfhZUVXHXYE
	 sPs9qb4oC/lCg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 327E284556;
	Sun, 10 May 2026 19:38:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A77C223
 for <buildroot@buildroot.org>; Sun, 10 May 2026 19:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C83741713
 for <buildroot@buildroot.org>; Sun, 10 May 2026 19:38:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JuS1xOoIByfU for <buildroot@buildroot.org>;
 Sun, 10 May 2026 19:38:37 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::230; helo=mail-lj1-x230.google.com;
 envelope-from=j@j-ernberg.se; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6AE0941715
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AE0941715
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6AE0941715
 for <buildroot@buildroot.org>; Sun, 10 May 2026 19:38:37 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-38eab6cf7d8so28984841fa.1
 for <buildroot@buildroot.org>; Sun, 10 May 2026 12:38:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778441915; x=1779046715;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zp8HIkGzZuix0F8oj7noIlkWtykWuaxf3BYHdQN+QeE=;
 b=nWe464oJpv1igL+bRqeWEhVLhOOEF0iwU9BTjH62IbcUbvY6RnJX/qjVaH1k0TKRvi
 lByKcqAZPQLklA9ORpnxJbQuo5UZsiUHwV/jhivmtJjkbCFVxUlUMG5IQp7LFO0jWdPf
 hABXC3O8qa6e5D/mPxWHt72Uug5axloNERdhNwHH04HbiWhXk8UmYYJFS9oO1aI0ihhE
 OuR7Gjv+JnoF3hexFS0FEFkgDS+XdXaieNsSL8hJ9hwpK+t9jL3N9Wdpc3qKL9p70h37
 Y3TwkxPnExBFhwKkAvDFKJDHDedqmp8FOQABgV8eUYNXpMALMAk9OHSKF1h2izvkjoBp
 tlAw==
X-Gm-Message-State: AOJu0YzqY8axvC9h13/BUegf9fQuR7p4hmysfqfpGSF5eQudVJGs0WBi
 crVA9s3K75HJ9n4AyLt1f4GdRzy3DreHIB/mZGdv9xU4mTkPnbm/oX563RJPKqLr62NbYdBg9Pb
 neVqgjwKUVQ==
X-Gm-Gg: Acq92OEfdH/ChY2+4GHEjj1JmZFsO3nPxYwcztf2Pgy4ZD2GmwAXMsj5J4KXr4aHn1z
 emsvOaaafCVKIDeNOtw+Y60IxxxX5b2/R6Y8Lf367RW2dAWF2hvOT5gL1BcDPaNCfQ8/n8d0rf7
 u2iIxtx/vboyVt5LyXjISKdzhlDDhtmfUCaFpxegqYbhOcfGfWOWDzyFqsB2amPbHKlzENSOs77
 5m1y3126M07YbGq47tT7a47jYdb6FoNJQAhwlBBiiXH112ozjtn8bHuiuRZFJR8eyIB7P5K9Rkl
 G5A9jWWf+Qz1yz/TxAr7UFpedo+hZFPKy4PAEAq5EDbVcQrHq5JXWQosY51LrfEQ4YcHVWwJ0tr
 vo4myKpcx4uNoPN7/1+SLlFQLrK+htP1+bxGuIJeM1k/HQPnWHLg+fv0VtqHtHEc1yIJ6oDGcDo
 /uAryEG6wNWbPMq8PZMS2zFBr+2tzc7nof+yRBCgDgIruBYx73wIg=
X-Received: by 2002:a05:6512:3ca7:b0:5a8:7f30:609f with SMTP id
 2adb3069b0e04-5a887adff60mr8246942e87.10.1778441915211; 
 Sun, 10 May 2026 12:38:35 -0700 (PDT)
Received: from localhost (78-71-152-124-no2360.tbcn.telia.com. [78.71.152.124])
 by smtp.gmail.com with UTF8SMTPSA id
 2adb3069b0e04-5a8a955dfbfsm2087659e87.46.2026.05.10.12.38.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 May 2026 12:38:34 -0700 (PDT)
From: John Ernberg <j@j-ernberg.se>
To: buildroot@buildroot.org
Cc: john.ernberg@actia.se, John Ernberg <j@j-ernberg.se>,
 Daniel Lang <dalang@gmx.at>, Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Date: Sun, 10 May 2026 21:38:20 +0200
Message-ID: <20260510193826.2846038-3-j@j-ernberg.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260510193826.2846038-1-j@j-ernberg.se>
References: <20260510193826.2846038-1-j@j-ernberg.se>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=j-ernberg-se.20251104.gappssmtp.com; s=20251104; t=1778441915; x=1779046715;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zp8HIkGzZuix0F8oj7noIlkWtykWuaxf3BYHdQN+QeE=;
 b=dyHuLe6fpKVgLigmedxiFzDa1Kbzt0Z4/FU3imzrn0THGx86NNh1jBWbiaDTly4WyJ
 QNIWZ7mduV2PQKdYb0/lnwHm9vKclGa4m7ZjR31RqK6tBhyqw4PYXkrqEkCqPHcWRXnc
 A+VVODcc56rKNmDakqx3vT7VY2crVyMA3HsTcOrSRvy8c7Dg/R3XjzYFAEapuZvjczO8
 rhC9ZLpI07CpRrGoDHm4F1IbMgi3E4J3n80jYmJ2NfNzbUJ8voGJeQ/yCxjhh/YIUTnY
 LMDgpJ5xrV+VyAQTHP3hnD4XdrZOWji+Pr37s3Bd2KNVxj995ObLqfJkAvB1Janw/J2u
 H9MA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=j-ernberg.se
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=dyHuLe6f
Subject: [Buildroot] [RESEND PATCH 2/8] package/{clang,
 llvm}: Move removal of opt-viewer to the correct package
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

The files are installed by llvm but deleted by clang, this causes a
mismatch in the packaging.

Remove the files from the correct package.

Cc: Daniel Lang <dalang@gmx.at>
Cc: Joseph Kogut <joseph.kogut@gmail.com>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Valentin Korenblit <valentinkorenblit@gmail.com>
Signed-off-by: John Ernberg <j@j-ernberg.se>
---

RESEND:
 - Forgot to subscribe this e-mail to the list

 package/llvm-project/clang/clang.mk | 1 -
 package/llvm-project/llvm/llvm.mk   | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/llvm-project/clang/clang.mk b/package/llvm-project/clang/clang.mk
index 116389449b..7eae54556c 100644
--- a/package/llvm-project/clang/clang.mk
+++ b/package/llvm-project/clang/clang.mk
@@ -84,7 +84,6 @@ CLANG_FILES_TO_REMOVE = \
 	/usr/libexec/c++-analyzer \
 	/usr/libexec/ccc-analyzer \
 	/usr/share/clang \
-	/usr/share/opt-viewer \
 	/usr/share/scan-build \
 	/usr/share/scan-view \
 	/usr/share/man/man1/scan-build.1 \
diff --git a/package/llvm-project/llvm/llvm.mk b/package/llvm-project/llvm/llvm.mk
index 577128bb1e..fb59aa64e8 100644
--- a/package/llvm-project/llvm/llvm.mk
+++ b/package/llvm-project/llvm/llvm.mk
@@ -316,7 +316,9 @@ endif
 
 # By default llvm-tblgen is built and installed on the target but it is
 # not necessary. Also erase LLVMHello.so from /usr/lib
+# opt-viewer is not necessary either, remove that too
 define LLVM_DELETE_LLVM_TBLGEN_TARGET
+	rm -rf $(TARGET_DIR)/usr/share/opt-viewer
 	rm -f $(TARGET_DIR)/usr/bin/llvm-tblgen $(TARGET_DIR)/usr/lib/LLVMHello.so
 endef
 LLVM_POST_INSTALL_TARGET_HOOKS = LLVM_DELETE_LLVM_TBLGEN_TARGET
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
