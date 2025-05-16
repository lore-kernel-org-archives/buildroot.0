Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F94C3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 17:12:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04153813F3;
	Fri, 16 May 2025 17:12:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P2NRAL7e9cE9; Fri, 16 May 2025 17:12:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12C7A832C7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12C7A832C7;
	Fri, 16 May 2025 17:12:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AE8A51AB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:12:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 900BB400AF
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:12:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LnA11aW_UxuV for <buildroot@buildroot.org>;
 Fri, 16 May 2025 17:12:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7A42A4003A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A42A4003A
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7A42A4003A
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:12:28 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43d2d952eb1so17948635e9.1
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:12:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747415546; x=1748020346;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xuAUfyBLk9vWAdMI9PMp/hy1KQkKDwnkvLWP3B3RIog=;
 b=L+/tK/BAtzf8zJ4LhibPxKo9f75W2rmAzKjmRc+D7KVTEBt1d/W153mAxm5kwXDDNj
 Bee1TKH5He2wRpPyNyf4xq+E6Mm4NL6CQjoRkw+fXLqQEtsy09j1Z/Hw5BHz3mYVuVfV
 JClZR4zYlQHShUpOBoNgH9FJLMyrht3IWhD0dX63dOms242yLmgcSmivCPqh9bsaUc75
 USFi9mu9XFthQpSYoWK3Y300frM+4ku4RT+i0B1YQljRZqamZsSUeX8Bxo3FkJAfomT7
 j2e4XkZkUCt5DhofBU5R1TuKnaBBUUZfsRwTD+KxU/G3X1sPJuWZHxMGKxwk/33nsFr2
 MALg==
X-Gm-Message-State: AOJu0Yxl8TCXvu0kc5daf2uC2tTojWn5qj9izicO4ftISkc9E1ioKb3D
 wMwxHHVWsu3L++piK2WuHWpcWjpYg2ReBkQLFGd0o9YtUZXT4JJuEOSCQmspbr9ftvASluI2Gmk
 F85d3
X-Gm-Gg: ASbGncs3z93MxDO7C94pz+GSkqhylNpyGINk0dspehC9AXY1Kobul5ckrcWNjYYIrtr
 RSgeOY+gCUANvA0a/g6vWaHVCL0QRsREzDa9fnomQ/JG8A2RwuWkMHkouhiDo1mxk4t+0wQIDNh
 thp2GWahHI2NQA1ulFGR+aneMGmNZWJdB+iJrNR5Qu8oRqxhssd+0FQ8iXew4UoQsi1osEye8jy
 +imq9/bKWxBsDu7j44FUf3iw7gDjEWLIICKLoYLBZJ+4Qa6XDvbfoEomPKNKsXVz8ZVO9LqzX0g
 NxduNOZ8lvi0kQFm06QGUmaAGiMsrkrAE/ONsiEG0OXMvjK6nxUTUBldBUVM9vu1lJR1dz7/vLt
 8iAOZWL4tpJ1Xq/9fPZs/PCfUzJYLh7iUsb3bLb8=
X-Google-Smtp-Source: AGHT+IEzm6fMHRgnU2K3pA/Uy4Qww+fbL8iTEfTRN8HmFSuNzcPMTPVWBHoHtBZJE8QqVYfuF9dRhA==
X-Received: by 2002:a05:600c:4447:b0:43d:172:50b1 with SMTP id
 5b1f17b1804b1-442fd675932mr46149325e9.29.1747415545952; 
 Fri, 16 May 2025 10:12:25 -0700 (PDT)
Received: from P-NAN-ABRICOT.numericable.fr (185.137.153.77.rev.sfr.net.
 [77.153.137.185]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442f482f1d6sm105479675e9.14.2025.05.16.10.12.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 May 2025 10:12:25 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>,
 El Mehdi YOUNES <elmehdi.younes@smile.fr>
Date: Fri, 16 May 2025 19:11:32 +0200
Message-ID: <20250516171134.1687054-4-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250516171134.1687054-1-elmehdi.younes@smile.fr>
References: <20250516171134.1687054-1-elmehdi.younes@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1747415546; x=1748020346; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xuAUfyBLk9vWAdMI9PMp/hy1KQkKDwnkvLWP3B3RIog=;
 b=G8tGP65x8qxig+NZpp8swCzG4oNfQJtDm2GgDC3cStK9wfOqYBR91BSyGs3UD5Cv71
 1iSuaK1xhb6Q151s/01I+wgKUBwAgHZV0VuX1lvkDPbe0PXyig/xp7xQAfmRAJtsL6sA
 0SJd/QX7QJmjz3hijct3Av5hHtmbFktMXRo6I=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=G8tGP65x
Subject: [Buildroot] [PATCH 3/5] package/spirv-llvm-translator: bump version
 to 20.1.2
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

Update spirv-llvm-translator to align with LLVM 20.1.3

Release:
https://github.com/KhronosGroup/SPIRV-LLVM-Translator/releases/tag/v20.1.2

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
---
 package/spirv-llvm-translator/spirv-llvm-translator.hash | 2 +-
 package/spirv-llvm-translator/spirv-llvm-translator.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/spirv-llvm-translator/spirv-llvm-translator.hash b/package/spirv-llvm-translator/spirv-llvm-translator.hash
index 4500fc4f62..579f03ee6e 100644
--- a/package/spirv-llvm-translator/spirv-llvm-translator.hash
+++ b/package/spirv-llvm-translator/spirv-llvm-translator.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  0a00a72a5b004eeb73f9c96c9c6ba2d6de232cbf3c22a7b322047604d24402ba  spirv-llvm-translator-v15.0.0-46-ge82ecc2bd7295604fcf1824e47c95fa6a09c6e63.tar.gz
+sha256  d1b4a55dc457edbd9cc50d23583d4bedda9479176efcd34b3e20166bc7a4a562  spirv-llvm-translator-v20.1.2.tar.gz
 sha256  e3bc36440fc927c62d5cc24efeefe225a14d4e34ffeb0c92e430625cce9ee444  LICENSE.TXT
diff --git a/package/spirv-llvm-translator/spirv-llvm-translator.mk b/package/spirv-llvm-translator/spirv-llvm-translator.mk
index 523890a986..06e5d9f6bc 100644
--- a/package/spirv-llvm-translator/spirv-llvm-translator.mk
+++ b/package/spirv-llvm-translator/spirv-llvm-translator.mk
@@ -6,7 +6,7 @@
 
 # Generate version string using:
 #   git describe --tags --match 'v15*' --abbrev=40 origin/llvm_release_150
-SPIRV_LLVM_TRANSLATOR_VERSION = v15.0.0-46-ge82ecc2bd7295604fcf1824e47c95fa6a09c6e63
+SPIRV_LLVM_TRANSLATOR_VERSION = v20.1.2
 SPIRV_LLVM_TRANSLATOR_SITE = $(call github,KhronosGroup,SPIRV-LLVM-Translator,$(SPIRV_LLVM_TRANSLATOR_VERSION))
 SPIRV_LLVM_TRANSLATOR_LICENSE = NCSA
 SPIRV_LLVM_TRANSLATOR_LICENSE_FILES = LICENSE.TXT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
