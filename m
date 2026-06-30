Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74753C43458
	for <buildroot@archiver.kernel.org>; Tue, 30 Jun 2026 21:27:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24C538220B;
	Tue, 30 Jun 2026 21:27:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uonEaTulYgNt; Tue, 30 Jun 2026 21:27:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9950482039
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782854844;
	bh=MSLj6a3WbmkpEYH78gGBNgFn9JnSSQT3rRwctzFbbHE=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=NR7STxTKkjoxyXWVtDHyMQBw2fXX+0wB2Q+UJcqjmY7Tfo6oysbQDwjCVme6RZFHI
	 1QwunysvK0q8IcCu8ynqCIaRCRzpYCwtDm7Mek5hFeGGPcKTZaMh/wlMDzqjsYmVHW
	 CSFB/k1tb7z9h/tHhIveb1pdyEKvP6sU4dRZtUe+YgX9a0fFNOmHfAkPVK0Ofw5zTD
	 HA3FQqyPtIK4lvtAmbI8GZTPCND2ruWP6YIpIaQfMubZMKWNuCCmVkm9lMv6a9iZE0
	 DWT2ytOt9N9ZRzV4rSrbV0FrLu1cCIeCRUMj2AVw0azf9e/w9Tj+DcWHzVlz4wIpvm
	 epLUxSwexmvTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9950482039;
	Tue, 30 Jun 2026 21:27:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C6BDB1338
 for <buildroot@buildroot.org>; Tue, 30 Jun 2026 21:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B819540672
 for <buildroot@buildroot.org>; Tue, 30 Jun 2026 21:27:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U3qQCyBMuRE5 for <buildroot@buildroot.org>;
 Tue, 30 Jun 2026 21:27:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B880D40094
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B880D40094
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B880D40094
 for <buildroot@buildroot.org>; Tue, 30 Jun 2026 21:27:21 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-493a613571eso26058005e9.3
 for <buildroot@buildroot.org>; Tue, 30 Jun 2026 14:27:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782854840; x=1783459640;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o2vyrWdc0E8aFOsTcQlWYaC+4/3OjVFic+KjlC42phM=;
 b=pd0Z8jPhGIU28vJkxrF/1qAy5FhlQ9oZacq80L6GcSGKEcyetEthbYhHXyRGfR9CJn
 qa14dH1dzxpZnt+3WOZ1Sn5Ix5bBILpnkrzPu3X9tokGHDHjkACseRKT9jgusAyZ5fer
 BuCquLYpa12tjrLVA95QifD9zoXL3Dr2f0xDacWBV2oKd5c3kTlGtQno0dtgjJb9s40Q
 r4icWajldLwZIE47QxyD7n0H9uSjWvy/IDe+q4pgm7Q7IKHV4/FYG7T9f68o0jc4EImu
 CLUDX2jhPNR9jRQ0QvEkCnJQZ7bXC20y3xl/Uc0gw/71OhmhWtBxdjBZopbxO0aDZpKC
 KCgQ==
X-Gm-Message-State: AOJu0YzUxrAQtNIfPN9kyPtvhlNMzgbsq5DWbHM0uXVeWm942cXVPdKU
 MTC0X7sGdxY/j5CZfAgeGfme0/NdO74ngypjP3YLpowQvDOTT4jmYaunZC/SFiKAwspVMeRTuph
 QoQki
X-Gm-Gg: AfdE7cmCxr+AXv94CMvnWLaXrgv5NOTxq37USSr20kv2JlK9EHpWh3AOxQxVNxU7Xg0
 5N+FVI1DCOwuw9nx9GWZhbLpR0ObTaY+lEoD7cFb/LEkMN0qwwPKjfs6N0EOZZhj766xRq3PNBN
 v0iCFLEouwj6MyQHbABcfndePw4yOE2mi30UIYXmulrax0a8m77Et5aOg4UL8BeaP/urv/8LZN+
 KAzRF3Aj/tiBNRDNZyrCl1JuGPTq4gbjvv//0zoZfc2mv2Yu9GbA3oftepeZu1HtUvYnYXzMb39
 sZA/3BPJlA2hE/03YZz6XXDU9+VhiPBWQO6+fgzHU+e+VU8sGzokDWJc8NaRAOcobrB0oHmuDGa
 rQX49L6MbdEqALAsBpZyQBSdJs/wkBL/N7l7iRDUFW24UanU/Gen3goTn43n/nvyF/3k8P9N2Ka
 T1ZsEr
X-Received: by 2002:a05:600c:8b30:b0:493:bc4a:fb56 with SMTP id
 5b1f17b1804b1-493bda8248fmr34229475e9.39.1782854840024; 
 Tue, 30 Jun 2026 14:27:20 -0700 (PDT)
Received: from arch ([77.109.126.77]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493be4d9daasm26032245e9.9.2026.06.30.14.27.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2026 14:27:18 -0700 (PDT)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>,
 Sergio Prado <sergio.prado@e-labworks.com>
Date: Tue, 30 Jun 2026 23:27:16 +0200
Message-ID: <20260630212717.604030-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782854840; x=1783459640; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=o2vyrWdc0E8aFOsTcQlWYaC+4/3OjVFic+KjlC42phM=;
 b=EMZQbE/3k1ya2sYjUimUEY3j0pYB3SvWz6644Lc4cAB1gr0hzFy4Mux+upShPsihDF
 cX0/PW2LCcW/basKD61ZeWR5Ew8CbtE/X+xW5H+95IAf21XkfOypGi7nE3sQj72qnuCH
 LwAWZpbzK1QexBuXHUOYvW8Zoh9zlRNoM/Z+KFt5iycf5thrAkoeI48AIW3PrlWedxUE
 A/0nCWLM9tvcMMLq92KOq854NKn8TM6xDLahjWa2eGOHKjv0TvveAK0ybtu1W9GIxRSY
 thnQfXmeltIn4JJ6s+GpZwp4mgiT4Mp/haAHiQs1IZWqUxTFX3hqdAYFL+eypJg6XTg+
 J/2A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=EMZQbE/3
Subject: [Buildroot] [PATCH 1/2] package/strongswan: fix build w/ wolfssl
 5.9.2
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The 'mlkem.h' header is no longer present in wolfssl v5.9.2 [1] and the
content was merged in the 'wc_mlkem.h' header.

[1] https://github.com/wolfSSL/wolfssl/commit/7a2cf5b655541013ed8c93ecc9f598146abf2916

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...lfssl-Adapt-to-removed-ML-KEM-header.patch | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 package/strongswan/0001-wolfssl-Adapt-to-removed-ML-KEM-header.patch

diff --git a/package/strongswan/0001-wolfssl-Adapt-to-removed-ML-KEM-header.patch b/package/strongswan/0001-wolfssl-Adapt-to-removed-ML-KEM-header.patch
new file mode 100644
index 0000000000..a2eba92612
--- /dev/null
+++ b/package/strongswan/0001-wolfssl-Adapt-to-removed-ML-KEM-header.patch
@@ -0,0 +1,29 @@
+From 98b133c54c5e3f66f46a5bb11c9b09d06fdc8469 Mon Sep 17 00:00:00 2001
+From: Tobias Brunner <tobias@strongswan.org>
+Date: Fri, 26 Jun 2026 08:10:16 +0200
+Subject: [PATCH] wolfssl: Adapt to removed ML-KEM header
+
+The mlkem.h header that mainly defined aliases for the old wc_Kyber* API
+has been removed and its contents moved to the wc_mlkem.h header.
+
+Upstream: https://github.com/strongswan/strongswan/commit/98b133c54c5e3f66f46a5bb11c9b09d06fdc8469.patch
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/libstrongswan/plugins/wolfssl/wolfssl_kem.c | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/src/libstrongswan/plugins/wolfssl/wolfssl_kem.c b/src/libstrongswan/plugins/wolfssl/wolfssl_kem.c
+index 042a7e70616..786aecab4cd 100644
+--- a/src/libstrongswan/plugins/wolfssl/wolfssl_kem.c
++++ b/src/libstrongswan/plugins/wolfssl/wolfssl_kem.c
+@@ -25,10 +25,7 @@
+ 
+ #ifdef WOLFSSL_HAVE_MLKEM
+ 
+-#include <wolfssl/wolfcrypt/mlkem.h>
+-#ifdef WOLFSSL_WC_MLKEM
+ #include <wolfssl/wolfcrypt/wc_mlkem.h>
+-#endif
+ 
+ typedef struct private_key_exchange_t private_key_exchange_t;
+ 
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
