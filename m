Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EFD0D47CDA
	for <buildroot@archiver.kernel.org>; Fri, 16 Jan 2026 11:05:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 243876F97E;
	Fri, 16 Jan 2026 11:05:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jIIYYXcj9pfN; Fri, 16 Jan 2026 11:05:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5488B6F97F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768561531;
	bh=bWXI1AK2nm2t1F9OD6t6oZkr2ncJlE2HVRaeuaiRisM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MADln6FHmQj/pW2q9DgzKGQ6aqNfzz3lZDk8Ds6uqZsfWe1jp8Zfzg5Xnb/kx/0wC
	 Yf/Xl4EIfN9zkoDVSf3QUKkBiclTEA1HUIPfcQYM33vKyzeVGP6lh0LvVCXXXLgd31
	 7PBC78UfIglOBS7l7vXF/x1GfqML9PDL36/CHCUgjyNZ68Nuyl4MVGL/6L1U1IuUf+
	 oCDSurz948ow6c++OToTsBSIVG8iYZAxdoECTsZU1pZ3tiM+xpNS0t00RG3cIrdPqz
	 wcBg4vNuDosXAM491VxT2Dlu/3zJyu3ZLB4+6quAum1M/lbzPTQCp8CXqgnsxYm5Z8
	 HI1xcxi8+aOwg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5488B6F97F;
	Fri, 16 Jan 2026 11:05:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 565BB160
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 11:05:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 385AA85A88
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 11:05:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CRz8Wf-I5mi6 for <buildroot@buildroot.org>;
 Fri, 16 Jan 2026 11:05:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 25E5585A89
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25E5585A89
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 25E5585A89
 for <buildroot@busybox.net>; Fri, 16 Jan 2026 11:05:27 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4801c2fae63so9619915e9.2
 for <buildroot@busybox.net>; Fri, 16 Jan 2026 03:05:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768561526; x=1769166326;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6Ttwd8OsuVId7dRSfjaXG/TZuPJJpffm+7hUBlU7ftI=;
 b=L5z5o7BfTKYKWhYhm08DtYzHFMpvOAIdxTnNMH7MdzNivrN8VHbwRSfd1bW9iTsMlo
 5tISF4aaJ/TAM7BddDpS4BRMd/5W20qhjtYx2g7NTkpTQaLmDADAkiq8Z3uGbhFnkYej
 MzhZT/oPXc0eXzw6oP0eEgxiK0czKqztwHpawfDlDTvxeNsmCRkUNqmWw0YaHgLi6uCl
 /n8e+rdn9YzRPDKx9sXXQnpsJxbNxJVeOnI6/CqJTbOtm1HCrc0WmJKsH1YHDF7AOfIv
 AjUwLeURmxnZz0aMs8dYgZsfHFqoiMifsa0bTrzJrpj8YmKXKf5rQ0HMWbA0kcp0CFXA
 5jYw==
X-Gm-Message-State: AOJu0YyA+sRUD/q3NMyNKyP8/IDb6gS1E/oCqyjYimsmHqim56643NO8
 Vf8ZaO8lIiR7Jq57rrTEaQGaH/9OLKAI8Ee4OfY8QBuTZK+Q36u5mMmByWiwlbuSMtglY1ZtK8L
 k4EnmFg==
X-Gm-Gg: AY/fxX5ppWPe2LvytWC9rxlQ2cDF9DqUgo8LSw4QKgD6prA/9nVRCRJq01H2VmMUaRU
 uTjioInkLJhRxQXyeckwsY1+m6kzcmSCjC2FvR37qfBeATMGEzeE7jc+PAh1nAzS4pJ/FDRaIWc
 QqqsUth8vHOoMrqdVs4B08GDhImdFtBVhMk7CZW0Eu2t0eLlk3PdovsZM53feSNmBOS6bmuZYUR
 8drgmZs0W0NsZ4sIvWYgW2uKk2K8LmjAzhrdg7byXkJlvDHNjYPVcpw+duUuyKhX+gbWIXSH8Pv
 /NcNkfLzf0pOcCgAivY1vyt8hYRN3EOk9OzbMCYaI4hvmwAIC2NmCGiDVfyvFSznkBgw6faFwLF
 qHJ/jmYfAKw0w6vnL4UvLsZVd5c53P9GO7uBWMPu5fMktSe14qwr7QkZsiq0D96l0jYs7sY5ENU
 qtBjSBHQz/6leuw9dQmm5paMua6R8VN2JqdwNE7A==
X-Received: by 2002:a05:600c:3b90:b0:477:9392:8557 with SMTP id
 5b1f17b1804b1-4801e33a93amr30225605e9.18.1768561525732; 
 Fri, 16 Jan 2026 03:05:25 -0800 (PST)
Received: from vm-2404.. (249.184.66.37.rev.sfr.net. [37.66.184.249])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47f3b7a5f94sm98791105e9.0.2026.01.16.03.05.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jan 2026 03:05:25 -0800 (PST)
To: buildroot@busybox.net
Date: Fri, 16 Jan 2026 12:05:01 +0100
Message-ID: <20260116110503.808971-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1768561526; x=1769166326; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6Ttwd8OsuVId7dRSfjaXG/TZuPJJpffm+7hUBlU7ftI=;
 b=XH+1dhEBHM+09d3OOR8+ZsiLA8Bw+1Zcsjxrzy2TbuslskGstPCQ+J0w0S9aK6dTs2
 2rlWT2Rko3oOwxrPiLLW9NNfIWxw8ZGHqqrRqhNf+5Dbn8yUpzykwhRkLxRP2cne6k+y
 RKbt9BXx8WcQcmGYFqg7WDZbxNtl6Bqn6iNwowNeq9SASo0bo/Y2//kj5bOS8KL5go1b
 GfdKo0+s6jjBjOm5OTRsoA66u/OF0CyLEnl4LnxBeO0TXDW5SBO/tWmpm21+I6itrL+D
 EQIrUPNvjtzeqg84tOJ/0jo31FkWrvAPFTtNxx17t9XBTPFRVASNUIh7LZYf5g9PPblv
 MA1g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=XH+1dhEB
Subject: [Buildroot] [PATCH] package/luajit: bump to version
 707c12bf00dafdfd3899b1a6c36435dbbf6c7022
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

diff COPYRIGHT:
    -Copyright (C) 2005-2025 Mike Pall. All rights reserved.
    +Copyright (C) 2005-2026 Mike Pall. All rights reserved.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luajit/luajit.hash | 4 ++--
 package/luajit/luajit.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/luajit/luajit.hash b/package/luajit/luajit.hash
index e147845e4..4ac36b1af 100644
--- a/package/luajit/luajit.hash
+++ b/package/luajit/luajit.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  ab3f16d82df6946543565cfb0d2810d387d79a3a43e0431695b03466188e2680  luajit-871db2c84ecefd70a850e03a6c340214a81739f0.tar.gz
+sha256  ac2defd1e9b4ab07ac0a52f2403318ffb0d54505b975dff0cfc49a927ab84d90  luajit-707c12bf00dafdfd3899b1a6c36435dbbf6c7022.tar.gz
 
 # Locally calculated
-sha256  5b79fb4754728487cf43d55b213bb68369912484f2dd7ab68380435e994bce39  COPYRIGHT
+sha256  6cda3076a8c09b31bb1f90da614ea89e7ee194589626eeac613e522849604e47  COPYRIGHT
diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index ed44e165c..bbd423ad0 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAJIT_VERSION = 871db2c84ecefd70a850e03a6c340214a81739f0
+LUAJIT_VERSION = 707c12bf00dafdfd3899b1a6c36435dbbf6c7022
 LUAJIT_SITE = $(call github,LuaJIT,LuaJIT,$(LUAJIT_VERSION))
 LUAJIT_LICENSE = MIT
 LUAJIT_LICENSE_FILES = COPYRIGHT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
