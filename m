Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB24CCF9EB
	for <buildroot@archiver.kernel.org>; Wed, 29 Oct 2025 16:05:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77FED40A68;
	Wed, 29 Oct 2025 16:05:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gtTJrI5gvr9I; Wed, 29 Oct 2025 16:05:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 310A840A37
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 310A840A37;
	Wed, 29 Oct 2025 16:05:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C869708
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 16:05:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E551406D8
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 16:05:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qXj18UeVH1kU for <buildroot@buildroot.org>;
 Wed, 29 Oct 2025 16:05:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ECFEC4060A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ECFEC4060A
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ECFEC4060A
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 16:05:21 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-475c9881821so8097815e9.0
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 09:05:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761753918; x=1762358718;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z70NObeBOuVUxbiaZNPdJmDTVSsxJi9OuD83rdJsd+E=;
 b=mcFeBAGEjqwMWQUUSucIH7Q5357WyEp08UNMlmG7lClmkS3vj3Mz6B9+m7COPC5VWj
 ydCygP62+vsmwPndfy9cT7kXtQCURbQkT4HT/HyHJgcNe6FI8EXnWbmBdJdC3B9Mel/V
 5HmVdSIrxFImcpoKB2VwrT3SBLYKplakgZ2cTts6ltjcP5I19Mv+Ee1skTJ4aiO/EOfP
 p06niUKnxRiaxX8dnc4DeBljyPMEl93k7UNRjNl8ZPpGMpj24HSajgW9q8j5//vrdfq/
 McaTOo5b6/L/4zAgBWpeVQKov2PV4L1zGcbzeVOyhmOx0alNT6Zwj0zs+/qajU9Fl7DA
 9J3g==
X-Gm-Message-State: AOJu0YxfxZOVSwqF7s22gDYvTq7So9tEfjDZsuBat/UL1IMaAb1eE5Rr
 fxdKBkYQvXYnOF4ruHo+LpyM12NJTIHuSEt/POTEFe1p/QtNyVkQHhbTfNCoYZ9D5Ie5doZOuIt
 tTa+M
X-Gm-Gg: ASbGncvpJdfxC6s8A3T3HWlZwzu+YGq/2aV8zgR+3/qNMIeqfUEOA90diHOD9qDqfFV
 zovOKNNY/5FWH0vppDUaQsGGcB5W0lFf8rPYott37CqHNWCGIpL5SBSlksUx8BL3tdyi8enWWWc
 ysfA0lpXGfb61mW2XftCl0697INFwPYjfs21muY72c9Qu6Uo39rAyzzZcuYf650Yl1oYzqhcn+o
 bOC9DVoFwQ/yZXJXknXre1XVvEp3vKJ8dOS/u//Hqj8IQR9pRf4LBgOG4YkkgXYqx4nBv1kl+gL
 1EzJ8h5tzlbHLa/xx29aorz4u00CaG3UzZNPV5nJ96G+MPRoPKTfPklbbTeMSfTkHG3eEvNIV11
 XCOhlNLCVxpxxNhyvk9/Gsge+jwmJIs5y5BHMOIYVJQpKcE7bo1075nZRhQHK3QGlXkXmjQgZYh
 5oLGjiLUyD6UcrEt5Uc1U2Q7SvIefkeIMXzrjF
X-Google-Smtp-Source: AGHT+IFnwZJZ1xDMFwsZH8ygvg60mYNR7vW3JBEeW8Is0o1YGkrytXm3Bvy6CMEpptPNdnX+0cPf6g==
X-Received: by 2002:a5d:5d13:0:b0:410:f600:c35e with SMTP id
 ffacd0b85a97d-429b4c38275mr122189f8f.8.1761753918590; 
 Wed, 29 Oct 2025 09:05:18 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:1488:f9b0:1bb6:7fe5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4771e196a9asm55989875e9.7.2025.10.29.09.05.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Oct 2025 09:05:17 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: David Pierret <david.pierret@smile.fr>,
 Romain Naour <romain.naour@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 29 Oct 2025 17:05:15 +0100
Message-ID: <20251029160515.464421-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1761753918; x=1762358718;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Z70NObeBOuVUxbiaZNPdJmDTVSsxJi9OuD83rdJsd+E=;
 b=IG9Gw0O8o6Z2GuLcbQyRkCIQ6sE9IjXCtI1gCws3ZdfHdkfIIMRUCVFUhwVh/j1TFz
 4/30eURarKvi9eiimOnFptSwbqGOkI+X2B8x7sztjjkFe8dlUM/EhLy/W04mZgVIQCdg
 ojMxftldHLAYytQC4mgKWzrQLqRVyLCb2/IEk=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=IG9Gw0O8
Subject: [Buildroot] [PATCH 1/1] package/bcc: bump version to 0.35.0
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

Release notes:
https://github.com/iovisor/bcc/blob/v0.35.0/debian/changelog

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/bcc/bcc.hash | 2 +-
 package/bcc/bcc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bcc/bcc.hash b/package/bcc/bcc.hash
index e053d7c36794..5e2c79f7b43e 100644
--- a/package/bcc/bcc.hash
+++ b/package/bcc/bcc.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  58e634b8dcddf1f8f358e6e4e5182ad57999c3ab17cc913e0bf86af157089544  bcc-v0.34.0-git4.tar.gz
+sha256  66c588bf5dfcd557a9f14f7e21a7b4dfdfcc4a574fd4b9897037059f046a6558  bcc-v0.35.0-git4.tar.gz
 sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE.txt
diff --git a/package/bcc/bcc.mk b/package/bcc/bcc.mk
index f33fbcbd3830..f113761c2f3f 100644
--- a/package/bcc/bcc.mk
+++ b/package/bcc/bcc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BCC_VERSION = v0.34.0
+BCC_VERSION = v0.35.0
 BCC_SITE = https://github.com/iovisor/bcc
 BCC_SITE_METHOD = git
 BCC_GIT_SUBMODULES = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
