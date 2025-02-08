Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 426D5C02198
	for <buildroot@archiver.kernel.org>; Sat,  8 Feb 2025 14:24:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00D24429D7;
	Sat,  8 Feb 2025 14:24:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y6-1u_D895bZ; Sat,  8 Feb 2025 14:24:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C84642A12
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C84642A12;
	Sat,  8 Feb 2025 14:24:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 04529CF
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 14:23:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6E66417F4
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 14:23:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W-OSaXPDv_kF for <buildroot@buildroot.org>;
 Sat,  8 Feb 2025 14:23:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B4F1F41807
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4F1F41807
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B4F1F41807
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 14:23:37 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-38dd006a4e1so858762f8f.1
 for <buildroot@buildroot.org>; Sat, 08 Feb 2025 06:23:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739024616; x=1739629416;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=INAF4arBwnIwCCJnwBeBsmYCgpU824l25YyuY2bZNRg=;
 b=FI6xEQoQuxo6f78GNjNgEh6+P7AN3EGg4HEfknRcVAP5qwOZTIYHhrkS2kt4UGaL5b
 wRvddEPFN6JhpajGb32K/ELKfUDLQGeRCeTAk+baF4kREAoGkRustD+3jnuF9Z4MMitC
 RU1juYWLj2foJ1nfkjR5uRz+pIMq81N2g8mAlsGx35IeXP4p2WRPHAQ+oFzNySrd6sOa
 Jpmrg3u+rftyZwWtnCT7Qdvi7NkR7+ZF6ss+jGLje8loCWqlIFS/KcDNmIDkqzohbbYS
 CgbAQcfGFq5xW76zH9J7tiLxWf2nsoiCGxylc5G0Y9swCsEMAYEq2fuiV/DVGME7W2Xe
 dx2A==
X-Gm-Message-State: AOJu0YxmqN81QES3iOK0ULj1KpoFs6jnAd6ObyGwFfEyIwfNj5+cABxG
 sIYvEDx3qzJ0j4NIqdTjoHENMmiNpRVkzVXHIF7yEXtaJCukXWbT6BX6pgWBFA8Aft0witOxzVY
 5
X-Gm-Gg: ASbGncvlrFo/ilRga4ZRLRhRAsnhFmGRK6a2hhp4R4Ua0B+B1LzOMsG7jQ5tTA2fnR5
 bM4FURw71lj9QH3C1y+wtJzM6LgMH0vLA0YcxicJ+5I+TNZ/pQH33eWPit9bkgeBnbYC+hojj9V
 2Y8jAopXzM5aw76nhS/gae3b8m3q1Dr/BK/Zwo5V9YDcx1NGVIDU8y7XxkoPmclPZOGSdAqCutS
 J13KHuS7UDTkoDNC7YKtlAMKNpAcPSya07Wwrwukt2gky0LYo7zLPjlQ4+IyFSmBkmAMrjdzoaK
 fXWC2t5WGN3cqj8lLA+7ftjBC91lyKIAMM7k1KBf+E2rojk6Nx+UbhugbcGo+7aiTCggMHfG/7o
 ikkLlhNrRgf3f
X-Google-Smtp-Source: AGHT+IFt5lluq7KYCBZVg+QYzVt3Wv+t4DzOkDWOrVauRrvVWaWcWcyPnFtsm8AJ8G8zmGnsNIih6Q==
X-Received: by 2002:a05:6000:1ac6:b0:385:fae7:fe50 with SMTP id
 ffacd0b85a97d-38dc9346e4emr4541591f8f.42.1739024615734; 
 Sat, 08 Feb 2025 06:23:35 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4390daf7dbcsm124290665e9.30.2025.02.08.06.23.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 06:23:35 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Sat,  8 Feb 2025 15:23:26 +0100
Message-ID: <20250208142327.418271-11-romain.naour@smile.fr>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250208142327.418271-1-romain.naour@smile.fr>
References: <20250208142327.418271-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1739024616; x=1739629416; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=INAF4arBwnIwCCJnwBeBsmYCgpU824l25YyuY2bZNRg=;
 b=ytY30swJBjE2yQzePpaAmmk1xmJEy2UBGjPfPhdTSMW/19EZ0SWJVZXiH8jOdYH/0W
 r7LB98UT0rMeMRsYbeyJdA8WuEzbY9fZPdQcWTSwGTDfNAFBnf+HrWVhDRZhZL0fqBQO
 D88z0739n9skIX1qaf0SZGnvElt5KXRLT/pwo=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=ytY30swJ
Subject: [Buildroot] [PATCH 10/11] package/mdnsd: disable shellcheck SC2317
 for S50mdnsd
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

shellcheck 0.9.0 throw an error due to SC2317 check on
sysv init scripts.

Indeed, start/stop/restart/reload function can't be
reached in one execution.

See:
https://www.shellcheck.net/wiki/SC2317

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/mdnsd/S50mdnsd | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mdnsd/S50mdnsd b/package/mdnsd/S50mdnsd
index 1c2b71802c..13b65d0c69 100644
--- a/package/mdnsd/S50mdnsd
+++ b/package/mdnsd/S50mdnsd
@@ -1,4 +1,5 @@
 #!/bin/sh
+# shellcheck disable=SC2317  # Don't warn about unreachable commands in this file
 
 DAEMON=mdnsd
 MDNSD=/usr/sbin/$DAEMON
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
