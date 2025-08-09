Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C5CC87FCF
	for <buildroot@archiver.kernel.org>; Sat,  9 Aug 2025 21:09:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFB6F40B8B;
	Sat,  9 Aug 2025 21:09:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sqTYL-_m0pz3; Sat,  9 Aug 2025 21:09:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2912D40B8F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2912D40B8F;
	Sat,  9 Aug 2025 21:09:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 19F5B9DD
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 21:09:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F3FE240443
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 21:08:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QE_s1xN_VrLM for <buildroot@buildroot.org>;
 Sat,  9 Aug 2025 21:08:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 20E7D403DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20E7D403DF
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 20E7D403DF
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 21:08:59 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3b7892609a5so1774352f8f.1
 for <buildroot@buildroot.org>; Sat, 09 Aug 2025 14:08:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754773737; x=1755378537;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=97i/8lvRfPHwYFbR4XSkxjS3EDZJAmX9VWFNn2ehxBk=;
 b=Js0Kq7r8lRm+Il4HBgYqxbJMHU8kL3tHru6UYzHV0N6bxK70HDsc2hI7vzdLQ4ak39
 J9wUWbG+XgQEmqie05I0zC1WA6NxPoyVq6LlH2sbKd7uxM3czgAGmDy8gJrnlAEmfMx2
 t5VoBKQ+XrziFtOKZOMJ86youxND+m10kb0iQcRLlafod/lRv7Uzmcpys1u00hLJf+7j
 FlrOEPQtMAyt8aHhoDMmXj+5mDXAwJ1LLCJG6SMj3sigwADVIUuG96GiAyTJ/zzD0j3R
 VV4T8xtuF5AHcqpbY6kif7WFUZGwYw2O/JjKFNISecDl41JDGPbpizOvFLsovFOyASIK
 Sg9Q==
X-Gm-Message-State: AOJu0YyMzaDTZYPU0EP1KD6MjCxLk541RFw2xH9o5zslwN4KC8t2o+Ic
 ZCl+vyETYebhanRWsRJTnOL/SRlxlmnZ/ip5fAe9KZ45E2wprbDg11iCc2JhS4w/N++ScOagBnS
 Ac5WT
X-Gm-Gg: ASbGncu9fRa0wLRBQA6wEz5uC/wGPAjl9PfMl07ooAqa0v6ol0nmE0bLs0TfqHRkfT+
 0wUhXextc4FLiTOPCRgD74vHvMQd9QBVWL6qKdfDWtFFlXDFdjxRQbINhYddT8Pm/j0TbpP3sgm
 9rKVSCOV5RLogpBHbr/ZVvpnrNFTnQV9NFkvMLF2GVrDCyvw03HILXXUNaNNLbvO3JHxhGuX9aV
 6+jHm4K51dLSJSWT32Z3qeoiep5VxQyyvksmFMMg9GQPJTmZjUnDPAKKYNu57nk4VHAQ6+dOM0D
 b9EonBbNeTApp9fT568LPTPxAcND7sEK0J2eQZ5uLMDP/+BEDlAIUBzXhBjsCuHj/OBTskmHsaP
 ph2h1y091RI0bOuvCqriMeYzx
X-Google-Smtp-Source: AGHT+IGPmoJiQDsN4rgSuf5STfJcpDrf9Wteb+ByGjN+zxS+qBe0VAu7OT8hAhC4GrslI3l7eKmG/Q==
X-Received: by 2002:a05:6000:188e:b0:3b7:9589:1fe6 with SMTP id
 ffacd0b85a97d-3b900b4d42cmr5787016f8f.38.1754773736186; 
 Sat, 09 Aug 2025 14:08:56 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e587e154sm206908115e9.27.2025.08.09.14.08.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Aug 2025 14:08:56 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Stefan Hager <stefan.hager@ginzinger.com>
Date: Sat,  9 Aug 2025 23:08:55 +0200
Message-ID: <20250809210855.354805-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250809210855.354805-1-thomas.perale@mind.be>
References: <20250809210855.354805-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754773737; x=1755378537; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=97i/8lvRfPHwYFbR4XSkxjS3EDZJAmX9VWFNn2ehxBk=;
 b=Nf7g0eq5lsTQr0VSKctMLqUml60/CTXaY3dqXnYqEqeW8Hlb0kNhXopvGmPq4v8GZ9
 xH70eNoI2O3gqyxVSGLFEjeq+O/XB+Efg0c/+w/31X6Vtlzm2G3KfXNzTB6wyMXfSF9q
 iC0YqskLAIKyZu9NtxNW2nDNah1v7a6NazjLFwuW93RO9s7xgBjsRLY4izmavINPhRa4
 rdFX15qjWIn3XEdaD5RkBVEIRcqHmUP5Porvmhh0tTVR8xcMRKOLX+IOA2QE88UUZU28
 gGkmNm5kBN6Desxlh4zwbSIYwJO3Sd/7hJmhNmZBkr5wqcCaXbhRixRc0VwQVpUBxxMh
 YkGQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Nf7g0eq5
Subject: [Buildroot] [PATCH v2 2/2] package/cpuinfo: add thread requirement
 comment
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

When the package was introduced in [1], it lacked a kconfig comment
indicating that it requires a toolchain with thread support.

[1] ea1cc1af55 package/cpuinfo: new package

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/cpuinfo/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/cpuinfo/Config.in b/package/cpuinfo/Config.in
index 257480f068..64477c2bd7 100644
--- a/package/cpuinfo/Config.in
+++ b/package/cpuinfo/Config.in
@@ -15,3 +15,6 @@ config BR2_PACKAGE_CPUINFO
 	  host CPU.
 
 	  https://github.com/pytorch/cpuinfo
+
+comment "cpuinfo needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
