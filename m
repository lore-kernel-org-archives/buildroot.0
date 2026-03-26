Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07239106F2F3
	for <buildroot@archiver.kernel.org>; Thu, 26 Mar 2026 08:14:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C566F60A43;
	Thu, 26 Mar 2026 08:14:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2OO6odxcDkEP; Thu, 26 Mar 2026 08:14:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D66B860A58
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774512890;
	bh=rdgf0PK7eBlbFugaCv/5+iuOT1sstvWl75wF5UyrZLs=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=jbecDFA7mjZQjFzAYWpzn4KY9IOnwg6dpJqZiTvfFfm4DdBniRlNDlgRBj1eiwVGM
	 pFoTpuG3g+JFnv2T6u3QMladOIDiKaKAJGxkfSfniOU5fmxYznOvkf5ecf6c7e9wmP
	 Xk7MnqWUlV0KKKSVm/PaIsRV9KloCtyzjGlXW2GhPKvuQ2EHeNIsLleCIBZWbsq6+a
	 luA7Fp5qd7KyWVCq/2RNDYMLG7iuKVfsi1Hnz1jXHm0LYMZ6P5atGlWXrqGAVyzYob
	 GcNoBEEh2tBtO/fiXDhyAAFVNRk6nQNWA0YSGhNEOXa8CH3ypaCMVhBn8TG879K0g0
	 xaYZ4Y9fJVQEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D66B860A58;
	Thu, 26 Mar 2026 08:14:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4BA86F5
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 08:14:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3DF0B40990
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 08:14:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TioWm8mMaybp for <buildroot@buildroot.org>;
 Thu, 26 Mar 2026 08:14:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2DC5540969
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DC5540969
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2DC5540969
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 08:14:46 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b79f8f7ea43so129441466b.2
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 01:14:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774512885; x=1775117685;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=p0imTyOiaR2D+T0jbNOxxRCRJ20RGrp8kTuvYuZFQs4=;
 b=srpVxDmrzR5pReCT5X538xdwVnw/CL8kPV5r4fd56GhvGuO8FwbyAXQotUa47BIPEv
 8ZgSeTkguA2s6ducKeurWMu+TobaIZ4ODsMTZM3BqooPTU9hnWr9WtZ97bUbRkBjIizz
 svVuqHBQlCCcdFylUN+wulhGCe7Wsa38LZIibrDn1826kewJdHAQnHl15ArSJRHTKP8H
 uMqclWonJ4DXYzj7/O/JdqZIxzeWB5uyCGGQNUFXAmXCkhxV9DUQjWzYzKGSQ/sUFSWX
 lDzUWaHBzRcWlwpT5gKal/WVAopbWEz8jP4SZYzN1SEpXBxTgR9tqid5AhMshXxJhdTf
 RzZw==
X-Gm-Message-State: AOJu0Yz7CcgLctwf2lGcpYXMNYBnEz/lAin5lG5NiiuHWk82Zc2O0FPh
 Lu3gTzz35y2ZcXVdR4fYIaJA7+rRqouB5I0A6wSsX7wNEubbM+8U+3DMUFGi5k7Hf9mBgS1bGgQ
 0t9KdZp0=
X-Gm-Gg: ATEYQzwU8pcy2uj6ZXcS2NXFw9M1r5W0PqZ9yyAgzP7sLeXNSMRVxdcSvyTl4a0nMUO
 RPsbPL8y9Bw8NplbqIQK5EehwjRQ1EPugUsymnO+Il78UkWw/9mhB/2PgLT/chBgETYSkRx8dTg
 Pfre96k5qEfbIpt1IKOtFTpkAeQ8MQE8xvIbLhPo6baZ6D6u1MqSpdp3690asTzm01suOcBjlel
 a99I/38UUIFssxgegGqL2hwrv7fGhdWvcEK+Uni0p7KUUGfTcB1aw/LuN/W3ptOKy77u3hGsE+0
 YTjqbSNL2KhKbOsJEVB9sdEv2Le4euj/lIdPPUBGgEkXbC3RbWIXZShAX6of8gwIg7J2i6NlneB
 9tmsVF/Gq8o9G0uUTwaI1Uny7DbUYFnn6/lIj7bMM+tnFFiCahi+4K1dWRtxGofl4zm5cPEJnDO
 bD43cSIISam4Ut7NjRYDn6C1OT06oCj06v
X-Received: by 2002:a17:907:7b9c:b0:b98:47a3:b41 with SMTP id
 a640c23a62f3a-b9a5420da89mr524600266b.29.1774512884767; 
 Thu, 26 Mar 2026 01:14:44 -0700 (PDT)
Received: from dragon.home ([109.136.97.112]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9b2043e7cesm83315866b.57.2026.03.26.01.14.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2026 01:14:44 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 26 Mar 2026 09:14:22 +0100
Message-ID: <20260326081422.945900-3-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326081422.945900-1-titouan.christophe@mind.be>
References: <20260326081422.945900-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1774512885; x=1775117685; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p0imTyOiaR2D+T0jbNOxxRCRJ20RGrp8kTuvYuZFQs4=;
 b=N76+W0abOL33yG+3jQa+5FvYKcERdSyrc627/FA5zt8hABVblkE7Iy6zD4p6YZWL+w
 mPaWJTyZT1uR0lXaMeC4broawQxCP2dg1BHoDzfAPz5Vld3GdCgZ5vTdN2xpZuhAI3/+
 WPB41KyOBNTsqD+opTERjGon24eNH+S5KHq4Q+8uUrQCV1Gc0Pp7Ttmr1HkB4YLTjAMw
 ZO4oOyoRYnyu/ftBvX2CU31zRqf4LW8ed/9YT4cddnL3AKXzJN4akVCc0dDdkI6MwBKC
 48j4fa6mo2DG8YPqOPwnHMBSfhjPC/wkrys/aiUFup/+Oc4yEYodlFE1hS+e4PbLUe3g
 uBZA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=N76+W0ab
Subject: [Buildroot] [PATCH v2 2/2] SECURITY.md: add new file
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Thomas Perale <thomas.perale@mind.be>,
 Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is an in-tree description of Buildroot's security policies

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
Changes v1->v2:
- Add references to the Buildroot User Manual for vulnerability tracking
- Add links to autobuilder pkg-stats and Buildroot security website
- Link to CPE info for Buildroot
- Explicitely say that security@buildroot.org is a private ML
---
 SECURITY.md | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 SECURITY.md

diff --git a/SECURITY.md b/SECURITY.md
new file mode 100644
index 0000000000..6b21ffd2b9
--- /dev/null
+++ b/SECURITY.md
@@ -0,0 +1,36 @@
+# Security Policy
+
+## Security advisories
+
+Advisories for Buildroot security vulnerabilities are reported on the
+developer's mailing list. A public archive can be consulted on
+https://lists.buildroot.org/mailman/listinfo/buildroot
+
+Buildroot itself has a CPE to track its published vulnerabilities:
+https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=buildroot
+
+The Buildroot project provides some ways for its users to track known
+vulnerabilites in the packages included in the generated images, see:
+- https://nightly.buildroot.org/manual.html#_details_about_packages
+
+In addition, detailed informations for all packages integrated with Buildroot
+are updated daily on the following public web pages:
+- https://security.buildroot.org/
+- https://autobuild.buildroot.org/stats/
+
+## Reporting a Vulnerability
+
+To report a security vulnerability found in the Buildroot build system itself,
+please send an email to [security@buildroot.org](mailto:security@buildroot.org).
+
+This is a private mailing list contacting the Buildroot maintainers only.
+
+## Vulnerabilities in packages
+
+Buildroot is a build system that cross-compiles packages from third-party
+sources. The Buildroot developers are not responsible for security
+vulnerabilities in these packages. Such vulnerabilities should be reported
+directly to the upstream project that maintains the affected package.
+
+When vulnerabilities are fixed upstream, send a patch to update the affected
+packages in Buildroot.
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
