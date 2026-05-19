Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED84BCD4F57
	for <buildroot@archiver.kernel.org>; Tue, 19 May 2026 11:22:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 616D640B7B;
	Tue, 19 May 2026 11:22:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NPnGDPaJ1rTQ; Tue, 19 May 2026 11:22:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FF0440B7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779189774;
	bh=4sP+8KoSrKsoQtD4roOPatUOY9nmMONZ8xvtGOH9uwk=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C2SnHfpvwjbj95PPAfAXfMIhLlPotfOav/DGYk5/R8tduwujMXozbw8AEAQcI7hKl
	 y/GRAr7G8+acJRTjMURyG61xHw52wTctA0S8J6qCwyOr+8ZTlWYNXfOc2gf3zP4h6O
	 lc20yu1n7lVqSbUUVQ3UUU1w7wd+OZwTgfxBcVxuQa21wo/7ZqIxNSp+6SpVvcJjoP
	 HZRd+FRi5Kx1eZ7bYNpLWjdW+qai6Ohh1CMs77rRHUvFFrPpxAepbNzLfIAEjsKmW9
	 P+DI1NtydYRpVsS3ELp+2Mxb4PfOwllDMxhLDcKB7MsX87Yxqo0rFLznTiC46avj5R
	 0z6ENZK8zWIaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FF0440B7C;
	Tue, 19 May 2026 11:22:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 04247265
 for <buildroot@buildroot.org>; Tue, 19 May 2026 11:22:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE011403B0
 for <buildroot@buildroot.org>; Tue, 19 May 2026 11:22:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zwgFnQQ5gJ11 for <buildroot@buildroot.org>;
 Tue, 19 May 2026 11:22:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4F508403AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F508403AF
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4F508403AF
 for <buildroot@buildroot.org>; Tue, 19 May 2026 11:22:52 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-36974217d4eso1953084a91.2
 for <buildroot@buildroot.org>; Tue, 19 May 2026 04:22:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779189771; x=1779794571;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rUuKMJ7eyio+lQDHfJwA4aZVQaZMkC8LJk01lon15xE=;
 b=U28LjE/KZn8OKyPaVSvRCKSOVs95tmLWv22rVR7Y2/qvZwoP4rn2AnXR2mKwG1CxNc
 u4wIc40e+XQ4YB2xf8QO7AnAT8sQHK8nKjMufjumQELdP7aXkzVmLLMLAukvzfcterQ+
 2ifpzXEQ/bgnLykMMzgVLgCqI14H/jmBW9Vimn2VNrepo6Ih905BqSGnlNW4EkUclYOq
 vAEtwmS6ZaBQ3hqFzxv3mqjjluEBighBxet7AEIcuQb1qEiv599DmBrFi4MjjJ1fZXJy
 8QD9zkEraXyqh5Bygnh5Nc2kGPxxJgeCVBCGvxm/TzTT42QpXtW/PtX/hAp8T0/sRcyr
 L/wQ==
X-Gm-Message-State: AOJu0YxM0ATRN2qWS5Lr27iZqSuF4+lxb0dsLPMCU8mEE2zdC68H9RkA
 35mPjPwPif1JUPpKgz3PJQAL0bbt0CniWlb4YrakHzn5oxQl2GvWnuCDZJ9e/LVX
X-Gm-Gg: Acq92OFwU6QL8MKjhELHBkjtzfzMSDKSTAt6V8LdgIai/3Nl07Ps65b2Otelw6BcgMk
 dVj/f6VicpkgqHQb6Xe/zUChoTqa2wAqP+akQqCNJOn/HZdPlnwMOwVp24f7pf4Ys+3Iks2lt4o
 S1Ep7ApaqQCkxS9GXrBdSLLiqk7GjhIHb7cM7CZkWv464L6/GLKTsvYVHxgncyCkDKdRAW+Hd63
 72AR/9JC3ENLCLieTMgudbenl562NbMkQO9hG9aTEn55fOWuqJ9VR1tbfJdyDQzrjLvZzq7h/Rb
 gmSOP/BNdb1zErDtX8MygAvPAE4tAkmIEyFrJInXxfABUePWEcijjIXewU331fJjmbKLFKr5cqH
 N++s2hnZiARouLeoUMQWrHAvphlS/CV3CHmMnYmrJdscxBeeUPR+z8BM83D5hXAYSjMiNhH62yO
 ApKeSBHPUfCfGeyQ0uxMUdpWXJScwVzoC9Qc8DhdHGlwLR4GIPZRudscoX9w==
X-Received: by 2002:a17:90b:3811:b0:35f:bfdd:f5a1 with SMTP id
 98e67ed59e1d1-36951b711c1mr18019092a91.13.1779189771046; 
 Tue, 19 May 2026 04:22:51 -0700 (PDT)
Received: from fedora.taildae27b.ts.net
 ([2409:4064:eb8:db2e:21ee:85e:2f41:2938])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-369517a8612sm14229703a91.12.2026.05.19.04.22.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2026 04:22:50 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>,
 Francois Perrad <francois.perrad@gadz.org>
Date: Tue, 19 May 2026 16:52:40 +0530
Message-ID: <20260519112243.1793562-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260403082641.491778-1-chakrabortyshubham66@gmail.com>
References: <20260403082641.491778-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779189771; x=1779794571; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rUuKMJ7eyio+lQDHfJwA4aZVQaZMkC8LJk01lon15xE=;
 b=QmfHRV9f7pTIdgJmjRFH/C83mf+m2aeZvVrnG+ZaIu3wmZfPpBRAd9UWv7IQcmszKV
 bvs7ERJP3z9MxHNw3gRxetjmzwLnriEEFhgSHKnOsJEcLpPdyZfizvrAOJa6jvPodXOl
 PWydO6i2yXDopK9R8SBxxGEMwBYMGv+ZzFhba8i1B3VxlQYiRAPxTnE1pZ/d5Dl07MPc
 F2Dz09qJd4LUVbicSOrm+MUemYTJx35WBPIRLFVyhkTbnKSfEVc973uf7wZD1wFp1LKg
 OPKZ7JFnL1S/GpwByZ5WkSV2o9wA3D7L2DXUI2Hs8wmBTcp9rhKj7rmZe6a1ancjpk+F
 SG8A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=QmfHRV9f
Subject: [Buildroot] [PATCH v2 0/1] package/perl: fix build with musl and
 static linking
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

This patch series fixes perl build failures on musl and static builds.

The failures were caught using ./utils/test-pkg:
- bootlin-x86-64-musl: FAILED
- br-arm-full-static: FAILED

Changes v1 -> v2:
- Rewrote commit message to strictly follow Buildroot guidelines.
- Added detailed explanation of musl and static build failures.
- Regenerated 0001-ext-re-rename-additional-static-regex-symbols.patch
  with proper commit body and Upstream trailer.

Shubham Chakraborty (1):
  package/perl: fix build with musl and static linking

 package/perl/0001-ext-re-rename-additional-static-regex-symbols.patch | 41 +++++++++++++++++++
 package/perl/perl.mk                                                  | 10 ++++-
 2 files changed, 50 insertions(+), 1 deletion(-)
 create mode 100644 package/perl/0001-ext-re-rename-additional-static-regex-symbols.patch

-- 
2.54.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
