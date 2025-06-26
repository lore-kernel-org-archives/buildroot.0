Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B56F8C7EE30
	for <buildroot@archiver.kernel.org>; Thu, 26 Jun 2025 11:16:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66C3F408BB;
	Thu, 26 Jun 2025 11:16:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PYupRr3sWShI; Thu, 26 Jun 2025 11:16:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3F4A40940
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3F4A40940;
	Thu, 26 Jun 2025 11:16:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 16949154
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 11:16:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 07EF88426D
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 11:16:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uyVUWBLBcxtm for <buildroot@buildroot.org>;
 Thu, 26 Jun 2025 11:16:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 468FD83F3E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 468FD83F3E
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 468FD83F3E
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 11:16:47 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-453066fad06so4649325e9.2
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 04:16:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750936604; x=1751541404;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1cGGgtKCSNE0mAKMz9mZ19mMMNq4YwpL11vosI/py9k=;
 b=gPAmBl2hXUEc2mevDv0VNlxVlUgV8uEzvF1H3ZeQopbUpkCZc/b/KIHjyz2upwmTt8
 kQCTKjwRfj+hqhWpZFfRB1mTeF8NaeLmCUYygqgTXssbn1VesenmDlskC0A9wZriuRWW
 eGSRFHXTmt4ty5gyp/BY5av27vDS8Ova/2kHipsCQfg6p7IWDdtEHndjdKLvqgzv5CeP
 74r0kbkgycvffzsR2ZgJsX1mq4mu5yOxXznHkowueej9aXyh1LsQDE7nhJUhAVEPvZXW
 TG5Cplb3KfrJOZBb0Hstfcy0ceAoOfyAfoQ3Q5+Fi5tSX9hrLALeYXgjt55Jdcw1PJYV
 7UMQ==
X-Gm-Message-State: AOJu0YzLVEEXOOXodopMVhyRRlmnYTQGK6nC6BNtlAP/j0+Mk39TOrit
 wu8C0TnE8ZjcN69/3FItgCunlHlHaCQbvPhtk1JuOEjk7JE1MUzpMQLoD+uMDUu2nKvdKGtViMF
 ZEmsbzv0=
X-Gm-Gg: ASbGncvLEgPruD0VueLBR0/b4M+kVqR78yXEsr2r1dlFcATl2xj2KkeauJDTwb8+1R0
 ZshxHGooQBcEpquakTh1Yi81dLqIgm6FZL/g+fWFGzOyGMrDuFNIDShXId+t7JG1fT01GfS/1Xj
 BCJmoTD9krdvFLRM/e4YB5rHoekSDcITlCCw8Ii7vTqg12J8uT0EdsGSQzvMA47n62wCh1A1gIC
 zVmPQh6Dk1zj+S6skf1I/90QlgT+3ytkrkt0TPx3PC8fx6KXhAdxqsySaUEYkHUts7g7eTlGeLz
 IyYufKwM5d1t9fq+PT26yobffmdSSten2dlqbzJL4+fFMf7Fvh6D6o/FBS6oA+0=
X-Google-Smtp-Source: AGHT+IEa531hOTTGCWPWmlqagzE/eCb3KArkZpV2qfHLBuKQZeHOdTyh5yBVQMFnbPPlnGr9bdtZRg==
X-Received: by 2002:a05:600c:3155:b0:43c:ec4c:25b4 with SMTP id
 5b1f17b1804b1-453886ed8c7mr42487155e9.10.1750936604414; 
 Thu, 26 Jun 2025 04:16:44 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4538234be76sm46667325e9.15.2025.06.26.04.16.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jun 2025 04:16:43 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 9F2CB5F814;
 Thu, 26 Jun 2025 12:16:42 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Thu, 26 Jun 2025 12:16:38 +0100
Message-ID: <20250626111642.228223-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1750936604; x=1751541404; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1cGGgtKCSNE0mAKMz9mZ19mMMNq4YwpL11vosI/py9k=;
 b=GU7hUJDTUHldim7SZ5qx9tN6KBBj5uJdPwQUvkX8xgDYayGbb40WCdbysHN3lhsHwS
 zYi6iDlE7d8Ts82NyCb6pFNOg9PH4enT3Bscr57lxEoNwAGctbkwpiWZi1TPUPEqd8Wq
 1hkN0LGHabrQI0Zx/v+sQ/VN04RhXb4ds7Zb0QdVgnpf+/kUlF5DWVplu2/bX7op77WE
 APWALbQ0oEhJpXRbMhmwYvQFTBZK5xUOe+EyCL5mF1ldSPVjZynIyh8ElmglfKG7h7Ae
 I4r91hRoGRlFZFxc7goKQQYfSLlDR+G6/rpp7fxmQlP+Ekt8kltPMl5yX6sewVZvVN2F
 EJqg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=GU7hUJDT
Subject: [Buildroot] [RFC PATCH 0/3] package/llvm-project: drop debug info
 from the binary
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIGxsdm0gYnVpbGQgZGlyZWN0b3J5IGlzIG1hc3NpdmUgZGVzcGl0ZSBiZWluZyBhIFJlbGVh
c2UgYnVpbGQuClRoaXMgaXMgY2F1c2VkIGJ5IGxlYWthZ2UgZnJvbSB0aGUgZGVmYXVsdCBDTUFL
RSBmbGFncy4gQ2xlYW4gdXAgdGhlCnJlY2lwZSB0byBtb2Rlcm5pc2UgaXQgYmVmb3JlIGZpbmFs
bHkgcmVkdWNpbmcgdGhlIGJ1aWxkIHNpemUgYnkKb3ZlcnJpZGluZyBDWFhfRkxBR1MgYW5kIENf
RkxBR1MgZm9yIHRoZSBDTWFrZSBidWlsZC4KCkFsZXguCgpBbGV4IEJlbm7DqWUgKDMpOgogIHBh
Y2thZ2UvbGx2bS1wcm9qZWN0OiB1c2UgbmluamEgdG8gYnVpbGQgbGx2bSBsaWJzCiAgcGFja2Fn
ZS9sbHZtLXByb2plY3Q6IGRyb3AgdW51c2VkIFRFUk1JTkZPIGNvbmZpZyBmbGFncwogIHBhY2th
Z2UvbGx2bS1wcm9qZWN0OiByZWR1Y2UgdGhlIGJ1aWxkIHNpemUgb2YgbGx2bQoKIHBhY2thZ2Uv
bGx2bS1wcm9qZWN0L2xsdm0vbGx2bS5tayB8IDI0ICsrKysrKysrKysrKysrKystLS0tLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgotLSAKMi40
Ny4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
