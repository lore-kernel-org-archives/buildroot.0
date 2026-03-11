Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 208431125838
	for <buildroot@archiver.kernel.org>; Wed, 11 Mar 2026 14:05:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDD3A42318;
	Wed, 11 Mar 2026 14:05:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SIO4pIxw3CTd; Wed, 11 Mar 2026 14:05:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E36942311
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773237914;
	bh=9N591E2JctCUAVXScSGi+W1A81jC1EEYFqEjmaqTgZ4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Uf8cU73ztRpm08qN3jZRZo8xstcDbpIL7n4jZQ2BiLXzjK+rsdq+jAJk+nDoFGCf1
	 Mg6EQ2jOS69LMOH5sPQIl0GAlpCrmcmMDABhIeb9JHuTgtYkU8w2hX/bKa+WID5MQz
	 NDAzFGOWA7IDAnsS3wWBnpMwozGKrdvesWbzcdhQvmaOyu/xKMCzX2+ygVYYjSwDUl
	 lGHlwM3w3JS5/6GSIEakw5cx6kyHWiCa+i/aT16fJbfYeq+irREbtx3Aba81e9snxM
	 k4DTwv26dzdC5qq2ggjAmi5TNEQ8aUYKX4o60tvHQh4861LneZI22hAU5yON1ndQ8+
	 Hi1BCr23d8rOQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E36942311;
	Wed, 11 Mar 2026 14:05:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 23BDB33A
 for <buildroot@buildroot.org>; Wed, 11 Mar 2026 14:05:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0812884572
 for <buildroot@buildroot.org>; Wed, 11 Mar 2026 14:05:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xSEHRmT_1XBT for <buildroot@buildroot.org>;
 Wed, 11 Mar 2026 14:05:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0395884570
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0395884570
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0395884570
 for <buildroot@buildroot.org>; Wed, 11 Mar 2026 14:05:05 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-439c4bde55cso5743267f8f.1
 for <buildroot@buildroot.org>; Wed, 11 Mar 2026 07:05:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773237904; x=1773842704;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vouraCoochXNcZCZgZPrB1MtarzEJdOeWSWOYVR15VM=;
 b=r4gAOjBSBw05cXgkxWE/NVrv8iF3TPeCCRCP7EDE6HAZTuaK0zExWJdyHT5KY0hdi5
 EbykUENv0O2St3O0+CmUTgwAyDvC+1W9JMUgtjodJqhK1wt+2SwZf5SMWRnvqAGuCTrO
 SQ/Fw4HfCMULHdzqc0DPCgY2wsgCSUXvUU1oynjAFS5ZQOI5RltDhHuHPj+r5w13xVw8
 HHInaBAWpSQt1j9w4kaos67Nl+sTt1ANarCGWveFxWh36Yet7Qy/HOPDPqwVXSnnntLo
 E/YNz2JpxYM0qQNl3Gkft5PVXFvWLkdGOBEXkn32R0+yFB9ICOjEB28OW+pN2QQZNGBN
 W64g==
X-Gm-Message-State: AOJu0YwzZvN7fXusg+q9XxbI6PahsIMEsHe1/0mph0gmws1C3WQljudm
 3tEmCpCJ26jgz8vbR/l2rvwW6wOY54oT9Rt99+O9xiVLdYRer8RbsWmlKbXfoQdsMWqcLkhODg1
 VhiS1
X-Gm-Gg: ATEYQzwfWRbsrN4okrq8QlBhi0Lq/7t5x60GLvHAcSzInwaEr0Ygakatv8gF6RGw0Ca
 RPVGHJ91cIDlxhhdQZjkfXGM2K4GZGWSybTJMK1b/GP/AbldWDh3lAJlmzv/NDBZSauUSnvwgkD
 CSt1QnLjqBlp96wyLMrInaSNPIsFTgqsp9HQTnDr6ll4GbF7nH3TwvUzDJuhMXya5N5ADYDe0KI
 PzHgYTT35Bl+hh/iI5DMG1/f3l8FmpxZqB41vkfpCmcwVsDhvPnWNxsrtVIo+kLUM752XUHzLC2
 j9HvGrDEKJcppJaAHIo6ZpZgZoJWEP7lljR9w4EX/vOiDWrn9DecXQa73XhCwFUuMOV7+I1z0ee
 F6Uy0/l5LF+XDO1bCxWtaTk3+Qzrv7cpkohrF5ZBmSX9o23khcFpYhEf8JiRdyurczxsjhFsEC6
 zX245chdKHVfauJu400r5b0j2AnA==
X-Received: by 2002:a05:6000:2884:b0:439:c628:2228 with SMTP id
 ffacd0b85a97d-439f843125amr5204441f8f.31.1773237903551; 
 Wed, 11 Mar 2026 07:05:03 -0700 (PDT)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439f81f19dbsm7657610f8f.22.2026.03.11.07.05.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2026 07:05:02 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Wed, 11 Mar 2026 15:04:55 +0100
Message-ID: <20260311140457.140041-7-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260311140457.140041-1-thomas.perale@mind.be>
References: <20260311140457.140041-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1773237904; x=1773842704; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vouraCoochXNcZCZgZPrB1MtarzEJdOeWSWOYVR15VM=;
 b=LbVQo0n4NB4xu0o+bQtdD2YlVqbOgJyVmdub7qkWHlGoQ+IVK22A2kh+S8evsx/84U
 7aVwuUhNSSyChqibWdos52JBkLvsI+HVXQ/atFa+JIl4KresO3bnpFhhgd2U4pXt05Xe
 VzE+UBxi3cUzeRR/v5J1Iv1tuS0IjIecAXrZSFJLSVDG+mFDAn5FYZn1JwUzQsXFE6FA
 kMo1rMO35mx6rnTeKa/XPPY1COb/jrZTa0BJ41XvCMIrxu140fTpjwHnvY72uX8leBxi
 I1YRzm0mIcZh93v0XU4qYFAXSMaat/hNSV6akVL5csCBTMZspMh9mO/2+TE7oiUgk3TE
 8nPg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=LbVQo0n4
Subject: [Buildroot] [PATCH v5 6/8] utils/generate-cyclonedx: mark host
 packages as external
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

Mark Buildroot's host packages as 'external' with the 'isExternal'
property. Starting CycloneDX v1.7 [1][2] the CycloneDX spec defines this
property like the following [3].

> An external component is one that is not part of an assembly, but is
> expected to be provided by the environment, regardless of the
> component's .scope. This setting can be useful for distinguishing which
> components are bundled with the product and which can be relied upon to
> be present in the deployment environment.

This fits the usage of 'host' packages : a package provided by the
environment and not bundled with the target.

[1] https://github.com/CycloneDX/specification/releases/tag/1.7
[2] https://cyclonedx.org/docs/1.7/json/#components_items_isExternal
[3] https://github.com/CycloneDX/specification/issues/321

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 utils/generate-cyclonedx | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index cbce3364de..35d8c72057 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -373,6 +373,9 @@ class CycloneDX:
         return {
             "bom-ref": name,
             "type": "library",
+            **({
+                "isExternal": True
+            } if self.options.cyclonedx_version >= (1, 7) and comp["type"] == "host" else {}),
             **({
                 "name": comp["name"],
             } if "name" in comp else {}),
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
