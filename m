Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7035CC982D2
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 07:22:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E23B980EF0;
	Fri, 18 Sep 2026 07:22:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XBskLayJ5eVR; Fri, 18 Sep 2026 07:22:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org EF95880E4B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789716175;
	b=DYuf1/AG9y1V+sdKWzVdH01FCYCRbm1gfb2XkkSfxLc1HG3Pl/J2zKWzL2zcfES3zP09
	 AG6nsdbkpf6Nqo06eFk17Hf3+4ADcjDjK360aZD37Rb/Zn8dCd64wocjQfNYBdHk1u+Me
	 1Tca1x6JbsQw2dUZd/EeZS5QM8rPmORdgGKmIt5Dvaqj9aWakMoDP6FDQh0dh4dortDP2
	 gV5TByJRo473mF5jgYBAIK8qm675Kq6LWZG4g4gX3Nsdmh+neHG8aVQEP+RAp1f0ib0+X
	 M2bpLEo5zq6utoIqd3T+L38eOU7j7weBe/BCgqf0In+VcHSnmQZ5M9a7ZtCt5ceHCLg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789716175;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:X-Google-Original-From:To:Cc:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=pR5uCgkYnYlHC15DUMwxU2BEqnurbCJD1Dltdk29Z6U=;
	b=pGIxWYz7x6AEI0NqSy1IdphOkFXjy0I4zo2vXtHYYHOyY+6Qs3PRRB+BlcXV6544DiC2
	 Mzajanou9D1qKx78o+OC+Wxvaj7RG97bZuf8V6IW76RUPPZNnwJ/aczXUovcBmPASL33+
	 5XfkpIRk0Q3HEhqBCR8LekdJcgYMc07ugWAZOocc3YpGItG05hVFFcZjbgk+icRRieGAK
	 oxcxvcUzR8u9W+BV5UJEHXkjVPXDoRUtxsc3YzRIjdPerzh0dPivug3wPcELimZbU3EeF
	 8XOHk+XOjHqdxyvT+lHmyFqOwKI3xOXkTWbhHVVsDJFbHELynuXmhoeuggPGgvIkvFg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789716175;
	bh=pR5uCgkYnYlHC15DUMwxU2BEqnurbCJD1Dltdk29Z6U=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oPw9aPqJ4t4s/cWEMPopI4OymsddhcxhvGEHH6nufhK5LmQCw1gIbwuQgFPMgsUji
	 7og2UTBaZQibcm3JLph4E8imjsNDh3k7uyC6WxDsw1uTnLFXlrcGhSApelJUKVeoR6
	 t2xlcg6So4YXayY5CqFIe8JE0ZQCwHCtYsUZvEozCJQEGjDFOqYpZiQk2WWXDe2eOA
	 IcG8pbZb+1j6RaQUAzyfaZqmPda517x1joSFkrsYP0ojdzPRCsFMTqfaCJ69U82VPa
	 HtUpCS1ih8lG6IloJR5+kBg4gFMQkNWIXVyQj0eUvVgEOlVCkhAw/FDX9LXZdUQ7oP
	 4PgarvYnNyLyg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF95880E4B;
	Fri, 18 Sep 2026 07:22:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E1A2362
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 07:22:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 33E8360BC6
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 07:22:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nHyKJ-ToUn5k for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 07:22:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D88D560BC4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789716172;
 b=JJLyF4wiFIorrI2VeWbmaUbPKItyLfvPGLN5iYFUOfj394bT48rGt6oqpng8SEd9/fHN
 11nr0vX74qeiEfHsg3C3GBI4m5aDuPpL3CM+edQmVWW/TSFLDyRE0FcbXqD8qI7u+ie7B
 yT35fEOi4kbMgfzuxmqbrur/FKrezQpbuHk8eHZwTnwX7ykHGZgowu+EWVbbQ4Z19T+UY
 mRy6MTIVVGqjav2kKkLcRJrzZ5oP58sO0prUPzibnug03rxtancNWi9le/uPLoMzypvGD
 zzH8fKrjawmkznRuiYhW+svswx6XV1U6a5Z88tFoWrJ6GMJtCO/xP81nPKJMQsGsiNA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789716172;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
 bh=7o/N3J99umoRSlew2e9Trl49NbR+81QQklkoWtYW7/o=;
 b=Na8CJqfFy66HhGZSYWH3VyZSM0ZpEWtV/jFwfbyiei1OLNJMvyVfZBelCO0jVAdvlydU
 bShCecd9wVTm4ebXQtxQYVQIOlB9cKC6hfFCyvMQ9TfaZYCQg0jYhT4r9Vl+XavYlxJ2H
 uuTIb+WG2V2IdOFP5MmN+FGyJI0wuOOei9b1B1IUdyaFp1Rzwcv6YZZzyegYXuXwtTfTH
 45adqbsLONUm1TVrCs49P8u5AiX28M+6piI/mJI1vL7dPr09aUdQyJQVgFNv2xH1X0qsj
 /iVEgdQzDrUDe+807ziYtg+2/hmZaijTKFPhB3ZOpLOOWhMsPprCIBkQwSgLs1Nf7CQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=googlemail.com; 
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=nvlVkUZH; 
 arc=none smtp.remote-ip="2a00:1450:4864:34::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:34::10; helo=mail-ej2-x10.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej2-x10.google.com (mail-ej2-x10.google.com
 [IPv6:2a00:1450:4864:34::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D88D560BC4
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 07:22:51 +0000 (UTC)
Received: by mail-ej2-x10.google.com with SMTP id
 a640c23a62f3a-c254fa4c24cso61267566b.2
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 00:22:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789716169; x=1790320969;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=7o/N3J99umoRSlew2e9Trl49NbR+81QQklkoWtYW7/o=;
 b=zgXI9BpgFnOeyLNnpWKr/7lmB56NAPQ4MIloF88scnSow5AYMPTvw1IAhRF9N9OiP8
 KQt4iBhGxv6RebZ34JtT1fQi51ESQSxVwGNtQWYtz/SFT82sR9J25WrKwjr9Txj9BWIc
 bYb+7t89chiY5pwS0So7YMHQDXQwfL0OX43qTsaim4iulPGKs5vMogOKML9X8thgU2Bu
 3z6o5+4OIS1huIErsAVlhb65rCHVEMiEt22SdcAmv2A8IdTTXTfo3nU4G7k6xNMmp1tg
 OQuVPyxiwP1DtTTMIz1il8Pqb0AlOy5QKpUC5meVjkGIgOfWdwl2uLpLMdTvHPbSMDRc
 X8dA==
X-Gm-Message-State: AFuF++m1EZUoKi+K2iUKr2ImwaeRr68UytxPsZh++pmSflbZp/Rqt6ga
 hncXJOMZuxPW3Al5ys952I4gvB24h5nwLnPcw4YYPSZ+k5t0SyvV2wlwVsEezA==
X-Gm-Gg: AYBFou3l+tGLWgrW4DzVU9sLiGW0wpJAZB7cpd0cHtMY5ZOMtiDCDXThdfxr9UTkMS+
 DA3UeYckI6uaQBPgi7AdAlOOaUBES12N1rFJbBK19hWv4Ue+4PNyW3+2sd5TqxT4QdYtQa7dhBU
 6lz8uhRDt23DDYG07eWdhuxxBpKTyN7A+LD7saTAN9dLA0t60JPH8BbrqifBA0E1d0OPBtQtUVs
 xSgZEQ639hJyFzsxYwH1hthojgcCZ/q/A/SMMGNe20aFCl6uUOP5cIumWuF+mryETXm8TXcw7pE
 s+BljzyLiwx6K6b/OQc4D0BsMFcpVoaOZ4V2w/6w4B08s8GHZT2DUBa0D190m7y9QQjmq9+DvL4
 IQ5rwRvwOaUqfC9VuOdjWV562TKJrz2M6Tz6w5oWe9/ddBTxh27/Ls0MxXzRm7ebRVbPoOX/kZi
 VkBmV78Q49pnAwr1+uZCUkMPkOBZaTTz6extrzvy29OM7NWHWoShjNx2u//Ub2XK4WiPaKPjgzn
 3hcS/IMZ0e+2dy6OFakLpQUNJfzlpoZfJD7iYJS2ax7e+gk
X-Received: by 2002:a17:906:9f8b:b0:c29:d96a:2ea4 with SMTP id
 a640c23a62f3a-c2a15cdd07amr153116166b.26.1789716169099; 
 Fri, 18 Sep 2026 00:22:49 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2a1bbc6830sm27234166b.52.2026.09.18.00.22.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2026 00:22:48 -0700 (PDT)
X-Google-Original-From: Yegor Yefremov <yegorslists@gmail.com>
To: buildroot@buildroot.org
Cc: thomas.petazzoni@bootlin.com
Date: Fri, 18 Sep 2026 09:22:48 +0200
Message-Id: <20260918072248.1496007-1-yegorslists@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260820120253.901607-1-yegorslists@googlemail.com>
References: <20260820120253.901607-1-yegorslists@googlemail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/cannelloni: security bump to version
 2.1.2
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

For change log, see:

https://github.com/mguentner/cannelloni/releases/tag/v2.0.1
https://github.com/mguentner/cannelloni/releases/tag/v2.1.0
https://github.com/mguentner/cannelloni/releases/tag/v2.1.1
https://github.com/mguentner/cannelloni/releases/tag/v2.1.2

2.1.2 fixes CVE-2026-37539 (CVSS 3.1 score 9.8, CWE-121): a stack based
buffer overflow in CAN frame parsing, in parseCANFrame() in parser.cpp
and decodeFrame() in decoder.cpp, allowing remote attackers to cause a
denial of service (crash) or possibly execute arbitrary code via
crafted CAN FD frames.

The advisory names v2.0.0 explicitly, so the version used so far is
affected. The CVE is not reported by
https://security.buildroot.org/master/component/cannelloni because its
NVD entry has no CPE data (vendor and product are both "n/a") and can
therefore not be matched against the package version.

Apart from the security fix, 2.0.0..2.1.2 contains only a handful of
changes: undeliverable frames are dropped after a timeout on a broken
CAN bus, variable length arrays are gone, the default remote address is
fixed, and pthreads are looked up with the CMake module instead of by
hand. 2.1.1 is a maintenance release only, as the 2.1.0 tag pointed to
a commit that was not the final one.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5
---

Changes v1 -> v2 (suggested by Thomas Petazzoni):
- Retitle as a security bump, as 2.1.2 fixes CVE-2026-37539
- Describe the CVE, confirm that the 2.0.0 we had is affected, explain
  why security.buildroot.org does not report it, and summarize the
  remaining 2.0.0..2.1.2 changes
- Link the change logs of all releases in 2.0.0..2.1.2, not just 2.1.2

 package/cannelloni/cannelloni.hash | 2 +-
 package/cannelloni/cannelloni.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cannelloni/cannelloni.hash b/package/cannelloni/cannelloni.hash
index 625e43d157..6b45d497e4 100644
--- a/package/cannelloni/cannelloni.hash
+++ b/package/cannelloni/cannelloni.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  3dde63727549d4a39154e78b95f4a5dad96af236ca6cef531f347c0b923c74d5  cannelloni-2.0.0.tar.gz
+sha256  c704707f7dd9f1ed64e9195097809f8882c03b1fa0a79864b8e3bf286521e3d7  cannelloni-2.1.2.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  gpl-2.0.txt
diff --git a/package/cannelloni/cannelloni.mk b/package/cannelloni/cannelloni.mk
index 7978cfccf5..2e6a61545e 100644
--- a/package/cannelloni/cannelloni.mk
+++ b/package/cannelloni/cannelloni.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CANNELLONI_VERSION = 2.0.0
+CANNELLONI_VERSION = 2.1.2
 CANNELLONI_SITE = $(call github,mguentner,cannelloni,v$(CANNELLONI_VERSION))
 CANNELLONI_LICENSE = GPL-2.0
 CANNELLONI_LICENSE_FILES = gpl-2.0.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
